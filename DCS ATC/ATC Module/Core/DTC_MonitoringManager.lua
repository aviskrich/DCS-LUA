--[[
DTC_MonitoringManager.lua
Модуль для мониторинга исполнения процедур для универсального ATC модуля
Автор: AVIskrich
Дата: Апрель 2025
--]]

local DTC_MonitoringManager = {}

-- Настройки мониторинга
DTC_MonitoringManager.settings = {
    enabled = true,
    lateralDeviationThreshold = 1.0,  -- Порог бокового отклонения в морских милях
    verticalDeviationThreshold = 500,  -- Порог вертикального отклонения в футах
    notificationInterval = 30  -- Интервал уведомлений в секундах
}

-- Таблица для хранения отслеживаемых объектов
DTC_MonitoringManager.trackedObjects = {}

-- Таблица для хранения последних уведомлений
DTC_MonitoringManager.lastNotifications = {}

-- Логирование
DTC_MonitoringManager.log = function(message)
    if DTC_Config and DTC_Config.DEBUG then
        env.info("[DTC_MonitoringManager] " .. message)
    end
end

-- Инициализация модуля
DTC_MonitoringManager.init = function()
    DTC_MonitoringManager.log("Инициализация модуля мониторинга")
    
    -- Загрузка настроек из конфигурации
    if DTC_Config and DTC_Config.MONITORING then
        DTC_MonitoringManager.settings.enabled = DTC_Config.MONITORING.ENABLED
        DTC_MonitoringManager.settings.lateralDeviationThreshold = DTC_Config.MONITORING.LATERAL_DEVIATION_THRESHOLD
        DTC_MonitoringManager.settings.verticalDeviationThreshold = DTC_Config.MONITORING.VERTICAL_DEVIATION_THRESHOLD
        DTC_MonitoringManager.settings.notificationInterval = DTC_Config.MONITORING.NOTIFICATION_INTERVAL
    end
    
    -- Проверка, включен ли мониторинг
    if not DTC_MonitoringManager.settings.enabled then
        DTC_MonitoringManager.log("Мониторинг отключен в настройках")
        return false
    end
    
    -- Запуск планировщика для регулярной проверки отклонений
    DTC_MonitoringManager.startScheduler()
    
    return true
end

-- Запуск планировщика для регулярной проверки отклонений
DTC_MonitoringManager.startScheduler = function()
    DTC_MonitoringManager.log("Запуск планировщика мониторинга")
    
    -- Создание планировщика с интервалом 5 секунд
    mist.scheduleFunction(DTC_MonitoringManager.checkAllDeviations, {}, timer.getTime() + 5, 5)
end

-- Добавление объекта для отслеживания
DTC_MonitoringManager.trackObject = function(object, procedure, procedureType, atcService)
    if not object or not procedure or not procedureType or not atcService then
        return false
    end
    
    local objectID = object:GetID()
    
    -- Проверка, отслеживается ли уже объект
    if DTC_MonitoringManager.trackedObjects[objectID] then
        DTC_MonitoringManager.log("Объект уже отслеживается: " .. objectID)
        
        -- Обновление данных отслеживания
        DTC_MonitoringManager.trackedObjects[objectID] = {
            object = object,
            procedure = procedure,
            procedureType = procedureType,
            atcService = atcService,
            startTime = timer.getTime(),
            lastCheckTime = 0,
            deviations = {}
        }
        
        DTC_MonitoringManager.log("Обновлены данные отслеживания для объекта: " .. objectID)
        return true
    end
    
    -- Добавление объекта для отслеживания
    DTC_MonitoringManager.trackedObjects[objectID] = {
        object = object,
        procedure = procedure,
        procedureType = procedureType,
        atcService = atcService,
        startTime = timer.getTime(),
        lastCheckTime = 0,
        deviations = {}
    }
    
    DTC_MonitoringManager.log("Добавлен объект для отслеживания: " .. objectID)
    return true
end

-- Прекращение отслеживания объекта
DTC_MonitoringManager.stopTrackingObject = function(object)
    if not object then
        return false
    end
    
    local objectID = object:GetID()
    
    -- Проверка, отслеживается ли объект
    if not DTC_MonitoringManager.trackedObjects[objectID] then
        DTC_MonitoringManager.log("Объект не отслеживается: " .. objectID)
        return false
    end
    
    -- Удаление объекта из отслеживаемых
    DTC_MonitoringManager.trackedObjects[objectID] = nil
    DTC_MonitoringManager.lastNotifications[objectID] = nil
    
    DTC_MonitoringManager.log("Прекращено отслеживание объекта: " .. objectID)
    return true
end

-- Проверка отклонений для всех отслеживаемых объектов
DTC_MonitoringManager.checkAllDeviations = function()
    if not DTC_MonitoringManager.settings.enabled then
        return
    end
    
    local currentTime = timer.getTime()
    
    for objectID, trackData in pairs(DTC_MonitoringManager.trackedObjects) do
        -- Проверка, существует ли еще объект
        if not trackData.object or not trackData.object:isExist() then
            DTC_MonitoringManager.log("Объект больше не существует, прекращение отслеживания: " .. objectID)
            DTC_MonitoringManager.trackedObjects[objectID] = nil
            DTC_MonitoringManager.lastNotifications[objectID] = nil
        else
            -- Проверка отклонений
            DTC_MonitoringManager.checkObjectDeviations(objectID, trackData, currentTime)
        end
    end
end

-- Проверка отклонений для конкретного объекта
DTC_MonitoringManager.checkObjectDeviations = function(objectID, trackData, currentTime)
    local object = trackData.object
    local procedure = trackData.procedure
    local procedureType = trackData.procedureType
    
    -- Получение текущей позиции объекта
    local objectCoord = object:GetCoordinate()
    local objectAltitude = DTC_Utils.getAltitude(object)
    
    -- Получение ближайшей точки процедуры
    local nearestWaypoint = DTC_Procedures.getNearestProcedureWaypoint(object, procedure, procedureType)
    
    if not nearestWaypoint then
        return
    end
    
    -- Получение следующей точки процедуры
    local nextWaypoint = DTC_Procedures.getNextProcedureWaypoint(procedure, procedureType, nearestWaypoint.name)
    
    -- Проверка бокового отклонения
    local lateralDeviation = DTC_MonitoringManager.checkLateralDeviation(object, nearestWaypoint, nextWaypoint)
    
    -- Проверка вертикального отклонения
    local verticalDeviation = DTC_MonitoringManager.checkVerticalDeviation(object, procedure, procedureType, nearestWaypoint.name)
    
    -- Проверка отклонения по скорости
    local speedDeviation = DTC_MonitoringManager.checkSpeedDeviation(object, procedure, procedureType, nearestWaypoint.name)
    
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
        local shouldNotify = DTC_MonitoringManager.shouldSendNotification(objectID, currentTime)
        
        if shouldNotify then
            -- Отправка уведомления
            DTC_MonitoringManager.sendDeviationNotification(object, trackData.atcService, lateralDeviation, verticalDeviation, speedDeviation, nearestWaypoint.name)
            
            -- Обновление времени последнего уведомления
            DTC_MonitoringManager.lastNotifications[objectID] = currentTime
        end
    end
end

-- Проверка бокового отклонения
DTC_MonitoringManager.checkLateralDeviation = function(object, nearestWaypoint, nextWaypoint)
    if not object or not nearestWaypoint then
        return nil
    end
    
    local objectCoord = object:GetCoordinate()
    local waypointCoord = COORDINATE:NewFromLLDD(nearestWaypoint.waypointData.lat, nearestWaypoint.waypointData.lon)
    
    -- Если нет следующей точки, просто проверяем расстояние до ближайшей
    if not nextWaypoint then
        local distance = DTC_Utils.getDistance(objectCoord, waypointCoord)
        
        if distance > DTC_MonitoringManager.settings.lateralDeviationThreshold then
            return {
                type = "waypoint",
                distance = distance,
                threshold = DTC_MonitoringManager.settings.lateralDeviationThreshold
            }
        end
        
        return nil
    end
    
    -- Если есть следующая точка, проверяем отклонение от линии между точками
    local nextWaypointCoord = COORDINATE:NewFromLLDD(nextWaypoint.waypointData.lat, nextWaypoint.waypointData.lon)
    
    -- Расчет отклонения от линии (упрощенный алгоритм)
    local totalDistance = DTC_Utils.getDistance(waypointCoord, nextWaypointCoord)
    local distanceToNearest = DTC_Utils.getDistance(objectCoord, waypointCoord)
    local distanceToNext = DTC_Utils.getDistance(objectCoord, nextWaypointCoord)
    
    -- Используем формулу Герона для расчета высоты треугольника
    local s = (totalDistance + distanceToNearest + distanceToNext) / 2
    local area = math.sqrt(s * (s - totalDistance) * (s - distanceToNearest) * (s - distanceToNext))
    local deviation = 2 * area / totalDistance
    
    if deviation > DTC_MonitoringManager.settings.lateralDeviationThreshold then
        return {
            type = "route",
            distance = deviation,
            threshold = DTC_MonitoringManager.settings.lateralDeviationThreshold
        }
    end
    
    return nil
end

-- Проверка вертикального отклонения
DTC_MonitoringManager.checkVerticalDeviation = function(object, procedure, procedureType, waypointName)
    if not object or not procedure or not procedureType or not waypointName then
        return nil
    end
    
    local restrictions = DTC_Procedures.getAltitudeRestrictions(procedure, procedureType, waypointName)
    if not restrictions then
        return nil
    end
    
    local altitude = DTC_Utils.getAltitude(object)
    
    if restrictions.min and altitude < restrictions.min - DTC_MonitoringManager.settings.verticalDeviationThreshold then
        return {
            type = "below",
            actual = altitude,
            required = restrictions.min,
            difference = restrictions.min - altitude,
            threshold = DTC_MonitoringManager.settings.verticalDeviationThreshold
        }
    end
    
    if restrictions.max and altitude > restrictions.max + DTC_MonitoringManager.settings.verticalDeviationThreshold then
        return {
            type = "above",
            actual = altitude,
            required = restrictions.max,
            difference = altitude - restrictions.max,
            threshold = DTC_MonitoringManager.settings.verticalDeviationThreshold
        }
    end
    
    return nil
end

-- Проверка отклонения по скорости
DTC_MonitoringManager.checkSpeedDeviation = function(object, procedure, procedureType, waypointName)
    if not object or not procedure or not procedureType or not waypointName then
        return nil
    end
    
    local restriction = DTC_Procedures.getSpeedRestrictions(procedure, procedureType, waypointName)
    if not restriction then
        return nil
    end
    
    local speed = DTC_Utils.getSpeed(object)
    
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
DTC_MonitoringManager.shouldSendNotification = function(objectID, currentTime)
    -- Проверка, было ли уже отправлено уведомление для этого объекта
    if not DTC_MonitoringManager.lastNotifications[objectID] then
        return true
    end
    
    -- Проверка, прошло ли достаточно времени с момента последнего уведомления
    local timeSinceLastNotification = currentTime - DTC_MonitoringManager.lastNotifications[objectID]
    
    return timeSinceLastNotification >= DTC_MonitoringManager.settings.notificationInterval
end

-- Отправка уведомления об отклонении
DTC_MonitoringManager.sendDeviationNotification = function(object, atcService, lateralDeviation, verticalDeviation, speedDeviation, waypointName)
    if not object or not atcService then
        return
    end
    
    local playerName = DTC_Utils.getPlayerName(object)
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
    
    DTC_MonitoringManager.log("Отправлено уведомление об отклонении для " .. callsign .. ": " .. message)
end

-- Получение статистики отклонений для объекта
DTC_MonitoringManager.getDeviationStats = function(object)
    if not object then
        return nil
    end
    
    local objectID = object:GetID()
    
    -- Проверка, отслеживается ли объект
    if not DTC_MonitoringManager.trackedObjects[objectID] then
        return nil
    end
    
    local trackData = DTC_MonitoringManager.trackedObjects[objectID]
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
DTC_MonitoringManager.evaluateProcedurePerformance = function(object)
    if not object then
        return nil
    end
    
    local objectID = object:GetID()
    
    -- Проверка, отслеживается ли объект
    if not DTC_MonitoringManager.trackedObjects[objectID] then
        return nil
    end
    
    local trackData = DTC_MonitoringManager.trackedObjects[objectID]
    local stats = DTC_MonitoringManager.getDeviationStats(object)
    
    if not stats then
        return nil
    end
    
    -- Расчет оценки выполнения процедуры (от 0 до 100)
    local score = 100
    
    -- Штраф за боковые отклонения
    if stats.totalDeviations > 0 then
        local lateralPenalty = stats.lateralDeviations * 5
        local verticalPenalty = stats.verticalDeviations * 5
        local speedPenalty = stats.speedDeviations * 3
        
        score = score - lateralPenalty - verticalPenalty - speedPenalty
    end
    
    -- Ограничение оценки минимумом 0
    score = math.max(0, score)
    
    -- Определение категории оценки
    local category = "Отлично"
    
    if score < 60 then
        category = "Неудовлетворительно"
    elseif score < 70 then
        category = "Удовлетворительно"
    elseif score < 85 then
        category = "Хорошо"
    elseif score < 95 then
        category = "Очень хорошо"
    end
    
    return {
        score = score,
        category = category,
        stats = stats
    }
end

-- Отправка оценки выполнения процедуры
DTC_MonitoringManager.sendPerformanceEvaluation = function(object, atcService)
    if not object or not atcService then
        return
    end
    
    local evaluation = DTC_MonitoringManager.evaluateProcedurePerformance(object)
    if not evaluation then
        return
    end
    
    local callsign = object:GetCallsign() or "Aircraft"
    local message = callsign .. ", оценка выполнения процедуры: " .. evaluation.category .. " (" .. evaluation.score .. " из 100 баллов)."
    
    -- Добавление деталей, если были отклонения
    if evaluation.stats.totalDeviations > 0 then
        message = message .. " Зафиксировано отклонений: " .. evaluation.stats.totalDeviations .. "."
        
        if evaluation.stats.lateralDeviations > 0 then
            message = message .. " Боковых: " .. evaluation.stats.lateralDeviations .. "."
        end
        
        if evaluation.stats.verticalDeviations > 0 then
            message = message .. " Вертикальных: " .. evaluation.stats.verticalDeviations .. "."
        end
        
        if evaluation.stats.speedDeviations > 0 then
            message = message .. " По скорости: " .. evaluation.stats.speedDeviations .. "."
        end
    else
        message = message .. " Отклонений не зафиксировано."
    end
    
    -- Отправка сообщения через службу ATC
    atcService:sendMessage(object, message)
    
    DTC_MonitoringManager.log("Отправлена оценка выполнения процедуры для " .. callsign .. ": " .. message)
    
    -- Прекращение отслеживания объекта
    DTC_MonitoringManager.stopTrackingObject(object)
    
    return evaluation
end

return DTC_MonitoringManager
