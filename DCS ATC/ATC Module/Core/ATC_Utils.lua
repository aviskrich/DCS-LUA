--[[
ATC_Utils.lua
Вспомогательные функции для универсального ATC модуля
Автор: Andrey Iskrich
Дата: Апрель 2025
--]]

local ATC_Utils = {}

-- Логирование
ATC_Utils.log = function(message)
    if ATC_Config and ATC_Config.DEBUG then
        env.info("[ATC_Utils] " .. message)
    end
end

-- Форматирование времени
ATC_Utils.formatTime = function(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = math.floor(seconds % 60)
    
    return string.format("%02d:%02d:%02d", hours, minutes, secs)
end

-- Форматирование высоты
ATC_Utils.formatAltitude = function(altitude, useMetric)
    if useMetric then
        return string.format("%d метров", math.floor(altitude))
    else
        return string.format("%d футов", math.floor(altitude))
    end
end

-- Форматирование скорости
ATC_Utils.formatSpeed = function(speed, useMetric)
    if useMetric then
        return string.format("%d км/ч", math.floor(speed))
    else
        return string.format("%d узлов", math.floor(speed))
    end
end

-- Форматирование курса
ATC_Utils.formatHeading = function(heading)
    return string.format("%03d", math.floor(heading))
end

-- Форматирование частоты
ATC_Utils.formatFrequency = function(frequency)
    return string.format("%.3f", frequency)
end

-- Получение позывного для службы ATC
ATC_Utils.getCallsign = function(icao, service)
    if not icao or not service then
        return "ATC"
    end
    
    return icao .. " " .. service
end

-- Получение расстояния между двумя координатами в морских милях
ATC_Utils.getDistance = function(coord1, coord2)
    if not coord1 or not coord2 then
        return 0
    end
    
    return coord1:Get2DDistance(coord2) / 1852
end

-- Получение курса от одной координаты к другой
ATC_Utils.getHeading = function(coord1, coord2)
    if not coord1 or not coord2 then
        return 0
    end
    
    return coord1:GetAngleDegrees(coord2)
end

-- Получение высоты объекта
ATC_Utils.getAltitude = function(object)
    if not object then
        return 0
    end
    
    if type(object) == "table" then
        return object:GetAltitude()
    end
    
    return 0
end

-- Получение скорости объекта в узлах
ATC_Utils.getSpeed = function(object)
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
ATC_Utils.getObjectHeading = function(object)
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
ATC_Utils.getAircraftType = function(object)
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
ATC_Utils.getPlayerName = function(object)
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
ATC_Utils.isPlayer = function(object)
    return ATC_Utils.getPlayerName(object) ~= nil
end

-- Получение ближайшей ВПП к координатам
ATC_Utils.getNearestRunway = function(coord, runways)
    if not coord or not runways then
        return nil
    end
    
    local nearestRunway = nil
    local minDistance = math.huge
    
    for name, runway in pairs(runways) do
        local thresholdCoord = COORDINATE:NewFromLLDD(runway.threshold.lat, runway.threshold.lon)
        local distance = ATC_Utils.getDistance(coord, thresholdCoord)
        
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
ATC_Utils.getNearestWaypoint = function(coord, waypoints, maxDistance)
    if not coord or not waypoints then
        return nil
    end
    
    maxDistance = maxDistance or math.huge
    
    local nearestWaypoint = nil
    local minDistance = math.huge
    
    for name, waypoint in pairs(waypoints) do
        local waypointCoord = COORDINATE:NewFromLLDD(waypoint.lat, waypoint.lon)
        local distance = ATC_Utils.getDistance(coord, waypointCoord)
        
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
ATC_Utils.getNearestProcedure = function(coord, procedures, procedureType, maxDistance)
    if not coord or not procedures then
        return nil
    end
    
    maxDistance = maxDistance or math.huge
    
    local nearestProcedure = nil
    local minDistance = math.huge
    
    for name, procedure in pairs(procedures) do
        if #procedure.waypoints > 0 then
            local firstWaypoint = procedure.waypoints[1]
            local waypointData = ATC_Navigraph.getWaypoint(firstWaypoint.name)
            
            if waypointData then
                local waypointCoord = COORDINATE:NewFromLLDD(waypointData.lat, waypointData.lon)
                local distance = ATC_Utils.getDistance(coord, waypointCoord)
                
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
ATC_Utils.getFlightPhase = function(object)
    if not object then
        return "UNKNOWN"
    end
    
    local altitude = ATC_Utils.getAltitude(object)
    local speed = ATC_Utils.getSpeed(object)
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
ATC_Utils.getWeatherInfo = function(coord)
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
ATC_Utils.formatWeatherInfo = function(weather)
    if not weather then
        return "Информация о погоде недоступна"
    end
    
    local result = "Погода: "
    
    -- Ветер
    result = result .. "Ветер " .. ATC_Utils.formatHeading(weather.windDirection) .. " градусов, " 
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
ATC_Utils.getATISInfo = function(icao)
    if not icao or not ATC_Navigraph.isDataLoaded then
        return "Информация ATIS недоступна"
    end
    
    local metadata = ATC_Navigraph.getAirportMetadata()
    if not metadata then
        return "Информация ATIS недоступна"
    end
    
    local airportName = metadata.Name
    local elevation = metadata.Elevation
    
    -- Получение координат аэропорта (используем первую ВПП)
    local runways = ATC_Navigraph.getAllRunways()
    local airportCoord = nil
    
    for name, runway in pairs(runways) do
        airportCoord = COORDINATE:NewFromLLDD(runway.threshold.lat, runway.threshold.lon)
        break
    end
    
    if not airportCoord then
        return "Информация ATIS недоступна"
    end
    
    -- Получение информации о погоде
    local weather = ATC_Utils.getWeatherInfo(airportCoord)
    local weatherInfo = ATC_Utils.formatWeatherInfo(weather)
    
    -- Определение активной ВПП на основе ветра
    local activeRunway = ATC_Utils.getActiveRunway(runways, weather.windDirection)
    
    -- Формирование информации ATIS
    local atisInfo = "Информация ATIS аэропорта " .. airportName .. " (" .. icao .. "). "
    atisInfo = atisInfo .. weatherInfo .. " "
    atisInfo = atisInfo .. "Активная ВПП " .. activeRunway .. ". "
    atisInfo = atisInfo .. "Высота аэродрома " .. math.floor(elevation) .. " футов."
    
    return atisInfo
end

-- Определение активной ВПП на основе направления ветра
ATC_Utils.getActiveRunway = function(runways, windDirection)
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
ATC_Utils.isInServiceRange = function(object, serviceCoord, range)
    if not object or not serviceCoord then
        return false
    end
    
    range = range or 50  -- По умолчанию 50 морских миль
    
    local objectCoord = object:GetCoordinate()
    local distance = ATC_Utils.getDistance(objectCoord, serviceCoord)
    
    return distance <= range
end

-- Получение списка объектов в зоне ответственности службы ATC
ATC_Utils.getObjectsInRange = function(serviceCoord, range, objectTypes)
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
ATC_Utils.getPlayersInRange = function(serviceCoord, range)
    if not serviceCoord then
        return {}
    end
    
    local objects = ATC_Utils.getObjectsInRange(serviceCoord, range)
    local players = {}
    
    for _, object in pairs(objects) do
        if ATC_Utils.isPlayer(object) then
            table.insert(players, object)
        end
    end
    
    return players
end

-- Получение списка AI в зоне ответственности службы ATC
ATC_Utils.getAIInRange = function(serviceCoord, range)
    if not serviceCoord then
        return {}
    end
    
    local objects = ATC_Utils.getObjectsInRange(serviceCoord, range)
    local aiObjects = {}
    
    for _, object in pairs(objects) do
        if not ATC_Utils.isPlayer(object) then
            table.insert(aiObjects, object)
        end
    end
    
    return aiObjects
end

-- Получение информации о трафике вокруг объекта
ATC_Utils.getTrafficInfo = function(object, range)
    if not object then
        return {}
    end
    
    range = range or 10  -- По умолчанию 10 морских миль
    
    local objectCoord = object:GetCoordinate()
    local objectAltitude = ATC_Utils.getAltitude(object)
    local objectHeading = ATC_Utils.getObjectHeading(object)
    
    local traffic = {}
    local objects = ATC_Utils.getObjectsInRange(objectCoord, range)
    
    for _, otherObject in pairs(objects) do
        if otherObject:GetID() ~= object:GetID() then
            local otherCoord = otherObject:GetCoordinate()
            local distance = ATC_Utils.getDistance(objectCoord, otherCoord)
            local bearing = ATC_Utils.getHeading(objectCoord, otherCoord)
            local relBearing = (bearing - objectHeading + 360) % 360
            local altDiff = ATC_Utils.getAltitude(otherObject) - objectAltitude
            
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
                type = ATC_Utils.getAircraftType(otherObject)
            })
        end
    end
    
    -- Сортировка по расстоянию
    table.sort(traffic, function(a, b) return a.distance < b.distance end)
    
    return traffic
end

-- Форматирование информации о трафике для передачи пилоту
ATC_Utils.formatTrafficInfo = function(traffic)
    if not traffic or #traffic == 0 then
        return "Трафик не обнаружен"
    end
    
    local result = ""
    
    for i, info in ipairs(traffic) do
        if i > 3 then break end  -- Ограничиваем до 3 ближайших объектов
        
        result = result .. "Трафик " .. info.position .. ", " .. info.altitude .. ", "
                        .. math.floor(info.distance) .. " миль, "
                        .. info.type .. ". "
    end
    
    return result
end

-- Получение информации о векторе для захода на посадку
ATC_Utils.getVectoringInfo = function(object, runwayData)
    if not object or not runwayData then
        return "Информация о векторе недоступна"
    end
    
    local objectCoord = object:GetCoordinate()
    local thresholdCoord = COORDINATE:NewFromLLDD(runwayData.threshold.lat, runwayData.threshold.lon)
    
    local distance = ATC_Utils.getDistance(objectCoord, thresholdCoord)
    local bearing = ATC_Utils.getHeading(objectCoord, thresholdCoord)
    local runwayHeading = runwayData.heading
    
    -- Расчет угла между текущим курсом и курсом ВПП
    local objectHeading = ATC_Utils.getObjectHeading(object)
    local headingDiff = math.abs((objectHeading - runwayHeading + 180) % 360 - 180)
    
    -- Формирование информации о векторе
    local result = "Для захода на ВПП " .. runwayData.name .. " "
    
    if headingDiff > 45 then
        -- Если самолет не направлен в сторону ВПП, даем вектор
        result = result .. "возьмите курс " .. ATC_Utils.formatHeading(runwayHeading) .. ". "
    else
        -- Если самолет уже примерно направлен в сторону ВПП, подтверждаем
        result = result .. "продолжайте текущим курсом. "
    end
    
    result = result .. "Расстояние до торца ВПП " .. math.floor(distance) .. " морских миль."
    
    return result
end

-- Получение длины таблицы
ATC_Utils.tableLength = function(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end

-- Получение коалиции объекта
ATC_Utils.getObjectCoalition = function(object)
    if not object then
        return nil
    end
    
    return object:getCoalition()
end

-- Проверка, принадлежит ли объект указанной коалиции
ATC_Utils.isObjectInCoalition = function(object, coalition)
    if not object or not coalition then
        return false
    end
    
    return ATC_Utils.getObjectCoalition(object) == coalition
end

return ATC_Utils
