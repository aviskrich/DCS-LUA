--[[
ATC_AirportManager.lua
Менеджер экземпляров аэропортов для универсального ATC модуля
Автор: Andrey Iskrich
Дата: Апрель 2025
--]]

local ATC_AirportManager = {}

-- Загрузка модуля фильтрации по коалициям
ATC_CoalitionFilter = dofile(project_path .. "Core/ATC_CoalitionFilter.lua")
ATC_Utils = dofile(project_path .. "Core/ATC_Utils.lua")
ATC_Navigraph = dofile(project_path .. "Core/ATC_Navigraph.lua")

-- Таблица для хранения экземпляров аэропортов
ATC_AirportManager.airports = {}

-- Таблица для хранения активных аэропортов
ATC_AirportManager.activeAirports = {}

-- Планировщик для динамической активации аэропортов
ATC_AirportManager.scheduler = nil

-- Логирование
ATC_AirportManager.log = function(message)
    if ATC_Config and ATC_Config.DEBUG then
        env.info("[ATC_AirportManager] " .. message)
    end
end

-- Инициализация менеджера аэропортов
ATC_AirportManager.init = function()
    ATC_AirportManager.log("Инициализация менеджера аэропортов")
    
    -- Проверка наличия конфигурации
    if not ATC_Config or not ATC_Config.AIRPORTS then
        ATC_AirportManager.log("ОШИБКА: Не найдена конфигурация аэропортов")
        return false
    end
    
    -- Инициализация аэропортов из конфигурации
    for i, airportConfig in ipairs(ATC_Config.AIRPORTS) do
        if airportConfig.ENABLED then
            local success = ATC_AirportManager.initAirport(airportConfig)
            
            if not success then
                ATC_AirportManager.log("ОШИБКА: Не удалось инициализировать аэропорт " .. airportConfig.ICAO)
            end
        end
    end
    
    -- Запуск планировщика для динамической активации аэропортов
    if ATC_Config.PERFORMANCE and ATC_Config.PERFORMANCE.DYNAMIC_ACTIVATION then
        ATC_AirportManager.startDynamicActivation()
    else
        -- Если динамическая активация отключена, активируем все аэропорты сразу
        ATC_AirportManager.activateAllAirports()
    end
    
    ATC_AirportManager.log("Менеджер аэропортов успешно инициализирован")
    return true
end

-- Инициализация отдельного аэропорта
ATC_AirportManager.initAirport = function(airportConfig)
    if not airportConfig or not airportConfig.ICAO then
        return false
    end
    
    local icao = airportConfig.ICAO
    ATC_AirportManager.log("Инициализация аэропорта " .. icao)
    
    -- Создание экземпляра аэропорта
    local airport = {
        icao = icao,
        coalition = airportConfig.COALITION,
        config = airportConfig,
        isActive = false,
        navigraph = nil,
        tower = nil,
        approach = nil,
        departure = nil,
        menu = nil
    }
    
    -- Сохранение экземпляра аэропорта
    ATC_AirportManager.airports[icao] = airport
    
    ATC_AirportManager.log("Аэропорт " .. icao .. " успешно инициализирован")
    return true
end

-- Активация всех аэропортов
ATC_AirportManager.activateAllAirports = function()
    ATC_AirportManager.log("Активация всех аэропортов")
    
    for icao, airport in pairs(ATC_AirportManager.airports) do
        ATC_AirportManager.activateAirport(icao)
    end
end

-- Активация аэропорта
ATC_AirportManager.activateAirport = function(icao)
    if not icao or not ATC_AirportManager.airports[icao] then
        return false
    end
    
    local airport = ATC_AirportManager.airports[icao]
    
    -- Проверка, активирован ли уже аэропорт
    if airport.isActive then
        return true
    end
    
    ATC_AirportManager.log("Активация аэропорта " .. icao)
    
    -- Инициализация Navigraph для аэропорта
    local navigraph = ATC_Navigraph.init(icao)
    airport.navigraph = navigraph
    
    -- Загрузка данных Navigraph
    local dataPath = airport.config.NAVIGRAPH_DATA_PATH
    local success = navigraph:loadAirportData(icao, dataPath)
    
    if not success and airport.config.FALLBACK_TO_EMBEDDED then
        ATC_AirportManager.log("Не удалось загрузить данные Navigraph для " .. icao .. ", попытка загрузки встроенных данных")
        success = navigraph:loadLegacyData()
    end
    
    if not success then
        ATC_AirportManager.log("ОШИБКА: Не удалось загрузить данные аэропорта " .. icao)
        return false
    end
    
    -- Получение метаданных аэропорта
    local metadata = navigraph:getAirportMetadata()
    if not metadata then
        ATC_AirportManager.log("ОШИБКА: Не удалось получить метаданные аэропорта " .. icao)
        return false
    end
    
    -- Инициализация служб ATC
    ATC_AirportManager.initAirportServices(airport)
    
    -- Инициализация меню
    ATC_AirportManager.initAirportMenu(airport)
    
    -- Отметка аэропорта как активного
    airport.isActive = true
    ATC_AirportManager.activeAirports[icao] = airport
    
    ATC_AirportManager.log("Аэропорт " .. icao .. " успешно активирован")
    return true
end

-- Инициализация служб ATC для аэропорта
ATC_AirportManager.initAirportServices = function(airport)
    if not airport or not airport.navigraph then
        return false
    end
    
    local icao = airport.icao
    local atcConfig = airport.config.ATC
    local coalition = airport.coalition
    
    ATC_AirportManager.log("Инициализация служб ATC для аэропорта " .. icao)
    
    -- Инициализация Tower
    if atcConfig.TOWER.ENABLED then
        local towerFrequency = atcConfig.TOWER.FREQUENCY or airport.navigraph:getFrequency("TOWER")
        local towerCallsign = atcConfig.TOWER.CALLSIGN or (icao .. " Tower")
        local towerRange = atcConfig.TOWER.RANGE
        
        -- local ATC_Tower = dofile(lfs.writedir() .. "Scripts/ATC_Module/Services/ATC_Tower.lua")
        local ATC_Tower = dofile(ATC.project_path .. "Services/ATC_Tower.lua")
        airport.tower = ATC_Tower.new(icao, towerCallsign, towerFrequency, towerRange, coalition)
        airport.tower.navigraph = airport.navigraph
        airport.tower:start()
        
        ATC_AirportManager.log("Инициализирована служба Tower для " .. icao .. ": " .. towerCallsign .. ", частота: " .. towerFrequency)
    end
    
    -- Инициализация Approach
    if atcConfig.APPROACH.ENABLED then
        local approachFrequency = atcConfig.APPROACH.FREQUENCY or airport.navigraph:getFrequency("APPROACH")
        local approachCallsign = atcConfig.APPROACH.CALLSIGN or (icao .. " Approach")
        local approachRange = atcConfig.APPROACH.RANGE
        
        -- local ATC_Approach = dofile(lfs.writedir() .. "Scripts/ATC_Module/Services/ATC_Approach.lua")
        local ATC_Approach = dofile(ATC.project_path .. "Services/ATC_Approach.lua")
        airport.approach = ATC_Approach.new(icao, approachCallsign, approachFrequency, approachRange, coalition)
        airport.approach.navigraph = airport.navigraph
        airport.approach:start()
        
        ATC_AirportManager.log("Инициализирована служба Approach для " .. icao .. ": " .. approachCallsign .. ", частота: " .. approachFrequency)
    end
    
    -- Инициализация Departure
    if atcConfig.DEPARTURE.ENABLED then
        local departureFrequency = atcConfig.DEPARTURE.FREQUENCY or airport.navigraph:getFrequency("DEPARTURE")
        local departureCallsign = atcConfig.DEPARTURE.CALLSIGN or (icao .. " Departure")
        local departureRange = atcConfig.DEPARTURE.RANGE
        
        -- local ATC_Departure = dofile(lfs.writedir() .. "Scripts/ATC_Module/Services/ATC_Departure.lua")
        local ATC_Departure = dofile(ATC.project_path .. "Services/ATC_Departure.lua")
        airport.departure = ATC_Departure.new(icao, departureCallsign, departureFrequency, departureRange, coalition)
        airport.departure.navigraph = airport.navigraph
        airport.departure:start()
        
        ATC_AirportManager.log("Инициализирована служба Departure для " .. icao .. ": " .. departureCallsign .. ", частота: " .. departureFrequency)
    end
    
    return true
end

-- Инициализация меню для аэропорта
ATC_AirportManager.initAirportMenu = function(airport)
    if not airport then
        return false
    end
    
    if not ATC_Config.MENU.ENABLED then
        return false
    end
    
    local icao = airport.icao
    local coalition = airport.coalition
    
    ATC_AirportManager.log("Инициализация меню для аэропорта " .. icao)
    
    -- Определение имени меню
    local menuName = icao .. " ATC"
    
    -- Загрузка модуля меню
    -- local ATC_Menu = dofile(lfs.writedir() .. "Scripts/ATC_Module/Services/ATC_Menu.lua")
    local ATC_Menu = dofile(ATC.project_path .. "Services/ATC_Menu.lua")
    
    -- Создание меню с учетом коалиции
    airport.menu = ATC_Menu.new(menuName, coalition)
    
    -- Добавление пунктов меню для служб
    if airport.tower then
        airport.menu:addServiceMenu(airport.tower)
    end
    
    if airport.approach then
        airport.menu:addServiceMenu(airport.approach)
    end
    
    if airport.departure then
        airport.menu:addServiceMenu(airport.departure)
    end
    
    ATC_AirportManager.log("Меню для аэропорта " .. icao .. " успешно инициализировано")
    return true
end

-- Деактивация аэропорта
ATC_AirportManager.deactivateAirport = function(icao)
    if not icao or not ATC_AirportManager.airports[icao] then
        return false
    end
    
    local airport = ATC_AirportManager.airports[icao]
    
    -- Проверка, активирован ли аэропорт
    if not airport.isActive then
        return true
    end
    
    ATC_AirportManager.log("Деактивация аэропорта " .. icao)
    
    -- Остановка служб ATC
    if airport.tower then
        airport.tower:stop()
    end
    
    if airport.approach then
        airport.approach:stop()
    end
    
    if airport.departure then
        airport.departure:stop()
    end
    
    -- Удаление меню
    if airport.menu then
        airport.menu:remove()
    end
    
    -- Отметка аэропорта как неактивного
    airport.isActive = false
    ATC_AirportManager.activeAirports[icao] = nil
    
    ATC_AirportManager.log("Аэропорт " .. icao .. " успешно деактивирован")
    return true
end

-- Запуск планировщика для динамической активации аэропортов
ATC_AirportManager.startDynamicActivation = function()
    if ATC_AirportManager.scheduler then
        return
    end
    
    ATC_AirportManager.log("Запуск планировщика динамической активации аэропортов")
    
    local interval = ATC_Config.PERFORMANCE.UPDATE_INTERVAL or 10
    ATC_AirportManager.scheduler = mist.scheduleFunction(ATC_AirportManager.updateAirportActivation, {}, timer.getTime() + interval, interval)
end

-- Остановка планировщика динамической активации
ATC_AirportManager.stopDynamicActivation = function()
    if not ATC_AirportManager.scheduler then
        return
    end
    
    ATC_AirportManager.log("Остановка планировщика динамической активации аэропортов")
    
    mist.removeFunction(ATC_AirportManager.scheduler)
    ATC_AirportManager.scheduler = nil
end

-- Обновление активации аэропортов на основе близости игроков
ATC_AirportManager.updateAirportActivation = function()
    -- Проверка каждого аэропорта
    for icao, airport in pairs(ATC_AirportManager.airports) do
        local shouldActivate = false
        
        -- Получение координат аэропорта
        local airportCoord = ATC_AirportManager.getAirportCoordinate(icao)
        
        if airportCoord then
            -- Проверка близости игроков к аэропорту
            local activationRange = ATC_Config.PERFORMANCE.ACTIVATION_RANGE or 100
            
            -- Используем CoalitionFilter для проверки наличия игроков указанной коалиции в радиусе
            shouldActivate = ATC_CoalitionFilter.arePlayersInRadius(airportCoord, activationRange, airport.coalition)
        end
        
        -- Активация или деактивация аэропорта
        if shouldActivate and not airport.isActive then
            ATC_AirportManager.activateAirport(icao)
        elseif not shouldActivate and airport.isActive then
            ATC_AirportManager.deactivateAirport(icao)
        end
    end
end

-- Получение координат аэропорта
ATC_AirportManager.getAirportCoordinate = function(icao)
    if not icao then
        return nil
    end
    
    -- Если аэропорт активен, используем его Navigraph
    if ATC_AirportManager.activeAirports[icao] and ATC_AirportManager.activeAirports[icao].navigraph then
        local metadata = ATC_AirportManager.activeAirports[icao].navigraph:getAirportMetadata()
        
        if metadata and metadata.position then
            return COORDINATE:NewFromLLDD(metadata.position.lat, metadata.position.lon)
        end
    end
    
    -- Если аэропорт не активен или нет метаданных, используем данные из DCS
    local airportData = ATC_Utils.getDCSAirportData(icao)
    
    if airportData and airportData.reference_point then
        return COORDINATE:NewFromVec3(airportData.reference_point)
    end
    
    return nil
end

-- Получение экземпляра аэропорта
ATC_AirportManager.getAirport = function(icao)
    if not icao then
        return nil
    end
    
    return ATC_AirportManager.airports[icao]
end

-- Получение активного экземпляра аэропорта
ATC_AirportManager.getActiveAirport = function(icao)
    if not icao then
        return nil
    end
    
    return ATC_AirportManager.activeAirports[icao]
end

-- Получение всех активных аэропортов
ATC_AirportManager.getAllActiveAirports = function()
    return ATC_AirportManager.activeAirports
end

-- Получение всех аэропортов
ATC_AirportManager.getAllAirports = function()
    return ATC_AirportManager.airports
end

-- Получение аэропортов для коалиции
ATC_AirportManager.getAirportsForCoalition = function(coalition)
    if not coalition then
        return {}
    end
    
    local result = {}
    
    for icao, airport in pairs(ATC_AirportManager.airports) do
        if not airport.coalition or airport.coalition == coalition then
            table.insert(result, airport)
        end
    end
    
    return result
end

-- Получение активных аэропортов для коалиции
ATC_AirportManager.getActiveAirportsForCoalition = function(coalition)
    if not coalition then
        return {}
    end
    
    local result = {}
    
    for icao, airport in pairs(ATC_AirportManager.activeAirports) do
        if not airport.coalition or airport.coalition == coalition then
            table.insert(result, airport)
        end
    end
    
    return result
end

-- Получение ближайшего аэропорта к объекту с учетом коалиции
ATC_AirportManager.getNearestAirport = function(object)
    if not object then
        return nil
    end
    
    local objectCoord = object:GetCoordinate()
    local objectCoalition = object:getCoalition()
    local nearestAirport = nil
    local minDistance = math.huge
    
    -- Перебор всех аэропортов
    for icao, airport in pairs(ATC_AirportManager.airports) do
        -- Проверка коалиции с использованием CoalitionFilter
        if ATC_CoalitionFilter.isObjectInCoalition(object, airport.coalition) then
            local airportCoord = ATC_AirportManager.getAirportCoordinate(icao)
            
            if airportCoord then
                local distance = ATC_Utils.getDistance(objectCoord, airportCoord)
                
                if distance < minDistance then
                    minDistance = distance
                    nearestAirport = airport
                end
            end
        end
    end
    
    return nearestAirport, minDistance
end

-- Получение ближайшего активного аэропорта к объекту с учетом коалиции
ATC_AirportManager.getNearestActiveAirport = function(object)
    if not object then
        return nil
    end
    
    local objectCoord = object:GetCoordinate()
    local objectCoalition = object:getCoalition()
    local nearestAirport = nil
    local minDistance = math.huge
    
    -- Перебор всех активных аэропортов
    for icao, airport in pairs(ATC_AirportManager.activeAirports) do
        -- Проверка коалиции с использованием CoalitionFilter
        if ATC_CoalitionFilter.isObjectInCoalition(object, airport.coalition) then
            local airportCoord = ATC_AirportManager.getAirportCoordinate(icao)
            
            if airportCoord then
                local distance = ATC_Utils.getDistance(objectCoord, airportCoord)
                
                if distance < minDistance then
                    minDistance = distance
                    nearestAirport = airport
                end
            end
        end
    end
    
    return nearestAirport, minDistance
end

-- Получение ближайшей службы Tower к объекту с учетом коалиции
ATC_AirportManager.getNearestTower = function(object)
    local airport, distance = ATC_AirportManager.getNearestActiveAirport(object)
    
    if airport and airport.tower then
        return airport.tower, distance
    end
    
    return nil, math.huge
end

-- Получение ближайшей службы Approach к объекту с учетом коалиции
ATC_AirportManager.getNearestApproach = function(object)
    local airport, distance = ATC_AirportManager.getNearestActiveAirport(object)
    
    if airport and airport.approach then
        return airport.approach, distance
    end
    
    return nil, math.huge
end

-- Получение ближайшей службы Departure к объекту с учетом коалиции
ATC_AirportManager.getNearestDeparture = function(object)
    local airport, distance = ATC_AirportManager.getNearestActiveAirport(object)
    
    if airport and airport.departure then
        return airport.departure, distance
    end
    
    return nil, math.huge
end

-- Маршрутизация сообщения к правильной службе ATC с учетом коалиции
ATC_AirportManager.routeMessageToService = function(object, message, serviceType)
    if not object or not message or not serviceType then
        return false
    end
    
    -- Проверка типа службы
    if serviceType == "TOWER" then
        local tower, distance = ATC_AirportManager.getNearestTower(object)
        
        if tower then
            tower:handleMessage(object, message)
            return true
        end
    elseif serviceType == "APPROACH" then
        local approach, distance = ATC_AirportManager.getNearestApproach(object)
        
        if approach then
            approach:handleMessage(object, message)
            return true
        end
    elseif serviceType == "DEPARTURE" then
        local departure, distance = ATC_AirportManager.getNearestDeparture(object)
        
        if departure then
            departure:handleMessage(object, message)
            return true
        end
    end
    
    return false
end

return ATC_AirportManager
