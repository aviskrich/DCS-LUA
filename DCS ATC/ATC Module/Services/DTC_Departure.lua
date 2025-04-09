--[[
DTC_Departure.lua
Модуль службы Departure для универсального ATC модуля
Автор: AVIskrich
Дата: Апрель 2025
--]]

local DTC_Departure = {}

-- Создание новой службы Departure
DTC_Departure.new = function(icao, callsign, frequency, range)
    -- Наследование от базового класса службы ATC
    local departure = DTC_ATC_Service.new(icao, callsign, frequency, range or 50)
    
    -- Переопределение инициализации
    local baseInit = departure.init
    departure.init = function(self)
        baseInit(self)
        self:log("Инициализация службы Departure")
        
        -- Инициализация данных о ВПП
        self.runways = DTC_Navigraph.getAllRunways()
        self.activeRunway = nil
        
        -- Определение активной ВПП
        self:updateActiveRunway()
        
        return true
    end
    
    -- Обновление активной ВПП на основе ветра
    departure.updateActiveRunway = function(self)
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
    local baseStart = departure.start
    departure.start = function(self)
        baseStart(self)
        
        -- Запуск планировщика для регулярного обновления активной ВПП
        self.runwayScheduler = mist.scheduleFunction(function() self:updateActiveRunway() end, {}, timer.getTime() + 300, 300)
        
        return true
    end
    
    -- Переопределение остановки службы
    local baseStop = departure.stop
    departure.stop = function(self)
        baseStop(self)
        
        -- Остановка планировщика обновления ВПП
        if self.runwayScheduler then
            mist.removeFunction(self.runwayScheduler)
            self.runwayScheduler = nil
        end
        
        return true
    end
    
    -- Обработчик нового объекта в зоне ответственности
    departure.onNewObject = function(self, object)
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
        
        -- Если объект только что взлетел, приветствуем его
        if flightPhase == "CLIMB" then
            self:sendMessage(object, callsign .. ", вы вошли в зону ответственности " .. self.callsign .. ". Набирайте высоту по SID.")
            
            -- Получение рекомендуемой SID процедуры
            local objectHeading = DTC_Utils.getObjectHeading(object)
            local recommendedSID = DTC_Procedures.getRecommendedSID(self.activeRunway, objectHeading)
            
            if recommendedSID then
                -- Отправка информации о SID процедуре
                local sidInfo = DTC_Procedures.getProcedureInfo(recommendedSID.data, "SID")
                self:sendMessage(object, sidInfo)
                
                -- Начало отслеживания выполнения процедуры
                DTC_MonitoringManager.trackObject(object, recommendedSID.data, "SID", self)
            end
        end
    end
    
    -- Обработчик объекта, покинувшего зону ответственности
    departure.onObjectLeft = function(self, object)
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
        
        -- Если объект на крейсерской высоте, отправляем оценку выполнения процедуры
        if flightPhase == "CRUISE" then
            -- Отправка оценки выполнения процедуры
            local evaluation = DTC_MonitoringManager.sendPerformanceEvaluation(object, self)
            
            if evaluation then
                -- Отправка прощального сообщения
                self:sendMessage(object, callsign .. ", вы покидаете зону ответственности " .. self.callsign .. ". Частота свободна, хорошего полета.")
            end
        end
    end
    
    -- Обработчик запроса на взлет
    departure.handleTakeoffRequest = function(self, object)
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
            self:sendMessage(object, "После взлета следуйте по SID " .. recommendedSID.name .. ".")
            self:sendMessage(object, sidInfo)
            
            -- Начало отслеживания выполнения процедуры
            DTC_MonitoringManager.trackObject(object, recommendedSID.data, "SID", self)
        end
        
        return true
    end
    
    -- Обработчик доклада о готовности к взлету
    departure.handleReadyForTakeoff = function(self, object)
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
    
    -- Обработчик доклада о выходе из зоны ответственности
    departure.handleLeavingAirspace = function(self, object)
        if not object then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Отправка оценки выполнения процедуры
        local evaluation = DTC_MonitoringManager.sendPerformanceEvaluation(object, self)
        
        -- Отправка подтверждения
        self:sendMessage(object, callsign .. ", вас понял, частота свободна, хорошего полета.")
        
        return true
    end
    
    -- Инициализация службы
    departure:init()
    
    return departure
end

return DTC_Departure
