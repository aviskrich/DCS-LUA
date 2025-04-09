--[[
DTC_ATC_Test.lua
Тестовый скрипт для универсального ATC модуля
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

-- Тестовые аэропорты
local testAirports = {
    "OMSJ", -- Шарджа (ОАЭ)
    "UUWW", -- Внуково (Россия)
    "KJFK", -- Нью-Йорк (США)
    "EGLL", -- Лондон Хитроу (Великобритания)
    "RJTT"  -- Токио Ханеда (Япония)
}

-- Функция для тестирования загрузки данных аэропорта
local function testAirportDataLoading(icao)
    env.info("[DTC_ATC_Test] Тестирование загрузки данных аэропорта: " .. icao)
    
    -- Инициализация Navigraph
    DTC_Navigraph.init(icao)
    
    -- Загрузка данных Navigraph
    local dataPath = "Scripts/DTC_ATC/Data/" .. icao .. "_MOOSE.lua"
    local success = DTC_Navigraph.loadAirportData(icao, dataPath)
    
    if not success then
        env.info("[DTC_ATC_Test] ОШИБКА: Не удалось загрузить данные аэропорта " .. icao)
        return false
    end
    
    -- Проверка загруженных данных
    local metadata = DTC_Navigraph.getAirportMetadata()
    if not metadata then
        env.info("[DTC_ATC_Test] ОШИБКА: Не удалось получить метаданные аэропорта " .. icao)
        return false
    end
    
    env.info("[DTC_ATC_Test] Метаданные аэропорта " .. icao .. ": " .. DTC_Utils.tableToString(metadata))
    
    -- Проверка ВПП
    local runways = DTC_Navigraph.getAllRunways()
    if not runways or DTC_Utils.tableLength(runways) == 0 then
        env.info("[DTC_ATC_Test] ОШИБКА: Не удалось получить данные о ВПП аэропорта " .. icao)
        return false
    end
    
    env.info("[DTC_ATC_Test] ВПП аэропорта " .. icao .. ": " .. DTC_Utils.tableLength(runways))
    
    -- Проверка путевых точек
    local waypoints = DTC_Navigraph.getAllWaypoints()
    if not waypoints or DTC_Utils.tableLength(waypoints) == 0 then
        env.info("[DTC_ATC_Test] ОШИБКА: Не удалось получить данные о путевых точках аэропорта " .. icao)
        return false
    end
    
    env.info("[DTC_ATC_Test] Путевые точки аэропорта " .. icao .. ": " .. DTC_Utils.tableLength(waypoints))
    
    -- Проверка SID процедур
    local sids = DTC_Navigraph.getAllSIDs()
    if not sids then
        env.info("[DTC_ATC_Test] ОШИБКА: Не удалось получить данные о SID процедурах аэропорта " .. icao)
        return false
    end
    
    env.info("[DTC_ATC_Test] SID процедуры аэропорта " .. icao .. ": " .. DTC_Utils.tableLength(sids))
    
    -- Проверка STAR процедур
    local stars = DTC_Navigraph.getAllSTARs()
    if not stars then
        env.info("[DTC_ATC_Test] ОШИБКА: Не удалось получить данные о STAR процедурах аэропорта " .. icao)
        return false
    end
    
    env.info("[DTC_ATC_Test] STAR процедуры аэропорта " .. icao .. ": " .. DTC_Utils.tableLength(stars))
    
    -- Проверка процедур захода
    local approaches = DTC_Navigraph.getAllAPPROACHes()
    if not approaches then
        env.info("[DTC_ATC_Test] ОШИБКА: Не удалось получить данные о процедурах захода аэропорта " .. icao)
        return false
    end
    
    env.info("[DTC_ATC_Test] Процедуры захода аэропорта " .. icao .. ": " .. DTC_Utils.tableLength(approaches))
    
    env.info("[DTC_ATC_Test] Тестирование загрузки данных аэропорта " .. icao .. " успешно завершено")
    return true
end

-- Функция для тестирования процедур
local function testProcedures(icao)
    env.info("[DTC_ATC_Test] Тестирование процедур для аэропорта: " .. icao)
    
    -- Инициализация Procedures
    DTC_Procedures.init()
    
    -- Получение ВПП
    local runways = DTC_Navigraph.getAllRunways()
    if not runways or DTC_Utils.tableLength(runways) == 0 then
        env.info("[DTC_ATC_Test] ОШИБКА: Не удалось получить данные о ВПП аэропорта " .. icao)
        return false
    end
    
    -- Тестирование для каждой ВПП
    for runwayName, _ in pairs(runways) do
        env.info("[DTC_ATC_Test] Тестирование процедур для ВПП: " .. runwayName)
        
        -- Тестирование SID процедур
        local sids = DTC_Procedures.getSIDForRunway(runwayName)
        if sids and #sids > 0 then
            env.info("[DTC_ATC_Test] SID процедуры для ВПП " .. runwayName .. ": " .. #sids)
            
            -- Тестирование рекомендуемой SID процедуры
            local recommendedSID = DTC_Procedures.getRecommendedSID(runwayName, 0)
            if recommendedSID then
                env.info("[DTC_ATC_Test] Рекомендуемая SID процедура для ВПП " .. runwayName .. ": " .. recommendedSID.name)
                
                -- Тестирование информации о процедуре
                local sidInfo = DTC_Procedures.getProcedureInfo(recommendedSID.data, "SID")
                env.info("[DTC_ATC_Test] Информация о SID процедуре: " .. sidInfo)
            end
        end
        
        -- Тестирование STAR процедур
        local stars = DTC_Procedures.getSTARForRunway(runwayName)
        if stars and #stars > 0 then
            env.info("[DTC_ATC_Test] STAR процедуры для ВПП " .. runwayName .. ": " .. #stars)
            
            -- Тестирование рекомендуемой STAR процедуры
            local recommendedSTAR = DTC_Procedures.getRecommendedSTAR(runwayName, 0)
            if recommendedSTAR then
                env.info("[DTC_ATC_Test] Рекомендуемая STAR процедура для ВПП " .. runwayName .. ": " .. recommendedSTAR.name)
                
                -- Тестирование информации о процедуре
                local starInfo = DTC_Procedures.getProcedureInfo(recommendedSTAR.data, "STAR")
                env.info("[DTC_ATC_Test] Информация о STAR процедуре: " .. starInfo)
            end
        end
        
        -- Тестирование процедур захода
        local approaches = DTC_Procedures.getApproachForRunway(runwayName)
        if approaches and #approaches > 0 then
            env.info("[DTC_ATC_Test] Процедуры захода для ВПП " .. runwayName .. ": " .. #approaches)
            
            -- Тестирование рекомендуемой процедуры захода
            local recommendedApproach = DTC_Procedures.getRecommendedApproach(runwayName)
            if recommendedApproach then
                env.info("[DTC_ATC_Test] Рекомендуемая процедура захода для ВПП " .. runwayName .. ": " .. recommendedApproach.name)
                
                -- Тестирование информации о процедуре
                local approachInfo = DTC_Procedures.getProcedureInfo(recommendedApproach.data, "APPROACH")
                env.info("[DTC_ATC_Test] Информация о процедуре захода: " .. approachInfo)
            end
        end
    end
    
    env.info("[DTC_ATC_Test] Тестирование процедур для аэропорта " .. icao .. " успешно завершено")
    return true
end

-- Функция для тестирования мониторинга
local function testMonitoring()
    env.info("[DTC_ATC_Test] Тестирование системы мониторинга")
    
    -- Инициализация MonitoringManager
    local success = DTC_MonitoringManager.init()
    
    if not success then
        env.info("[DTC_ATC_Test] ОШИБКА: Не удалось инициализировать систему мониторинга")
        return false
    }
    
    -- Проверка настроек мониторинга
    env.info("[DTC_ATC_Test] Настройки мониторинга: " .. DTC_Utils.tableToString(DTC_MonitoringManager.settings))
    
    env.info("[DTC_ATC_Test] Тестирование системы мониторинга успешно завершено")
    return true
end

-- Функция для запуска всех тестов
local function runAllTests()
    env.info("[DTC_ATC_Test] Запуск всех тестов для универсального ATC модуля")
    
    local allTestsPassed = true
    
    -- Тестирование для каждого аэропорта
    for _, icao in ipairs(testAirports) do
        env.info("[DTC_ATC_Test] Тестирование для аэропорта: " .. icao)
        
        -- Тестирование загрузки данных аэропорта
        local dataLoadingSuccess = testAirportDataLoading(icao)
        if not dataLoadingSuccess then
            env.info("[DTC_ATC_Test] ОШИБКА: Тестирование загрузки данных аэропорта " .. icao .. " не пройдено")
            allTestsPassed = false
        end
        
        -- Тестирование процедур
        local proceduresSuccess = testProcedures(icao)
        if not proceduresSuccess then
            env.info("[DTC_ATC_Test] ОШИБКА: Тестирование процедур для аэропорта " .. icao .. " не пройдено")
            allTestsPassed = false
        end
    end
    
    -- Тестирование мониторинга
    local monitoringSuccess = testMonitoring()
    if not monitoringSuccess then
        env.info("[DTC_ATC_Test] ОШИБКА: Тестирование системы мониторинга не пройдено")
        allTestsPassed = false
    end
    
    if allTestsPassed then
        env.info("[DTC_ATC_Test] Все тесты успешно пройдены")
    else
        env.info("[DTC_ATC_Test] ВНИМАНИЕ: Некоторые тесты не пройдены")
    end
    
    return allTestsPassed
end

-- Запуск всех тестов
runAllTests()

return {
    testAirportDataLoading = testAirportDataLoading,
    testProcedures = testProcedures,
    testMonitoring = testMonitoring,
    runAllTests = runAllTests
}
