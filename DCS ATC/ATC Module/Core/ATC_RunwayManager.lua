--[[
ATC_RunwayManager.lua
Модуль для управления состоянием ВПП и очередями на взлет/посадку
Автор: Manus AI
Дата: Апрель 2025
--]]

local ATC_RunwayManager = {}

-- Таблица для хранения состояния ВПП по аэропортам
ATC_RunwayManager.runwayStatus = {}

-- Инициализация менеджера ВПП для аэропорта
ATC_RunwayManager.initAirport = function(icao)
    if not icao then
        env.info("[ATC] Ошибка: не указан ICAO код аэропорта для инициализации менеджера ВПП")
        return false
    end
    
    env.info("[ATC] Инициализация менеджера ВПП для аэропорта " .. icao)
    
    -- Создаем запись для аэропорта, если её еще нет
    if not ATC_RunwayManager.runwayStatus[icao] then
        ATC_RunwayManager.runwayStatus[icao] = {}
    end
    
    return true
end

-- Инициализация ВПП для аэропорта
ATC_RunwayManager.initRunway = function(icao, runway)
    if not icao or not runway then
        env.info("[ATC] Ошибка: не указан ICAO код аэропорта или ВПП для инициализации")
        return false
    end
    
    -- Инициализируем аэропорт, если он еще не инициализирован
    if not ATC_RunwayManager.runwayStatus[icao] then
        ATC_RunwayManager.initAirport(icao)
    end
    
    -- Создаем запись для ВПП, если её еще нет
    if not ATC_RunwayManager.runwayStatus[icao][runway] then
        ATC_RunwayManager.runwayStatus[icao][runway] = {
            isClear = true,
            occupiedBy = nil,
            occupiedSince = nil,
            pendingLandings = {},
            pendingTakeoffs = {},
            lastClearTime = os.time()
        }
        
        env.info("[ATC] Инициализирована ВПП " .. runway .. " для аэропорта " .. icao)
    end
    
    return true
end

-- Проверка, свободна ли ВПП
ATC_RunwayManager.isRunwayClear = function(icao, runway)
    if not icao or not runway then
        return false
    end
    
    -- Проверяем, инициализирована ли ВПП
    if not ATC_RunwayManager.runwayStatus[icao] or not ATC_RunwayManager.runwayStatus[icao][runway] then
        ATC_RunwayManager.initRunway(icao, runway)
    end
    
    return ATC_RunwayManager.runwayStatus[icao][runway].isClear
end

-- Занятие ВПП объектом
ATC_RunwayManager.occupyRunway = function(icao, runway, object)
    if not icao or not runway or not object then
        return false
    end
    
    -- Проверяем, инициализирована ли ВПП
    if not ATC_RunwayManager.runwayStatus[icao] or not ATC_RunwayManager.runwayStatus[icao][runway] then
        ATC_RunwayManager.initRunway(icao, runway)
    end
    
    -- Занимаем ВПП
    ATC_RunwayManager.runwayStatus[icao][runway].isClear = false
    ATC_RunwayManager.runwayStatus[icao][runway].occupiedBy = object:GetID()
    ATC_RunwayManager.runwayStatus[icao][runway].occupiedSince = os.time()
    
    env.info("[ATC] ВПП " .. runway .. " аэропорта " .. icao .. " занята объектом " .. object:GetID())
    
    -- Запускаем таймер для автоматического освобождения ВПП через 3 минуты
    SCHEDULER:New(nil, 
        function() 
            ATC_RunwayManager.checkRunwayTimeout(icao, runway, object:GetID()) 
        end, 
        {}, 
        180 -- 3 минуты
    )
    
    return true
end

-- Освобождение ВПП
ATC_RunwayManager.clearRunway = function(icao, runway, objectId)
    if not icao or not runway then
        return false
    end
    
    -- Проверяем, инициализирована ли ВПП
    if not ATC_RunwayManager.runwayStatus[icao] or not ATC_RunwayManager.runwayStatus[icao][runway] then
        return false
    end
    
    -- Проверяем, занята ли ВПП указанным объектом
    if objectId and ATC_RunwayManager.runwayStatus[icao][runway].occupiedBy ~= objectId then
        env.info("[ATC] Попытка освободить ВПП " .. runway .. " аэропорта " .. icao .. " объектом, который её не занимал")
        return false
    end
    
    -- Освобождаем ВПП
    ATC_RunwayManager.runwayStatus[icao][runway].isClear = true
    ATC_RunwayManager.runwayStatus[icao][runway].occupiedBy = nil
    ATC_RunwayManager.runwayStatus[icao][runway].occupiedSince = nil
    ATC_RunwayManager.runwayStatus[icao][runway].lastClearTime = os.time()
    
    env.info("[ATC] ВПП " .. runway .. " аэропорта " .. icao .. " освобождена")
    
    return true
end

-- Проверка таймаута занятия ВПП
ATC_RunwayManager.checkRunwayTimeout = function(icao, runway, objectId)
    if not icao or not runway then
        return
    end
    
    -- Проверяем, инициализирована ли ВПП
    if not ATC_RunwayManager.runwayStatus[icao] or not ATC_RunwayManager.runwayStatus[icao][runway] then
        return
    end
    
    -- Проверяем, занята ли ВПП указанным объектом
    if ATC_RunwayManager.runwayStatus[icao][runway].occupiedBy ~= objectId then
        return
    end
    
    -- Проверяем время занятия ВПП
    local occupiedSince = ATC_RunwayManager.runwayStatus[icao][runway].occupiedSince
    if not occupiedSince then
        return
    end
    
    -- Если прошло более 3 минут, автоматически освобождаем ВПП
    if os.time() - occupiedSince > 180 then
        env.info("[ATC] Автоматическое освобождение ВПП " .. runway .. " аэропорта " .. icao .. " по таймауту")
        ATC_RunwayManager.clearRunway(icao, runway)
    end
end

-- Добавление объекта в очередь на посадку
ATC_RunwayManager.addToPendingLandings = function(icao, runway, object)
    if not icao or not runway or not object then
        return false
    end
    
    -- Проверяем, инициализирована ли ВПП
    if not ATC_RunwayManager.runwayStatus[icao] or not ATC_RunwayManager.runwayStatus[icao][runway] then
        ATC_RunwayManager.initRunway(icao, runway)
    end
    
    -- Добавляем объект в очередь на посадку
    table.insert(ATC_RunwayManager.runwayStatus[icao][runway].pendingLandings, object:GetID())
    
    env.info("[ATC] Объект " .. object:GetID() .. " добавлен в очередь на посадку на ВПП " .. runway .. " аэропорта " .. icao)
    
    return true
end

-- Добавление объекта в очередь на взлет
ATC_RunwayManager.addToPendingTakeoffs = function(icao, runway, object)
    if not icao or not runway or not object then
        return false
    end
    
    -- Проверяем, инициализирована ли ВПП
    if not ATC_RunwayManager.runwayStatus[icao] or not ATC_RunwayManager.runwayStatus[icao][runway] then
        ATC_RunwayManager.initRunway(icao, runway)
    end
    
    -- Добавляем объект в очередь на взлет
    table.insert(ATC_RunwayManager.runwayStatus[icao][runway].pendingTakeoffs, object:GetID())
    
    env.info("[ATC] Объект " .. object:GetID() .. " добавлен в очередь на взлет с ВПП " .. runway .. " аэропорта " .. icao)
    
    return true
end

-- Получение следующего объекта из очереди на посадку
ATC_RunwayManager.getNextPendingLanding = function(icao, runway)
    if not icao or not runway then
        return nil
    end
    
    -- Проверяем, инициализирована ли ВПП
    if not ATC_RunwayManager.runwayStatus[icao] or not ATC_RunwayManager.runwayStatus[icao][runway] then
        return nil
    end
    
    -- Проверяем, есть ли объекты в очереди на посадку
    if #ATC_RunwayManager.runwayStatus[icao][runway].pendingLandings == 0 then
        return nil
    end
    
    -- Получаем ID следующего объекта из очереди на посадку
    local objectId = table.remove(ATC_RunwayManager.runwayStatus[icao][runway].pendingLandings, 1)
    
    env.info("[ATC] Объект " .. objectId .. " извлечен из очереди на посадку на ВПП " .. runway .. " аэропорта " .. icao)
    
    return objectId
end

-- Получение следующего объекта из очереди на взлет
ATC_RunwayManager.getNextPendingTakeoff = function(icao, runway)
    if not icao or not runway then
        return nil
    end
    
    -- Проверяем, инициализирована ли ВПП
    if not ATC_RunwayManager.runwayStatus[icao] or not ATC_RunwayManager.runwayStatus[icao][runway] then
        return nil
    end
    
    -- Проверяем, есть ли объекты в очереди на взлет
    if #ATC_RunwayManager.runwayStatus[icao][runway].pendingTakeoffs == 0 then
        return nil
    end
    
    -- Получаем ID следующего объекта из очереди на взлет
    local objectId = table.remove(ATC_RunwayManager.runwayStatus[icao][runway].pendingTakeoffs, 1)
    
    env.info("[ATC] Объект " .. objectId .. " извлечен из очереди на взлет с ВПП " .. runway .. " аэропорта " .. icao)
    
    return objectId
end

-- Обработка очередей на взлет и посадку
ATC_RunwayManager.processQueues = function(icao, runway, towerService)
    if not icao or not runway or not towerService then
        return false
    end
    
    -- Проверяем, инициализирована ли ВПП
    if not ATC_RunwayManager.runwayStatus[icao] or not ATC_RunwayManager.runwayStatus[icao][runway] then
        return false
    end
    
    -- Проверяем, свободна ли ВПП
    if not ATC_RunwayManager.runwayStatus[icao][runway].isClear then
        return false
    end
    
    -- Приоритет отдаем посадкам
    local landingId = ATC_RunwayManager.getNextPendingLanding(icao, runway)
    if landingId then
        -- Ищем объект по ID
        local landingObject = nil
        
        -- Поиск объекта в отслеживаемых объектах Tower
        for id, data in pairs(towerService.trackedObjects) do
            if id == landingId and data.object:IsAlive() then
                landingObject = data.object
                break
            end
        end
        
        if landingObject then
            -- Получаем позывной объекта
            local callsign = landingObject:getCallsign() or "Aircraft"
            
            -- Отправляем разрешение на посадку
            towerService:sendMessage(landingObject, callsign .. ", ВПП " .. runway .. " свободна. Разрешаю посадку.")
            
            -- Занимаем ВПП
            ATC_RunwayManager.occupyRunway(icao, runway, landingObject)
            
            return true
        end
    end
    
    -- Если нет посадок, обрабатываем взлеты
    local takeoffId = ATC_RunwayManager.getNextPendingTakeoff(icao, runway)
    if takeoffId then
        -- Ищем объект по ID
        local takeoffObject = nil
        
        -- Поиск объекта в отслеживаемых объектах Tower
        for id, data in pairs(towerService.trackedObjects) do
            if id == takeoffId and data.object:IsAlive() then
                takeoffObject = data.object
                break
            end
        end
        
        if takeoffObject then
            -- Получаем позывной объекта
            local callsign = takeoffObject:getCallsign() or "Aircraft"
            
            -- Получение данных о погоде
            local serviceCoord = towerService:getCoordinate()
            local weather = ATC_Utils.getWeatherInfo(serviceCoord)
            
            -- Формирование информации о ветре
            local windInfo = ""
            if weather then
                windInfo = "Ветер " .. ATC_Utils.formatHeading(weather.windDirection) .. " градусов, " .. math.floor(weather.windSpeed) .. " узлов. "
            end
            
            -- Отправляем разрешение на взлет
            towerService:sendMessage(takeoffObject, callsign .. ", " .. windInfo .. "ВПП " .. runway .. " свободна. Разрешаю взлет.")
            
            -- Занимаем ВПП
            ATC_RunwayManager.occupyRunway(icao, runway, takeoffObject)
            
            return true
        end
    end
    
    return false
end

-- Интеграция с Tower службой
ATC_RunwayManager.integrateWithTower = function(towerService)
    if not towerService then
        env.info("[ATC] Ошибка: не указана служба Tower для интеграции с менеджером ВПП")
        return false
    end
    
    env.info("[ATC] Интеграция менеджера ВПП с Tower службой " .. towerService.callsign)
    
    -- Инициализируем аэропорт
    ATC_RunwayManager.initAirport(towerService.icao)
    
    -- Инициализируем все ВПП аэропорта
    for runway, _ in pairs(towerService.runways) do
        ATC_RunwayManager.initRunway(towerService.icao, runway)
    end
    
    -- Оригинальные обработчики
    local originalHandleTakeoffRequest = towerService.handleTakeoffRequest
    local originalHandleLandingRequest = towerService.handleLandingRequest
    local originalHandleVisualApproachRequest = towerService.handleVisualApproachRequest
    local originalHandleRunwayClear = towerService.handleRunwayClear
    local originalHandleReadyForTakeoff = towerService.handleReadyForTakeoff
    local originalHandleReadyForApproach = towerService.handleReadyForApproach
    local originalHandleRunwayInSight = towerService.handleRunwayInSight
    
    -- Переопределяем обработчик запроса на взлет
    towerService.handleTakeoffRequest = function(self, object)
        if not object then
            return false
        end
        
        -- Проверка коалиции объекта
        if not self:isObjectInCoalition(object) then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = ATC_Utils.getFlightPhase(object)
        
        -- Если объект не на земле, отказываем
        if flightPhase ~= "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос на взлет. Вы не на земле.")
            return true
        end
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Проверка состояния ВПП
        if not ATC_RunwayManager.isRunwayClear(self.icao, self.activeRunway) then
            -- Если ВПП занята, добавляем в очередь на взлет
            self:sendMessage(object, callsign .. ", ВПП " .. self.activeRunway .. " занята. Ожидайте разрешения на взлет.")
            ATC_RunwayManager.addToPendingTakeoffs(self.icao, self.activeRunway, object)
            return true
        end
        
        -- Если ВПП свободна, вызываем оригинальный обработчик
        local result = originalHandleTakeoffRequest(self, object)
        
        -- Занимаем ВПП
        if result then
            ATC_RunwayManager.occupyRunway(self.icao, self.activeRunway, object)
        end
        
        return result
    end
    
    -- Переопределяем обработчик запроса на посадку
    towerService.handleLandingRequest = function(self, object)
        if not object then
            return false
        end
        
        -- Проверка коалиции объекта
        if not self:isObjectInCoalition(object) then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = ATC_Utils.getFlightPhase(object)
        
        -- Если объект на земле, отказываем
        if flightPhase == "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос на посадку. Вы уже на земле.")
            return true
        end
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Проверка состояния ВПП
        if not ATC_RunwayManager.isRunwayClear(self.icao, self.activeRunway) then
            -- Если ВПП занята, разрешаем только заход
            self:sendMessage(object, callsign .. ", ВПП " .. self.activeRunway .. " занята. Разрешаю заход, посадку дополнительно.")
            ATC_RunwayManager.addToPendingLandings(self.icao, self.activeRunway, object)
            return true
        end
        
        -- Если ВПП свободна, вызываем оригинальный обработчик
        local result = originalHandleLandingRequest(self, object)
        
        -- Занимаем ВПП
        if result then
            ATC_RunwayManager.occupyRunway(self.icao, self.activeRunway, object)
        end
        
        return result
    end
    
    -- Переопределяем обработчик запроса на визуальный заход
    towerService.handleVisualApproachRequest = function(self, object)
        if not object then
            return false
        end
        
        -- Проверка коалиции объекта
        if not self:isObjectInCoalition(object) then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = ATC_Utils.getFlightPhase(object)
        
        -- Если объект на земле, отказываем
        if flightPhase == "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос на визуальный заход. Вы на земле.")
            return true
        end
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Получение данных о погоде
        local serviceCoord = self:getCoordinate()
        
        -- Проверка возможности выполнения визуального захода
        if not ATC_Utils.canPerformVisualApproach(serviceCoord) then
            self:sendMessage(object, callsign .. ", невозможно выполнить визуальный заход. Погодные условия не позволяют.")
            return true
        end
        
        -- Проверка дистанции для визуального захода
        local runwayData = self.runways[self.activeRunway]
        if not ATC_Utils.isInVisualApproachRange(object, runwayData) then
            self:sendMessage(object, callsign .. ", невозможно выполнить визуальный заход. Вы слишком далеко от аэродрома.")
            return true
        end
        
        -- Проверка состояния ВПП
        if not ATC_RunwayManager.isRunwayClear(self.icao, self.activeRunway) then
            -- Если ВПП занята, разрешаем только заход
            self:sendMessage(object, callsign .. ", ВПП " .. self.activeRunway .. " занята. Разрешаю визуальный заход, посадку дополнительно.")
            ATC_RunwayManager.addToPendingLandings(self.icao, self.activeRunway, object)
            return true
        end
        
        -- Если ВПП свободна, вызываем оригинальный обработчик
        local result = originalHandleVisualApproachRequest(self, object)
        
        -- Занимаем ВПП
        if result then
            ATC_RunwayManager.occupyRunway(self.icao, self.activeRunway, object)
        end
        
        return result
    end
    
    -- Переопределяем обработчик доклада "полосу освободил"
    towerService.handleRunwayClear = function(self, object)
        if not object then
            return false
        end
        
        -- Проверка коалиции объекта
        if not self:isObjectInCoalition(object) then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Формирование ответа
        local response = callsign .. ", вас понял, полоса свободна."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Освобождаем ВПП
        ATC_RunwayManager.clearRunway(self.icao, self.activeRunway, object:GetID())
        
        -- Обработка очередей
        ATC_RunwayManager.processQueues(self.icao, self.activeRunway, self)
        
        return true
    end
    
    -- Переопределяем обработчик доклада о готовности к взлету
    towerService.handleReadyForTakeoff = function(self, object)
        if not object then
            return false
        end
        
        -- Проверка коалиции объекта
        if not self:isObjectInCoalition(object) then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = ATC_Utils.getFlightPhase(object)
        
        -- Если объект не на земле, отказываем
        if flightPhase ~= "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос. Вы не на земле.")
            return true
        end
        
        -- Проверка состояния ВПП
        if not ATC_RunwayManager.isRunwayClear(self.icao, self.activeRunway) then
            -- Если ВПП занята, добавляем в очередь на взлет
            self:sendMessage(object, callsign .. ", ВПП " .. self.activeRunway .. " занята. Ожидайте разрешения на взлет.")
            ATC_RunwayManager.addToPendingTakeoffs(self.icao, self.activeRunway, object)
            return true
        end
        
        -- Если ВПП свободна, вызываем оригинальный обработчик
        local result = originalHandleReadyForTakeoff(self, object)
        
        -- Занимаем ВПП
        if result then
            ATC_RunwayManager.occupyRunway(self.icao, self.activeRunway, object)
        end
        
        return result
    end
    
    -- Переопределяем обработчик доклада о готовности к заходу
    towerService.handleReadyForApproach = function(self, object)
        if not object then
            return false
        end
        
        -- Проверка коалиции объекта
        if not self:isObjectInCoalition(object) then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = ATC_Utils.getFlightPhase(object)
        
        -- Если объект на земле, отказываем
        if flightPhase == "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос. Вы уже на земле.")
            return true
        end
        
        -- Проверка состояния ВПП
        if not ATC_RunwayManager.isRunwayClear(self.icao, self.activeRunway) then
            -- Если ВПП занята, разрешаем только заход
            self:sendMessage(object, callsign .. ", ВПП " .. self.activeRunway .. " занята. Разрешаю заход, посадку дополнительно.")
            ATC_RunwayManager.addToPendingLandings(self.icao, self.activeRunway, object)
            return true
        end
        
        -- Если ВПП свободна, вызываем оригинальный обработчик
        local result = originalHandleReadyForApproach(self, object)
        
        -- Занимаем ВПП
        if result then
            ATC_RunwayManager.occupyRunway(self.icao, self.activeRunway, object)
        end
        
        return result
    end
    
    -- Переопределяем обработчик доклада "полосу наблюдаю"
    towerService.handleRunwayInSight = function(self, object)
        if not object then
            return false
        end
        
        -- Проверка коалиции объекта
        if not self:isObjectInCoalition(object) then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = ATC_Utils.getFlightPhase(object)
        
        -- Если объект на земле, отказываем
        if flightPhase == "GROUND" then
            self:sendMessage(object, callsign .. ", вас понял.")
            return true
        end
        
        -- Проверка состояния ВПП
        if not ATC_RunwayManager.isRunwayClear(self.icao, self.activeRunway) then
            -- Если ВПП занята, разрешаем только заход
            self:sendMessage(object, callsign .. ", вас понял. ВПП " .. self.activeRunway .. " занята. Посадку дополнительно.")
            ATC_RunwayManager.addToPendingLandings(self.icao, self.activeRunway, object)
            return true
        end
        
        -- Если ВПП свободна, вызываем оригинальный обработчик
        local result = originalHandleRunwayInSight(self, object)
        
        -- Занимаем ВПП
        if result then
            ATC_RunwayManager.occupyRunway(self.icao, self.activeRunway, object)
        end
        
        return result
    end
    
    return true
end

return ATC_RunwayManager
