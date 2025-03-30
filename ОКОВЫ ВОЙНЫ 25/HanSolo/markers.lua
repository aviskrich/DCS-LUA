---@diagnostic disable: undefined-global, lowercase-global, duplicate-set-field
-- Это игнорирует большинство ложных ошибок для API DCS

BASE:TraceClass("AI_CARGO_DISPATCHER_HELICOPTER")
BASE:TraceLevel(3)
BASE:TraceOnOff( true )

local markerOpsAmmo = MARKEROPS_BASE:New("ammo", { "dia", "lim", "sec"}, true)
local markerOpsUnit = MARKEROPS_BASE:New("unit", { "dia","move"}, true)
-- Изменяем обработчик маркеров для транспортировки на cargo
local markerOpsCargo = MARKEROPS_BASE:New("cargo", { "group", "static", "here"}, true)

local coalitions = { 
    [coalition.side.RED] = "red",
    [coalition.side.BLUE] = "blue"
}

local function _SendUnit(unit, course, distance, speed)                               
    local unitCoord = unit:GetCoordinate()
    local astar = ASTAR:New()
  
    -- Set start and end coordinates
    astar:SetStartCoordinate(unitCoord)
    astar:SetEndCoordinate(unitCoord:Translate(distance*1000, course))

    local boxwidth=distance*2*1000
    local spacex=distance*0.5
    local delta=distance/10
    
    -- Create a grid of nodes. We only want nodes of surface type water.
    astar:CreateGrid({land.SurfaceType.ROAD, land.SurfaceType.LAND}, boxwidth, spacex, delta, delta, false)
    
    -- Valid neighbour nodes need to have line of sight.
    astar:SetValidNeighbourLoS(200)
     -- Calculate path from start to end node.
    local path=astar:GetPath()
    
    if path then
      -- Loop over nodes in found path.
      local uid=unit:GetWaypointCurrent().uid -- ID of current waypoint.
      
      for i,_node in ipairs(path) do
        local node=_node --Core.Astar#ASTAR.Node
          
        -- Add waypoints along detour path to next waypoint.
        local wp=unit:AddWaypoint(node.coordinate, speed, uid)
        wp.astar=true
        
        -- Update id so the next wp is added after this one.
        uid=wp.uid

        -- Debug: smoke and mark path.
        node.coordinate:MarkToAll(string.format("Path node #%d", i))
      end
      
      return #path>0 
    else
      return false
    end
end

-- Таблица для хранения активных транспортных заданий
local transportTasks = {}



-- Обработка маркеров для поиска вооружения
function markerOpsAmmo:OnAfterMarkChanged(From, Event, To, Text, Keywords, Coord, idx, coalition)
    
    -- Найдем ближайший юнит к координатам маркера
    local units = SET_UNIT:New():FilterCoalitions(coalitions[coalition]):FilterOnce()
    local nearbyUnits = {}
    
    -- Проверяем, есть ли в тексте маркера параметр "dia" (диаметр)
    local diameter = 1000 -- значение по умолчанию (1 км)
    local radius = diameter / 2 -- обновляем радиус поиска      
    local seconds = 15

    if Keywords and #Keywords > 0 then
        for _, keyword in ipairs(Keywords) do
            -- Ищем значение диаметра с помощью регулярного выражения
            -- Если в тексте маркера есть параметр "dia", то обновляем радиус поиска
            if keyword:lower() == "dia" then
                local diaPattern = "dia%s+(%d+)"                
                local diaMatch = string.match(Text, diaPattern)
                if diaMatch then
                    diameter = tonumber(diaMatch) * 1000 -- переводим км в метры
                    radius = diameter / 2 -- обновляем радиус поиска
                end
            end
            if keyword:lower() == "sec" then
                local secPattern = "sec%s+(%d+)"                
                local secMatch = string.match(Text, secPattern)
                if secMatch then
                    seconds = math.min(tonumber(secMatch), 60)
                end
            end
        end
    end

    -- Перебираем все юниты и находим те, что в радиусе radius км от маркера
    for _, unit in pairs(units:GetSet()) do
        local unitCoord = unit:GetCoordinate()
        if unitCoord and Coord:Get2DDistance(unitCoord) <= radius then
            table.insert(nearbyUnits, unit)
        end
    end

    -- Создаем метки на каждом найденном юните с информацией о вооружении
    for _, unit in ipairs(nearbyUnits) do
        local unitCoord = unit:GetCoordinate()
        local unitName = unit:GetName()
        local ammoText = "Вооружение " .. unitName .. ":\n"

        -- Получаем информацию о вооружении
        local ammo = unit:GetAmmo()
        if ammo then
            for _, weapon in ipairs(ammo) do
                local weaponName = weapon.desc.displayName or "Неизвестное оружие"
                local count = weapon.count or 0
                ammoText = ammoText .. weaponName .. ": " .. count .. "\n"
            end
        else
            ammoText = ammoText .. "Нет информации о вооружении"
        end

        -- Создаем новую метку на позиции юнита
        MARKER:New(unitCoord, ammoText):ToCoalition(coalition):Remove(seconds)
    end
end

-- Обработка маркеров для отправки юнитов в точку
function markerOpsUnit:OnAfterMarkChanged(From, Event, To, Text, Keywords, Coord, idx, coalition)
    local units = SET_UNIT:New():FilterCoalitions(coalitions[coalition]):FilterOnce()
    local nearbyUnits = {}
    
    -- Проверяем, есть ли в тексте маркера параметр "dia" (диаметр)
    local diameter = 1000 -- значение по умолчанию (1 км)    
    
    if Keywords and #Keywords > 0 then
        for _, keyword in ipairs(Keywords) do
            -- Ищем значение диаметра с помощью регулярного выражения
            -- Если в тексте маркера есть параметр "dia", то обновляем радиус поиска
            if keyword:lower() == "move" then
                -- Обрабатываем паттерн "unit move 130/4", где 130 - курс, 4 - дальность
                local headingPattern = "move%s+(%d+)/(%d+)"
                local heading, distance = string.match(Text, headingPattern)

                if heading then
                    diameter = 1000 -- переводим км в метры                    
                    if not distance then
                        distance = 10
                    end

                    -- Перебираем все юниты и находим те, что в радиусе radius км от маркера
                    for _, unit in pairs(units:GetSet()) do
                        local unitCoord = unit:GetCoordinate()
                        
                        if unitCoord and Coord:Get2DDistance(unitCoord) <= diameter/2 then                            
                            _SendUnit(unit, heading, distance*1000, 500)
                            -- unit:TaskRouteToVec2(unitCoord:Translate(distance, heading):GetVec2(), 500)
                        end
                    end
                end
            end            
        end
    end

end

-- Обработка маркеров для транспортировки юнитов и грузов
function markerOpsCargo:OnAfterMarkChanged(From, Event, To, Text, Keywords, Coord, idx, coalition)
    -- Проверяем наличие ключевых слов
    if not Keywords or #Keywords == 0 then return end

    -- Первое слово должно быть cargo
    local firstWord = Text:match("^(%S+)")
    if firstWord ~= "cargo" then return end

    -- Обработка выбора груза (cargo group/crate name)
    if Keywords[1] == "group" or Keywords[1] == "crate" then
        self:HandleCargoSelection(Text, Keywords, Coord, idx, coalition)
    -- Обработка указания точки назначения (cargo #task_number here)
    elseif Keywords[1] == "here" then
        self:HandleCargoDestination(Text, Keywords, Coord, idx, coalition)
    end
end

-- Создаем множества для хранения транспортных вертолетов и грузов
local carrierSet = SET_GROUP:New():FilterPrefixes("TransportHeli"):FilterStart()
local cargoSet = SET_CARGO:New():FilterTypes("Infantry"):FilterStart()

-- Функция обработки выбора груза
function markerOpsCargo:HandleCargoSelection(Text, Keywords, Coord, idx, coalition)
    -- Парсим формат: cargo group/crate name
    local cargoType = Keywords[1] -- group или crate
    local name = Text:match("cargo%s+" .. cargoType .. "%s+(.+)") -- извлекаем имя

    if not name then
        MESSAGE:New("Неверный формат. Используйте: cargo group/crate name", 20):ToCoalition(coalition)
        return
    end

    -- Создаем новую задачу
    local taskNumber = transportTasks and #transportTasks + 1 or 1
    transportTasks[taskNumber] = {
        type = cargoType,
        name = name,
        coalition = coalition,
        sourceCoord = Coord,
        destinationCoord = nil
    }

    MESSAGE:New(string.format("Груз #%d отмечен. Поставьте маркер 'cargo #%d here' в точке назначения", 
        taskNumber, taskNumber), 20):ToCoalition(coalition)
end

-- Функция обработки точки назначения
function markerOpsCargo:HandleCargoDestination(Text, Keywords, Coord, idx, coalition)
    -- Парсим формат: cargo #task_number here
    local taskNumber = Text:match("cargo%s+#(%d+)%s+here")
    taskNumber = tonumber(taskNumber)

    if not taskNumber or not transportTasks[taskNumber] then
        MESSAGE:New("Неверный номер задачи или задача не найдена", 20):ToCoalition(coalition)
        return
    end

    -- Проверяем, что коалиция совпадает
    if transportTasks[taskNumber].coalition ~= coalition then
        MESSAGE:New("У вас нет доступа к этой задаче", 20):ToCoalition(coalition)
        return
    end

    -- Добавляем координаты назначения к задаче
    transportTasks[taskNumber].destinationCoord = Coord

    MESSAGE:New(string.format("Точка назначения для задачи #%d установлена", taskNumber), 20)
        :ToCoalition(coalition)
    
    self:StartTransportMission(taskNumber)
end


-- Функция создания и запуска транспортной миссии
function markerOpsCargo:StartTransportMission(taskNumber)
    local task = transportTasks[taskNumber]
    if not task then return end

    -- Создаем зону высадки из координат маркера назначения
    local dropZoneName = string.format("DropZone_%d", taskNumber)
    local dropZone = ZONE_RADIUS:New(dropZoneName, task.destinationCoord:GetVec2(), 100)

    -- Создаем CARGO_GROUP из выбранной группы пехоты
    local cargoGroup = GROUP:FindByName(task.name)
    if not cargoGroup then
        MESSAGE:New("Ошибка: группа " .. task.name .. " не найдена"):ToCoalition(task.coalition)
        return
    end

    -- Создаем объект CARGO_GROUP
    local cargo = CARGO_GROUP:New(cargoGroup, "Infantry", task.name, 1000)
    
    -- Находим ближайшую авиабазу к точке погрузки
    local nearestBase = nil
    local shortestDistance = math.huge
    
    for _, base in pairs(AIRBASE.GetAllAirbases()) do
        local distance = base:GetCoordinate():Get2DDistance(task.sourceCoord)
        if distance < shortestDistance then
            shortestDistance = distance
            nearestBase = base
        end
    end

    if not nearestBase then
        MESSAGE:New("Ошибка: не найдена подходящая авиабаза"):ToCoalition(task.coalition)
        return
    end

    -- Создаем диспетчера для этой конкретной миссии
    local dispatcher = AI_CARGO_DISPATCHER_HELICOPTER:New(
        carrierSet, 
        SET_CARGO:New():AddCargo(cargo),
        SET_ZONE:New():AddZone(ZONE_RADIUS:New("PickupZone_" .. taskNumber, task.sourceCoord:GetVec2(), 100)),
        SET_ZONE:New():AddZone(dropZone)
    )

    -- Устанавливаем домашнюю зону как ближайшую авиабазу
    dispatcher:SetHomeZone(ZONE_AIRBASE:New(nearestBase:GetName()))
    dispatcher:Start()
    
    -- Обновляем статус миссии
    task.status = "active"
    task.dispatcher = dispatcher
    
    -- Отправляем сообщение о начале миссии
    MESSAGE:New(
        string.format("Транспортная миссия #%d запущена\nГруз: %s\nБаза вылета: %s", 
            taskNumber, 
            task.name, 
            nearestBase:GetName()
        )
    ):ToCoalition(task.coalition)
end

-- Создаем меню для офицера Combined Arms
local function createTransportMenu()
    -- Создаем основное меню для каждой коалиции
    local redMenu = MENU_COALITION:New(coalition.side.RED, "Транспортные операции")
    local blueMenu = MENU_COALITION:New(coalition.side.BLUE, "Транспортные операции")
    
    -- Добавляем команду просмотра миссий
    MENU_COALITION_COMMAND:New(coalition.side.RED, "Просмотреть транспортные миссии", redMenu, showTransportMissions, coalition.side.RED)
    MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Просмотреть транспортные миссии", blueMenu, showTransportMissions, coalition.side.BLUE)
end

-- Функция отображения информации о транспортных миссиях
function showTransportMissions(coalitionSide)
    local message = "Активные транспортные миссии:\n\n"
    local hasActiveMissions = false
    
    for taskNum, task in pairs(transportTasks) do
        if task.coalition == coalitionSide then
            hasActiveMissions = true
            message = message .. string.format(
                "Миссия #%d:\n" ..
                "- Тип: %s\n" ..
                "- Груз: %s\n" ..
                "- Статус: %s\n\n",
                taskNum,
                task.type == "group" and "Пехота" or "Контейнер",
                task.name,
                task.destinationCoord and "Ожидает транспорт" or "Ожидает точку назначения"
            )
        end
    end
    
    if not hasActiveMissions then
        message = "Нет активных транспортных миссий"
    end
    
    MESSAGE:New(message, 30):ToCoalition(coalitionSide)
end

-- Инициализация меню при запуске скрипта
createTransportMenu()