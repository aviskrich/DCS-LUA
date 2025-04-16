--[[
ATC_Tower.lua
Модуль службы Tower для универсального ATC модуля
Автор: Manus AI
Дата: Апрель 2025
--]]

local ATC_Tower = {}

-- Создание новой службы Tower
ATC_Tower.new = function(icao, callsign, frequency, range, coalition)
    -- Наследование от базового класса службы ATC
    local tower = ATC_Service.new(icao, callsign, frequency, range or 30, coalition)
    
    -- Добавление ссылки на Navigraph для этого аэропорта
    tower.navigraph = nil
    
    -- Добавление меню F10
    tower.menu = nil
    tower.menuItems = {}
    
    -- Состояние ВПП
    tower.runwayStatus = {
        isClear = true,
        pendingLandings = {},
        pendingTakeoffs = {}
    }
    
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
        
        -- Инициализация меню F10
        self:initMenu()
        
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
        -- Используем MOOSE SCHEDULER вместо mist.scheduleFunction
        self.runwayScheduler = SCHEDULER:New(nil, 
            function() 
                self:updateActiveRunway() 
            end, 
            {}, 
            5, -- начальная задержка 5 секунд
            300 -- повторять каждые 300 секунд (5 минут)
        )
        
        -- Активация меню F10
        self:activateMenu()
        
        return true
    end
    
    -- Переопределение остановки службы
    local baseStop = tower.stop
    tower.stop = function(self)
        baseStop(self)
        
        -- Остановка планировщика обновления ВПП
        if self.runwayScheduler then
            self.runwayScheduler:Stop()
            self.runwayScheduler = nil
        end
        
        -- Деактивация меню F10
        self:deactivateMenu()
        
        return true
    end
    
    -- Инициализация меню F10
    tower.initMenu = function(self)
        -- Создаем меню только если указана коалиция
        if self.coalition then
            -- Создаем корневое меню для службы
            self.menu = MENU_COALITION:New(self.coalition, self.callsign)
            
            -- Добавляем пункты меню
            self:addMenuItems()
        end
    end
    
    -- Добавление пунктов меню F10
    tower.addMenuItems = function(self)
        if not self.menu then
            return
        end
        
        -- Запрос руления
        self.menuItems.requestTaxi = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Запросить руление",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleTaxiRequest(unit)
                end
            end
        )
        
        -- Запрос взлета
        self.menuItems.requestTakeoff = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Запросить взлет",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleTakeoffRequest(unit)
                end
            end
        )
        
        -- Запрос посадки
        self.menuItems.requestLanding = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Запросить посадку",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleLandingRequest(unit)
                end
            end
        )
        
        -- Запрос визуального захода
        self.menuItems.requestVisualApproach = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Запросить визуальный заход",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleVisualApproachRequest(unit)
                end
            end
        )
        
        -- Доклад "полосу наблюдаю"
        self.menuItems.reportRunwayInSight = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Полосу наблюдаю",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleRunwayInSight(unit)
                end
            end
        )
        
        -- Доклад "готов к взлету"
        self.menuItems.reportReadyForTakeoff = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Готов к взлету",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleReadyForTakeoff(unit)
                end
            end
        )
        
        -- Доклад "готов к заходу"
        self.menuItems.reportReadyForApproach = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Готов к заходу",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleReadyForApproach(unit)
                end
            end
        )
        
        -- Доклад "полосу освободил"
        self.menuItems.reportRunwayClear = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Полосу освободил",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleRunwayClear(unit)
                end
            end
        )
        
        -- Доклад "вышел на связь"
        self.menuItems.reportOnFrequency = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Вышел на связь",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleOnFrequency(unit)
                end
            end
        )
        
        -- Запрос информации о погоде
        self.menuItems.requestWeather = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Запросить погоду",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    local serviceCoord = self:getCoordinate()
                    local weather = ATC_Utils.getWeatherInfo(serviceCoord)
                    local weatherInfo = ATC_Utils.formatWeatherInfo(weather)
                    self:sendMessage(unit, weatherInfo)
                end
            end
        )
        
        -- Запрос информации о ВПП
        self.menuItems.requestRunway = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Запросить активную ВПП",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:sendMessage(unit, "Активная ВПП " .. self.activeRunway .. ".")
                end
            end
        )
    end
    
    -- Активация меню F10
    tower.activateMenu = function(self)
        if self.menu then
            self.menu:Set()
        end
    end
    
    -- Деактивация меню F10
    tower.deactivateMenu = function(self)
        if self.menu then
            self.menu:Remove()
        end
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
            self:sendMessage(object, callsign .. ", добро пожаловать в " .. self.icao .. ". Для запроса руления используйте меню F10.")
        -- Если объект на подходе к аэродрому, информируем о необходимости запроса посадки
        elseif flightPhase == "APPROACH" or flightPhase == "DESCENT" then
            self:sendMessage(object, callsign .. ", вы вошли в зону ответственности " .. self.callsign .. ". Для запроса посадки используйте меню F10.")
        end
    end
    
    -- Уведомление о прибытии объекта от службы Approach
    tower.notifyIncomingObject = function(self, object, fromService)
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
        
        -- Добавляем объект в список отслеживаемых
        self:trackObject(object)
        
        -- Ожидаем доклада "вышел на связь"
        self:log("Ожидаем доклад 'вышел на связь' от " .. callsign)
    end
    
    -- Обработчик доклада "вышел на связь"
    tower.handleOnFrequency = function(self, object)
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
            self:sendMessage(object, callsign .. ", вас понял. Для запроса руления используйте меню F10.")
            return true
        end
        
        -- Проверка состояния ВПП
        if self.runwayStatus.isClear then
            -- Если ВПП свободна, разрешаем заход и посадку
            self:sendMessage(object, callsign .. ", вас понял. Разрешаю заход и посадку на ВПП " .. self.activeRunway .. ".")
        else
            -- Если ВПП занята, разрешаем только заход
            self:sendMessage(object, callsign .. ", вас понял. Разрешаю заход на ВПП " .. self.activeRunway .. ". Посадку дополнительно.")
            
            -- Добавляем в очередь на посадку
            table.insert(self.runwayStatus.pendingLandings, object:GetID())
        end
        
        -- Получение данных о погоде
        local serviceCoord = self:getCoordinate()
        local weather = ATC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о ветре
        local windInfo = ""
        if weather then
            windInfo = "Ветер " .. ATC_Utils.formatHeading(weather.windDirection) .. " градусов, " .. math.floor(weather.windSpeed) .. " узлов."
        end
        
        -- Отправка информации о ветре
        self:sendMessage(object, windInfo)
        
        return true
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
        
        -- Проверка состояния ВПП
        if not self.runwayStatus.isClear then
            -- Если ВПП занята, добавляем в очередь на взлет
            self:sendMessage(object, callsign .. ", ВПП " .. self.activeRunway .. " занята. Ожидайте разрешения на взлет.")
            table.insert(self.runwayStatus.pendingTakeoffs, object:GetID())
            return true
        end
        
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
        
        -- Устанавливаем статус ВПП как занятой
        self.runwayStatus.isClear = false
        
        -- Запускаем таймер для автоматического освобождения ВПП через 2 минуты
        SCHEDULER:New(nil, 
            function() 
                self:handleRunwayClearTimeout(object:GetID()) 
            end, 
            {}, 
            120 -- 2 минуты
        )
        
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
        
        -- Проверка состояния ВПП
        if not self.runwayStatus.isClear then
            -- Если ВПП занята, разрешаем только заход
            self:sendMessage(object, callsign .. ", ВПП " .. self.activeRunway .. " занята. Разрешаю заход, посадку дополнительно.")
            table.insert(self.runwayStatus.pendingLandings, object:GetID())
            return true
        end
        
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
        local response = callsign .. ", " .. windInfo .. trafficInfo .. "Разрешаю заход и посадку на ВПП " .. self.activeRunway .. "."
        
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
        
        -- Устанавливаем статус ВПП как занятой
        self.runwayStatus.isClear = false
        
        return true
    end
    
    -- Обработчик запроса на визуальный заход
    tower.handleVisualApproachRequest = function(self, object)
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
        if not self.runwayStatus.isClear then
            -- Если ВПП занята, разрешаем только заход
            self:sendMessage(object, callsign .. ", ВПП " .. self.activeRunway .. " занята. Разрешаю визуальный заход, посадку дополнительно.")
            table.insert(self.runwayStatus.pendingLandings, object:GetID())
            return true
        end
        
        -- Получение положения ВПП на "часах"
        local clockPosition = ATC_Utils.getRunwayClockPosition(object, runwayData)
        
        -- Формирование ответа
        local response = callsign .. ", разрешаю визуальный заход и посадку на ВПП " .. self.activeRunway .. ". " .. clockPosition
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Устанавливаем статус ВПП как занятой
        self.runwayStatus.isClear = false
        
        return true
    end
    
    -- Обработчик доклада "полосу наблюдаю"
    tower.handleRunwayInSight = function(self, object)
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
        if not self.runwayStatus.isClear then
            -- Если ВПП занята, разрешаем только заход
            self:sendMessage(object, callsign .. ", вас понял. ВПП " .. self.activeRunway .. " занята. Посадку дополнительно.")
            table.insert(self.runwayStatus.pendingLandings, object:GetID())
            return true
        end
        
        -- Формирование ответа
        local response = callsign .. ", вас понял. Разрешаю посадку на ВПП " .. self.activeRunway .. "."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Устанавливаем статус ВПП как занятой
        self.runwayStatus.isClear = false
        
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
        
        -- Проверка состояния ВПП
        if not self.runwayStatus.isClear then
            -- Если ВПП занята, добавляем в очередь на взлет
            self:sendMessage(object, callsign .. ", ВПП " .. self.activeRunway .. " занята. Ожидайте разрешения на взлет.")
            table.insert(self.runwayStatus.pendingTakeoffs, object:GetID())
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
        
        -- Устанавливаем статус ВПП как занятой
        self.runwayStatus.isClear = false
        
        -- Запускаем таймер для автоматического освобождения ВПП через 2 минуты
        SCHEDULER:New(nil, 
            function() 
                self:handleRunwayClearTimeout(object:GetID()) 
            end, 
            {}, 
            120 -- 2 минуты
        )
        
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
        
        -- Проверка состояния ВПП
        if not self.runwayStatus.isClear then
            -- Если ВПП занята, разрешаем только заход
            self:sendMessage(object, callsign .. ", ВПП " .. self.activeRunway .. " занята. Разрешаю заход, посадку дополнительно.")
            table.insert(self.runwayStatus.pendingLandings, object:GetID())
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
        local response = callsign .. ", " .. windInfo .. trafficInfo .. "Разрешаю заход и посадку на ВПП " .. self.activeRunway .. "."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Устанавливаем статус ВПП как занятой
        self.runwayStatus.isClear = false
        
        return true
    end
    
    -- Обработчик доклада "полосу освободил"
    tower.handleRunwayClear = function(self, object)
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
        
        -- Устанавливаем статус ВПП как свободной
        self.runwayStatus.isClear = true
        
        -- Обработка ожидающих запросов
        self:processWaitingRequests()
        
        return true
    end
    
    -- Обработчик таймаута освобождения ВПП
    tower.handleRunwayClearTimeout = function(self, objectId)
        -- Проверяем, что ВПП все еще занята
        if not self.runwayStatus.isClear then
            -- Устанавливаем статус ВПП как свободной
            self.runwayStatus.isClear = true
            
            -- Обработка ожидающих запросов
            self:processWaitingRequests()
            
            self:log("ВПП автоматически освобождена по таймауту")
        end
    end
    
    -- Обработка ожидающих запросов
    tower.processWaitingRequests = function(self)
        -- Сначала обрабатываем запросы на посадку
        if #self.runwayStatus.pendingLandings > 0 then
            local objectId = table.remove(self.runwayStatus.pendingLandings, 1)
            local object = nil
            
            -- Поиск объекта по ID
            for id, data in pairs(self.trackedObjects) do
                if id == objectId and data.object:IsAlive() then
                    object = data.object
                    break
                end
            end
            
            if object then
                local callsign = object:getCallsign() or "Aircraft"
                self:sendMessage(object, callsign .. ", ВПП " .. self.activeRunway .. " свободна. Разрешаю посадку.")
                
                -- Устанавливаем статус ВПП как занятой
                self.runwayStatus.isClear = false
            end
        -- Затем обрабатываем запросы на взлет
        elseif #self.runwayStatus.pendingTakeoffs > 0 then
            local objectId = table.remove(self.runwayStatus.pendingTakeoffs, 1)
            local object = nil
            
            -- Поиск объекта по ID
            for id, data in pairs(self.trackedObjects) do
                if id == objectId and data.object:IsAlive() then
                    object = data.object
                    break
                end
            end
            
            if object then
                local callsign = object:getCallsign() or "Aircraft"
                self:sendMessage(object, callsign .. ", ВПП " .. self.activeRunway .. " свободна. Разрешаю взлет.")
                
                -- Устанавливаем статус ВПП как занятой
                self.runwayStatus.isClear = false
                
                -- Запускаем таймер для автоматического освобождения ВПП через 2 минуты
                SCHEDULER:New(nil, 
                    function() 
                        self:handleRunwayClearTimeout(object:GetID()) 
                    end, 
                    {}, 
                    120 -- 2 минуты
                )
            end
        end
    end
    
    -- Инициализация службы
    tower:init()
    
    return tower
end

return ATC_Tower
