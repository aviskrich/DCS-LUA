--[[
DTC_Tower.lua
Модуль службы Tower для универсального ATC модуля
Автор: AVIskrich
Дата: Апрель 2025
--]]

local DTC_Tower = {}

-- Создание новой службы Tower
DTC_Tower.new = function(icao, callsign, frequency, range)
    -- Наследование от базового класса службы ATC
    local tower = DTC_ATC_Service.new(icao, callsign, frequency, range or 30)
    
    -- Переопределение инициализации
    local baseInit = tower.init
    tower.init = function(self)
        baseInit(self)
        self:log("Инициализация службы Tower")
        
        -- Инициализация данных о ВПП
        self.runways = DTC_Navigraph.getAllRunways()
        self.activeRunway = nil
        
        -- Определение активной ВПП
        self:updateActiveRunway()
        
        return true
    end
    
    -- Обновление активной ВПП на основе ветра
    tower.updateActiveRunway = function(self)
        local serviceCoord = self:getCoordinate()
        if not serviceCoord then
            self:log("Не удалось получить координаты службы")
            return
        end
        
        -- Получение данных о погоде
        local weather = DTC_Utils.getWeatherInfo(serviceCoord)
        if not weather then
            self:log("Не удалось получить данные о погоде")
            return
        end
        
        -- Определение активной ВПП на основе ветра
        self.activeRunway = DTC_Utils.getActiveRunway(self.runways, weather.windDirection)
        
        if self.activeRunway then
            self:log("Установлена активная ВПП: " .. self.activeRunway)
        else
            self:log("Не удалось определить активную ВПП")
        end
    end
    
    -- Переопределение запуска службы
    local baseStart = tower.start
    tower.start = function(self)
        baseStart(self)
        
        -- Запуск планировщика для регулярного обновления активной ВПП
        self.runwayScheduler = mist.scheduleFunction(function() self:updateActiveRunway() end, {}, timer.getTime() + 300, 300)
        
        return true
    end
    
    -- Переопределение остановки службы
    local baseStop = tower.stop
    tower.stop = function(self)
        baseStop(self)
        
        -- Остановка планировщика обновления ВПП
        if self.runwayScheduler then
            mist.removeFunction(self.runwayScheduler)
            self.runwayScheduler = nil
        end
        
        return true
    end
    
    -- Обработчик нового объекта в зоне ответственности
    tower.onNewObject = function(self, object)
        if not object then
            return
        end
        
        local playerName = DTC_Utils.getPlayerName(object)
        if not playerName then
            return
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = DTC_Utils.getFlightPhase(object)
        
        -- Если объект на земле, приветствуем его
        if flightPhase == "GROUND" then
            self:sendMessage(object, callsign .. ", добро пожаловать в " .. self.icao .. ". Для запроса руления используйте фразу 'request taxi'.")
        end
        -- Если объект на подходе к аэродрому, информируем о необходимости запроса посадки
        elseif flightPhase == "APPROACH" or flightPhase == "DESCENT" then
            self:sendMessage(object, callsign .. ", вы вошли в зону ответственности " .. self.callsign .. ". Для запроса посадки используйте фразу 'request landing'.")
        end
    end
    
    -- Обработчик запроса на руление
    tower.handleTaxiRequest = function(self, object)
        if not object then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = DTC_Utils.getFlightPhase(object)
        
        -- Если объект не на земле, отказываем
        if flightPhase ~= "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос на руление. Вы не на земле.")
            return true
        end
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Если не удалось определить активную ВПП, используем первую доступную
        if not self.activeRunway then
            for name, _ in pairs(self.runways) do
                self.activeRunway = name
                break
            end
        end
        
        -- Формирование ответа
        local response = callsign .. ", разрешаю руление к ВПП " .. self.activeRunway .. "."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        return true
    end
    
    -- Обработчик запроса на взлет
    tower.handleTakeoffRequest = function(self, object)
        if not object then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = DTC_Utils.getFlightPhase(object)
        
        -- Если объект не на земле, отказываем
        if flightPhase ~= "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос на взлет. Вы не на земле.")
            return true
        end
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Получение данных о погоде
        local serviceCoord = self:getCoordinate()
        local weather = DTC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о ветре
        local windInfo = ""
        if weather then
            windInfo = "Ветер " .. DTC_Utils.formatHeading(weather.windDirection) .. " градусов, " .. math.floor(weather.windSpeed) .. " узлов. "
        end
        
        -- Формирование ответа
        local response = callsign .. ", " .. windInfo .. "Разрешаю взлет с ВПП " .. self.activeRunway .. "."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Получение рекомендуемой SID процедуры
        local objectCoord = object:GetCoordinate()
        local objectHeading = DTC_Utils.getObjectHeading(object)
        
        local recommendedSID = DTC_Procedures.getRecommendedSID(self.activeRunway, objectHeading)
        
        if recommendedSID then
            -- Отправка информации о SID процедуре
            local sidInfo = DTC_Procedures.getProcedureInfo(recommendedSID.data, "SID")
            self:sendMessage(object, sidInfo)
            
            -- Начало отслеживания выполнения процедуры
            DTC_MonitoringManager.trackObject(object, recommendedSID.data, "SID", self)
        end
        
        -- Если есть служба Departure, информируем о необходимости перехода на её частоту
        if DTC_ATC and DTC_ATC.departure then
            local departureFrequency = DTC_ATC.departure.frequency
            local departureCallsign = DTC_ATC.departure.callsign
            
            self:sendMessage(object, "После взлета переходите на частоту " .. departureCallsign .. ", " .. DTC_Utils.formatFrequency(departureFrequency) .. ".")
        end
        
        return true
    end
    
    -- Обработчик запроса на посадку
    tower.handleLandingRequest = function(self, object)
        if not object then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = DTC_Utils.getFlightPhase(object)
        
        -- Если объект на земле, отказываем
        if flightPhase == "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос на посадку. Вы уже на земле.")
            return true
        end
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Получение данных о погоде
        local serviceCoord = self:getCoordinate()
        local weather = DTC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о ветре
        local windInfo = ""
        if weather then
            windInfo = "Ветер " .. DTC_Utils.formatHeading(weather.windDirection) .. " градусов, " .. math.floor(weather.windSpeed) .. " узлов. "
        end
        
        -- Проверка трафика
        local traffic = DTC_Utils.getTrafficInfo(object, 5)
        local trafficInfo = ""
        
        if #traffic > 0 then
            trafficInfo = "Трафик в районе аэродрома. "
        end
        
        -- Формирование ответа
        local response = callsign .. ", " .. windInfo .. trafficInfo .. "Разрешаю заход на ВПП " .. self.activeRunway .. "."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Получение рекомендуемой процедуры захода
        local recommendedApproach = DTC_Procedures.getRecommendedApproach(self.activeRunway)
        
        if recommendedApproach then
            -- Отправка информации о процедуре захода
            local approachInfo = DTC_Procedures.getProcedureInfo(recommendedApproach.data, "APPROACH")
            self:sendMessage(object, approachInfo)
            
            -- Начало отслеживания выполнения процедуры
            DTC_MonitoringManager.trackObject(object, recommendedApproach.data, "APPROACH", self)
        else
            -- Если нет процедуры захода, отправляем информацию о векторении
            local runwayData = self.runways[self.activeRunway]
            if runwayData then
                local vectoringInfo = DTC_Utils.getVectoringInfo(object, runwayData)
                self:sendMessage(object, vectoringInfo)
            end
        end
        
        return true
    end
    
    -- Обработчик доклада о готовности к взлету
    tower.handleReadyForTakeoff = function(self, object)
        if not object then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = DTC_Utils.getFlightPhase(object)
        
        -- Если объект не на земле, отказываем
        if flightPhase ~= "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос. Вы не на земле.")
            return true
        end
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Получение данных о погоде
        local serviceCoord = self:getCoordinate()
        local weather = DTC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о ветре
        local windInfo = ""
        if weather then
            windInfo = "Ветер " .. DTC_Utils.formatHeading(weather.windDirection) .. " градусов, " .. math.floor(weather.windSpeed) .. " узлов. "
        end
        
        -- Формирование ответа
        local response = callsign .. ", " .. windInfo .. "Разрешаю взлет с ВПП " .. self.activeRunway .. "."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        return true
    end
    
    -- Обработчик доклада о готовности к заходу
    tower.handleReadyForApproach = function(self, object)
        if not object then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = DTC_Utils.getFlightPhase(object)
        
        -- Если объект на земле, отказываем
        if flightPhase == "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос. Вы уже на земле.")
            return true
        end
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Получение данных о погоде
        local serviceCoord = self:getCoordinate()
        local weather = DTC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о ветре
        local windInfo = ""
        if weather then
            windInfo = "Ветер " .. DTC_Utils.formatHeading(weather.windDirection) .. " градусов, " .. math.floor(weather.windSpeed) .. " узлов. "
        end
        
        -- Проверка трафика
        local traffic = DTC_Utils.getTrafficInfo(object, 5)
        local trafficInfo = ""
        
        if #traffic > 0 then
            trafficInfo = "Трафик в районе аэродрома. "
        end
        
        -- Формирование ответа
        local response = callsign .. ", " .. windInfo .. trafficInfo .. "Разрешаю заход на ВПП " .. self.activeRunway .. "."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        return true
    end
    
    -- Инициализация службы
    tower:init()
    
    return tower
end

return DTC_Tower
