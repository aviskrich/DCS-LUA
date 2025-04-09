--[[
DTC_Menu.lua
Модуль меню для универсального ATC модуля
Автор: AVIskrich
Дата: Апрель 2025
--]]

local DTC_Menu = {}

-- Создание нового меню
DTC_Menu.new = function(rootMenuName)
    local menu = {
        rootMenuName = rootMenuName or "ATC",
        rootMenu = nil,
        serviceMenus = {},
        isActive = false
    }
    
    -- Логирование
    menu.log = function(self, message)
        if DTC_Config and DTC_Config.DEBUG then
            env.info("[DTC_Menu] " .. message)
        end
    end
    
    -- Инициализация меню
    menu.init = function(self)
        self:log("Инициализация меню")
        
        -- Создание корневого меню
        self.rootMenu = missionCommands.addSubMenu(self.rootMenuName)
        
        -- Добавление общих пунктов меню
        self:addCommonMenuItems()
        
        self.isActive = true
        
        return true
    end
    
    -- Добавление общих пунктов меню
    menu.addCommonMenuItems = function(self)
        -- Информация о модуле
        missionCommands.addCommand("О модуле", self.rootMenu, function()
            local message = "Универсальный ATC модуль\n"
            message = message .. "Версия: " .. DTC_ATC.VERSION .. "\n"
            message = message .. "Аэропорт: " .. DTC_Config.AIRPORT.ICAO .. "\n"
            
            trigger.action.outText(message, 10)
        end)
        
        -- Информация о погоде
        missionCommands.addCommand("Погода", self.rootMenu, function()
            local serviceCoord = nil
            
            -- Получение координат аэропорта
            local runways = DTC_Navigraph.getAllRunways()
            for name, runway in pairs(runways) do
                serviceCoord = COORDINATE:NewFromLLDD(runway.threshold.lat, runway.threshold.lon)
                break
            end
            
            if not serviceCoord then
                trigger.action.outText("Не удалось получить координаты аэропорта", 10)
                return
            end
            
            -- Получение данных о погоде
            local weather = DTC_Utils.getWeatherInfo(serviceCoord)
            local weatherInfo = DTC_Utils.formatWeatherInfo(weather)
            
            trigger.action.outText(weatherInfo, 10)
        end)
        
        -- Информация о ВПП
        missionCommands.addCommand("Активная ВПП", self.rootMenu, function()
            local runways = DTC_Navigraph.getAllRunways()
            local serviceCoord = nil
            
            -- Получение координат аэропорта
            for name, runway in pairs(runways) do
                serviceCoord = COORDINATE:NewFromLLDD(runway.threshold.lat, runway.threshold.lon)
                break
            end
            
            if not serviceCoord then
                trigger.action.outText("Не удалось получить координаты аэропорта", 10)
                return
            end
            
            -- Получение данных о погоде
            local weather = DTC_Utils.getWeatherInfo(serviceCoord)
            if not weather then
                trigger.action.outText("Не удалось получить данные о погоде", 10)
                return
            end
            
            -- Определение активной ВПП на основе ветра
            local activeRunway = DTC_Utils.getActiveRunway(runways, weather.windDirection)
            
            if activeRunway then
                trigger.action.outText("Активная ВПП: " .. activeRunway, 10)
            else
                trigger.action.outText("Не удалось определить активную ВПП", 10)
            end
        end)
        
        -- Информация о процедурах
        local proceduresMenu = missionCommands.addSubMenu("Процедуры", self.rootMenu)
        
        -- SID процедуры
        missionCommands.addCommand("SID", proceduresMenu, function()
            local runways = DTC_Navigraph.getAllRunways()
            local message = "SID процедуры:\n"
            
            for name, runway in pairs(runways) do
                local sids = DTC_Procedures.getSIDForRunway(name)
                
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
        missionCommands.addCommand("STAR", proceduresMenu, function()
            local runways = DTC_Navigraph.getAllRunways()
            local message = "STAR процедуры:\n"
            
            for name, runway in pairs(runways) do
                local stars = DTC_Procedures.getSTARForRunway(name)
                
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
        missionCommands.addCommand("Заходы", proceduresMenu, function()
            local runways = DTC_Navigraph.getAllRunways()
            local message = "Процедуры захода:\n"
            
            for name, runway in pairs(runways) do
                local approaches = DTC_Procedures.getApproachForRunway(name)
                
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
        
        -- Настройки
        local settingsMenu = missionCommands.addSubMenu("Настройки", self.rootMenu)
        
        -- Включение/выключение мониторинга
        missionCommands.addCommand("Мониторинг ВКЛ", settingsMenu, function()
            if DTC_MonitoringManager then
                DTC_MonitoringManager.settings.enabled = true
                trigger.action.outText("Мониторинг процедур включен", 10)
            end
        end)
        
        missionCommands.addCommand("Мониторинг ВЫКЛ", settingsMenu, function()
            if DTC_MonitoringManager then
                DTC_MonitoringManager.settings.enabled = false
                trigger.action.outText("Мониторинг процедур выключен", 10)
            end
        end)
        
        -- Включение/выключение SRS
        missionCommands.addCommand("SRS ВКЛ", settingsMenu, function()
            if DTC_SRS then
                DTC_SRS.settings.enabled = true
                trigger.action.outText("SRS включен", 10)
            end
        end)
        
        missionCommands.addCommand("SRS ВЫКЛ", settingsMenu, function()
            if DTC_SRS then
                DTC_SRS.settings.enabled = false
                trigger.action.outText("SRS выключен", 10)
            end
        end)
        
        -- Включение/выключение отладки
        missionCommands.addCommand("Отладка ВКЛ", settingsMenu, function()
            if DTC_Config then
                DTC_Config.DEBUG = true
                trigger.action.outText("Режим отладки включен", 10)
            end
        end)
        
        missionCommands.addCommand("Отладка ВЫКЛ", settingsMenu, function()
            if DTC_Config then
                DTC_Config.DEBUG = false
                trigger.action.outText("Режим отладки выключен", 10)
            end
        end)
    end
    
    -- Добавление меню для службы ATC
    menu.addServiceMenu = function(self, service)
        if not service then
            return false
        end
        
        local serviceName = service.callsign
        local serviceMenu = missionCommands.addSubMenu(serviceName, self.rootMenu)
        
        -- Сохранение меню службы
        self.serviceMenus[serviceName] = serviceMenu
        
        -- Включение/выключение службы
        missionCommands.addCommand("Включить", serviceMenu, function()
            service:start()
            trigger.action.outText("Служба " .. serviceName .. " включена", 10)
        end)
        
        missionCommands.addCommand("Выключить", serviceMenu, function()
            service:stop()
            trigger.action.outText("Служба " .. serviceName .. " выключена", 10)
        end)
        
        -- Информация о частоте
        missionCommands.addCommand("Частота", serviceMenu, function()
            local frequency = service.frequency
            trigger.action.outText("Частота " .. serviceName .. ": " .. DTC_Utils.formatFrequency(frequency), 10)
        end)
        
        -- Информация о зоне ответственности
        missionCommands.addCommand("Зона ответственности", serviceMenu, function()
            local range = service.range
            trigger.action.outText("Зона ответственности " .. serviceName .. ": " .. range .. " морских миль", 10)
        end)
        
        -- Информация о трафике
        missionCommands.addCommand("Трафик", serviceMenu, function()
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
        missionCommands.removeItem(self.rootMenu)
        
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

return DTC_Menu
