--[[
DTC_ATC.lua
Основной файл универсального ATC модуля
Автор: AVIskrich
Дата: Апрель 2025
--]]

-- Загрузка основных модулей
local DTC_Config = dofile(lfs.writedir() .. "Scripts/DTC_ATC/Core/DTC_Config.lua")
local DTC_Utils = dofile(lfs.writedir() .. "Scripts/DTC_ATC/Core/DTC_Utils.lua")
local DTC_Navigraph = dofile(lfs.writedir() .. "Scripts/DTC_ATC/Core/DTC_Navigraph.lua")
local DTC_SRS = dofile(lfs.writedir() .. "Scripts/DTC_ATC/Core/DTC_SRS.lua")
local DTC_Procedures = dofile(lfs.writedir() .. "Scripts/DTC_ATC/Core/DTC_Procedures.lua")
local DTC_MonitoringManager = dofile(lfs.writedir() .. "Scripts/DTC_ATC/Core/DTC_MonitoringManager.lua")

-- Загрузка сервисных модулей
local DTC_ATC_Service = dofile(lfs.writedir() .. "Scripts/DTC_ATC/Services/DTC_ATC_Service.lua")
local DTC_Tower = dofile(lfs.writedir() .. "Scripts/DTC_ATC/Services/DTC_Tower.lua")
local DTC_Approach = dofile(lfs.writedir() .. "Scripts/DTC_ATC/Services/DTC_Approach.lua")
local DTC_Departure = dofile(lfs.writedir() .. "Scripts/DTC_ATC/Services/DTC_Departure.lua")
local DTC_Menu = dofile(lfs.writedir() .. "Scripts/DTC_ATC/Services/DTC_Menu.lua")

-- Основной класс модуля
DTC_ATC = {}

-- Версия модуля
DTC_ATC.VERSION = "1.0.0"

-- Логирование
DTC_ATC.log = function(message)
    if DTC_Config and DTC_Config.DEBUG then
        env.info("[DTC_ATC] " .. message)
    end
end

-- Инициализация модуля
DTC_ATC.init = function()
    DTC_ATC.log("Инициализация универсального ATC модуля версии " .. DTC_ATC.VERSION)
    
    -- Инициализация Navigraph
    local icao = DTC_Config.AIRPORT.ICAO
    DTC_ATC.log("Инициализация для аэропорта: " .. icao)
    
    DTC_Navigraph.init(icao)
    
    -- Загрузка данных Navigraph
    local dataPath = DTC_Config.AIRPORT.NAVIGRAPH_DATA_PATH
    local success = DTC_Navigraph.loadAirportData(icao, dataPath)
    
    if not success and DTC_Config.AIRPORT.FALLBACK_TO_EMBEDDED then
        DTC_ATC.log("Не удалось загрузить данные Navigraph, попытка загрузки встроенных данных")
        success = DTC_Navigraph.loadLegacyData()
    end
    
    if not success then
        DTC_ATC.log("ОШИБКА: Не удалось загрузить данные аэропорта")
        return false
    end
    
    -- Инициализация остальных модулей
    DTC_Procedures.init()
    DTC_SRS.init()
    DTC_MonitoringManager.init()
    
    -- Инициализация служб ATC
    DTC_ATC.initServices()
    
    -- Инициализация меню
    DTC_ATC.initMenu()
    
    DTC_ATC.log("Универсальный ATC модуль успешно инициализирован")
    return true
end

-- Инициализация служб ATC
DTC_ATC.initServices = function()
    DTC_ATC.log("Инициализация служб ATC")
    
    -- Получение метаданных аэропорта
    local metadata = DTC_Navigraph.getAirportMetadata()
    if not metadata then
        DTC_ATC.log("ОШИБКА: Не удалось получить метаданные аэропорта")
        return false
    end
    
    local icao = metadata.ICAO
    
    -- Инициализация Tower
    if DTC_Config.ATC.TOWER.ENABLED then
        local towerFrequency = DTC_Config.ATC.TOWER.FREQUENCY or DTC_Navigraph.getFrequency("TOWER")
        local towerCallsign = DTC_Config.ATC.TOWER.CALLSIGN or (icao .. " Tower")
        local towerRange = DTC_Config.ATC.TOWER.RANGE
        
        DTC_ATC.tower = DTC_Tower.new(icao, towerCallsign, towerFrequency, towerRange)
        DTC_ATC.log("Инициализирована служба Tower: " .. towerCallsign .. ", частота: " .. towerFrequency)
    end
    
    -- Инициализация Approach
    if DTC_Config.ATC.APPROACH.ENABLED then
        local approachFrequency = DTC_Config.ATC.APPROACH.FREQUENCY or DTC_Navigraph.getFrequency("APPROACH")
        local approachCallsign = DTC_Config.ATC.APPROACH.CALLSIGN or (icao .. " Approach")
        local approachRange = DTC_Config.ATC.APPROACH.RANGE
        
        DTC_ATC.approach = DTC_Approach.new(icao, approachCallsign, approachFrequency, approachRange)
        DTC_ATC.log("Инициализирована служба Approach: " .. approachCallsign .. ", частота: " .. approachFrequency)
    end
    
    -- Инициализация Departure
    if DTC_Config.ATC.DEPARTURE.ENABLED then
        local departureFrequency = DTC_Config.ATC.DEPARTURE.FREQUENCY or DTC_Navigraph.getFrequency("DEPARTURE")
        local departureCallsign = DTC_Config.ATC.DEPARTURE.CALLSIGN or (icao .. " Departure")
        local departureRange = DTC_Config.ATC.DEPARTURE.RANGE
        
        DTC_ATC.departure = DTC_Departure.new(icao, departureCallsign, departureFrequency, departureRange)
        DTC_ATC.log("Инициализирована служба Departure: " .. departureCallsign .. ", частота: " .. departureFrequency)
    end
    
    return true
end

-- Инициализация меню
DTC_ATC.initMenu = function()
    if not DTC_Config.MENU.ENABLED then
        DTC_ATC.log("Меню отключено в настройках")
        return false
    end
    
    local icao = DTC_Config.AIRPORT.ICAO
    local menuName = DTC_Config.MENU.ROOT_MENU_NAME or (icao .. " ATC")
    
    DTC_ATC.menu = DTC_Menu.new(menuName)
    
    -- Добавление пунктов меню для служб
    if DTC_ATC.tower then
        DTC_ATC.menu:addServiceMenu(DTC_ATC.tower)
    end
    
    if DTC_ATC.approach then
        DTC_ATC.menu:addServiceMenu(DTC_ATC.approach)
    end
    
    if DTC_ATC.departure then
        DTC_ATC.menu:addServiceMenu(DTC_ATC.departure)
    end
    
    DTC_ATC.log("Меню успешно инициализировано")
    return true
end

-- Получение службы Tower
DTC_ATC.getTower = function()
    return DTC_ATC.tower
end

-- Получение службы Approach
DTC_ATC.getApproach = function()
    return DTC_ATC.approach
end

-- Получение службы Departure
DTC_ATC.getDeparture = function()
    return DTC_ATC.departure
end

-- Получение меню
DTC_ATC.getMenu = function()
    return DTC_ATC.menu
end

-- Запуск модуля
DTC_ATC.start = function()
    DTC_ATC.log("Запуск универсального ATC модуля")
    
    -- Инициализация модуля
    local success = DTC_ATC.init()
    
    if not success then
        DTC_ATC.log("ОШИБКА: Не удалось инициализировать модуль")
        return false
    end
    
    -- Запуск служб
    if DTC_ATC.tower then
        DTC_ATC.tower:start()
    end
    
    if DTC_ATC.approach then
        DTC_ATC.approach:start()
    end
    
    if DTC_ATC.departure then
        DTC_ATC.departure:start()
    end
    
    DTC_ATC.log("Универсальный ATC модуль успешно запущен")
    return true
end

-- Остановка модуля
DTC_ATC.stop = function()
    DTC_ATC.log("Остановка универсального ATC модуля")
    
    -- Остановка служб
    if DTC_ATC.tower then
        DTC_ATC.tower:stop()
    end
    
    if DTC_ATC.approach then
        DTC_ATC.approach:stop()
    end
    
    if DTC_ATC.departure then
        DTC_ATC.departure:stop()
    end
    
    -- Удаление меню
    if DTC_ATC.menu then
        DTC_ATC.menu:remove()
    end
    
    DTC_ATC.log("Универсальный ATC модуль успешно остановлен")
    return true
end

-- Автоматический запуск модуля при загрузке
DTC_ATC.start()

return DTC_ATC
