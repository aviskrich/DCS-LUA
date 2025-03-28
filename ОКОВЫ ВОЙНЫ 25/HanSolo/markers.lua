local markerOpsAmmo = MARKEROPS_BASE:New("ammo", { "dia", "lim", "sec"}, true)
local markerOpsUnit = MARKEROPS_BASE:New("unit", { "dia","move"}, true)
-- Изменяем обработчик маркеров для транспортировки на cargo
local markerOpsCargo = MARKEROPS_BASE:New("cargo", { "unit", "static", "to"}, true)

local coalitions = { 
    [coalition.side.RED] = "red",
    [coalition.side.BLUE] = "blue"
}

-- Список доступных вертолетов для транспортировки
local availableHelicopters = {
    ["red"] = {
        ["mi8"] = {
            template = "Mi-8 Transport",
            capacity = 6000,  -- кг
            speed = 200       -- км/ч
        },
        ["mi24"] = {
            template = "Mi-26 Transport",
            capacity = 4000, -- кг
            speed = 250       -- км/ч
        }
    },
    ["blue"] = {
        ["ch47"] = {
            template = "CH-47 Transport",
            capacity = 12000, -- кг
            speed = 220       -- км/ч
        },
        ["uh60"] = {
            template = "UH-60 Transport",
            capacity = 4000,  -- кг
            speed = 240       -- км/ч
        },
        ["mi8"] = {
            template = "Mi-8 Transport",
            capacity = 6000,  -- кг
            speed = 200       -- км/ч
        },
    }
}

-- Таблица для хранения активных транспортных заданий
local transportMissions = {}

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

-- Функция для поиска ближайшей авиабазы к координатам
local function FindNearestAirbase(coord, coalition)
    local airbases = AIRBASE.GetAllAirbases(coalition)
    local nearestAirbase = nil
    local minDistance = math.huge
    
    for _, airbase in pairs(airbases) do
        local distance = coord:Get2DDistance(airbase:GetCoordinate())
        if distance < minDistance then
            minDistance = distance
            nearestAirbase = airbase
        end
    end
    
    return nearestAirbase, minDistance
end

-- Функция для создания вертолета на ближайшей авиабазе
local function SpawnTransportHelicopter(heliType, coalition, startCoord)
    local coalitionName = coalitions[coalition]
    local heliData = availableHelicopters[coalitionName][heliType]
    
    if not heliData then
        return nil, "Вертолет типа " .. heliType .. " не найден"
    end
    
    local nearestAirbase, distance = FindNearestAirbase(startCoord, coalition)
    
    if not nearestAirbase then
        return nil, "Не найдена подходящая авиабаза"
    end
    
    -- Создаем уникальное имя для группы вертолета
    local groupName = heliType .. "_transport_" .. os.time()
    
    -- Создаем вертолет из шаблона
    local helicopter = SPAWN:New(heliData.template)
                           :InitGrouping(1)
                           :InitLimit(1, 10)
                           :SpawnAtAirbase(nearestAirbase, SPAWN.Takeoff.Air, nil, groupName)
    
    if helicopter then
        -- Добавляем информацию о вертолете в таблицу миссий
        local missionId = os.time() .. "_" .. math.random(1000, 9999)
        transportMissions[missionId] = {
            helicopter = helicopter,
            status = "spawned",
            coalition = coalition,
            capacity = heliData.capacity,
            speed = heliData.speed,
            startTime = os.time()
        }
        
        return helicopter, missionId
    else
        return nil, "Не удалось создать вертолет"
    end
end

-- Функция для поиска объекта (юнита или статика) по ID или Callsign
local function FindObject(identifier, objectType, coalition)
    if objectType == "unit" then
        local units = SET_UNIT:New():FilterCoalitions(coalitions[coalition]):FilterOnce()
        
        -- Сначала пробуем найти по ID
        if tonumber(identifier) then
            for _, unit in pairs(units:GetSet()) do
                if unit:GetID() == tonumber(identifier) then
                    return unit
                end
            end
        end
        
        -- Если не нашли по ID, ищем по Callsign
        for _, unit in pairs(units:GetSet()) do
            local callsign = unit:GetCallsign()
            if callsign and string.lower(callsign) == string.lower(identifier) then
                return unit
            end
        end
    elseif objectType == "static" then
        local statics = SET_STATIC:New():FilterOnce()
        
        -- Для статических объектов ищем по ID
        if tonumber(identifier) then
            for _, static in pairs(statics:GetSet()) do
                if static:GetID() == tonumber(identifier) then
                    return static
                end
            end
        end
        
        -- Для статических объектов ищем по имени
        for _, static in pairs(statics:GetSet()) do
            local name = static:GetName()
            if name and string.lower(name) == string.lower(identifier) then
                return static
            end
        end
    end
    return nil
end

-- Функция для выполнения транспортной миссии
local function ExecuteTransportMission(helicopter, cargo, destination, missionId)
    local mission = transportMissions[missionId]
    if not mission then return false end
    
    mission.status = "en_route_to_cargo"
    mission.cargo = cargo
    mission.destination = destination
    
    -- Создаем маршрут для вертолета
    local heliGroup = helicopter:GetGroup()
    
    -- 1. Лететь к грузу
    local cargoCoord = cargo:GetCoordinate()
    heliGroup:RouteToVec3(cargoCoord:GetVec3(), mission.speed)
    
    -- Создаем обработчик для отслеживания прибытия к грузу
    local function CheckArrivalToCargo()
        local heliCoord = helicopter:GetCoordinate()
        if heliCoord:Get2DDistance(cargoCoord) < 100 then
            -- Вертолет прибыл к грузу
            mission.status = "loading_cargo"
            
            -- Имитируем загрузку груза (пауза)
            SCHEDULER:New(nil, function()
                -- Если это статический объект, удаляем его
                if cargo.ClassName == "STATIC" then
                    cargo:Destroy()
                end
                
                -- Обновляем статус миссии
                mission.status = "en_route_to_destination"
                
                -- Отправляем вертолет к месту назначения
                heliGroup:RouteToVec3(destination:GetVec3(), mission.speed)
                
                -- Отслеживаем прибытие к месту назначения
                SCHEDULER:New(nil, function()
                    local currentHeliCoord = helicopter:GetCoordinate()
                    if currentHeliCoord:Get2DDistance(destination) < 100 then
                        -- Вертолет прибыл к месту назначения
                        mission.status = "unloading_cargo"
                        
                        -- Имитируем выгрузку груза (пауза)
                        SCHEDULER:New(nil, function()
                            -- Если это был статический объект, создаем его снова в новом месте
                            if cargo.ClassName == "STATIC" then
                                local staticType = cargo:GetTypeName()
                                SPAWNSTATIC:NewFromType(staticType, cargo:GetCountry())
                                    :SpawnFromCoordinate(destination)
                            elseif cargo.ClassName == "UNIT" then
                                -- Для юнитов можно использовать телепортацию или другую логику
                                cargo:TeleportTo(destination)
                            end
                            
                            -- Отправляем вертолет обратно на базу
                            local nearestAirbase = FindNearestAirbase(destination, mission.coalition)
                            if nearestAirbase then
                                heliGroup:RouteToAirbase(nearestAirbase, mission.speed)
                                mission.status = "returning_to_base"
                                
                                -- Удаляем вертолет после возвращения на базу
                                SCHEDULER:New(nil, function()
                                    if helicopter and helicopter:IsAlive() then
                                        helicopter:Destroy()
                                    end
                                    transportMissions[missionId] = nil
                                end, {}, 60) -- Даем время на возвращение
                            else
                                helicopter:Destroy()
                                transportMissions[missionId] = nil
                            end
                            
                            -- Отправляем сообщение о завершении миссии
                            MESSAGE:New("Транспортная миссия завершена. Груз доставлен.", 20)
                                :ToCoalition(mission.coalition)
                        end, {}, 10) -- 10 секунд на выгрузку
                        return nil -- Останавливаем планировщик
                    end
                    return 5 -- Проверяем каждые 5 секунд
                end):Start()
            end, {}, 10) -- 10 секунд на загрузку
            return nil -- Останавливаем планировщик
        end
        return 5 -- Проверяем каждые 5 секунд
    end
    
    SCHEDULER:New(nil, CheckArrivalToCargo, {}, 5):Start()
    
    return true
end

-- Обработчик маркеров для транспортировки грузов
function markerOpsCargo:OnAfterMarkChanged(From, Event, To, Text, Keywords, Coord, idx, coalition)
    -- Парсим текст маркера для получения информации о транспортировке
    local heliType, objectType, objectIdentifier, toMarker
    
    -- Проверяем наличие ключевых слов
    if Keywords and #Keywords > 0 then
        for _, keyword in ipairs(Keywords) do
            if keyword:lower() == "unit" or keyword:lower() == "static" then
                objectType = keyword:lower()
                -- Ищем идентификатор объекта (ID или Callsign)
                local idPattern = objectType .. "%s+([%w%d_%-]+)"
                objectIdentifier = string.match(Text, idPattern)
            elseif keyword:lower() == "to" then
                -- Проверяем, есть ли указание на маркер назначения
                local toPattern = "to%s*$" -- Просто ключевое слово "to" в конце
                if string.match(Text, toPattern) then
                    -- Это маркер назначения
                    -- Ищем соответствующую ожидающую миссию
                    for missionKey, missionData in pairs(transportMissions) do
                        if string.match(missionKey, "^pending_" .. coalition) then
                            -- Нашли ожидающую миссию для этой коалиции
                            -- Создаем вертолет для транспортировки
                            local helicopter, missionIdOrError = SpawnTransportHelicopter(
                                missionData.heliType, 
                                coalition, 
                                missionData.cargoCoord
                            )
                            
                            if not helicopter then
                                MESSAGE:New("Ошибка создания вертолета: " .. missionIdOrError, 20)
                                    :ToCoalition(coalition)
                                return
                            end
                            
                            -- Выполняем транспортную миссию
                            local success = ExecuteTransportMission(
                                helicopter, 
                                missionData.cargo, 
                                Coord, -- используем координаты текущего маркера как место назначения
                                missionIdOrError
                            )
                            
                            if success then
                                MESSAGE:New("Транспортная миссия начата. Вертолет " .. missionData.heliType .. 
                                           " направляется к грузу.", 20)
                                    :ToCoalition(coalition)
                                
                                -- Удаляем ожидающую миссию
                                transportMissions[missionKey] = nil
                                return
                            else
                                MESSAGE:New("Ошибка при выполнении транспортной миссии", 20)
                                    :ToCoalition(coalition)
                                return
                            end
                        end
                    end
                    
                    -- Если не нашли ожидающую миссию
                    MESSAGE:New("Не найдено ожидающих транспортных миссий. Сначала отметьте груз.", 20)
                        :ToCoalition(coalition)
                    return
                end
            end
        end
    end
    
    -- Извлекаем тип вертолета из текста маркера
    local heliPattern = "^:([%w_]+)%s+"
    heliType = string.match(Text, heliPattern)
    
    -- Проверяем, что у нас есть вся необходимая информация для первого этапа
    if not heliType or not objectType or not objectIdentifier then
        MESSAGE:New("Неверный формат маркера. Используйте: :тип_вертолета unit/static ID_или_позывной", 20)
            :ToCoalition(coalition)
        return
    end
    
    -- Находим объект для транспортировки
    local cargoObject = FindObject(objectIdentifier, objectType, coalition)
    if not cargoObject then
        MESSAGE:New("Объект '" .. objectIdentifier .. "' не найден", 20)
            :ToCoalition(coalition)
        return
    end
    
    -- Сохраняем информацию о грузе для последующего маркера
    local missionKey = "pending_" .. coalition .. "_" .. os.time()
    transportMissions[missionKey] = {
        heliType = heliType,
        cargo = cargoObject,
        cargoCoord = Coord,
        coalition = coalition,
        startTime = os.time(),
        markerIdx = idx
    }
    
    MESSAGE:New("Груз отмечен для транспортировки. Поставьте маркер с текстом ':cargo to' в месте назначения", 20)
        :ToCoalition(coalition)
end


