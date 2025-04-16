--[[
ATC_Service.lua
Базовый класс службы ATC для универсального ATC модуля
Автор: Manus AI
Дата: Апрель 2025
--]]

local ATC_Service = {}

-- Создание новой службы ATC
ATC_Service.new = function(icao, callsign, frequency, range, coalition)
    local service = {}
    
    -- Основные параметры службы
    service.icao = icao or "UUUU"
    service.callsign = callsign or "Unknown"
    service.frequency = frequency or 0
    service.range = range or 50
    service.coalition = coalition
    
    -- Координаты службы
    service.position = nil
    
    -- Отслеживаемые объекты
    service.trackedObjects = {}
    
    -- Инициализация службы
    service.init = function(self)
        self:log("Инициализация службы " .. self.callsign)
        
        -- Получение координат службы
        self.position = self:getServicePosition()
        
        if not self.position then
            self:log("Ошибка: не удалось получить координаты службы")
            return false
        end
        
        return true
    end
    
    -- Запуск службы
    service.start = function(self)
        self:log("Запуск службы " .. self.callsign)
        
        -- Запуск планировщика для регулярной проверки объектов в зоне ответственности
        -- Используем MOOSE SCHEDULER вместо mist.scheduleFunction
        self.objectsScheduler = SCHEDULER:New(nil, 
            function() 
                self:checkObjects() 
            end, 
            {}, 
            1, -- начальная задержка 1 секунда
            5 -- повторять каждые 5 секунд
        )
        
        return true
    end
    
    -- Остановка службы
    service.stop = function(self)
        self:log("Остановка службы " .. self.callsign)
        
        -- Остановка планировщика проверки объектов
        if self.objectsScheduler then
            self.objectsScheduler:Stop()
            self.objectsScheduler = nil
        end
        
        return true
    end
    
    -- Получение координат службы
    service.getServicePosition = function(self)
        -- Получение координат аэропорта по ICAO коду
        local ATC_AirportManager = require("Core.ATC_AirportManager")
        local airportData = ATC_AirportManager.getAirportData(self.icao)
        
        if not airportData then
            self:log("Ошибка: не найдены данные аэропорта " .. self.icao)
            return nil
        end
        
        -- Создание объекта COORDINATE из MOOSE
        local coord = COORDINATE:New(airportData.latitude, airportData.longitude, airportData.altitude)
        
        return coord
    end
    
    -- Получение координат службы
    service.getCoordinate = function(self)
        return self.position
    end
    
    -- Проверка объектов в зоне ответственности
    service.checkObjects = function(self)
        -- Получение всех объектов в зоне ответственности
        local objectsInRange = self:getObjectsInRange()
        
        -- Проверка новых объектов
        for _, object in pairs(objectsInRange) do
            local objectId = object:GetID()
            
            -- Если объект еще не отслеживается, добавляем его
            if not self.trackedObjects[objectId] then
                self:trackObject(object)
                
                -- Вызываем обработчик нового объекта
                self:onNewObject(object)
            end
        end
        
        -- Проверка объектов, покинувших зону ответственности
        local objectsToRemove = {}
        
        for id, data in pairs(self.trackedObjects) do
            local object = data.object
            
            -- Проверяем, что объект все еще существует
            if not object:IsAlive() then
                table.insert(objectsToRemove, id)
            else
                -- Проверяем, что объект все еще в зоне ответственности
                local objectCoord = object:GetCoordinate()
                local distance = self.position:Get2DDistance(objectCoord)
                
                if distance > self.range * 1852 then -- переводим морские мили в метры
                    -- Вызываем обработчик объекта, покинувшего зону ответственности
                    self:onObjectLeft(object)
                    
                    table.insert(objectsToRemove, id)
                end
            end
        end
        
        -- Удаляем объекты, покинувшие зону ответственности
        for _, id in ipairs(objectsToRemove) do
            self.trackedObjects[id] = nil
        end
    end
    
    -- Получение объектов в зоне ответственности
    service.getObjectsInRange = function(self)
        local objectsInRange = {}
        
        -- Получение всех юнитов в зоне
        local units = nil
        
        -- Если указана коалиция, получаем только юниты этой коалиции
        if self.coalition then
            units = SET_UNIT:New():FilterCoalitions(self.coalition):FilterActive():FilterOnce()
        else
            -- Иначе получаем все юниты
            units = SET_UNIT:New():FilterActive():FilterOnce()
        end
        
        -- Фильтруем юниты по дистанции
        units:ForEachUnit(function(unit)
            if unit:IsAlive() then
                local unitCoord = unit:GetCoordinate()
                local distance = self.position:Get2DDistance(unitCoord)
                
                if distance <= self.range * 1852 then -- переводим морские мили в метры
                    table.insert(objectsInRange, unit)
                end
            end
        end)
        
        return objectsInRange
    end
    
    -- Отслеживание объекта
    service.trackObject = function(self, object)
        if not object then
            return
        end
        
        local objectId = object:GetID()
        
        -- Добавляем объект в список отслеживаемых
        self.trackedObjects[objectId] = {
            object = object,
            trackingStartTime = os.time()
        }
        
        self:log("Начато отслеживание объекта " .. objectId)
    end
    
    -- Проверка, принадлежит ли объект к коалиции службы
    service.isObjectInCoalition = function(self, object)
        if not object then
            return false
        end
        
        -- Если коалиция не указана, считаем, что объект принадлежит к коалиции службы
        if not self.coalition then
            return true
        end
        
        -- Проверяем коалицию объекта
        local objectCoalition = object:GetCoalition()
        
        return objectCoalition == self.coalition
    end
    
    -- Отправка сообщения объекту
    service.sendMessage = function(self, object, message)
        if not object or not message then
            return
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Форматирование сообщения
        local formattedMessage = self.callsign .. ": " .. message
        
        -- Отправка сообщения
        local playerName = ATC_Utils.getPlayerName(object)
        
        if playerName then
            -- Если объект - игрок, отправляем сообщение через MESSAGE
            MESSAGE:New(formattedMessage, 15):ToClient(object:GetClient())
        else
            -- Иначе логируем сообщение
            self:log("Сообщение для " .. callsign .. ": " .. message)
        end
        
        -- Если включена интеграция с SRS, отправляем сообщение через SRS
        local ATC_SRS = require("Core.ATC_SRS")
        
        if ATC_SRS.isEnabled() then
            ATC_SRS.sendMessage(self.callsign, message, self.frequency)
        end
    end
    
    -- Логирование
    service.log = function(self, message)
        env.info("[ATC] [" .. self.callsign .. "] " .. message)
    end
    
    -- Обработчик нового объекта в зоне ответственности
    service.onNewObject = function(self, object)
        -- Переопределяется в дочерних классах
    end
    
    -- Обработчик объекта, покинувшего зону ответственности
    service.onObjectLeft = function(self, object)
        -- Переопределяется в дочерних классах
    end
    
    return service
end

return ATC_Service
