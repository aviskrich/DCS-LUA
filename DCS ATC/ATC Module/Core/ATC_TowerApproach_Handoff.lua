--[[
ATC_TowerApproach_Handoff.lua
Модуль для обеспечения передачи управления между службами Tower и Approach
Автор: Manus AI
Дата: Апрель 2025
--]]

local ATC_TowerApproach_Handoff = {}

-- Инициализация модуля
ATC_TowerApproach_Handoff.init = function()
    env.info("[ATC] Инициализация модуля передачи управления Tower-Approach")
end

-- Регистрация пары служб Tower и Approach для одного аэропорта
ATC_TowerApproach_Handoff.registerServices = function(tower, approach)
    if not tower or not approach then
        env.info("[ATC] Ошибка: не удалось зарегистрировать службы для передачи управления")
        return false
    end
    
    env.info("[ATC] Регистрация служб " .. tower.callsign .. " и " .. approach.callsign .. " для передачи управления")
    
    -- Добавляем ссылки на службы друг к другу
    tower.approachService = approach
    approach.towerService = tower
    
    -- Добавляем обработчики для передачи управления
    ATC_TowerApproach_Handoff.setupHandoffHandlers(tower, approach)
    
    return true
end

-- Настройка обработчиков для передачи управления
ATC_TowerApproach_Handoff.setupHandoffHandlers = function(tower, approach)
    -- Оригинальные обработчики
    local originalTowerOnNewObject = tower.onNewObject
    local originalApproachOnNewObject = approach.onNewObject
    local originalTowerHandleOnFrequency = tower.handleOnFrequency
    local originalApproachHandleSwitchingToTower = approach.handleSwitchingToTower
    
    -- Переопределяем обработчик нового объекта для Tower
    tower.onNewObject = function(self, object)
        -- Вызываем оригинальный обработчик
        originalTowerOnNewObject(self, object)
        
        if not object then
            return
        end
        
        -- Проверка коалиции объекта
        if not self:isObjectInCoalition(object) then
            return
        end
        
        local playerName = ATC_Utils.getPlayerName(object)
        if not playerName then
            return
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = ATC_Utils.getFlightPhase(object)
        
        -- Если объект на подходе к аэродрому и находится на высоте перехода или ниже,
        -- информируем о необходимости перехода на частоту Tower
        if (flightPhase == "APPROACH" or flightPhase == "DESCENT") then
            -- Получение высоты объекта
            local altitude = object:GetAltitude()
            
            -- Получение высоты перехода для аэропорта
            local transitionAltitude = ATC_Utils.getTransitionAltitude(self.icao)
            
            if altitude <= transitionAltitude then
                -- Информируем Approach о необходимости передачи управления
                if self.approachService then
                    self.approachService:notifyTransferToTower(object)
                end
            end
        end
    end
    
    -- Переопределяем обработчик нового объекта для Approach
    approach.onNewObject = function(self, object)
        -- Вызываем оригинальный обработчик
        originalApproachOnNewObject(self, object)
        
        if not object then
            return
        end
        
        -- Проверка коалиции объекта
        if not self:isObjectInCoalition(object) then
            return
        end
        
        local playerName = ATC_Utils.getPlayerName(object)
        if not playerName then
            return
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = ATC_Utils.getFlightPhase(object)
        
        -- Если объект на подходе к аэродрому и находится на высоте перехода или ниже,
        -- информируем о необходимости перехода на частоту Tower
        if (flightPhase == "APPROACH" or flightPhase == "DESCENT") then
            -- Получение высоты объекта
            local altitude = object:GetAltitude()
            
            -- Получение высоты перехода для аэропорта
            local transitionAltitude = ATC_Utils.getTransitionAltitude(self.icao)
            
            if altitude <= transitionAltitude then
                self:notifyTransferToTower(object)
            end
        end
    end
    
    -- Добавляем метод уведомления о передаче управления Tower для Approach
    approach.notifyTransferToTower = function(self, object)
        if not object then
            return
        end
        
        -- Проверка коалиции объекта
        if not self:isObjectInCoalition(object) then
            return
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Получение службы Tower
        if not self.towerService then
            return
        end
        
        -- Получение частоты Tower
        local towerFrequency = self.towerService.frequency
        local towerCallsign = self.towerService.callsign
        
        -- Отправка сообщения о необходимости перехода на частоту Tower
        self:sendMessage(object, callsign .. ", вы достигли высоты перехода. Переходите на частоту " .. towerCallsign .. ", " .. ATC_Utils.formatFrequency(towerFrequency) .. ".")
        
        -- Отмечаем объект как ожидающий перехода на Tower
        self.trackedObjects[object:GetID()].pendingTowerTransfer = true
    end
    
    -- Переопределяем обработчик доклада о переходе на частоту Tower
    approach.handleSwitchingToTower = function(self, object)
        -- Вызываем оригинальный обработчик
        local result = originalApproachHandleSwitchingToTower(self, object)
        
        if not result or not object then
            return result
        end
        
        -- Проверка коалиции объекта
        if not self:isObjectInCoalition(object) then
            return result
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Если есть служба Tower, уведомляем её о переходе объекта
        if self.towerService then
            -- Отмечаем объект как переданный Tower
            if self.trackedObjects[object:GetID()] then
                self.trackedObjects[object:GetID()].transferredToTower = true
            end
            
            -- Уведомляем Tower о переходе объекта
            self.towerService:notifyIncomingObject(object, self)
        end
        
        return result
    end
    
    -- Переопределяем обработчик доклада "вышел на связь" для Tower
    tower.handleOnFrequency = function(self, object)
        -- Проверяем, был ли объект передан от Approach
        local wasTransferred = false
        
        if object and self.approachService then
            local objectId = object:GetID()
            
            if self.approachService.trackedObjects[objectId] and 
               self.approachService.trackedObjects[objectId].transferredToTower then
                wasTransferred = true
            end
        end
        
        -- Вызываем оригинальный обработчик
        local result = originalTowerHandleOnFrequency(self, object)
        
        -- Если объект был передан от Approach, отмечаем это
        if wasTransferred and object then
            -- Отмечаем объект как принятый от Approach
            if self.trackedObjects[object:GetID()] then
                self.trackedObjects[object:GetID()].receivedFromApproach = true
            end
        end
        
        return result
    end
end

return ATC_TowerApproach_Handoff
