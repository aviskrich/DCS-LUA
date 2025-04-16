--[[
ATC_Menu_Test.lua
Тестовый скрипт для проверки функциональности меню F10 в ATC модуле
Автор: Manus AI
Дата: Апрель 2025
--]]


project_path = "c:/Users/Aorus/Python Projects/DCS Scripts/Missions/DCS-LUA/DCS ATC/ATC Module/"
package.path = project_path .. "?.lua;" .. package.path

-- Загрузка основных модулей
local ATC_Config = dofile(project_path .. "Core/ATC_Config.lua")
local ATC_Utils = dofile(project_path .. "Core/ATC_Utils.lua")
local ATC_SRS = dofile(project_path .. "Core/ATC_SRS.lua")
local ATC_Procedures = dofile(project_path .. "Core/ATC_Procedures.lua")
local ATC_MonitoringManager = dofile(project_path .. "Core/ATC_MonitoringManager.lua")
local ATC_AirportManager = dofile(project_path .. "Core/ATC_AirportManager.lua")
local ATC_Service = dofile(project_path .. "Services/ATC_Service.lua")
local ATC_Tower = dofile(project_path .. "Services/ATC_Tower.lua")
local ATC_Approach = dofile(project_path .. "Services/ATC_Approach.lua")
local ATC_Departure = dofile(project_path .. "Services/ATC_Departure.lua")
local ATC_Menu = dofile(project_path .. "Services/ATC_Menu.lua")

-- Инициализация тестового окружения
local function initTestEnvironment()
    env.info("[ATC_TEST] Инициализация тестового окружения")
    
    -- Создание тестовых служб для аэропорта UUWW (Внуково)
    local tower = ATC_Tower.new("UUWW", "Внуково-Вышка", 118.9, 30, coalition.side.BLUE)
    local approach = ATC_Approach.new("UUWW", "Внуково-Подход", 124.0, 50, coalition.side.BLUE)
    local departure = ATC_Departure.new("UUWW", "Внуково-Выход", 125.5, 50, coalition.side.BLUE)
    
    -- Интеграция служб
    ATC_TowerApproach_Handoff.registerServices(tower, approach)
    ATC_RunwayManager.integrateWithTower(tower)
    ATC_VisualApproach.integrateWithTower(tower)
    
    -- Запуск служб
    tower:start()
    approach:start()
    departure:start()
    
    env.info("[ATC_TEST] Тестовое окружение инициализировано")
    
    return {
        tower = tower,
        approach = approach,
        departure = departure
    }
end

-- Тестирование меню Tower
local function testTowerMenu(tower)
    env.info("[ATC_TEST] Тестирование меню Tower")
    
    -- Проверка наличия меню
    if not tower.menu then
        env.info("[ATC_TEST] ОШИБКА: Меню Tower не создано")
        return false
    end
    
    -- Проверка наличия пунктов меню
    local requiredMenuItems = {
        "requestTaxi",
        "requestTakeoff",
        "requestLanding",
        "requestVisualApproach",
        "reportRunwayInSight",
        "reportReadyForTakeoff",
        "reportReadyForApproach",
        "reportRunwayClear",
        "reportOnFrequency",
        "requestWeather",
        "requestRunway"
    }
    
    for _, item in ipairs(requiredMenuItems) do
        if not tower.menuItems[item] then
            env.info("[ATC_TEST] ОШИБКА: Пункт меню Tower '" .. item .. "' отсутствует")
            return false
        end
    end
    
    env.info("[ATC_TEST] Меню Tower успешно протестировано")
    return true
end

-- Тестирование меню Approach
local function testApproachMenu(approach)
    env.info("[ATC_TEST] Тестирование меню Approach")
    
    -- Проверка наличия меню
    if not approach.menu then
        env.info("[ATC_TEST] ОШИБКА: Меню Approach не создано")
        return false
    end
    
    -- Проверка наличия пунктов меню
    local requiredMenuItems = {
        "requestApproach",
        "requestWeather",
        "requestRunway",
        "reportInbound",
        "reportReadyForApproach",
        "starMenu",
        "reportSwitchingToTower"
    }
    
    for _, item in ipairs(requiredMenuItems) do
        if not approach.menuItems[item] then
            env.info("[ATC_TEST] ОШИБКА: Пункт меню Approach '" .. item .. "' отсутствует")
            return false
        end
    end
    
    env.info("[ATC_TEST] Меню Approach успешно протестировано")
    return true
end

-- Тестирование меню Departure
local function testDepartureMenu(departure)
    env.info("[ATC_TEST] Тестирование меню Departure")
    
    -- Проверка наличия меню
    if not departure.menu then
        env.info("[ATC_TEST] ОШИБКА: Меню Departure не создано")
        return false
    end
    
    -- Проверка наличия пунктов меню
    local requiredMenuItems = {
        "reportOnFrequency",
        "reportLeavingAirspace",
        "requestWeather",
        "requestSID",
        "sidMenu"
    }
    
    for _, item in ipairs(requiredMenuItems) do
        if not departure.menuItems[item] then
            env.info("[ATC_TEST] ОШИБКА: Пункт меню Departure '" .. item .. "' отсутствует")
            return false
        end
    end
    
    env.info("[ATC_TEST] Меню Departure успешно протестировано")
    return true
end

-- Тестирование интеграции Tower-Approach
local function testTowerApproachHandoff(tower, approach)
    env.info("[ATC_TEST] Тестирование интеграции Tower-Approach")
    
    -- Проверка наличия ссылок между службами
    if not tower.approachService then
        env.info("[ATC_TEST] ОШИБКА: Ссылка на Approach в Tower отсутствует")
        return false
    end
    
    if not approach.towerService then
        env.info("[ATC_TEST] ОШИБКА: Ссылка на Tower в Approach отсутствует")
        return false
    end
    
    -- Проверка наличия методов для передачи управления
    if not approach.notifyTransferToTower then
        env.info("[ATC_TEST] ОШИБКА: Метод notifyTransferToTower в Approach отсутствует")
        return false
    end
    
    if not tower.notifyIncomingObject then
        env.info("[ATC_TEST] ОШИБКА: Метод notifyIncomingObject в Tower отсутствует")
        return false
    end
    
    env.info("[ATC_TEST] Интеграция Tower-Approach успешно протестирована")
    return true
end

-- Тестирование управления ВПП
local function testRunwayManagement(tower)
    env.info("[ATC_TEST] Тестирование управления ВПП")
    
    -- Проверка инициализации ВПП
    local runwayManager = require("Core.ATC_RunwayManager")
    
    if not runwayManager.runwayStatus[tower.icao] then
        env.info("[ATC_TEST] ОШИБКА: Статус ВПП для аэропорта " .. tower.icao .. " не инициализирован")
        return false
    end
    
    -- Проверка методов управления ВПП
    local testMethods = {
        "isRunwayClear",
        "occupyRunway",
        "clearRunway",
        "addToPendingLandings",
        "addToPendingTakeoffs",
        "getNextPendingLanding",
        "getNextPendingTakeoff",
        "processQueues"
    }
    
    for _, method in ipairs(testMethods) do
        if not runwayManager[method] then
            env.info("[ATC_TEST] ОШИБКА: Метод " .. method .. " в RunwayManager отсутствует")
            return false
        end
    end
    
    env.info("[ATC_TEST] Управление ВПП успешно протестировано")
    return true
end

-- Тестирование визуальных заходов
local function testVisualApproach(tower)
    env.info("[ATC_TEST] Тестирование визуальных заходов")
    
    -- Проверка методов модуля визуальных заходов
    local visualApproach = require("Core.ATC_VisualApproach")
    
    local testMethods = {
        "checkWeatherConditions",
        "checkDistance",
        "getRunwayClockPosition",
        "handleRequest",
        "handleRunwayInSight"
    }
    
    for _, method in ipairs(testMethods) do
        if not visualApproach[method] then
            env.info("[ATC_TEST] ОШИБКА: Метод " .. method .. " в VisualApproach отсутствует")
            return false
        end
    end
    
    env.info("[ATC_TEST] Визуальные заходы успешно протестированы")
    return true
end

-- Запуск всех тестов
local function runAllTests()
    env.info("[ATC_TEST] Запуск всех тестов")
    
    -- Инициализация тестового окружения
    local services = initTestEnvironment()
    
    -- Запуск тестов
    local testResults = {
        towerMenu = testTowerMenu(services.tower),
        approachMenu = testApproachMenu(services.approach),
        departureMenu = testDepartureMenu(services.departure),
        towerApproachHandoff = testTowerApproachHandoff(services.tower, services.approach),
        runwayManagement = testRunwayManagement(services.tower),
        visualApproach = testVisualApproach(services.tower)
    }
    
    -- Вывод результатов
    env.info("[ATC_TEST] Результаты тестирования:")
    for test, result in pairs(testResults) do
        env.info("[ATC_TEST] " .. test .. ": " .. (result and "УСПЕХ" or "ОШИБКА"))
    end
    
    -- Остановка служб
    services.tower:stop()
    services.approach:stop()
    services.departure:stop()
    
    env.info("[ATC_TEST] Тестирование завершено")
    
    return testResults
end

-- Запуск тестов при загрузке скрипта
runAllTests()

return {
    initTestEnvironment = initTestEnvironment,
    testTowerMenu = testTowerMenu,
    testApproachMenu = testApproachMenu,
    testDepartureMenu = testDepartureMenu,
    testTowerApproachHandoff = testTowerApproachHandoff,
    testRunwayManagement = testRunwayManagement,
    testVisualApproach = testVisualApproach,
    runAllTests = runAllTests
}
