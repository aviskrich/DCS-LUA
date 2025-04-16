--[[
ATC_Test_MultiAirport.lua
Тестовый скрипт для проверки мульти-аэропортовой функциональности ATC модуля
Автор: Manus AI
Дата: Апрель 2025
--]]

-- Инициализация тестового окружения
local function initTestEnvironment()
    env.info("[ATC_Test_MultiAirport] Инициализация тестового окружения")
    
    -- Проверка наличия необходимых модулей
    if not ATC then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Модуль ATC не найден")
        return false
    end
    
    if not ATC_AirportManager then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Модуль ATC_AirportManager не найден")
        return false
    end
    
    if not ATC_CoalitionFilter then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Модуль ATC_CoalitionFilter не найден")
        return false
    end
    
    env.info("[ATC_Test_MultiAirport] Тестовое окружение успешно инициализировано")
    return true
end

-- Тестирование конфигурации для нескольких аэропортов
local function testMultiAirportConfig()
    env.info("[ATC_Test_MultiAirport] Тестирование конфигурации для нескольких аэропортов")
    
    -- Проверка наличия конфигурации
    if not ATC_Config or not ATC_Config.AIRPORTS then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Конфигурация аэропортов не найдена")
        return false
    end
    
    -- Проверка наличия нескольких аэропортов
    if #ATC_Config.AIRPORTS < 2 then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: В конфигурации должно быть не менее двух аэропортов")
        return false
    end
    
    -- Проверка наличия аэропортов для разных коалиций
    local hasBlueAirport = false
    local hasRedAirport = false
    
    for _, airport in ipairs(ATC_Config.AIRPORTS) do
        if airport.COALITION == coalition.side.BLUE then
            hasBlueAirport = true
        elseif airport.COALITION == coalition.side.RED then
            hasRedAirport = true
        end
    end
    
    if not hasBlueAirport then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Отсутствуют аэропорты для синей коалиции")
        return false
    end
    
    if not hasRedAirport then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Отсутствуют аэропорты для красной коалиции")
        return false
    end
    
    env.info("[ATC_Test_MultiAirport] Конфигурация для нескольких аэропортов успешно проверена")
    return true
end

-- Тестирование инициализации аэропортов
local function testAirportInitialization()
    env.info("[ATC_Test_MultiAirport] Тестирование инициализации аэропортов")
    
    -- Получение всех аэропортов
    local airports = ATC_AirportManager.getAllAirports()
    
    if not airports or ATC_Utils.tableLength(airports) == 0 then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Не удалось получить список аэропортов")
        return false
    end
    
    -- Проверка инициализации каждого аэропорта
    for icao, airport in pairs(airports) do
        env.info("[ATC_Test_MultiAirport] Проверка аэропорта " .. icao)
        
        -- Активация аэропорта
        local success = ATC_AirportManager.activateAirport(icao)
        
        if not success then
            env.info("[ATC_Test_MultiAirport] ОШИБКА: Не удалось активировать аэропорт " .. icao)
            return false
        end
        
        -- Проверка наличия Navigraph
        if not airport.navigraph then
            env.info("[ATC_Test_MultiAirport] ОШИБКА: Отсутствует Navigraph для аэропорта " .. icao)
            return false
        end
        
        -- Проверка наличия служб ATC
        if not airport.tower and not airport.approach and not airport.departure then
            env.info("[ATC_Test_MultiAirport] ОШИБКА: Отсутствуют службы ATC для аэропорта " .. icao)
            return false
        end
        
        -- Проверка наличия меню
        if ATC_Config.MENU.ENABLED and not airport.menu then
            env.info("[ATC_Test_MultiAirport] ОШИБКА: Отсутствует меню для аэропорта " .. icao)
            return false
        end
        
        -- Деактивация аэропорта
        ATC_AirportManager.deactivateAirport(icao)
    end
    
    env.info("[ATC_Test_MultiAirport] Инициализация аэропортов успешно проверена")
    return true
end

-- Тестирование фильтрации по коалициям
local function testCoalitionFiltering()
    env.info("[ATC_Test_MultiAirport] Тестирование фильтрации по коалициям")
    
    -- Создание тестовых объектов для разных коалиций
    local blueObject = {
        getCoalition = function() return coalition.side.BLUE end,
        isExist = function() return true end,
        GetCoordinate = function() return COORDINATE:New(0, 0, 0) end
    }
    
    local redObject = {
        getCoalition = function() return coalition.side.RED end,
        isExist = function() return true end,
        GetCoordinate = function() return COORDINATE:New(0, 0, 0) end
    }
    
    local neutralObject = {
        getCoalition = function() return coalition.side.NEUTRAL end,
        isExist = function() return true end,
        GetCoordinate = function() return COORDINATE:New(0, 0, 0) end
    }
    
    -- Проверка фильтрации объектов
    if not ATC_CoalitionFilter.isObjectInCoalition(blueObject, coalition.side.BLUE) then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Синий объект не определен как принадлежащий синей коалиции")
        return false
    end
    
    if ATC_CoalitionFilter.isObjectInCoalition(blueObject, coalition.side.RED) then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Синий объект определен как принадлежащий красной коалиции")
        return false
    end
    
    if not ATC_CoalitionFilter.isObjectInCoalition(redObject, coalition.side.RED) then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Красный объект не определен как принадлежащий красной коалиции")
        return false
    end
    
    if ATC_CoalitionFilter.isObjectInCoalition(redObject, coalition.side.BLUE) then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Красный объект определен как принадлежащий синей коалиции")
        return false
    end
    
    -- Проверка фильтрации нейтральных объектов
    ATC_CoalitionFilter.setNeutralFiltering(false)
    if not ATC_CoalitionFilter.isObjectInCoalition(neutralObject, coalition.side.BLUE) then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Нейтральный объект не проходит фильтрацию при отключенной фильтрации нейтральных")
        return false
    end
    
    ATC_CoalitionFilter.setNeutralFiltering(true)
    if ATC_CoalitionFilter.isObjectInCoalition(neutralObject, coalition.side.BLUE) then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Нейтральный объект проходит фильтрацию при включенной фильтрации нейтральных")
        return false
    end
    
    -- Восстановление настроек
    ATC_CoalitionFilter.setNeutralFiltering(false)
    
    env.info("[ATC_Test_MultiAirport] Фильтрация по коалициям успешно проверена")
    return true
end

-- Тестирование маршрутизации сообщений
local function testMessageRouting()
    env.info("[ATC_Test_MultiAirport] Тестирование маршрутизации сообщений")
    
    -- Активация всех аэропортов для тестирования
    ATC_AirportManager.activateAllAirports()
    
    -- Создание тестовых объектов для разных коалиций
    local blueObject = {
        getCoalition = function() return coalition.side.BLUE end,
        isExist = function() return true end,
        GetCoordinate = function() return COORDINATE:New(0, 0, 0) end
    }
    
    local redObject = {
        getCoalition = function() return coalition.side.RED end,
        isExist = function() return true end,
        GetCoordinate = function() return COORDINATE:New(0, 0, 0) end
    }
    
    -- Получение ближайших служб для синего объекта
    local blueTower = ATC_AirportManager.getNearestTower(blueObject)
    local blueApproach = ATC_AirportManager.getNearestApproach(blueObject)
    local blueDeparture = ATC_AirportManager.getNearestDeparture(blueObject)
    
    -- Получение ближайших служб для красного объекта
    local redTower = ATC_AirportManager.getNearestTower(redObject)
    local redApproach = ATC_AirportManager.getNearestApproach(redObject)
    local redDeparture = ATC_AirportManager.getNearestDeparture(redObject)
    
    -- Проверка наличия служб для синего объекта
    if not blueTower then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Не найдена служба Tower для синего объекта")
        return false
    end
    
    if not blueApproach then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Не найдена служба Approach для синего объекта")
        return false
    end
    
    if not blueDeparture then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Не найдена служба Departure для синего объекта")
        return false
    end
    
    -- Проверка наличия служб для красного объекта
    if not redTower then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Не найдена служба Tower для красного объекта")
        return false
    end
    
    if not redApproach then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Не найдена служба Approach для красного объекта")
        return false
    end
    
    if not redDeparture then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Не найдена служба Departure для красного объекта")
        return false
    end
    
    -- Проверка принадлежности служб к правильным коалициям
    if blueTower.coalition ~= coalition.side.BLUE then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Служба Tower для синего объекта не принадлежит синей коалиции")
        return false
    end
    
    if redTower.coalition ~= coalition.side.RED then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Служба Tower для красного объекта не принадлежит красной коалиции")
        return false
    end
    
    -- Проверка маршрутизации сообщений
    local blueRouteSuccess = ATC_AirportManager.routeMessageToService(blueObject, "Test message", "TOWER")
    local redRouteSuccess = ATC_AirportManager.routeMessageToService(redObject, "Test message", "TOWER")
    
    if not blueRouteSuccess then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Не удалось маршрутизировать сообщение для синего объекта")
        return false
    end
    
    if not redRouteSuccess then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Не удалось маршрутизировать сообщение для красного объекта")
        return false
    end
    
    env.info("[ATC_Test_MultiAirport] Маршрутизация сообщений успешно проверена")
    return true
end

-- Тестирование динамической активации аэропортов
local function testDynamicActivation()
    env.info("[ATC_Test_MultiAirport] Тестирование динамической активации аэропортов")
    
    -- Деактивация всех аэропортов
    for icao, airport in pairs(ATC_AirportManager.getAllAirports()) do
        ATC_AirportManager.deactivateAirport(icao)
    end
    
    -- Проверка, что все аэропорты деактивированы
    local activeAirports = ATC_AirportManager.getAllActiveAirports()
    if ATC_Utils.tableLength(activeAirports) > 0 then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Не все аэропорты деактивированы")
        return false
    end
    
    -- Запуск динамической активации
    ATC_AirportManager.startDynamicActivation()
    
    -- Имитация обновления активации аэропортов
    ATC_AirportManager.updateAirportActivation()
    
    -- Остановка динамической активации
    ATC_AirportManager.stopDynamicActivation()
    
    env.info("[ATC_Test_MultiAirport] Динамическая активация аэропортов успешно проверена")
    return true
end

-- Запуск всех тестов
local function runAllTests()
    env.info("[ATC_Test_MultiAirport] Запуск тестирования мульти-аэропортовой функциональности")
    
    local allTestsPassed = true
    
    -- Инициализация тестового окружения
    if not initTestEnvironment() then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Не удалось инициализировать тестовое окружение")
        return false
    end
    
    -- Тестирование конфигурации для нескольких аэропортов
    if not testMultiAirportConfig() then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Тестирование конфигурации для нескольких аэропортов не пройдено")
        allTestsPassed = false
    end
    
    -- Тестирование инициализации аэропортов
    if not testAirportInitialization() then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Тестирование инициализации аэропортов не пройдено")
        allTestsPassed = false
    end
    
    -- Тестирование фильтрации по коалициям
    if not testCoalitionFiltering() then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Тестирование фильтрации по коалициям не пройдено")
        allTestsPassed = false
    end
    
    -- Тестирование маршрутизации сообщений
    if not testMessageRouting() then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Тестирование маршрутизации сообщений не пройдено")
        allTestsPassed = false
    end
    
    -- Тестирование динамической активации аэропортов
    if not testDynamicActivation() then
        env.info("[ATC_Test_MultiAirport] ОШИБКА: Тестирование динамической активации аэропортов не пройдено")
        allTestsPassed = false
    end
    
    if allTestsPassed then
        env.info("[ATC_Test_MultiAirport] Все тесты успешно пройдены")
    else
        env.info("[ATC_Test_MultiAirport] ВНИМАНИЕ: Некоторые тесты не пройдены")
    end
    
    return allTestsPassed
end

-- Запуск тестирования
runAllTests()
