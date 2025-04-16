--[[
ATC_Departure.lua
Модуль службы Departure для универсального ATC модуля
Автор: Manus AI
Дата: Апрель 2025
--]]

local ATC_Departure = {}

-- Создание новой службы Departure
ATC_Departure.new = function(icao, callsign, frequency, range, coalition)
    -- Наследование от базового класса службы ATC
    local departure = ATC_Service.new(icao, callsign, frequency, range or 50, coalition)
    
    -- Добавление ссылки на Navigraph для этого аэропорта
    departure.navigraph = nil
    
    -- Добавление меню F10
    departure.menu = nil
    departure.menuItems = {}
    
    -- Переопределение инициализации
    local baseInit = departure.init
    departure.init = function(self)
        baseInit(self)
        self:log("Инициализация службы Departure")
        
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
    departure.updateActiveRunway = function(self)
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
    local baseStart = departure.start
    departure.start = function(self)
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
    local baseStop = departure.stop
    departure.stop = function(self)
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
    departure.initMenu = function(self)
        -- Создаем меню только если указана коалиция
        if self.coalition then
            -- Создаем корневое меню для службы
            self.menu = MENU_COALITION:New(self.coalition, self.callsign)
            
            -- Добавляем пункты меню
            self:addMenuItems()
        end
    end
    
    -- Добавление пунктов меню F10
    departure.addMenuItems = function(self)
        if not self.menu then
            return
        end
        
        -- Доклад о выходе на связь
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
        
        -- Доклад о выходе из зоны ответственности
        self.menuItems.reportLeavingAirspace = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Выхожу из зоны ответственности",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleLeavingAirspace(unit)
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
        
        -- Запрос информации о SID
        self.menuItems.requestSID = MENU_COALITION_COMMAND:New(
            self.coalition,
            "Запросить SID",
            self.menu,
            function(group)
                local unit = group:GetUnit(1)
                if unit and unit:IsAlive() then
                    self:handleSIDRequest(unit)
                end
            end
        )
        
        -- Подменю выбора SID
        self.menuItems.sidMenu = MENU_COALITION:New(
            self.coalition,
            "Выбрать SID",
            self.menu
        )
        
        -- Динамически добавляем SID процедуры для активной ВПП
        self:updateSIDMenu()
    end
    
    -- Обновление меню SID
    departure.updateSIDMenu = function(self)
        if not self.menuItems.sidMenu then
            return
        end
        
        -- Удаляем существующие пункты меню SID
        self.menuItems.sidMenu:RemoveSubMenus()
        
        -- Если нет активной ВПП, выходим
        if not self.activeRunway then
            return
        end
        
        -- Получаем SID процедуры для активной ВПП
        local sids = {}
        
        -- Если есть ссылка на Navigraph, используем её
        if self.navigraph then
            local ATC_Procedures = require("Scripts.ATC_Module.Core.ATC_Procedures")
            sids = ATC_Procedures.getSIDForRunway(self.navigraph, self.activeRunway)
        else
            -- Иначе используем глобальный Procedures (для обратной совместимости)
            sids = ATC_Procedures.getSIDForRunway(self.activeRunway)
        end
        
        -- Добавляем пункты меню для каждой SID процедуры
        for _, sid in ipairs(sids) do
            MENU_COALITION_COMMAND:New(
                self.coalition,
                sid.name,
                self.menuItems.sidMenu,
                function(group)
                    local unit = group:GetUnit(1)
                    if unit and unit:IsAlive() then
                        self:handleSIDSelection(unit, sid)
                    end
                end
            )
        end
    end
    
    -- Активация меню F10
    departure.activateMenu = function(self)
        if self.menu then
            self.menu:Set()
            
            -- Обновляем меню SID
            self:updateSIDMenu()
        end
    end
    
    -- Деактивация меню F10
    departure.deactivateMenu = function(self)
        if self.menu then
            self.menu:Remove()
        end
    end
    
    -- Обработчик нового объекта в зоне ответственности
    departure.onNewObject = function(self, object)
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
        
        -- Если объект только что взлетел, приветствуем его
        if flightPhase == "CLIMB" then
            self:sendMessage(object, callsign .. ", вы вошли в зону ответственности " .. self.callsign .. ". Набирайте высоту по SID.")
            
            -- Получение рекомендуемой SID процедуры
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
        end
    end
    
    -- Обработчик объекта, покинувшего зону ответственности
    departure.onObjectLeft = function(self, object)
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
        
        -- Если объект на крейсерской высоте, отправляем оценку выполнения процедуры
        if flightPhase == "CRUISE" then
            -- Отправка оценки выполнения процедуры
            local evaluation = ATC_MonitoringManager.sendPerformanceEvaluation(object, self)
            
            if evaluation then
                -- Отправка прощального сообщения
                self:sendMessage(object, callsign .. ", вы покидаете зону ответственности " .. self.callsign .. ". Частота свободна, хорошего полета.")
            end
        end
    end
    
    -- Обработчик доклада о выходе на связь
    departure.handleOnFrequency = function(self, object)
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
            self:sendMessage(object, callsign .. ", вас понял. Для запроса взлета используйте службу Tower.")
            return true
        end
        
        -- Формирование ответа
        local response = callsign .. ", вас понял. Продолжайте по схеме."
        
        -- Отправка ответа
        self:sendMessage(object, response)
        
        -- Получение рекомендуемой SID процедуры
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
            self:sendMessage(object, "Следуйте по SID " .. recommendedSID.name .. ".")
            
            -- Начало отслеживания выполнения процедуры
            ATC_MonitoringManager.trackObject(object, recommendedSID.data, "SID", self)
        end
        
        return true
    end
    
    -- Обработчик запроса на SID
    departure.handleSIDRequest = function(self, object)
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
        
        -- Получение рекомендуемой SID процедуры
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
            self:sendMessage(object, "Рекомендуемый SID: " .. recommendedSID.name)
            self:sendMessage(object, sidInfo)
        else
            self:sendMessage(object, "Нет доступных SID процедур для вашего направления.")
        end
        
        return true
    end
    
    -- Обработчик выбора SID процедуры
    departure.handleSIDSelection = function(self, object, sid)
        if not object or not sid then
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
        
        -- Отправка информации о SID процедуре
        local sidInfo = ATC_Procedures.getProcedureInfo(sid.data, "SID")
        self:sendMessage(object, callsign .. ", следуйте по SID " .. sid.name .. ".")
        self:sendMessage(object, sidInfo)
        
        -- Начало отслеживания выполнения процедуры
        ATC_MonitoringManager.trackObject(object, sid.data, "SID", self)
        
        return true
    end
    
    -- Обработчик доклада о выходе из зоны ответственности
    departure.handleLeavingAirspace = function(self, object)
        if not object then
            return false
        end
        
        -- Проверка коалиции объекта
        if not self:isObjectInCoalition(object) then
            return false
        end
        
        -- Получение позывного объекта
        local callsign = object:getCallsign() or "Aircraft"
        
        -- Отправка оценки выполнения процедуры
        local evaluation = ATC_MonitoringManager.sendPerformanceEvaluation(object, self)
        
        -- Отправка подтверждения
        self:sendMessage(object, callsign .. ", вас понял, частота свободна, хорошего полета.")
        
        return true
    end
    
    -- Инициализация службы
    departure:init()
    
    return departure
end

return ATC_Departure
