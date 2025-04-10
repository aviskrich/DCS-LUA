--[[
ATC_Tower.lua
Модуль службы Tower для универсального ATC модуля
Автор: Andrey Iskrich
Дата: Апрель 2025
--]]

local ATC_Tower = {}

-- Создание новой службы Tower
ATC_Tower.new = function(icao, callsign, frequency, range, coalition)
    -- Наследование от базового класса службы ATC
    local tower = ATC_Service.new(icao, callsign, frequency, range or 30, coalition)
    
    -- Добавление ссылки на Navigraph для этого аэропорта
    tower.navigraph = nil
    
    -- Переопределение инициализации
    local baseInit = tower.init
    tower.init = function(self)
        baseInit(self)
        self:log("Инициализация службы Tower")
        
        -- Инициализация данных о ВПП
        self.runways = {}
        
        -- Если есть ссылка на Navigraph, используем её
        if self.navigraph then
            self.runways = self.navigraph:getAllRunways()
        else
            -- Иначе используем глобальный Navigraph (для обратной совместимости)
            local ATC_Navigraph = require("Scripts.ATC_Module.Core.ATC_Navigraph")
            self.runways = ATC_Navigraph.getAllRunways()
        end
        
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
        local weather = ATC_Utils.getWeatherInfo(serviceCoord)
        if not weather then
            self:log("Не удалось получить данные о погоде")
            return
        end
        
        -- Определение активной ВПП на основе ветра
        self.activeRunway = ATC_Utils.getActiveRunway(self.runways, weather.windDirection)
        
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
        
        -- Если объект на земле, приветствуем его
        if flightPhase == "GROUND" then
            self:sendMessage(object, callsign .. ", добро пожаловать в " .. self.icao .. ". Для запроса руления используйте фразу 'request taxi'.")
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
        
        -- Получение данных о погоде
        local serviceCoord = self:getCoordinate()
        local weather = ATC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о ветре
        local windInfo = ""
        if weather then
            windInfo = "Ветер " .. ATC_Utils.formatHeading(weather.windDirection) .. " градусов, " .. math.floor(weather.windSpeed) .. " узлов. "
        end
        
        -- Формирование ответа
        local response = callsign .. ", " .. windInfo .. "Разрешаю взлет с ВПП " .. self.activeRunway .. "."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Получение рекомендуемой SID процедуры
        local objectCoord = object:GetCoordinate()
        local objectHeading = ATC_Utils.getObjectHeading(object)
        
        local recommendedSID = nil
        
        -- Если есть ссылка на Navigraph, используем её
        if self.navigraph then
            local ATC_Procedures = require("Scripts.ATC_Module.Core.ATC_Procedures")
            recommendedSID = ATC_Procedures.getRecommendedSID(self.navigraph, self.activeRunway, objectHeading)
        else
            -- Иначе используем глобальный Procedures (для обратной совместимости)
            recommendedSID = ATC_Procedures.getRecommendedSID(self.activeRunway, objectHeading)
        end
        
        if recommendedSID then
            -- Отправка информации о SID процедуре
            local sidInfo = ATC_Procedures.getProcedureInfo(recommendedSID.data, "SID")
            self:sendMessage(object, sidInfo)
            
            -- Начало отслеживания выполнения процедуры
            ATC_MonitoringManager.trackObject(object, recommendedSID.data, "SID", self)
        end
        
        -- Получение службы Departure для этого аэропорта
        local departureService = nil
        
        -- Используем ATC_AirportManager для получения службы Departure
        local ATC_AirportManager = require("Scripts.ATC_Module.Core.ATC_AirportManager")
        local airport = ATC_AirportManager.getActiveAirport(self.icao)
        
        if airport and airport.departure then
            departureService = airport.departure
        end
        
        -- Если есть служба Departure, информируем о необходимости перехода на её частоту
        if departureService then
            local departureFrequency = departureService.frequency
            local departureCallsign = departureService.callsign
            
            self:sendMessage(object, "После взлета переходите на частоту " .. departureCallsign .. ", " .. ATC_Utils.formatFrequency(departureFrequency) .. ".")
        end
        
        return true
    end
    
    -- Обработчик запроса на посадку
    tower.handleLandingRequest = function(self, object)
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
        
        -- Получение данных о погоде
        local serviceCoord = self:getCoordinate()
        local weather = ATC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о ветре
        local windInfo = ""
        if weather then
            windInfo = "Ветер " .. ATC_Utils.formatHeading(weather.windDirection) .. " градусов, " .. math.floor(weather.windSpeed) .. " узлов. "
        end
        
        -- Проверка трафика
        local traffic = ATC_Utils.getTrafficInfo(object, 5)
        local trafficInfo = ""
        
        if #traffic > 0 then
            trafficInfo = "Трафик в районе аэродрома. "
        end
        
        -- Формирование ответа
        local response = callsign .. ", " .. windInfo .. trafficInfo .. "Разрешаю заход на ВПП " .. self.activeRunway .. "."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Получение рекомендуемой процедуры захода
        local recommendedApproach = nil
        
        -- Если есть ссылка на Navigraph, используем её
        if self.navigraph then
            local ATC_Procedures = require("Scripts.ATC_Module.Core.ATC_Procedures")
            recommendedApproach = ATC_Procedures.getRecommendedApproach(self.navigraph, self.activeRunway)
        else
            -- Иначе используем глобальный Procedures (для обратной совместимости)
            recommendedApproach = ATC_Procedures.getRecommendedApproach(self.activeRunway)
        end
        
        if recommendedApproach then
            -- Отправка информации о процедуре захода
            local approachInfo = ATC_Procedures.getProcedureInfo(recommendedApproach.data, "APPROACH")
            self:sendMessage(object, approachInfo)
            
            -- Начало отслеживания выполнения процедуры
            ATC_MonitoringManager.trackObject(object, recommendedApproach.data, "APPROACH", self)
        else
            -- Если нет процедуры захода, отправляем информацию о векторении
            local runwayData = self.runways[self.activeRunway]
            if runwayData then
                local vectoringInfo = ATC_Utils.getVectoringInfo(object, runwayData)
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
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Получение данных о погоде
        local serviceCoord = self:getCoordinate()
        local weather = ATC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о ветре
        local windInfo = ""
        if weather then
            windInfo = "Ветер " .. ATC_Utils.formatHeading(weather.windDirection) .. " градусов, " .. math.floor(weather.windSpeed) .. " узлов. "
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
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Получение данных о погоде
        local serviceCoord = self:getCoordinate()
        local weather = ATC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о ветре
        local windInfo = ""
        if weather then
            windInfo = "Ветер " .. ATC_Utils.formatHeading(weather.windDirection) .. " градусов, " .. math.floor(weather.windSpeed) .. " узлов. "
        end
        
        -- Проверка трафика
        local traffic = ATC_Utils.getTrafficInfo(object, 5)
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

return ATC_Tower
