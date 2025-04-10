--[[
ATC_MonitoringManager.lua
Модуль для мониторинга исполнения процедур для универсального ATC модуля
Автор: Andrey Iskrich
Дата: Апрель 2025
--]]

local ATC_MonitoringManager = {}

-- Настройки мониторинга
ATC_MonitoringManager.settings = {
    enabled = true,
    lateralDeviationThreshold = 1.0,  -- Порог бокового отклонения в морских милях
    verticalDeviationThreshold = 500,  -- Порог вертикального отклонения в футах
    notificationInterval = 30  -- Интервал уведомлений в секундах
}

-- Таблица для хранения отслеживаемых объектов
ATC_MonitoringManager.trackedObjects = {}

-- Таблица для хранения последних уведомлений
ATC_MonitoringManager.lastNotifications = {}

-- Логирование
ATC_MonitoringManager.log = function(message)
    if ATC_Config and ATC_Config.DEBUG then
        env.info("[ATC_MonitoringManager] " .. message)
    end
end

-- Инициализация модуля
ATC_MonitoringManager.init = function()
    ATC_MonitoringManager.log("Инициализация модуля мониторинга")
    
    -- Загрузка настроек из конфигурации
    if ATC_Config and ATC_Config.MONITORING then
        ATC_MonitoringManager.settings.enabled = ATC_Config.MONITORING.ENABLED
        ATC_MonitoringManager.settings.lateralDeviationThreshold = ATC_Config.MONITORING.LATERAL_DEVIATION_THRESHOLD
        ATC_MonitoringManager.settings.verticalDeviationThreshold = ATC_Config.MONITORING.VERTICAL_DEVIATION_THRESHOLD
        ATC_MonitoringManager.settings.notificationInterval = ATC_Config.MONITORING.NOTIFICATION_INTERVAL
    end
    
    -- Проверка, включен ли мониторинг
    if not ATC_MonitoringManager.settings.enabled then
        ATC_MonitoringManager.log("Мониторинг отключен в настройках")
        return false
    end
    
    -- Запуск планировщика для регулярной проверки отклонений
    ATC_MonitoringManager.startScheduler()
    
    return true
end

-- Запуск планировщика для регулярной проверки отклонений
ATC_MonitoringManager.startScheduler = function()
    ATC_MonitoringManager.log("Запуск планировщика мониторинга")
    
    -- Создание планировщика с интервалом 5 секунд
    mist.scheduleFunction(ATC_MonitoringManager.checkAllDeviations, {}, timer.getTime() + 5, 5)
end

-- Добавление объекта для отслеживания
ATC_MonitoringManager.trackObject = function(object, procedure, procedureType, atcService)
    if not object or not procedure or not procedureType or not atcService then
        return false
    end
    
    local objectID = object:GetID()
    
    -- Проверка, отслеживается ли уже объект
    if ATC_MonitoringManager.trackedObjects[objectID] then
        ATC_MonitoringManager.log("Объект уже отслеживается: " .. objectID)
        
        -- Обновление данных отслеживания
        ATC_MonitoringManager.trackedObjects[objectID] = {
            object = object,
            procedure = procedure,
            procedureType = procedureType,
            atcService = atcService,
            startTime = timer.getTime(),
            lastCheckTime = 0,
            deviations = {}
        }
        
        ATC_MonitoringManager.log("Обновлены данные отслеживания для объекта: " .. objectID)
        return true
    end
    
    -- Добавление объекта для отслеживания
    ATC_MonitoringManager.trackedObjects[objectID] = {
        object = object,
        procedure = procedure,
        procedureType = procedureType,
        atcService = atcService,
        startTime = timer.getTime(),
        lastCheckTime = 0,
        deviations = {}
    }
    
    ATC_MonitoringManager.log("Добавлен объект для отслеживания: " .. objectID)
    return true
end

-- Прекращение отслеживания объекта
ATC_MonitoringManager.stopTrackingObject = function(object)
    if not object then
        return false
    end
    
    local objectID = object:GetID()
    
    -- Проверка, отслеживается ли объект
    if not ATC_MonitoringManager.trackedObjects[objectID] then
        ATC_MonitoringManager.log("Объект не отслеживается: " .. objectID)
        return false
    end
    
    -- Удаление объекта из отслеживаемых
    ATC_MonitoringManager.trackedObjects[objectID] = nil
    ATC_MonitoringManager.lastNotifications[objectID] = nil
    
    ATC_MonitoringManager.log("Прекращено отслеживание объекта: " .. objectID)
    return true
end

-- Проверка отклонений для всех отслеживаемых объектов
ATC_MonitoringManager.checkAllDeviations = function()
    if not ATC_MonitoringManager.settings.enabled then
        return
    end
    
    local currentTime = timer.getTime()
    
    for objectID, trackData in pairs(ATC_MonitoringManager.trackedObjects) do
        -- Проверка, существует ли еще объект
        if not trackData.object or not trackData.object:isExist() then
            ATC_MonitoringManager.log("Объект больше не существует, прекращение отслеживания: " .. objectID)
            ATC_MonitoringManager.trackedObjects[objectID] = nil
            ATC_MonitoringManager.lastNotifications[objectID] = nil
        else
            -- Проверка отклонений
            ATC_MonitoringManager.checkObjectDeviations(objectID, trackData, currentTime)
        end
    end
end

-- Проверка отклонений для конкретного объекта
ATC_MonitoringManager.checkObjectDeviations = function(objectID, trackData, currentTime)
    local object = trackData.object
    local procedure = trackData.procedure
    local procedureType = trackData.procedureType
    
    -- Получение текущей позиции объекта
    local objectCoord = object:GetCoordinate()
    local objectAltitude = ATC_Utils.getAltitude(object)
    
    -- Получение ближайшей точки процедуры
    local nearestWaypoint = ATC_Procedures.getNearestProcedureWaypoint(object, procedure, procedureType)
    
    if not nearestWaypoint then
        return
    end
    
    -- Получение следующей точки процедуры
    local nextWaypoint = ATC_Procedures.getNextProcedureWaypoint(procedure, procedureType, nearestWaypoint.name)
    
    -- Проверка бокового отклонения
    local lateralDeviation = ATC_MonitoringManager.checkLateralDeviation(object, nearestWaypoint, nextWaypoint)
    
    -- Проверка вертикального отклонения
    local verticalDeviation = ATC_MonitoringManager.checkVerticalDeviation(object, procedure, procedureType, nearestWaypoint.name)
    
    -- Проверка отклонения по скорости
    local speedDeviation = ATC_MonitoringManager.checkSpeedDeviation(object, procedure, procedureType, nearestWaypoint.name)
    
    -- Обработка обнаруженных отклонений
    if lateralDeviation or verticalDeviation or speedDeviation then
        -- Добавление отклонения в историю
        table.insert(trackData.deviations, {
            time = currentTime,
            lateral = lateralDeviation,
            vertical = verticalDeviation,
            speed = speedDeviation,
            waypoint = nearestWaypoint.name
        })
        
        -- Проверка, нужно ли отправлять уведомление
        local shouldNotify = ATC_MonitoringManager.shouldSendNotification(objectID, currentTime)
        
        if shouldNotify then
            -- Отправка уведомления
            ATC_MonitoringManager.sendDeviationNotification(object, trackData.atcService, lateralDeviation, verticalDeviation, speedDeviation, nearestWaypoint.name)
            
            -- Обновление времени последнего уведомления
            ATC_MonitoringManager.lastNotifications[objectID] = currentTime
        end
    end
end

-- Проверка бокового отклонения
ATC_MonitoringManager.checkLateralDeviation = function(object, nearestWaypoint, nextWaypoint)
    if not object or not nearestWaypoint then
        return nil
    end
    
    local objectCoord = object:GetCoordinate()
    local waypointCoord = COORDINATE:NewFromLLDD(nearestWaypoint.waypointData.lat, nearestWaypoint.waypointData.lon)
    
    -- Если нет следующей точки, просто проверяем расстояние до ближайшей
    if not nextWaypoint then
        local distance = ATC_Utils.getDistance(objectCoord, waypointCoord)
        
        if distance > ATC_MonitoringManager.settings.lateralDeviationThreshold then
            return {
                type = "waypoint",
                distance = distance,
                threshold = ATC_MonitoringManager.settings.lateralDeviationThreshold
            }
        end
        
        return nil
    end
    
    -- Если есть следующая точка, проверяем отклонение от линии между точками
    local nextWaypointCoord = COORDINATE:NewFromLLDD(nextWaypoint.waypointData.lat, nextWaypoint.waypointData.lon)
    
    -- Расчет отклонения от линии (упрощенный алгоритм)
    local totalDistance = ATC_Utils.getDistance(waypointCoord, nextWaypointCoord)
    local distanceToNearest = ATC_Utils.getDistance(objectCoord, waypointCoord)
    local distanceToNext = ATC_Utils.getDistance(objectCoord, nextWaypointCoord)
    
    -- Используем формулу Герона для расчета высоты треугольника
    local s = (totalDistance + distanceToNearest + distanceToNext) / 2
    local area = math.sqrt(s * (s - totalDistance) * (s - distanceToNearest) * (s - distanceToNext))
    local deviation = 2 * area / totalDistance
    
    if deviation > ATC_MonitoringManager.settings.lateralDeviationThreshold then
        return {
            type = "route",
            distance = deviation,
            threshold = ATC_MonitoringManager.settings.lateralDeviationThreshold
        }
    end
    
    return nil
end

-- Проверка вертикального отклонения
ATC_MonitoringManager.checkVerticalDeviation = function(object, procedure, procedureType, waypointName)
    if not object or not procedure or not procedureType or not waypointName then
        return nil
    end
    
    local restrictions = ATC_Procedures.getAltitudeRestrictions(procedure, procedureType, waypointName)
    if not restrictions then
        return nil
    end
    
    local altitude = ATC_Utils.getAltitude(object)
    
    if restrictions.min and altitude < restrictions.min - ATC_MonitoringManager.settings.verticalDeviationThreshold then
        return {
            type = "below",
            actual = altitude,
            required = restrictions.min,
            difference = restrictions.min - altitude,
            threshold = ATC_MonitoringManager.settings.verticalDeviationThreshold
        }
    end
    
    if restrictions.max and altitude > restrictions.max + ATC_MonitoringManager.settings.verticalDeviationThreshold then
        return {
            type = "above",
            actual = altitude,
            required = restrictions.max,
            difference = altitude - restrictions.max,
            threshold = ATC_MonitoringManager.settings.verticalDeviationThreshold
        }
    end
    
    return nil
end

-- Проверка отклонения по скорости
ATC_MonitoringManager.checkSpeedDeviation = function(object, procedure, procedureType, waypointName)
    if not object or not procedure or not procedureType or not waypointName then
        return nil
    end
    
    local restriction = ATC_Procedures.getSpeedRestrictions(procedure, procedureType, waypointName)
    if not restriction then
        return nil
    end
    
    local speed = ATC_Utils.getSpeed(object)
    
    if speed > restriction + 20 then  -- Допуск 20 узлов
        return {
            type = "overspeed",
            actual = speed,
            required = restriction,
            difference = speed - restriction,
            threshold = 20
        }
    end
    
    return nil
end

-- Проверка, нужно ли отправлять уведомление
ATC_MonitoringManager.shouldSendNotification = function(objectID, currentTime)
    -- Проверка, было ли уже отправлено уведомление для этого объекта
    if not ATC_MonitoringManager.lastNotifications[objectID] then
        return true
    end
    
    -- Проверка, прошло ли достаточно времени с момента последнего уведомления
    local timeSinceLastNotification = currentTime - ATC_MonitoringManager.lastNotifications[objectID]
    
    return timeSinceLastNotification >= ATC_MonitoringManager.settings.notificationInterval
end

-- Отправка уведомления об отклонении
ATC_MonitoringManager.sendDeviationNotification = function(object, atcService, lateralDeviation, verticalDeviation, speedDeviation, waypointName)
    if not object or not atcService then
        return
    end
    
    local playerName = ATC_Utils.getPlayerName(object)
    if not playerName then
        return
    end
    
    local callsign = object:GetCallsign() or "Aircraft"
    local message = callsign .. ", "
    
    -- Формирование сообщения в зависимости от типа отклонения
    if lateralDeviation then
        if lateralDeviation.type == "waypoint" then
            message = message .. "вы отклонились от маршрута. Расстояние до точки " .. waypointName .. " составляет " .. math.floor(lateralDeviation.distance) .. " миль."
        else
            message = message .. "вы отклонились от маршрута на " .. math.floor(lateralDeviation.distance) .. " миль. Вернитесь на маршрут через точку " .. waypointName .. "."
        end
    elseif verticalDeviation then
        if verticalDeviation.type == "below" then
            message = message .. "вы ниже требуемой высоты. Текущая высота " .. math.floor(verticalDeviation.actual) .. " футов, требуется минимум " .. verticalDeviation.required .. " футов."
        else
            message = message .. "вы выше максимальной высоты. Текущая высота " .. math.floor(verticalDeviation.actual) .. " футов, требуется максимум " .. verticalDeviation.required .. " футов."
        end
    elseif speedDeviation then
        message = message .. "превышение скорости. Текущая скорость " .. math.floor(speedDeviation.actual) .. " узлов, требуется максимум " .. speedDeviation.required .. " узлов."
    end
    
    -- Отправка сообщения через службу ATC
    atcService:sendMessage(object, message)
    
    ATC_MonitoringManager.log("Отправлено уведомление об отклонении для " .. callsign .. ": " .. message)
end

-- Получение статистики отклонений для объекта
ATC_MonitoringManager.getDeviationStats = function(object)
    if not object then
        return nil
    end
    
    local objectID = object:GetID()
    
    -- Проверка, отслеживается ли объект
    if not ATC_MonitoringManager.trackedObjects[objectID] then
        return nil
    end
    
    local trackData = ATC_MonitoringManager.trackedObjects[objectID]
    local stats = {
        totalDeviations = #trackData.deviations,
        lateralDeviations = 0,
        verticalDeviations = 0,
        speedDeviations = 0,
        deviationsByWaypoint = {}
    }
    
    -- Подсчет отклонений по типам
    for _, deviation in ipairs(trackData.deviations) do
        if deviation.lateral then
            stats.lateralDeviations = stats.lateralDeviations + 1
        end
        
        if deviation.vertical then
            stats.verticalDeviations = stats.verticalDeviations + 1
        end
        
        if deviation.speed then
            stats.speedDeviations = stats.speedDeviations + 1
        end
        
        -- Подсчет отклонений по точкам
        local waypoint = deviation.waypoint
        if not stats.deviationsByWaypoint[waypoint] then
            stats.deviationsByWaypoint[waypoint] = 0
        end
        
        stats.deviationsByWaypoint[waypoint] = stats.deviationsByWaypoint[waypoint] + 1
    end
    
    return stats
end

-- Оценка выполнения процедуры
ATC_MonitoringManager.evaluateProcedurePerformance = function(object)
    if not object then
        return nil
    end
    
    local objectID = object:GetID()
    
    -- Проверка, отслеживается ли объект
    if not ATC_MonitoringManager.trackedObjects[objectID] then
        return nil
    end
    
    local trackData = ATC_MonitoringManager.trackedObjects[objectID]
    local stats = ATC_MonitoringManager.getDeviationStats(object)
    
    if not stats then
        return nil
    end
    
    -- Расчет оценки выполнения процедуры (от 0 до 100)
    local score = 100
    
    -- Штраф за боковые отклонения
    if stats.totalDeviations > 0 then
        local lateralPenalty = stats.lateralDeviations * 5
        local verticalPenalty = stats.verticalDeviations * 10
        local speedPenalty = stats.speedDeviations * 3
        
        score = score - lateralPenalty - verticalPenalty - speedPenalty
    end
    
    -- Ограничение оценки от 0 до 100
    score = math.max(0, math.min(100, score))
    
    return {
        score = score,
        stats = stats,
        grade = ATC_MonitoringManager.getGradeFromScore(score)
    }
end

-- Получение оценки по шкале от A до F
ATC_MonitoringManager.getGradeFromScore = function(score)
    if score >= 90 then
        return "A"
    elseif score >= 80 then
        return "B"
    elseif score >= 70 then
        return "C"
    elseif score >= 60 then
        return "D"
    elseif score >= 50 then
        return "E"
    else
        return "F"
    end
end

-- Получение отчета о выполнении процедуры
ATC_MonitoringManager.getProcedureReport = function(object)
    if not object then
        return "Отчет недоступен"
    end
    
    local objectID = object:GetID()
    
    -- Проверка, отслеживается ли объект
    if not ATC_MonitoringManager.trackedObjects[objectID] then
        return "Отчет недоступен: объект не отслеживается"
    end
    
    local trackData = ATC_MonitoringManager.trackedObjects[objectID]
    local evaluation = ATC_MonitoringManager.evaluateProcedurePerformance(object)
    
    if not evaluation then
        return "Отчет недоступен: недостаточно данных"
    end
    
    local callsign = object:GetCallsign() or "Aircraft"
    local procedureType = trackData.procedureType
    local procedureName = trackData.procedure.name
    
    local report = "Отчет о выполнении процедуры для " .. callsign .. ":\n"
    report = report .. "Процедура: " .. procedureType .. " " .. procedureName .. "\n"
    report = report .. "Оценка: " .. evaluation.grade .. " (" .. evaluation.score .. " баллов)\n"
    report = report .. "Всего отклонений: " .. evaluation.stats.totalDeviations .. "\n"
    report = report .. "- Боковые отклонения: " .. evaluation.stats.lateralDeviations .. "\n"
    report = report .. "- Вертикальные отклонения: " .. evaluation.stats.verticalDeviations .. "\n"
    report = report .. "- Отклонения по скорости: " .. evaluation.stats.speedDeviations .. "\n"
    
    report = report .. "Отклонения по точкам:\n"
    for waypoint, count in pairs(evaluation.stats.deviationsByWaypoint) do
        report = report .. "- " .. waypoint .. ": " .. count .. "\n"
    end
    
    return report
end

return ATC_MonitoringManager
