--[[
ATC.lua
Основной файл универсального ATC модуля
Автор: Manus AI
Дата: Апрель 2025
--]]

project_path = "c:/Users/Aorus/Python Projects/DCS Scripts/Missions/DCS-LUA/DCS ATC/ATC Module/"
package.path = project_path .. "?.lua;" .. package.path

-- Загрузка основных модулей
ATC_Config = dofile(project_path .. "Core/ATC_Config.lua")
ATC_Utils = dofile(project_path .. "Core/ATC_Utils.lua")
ATC_SRS = dofile(project_path .. "Core/ATC_SRS.lua")
ATC_Procedures = dofile(project_path .. "Core/ATC_Procedures.lua")
ATC_MonitoringManager = dofile(project_path .. "Core/ATC_MonitoringManager.lua")
ATC_AirportManager = dofile(project_path .. "Core/ATC_AirportManager.lua")
ATC_Navigraph = dofile(project_path .. "Core/ATC_Navigraph.lua")
ATC_Service = dofile(project_path .. "Services/ATC_Service.lua")
ATC_Tower = dofile(project_path .. "Services/ATC_Tower.lua")
ATC_Approach = dofile(project_path .. "Services/ATC_Approach.lua")
ATC_Departure = dofile(project_path .. "Services/ATC_Departure.lua")
-- ATC_Menu = dofile(project_path .. "Services/ATC_Menu.lua")-- Основной класс модуля

ATC = {}

-- Версия модуля
ATC.VERSION = "2.1.0"

-- Логирование
ATC.log = function(message)
    if ATC_Config and ATC_Config.DEBUG then
        env.info("[ATC] " .. message)
    end
end

-- Инициализация модуля
ATC.init = function()
    ATC.log("Инициализация универсального ATC модуля версии " .. ATC.VERSION)
    
    -- Инициализация базовых модулей
    ATC_SRS.init()
    ATC_Procedures.init()
    ATC_MonitoringManager.init()
    
    -- Инициализация менеджера аэропортов
    local success = ATC_AirportManager.init()
    
    if not success then
        ATC.log("ОШИБКА: Не удалось инициализировать менеджер аэропортов")
        return false
    end
    
    ATC.log("Универсальный ATC модуль успешно инициализирован")
    return true
end

-- Получение службы Tower для указанного аэропорта
ATC.getTower = function(icao)
    if not icao then
        -- Если ICAO не указан, возвращаем первую найденную службу Tower
        for _, airport in pairs(ATC_AirportManager.getAllActiveAirports()) do
            if airport.tower then
                return airport.tower
            end
        end
        return nil
    end
    
    local airport = ATC_AirportManager.getActiveAirport(icao)
    if airport then
        return airport.tower
    end
    
    return nil
end

-- Получение службы Approach для указанного аэропорта
ATC.getApproach = function(icao)
    if not icao then
        -- Если ICAO не указан, возвращаем первую найденную службу Approach
        for _, airport in pairs(ATC_AirportManager.getAllActiveAirports()) do
            if airport.approach then
                return airport.approach
            end
        end
        return nil
    end
    
    local airport = ATC_AirportManager.getActiveAirport(icao)
    if airport then
        return airport.approach
    end
    
    return nil
end

-- Получение службы Departure для указанного аэропорта
ATC.getDeparture = function(icao)
    if not icao then
        -- Если ICAO не указан, возвращаем первую найденную службу Departure
        for _, airport in pairs(ATC_AirportManager.getAllActiveAirports()) do
            if airport.departure then
                return airport.departure
            end
        end
        return nil
    end
    
    local airport = ATC_AirportManager.getActiveAirport(icao)
    if airport then
        return airport.departure
    end
    
    return nil
end

-- Получение меню для указанного аэропорта
ATC.getMenu = function(icao)
    if not icao then
        -- Если ICAO не указан, возвращаем первое найденное меню
        for _, airport in pairs(ATC_AirportManager.getAllActiveAirports()) do
            if airport.menu then
                return airport.menu
            end
        end
        return nil
    end
    
    local airport = ATC_AirportManager.getActiveAirport(icao)
    if airport then
        return airport.menu
    end
    
    return nil
end

-- Получение ближайшей службы Tower к объекту
ATC.getNearestTower = function(object)
    if not object then
        return nil
    end
    
    local objectCoalition = object:getCoalition()
    local nearestAirport = ATC_AirportManager.getNearestActiveAirport(object, objectCoalition)
    
    if nearestAirport then
        return nearestAirport.tower
    end
    
    return nil
end

-- Получение ближайшей службы Approach к объекту
ATC.getNearestApproach = function(object)
    if not object then
        return nil
    end
    
    local objectCoalition = object:getCoalition()
    local nearestAirport = ATC_AirportManager.getNearestActiveAirport(object, objectCoalition)
    
    if nearestAirport then
        return nearestAirport.approach
    end
    
    return nil
end

-- Получение ближайшей службы Departure к объекту
ATC.getNearestDeparture = function(object)
    if not object then
        return nil
    end
    
    local objectCoalition = object:getCoalition()
    local nearestAirport = ATC_AirportManager.getNearestActiveAirport(object, objectCoalition)
    
    if nearestAirport then
        return nearestAirport.departure
    end
    
    return nil
end

-- Маршрутизация сообщения к правильной службе ATC
ATC.routeMessage = function(object, message, serviceType)
    return ATC_AirportManager.routeMessage(object, message, serviceType)
end

-- Запуск модуля
ATC.start = function()
    ATC.log("Запуск универсального ATC модуля")
    
    -- Инициализация модуля
    local success = ATC.init()
    
    if not success then
        ATC.log("ОШИБКА: Не удалось инициализировать модуль")
        return false
    end
    
    ATC.log("Универсальный ATC модуль успешно запущен")
    return true
end

-- Остановка модуля
ATC.stop = function()
    ATC.log("Остановка универсального ATC модуля")
    
    -- Деактивация всех аэропортов
    for icao, _ in pairs(ATC_AirportManager.getAllActiveAirports()) do
        ATC_AirportManager.deactivateAirport(icao)
    end
    
    -- Остановка планировщика динамической активации
    ATC_AirportManager.stopDynamicActivation()
    
    ATC.log("Универсальный ATC модуль успешно остановлен")
    return true
end

-- Получение всех активных аэропортов
ATC.getAllActiveAirports = function()
    return ATC_AirportManager.getAllActiveAirports()
end

-- Получение всех аэропортов
ATC.getAllAirports = function()
    return ATC_AirportManager.getAllAirports()
end

-- Получение аэропортов для коалиции
ATC.getAirportsForCoalition = function(coalition)
    return ATC_AirportManager.getAirportsForCoalition(coalition)
end

-- Получение активных аэропортов для коалиции
ATC.getActiveAirportsForCoalition = function(coalition)
    return ATC_AirportManager.getActiveAirportsForCoalition(coalition)
end

-- Получение ближайшего аэропорта к объекту
ATC.getNearestAirport = function(object, coalition)
    return ATC_AirportManager.getNearestAirport(object, coalition)
end

-- Получение ближайшего активного аэропорта к объекту
ATC.getNearestActiveAirport = function(object, coalition)
    return ATC_AirportManager.getNearestActiveAirport(object, coalition)
end

-- Активация аэропорта
ATC.activateAirport = function(icao)
    return ATC_AirportManager.activateAirport(icao)
end

-- Деактивация аэропорта
ATC.deactivateAirport = function(icao)
    return ATC_AirportManager.deactivateAirport(icao)
end

-- Автоматический запуск модуля при загрузке
ATC.start()

return ATC
