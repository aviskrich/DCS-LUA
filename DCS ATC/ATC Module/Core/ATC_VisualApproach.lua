--[[
ATC_VisualApproach.lua
Модуль для обработки визуальных заходов на посадку
Автор: Manus AI
Дата: Апрель 2025
--]]

local ATC_VisualApproach = {}

-- Максимальная дистанция для визуального захода (в морских милях)
ATC_VisualApproach.MAX_VISUAL_APPROACH_DISTANCE = 5

-- Минимальная видимость для визуального захода (в метрах)
ATC_VisualApproach.MIN_VISIBILITY = 5000

-- Максимальная облачность для визуального захода (в процентах)
ATC_VisualApproach.MAX_CLOUD_DENSITY = 50

-- Проверка возможности выполнения визуального захода по погодным условиям
ATC_VisualApproach.checkWeatherConditions = function(coordinate)
    if not coordinate then
        return false
    end
    
    -- Получение данных о погоде
    local weather = ATC_Utils.getWeatherInfo(coordinate)
    if not weather then
        return false
    end
    
    -- Проверка видимости
    if weather.visibility < ATC_VisualApproach.MIN_VISIBILITY then
        return false
    end
    
    -- Проверка облачности
    if weather.cloudDensity > ATC_VisualApproach.MAX_CLOUD_DENSITY then
        return false
    end
    
    return true
end

-- Проверка дистанции для визуального захода
ATC_VisualApproach.checkDistance = function(object, runwayData)
    if not object or not runwayData then
        return false
    end
    
    -- Получение координат объекта
    local objectCoord = object:GetCoordinate()
    if not objectCoord then
        return false
    end
    
    -- Получение координат ВПП
    local runwayCoord = COORDINATE:New(runwayData.latitude, runwayData.longitude, runwayData.altitude)
    if not runwayCoord then
        return false
    end
    
    -- Расчет дистанции
    local distance = objectCoord:Get2DDistance(runwayCoord) / 1852 -- переводим метры в морские мили
    
    -- Проверка дистанции
    return distance <= ATC_VisualApproach.MAX_VISUAL_APPROACH_DISTANCE
end

-- Получение положения ВПП на "часах"
ATC_VisualApproach.getRunwayClockPosition = function(object, runwayData)
    if not object or not runwayData then
        return "Полоса не видна"
    end
    
    -- Получение координат объекта
    local objectCoord = object:GetCoordinate()
    if not objectCoord then
        return "Полоса не видна"
    end
    
    -- Получение координат ВПП
    local runwayCoord = COORDINATE:New(runwayData.latitude, runwayData.longitude, runwayData.altitude)
    if not runwayCoord then
        return "Полоса не видна"
    end
    
    -- Получение курса объекта
    local objectHeading = object:GetHeading()
    
    -- Расчет направления на ВПП
    local bearingToRunway = objectCoord:GetAngleDegrees(runwayCoord)
    
    -- Расчет относительного положения ВПП
    local relativeBearing = (bearingToRunway - objectHeading) % 360
    
    -- Преобразование в положение на "часах"
    local clockPosition = math.floor(relativeBearing / 30) + 12
    if clockPosition > 12 then
        clockPosition = clockPosition - 12
    end
    
    -- Формирование ответа
    return "Полоса на " .. clockPosition .. " часах"
end

-- Обработка запроса на визуальный заход
ATC_VisualApproach.handleRequest = function(towerService, object)
    if not towerService or not object then
        return false, "Недостаточно данных для обработки запроса"
    end
    
    -- Получение позывного объекта
    local callsign = object:getCallsign() or "Aircraft"
    
    -- Определение фазы полета
    local flightPhase = ATC_Utils.getFlightPhase(object)
    
    -- Если объект на земле, отказываем
    if flightPhase == "GROUND" then
        return false, callsign .. ", невозможно выполнить запрос на визуальный заход. Вы на земле."
    end
    
    -- Получение данных о погоде
    local serviceCoord = towerService:getCoordinate()
    
    -- Проверка возможности выполнения визуального захода
    if not ATC_VisualApproach.checkWeatherConditions(serviceCoord) then
        return false, callsign .. ", невозможно выполнить визуальный заход. Погодные условия не позволяют."
    end
    
    -- Получение данных о ВПП
    local runwayData = towerService.runways[towerService.activeRunway]
    if not runwayData then
        return false, callsign .. ", невозможно выполнить визуальный заход. Данные о ВПП отсутствуют."
    end
    
    -- Проверка дистанции для визуального захода
    if not ATC_VisualApproach.checkDistance(object, runwayData) then
        return false, callsign .. ", невозможно выполнить визуальный заход. Вы слишком далеко от аэродрома."
    end
    
    -- Проверка состояния ВПП
    local runwayManager = require("Scripts.ATC_Module.Core.ATC_RunwayManager")
    if not runwayManager.isRunwayClear(towerService.icao, towerService.activeRunway) then
        -- Если ВПП занята, разрешаем только заход
        runwayManager.addToPendingLandings(towerService.icao, towerService.activeRunway, object)
        return false, callsign .. ", ВПП " .. towerService.activeRunway .. " занята. Разрешаю визуальный заход, посадку дополнительно."
    end
    
    -- Получение положения ВПП на "часах"
    local clockPosition = ATC_VisualApproach.getRunwayClockPosition(object, runwayData)
    
    -- Формирование ответа
    local response = callsign .. ", разрешаю визуальный заход и посадку на ВПП " .. towerService.activeRunway .. ". " .. clockPosition
    
    -- Занимаем ВПП
    runwayManager.occupyRunway(towerService.icao, towerService.activeRunway, object)
    
    return true, response
end

-- Обработка доклада "полосу наблюдаю"
ATC_VisualApproach.handleRunwayInSight = function(towerService, object)
    if not towerService or not object then
        return false, "Недостаточно данных для обработки доклада"
    end
    
    -- Получение позывного объекта
    local callsign = object:getCallsign() or "Aircraft"
    
    -- Определение фазы полета
    local flightPhase = ATC_Utils.getFlightPhase(object)
    
    -- Если объект на земле, отказываем
    if flightPhase == "GROUND" then
        return false, callsign .. ", вас понял."
    end
    
    -- Проверка состояния ВПП
    local runwayManager = require("Scripts.ATC_Module.Core.ATC_RunwayManager")
    if not runwayManager.isRunwayClear(towerService.icao, towerService.activeRunway) then
        -- Если ВПП занята, разрешаем только заход
        runwayManager.addToPendingLandings(towerService.icao, towerService.activeRunway, object)
        return false, callsign .. ", вас понял. ВПП " .. towerService.activeRunway .. " занята. Посадку дополнительно."
    end
    
    -- Формирование ответа
    local response = callsign .. ", вас понял. Разрешаю посадку на ВПП " .. towerService.activeRunway .. "."
    
    -- Занимаем ВПП
    runwayManager.occupyRunway(towerService.icao, towerService.activeRunway, object)
    
    return true, response
end

-- Интеграция с Tower службой
ATC_VisualApproach.integrateWithTower = function(towerService)
    if not towerService then
        env.info("[ATC] Ошибка: не указана служба Tower для интеграции с модулем визуальных заходов")
        return false
    end
    
    env.info("[ATC] Интеграция модуля визуальных заходов с Tower службой " .. towerService.callsign)
    
    -- Оригинальные обработчики
    local originalHandleVisualApproachRequest = towerService.handleVisualApproachRequest
    local originalHandleRunwayInSight = towerService.handleRunwayInSight
    
    -- Переопределяем обработчик запроса на визуальный заход
    towerService.handleVisualApproachRequest = function(self, object)
        -- Используем модуль визуальных заходов для обработки запроса
        local success, message = ATC_VisualApproach.handleRequest(self, object)
        
        -- Отправляем сообщение
        if message then
            self:sendMessage(object, message)
        end
        
        return success
    end
    
    -- Переопределяем обработчик доклада "полосу наблюдаю"
    towerService.handleRunwayInSight = function(self, object)
        -- Используем модуль визуальных заходов для обработки доклада
        local success, message = ATC_VisualApproach.handleRunwayInSight(self, object)
        
        -- Отправляем сообщение
        if message then
            self:sendMessage(object, message)
        end
        
        return success
    end
    
    return true
end

return ATC_VisualApproach
