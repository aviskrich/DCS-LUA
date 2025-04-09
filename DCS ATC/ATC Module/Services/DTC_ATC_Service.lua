--[[
DTC_ATC_Service.lua
Базовый класс службы ATC для универсального ATC модуля
Автор: AVIskrich
Дата: Апрель 2025
--]]

local DTC_ATC_Service = {}

-- Создание новой службы ATC
DTC_ATC_Service.new = function(icao, callsign, frequency, range)
    local service = {
        icao = icao,
        callsign = callsign,
        frequency = frequency,
        range = range or 50,  -- Дальность в морских милях по умолчанию
        isActive = false,
        trackedObjects = {},
        lastMessages = {},
        scheduler = nil
    }
    
    -- Логирование
    service.log = function(self, message)
        if DTC_Config and DTC_Config.DEBUG then
            env.info("[" .. self.callsign .. "] " .. message)
        end
    end
    
    -- Инициализация службы
    service.init = function(self)
        self:log("Инициализация службы ATC")
        
        -- Регистрация обработчиков фраз SRS
        if DTC_SRS and DTC_SRS.isInitialized then
            DTC_SRS.registerStandardPhraseHandlers(self)
        end
        
        return true
    end
    
    -- Запуск службы
    service.start = function(self)
        if self.isActive then
            self:log("Служба уже активна")
            return true
        end
        
        self:log("Запуск службы ATC")
        self.isActive = true
        
        -- Запуск планировщика для регулярной проверки объектов в зоне ответственности
        self.scheduler = mist.scheduleFunction(function() self:checkObjectsInRange() end, {}, timer.getTime() + 5, 10)
        
        return true
    end
    
    -- Остановка службы
    service.stop = function(self)
        if not self.isActive then
            self:log("Служба уже остановлена")
            return true
        end
        
        self:log("Остановка службы ATC")
        self.isActive = false
        
        -- Остановка планировщика
        if self.scheduler then
            mist.removeFunction(self.scheduler)
            self.scheduler = nil
        end
        
        return true
    end
    
    -- Получение координат службы
    service.getCoordinate = function(self)
        -- Получение координат аэропорта (используем первую ВПП)
        local runways = DTC_Navigraph.getAllRunways()
        
        for name, runway in pairs(runways) do
            return COORDINATE:NewFromLLDD(runway.threshold.lat, runway.threshold.lon)
        end
        
        return nil
    end
    
    -- Проверка объектов в зоне ответственности
    service.checkObjectsInRange = function(self)
        if not self.isActive then
            return
        end
        
        local serviceCoord = self:getCoordinate()
        if not serviceCoord then
            self:log("Не удалось получить координаты службы")
            return
        end
        
        -- Получение объектов в зоне ответственности
        local objects = DTC_Utils.getObjectsInRange(serviceCoord, self.range)
        
        -- Обновление списка отслеживаемых объектов
        for _, object in pairs(objects) do
            if object:isExist() and object:getCategory() == Object.Category.UNIT and object:getDesc().category == Unit.Category.AIRPLANE then
                local objectID = object:getID()
                
                if not self.trackedObjects[objectID] then
                    self:log("Новый объект в зоне ответственности: " .. object:getName())
                    
                    self.trackedObjects[objectID] = {
                        object = object,
                        firstSeen = timer.getTime(),
                        lastSeen = timer.getTime(),
                        isPlayer = DTC_Utils.isPlayer(object),
                        callsign = object:getCallsign() or "Unknown",
                        type = object:getTypeName() or "Unknown"
                    }
                    
                    -- Уведомление о новом объекте
                    self:onNewObject(object)
                else
                    -- Обновление времени последнего обнаружения
                    self.trackedObjects[objectID].lastSeen = timer.getTime()
                end
            end
        end
        
        -- Удаление объектов, которые больше не в зоне ответственности
        local currentTime = timer.getTime()
        local objectsToRemove = {}
        
        for id, data in pairs(self.trackedObjects) do
            if not data.object:isExist() or currentTime - data.lastSeen > 30 then
                table.insert(objectsToRemove, id)
            end
        end
        
        for _, id in ipairs(objectsToRemove) do
            self:log("Объект покинул зону ответственности: " .. self.trackedObjects[id].callsign)
            
            -- Уведомление о покидании зоны
            self:onObjectLeft(self.trackedObjects[id].object)
            
            -- Удаление объекта из списка
            self.trackedObjects[id] = nil
        end
    end
    
    -- Обработчик нового объекта в зоне ответственности
    service.onNewObject = function(self, object)
        -- Переопределяется в дочерних классах
    end
    
    -- Обработчик объекта, покинувшего зону ответственности
    service.onObjectLeft = function(self, object)
        -- Переопределяется в дочерних классах
    end
    
    -- Отправка сообщения объекту
    service.sendMessage = function(self, object, message)
        if not object or not message then
            return false
        end
        
        local objectID = object:getID()
        
        -- Формирование полного сообщения с позывным службы
        local fullMessage = self.callsign .. ": " .. message
        
        -- Отправка сообщения через SRS, если доступно
        if DTC_SRS and DTC_SRS.isInitialized then
            local success = DTC_SRS.sendVoiceMessage(fullMessage, self.frequency, "AM")
            
            if success then
                self:log("Отправлено сообщение через SRS: " .. fullMessage)
                
                -- Сохранение сообщения в истории
                if not self.lastMessages[objectID] then
                    self.lastMessages[objectID] = {}
                end
                
                table.insert(self.lastMessages[objectID], {
                    time = timer.getTime(),
                    message = fullMessage
                })
                
                return true
            end
        end
        
        -- Если SRS недоступен или отправка не удалась, используем стандартный механизм сообщений
        trigger.action.outTextForUnit(objectID, fullMessage, 10)
        
        self:log("Отправлено сообщение через стандартный механизм: " .. fullMessage)
        
        -- Сохранение сообщения в истории
        if not self.lastMessages[objectID] then
            self.lastMessages[objectID] = {}
        end
        
        table.insert(self.lastMessages[objectID], {
            time = timer.getTime(),
            message = fullMessage
        })
        
        return true
    end
    
    -- Отправка сообщения всем объектам в зоне ответственности
    service.broadcastMessage = function(self, message)
        if not message then
            return false
        end
        
        -- Формирование полного сообщения с позывным службы
        local fullMessage = self.callsign .. ": " .. message
        
        -- Отправка сообщения через SRS, если доступно
        if DTC_SRS and DTC_SRS.isInitialized then
            local success = DTC_SRS.sendVoiceMessage(fullMessage, self.frequency, "AM")
            
            if success then
                self:log("Отправлено широковещательное сообщение через SRS: " .. fullMessage)
                return true
            end
        end
        
        -- Если SRS недоступен или отправка не удалась, отправляем сообщение каждому объекту
        for id, data in pairs(self.trackedObjects) do
            if data.object:isExist() then
                trigger.action.outTextForUnit(id, fullMessage, 10)
            end
        end
        
        self:log("Отправлено широковещательное сообщение через стандартный механизм: " .. fullMessage)
        return true
    end
    
    -- Получение последних сообщений для объекта
    service.getLastMessages = function(self, object, count)
        if not object then
            return {}
        end
        
        local objectID = object:getID()
        count = count or 5
        
        if not self.lastMessages[objectID] then
            return {}
        end
        
        -- Получение последних сообщений
        local messages = {}
        local totalMessages = #self.lastMessages[objectID]
        
        for i = math.max(1, totalMessages - count + 1), totalMessages do
            table.insert(messages, self.lastMessages[objectID][i])
        end
        
        return messages
    end
    
    -- Обработчик запроса на руление
    service.handleTaxiRequest = function(self, object)
        -- Переопределяется в дочерних классах
        return false
    end
    
    -- Обработчик запроса на взлет
    service.handleTakeoffRequest = function(self, object)
        -- Переопределяется в дочерних классах
        return false
    end
    
    -- Обработчик запроса на посадку
    service.handleLandingRequest = function(self, object)
        -- Переопределяется в дочерних классах
        return false
    end
    
    -- Обработчик запроса на заход
    service.handleApproachRequest = function(self, object)
        -- Переопределяется в дочерних классах
        return false
    end
    
    -- Обработчик запроса информации ATIS
    service.handleATISRequest = function(self, object)
        if not object then
            return false
        end
        
        -- Получение информации ATIS
        local atisInfo = DTC_Utils.getATISInfo(self.icao)
        
        -- Отправка информации ATIS
        self:sendMessage(object, atisInfo)
        
        return true
    end
    
    -- Обработчик запроса информации о погоде
    service.handleWeatherRequest = function(self, object)
        if not object then
            return false
        end
        
        -- Получение координат объекта
        local objectCoord = object:GetCoordinate()
        
        -- Получение информации о погоде
        local weather = DTC_Utils.getWeatherInfo(objectCoord)
        local weatherInfo = DTC_Utils.formatWeatherInfo(weather)
        
        -- Отправка информации о погоде
        self:sendMessage(object, weatherInfo)
        
        return true
    end
    
    -- Обработчик запроса информации о трафике
    service.handleTrafficRequest = function(self, object)
        if not object then
            return false
        end
        
        -- Получение информации о трафике
        local traffic = DTC_Utils.getTrafficInfo(object, 10)
        local trafficInfo = DTC_Utils.formatTrafficInfo(traffic)
        
        -- Отправка информации о трафике
        self:sendMessage(object, trafficInfo)
        
        return true
    end
    
    -- Обработчик доклада о готовности к взлету
    service.handleReadyForTakeoff = function(self, object)
        -- Переопределяется в дочерних классах
        return false
    end
    
    -- Обработчик доклада о готовности к заходу
    service.handleReadyForApproach = function(self, object)
        -- Переопределяется в дочерних классах
        return false
    end
    
    -- Обработчик доклада о прибытии
    service.handleInbound = function(self, object)
        -- Переопределяется в дочерних классах
        return false
    end
    
    -- Обработчик доклада о выходе из зоны ответственности
    service.handleLeavingAirspace = function(self, object)
        if not object then
            return false
        end
        
        -- Отправка подтверждения
        self:sendMessage(object, "Вас понял, частота свободна, хорошего полета.")
        
        return true
    end
    
    -- Инициализация службы
    service:init()
    
    return service
end

return DTC_ATC_Service
