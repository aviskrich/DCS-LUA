local markerOpsAmmo = MARKEROPS_BASE:New("ammo", { "dia", "lim", "sec"}, true)
local markerOpsUnit = MARKEROPS_BASE:New("unit", { "dia","move"}, true)
-- Изменяем обработчик маркеров для транспортировки на cargo
local markerOpsCargo = MARKEROPS_BASE:New("cargo", { "group", "static", "to"}, true)

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

-- Таблица для хранения активных диспетчеров грузов
local activeDispatchers = {}

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

-- Функция для поиска объекта (юнита или статика) по ID или Callsign
local function FindObject(identifier, objectType, coalition)
    if objectType == "group" then
        local groups = SET_GROUP:New():FilterPrefixes(identifier):FilterCoalitions(coalitions[coalition]):FilterOnce()
        for _, group in pairs(groups:GetSet()) do
            local callsign = group:GetName()
            if callsign and string.lower(callsign) == string.lower(identifier) then
                return group
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

-- Функция для создания транспортной миссии с использованием AI_CARGO_DISPATCHER
local function CreateTransportMission(heliType, cargo, destination, coalition)
    local coalitionName = coalitions[coalition]
    local heliData = availableHelicopters[coalitionName][heliType]
    
    if not heliData then
        return false, "Вертолет типа " .. heliType .. " не найден"
    end
    
    -- Находим ближайшую авиабазу к грузу
    local nearestAirbase, distance = FindNearestAirbase(cargo:GetCoordinate(), coalition)
    if not nearestAirbase then
        return false, "Не найдена подходящая авиабаза"
    end
    
    -- Создаем уникальное имя для группы вертолета
    local groupName = heliType .. "_transport_" .. os.time()
    
    -- Создаем вертолет из шаблона
    local helicopter = SPAWN:New(heliData.template)
                           :InitGrouping(1)
                           :InitLimit(1, 10)
                           :SpawnAtAirbase(nearestAirbase, SPAWN.Takeoff.Air)
    
    if not helicopter then
        return false, "Не удалось создать вертолет"
    end
    
    -- Создаем SET_GROUP для вертолета
    local carrierSet = SET_GROUP:New()
    carrierSet:AddGroup(helicopter)
    
    -- Создаем задание на перевозку груза
    local cargoName = "Cargo_" .. os.time()
    local cargoObject
    
    -- Создаем SET_CARGO для груза
    local cargoSet = SET_CARGO:New()
    
    if cargo.ClassName == "GROUP" then
        -- Для юнитов создаем CARGO_UNIT
        cargoObject = CARGO_GROUP:New(cargo, cargoName, cargo:GetName(), heliData.capacity)
    elseif cargo.ClassName == "STATIC" then
        -- Для статических объектов создаем CARGO_CRATE
        cargoObject = CARGO_CRATE:New(cargo, cargoName, cargo:GetName(), heliData.capacity)
    else
        return false, "Неподдерживаемый тип груза: " .. (cargo.ClassName or "неизвестный")
    end
    
    -- Добавляем груз в SET_CARGO
    cargoSet:AddCargo(cargoObject)
    
    -- Создаем зону назначения
    local deployZoneName = "DeployZone_" .. os.time()
    local deployZone = ZONE_RADIUS:New(deployZoneName, destination:GetVec2(), 100)
    local homeZone = ZONE_RADIUS:New("HomeZone_" .. os.time(), helicopter:GetVec2(), 1000)
    
    -- Создаем SET_ZONE для зоны захвата груза
    local pickupZone = ZONE_RADIUS:New("PickupZone_" .. os.time(), cargo:GetVec2(), 300)
    local pickupZoneSet = SET_ZONE:New()
    pickupZoneSet:AddZone(pickupZone)

    -- Создаем SET_ZONE для зоны назначения
    local deployZoneSet = SET_ZONE:New()
    deployZoneSet:AddZone(deployZone)
    
    -- Создаем диспетчер грузов
    local dispatcher = AI_CARGO_DISPATCHER_HELICOPTER:New(carrierSet, cargoSet, pickupZoneSet, deployZoneSet)
    dispatcher:SetHomeZone(homeZone)
    
    -- Сохраняем информацию о миссии
    local missionId = "mission_" .. coalition .. "_" .. os.time()
    transportMissions[missionId] = {
        helicopter = helicopter,
        cargo = cargo,
        cargoObject = cargoObject,
        destination = destination,
        coalition = coalition,
        startTime = os.time(),
        status = "started",
        dispatcher = dispatcher,
        pickupZone = pickupZone,
        deployZone = deployZone,
        homeZone = homeZone
    }
    
    -- Добавляем диспетчер в список активных
    activeDispatchers[missionId] = dispatcher
    
    -- Обработчик события возвращения домой
    -- function dispatcher:OnAfterHome(From, Event, To, CarrierGroup, Coordinate, Speed, Height, HomeZone)
    --     -- Проверяем, что это наш вертолет
    --     if CarrierGroup:GetName() == helicopter:GetName() then
    --         -- Миссия завершена, уничтожаем вертолет
            
    --         if helicopter and helicopter:IsAlive() then
    --             helicopter:Destroy()
    --         end
            
    --         -- Очищаем ресурсы
    --         dispatcher:Stop()
    --         activeDispatchers[missionId] = nil
    --         transportMissions[missionId] = nil
            
    --         -- Отправляем сообщение о завершении миссии
    --         MESSAGE:New("Транспортная миссия завершена. Груз доставлен.", 20)
    --             :ToCoalition(coalition)
        
    --     end
    -- end
    
    -- Запускаем диспетчер
    dispatcher:Start()
    
    return true, missionId
end

-- Обработчик маркеров для транспортировки грузов
function markerOpsCargo:OnAfterMarkChanged(From, Event, To, Text, Keywords, Coord, idx, coalition)
    -- Парсим текст маркера для получения информации о транспортировке
    local heliType, objectType, objectIdentifier, toMarker
    
    -- Проверяем наличие ключевых слов
    if Keywords and #Keywords > 0 then
        for _, keyword in ipairs(Keywords) do
            if keyword:lower() == "group" or keyword:lower() == "static" then
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
                            
                            -- Создаем транспортную миссию
                            local success, missionIdOrError = CreateTransportMission(
                                missionData.heliType,
                                missionData.cargo,
                                Coord,
                                coalition
                            )
                            
                            if success then
                                MESSAGE:New("Транспортная миссия начата. Вертолет " .. missionData.heliType .. 
                                           " направляется к грузу.", 20)
                                    :ToCoalition(coalition)
                                
                                -- Удаляем ожидающую миссию
                                transportMissions[missionKey] = nil
                                return
                            else
                                MESSAGE:New("Ошибка при создании транспортной миссии: " .. missionIdOrError, 20)
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

-- Очистка ресурсов при завершении миссии
function CleanupTransportMissions()
    for missionId, dispatcher in pairs(activeDispatchers) do
        dispatcher:Stop()
    end
    activeDispatchers = {}
    transportMissions = {}
end

