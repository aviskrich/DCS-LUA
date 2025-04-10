--[[
ATC_Procedures.lua
Модуль для работы с процедурами полета для универсального ATC модуля
Автор: Andrey Iskrich
Дата: Апрель 2025
--]]

local ATC_Procedures = {}

-- Логирование
ATC_Procedures.log = function(message)
    if ATC_Config and ATC_Config.DEBUG then
        env.info("[ATC_Procedures] " .. message)
    end
end

-- Инициализация модуля
ATC_Procedures.init = function()
    ATC_Procedures.log("Инициализация модуля процедур")
    return ATC_Procedures
end

-- Получение SID процедуры для ВПП
ATC_Procedures.getSIDForRunway = function(runway)
    if not ATC_Navigraph.isDataLoaded then
        ATC_Procedures.log("Данные Navigraph не загружены")
        return nil
    end
    
    local sids = ATC_Navigraph.getAllSIDs()
    local runwaySIDs = {}
    
    for name, sid in pairs(sids) do
        if sid.runway == runway then
            table.insert(runwaySIDs, {
                name = name,
                data = sid
            })
        end
    end
    
    return runwaySIDs
end

-- Получение STAR процедуры для ВПП
ATC_Procedures.getSTARForRunway = function(runway)
    if not ATC_Navigraph.isDataLoaded then
        ATC_Procedures.log("Данные Navigraph не загружены")
        return nil
    end
    
    local stars = ATC_Navigraph.getAllSTARs()
    local runwaySTARs = {}
    
    for name, star in pairs(stars) do
        if star.runway == runway then
            table.insert(runwaySTARs, {
                name = name,
                data = star
            })
        end
    end
    
    return runwaySTARs
end

-- Получение процедуры захода на посадку для ВПП
ATC_Procedures.getApproachForRunway = function(runway, approachType)
    if not ATC_Navigraph.isDataLoaded then
        ATC_Procedures.log("Данные Navigraph не загружены")
        return nil
    end
    
    local approaches = ATC_Navigraph.getAllAPPROACHes()
    local runwayApproaches = {}
    
    for name, approach in pairs(approaches) do
        if approach.runway == runway and (not approachType or approach.type == approachType) then
            table.insert(runwayApproaches, {
                name = name,
                data = approach
            })
        end
    end
    
    return runwayApproaches
end

-- Получение рекомендуемой SID процедуры для ВПП и направления
ATC_Procedures.getRecommendedSID = function(runway, direction)
    local sids = ATC_Procedures.getSIDForRunway(runway)
    if not sids or #sids == 0 then
        return nil
    end
    
    -- Если направление не указано, возвращаем первую процедуру
    if not direction then
        return sids[1]
    end
    
    -- Поиск процедуры, наиболее соответствующей указанному направлению
    local bestSID = nil
    local minAngleDiff = 180
    
    for _, sid in ipairs(sids) do
        if #sid.data.waypoints > 0 then
            local lastWaypoint = sid.data.waypoints[#sid.data.waypoints]
            local waypointData = ATC_Navigraph.getWaypoint(lastWaypoint.name)
            
            if waypointData then
                -- Получение координат первой и последней точки процедуры
                local firstWaypointData = ATC_Navigraph.getWaypoint(sid.data.waypoints[1].name)
                
                if firstWaypointData then
                    local firstCoord = COORDINATE:NewFromLLDD(firstWaypointData.lat, firstWaypointData.lon)
                    local lastCoord = COORDINATE:NewFromLLDD(waypointData.lat, waypointData.lon)
                    
                    -- Расчет направления процедуры
                    local sidDirection = firstCoord:GetAngleDegrees(lastCoord)
                    
                    -- Расчет разницы между направлением процедуры и указанным направлением
                    local angleDiff = math.abs((sidDirection - direction + 180) % 360 - 180)
                    
                    if angleDiff < minAngleDiff then
                        minAngleDiff = angleDiff
                        bestSID = sid
                    end
                end
            end
        end
    end
    
    return bestSID or sids[1]
end

-- Получение рекомендуемой STAR процедуры для ВПП и направления
ATC_Procedures.getRecommendedSTAR = function(runway, direction)
    local stars = ATC_Procedures.getSTARForRunway(runway)
    if not stars or #stars == 0 then
        return nil
    end
    
    -- Если направление не указано, возвращаем первую процедуру
    if not direction then
        return stars[1]
    end
    
    -- Поиск процедуры, наиболее соответствующей указанному направлению
    local bestSTAR = nil
    local minAngleDiff = 180
    
    for _, star in ipairs(stars) do
        if #star.data.waypoints > 0 then
            local firstWaypoint = star.data.waypoints[1]
            local waypointData = ATC_Navigraph.getWaypoint(firstWaypoint.name)
            
            if waypointData then
                -- Получение координат первой и последней точки процедуры
                local lastWaypointData = ATC_Navigraph.getWaypoint(star.data.waypoints[#star.data.waypoints].name)
                
                if lastWaypointData then
                    local firstCoord = COORDINATE:NewFromLLDD(waypointData.lat, waypointData.lon)
                    local lastCoord = COORDINATE:NewFromLLDD(lastWaypointData.lat, lastWaypointData.lon)
                    
                    -- Расчет направления процедуры (обратное направлению STAR)
                    local starDirection = (lastCoord:GetAngleDegrees(firstCoord) + 180) % 360
                    
                    -- Расчет разницы между направлением процедуры и указанным направлением
                    local angleDiff = math.abs((starDirection - direction + 180) % 360 - 180)
                    
                    if angleDiff < minAngleDiff then
                        minAngleDiff = angleDiff
                        bestSTAR = star
                    end
                end
            end
        end
    end
    
    return bestSTAR or stars[1]
end

-- Получение рекомендуемой процедуры захода на посадку для ВПП
ATC_Procedures.getRecommendedApproach = function(runway, approachType)
    local approaches = ATC_Procedures.getApproachForRunway(runway, approachType)
    if not approaches or #approaches == 0 then
        return nil
    end
    
    -- Приоритет типов захода
    local approachPriority = {
        ILS = 1,
        RNAV = 2,
        VOR = 3,
        NDB = 4,
        VISUAL = 5
    }
    
    -- Если тип захода указан, возвращаем первую процедуру этого типа
    if approachType and approaches[1] then
        return approaches[1]
    end
    
    -- Иначе выбираем процедуру с наивысшим приоритетом
    table.sort(approaches, function(a, b)
        local priorityA = approachPriority[a.data.type] or 99
        local priorityB = approachPriority[b.data.type] or 99
        return priorityA < priorityB
    end)
    
    return approaches[1]
end

-- Создание маршрута MOOSE из процедуры
ATC_Procedures.createRouteFromProcedure = function(procedure, procedureType)
    if not procedure or not procedureType then
        return nil
    end
    
    local waypoints = {}
    
    for _, wp in ipairs(procedure.waypoints) do
        local waypointData = ATC_Navigraph.getWaypoint(wp.name)
        
        if waypointData then
            local coord = COORDINATE:NewFromLLDD(waypointData.lat, waypointData.lon)
            
            local waypointProps = {
                ["x"] = coord.x,
                ["y"] = coord.y,
                ["z"] = coord.z,
                ["alt"] = wp.altitude_min or 2000,
                ["alt_type"] = "BARO",
                ["speed"] = wp.speed or 250,
                ["name"] = wp.name
            }
            
            table.insert(waypoints, waypointProps)
        else
            ATC_Procedures.log("Предупреждение: Путевая точка не найдена: " .. wp.name)
        end
    end
    
    return waypoints
end

-- Проверка, находится ли объект на маршруте процедуры
ATC_Procedures.isObjectOnProcedureRoute = function(object, procedure, procedureType, tolerance)
    if not object or not procedure or not procedureType then
        return false
    end
    
    tolerance = tolerance or 1.0  -- Допустимое отклонение в морских милях
    
    local objectCoord = object:GetCoordinate()
    
    -- Проверка каждой точки процедуры
    for _, wp in ipairs(procedure.waypoints) do
        local waypointData = ATC_Navigraph.getWaypoint(wp.name)
        
        if waypointData then
            local waypointCoord = COORDINATE:NewFromLLDD(waypointData.lat, waypointData.lon)
            local distance = ATC_Utils.getDistance(objectCoord, waypointCoord)
            
            if distance <= tolerance then
                return true, wp.name
            end
        end
    end
    
    return false
end

-- Получение ближайшей точки процедуры к объекту
ATC_Procedures.getNearestProcedureWaypoint = function(object, procedure, procedureType)
    if not object or not procedure or not procedureType then
        return nil
    end
    
    local objectCoord = object:GetCoordinate()
    local nearestWaypoint = nil
    local minDistance = math.huge
    
    -- Проверка каждой точки процедуры
    for _, wp in ipairs(procedure.waypoints) do
        local waypointData = ATC_Navigraph.getWaypoint(wp.name)
        
        if waypointData then
            local waypointCoord = COORDINATE:NewFromLLDD(waypointData.lat, waypointData.lon)
            local distance = ATC_Utils.getDistance(objectCoord, waypointCoord)
            
            if distance < minDistance then
                minDistance = distance
                nearestWaypoint = {
                    name = wp.name,
                    data = wp,
                    waypointData = waypointData,
                    distance = distance
                }
            end
        end
    end
    
    return nearestWaypoint
end

-- Получение следующей точки процедуры после указанной
ATC_Procedures.getNextProcedureWaypoint = function(procedure, procedureType, currentWaypointName)
    if not procedure or not procedureType or not currentWaypointName then
        return nil
    end
    
    local found = false
    
    for i, wp in ipairs(procedure.waypoints) do
        if found then
            local waypointData = ATC_Navigraph.getWaypoint(wp.name)
            
            if waypointData then
                return {
                    name = wp.name,
                    data = wp,
                    waypointData = waypointData,
                    index = i
                }
            end
        end
        
        if wp.name == currentWaypointName then
            found = true
        end
    end
    
    return nil
end

-- Получение предыдущей точки процедуры перед указанной
ATC_Procedures.getPreviousProcedureWaypoint = function(procedure, procedureType, currentWaypointName)
    if not procedure or not procedureType or not currentWaypointName then
        return nil
    end
    
    local prevWaypoint = nil
    
    for i, wp in ipairs(procedure.waypoints) do
        if wp.name == currentWaypointName then
            return prevWaypoint
        end
        
        local waypointData = ATC_Navigraph.getWaypoint(wp.name)
        
        if waypointData then
            prevWaypoint = {
                name = wp.name,
                data = wp,
                waypointData = waypointData,
                index = i
            }
        end
    end
    
    return nil
end

-- Получение индекса точки в процедуре
ATC_Procedures.getWaypointIndex = function(procedure, procedureType, waypointName)
    if not procedure or not procedureType or not waypointName then
        return nil
    end
    
    for i, wp in ipairs(procedure.waypoints) do
        if wp.name == waypointName then
            return i
        end
    end
    
    return nil
end

-- Получение оставшегося расстояния по процедуре
ATC_Procedures.getRemainingDistance = function(object, procedure, procedureType, currentWaypointName)
    if not object or not procedure or not procedureType then
        return nil
    end
    
    local objectCoord = object:GetCoordinate()
    local currentIndex = 1
    
    if currentWaypointName then
        currentIndex = ATC_Procedures.getWaypointIndex(procedure, procedureType, currentWaypointName) or 1
    end
    
    local totalDistance = 0
    
    -- Расстояние до текущей точки
    local currentWaypoint = procedure.waypoints[currentIndex]
    if currentWaypoint then
        local waypointData = ATC_Navigraph.getWaypoint(currentWaypoint.name)
        
        if waypointData then
            local waypointCoord = COORDINATE:NewFromLLDD(waypointData.lat, waypointData.lon)
            totalDistance = ATC_Utils.getDistance(objectCoord, waypointCoord)
        end
    end
    
    -- Расстояние между оставшимися точками
    for i = currentIndex, #procedure.waypoints - 1 do
        local wp1 = procedure.waypoints[i]
        local wp2 = procedure.waypoints[i + 1]
        
        local wp1Data = ATC_Navigraph.getWaypoint(wp1.name)
        local wp2Data = ATC_Navigraph.getWaypoint(wp2.name)
        
        if wp1Data and wp2Data then
            local wp1Coord = COORDINATE:NewFromLLDD(wp1Data.lat, wp1Data.lon)
            local wp2Coord = COORDINATE:NewFromLLDD(wp2Data.lat, wp2Data.lon)
            
            totalDistance = totalDistance + ATC_Utils.getDistance(wp1Coord, wp2Coord)
        end
    end
    
    return totalDistance
end

-- Получение оставшегося времени по процедуре
ATC_Procedures.getRemainingTime = function(object, procedure, procedureType, currentWaypointName)
    if not object or not procedure or not procedureType then
        return nil
    end
    
    local distance = ATC_Procedures.getRemainingDistance(object, procedure, procedureType, currentWaypointName)
    if not distance then
        return nil
    end
    
    local speed = ATC_Utils.getSpeed(object)
    if speed < 10 then
        speed = 250  -- Предполагаемая скорость, если объект стоит на месте
    end
    
    return distance / speed * 60  -- Время в минутах
end

-- Получение ограничений по высоте для точки процедуры
ATC_Procedures.getAltitudeRestrictions = function(procedure, procedureType, waypointName)
    if not procedure or not procedureType or not waypointName then
        return nil
    end
    
    for _, wp in ipairs(procedure.waypoints) do
        if wp.name == waypointName then
            local restrictions = {}
            
            if wp.altitude_min then
                restrictions.min = wp.altitude_min
            end
            
            if wp.altitude_max then
                restrictions.max = wp.altitude_max
            end
            
            return restrictions
        end
    end
    
    return nil
end

-- Получение ограничений по скорости для точки процедуры
ATC_Procedures.getSpeedRestrictions = function(procedure, procedureType, waypointName)
    if not procedure or not procedureType or not waypointName then
        return nil
    end
    
    for _, wp in ipairs(procedure.waypoints) do
        if wp.name == waypointName then
            if wp.speed then
                return wp.speed
            end
            
            return nil
        end
    end
    
    return nil
end

-- Проверка соблюдения ограничений по высоте
ATC_Procedures.checkAltitudeRestrictions = function(object, procedure, procedureType, waypointName)
    if not object or not procedure or not procedureType or not waypointName then
        return true
    end
    
    local restrictions = ATC_Procedures.getAltitudeRestrictions(procedure, procedureType, waypointName)
    if not restrictions then
        return true
    end
    
    local altitude = ATC_Utils.getAltitude(object)
    
    if restrictions.min and altitude < restrictions.min then
        return false, "below", restrictions.min
    end
    
    if restrictions.max and altitude > restrictions.max then
        return false, "above", restrictions.max
    end
    
    return true
end

-- Проверка соблюдения ограничений по скорости
ATC_Procedures.checkSpeedRestrictions = function(object, procedure, procedureType, waypointName)
    if not object or not procedure or not procedureType or not waypointName then
        return true
    end
    
    local restriction = ATC_Procedures.getSpeedRestrictions(procedure, procedureType, waypointName)
    if not restriction then
        return true
    end
    
    local speed = ATC_Utils.getSpeed(object)
    
    if speed > restriction + 10 then  -- Допуск 10 узлов
        return false, "too fast", restriction
    end
    
    return true
end

-- Получение информации о процедуре для передачи пилоту
ATC_Procedures.getProcedureInfo = function(procedure, procedureType)
    if not procedure or not procedureType then
        return "Информация о процедуре недоступна"
    end
    
    local result = ""
    
    if procedureType == "SID" then
        result = "SID " .. procedure.name .. " для ВПП " .. procedure.runway .. ". "
    elseif procedureType == "STAR" then
        result = "STAR " .. procedure.name .. " для ВПП " .. procedure.runway .. ". "
    elseif procedureType == "APPROACH" then
        result = "Заход " .. procedure.type .. " " .. procedure.name .. " для ВПП " .. procedure.runway .. ". "
    end
    
    result = result .. "Путевые точки: "
    
    for i, wp in ipairs(procedure.waypoints) do
        result = result .. wp.name
        
        if wp.altitude_min and wp.altitude_max then
            result = result .. " (между " .. wp.altitude_min .. " и " .. wp.altitude_max .. " футов)"
        elseif wp.altitude_min then
            result = result .. " (выше " .. wp.altitude_min .. " футов)"
        elseif wp.altitude_max then
            result = result .. " (ниже " .. wp.altitude_max .. " футов)"
        end
        
        if wp.speed then
            result = result .. " (скорость " .. wp.speed .. " узлов)"
        end
        
        if i < #procedure.waypoints then
            result = result .. ", "
        end
    end
    
    return result
end

-- Получение информации о следующей точке процедуры для передачи пилоту
ATC_Procedures.getNextWaypointInfo = function(object, procedure, procedureType, currentWaypointName)
    if not object or not procedure or not procedureType then
        return "Информация о следующей точке недоступна"
    end
    
    local nextWaypoint = nil
    
    if currentWaypointName then
        nextWaypoint = ATC_Procedures.getNextProcedureWaypoint(procedure, procedureType, currentWaypointName)
    else
        local nearestWaypoint = ATC_Procedures.getNearestProcedureWaypoint(object, procedure, procedureType)
        if nearestWaypoint then
            nextWaypoint = ATC_Procedures.getNextProcedureWaypoint(procedure, procedureType, nearestWaypoint.name)
        end
    end
    
    if not nextWaypoint then
        return "Нет следующей точки в процедуре"
    end
    
    local result = "Следующая точка: " .. nextWaypoint.name
    
    local waypointData = nextWaypoint.waypointData
    if waypointData then
        local objectCoord = object:GetCoordinate()
        local waypointCoord = COORDINATE:NewFromLLDD(waypointData.lat, waypointData.lon)
        
        local distance = ATC_Utils.getDistance(objectCoord, waypointCoord)
        local bearing = ATC_Utils.getHeading(objectCoord, waypointCoord)
        
        result = result .. ", курс " .. ATC_Utils.formatHeading(bearing) .. ", расстояние " .. math.floor(distance) .. " морских миль"
    end
    
    local restrictions = ATC_Procedures.getAltitudeRestrictions(procedure, procedureType, nextWaypoint.name)
    if restrictions then
        if restrictions.min and restrictions.max then
            result = result .. ", высота между " .. restrictions.min .. " и " .. restrictions.max .. " футов"
        elseif restrictions.min then
            result = result .. ", высота выше " .. restrictions.min .. " футов"
        elseif restrictions.max then
            result = result .. ", высота ниже " .. restrictions.max .. " футов"
        end
    end
    
    local speedRestriction = ATC_Procedures.getSpeedRestrictions(procedure, procedureType, nextWaypoint.name)
    if speedRestriction then
        result = result .. ", скорость " .. speedRestriction .. " узлов"
    end
    
    return result
end

return ATC_Procedures
