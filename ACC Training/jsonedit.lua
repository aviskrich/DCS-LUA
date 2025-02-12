local MAP_UTILS = {
    patterns = {"#Archer", "#Crusader", "#Row", "#Ground", "#1_1", "#1_2", "#1_3", "#2_1", "#2_2", "#2_3", "#3_1", "#3_2"}
}

-- Вспомогательная функция для обработки имени (добавление префикса или замена по шаблону)
local function processName(oldName, findRegExp, replace)
    if findRegExp == "^" then
        return replace .. oldName
    end
    return string.gsub(oldName, findRegExp, replace)
end

-- Функция добавления префикса к группам и юнитам
function MAP_UTILS.addGroupAndUnitPrefix(missionTable, sides, findRegExp, replace)
    if #sides == 0 then return end

    local function renameSide(side)
        local sideData = missionTable.coalition[side]
        if sideData and sideData.country then
            for _, country in ipairs(sideData.country) do
                if country.plane and country.plane.group then
                    for _, group in ipairs(country.plane.group) do
                        group.name = processName(group.name, findRegExp, replace)
                        for _, unit in ipairs(group.units or {}) do
                            unit.name = processName(unit.name, findRegExp, replace)
                        end
                    end
                end
            end
        end
    end

    if #sides == 1 and sides[1] ~= "all" then
        renameSide(sides[1])
    else
        renameSide("red")
        renameSide("blue")
    end
end

-- Рекурсивный поиск всех Link16
function MAP_UTILS.findAllLink16Entries(tbl, result)
    result = result or {}
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            if key == "Link16" then
                table.insert(result, value)
            else
                MAP_UTILS.findAllLink16Entries(value, result)
            end
        end
    end
    return result
end

-- Функция получения тэга смешанной группы
function MAP_UTILS.getMixedGroupName(groupName)
    for _, tag in ipairs(MAP_UTILS.patterns) do
        if string.find(groupName, tag) then
            return tag
        end
    end
    return nil
end

-- Функция сериализации таблицы
function MAP_UTILS.serializeTable(val, name, indent)
    local function basicSerialize(o)
        if type(o) == "number" or type(o) == "boolean" then
            return tostring(o)
        elseif type(o) == "string" then
            return string.format("%q", o)
        else
            return "nil"
        end
    end

    indent = indent or ""
    local indent2 = indent .. "    "
    local result = {}

    if name then
        table.insert(result, indent .. name .. " = ")
    end

    if type(val) == "table" then
        table.insert(result, "{\n")
        for k, v in pairs(val) do
            local key
            if type(k) == "number" then
                key = "[" .. k .. "]"
            elseif type(k) == "string" and k:match("^[%a_][%w_]*$") then
                key = k
            else
                key = "[" .. basicSerialize(k) .. "]"
            end
            table.insert(result, MAP_UTILS.serializeTable(v, key, indent2) .. ",\n")
        end
        table.insert(result, indent .. "}")
    else
        table.insert(result, basicSerialize(val))
    end

    return table.concat(result)
end

-- Функция формирования даталинков для юнита в смешанной группе
function MAP_UTILS.buildDataLinksForUnitInMixed(unit, mixedUnits)
    local config = {
        ["F-16C_50"] = {maxTeam = 8, priority = "F-16C_50", secondary = "FA-18C_hornet"},
        ["FA-18C_hornet"] = {maxTeam = 4, priority = "FA-18C_hornet", secondary = "F-16C_50"}
    }
    local conf = config[unit.type]
    if not conf then return end

    local priorityUnits, secondaryUnits = {}, {}
    for _, gu in ipairs(mixedUnits) do
        if gu.type == conf.priority then
            table.insert(priorityUnits, gu)
        elseif gu.type == conf.secondary then
            table.insert(secondaryUnits, gu)
        end
    end

    local teamMembersUnits = {}
    for _, pu in ipairs(priorityUnits) do
        table.insert(teamMembersUnits, pu)
    end
    if #teamMembersUnits < conf.maxTeam then
        for _, su in ipairs(secondaryUnits) do
            table.insert(teamMembersUnits, su)
            if #teamMembersUnits == conf.maxTeam then break end
        end
    end

    local used = {}
    for _, tm in ipairs(teamMembersUnits) do used[tm.unitId] = true end

    local donorsUnits = {}
    for _, gu in ipairs(mixedUnits) do
        if not used[gu.unitId] then
            table.insert(donorsUnits, gu)
        end
    end

    unit.datalinks = unit.datalinks or {}
    unit.datalinks.Link16 = {
        network = {teamMembers = {}, donors = {}},
        settings = {
            AIC_Channel = 1,
            FF2_Channel = 3,
            transmitPower = 0,
            FF1_Channel = 2,
            VOCA_Channel = 4,
            VOCB_Channel = 5,
        }
    }

    for _, tm in ipairs(teamMembersUnits) do
        local entry = {missionUnitId = tm.unitId}
        if unit.type == "F-16C_50" then
            entry.TDOA = true
        end
        table.insert(unit.datalinks.Link16.network.teamMembers, entry)
    end

    for _, d in ipairs(donorsUnits) do
        table.insert(unit.datalinks.Link16.network.donors, {missionUnitId = d.unitId})
    end
end

local function printGroupNames(label)
    print(label .. ":")
    for _, sideName in ipairs({"blue", "red"}) do
        local side = mission.coalition[sideName]
        if side and side.country then
            for _, country in ipairs(side.country) do
                if country.plane and country.plane.group then
                    for _, group in ipairs(country.plane.group) do
                        print(group.name)
                    end
                end
            end
        end
    end
end

-- Получаем директорию скрипта и загружаем миссию
local script_dir = debug.getinfo(1).source:match("@?(.*[/\\])") or "./"
dofile(script_dir .. "mission")
if not mission then error("mission not found in " .. script_dir .. "mission") end


-- Вывод имен групп до преобразования
printGroupNames("Before transformation")

-- Преобразование имен групп и юнитов
MAP_UTILS.addGroupAndUnitPrefix(mission, {"all"}, "^", "#")

-- Вывод имен групп после преобразования
printGroupNames("After transformation")

-- Разбираем группы по сторонам
local mixedGroups = {blue = {}, red = {}}
local normalGroups = {}

local function processGroups(sideName, container)
    local countries = mission.coalition[sideName] and mission.coalition[sideName].country or {}
    for _, country in ipairs(countries) do
        if country.plane and country.plane.group then
            for _, group in ipairs(country.plane.group) do
                local tag = MAP_UTILS.getMixedGroupName(group.name or "")
                local units = group.units or {}
                if tag then
                    container[tag] = container[tag] or {}
                    for _, unit in ipairs(units) do
                        table.insert(container[tag], unit)
                    end
                else
                    table.insert(normalGroups, {group = group, units = units})
                end
            end
        end
    end
end

processGroups("blue", mixedGroups.blue)
processGroups("red", mixedGroups.red)

MAP_UTILS.addGroupAndUnitPrefix(mission, {"all"}, "^", "#")

local function sortUnitsById(units)
    table.sort(units, function(a, b) return (a.unitId or 999999) < (b.unitId or 999999) end)
end

for _, groupUnits in pairs(mixedGroups.blue) do sortUnitsById(groupUnits) end
for _, groupUnits in pairs(mixedGroups.red) do sortUnitsById(groupUnits) end

for _, mUnits in pairs(mixedGroups.blue) do
    for _, unit in ipairs(mUnits) do
        MAP_UTILS.buildDataLinksForUnitInMixed(unit, mUnits)
    end
end

for _, mUnits in pairs(mixedGroups.red) do
    for _, unit in ipairs(mUnits) do
        MAP_UTILS.buildDataLinksForUnitInMixed(unit, mUnits)
    end
end

local version = 1
local outFileName = script_dir .. "mission_out_v" .. version .. ".lua"
local f_check = io.open(outFileName, "r")
while f_check do
    f_check:close()
    version = version + 1
    outFileName = script_dir .. "mission_out_v" .. version .. ".lua"
    f_check = io.open(outFileName, "r")
end

local file = io.open(outFileName, "w")
if file then
    file:write("mission = " .. MAP_UTILS.serializeTable(mission, nil, "") .. "\nreturn mission\n")
    file:close()
    print("Mission saved to " .. outFileName)
else
    print("Error: Cannot open file for writing: " .. outFileName)
end
