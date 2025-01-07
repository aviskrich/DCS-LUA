-- Function to recursively search for all Link16 entries
function findAllLink16Entries(tbl, result)
    result = result or {}
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            if key == "Link16" then
                table.insert(result, value)
            else
                findAllLink16Entries(value, result)
            end
        end
    end
    return result
end

-- Определяем директорию этого скрипта.
local script_dir = debug.getinfo(1).source:match("@?(.*[/\\])")
if not script_dir or script_dir == "" then
    script_dir = "./"
end
dofile(script_dir.."mission")
if not mission then
    error("mission not found in " .. script_dir .. "mission")
end

-- Функция сериализации таблицы
local function serializeTable(val, name, indent)
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
        for k,v in pairs(val) do
            local key
            if type(k) == "number" then
                key = "["..k.."]"
            elseif type(k) == "string" and k:match("^[%a_][%w_]*$") then
                key = k
            else
                key = "["..basicSerialize(k).."]"
            end
            table.insert(result, serializeTable(v, key, indent2) .. ",\n")
        end
        table.insert(result, indent .. "}")
    else
        table.insert(result, basicSerialize(val))
    end

    return table.concat(result)
end

-- Функция получения юнитов из группы
local function getAllUnitsInGroup(group)
    local units = {}
    for _, u in ipairs(group.units or {}) do
        table.insert(units, u)
    end
    return units
end

-- Предположим, что смешанные группы определяются по хэштегам в имени, как раньше
local function getMixedGroupName(groupName)
    local patterns = {"#Archer", "#Crusader", "#Row", '#Ground'}
    for _, p in ipairs(patterns) do
        if string.find(groupName, p) then
            return p
        end
    end
    return nil
end

-- Разделим смешанные группы по сторонам
local mixedGroupsBlue = {}  -- ключ - имя смешанной группы (#Archer, #Crusader, #Row), значение - список юнитов
local mixedGroupsRed = {}
local normalGroups = {}

local function isBlueGroup(groupName)
    -- Предполагаем, что первая буква 'B' для blue, 'R' для red
    -- Проверим первую букву имени группы
    local firstChar = groupName:sub(1,1)
    if firstChar == "B" then
        return true
    elseif firstChar == "R" then
        return false
    end
    -- Если неизвестно, допустим blue по умолчанию
    return true
end

-- Разбор стран и групп в миссии
local allCoalitions = {
    {"blue", mixedGroupsBlue},
    {"red", mixedGroupsRed}
}

for _, sideData in ipairs(allCoalitions) do
    local sideName = sideData[1] -- "blue" или "red"
    local container = sideData[2] -- ссылка на mixedGroupsBlue или mixedGroupsRed
    local coalCountries = mission.coalition[sideName] and mission.coalition[sideName].country or {}
    
    for _, country in ipairs(coalCountries) do
        if country.plane and country.plane.group then
            for _, group in ipairs(country.plane.group) do
                local mName = getMixedGroupName(group.name or "")
                local units = getAllUnitsInGroup(group)
                if mName then
                    container[mName] = container[mName] or {}
                    for _, u in ipairs(units) do
                        table.insert(container[mName], u)
                    end
                else
                    -- Нормальные группы, если надо обрабатывать
                    table.insert(normalGroups, {group=group, units=units})
                end
            end
        end
    end
end

-- Сортируем смешанные группы по unitId
local function sortUnitsById(units)
    table.sort(units, function(a,b) return (a.unitId or 999999) < (b.unitId or 999999) end)
end

for _, mg in pairs(mixedGroupsBlue) do
    sortUnitsById(mg)
end

for _, mg in pairs(mixedGroupsRed) do
    sortUnitsById(mg)
end

-- Функция формирования teamMembers и donors для юнита в смешанной группе
local function buildDataLinksForUnitInMixed(unit, mixedUnits)
    local unitType = unit.type
    local maxTeam = 0
    local priorityType = nil
    local secondaryType = nil

    if unitType == "F-16C_50" then
        maxTeam = 8
        priorityType = "F-16C_50"
        secondaryType = "FA-18C_hornet"
    elseif unitType == "FA-18C_hornet" then
        maxTeam = 4
        priorityType = "FA-18C_hornet"
        secondaryType = "F-16C_50"
    else
        return
    end

    local priorityUnits = {}
    local secondaryUnits = {}
    for _, gu in ipairs(mixedUnits) do
        if gu.type == priorityType then
            table.insert(priorityUnits, gu)
        elseif gu.type == secondaryType then
            table.insert(secondaryUnits, gu)
        end
    end

    local teamMembersUnits = {}
    -- Сначала приоритетный тип
    for _, pu in ipairs(priorityUnits) do
        table.insert(teamMembersUnits, pu)
    end
    -- Если не набрали maxTeam, добавляем secondary
    if #teamMembersUnits < maxTeam then
        for _, su in ipairs(secondaryUnits) do
            table.insert(teamMembersUnits, su)
            if #teamMembersUnits == maxTeam then
                break
            end
        end
    end

    local tmIds = {}
    for _, tm in ipairs(teamMembersUnits) do
        tmIds[tm.unitId] = true
    end

    local donorsUnits = {}
    for _, gu in ipairs(mixedUnits) do
        if not tmIds[gu.unitId] then
            table.insert(donorsUnits, gu)
        end
    end

    unit.datalinks = unit.datalinks or {}
    unit.datalinks.Link16 = {
        network = {
            teamMembers = {},
            donors = {}
        },
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
        if unitType == "F-16C_50" then
            entry.TDOA = true
        end
        table.insert(unit.datalinks.Link16.network.teamMembers, entry)
    end

    for _, d in ipairs(donorsUnits) do
        table.insert(unit.datalinks.Link16.network.donors, {missionUnitId = d.unitId})
    end
end

-- Теперь применяем к смешанным группам для синей и красной стороны отдельно
-- Обрабатываем все юниты смешанных групп
for _, mUnits in pairs(mixedGroupsBlue) do
    for _, u in ipairs(mUnits) do
        buildDataLinksForUnitInMixed(u, mUnits)
    end
end

for _, mUnits in pairs(mixedGroupsRed) do
    for _, u in ipairs(mUnits) do
        buildDataLinksForUnitInMixed(u, mUnits)
    end
end

-- Теперь сохраняем результат
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
    file:write("mission = ")
    file:write(serializeTable(mission, nil, ""))
    file:write("\nreturn mission\n")
    file:close()
    print("Mission saved to " .. outFileName)
else
    print("Error: Cannot open file for writing: " .. outFileName)
end