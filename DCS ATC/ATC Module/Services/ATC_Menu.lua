--[[
ATC_Menu.lua
Модуль меню для универсального ATC модуля
Автор: Andrey Iskrich
Дата: Апрель 2025
--]]

local ATC_Menu = {}

-- Создание нового меню
ATC_Menu.new = function(rootMenuName, coalition)
    local menu = {
        rootMenuName = rootMenuName or "ATC",
        rootMenu = nil,
        serviceMenus = {},
        isActive = false,
        coalition = coalition -- Добавление параметра коалиции
    }
    
    -- Логирование
    menu.log = function(self, message)
        if ATC_Config and ATC_Config.DEBUG then
            env.info("[ATC_Menu] " .. message)
        end
    end
    
    -- Инициализация меню
    menu.init = function(self)
        self:log("Инициализация меню" .. (self.coalition and " для коалиции " .. self.coalition or ""))
        
        -- Создание корневого меню с учетом коалиции
        if self.coalition then
            -- Создаем меню только для указанной коалиции
            self.rootMenu = missionCommands.addSubMenuForCoalition(self.coalition, self.rootMenuName)
        else
            -- Создаем общее меню для всех коалиций (для обратной совместимости)
            self.rootMenu = missionCommands.addSubMenu(self.rootMenuName)
        end
        
        -- Добавление общих пунктов меню
        self:addCommonMenuItems()
        
        self.isActive = true
        
        return true
    end
    
    -- Добавление общих пунктов меню
    menu.addCommonMenuItems = function(self)
        -- Информация о модуле
        local addCommand = function(name, parent, func)
            if self.coalition then
                return missionCommands.addCommandForCoalition(self.coalition, name, parent, func)
            else
                return missionCommands.addCommand(name, parent, func)
            end
        end
        
        local addSubMenu = function(name, parent)
            if self.coalition then
                return missionCommands.addSubMenuForCoalition(self.coalition, name, parent)
            else
                return missionCommands.addSubMenu(name, parent)
            end
        end
        
        -- Информация о модуле
        addCommand("О модуле", self.rootMenu, function()
            local message = "Универсальный ATC модуль\n"
            message = message .. "Версия: " .. ATC.VERSION .. "\n"
            
            -- Получение списка аэропортов для текущей коалиции
            local airportList = ""
            local ATC_AirportManager = require("Scripts.ATC_Module.Core.ATC_AirportManager")
            local airports = ATC_AirportManager.getAirportsForCoalition(self.coalition)
            
            if airports and #airports > 0 then
                for _, airport in ipairs(airports) do
                    airportList = airportList .. "- " .. airport.icao .. "\n"
                end
            else
                airportList = "Нет активных аэропортов"
            end
            
            message = message .. "Аэропорты:\n" .. airportList
            
            trigger.action.outText(message, 10)
        end)
        
        -- Подменю аэропортов
        local airportsMenu = addSubMenu("Аэропорты", self.rootMenu)
        
        -- Динамическое добавление аэропортов
        local ATC_AirportManager = require("Scripts.ATC_Module.Core.ATC_AirportManager")
        local airports = ATC_AirportManager.getAirportsForCoalition(self.coalition)
        
        if airports and #airports > 0 then
            for _, airport in ipairs(airports) do
                local airportMenu = addSubMenu(airport.icao, airportsMenu)
                
                -- Информация о погоде
                addCommand("Погода", airportMenu, function()
                    local serviceCoord = nil
                    
                    -- Получение координат аэропорта
                    local runways = airport.navigraph:getAllRunways()
                    for name, runway in pairs(runways) do
                        serviceCoord = COORDINATE:NewFromLLDD(runway.threshold.lat, runway.threshold.lon)
                        break
                    end
                    
                    if not serviceCoord then
                        trigger.action.outText("Не удалось получить координаты аэропорта " .. airport.icao, 10)
                        return
                    end
                    
                    -- Получение данных о погоде
                    local weather = ATC_Utils.getWeatherInfo(serviceCoord)
                    local weatherInfo = ATC_Utils.formatWeatherInfo(weather)
                    
                    trigger.action.outText(airport.icao .. ": " .. weatherInfo, 10)
                end)
                
                -- Информация о ВПП
                addCommand("Активная ВПП", airportMenu, function()
                    local runways = airport.navigraph:getAllRunways()
                    local serviceCoord = nil
                    
                    -- Получение координат аэропорта
                    for name, runway in pairs(runways) do
                        serviceCoord = COORDINATE:NewFromLLDD(runway.threshold.lat, runway.threshold.lon)
                        break
                    end
                    
                    if not serviceCoord then
                        trigger.action.outText("Не удалось получить координаты аэропорта " .. airport.icao, 10)
                        return
                    end
                    
                    -- Получение данных о погоде
                    local weather = ATC_Utils.getWeatherInfo(serviceCoord)
                    if not weather then
                        trigger.action.outText("Не удалось получить данные о погоде для " .. airport.icao, 10)
                        return
                    end
                    
                    -- Определение активной ВПП на основе ветра
                    local activeRunway = ATC_Utils.getActiveRunway(runways, weather.windDirection)
                    
                    if activeRunway then
                        trigger.action.outText(airport.icao .. ": Активная ВПП " .. activeRunway, 10)
                    else
                        trigger.action.outText(airport.icao .. ": Не удалось определить активную ВПП", 10)
                    end
                end)
                
                -- Информация о процедурах
                local proceduresMenu = addSubMenu("Процедуры", airportMenu)
                
                -- SID процедуры
                addCommand("SID", proceduresMenu, function()
                    local runways = airport.navigraph:getAllRunways()
                    local message = airport.icao .. ": SID процедуры:\n"
                    
                    for name, runway in pairs(runways) do
                        local sids = ATC_Procedures.getSIDForRunway(airport.navigraph, name)
                        
                        if sids and #sids > 0 then
                            message = message .. "ВПП " .. name .. ":\n"
                            
                            for _, sid in ipairs(sids) do
                                message = message .. "- " .. sid.name .. "\n"
                            end
                            
                            message = message .. "\n"
                        end
                    end
                    
                    trigger.action.outText(message, 20)
                end)
                
                -- STAR процедуры
                addCommand("STAR", proceduresMenu, function()
                    local runways = airport.navigraph:getAllRunways()
                    local message = airport.icao .. ": STAR процедуры:\n"
                    
                    for name, runway in pairs(runways) do
                        local stars = ATC_Procedures.getSTARForRunway(airport.navigraph, name)
                        
                        if stars and #stars > 0 then
                            message = message .. "ВПП " .. name .. ":\n"
                            
                            for _, star in ipairs(stars) do
                                message = message .. "- " .. star.name .. "\n"
                            end
                            
                            message = message .. "\n"
                        end
                    end
                    
                    trigger.action.outText(message, 20)
                end)
                
                -- Процедуры захода
                addCommand("Заходы", proceduresMenu, function()
                    local runways = airport.navigraph:getAllRunways()
                    local message = airport.icao .. ": Процедуры захода:\n"
                    
                    for name, runway in pairs(runways) do
                        local approaches = ATC_Procedures.getApproachForRunway(airport.navigraph, name)
                        
                        if approaches and #approaches > 0 then
                            message = message .. "ВПП " .. name .. ":\n"
                            
                            for _, approach in ipairs(approaches) do
                                message = message .. "- " .. approach.name .. " (" .. approach.data.type .. ")\n"
                            end
                            
                            message = message .. "\n"
                        end
                    end
                    
                    trigger.action.outText(message, 20)
                end)
                
                -- Службы аэропорта
                local servicesMenu = addSubMenu("Службы", airportMenu)
                
                -- Добавление меню для каждой службы аэропорта
                if airport.tower then
                    self:addServiceMenuForAirport(airport.tower, servicesMenu)
                end
                
                if airport.approach then
                    self:addServiceMenuForAirport(airport.approach, servicesMenu)
                end
                
                if airport.departure then
                    self:addServiceMenuForAirport(airport.departure, servicesMenu)
                end
            end
        else
            addCommand("Нет активных аэропортов", airportsMenu, function()
                trigger.action.outText("Нет активных аэропортов для данной коалиции", 10)
            end)
        end
        
        -- Настройки
        local settingsMenu = addSubMenu("Настройки", self.rootMenu)
        
        -- Включение/выключение мониторинга
        addCommand("Мониторинг ВКЛ", settingsMenu, function()
            if ATC_MonitoringManager then
                ATC_MonitoringManager.settings.enabled = true
                trigger.action.outText("Мониторинг процедур включен", 10)
            end
        end)
        
        addCommand("Мониторинг ВЫКЛ", settingsMenu, function()
            if ATC_MonitoringManager then
                ATC_MonitoringManager.settings.enabled = false
                trigger.action.outText("Мониторинг процедур выключен", 10)
            end
        end)
        
        -- Включение/выключение SRS
        addCommand("SRS ВКЛ", settingsMenu, function()
            if ATC_SRS then
                ATC_SRS.settings.enabled = true
                trigger.action.outText("SRS включен", 10)
            end
        end)
        
        addCommand("SRS ВЫКЛ", settingsMenu, function()
            if ATC_SRS then
                ATC_SRS.settings.enabled = false
                trigger.action.outText("SRS выключен", 10)
            end
        end)
        
        -- Включение/выключение отладки
        addCommand("Отладка ВКЛ", settingsMenu, function()
            if ATC_Config then
                ATC_Config.DEBUG = true
                trigger.action.outText("Режим отладки включен", 10)
            end
        end)
        
        addCommand("Отладка ВЫКЛ", settingsMenu, function()
            if ATC_Config then
                ATC_Config.DEBUG = false
                trigger.action.outText("Режим отладки выключен", 10)
            end
        end)
    end
    
    -- Добавление меню для службы ATC в контексте аэропорта
    menu.addServiceMenuForAirport = function(self, service, parentMenu)
        if not service then
            return false
        end
        
        local serviceName = service.callsign
        
        local addCommand = function(name, parent, func)
            if self.coalition then
                return missionCommands.addCommandForCoalition(self.coalition, name, parent, func)
            else
                return missionCommands.addCommand(name, parent, func)
            end
        end
        
        local addSubMenu = function(name, parent)
            if self.coalition then
                return missionCommands.addSubMenuForCoalition(self.coalition, name, parent)
            else
                return missionCommands.addSubMenu(name, parent)
            end
        end
        
        local serviceMenu = addSubMenu(serviceName, parentMenu)
        
        -- Сохранение меню службы
        self.serviceMenus[serviceName] = serviceMenu
        
        -- Включение/выключение службы
        addCommand("Включить", serviceMenu, function()
            service:start()
            trigger.action.outText("Служба " .. serviceName .. " включена", 10)
        end)
        
        addCommand("Выключить", serviceMenu, function()
            service:stop()
            trigger.action.outText("Служба " .. serviceName .. " выключена", 10)
        end)
        
        -- Информация о частоте
        addCommand("Частота", serviceMenu, function()
            local frequency = service.frequency
            trigger.action.outText("Частота " .. serviceName .. ": " .. ATC_Utils.formatFrequency(frequency), 10)
        end)
        
        -- Информация о зоне ответственности
        addCommand("Зона ответственности", serviceMenu, function()
            local range = service.range
            trigger.action.outText("Зона ответственности " .. serviceName .. ": " .. range .. " морских миль", 10)
        end)
        
        -- Информация о трафике
        addCommand("Трафик", serviceMenu, function()
            local message = "Трафик в зоне ответственности " .. serviceName .. ":\n"
            local hasTraffic = false
            
            for id, data in pairs(service.trackedObjects) do
                if data.object:isExist() then
                    hasTraffic = true
                    message = message .. "- " .. data.callsign .. " (" .. data.type .. ")\n"
                end
            end
            
            if not hasTraffic then
                message = message .. "Трафик отсутствует"
            end
            
            trigger.action.outText(message, 10)
        end)
        
        return true
    end
    
    -- Добавление меню для службы ATC (для обратной совместимости)
    menu.addServiceMenu = function(self, service)
        if not service then
            return false
        end
        
        local serviceName = service.callsign
        
        local addCommand = function(name, parent, func)
            if self.coalition then
                return missionCommands.addCommandForCoalition(self.coalition, name, parent, func)
            else
                return missionCommands.addCommand(name, parent, func)
            end
        end
        
        local addSubMenu = function(name, parent)
            if self.coalition then
                return missionCommands.addSubMenuForCoalition(self.coalition, name, parent)
            else
                return missionCommands.addSubMenu(name, parent)
            end
        end
        
        local serviceMenu = addSubMenu(serviceName, self.rootMenu)
        
        -- Сохранение меню службы
        self.serviceMenus[serviceName] = serviceMenu
        
        -- Включение/выключение службы
        addCommand("Включить", serviceMenu, function()
            service:start()
            trigger.action.outText("Служба " .. serviceName .. " включена", 10)
        end)
        
        addCommand("Выключить", serviceMenu, function()
            service:stop()
            trigger.action.outText("Служба " .. serviceName .. " выключена", 10)
        end)
        
        -- Информация о частоте
        addCommand("Частота", serviceMenu, function()
            local frequency = service.frequency
            trigger.action.outText("Частота " .. serviceName .. ": " .. ATC_Utils.formatFrequency(frequency), 10)
        end)
        
        -- Информация о зоне ответственности
        addCommand("Зона ответственности", serviceMenu, function()
            local range = service.range
            trigger.action.outText("Зона ответственности " .. serviceName .. ": " .. range .. " морских миль", 10)
        end)
        
        -- Информация о трафике
        addCommand("Трафик", serviceMenu, function()
            local message = "Трафик в зоне ответственности " .. serviceName .. ":\n"
            local hasTraffic = false
            
            for id, data in pairs(service.trackedObjects) do
                if data.object:isExist() then
                    hasTraffic = true
                    message = message .. "- " .. data.callsign .. " (" .. data.type .. ")\n"
                end
            end
            
            if not hasTraffic then
                message = message .. "Трафик отсутствует"
            end
            
            trigger.action.outText(message, 10)
        end)
        
        return true
    end
    
    -- Удаление меню
    menu.remove = function(self)
        if not self.isActive then
            return true
        end
        
        self:log("Удаление меню")
        
        -- Удаление корневого меню
        if self.coalition then
            missionCommands.removeItemForCoalition(self.coalition, self.rootMenu)
        else
            missionCommands.removeItem(self.rootMenu)
        end
        
        -- Очистка данных
        self.rootMenu = nil
        self.serviceMenus = {}
        self.isActive = false
        
        return true
    end
    
    -- Инициализация меню
    menu:init()
    
    return menu
end

return ATC_Menu
