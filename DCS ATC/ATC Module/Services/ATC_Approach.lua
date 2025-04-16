--[[
ATC_Approach.lua
Модуль службы Approach для универсального ATC модуля
Автор: Manus AI
Дата: Апрель 2025
--]]

local ATC_Approach = {}

-- Создание новой службы Approach
ATC_Approach.new = function(icao, callsign, frequency, range, coalition)
    -- Наследование от базового класса службы ATC
    local approach = ATC_Service.new(icao, callsign, frequency, range or 50, coalition)
    
    -- Добавление ссылки на Navigraph для этого аэропорта
    approach.navigraph = nil
    
    -- Добавление меню F10
    approach.menu = nil
    approach.menuItems = {}
    
    -- Переопределение инициализации
    local baseInit = approach.init
    approach.init = function(self)
        baseInit(self)
        self:log("Инициализация службы Approach")
        
        -- Инициализация данных о ВПП
        self.runways = {}
        
        -- Если есть ссылка на Navigraph, используем её
        if self.navigraph then
            self.runways = self.navigraph:getAllRunways()
        else
            -- Иначе используем глобальный Navigraph (для обратной совместимости)            
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
    approach.updateActiveRunway = function(self)
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
    local baseStart = approach.start
    approach.start = function(self)
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
    local baseStop = approach.stop
    approach.stop = function(self)
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
    approach.initMenu = function(self)
        -- Создаем меню только если указана коалиция
        if self.coalition then
            -- Создаем корневое меню для службы
            self.menu = MENU_COALITION:New(self.coalition, self.callsign)
            
            -- Добавляем пункты меню
            self:addMenuItems()
        end
    end
    
    -- Добавление пунктов меню F10
    approach.addMenuItems = function(self)
        if not self.menu then
            return
        end
        
        -- Запрос подхода
        self.menuItems.requestApproach = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Запросить подход",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleApproachRequest(unit)
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
        
        -- Доклад о прибытии
        self.menuItems.reportInbound = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Доложить о прибытии",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleInbound(unit)
                end
            end
        )
        
        -- Доклад о готовности к заходу
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
        
        -- Подменю выбора STAR
        self.menuItems.starMenu = MENU_COALITION:New(
            self.coalition,
            "Выбрать STAR",
            self.menu
        )
        
        -- Динамически добавляем STAR процедуры для активной ВПП
        self:updateSTARMenu()
        
        -- Доклад о переходе на частоту Tower
        self.menuItems.reportSwitchingToTower = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Перехожу на частоту Вышки",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleSwitchingToTower(unit)
                end
            end
        )
    end
    
    -- Обновление меню STAR
    approach.updateSTARMenu = function(self)
        if not self.menuItems.starMenu then
            return
        end
        
        -- Удаляем существующие пункты меню STAR
        self.menuItems.starMenu:RemoveSubMenus()
        
        -- Если нет активной ВПП, выходим
        if not self.activeRunway then
            return
        end
        
        -- Получаем STAR процедуры для активной ВПП
        local stars = {}
        
        -- Если есть ссылка на Navigraph, используем её        
        if self.activeRunway then            
            stars = ATC_Procedures.getSTARForRunway(self.activeRunway)
        else
            -- Иначе используем глобальный Procedures (для обратной совместимости)
            stars = ATC_Procedures.getSTARForRunway(self.activeRunway)
        end
        
        -- Добавляем пункты меню для каждой STAR процедуры
        for _, star in ipairs(stars) do
            MENU_COALITION_COMMAND:New(
                self.coalition,
                star.name,
                self.menuItems.starMenu,
                function(group)
                    local unit = group:GetUnit(1)
                    if unit and unit:IsAlive() then
                        self:handleSTARSelection(unit, star)
                    end
                end
            )
        end
    end
    
    -- Активация меню F10
    approach.activateMenu = function(self)
        if self.menu then
            self.menu:Set()
            
            -- Обновляем меню STAR
            self:updateSTARMenu()
        end
    end
    
    -- Деактивация меню F10
    approach.deactivateMenu = function(self)
        if self.menu then
            self.menu:Remove()
        end
    end
    
    -- Обработчик нового объекта в зоне ответственности
    approach.onNewObject = function(self, object)
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
        
        -- Если объект на подходе к аэродрому, приветствуем его
        if flightPhase == "APPROACH" or flightPhase == "DESCENT" then
            self:sendMessage(object, callsign .. ", вы вошли в зону ответственности " .. self.callsign .. ". Для запроса захода используйте меню F10.")
        end
    end
    
    -- Обработчик запроса на заход
    approach.handleApproachRequest = function(self, object)
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
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос на заход. Вы на земле.")
            return true
        end
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Получение данных о погоде
        local serviceCoord = self:getCoordinate()
        local weather = ATC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о погоде
        local weatherInfo = ATC_Utils.formatWeatherInfo(weather)
        
        -- Проверка трафика
        local traffic = ATC_Utils.getTrafficInfo(object, 10)
        local trafficInfo = ATC_Utils.formatTrafficInfo(traffic)
        
        -- Формирование ответа
        local response = callsign .. ", опознан радаром. " .. weatherInfo .. " " .. trafficInfo
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Получение рекомендуемой STAR процедуры
        local objectCoord = object:GetCoordinate()
        local objectHeading = ATC_Utils.getObjectHeading(object)
        
        local recommendedSTAR = nil
        
        -- Если есть ссылка на Navigraph, используем её
        if self.navigraph then            
            recommendedSTAR = ATC_Procedures.getRecommendedSTAR(self.navigraph, self.activeRunway, objectHeading)
        else
            -- Иначе используем глобальный Procedures (для обратной совместимости)
            recommendedSTAR = ATC_Procedures.getRecommendedSTAR(self.activeRunway, objectHeading)
        end
        
        if recommendedSTAR then
            -- Отправка информации о STAR процедуре
            local starInfo = ATC_Procedures.getProcedureInfo(recommendedSTAR.data, "STAR")
            self:sendMessage(object, "Следуйте по STAR " .. recommendedSTAR.name .. " для ВПП " .. self.activeRunway .. ".")
            self:sendMessage(object, starInfo)
            
            -- Начало отслеживания выполнения процедуры
            ATC_MonitoringManager.trackObject(object, recommendedSTAR.data, "STAR", self)
        else
            -- Если нет STAR процедуры, отправляем информацию о векторении
            local runwayData = self.runways[self.activeRunway]
            if runwayData then
                local vectoringInfo = ATC_Utils.getVectoringInfo(object, runwayData)
                self:sendMessage(object, vectoringInfo)
            end
        end
        
        -- Получение службы Tower для этого аэропорта
        local towerService = nil
        
        -- Используем ATC_AirportManager для получения службы Tower
        local airport = ATC_AirportManager.getActiveAirport(self.icao)
        
        if airport and airport.tower then
            towerService = airport.tower
        end
        
        -- Информация о переходе на частоту Tower
        if towerService then
            local towerFrequency = towerService.frequency
            local towerCallsign = towerService.callsign
            
            self:sendMessage(object, "Доложите на конечном этапе захода. Затем переходите на частоту " .. towerCallsign .. ", " .. ATC_Utils.formatFrequency(towerFrequency) .. ".")
        end
        
        return true
    end
    
    -- Обработчик выбора STAR процедуры
    approach.handleSTARSelection = function(self, object, star)
        if not object or not star then
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
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос. Вы на земле.")
            return true
        end
        
        -- Отправка информации о STAR процедуре
        local starInfo = ATC_Procedures.getProcedureInfo(star.data, "STAR")
        self:sendMessage(object, callsign .. ", следуйте по STAR " .. star.name .. " для ВПП " .. self.activeRunway .. ".")
        self:sendMessage(object, starInfo)
        
        -- Начало отслеживания выполнения процедуры
        ATC_MonitoringManager.trackObject(object, star.data, "STAR", self)
        
        return true
    end
    
    -- Обработчик доклада о готовности к заходу
    approach.handleReadyForApproach = function(self, object)
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
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос. Вы на земле.")
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
        local traffic = ATC_Utils.getTrafficInfo(object, 10)
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
        
        -- Получение службы Tower для этого аэропорта
        local towerService = nil
        
        -- Используем ATC_AirportManager для получения службы Tower        
        local airport = ATC_AirportManager.getActiveAirport(self.icao)
        
        if airport and airport.tower then
            towerService = airport.tower
        end
        
        -- Информация о переходе на частоту Tower
        if towerService then
            local towerFrequency = towerService.frequency
            local towerCallsign = towerService.callsign
            
            self:sendMessage(object, "На конечном этапе захода переходите на частоту " .. towerCallsign .. ", " .. ATC_Utils.formatFrequency(towerFrequency) .. ".")
        end
        
        return true
    end
    
    -- Обработчик доклада о прибытии
    approach.handleInbound = function(self, object)
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
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос. Вы на земле.")
            return true
        end
        
        -- Получение координат объекта
        local objectCoord = object:GetCoordinate()
        
        -- Получение расстояния до аэродрома
        local serviceCoord = self:getCoordinate()
        local distance = ATC_Utils.getDistance(objectCoord, serviceCoord)
        
        -- Формирование ответа
        local response = callsign .. ", вас понял. Расстояние до аэродрома " .. math.floor(distance) .. " миль."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Обновление активной ВПП
        self:updateActiveRunway()
        
        -- Получение данных о погоде
        local weather = ATC_Utils.getWeatherInfo(serviceCoord)
        
        -- Формирование информации о погоде
        local weatherInfo = ATC_Utils.formatWeatherInfo(weather)
        
        -- Отправка информации о погоде
        self:sendMessage(object, weatherInfo)
        
        -- Информация об активной ВПП
        self:sendMessage(object, "Активная ВПП " .. self.activeRunway .. ".")
        
        -- Получение рекомендуемой STAR процедуры
        local objectHeading = ATC_Utils.getObjectHeading(object)
        
        local recommendedSTAR = nil
        
        -- Если есть ссылка на Navigraph, используем её
        if self.navigraph then            
            recommendedSTAR = ATC_Procedures.getRecommendedSTAR(self.navigraph, self.activeRunway, objectHeading)
        else
            -- Иначе используем глобальный Procedures (для обратной совместимости)
            recommendedSTAR = ATC_Procedures.getRecommendedSTAR(self.activeRunway, objectHeading)
        end
        
        if recommendedSTAR then
            -- Отправка информации о STAR процедуре
            local starInfo = ATC_Procedures.getProcedureInfo(recommendedSTAR.data, "STAR")
            self:sendMessage(object, "Следуйте по STAR " .. recommendedSTAR.name .. " для ВПП " .. self.activeRunway .. ".")
            self:sendMessage(object, starInfo)
            
            -- Начало отслеживания выполнения процедуры
            ATC_MonitoringManager.trackObject(object, recommendedSTAR.data, "STAR", self)
        end
        
        return true
    end
    
    -- Обработчик доклада о переходе на частоту Tower
    approach.handleSwitchingToTower = function(self, object)
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
            self:sendMessage(object, callsign .. ", невозможно выполнить запрос. Вы на земле.")
            return true
        end
        
        -- Получение службы Tower для этого аэропорта
        local towerService = nil
        
        -- Используем ATC_AirportManager для получения службы Tower        
        local airport = ATC_AirportManager.getActiveAirport(self.icao)
        
        if airport and airport.tower then
            towerService = airport.tower
        end
        
        -- Формирование ответа
        local response = callsign .. ", вас понял, частота свободна."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Если есть служба Tower, уведомляем её о переходе объекта
        if towerService then
            towerService:notifyIncomingObject(object, self)
        end
        
        return true
    end
    
    -- Инициализация службы
    approach:init()
    
    return approach
end

return ATC_Approach
