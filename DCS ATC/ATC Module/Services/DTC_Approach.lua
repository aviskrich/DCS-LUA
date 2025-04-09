--[[
DTC_Approach.lua
Модуль службы Approach для универсального ATC модуля
Автор: AVIskrich
Дата: Апрель 2025
--]]

local DTC_Approach = {}

-- Создание новой службы Approach
DTC_Approach.new = function(icao, callsign, frequency, range)
    -- Наследование от базового класса службы ATC
    local approach = DTC_ATC_Service.new(icao, callsign, frequency, range or 50)
    
    -- Переопределение инициализации
    local baseInit = approach.init
    approach.init = function(self)
        baseInit(self)
        self:log("Инициализация службы Approach")
        
        -- Инициализация данных о ВПП
        self.runways = DTC_Navigraph.getAllRunways()
        self.activeRunway = nil
        
        -- Определение активной ВПП
        self:updateActiveRunway()
        
        return true
    end
    
    -- Обновление активной ВПП на основе ветра
    approach.updateActiveRunway = function(self)
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
    local baseStart = approach.start
    approach.start = function(self)
        baseStart(self)
        
        -- Запуск планировщика для регулярного обновления активной ВПП
        self.runwayScheduler = mist.scheduleFunction(function() self:updateActiveRunway() end, {}, timer.getTime() + 300, 300)
        
        return true
    end
    
    -- Переопределение остановки службы
    local baseStop = approach.stop
    approach.stop = function(self)
        baseStop(self)
        
        -- Остановка планировщика обновления ВПП
        if self.runwayScheduler then
            mist.removeFunction(self.runwayScheduler)
            self.runwayScheduler = nil
        end
        
        return true
    end
    
    -- Обработчик нового объекта в зоне ответственности
    approach.onNewObject = function(self, object)
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
        
        -- Если объект на подходе к аэродрому, приветствуем его
        if flightPhase == "APPROACH" or flightPhase == "DESCENT" then
            self:sendMessage(object, callsign .. ", вы вошли в зону ответственности " .. self.callsign .. ". Для запроса захода используйте фразу 'request approach'.")
        end
    end
    
    -- Обработчик запроса на заход
    approach.handleApproachRequest = function(self, object)
        if not object then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = DTC_Utils.getFlightPhase(object)
        
        -- Если объект на земле, отказываем
        if flightPhase == "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос на заход. Вы на земле.")
            return true
        end
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Получение данных о погоде
        local serviceCoord = self:getCoordinate()
        local weather = DTC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о погоде
        local weatherInfo = DTC_Utils.formatWeatherInfo(weather)
        
        -- Проверка трафика
        local traffic = DTC_Utils.getTrafficInfo(object, 10)
        local trafficInfo = DTC_Utils.formatTrafficInfo(traffic)
        
        -- Формирование ответа
        local response = callsign .. ", опознан радаром. " .. weatherInfo .. " " .. trafficInfo
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Получение рекомендуемой STAR процедуры
        local objectCoord = object:GetCoordinate()
        local objectHeading = DTC_Utils.getObjectHeading(object)
        
        local recommendedSTAR = DTC_Procedures.getRecommendedSTAR(self.activeRunway, objectHeading)
        
        if recommendedSTAR then
            -- Отправка информации о STAR процедуре
            local starInfo = DTC_Procedures.getProcedureInfo(recommendedSTAR.data, "STAR")
            self:sendMessage(object, "Следуйте по STAR " .. recommendedSTAR.name .. " для ВПП " .. self.activeRunway .. ".")
            self:sendMessage(object, starInfo)
            
            -- Начало отслеживания выполнения процедуры
            DTC_MonitoringManager.trackObject(object, recommendedSTAR.data, "STAR", self)
        else
            -- Если нет STAR процедуры, отправляем информацию о векторении
            local runwayData = self.runways[self.activeRunway]
            if runwayData then
                local vectoringInfo = DTC_Utils.getVectoringInfo(object, runwayData)
                self:sendMessage(object, vectoringInfo)
            end
        end
        
        -- Информация о переходе на частоту Tower
        if DTC_ATC and DTC_ATC.tower then
            local towerFrequency = DTC_ATC.tower.frequency
            local towerCallsign = DTC_ATC.tower.callsign
            
            self:sendMessage(object, "Доложите на конечном этапе захода. Затем переходите на частоту " .. towerCallsign .. ", " .. DTC_Utils.formatFrequency(towerFrequency) .. ".")
        end
        
        return true
    end
    
    -- Обработчик доклада о готовности к заходу
    approach.handleReadyForApproach = function(self, object)
        if not object then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = DTC_Utils.getFlightPhase(object)
        
        -- Если объект на земле, отказываем
        if flightPhase == "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос. Вы на земле.")
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
        local traffic = DTC_Utils.getTrafficInfo(object, 10)
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
        
        -- Информация о переходе на частоту Tower
        if DTC_ATC and DTC_ATC.tower then
            local towerFrequency = DTC_ATC.tower.frequency
            local towerCallsign = DTC_ATC.tower.callsign
            
            self:sendMessage(object, "На конечном этапе захода переходите на частоту " .. towerCallsign .. ", " .. DTC_Utils.formatFrequency(towerFrequency) .. ".")
        end
        
        return true
    end
    
    -- Обработчик доклада о прибытии
    approach.handleInbound = function(self, object)
        if not object then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Определение фазы полета
        local flightPhase = DTC_Utils.getFlightPhase(object)
        
        -- Если объект на земле, отказываем
        if flightPhase == "GROUND" then
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос. Вы на земле.")
            return true
        end
        
        -- Получение координат объекта
        local objectCoord = object:GetCoordinate()
        
        -- Получение расстояния до аэродрома
        local serviceCoord = self:getCoordinate()
        local distance = DTC_Utils.getDistance(objectCoord, serviceCoord)
        
        -- Формирование ответа
        local response = callsign .. ", вас понял. Расстояние до аэродрома " .. math.floor(distance) .. " миль."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Получение данных о погоде
        local weather = DTC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о погоде
        local weatherInfo = DTC_Utils.formatWeatherInfo(weather)
        
        -- Отправка информации о погоде
        self:sendMessage(object, weatherInfo)
        
        -- Информация об активной ВПП
        self:sendMessage(object, "Активная ВПП " .. self.activeRunway .. ".")
        
        -- Получение рекомендуемой STAR процедуры
        local objectHeading = DTC_Utils.getObjectHeading(object)
        
        local recommendedSTAR = DTC_Procedures.getRecommendedSTAR(self.activeRunway, objectHeading)
        
        if recommendedSTAR then
            -- Отправка информации о STAR процедуре
            local starInfo = DTC_Procedures.getProcedureInfo(recommendedSTAR.data, "STAR")
            self:sendMessage(object, "Следуйте по STAR " .. recommendedSTAR.name .. " для ВПП " .. self.activeRunway .. ".")
            self:sendMessage(object, starInfo)
            
            -- Начало отслеживания выполнения процедуры
            DTC_MonitoringManager.trackObject(object, recommendedSTAR.data, "STAR", self)
        end
        
        return true
    end
    
    -- Инициализация службы
    approach:init()
    
    return approach
end

return DTC_Approach
