--[[
DTC_Utils.lua
Вспомогательные функции для универсального ATC модуля
Автор: AVIskrich
Дата: Апрель 2025
--]]

local DTC_Utils = {}

-- Логирование
DTC_Utils.log = function(message)
    if DTC_Config and DTC_Config.DEBUG then
        env.info("[DTC_Utils] " .. message)
    end
end

-- Форматирование времени
DTC_Utils.formatTime = function(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = math.floor(seconds % 60)
    
    return string.format("%02d:%02d:%02d", hours, minutes, secs)
end

-- Форматирование высоты
DTC_Utils.formatAltitude = function(altitude, useMetric)
    if useMetric then
        return string.format("%d метров", math.floor(altitude))
    else
        return string.format("%d футов", math.floor(altitude))
    end
end

-- Форматирование скорости
DTC_Utils.formatSpeed = function(speed, useMetric)
    if useMetric then
        return string.format("%d км/ч", math.floor(speed))
    else
        return string.format("%d узлов", math.floor(speed))
    end
end

-- Форматирование курса
DTC_Utils.formatHeading = function(heading)
    return string.format("%03d", math.floor(heading))
end

-- Форматирование частоты
DTC_Utils.formatFrequency = function(frequency)
    return string.format("%.3f", frequency)
end

-- Получение позывного для службы ATC
DTC_Utils.getCallsign = function(icao, service)
    if not icao or not service then
        return "ATC"
    end
    
    return icao .. " " .. service
end

-- Получение расстояния между двумя координатами в морских милях
DTC_Utils.getDistance = function(coord1, coord2)
    if not coord1 or not coord2 then
        return 0
    end
    
    return coord1:Get2DDistance(coord2) / 1852
end

-- Получение курса от одной координаты к другой
DTC_Utils.getHeading = function(coord1, coord2)
    if not coord1 or not coord2 then
        return 0
    end
    
    return coord1:GetAngleDegrees(coord2)
end

-- Получение высоты объекта
DTC_Utils.getAltitude = function(object)
    if not object then
        return 0
    end
    
    local point = object:GetPoint()
    if point then
        return point.y
    end
    
    return 0
end

-- Получение скорости объекта в узлах
DTC_Utils.getSpeed = function(object)
    if not object then
        return 0
    end
    
    local velocity = object:GetVelocity()
    if velocity then
        local speed = math.sqrt(velocity.x^2 + velocity.z^2)
        return speed * 3600 / 1852  -- Конвертация м/с в узлы
    end
    
    return 0
end

-- Получение курса объекта
DTC_Utils.getObjectHeading = function(object)
    if not object then
        return 0
    end
    
    local heading = object:GetHeading()
    if heading then
        return math.deg(heading)
    end
    
    return 0
end

-- Получение типа самолета
DTC_Utils.getAircraftType = function(object)
    if not object then
        return "Unknown"
    end
    
    local typeName = object:GetTypeName()
    if typeName then
        return typeName
    end
    
    return "Unknown"
end

-- Получение имени игрока
DTC_Utils.getPlayerName = function(object)
    if not object then
        return nil
    end
    
    local playerName = object:GetPlayerName()
    if playerName and playerName ~= "" then
        return playerName
    end
    
    return nil
end

-- Проверка, является ли объект игроком
DTC_Utils.isPlayer = function(object)
    return DTC_Utils.getPlayerName(object) ~= nil
end

-- Получение ближайшей ВПП к координатам
DTC_Utils.getNearestRunway = function(coord, runways)
    if not coord or not runways then
        return nil
    end
    
    local nearestRunway = nil
    local minDistance = math.huge
    
    for name, runway in pairs(runways) do
        local thresholdCoord = COORDINATE:NewFromLLDD(runway.threshold.lat, runway.threshold.lon)
        local distance = DTC_Utils.getDistance(coord, thresholdCoord)
        
        if distance < minDistance then
            minDistance = distance
            nearestRunway = {
                name = name,
                data = runway,
                distance = distance
            }
        end
    end
    
    return nearestRunway
end

-- Получение ближайшей путевой точки к координатам
DTC_Utils.getNearestWaypoint = function(coord, waypoints, maxDistance)
    if not coord or not waypoints then
        return nil
    end
    
    maxDistance = maxDistance or math.huge
    
    local nearestWaypoint = nil
    local minDistance = math.huge
    
    for name, waypoint in pairs(waypoints) do
        local waypointCoord = COORDINATE:NewFromLLDD(waypoint.lat, waypoint.lon)
        local distance = DTC_Utils.getDistance(coord, waypointCoord)
        
        if distance < minDistance and distance <= maxDistance then
            minDistance = distance
            nearestWaypoint = {
                name = name,
                data = waypoint,
                distance = distance
            }
        end
    end
    
    return nearestWaypoint
end

-- Получение ближайшей процедуры к координатам
DTC_Utils.getNearestProcedure = function(coord, procedures, procedureType, maxDistance)
    if not coord or not procedures then
        return nil
    end
    
    maxDistance = maxDistance or math.huge
    
    local nearestProcedure = nil
    local minDistance = math.huge
    
    for name, procedure in pairs(procedures) do
        if #procedure.waypoints > 0 then
            local firstWaypoint = procedure.waypoints[1]
            local waypointData = DTC_Navigraph.getWaypoint(firstWaypoint.name)
            
            if waypointData then
                local waypointCoord = COORDINATE:NewFromLLDD(waypointData.lat, waypointData.lon)
                local distance = DTC_Utils.getDistance(coord, waypointCoord)
                
                if distance < minDistance and distance <= maxDistance then
                    minDistance = distance
                    nearestProcedure = {
                        name = name,
                        data = procedure,
                        distance = distance
                    }
                end
            end
        end
    end
    
    return nearestProcedure
end

-- Получение текущей фазы полета объекта
DTC_Utils.getFlightPhase = function(object)
    if not object then
        return "UNKNOWN"
    end
    
    local altitude = DTC_Utils.getAltitude(object)
    local speed = DTC_Utils.getSpeed(object)
    local verticalSpeed = object:GetVelocityVec3().y * 196.85  -- Конвертация м/с в фут/мин
    
    -- Определение фазы полета на основе параметров
    if altitude < 50 and speed < 30 then
        return "GROUND"
    elseif altitude < 50 and speed >= 30 and verticalSpeed >= 0 then
        return "TAKEOFF"
    elseif verticalSpeed > 300 and altitude < 10000 then
        return "CLIMB"
    elseif verticalSpeed < -300 and altitude < 10000 then
        return "DESCENT"
    elseif math.abs(verticalSpeed) <= 300 and altitude > 10000 then
        return "CRUISE"
    elseif altitude < 3000 and math.abs(verticalSpeed) < 500 and speed < 250 then
        return "APPROACH"
    elseif altitude < 50 and verticalSpeed < -100 then
        return "LANDING"
    else
        return "UNKNOWN"
    end
end

-- Получение информации о погоде в районе координат
DTC_Utils.getWeatherInfo = function(coord)
    if not coord then
        return nil
    end
    
    local weather = {}
    
    -- Получение данных о ветре
    local windDirection, windStrength = coord:GetWind()
    weather.windDirection = windDirection
    weather.windSpeed = windStrength * 1.94384  -- Конвертация м/с в узлы
    
    -- Получение данных о температуре
    weather.temperature = coord:GetTemperature()
    
    -- Получение данных о давлении
    weather.pressure = coord:GetPressure() * 0.0295301  -- Конвертация Па в дюймы ртутного столба
    
    -- Получение данных об облачности
    local clouds = env.mission.weather.clouds
    if clouds then
        weather.cloudBase = clouds.base
        weather.cloudDensity = clouds.density
        weather.cloudThickness = clouds.thickness
    end
    
    -- Получение данных о видимости
    weather.visibility = env.mission.weather.visibility.distance
    
    return weather
end

-- Форматирование информации о погоде для передачи пилоту
DTC_Utils.formatWeatherInfo = function(weather)
    if not weather then
        return "Информация о погоде недоступна"
    end
    
    local result = "Погода: "
    
    -- Ветер
    result = result .. "Ветер " .. DTC_Utils.formatHeading(weather.windDirection) .. " градусов, " 
                    .. math.floor(weather.windSpeed) .. " узлов. "
    
    -- Видимость
    local visibilityKm = weather.visibility / 1000
    result = result .. "Видимость " .. math.floor(visibilityKm) .. " километров. "
    
    -- Облачность
    if weather.cloudBase then
        local cloudBaseMeters = weather.cloudBase
        result = result .. "Облачность " .. math.floor(cloudBaseMeters) .. " метров"
        
        if weather.cloudDensity then
            local density = ""
            if weather.cloudDensity < 3 then
                density = "редкая"
            elseif weather.cloudDensity < 7 then
                density = "средняя"
            else
                density = "плотная"
            end
            result = result .. ", " .. density
        end
        
        result = result .. ". "
    else
        result = result .. "Ясно. "
    end
    
    -- Температура и давление
    result = result .. "Температура " .. math.floor(weather.temperature) .. " градусов Цельсия. "
    result = result .. "QNH " .. string.format("%.2f", weather.pressure) .. " дюймов ртутного столба."
    
    return result
end

-- Получение информации ATIS для аэропорта
DTC_Utils.getATISInfo = function(icao)
    if not icao or not DTC_Navigraph.isDataLoaded then
        return "Информация ATIS недоступна"
    end
    
    local metadata = DTC_Navigraph.getAirportMetadata()
    if not metadata then
        return "Информация ATIS недоступна"
    end
    
    local airportName = metadata.Name
    local elevation = metadata.Elevation
    
    -- Получение координат аэропорта (используем первую ВПП)
    local runways = DTC_Navigraph.getAllRunways()
    local airportCoord = nil
    
    for name, runway in pairs(runways) do
        airportCoord = COORDINATE:NewFromLLDD(runway.threshold.lat, runway.threshold.lon)
        break
    end
    
    if not airportCoord then
        return "Информация ATIS недоступна"
    end
    
    -- Получение информации о погоде
    local weather = DTC_Utils.getWeatherInfo(airportCoord)
    local weatherInfo = DTC_Utils.formatWeatherInfo(weather)
    
    -- Определение активной ВПП на основе ветра
    local activeRunway = DTC_Utils.getActiveRunway(runways, weather.windDirection)
    
    -- Формирование информации ATIS
    local atisInfo = "Информация ATIS аэропорта " .. airportName .. " (" .. icao .. "). "
    atisInfo = atisInfo .. weatherInfo .. " "
    atisInfo = atisInfo .. "Активная ВПП " .. activeRunway .. ". "
    atisInfo = atisInfo .. "Высота аэродрома " .. math.floor(elevation) .. " футов."
    
    return atisInfo
end

-- Определение активной ВПП на основе направления ветра
DTC_Utils.getActiveRunway = function(runways, windDirection)
    if not runways or not windDirection then
        return nil
    end
    
    local bestRunway = nil
    local minWindComponent = math.huge
    
    for name, runway in pairs(runways) do
        local runwayHeading = runway.heading
        local headingDiff = math.abs((runwayHeading - windDirection + 180) % 360 - 180)
        
        if headingDiff < minWindComponent then
            minWindComponent = headingDiff
            bestRunway = name
        end
    end
    
    return bestRunway
end

-- Проверка, находится ли объект в зоне ответственности службы ATC
DTC_Utils.isInServiceRange = function(object, serviceCoord, range)
    if not object or not serviceCoord then
        return false
    end
    
    range = range or 50  -- По умолчанию 50 морских миль
    
    local objectCoord = object:GetCoordinate()
    local distance = DTC_Utils.getDistance(objectCoord, serviceCoord)
    
    return distance <= range
end

-- Получение списка объектов в зоне ответственности службы ATC
DTC_Utils.getObjectsInRange = function(serviceCoord, range, objectTypes)
    if not serviceCoord then
        return {}
    end
    
    range = range or 50  -- По умолчанию 50 морских миль
    objectTypes = objectTypes or {Object.Category.UNIT}
    
    local objects = {}
    local rangeInMeters = range * 1852
    
    -- Получение всех объектов в радиусе
    local volumeObjects = serviceCoord:ScanObjects(rangeInMeters, objectTypes)
    
    if volumeObjects then
        for _, object in pairs(volumeObjects) do
            if object:IsAlive() then
                table.insert(objects, object)
            end
        end
    end
    
    return objects
end

-- Получение списка игроков в зоне ответственности службы ATC
DTC_Utils.getPlayersInRange = function(serviceCoord, range)
    if not serviceCoord then
        return {}
    end
    
    local objects = DTC_Utils.getObjectsInRange(serviceCoord, range)
    local players = {}
    
    for _, object in pairs(objects) do
        if DTC_Utils.isPlayer(object) then
            table.insert(players, object)
        end
    end
    
    return players
end

-- Получение списка AI в зоне ответственности службы ATC
DTC_Utils.getAIInRange = function(serviceCoord, range)
    if not serviceCoord then
        return {}
    end
    
    local objects = DTC_Utils.getObjectsInRange(serviceCoord, range)
    local aiObjects = {}
    
    for _, object in pairs(objects) do
        if not DTC_Utils.isPlayer(object) then
            table.insert(aiObjects, object)
        end
    end
    
    return aiObjects
end

-- Получение информации о трафике вокруг объекта
DTC_Utils.getTrafficInfo = function(object, range)
    if not object then
        return {}
    end
    
    range = range or 10  -- По умолчанию 10 морских миль
    
    local objectCoord = object:GetCoordinate()
    local objectAltitude = DTC_Utils.getAltitude(object)
    local objectHeading = DTC_Utils.getObjectHeading(object)
    
    local traffic = {}
    local objects = DTC_Utils.getObjectsInRange(objectCoord, range)
    
    for _, otherObject in pairs(objects) do
        if otherObject:GetID() ~= object:GetID() then
            local otherCoord = otherObject:GetCoordinate()
            local distance = DTC_Utils.getDistance(objectCoord, otherCoord)
            local bearing = DTC_Utils.getHeading(objectCoord, otherCoord)
            local relBearing = (bearing - objectHeading + 360) % 360
            local altDiff = DTC_Utils.getAltitude(otherObject) - objectAltitude
            
            -- Определение позиции относительно объекта
            local position = ""
            if relBearing >= 315 or relBearing < 45 then
                position = "впереди"
            elseif relBearing >= 45 and relBearing < 135 then
                position = "справа"
            elseif relBearing >= 135 and relBearing < 225 then
                position = "сзади"
            else
                position = "слева"
            end
            
            -- Определение высоты относительно объекта
            local altitude = ""
            if math.abs(altDiff) < 500 then
                altitude = "на вашей высоте"
            elseif altDiff > 0 then
                altitude = "выше вас"
            else
                altitude = "ниже вас"
            end
            
            table.insert(traffic, {
                object = otherObject,
                distance = distance,
                bearing = bearing,
                relBearing = relBearing,
                altDiff = altDiff,
                position = position,
                altitude = altitude,
                type = DTC_Utils.getAircraftType(otherObject)
            })
        end
    end
    
    -- Сортировка по расстоянию
    table.sort(traffic, function(a, b) return a.distance < b.distance end)
    
    return traffic
end

-- Форматирование информации о трафике для передачи пилоту
DTC_Utils.formatTrafficInfo = function(traffic)
    if not traffic or #traffic == 0 then
        return "Трафик отсутствует"
    end
    
    local result = "Информация о трафике: "
    
    for i, info in ipairs(traffic) do
        if i <= 3 then  -- Ограничиваем до 3 ближайших объектов
            result = result .. "Трафик " .. info.position .. ", " 
                            .. math.floor(info.distance) .. " миль, "
                            .. info.altitude .. ", "
                            .. info.type .. ". "
        end
    end
    
    return result
end

-- Получение информации о маршруте для процедуры
DTC_Utils.getRouteInfo = function(procedure, procedureType)
    if not procedure or not procedureType then
        return "Информация о маршруте недоступна"
    end
    
    local result = ""
    
    if procedureType == "SID" then
        result = "Маршрут вылета " .. procedure.name .. " с ВПП " .. procedure.runway .. ": "
    elseif procedureType == "STAR" then
        result = "Маршрут прибытия " .. procedure.name .. " для ВПП " .. procedure.runway .. ": "
    elseif procedureType == "APPROACH" then
        result = "Маршрут захода " .. procedure.name .. " на ВПП " .. procedure.runway .. ": "
    end
    
    -- Добавление путевых точек
    for i, wp in ipairs(procedure.waypoints) do
        result = result .. wp.name
        
        -- Добавление ограничений по высоте
        if wp.altitude_min and wp.altitude_max then
            result = result .. " (от " .. wp.altitude_min .. " до " .. wp.altitude_max .. " футов)"
        elseif wp.altitude_min then
            result = result .. " (минимум " .. wp.altitude_min .. " футов)"
        elseif wp.altitude_max then
            result = result .. " (максимум " .. wp.altitude_max .. " футов)"
        end
        
        -- Добавление ограничений по скорости
        if wp.speed then
            result = result .. " [" .. wp.speed .. " узлов]"
        end
        
        -- Разделитель между точками
        if i < #procedure.waypoints then
            result = result .. " - "
        end
    end
    
    return result
end

-- Получение информации о векторении для захода на посадку
DTC_Utils.getVectoringInfo = function(object, runway)
    if not object or not runway then
        return "Информация о векторении недоступна"
    end
    
    local objectCoord = object:GetCoordinate()
    local runwayThresholdCoord = COORDINATE:NewFromLLDD(runway.threshold.lat, runway.threshold.lon)
    
    local distance = DTC_Utils.getDistance(objectCoord, runwayThresholdCoord)
    local bearing = DTC_Utils.getHeading(objectCoord, runwayThresholdCoord)
    local headingToFinal = (runway.heading + 180) % 360  -- Курс для захода на посадку
    
    -- Расчет угла между текущим направлением на ВПП и курсом захода
    local interceptAngle = math.abs((bearing - headingToFinal + 180) % 360 - 180)
    
    -- Определение рекомендуемого курса для выхода на посадочную прямую
    local recommendedHeading = 0
    
    if interceptAngle <= 20 then
        -- Если угол перехвата небольшой, рекомендуем прямой заход
        recommendedHeading = headingToFinal
    else
        -- Иначе рекомендуем курс с углом перехвата 30 градусов
        local direction = 1
        if (bearing - headingToFinal + 360) % 360 < 180 then
            direction = -1
        end
        
        recommendedHeading = (headingToFinal + direction * 30 + 360) % 360
    end
    
    -- Формирование информации о векторении
    local result = "Векторение для захода на ВПП " .. runway.name .. ": "
    result = result .. "Расстояние до порога ВПП " .. math.floor(distance) .. " миль. "
    result = result .. "Рекомендуемый курс " .. DTC_Utils.formatHeading(recommendedHeading) .. " градусов. "
    result = result .. "Курс посадки " .. DTC_Utils.formatHeading(runway.heading) .. " градусов."
    
    return result
end

return DTC_Utils
