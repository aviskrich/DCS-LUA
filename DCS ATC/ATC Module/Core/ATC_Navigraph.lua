--[[
ATC_Navigraph.lua
Модуль для загрузки и обработки данных Navigraph для универсального ATC модуля
Автор: Andrey Iskrich
Дата: Апрель 2025
--]]

local ATC_Navigraph = {}

-- Путь к файлам данных Navigraph по умолчанию
ATC_Navigraph.DEFAULT_DATA_PATH = lfs.writedir() .. "Scripts/Navigraph/"

-- Текущий ICAO код аэропорта
ATC_Navigraph.currentICAO = nil

-- Флаг, указывающий, загружены ли данные Navigraph
ATC_Navigraph.isDataLoaded = false

-- Данные Navigraph
ATC_Navigraph.data = nil

-- Логирование
ATC_Navigraph.log = function(message)
    if ATC_Config and ATC_Config.DEBUG then
        env.info("[ATC_Navigraph] " .. message)
    end
end

-- Инициализация с указанием ICAO кода аэропорта
ATC_Navigraph.init = function(icao)
    ATC_Navigraph.currentICAO = icao
    ATC_Navigraph.log("Инициализация модуля Navigraph для аэропорта " .. icao)
    return ATC_Navigraph
end

-- Проверка наличия файла данных Navigraph
ATC_Navigraph.checkDataFileExists = function(path, icao)
    if not icao then
        icao = ATC_Navigraph.currentICAO
    end
    
    local filename = icao .. "_MOOSE.lua"
    local fullPath = path .. filename
    local file = io.open(fullPath, "r")
    if file then
        file:close()
        return true
    else
        return false
    end
end

-- Загрузка данных аэропорта
ATC_Navigraph.loadAirportData = function(icao, path)
    if not icao then
        icao = ATC_Navigraph.currentICAO
    end
    
    if not path then
        path = ATC_Navigraph.DEFAULT_DATA_PATH
    end
    
    local filename = icao .. "_MOOSE.lua"
    
    -- Проверка наличия файла данных
    if not ATC_Navigraph.checkDataFileExists(path, icao) then
        ATC_Navigraph.log("Файл данных Navigraph не найден: " .. path .. filename)
        return false
    end
    
    -- Загрузка данных
    ATC_Navigraph.log("Загрузка данных Navigraph из файла: " .. path .. filename)
    
    -- Использование dofile для загрузки данных
    local success, result = pcall(function()
        return dofile(path .. filename)
    end)
    
    if success and result then
        ATC_Navigraph.data = result
        ATC_Navigraph.isDataLoaded = true
        ATC_Navigraph.log("Данные Navigraph успешно загружены для аэропорта " .. icao)
        
        -- Вывод статистики загруженных данных
        local waypointsCount = 0
        for _ in pairs(ATC_Navigraph.data.Waypoints or {}) do
            waypointsCount = waypointsCount + 1
        end
        
        local sidCount = 0
        for _ in pairs(ATC_Navigraph.data.SID or {}) do
            sidCount = sidCount + 1
        end
        
        local starCount = 0
        for _ in pairs(ATC_Navigraph.data.STAR or {}) do
            starCount = starCount + 1
        end
        
        local approachCount = 0
        for _ in pairs(ATC_Navigraph.data.APPROACH or {}) do
            approachCount = approachCount + 1
        end
        
        local runwaysCount = 0
        for _ in pairs(ATC_Navigraph.data.Runways or {}) do
            runwaysCount = runwaysCount + 1
        end
        
        ATC_Navigraph.log("Статистика загруженных данных для аэропорта " .. icao .. ":")
        ATC_Navigraph.log("  Путевых точек: " .. waypointsCount)
        ATC_Navigraph.log("  SID процедур: " .. sidCount)
        ATC_Navigraph.log("  STAR процедур: " .. starCount)
        ATC_Navigraph.log("  APPROACH процедур: " .. approachCount)
        ATC_Navigraph.log("  ВПП: " .. runwaysCount)
        
        return true
    else
        ATC_Navigraph.log("Ошибка при загрузке данных Navigraph: " .. tostring(result))
        return false
    end
end

-- Получение метаданных аэропорта
ATC_Navigraph.getAirportMetadata = function()
    if not ATC_Navigraph.isDataLoaded then
        return nil
    end
    
    return ATC_Navigraph.data.Metadata
end

-- Получение путевой точки по имени
ATC_Navigraph.getWaypoint = function(name)
    if not ATC_Navigraph.isDataLoaded or not ATC_Navigraph.data.Waypoints then
        return nil
    end
    
    return ATC_Navigraph.data.Waypoints[name]
end

-- Получение всех путевых точек
ATC_Navigraph.getAllWaypoints = function()
    if not ATC_Navigraph.isDataLoaded or not ATC_Navigraph.data.Waypoints then
        return {}
    end
    
    return ATC_Navigraph.data.Waypoints
end

-- Получение SID процедуры по имени
ATC_Navigraph.getSID = function(name)
    if not ATC_Navigraph.isDataLoaded or not ATC_Navigraph.data.SID then
        return nil
    end
    
    return ATC_Navigraph.data.SID[name]
end

-- Получение всех SID процедур
ATC_Navigraph.getAllSIDs = function()
    if not ATC_Navigraph.isDataLoaded or not ATC_Navigraph.data.SID then
        return {}
    end
    
    return ATC_Navigraph.data.SID
end

-- Получение STAR процедуры по имени
ATC_Navigraph.getSTAR = function(name)
    if not ATC_Navigraph.isDataLoaded or not ATC_Navigraph.data.STAR then
        return nil
    end
    
    return ATC_Navigraph.data.STAR[name]
end

-- Получение всех STAR процедур
ATC_Navigraph.getAllSTARs = function()
    if not ATC_Navigraph.isDataLoaded or not ATC_Navigraph.data.STAR then
        return {}
    end
    
    return ATC_Navigraph.data.STAR
end

-- Получение APPROACH процедуры по имени
ATC_Navigraph.getAPPROACH = function(name)
    if not ATC_Navigraph.isDataLoaded or not ATC_Navigraph.data.APPROACH then
        return nil
    end
    
    return ATC_Navigraph.data.APPROACH[name]
end

-- Получение всех APPROACH процедур
ATC_Navigraph.getAllAPPROACHes = function()
    if not ATC_Navigraph.isDataLoaded or not ATC_Navigraph.data.APPROACH then
        return {}
    end
    
    return ATC_Navigraph.data.APPROACH
end

-- Получение данных ВПП по имени
ATC_Navigraph.getRunway = function(name)
    if not ATC_Navigraph.isDataLoaded or not ATC_Navigraph.data.Runways then
        return nil
    end
    
    return ATC_Navigraph.data.Runways[name]
end

-- Получение всех данных ВПП
ATC_Navigraph.getAllRunways = function()
    if not ATC_Navigraph.isDataLoaded or not ATC_Navigraph.data.Runways then
        return {}
    end
    
    return ATC_Navigraph.data.Runways
end

-- Получение частоты службы
ATC_Navigraph.getFrequency = function(service)
    if not ATC_Navigraph.isDataLoaded or not ATC_Navigraph.data.Frequencies then
        return nil
    end
    
    return ATC_Navigraph.data.Frequencies[service]
end

-- Преобразование координат из формата Navigraph в формат MOOSE
ATC_Navigraph.convertCoordinatesToMOOSE = function(lat, lon)
    return COORDINATE:NewFromLLDD(lat, lon)
end

-- Преобразование путевой точки из формата Navigraph в формат MOOSE
ATC_Navigraph.convertWaypointToMOOSE = function(waypointName)
    local waypoint = ATC_Navigraph.getWaypoint(waypointName)
    if not waypoint then
        return nil
    end
    
    return ATC_Navigraph.convertCoordinatesToMOOSE(waypoint.lat, waypoint.lon)
end

-- Преобразование процедуры из формата Navigraph в формат MOOSE
ATC_Navigraph.convertProcedureToMOOSE = function(procedureName, procedureType)
    local procedure = nil
    
    if procedureType == "SID" then
        procedure = ATC_Navigraph.getSID(procedureName)
    elseif procedureType == "STAR" then
        procedure = ATC_Navigraph.getSTAR(procedureName)
    elseif procedureType == "APPROACH" then
        procedure = ATC_Navigraph.getAPPROACH(procedureName)
    else
        ATC_Navigraph.log("Неизвестный тип процедуры: " .. procedureType)
        return nil
    end
    
    if not procedure then
        return nil
    end
    
    local mooseProcedure = {
        name = procedure.name,
        type = procedure.type,
        runway = procedure.runway,
        waypoints = {}
    }
    
    for i, wp in ipairs(procedure.waypoints) do
        local waypointData = ATC_Navigraph.getWaypoint(wp.name)
        if waypointData then
            local mooseWP = {
                name = wp.name,
                type = wp.type or waypointData.type,
                coordinate = ATC_Navigraph.convertCoordinatesToMOOSE(waypointData.lat, waypointData.lon)
            }
            
            if wp.altitude_min then
                mooseWP.altitude_min = wp.altitude_min
            end
            
            if wp.altitude_max then
                mooseWP.altitude_max = wp.altitude_max
            end
            
            if wp.speed then
                mooseWP.speed = wp.speed
            end
            
            table.insert(mooseProcedure.waypoints, mooseWP)
        else
            ATC_Navigraph.log("Предупреждение: Путевая точка не найдена для процедуры " .. procedureName .. ": " .. wp.name)
        end
    end
    
    return mooseProcedure
end

-- Проверка наличия данных в новом формате
ATC_Navigraph.hasNewFormatData = function(icao, path)
    if not icao then
        icao = ATC_Navigraph.currentICAO
    end
    
    if not path then
        path = ATC_Navigraph.DEFAULT_DATA_PATH
    end
    
    return ATC_Navigraph.checkDataFileExists(path, icao)
end

-- Загрузка данных в старом формате (для обратной совместимости с OMSJ)
ATC_Navigraph.loadLegacyData = function()
    ATC_Navigraph.log("Загрузка данных в старом формате для обратной совместимости")
    
    -- Проверка наличия старых файлов данных
    local oldDataFiles = {
        "OMSJ_Waypoints.lua",
        "OMSJ_SID_Data.lua",
        "OMSJ_STAR_Data.lua",
        "OMSJ_Approach_Data.lua",
        "OMSJ_Frequencies.lua"
    }
    
    local dataPath = lfs.writedir() .. "Scripts/ATC_Module/Data/"
    local allFilesExist = true
    
    for _, filename in ipairs(oldDataFiles) do
        local file = io.open(dataPath .. filename, "r")
        if not file then
            allFilesExist = false
            ATC_Navigraph.log("Файл данных в старом формате не найден: " .. dataPath .. filename)
            break
        else
            file:close()
        end
    end
    
    if not allFilesExist then
        ATC_Navigraph.log("Не все файлы данных в старом формате найдены")
        return false
    end
    
    -- Загрузка данных из старых файлов
    local success, waypoints = pcall(function() return dofile(dataPath .. "OMSJ_Waypoints.lua") end)
    if not success then
        ATC_Navigraph.log("Ошибка при загрузке OMSJ_Waypoints.lua: " .. tostring(waypoints))
        return false
    end
    
    local success, sid_data = pcall(function() return dofile(dataPath .. "OMSJ_SID_Data.lua") end)
    if not success then
        ATC_Navigraph.log("Ошибка при загрузке OMSJ_SID_Data.lua: " .. tostring(sid_data))
        return false
    end
    
    local success, star_data = pcall(function() return dofile(dataPath .. "OMSJ_STAR_Data.lua") end)
    if not success then
        ATC_Navigraph.log("Ошибка при загрузке OMSJ_STAR_Data.lua: " .. tostring(star_data))
        return false
    end
    
    local success, approach_data = pcall(function() return dofile(dataPath .. "OMSJ_Approach_Data.lua") end)
    if not success then
        ATC_Navigraph.log("Ошибка при загрузке OMSJ_Approach_Data.lua: " .. tostring(approach_data))
        return false
    end
    
    local success, frequencies = pcall(function() return dofile(dataPath .. "OMSJ_Frequencies.lua") end)
    if not success then
        ATC_Navigraph.log("Ошибка при загрузке OMSJ_Frequencies.lua: " .. tostring(frequencies))
        return false
    end
    
    -- Создание структуры данных в новом формате
    ATC_Navigraph.data = {
        Metadata = {
            ICAO = "OMSJ",
            Name = "Sharjah International Airport",
            Elevation = 111,
            MagVar = 1.0,
            Region = "PersianGulf"
        },
        Waypoints = waypoints,
        SID = sid_data,
        STAR = star_data,
        APPROACH = approach_data,
        Frequencies = frequencies,
        Runways = {
            ["12"] = {
                heading = 120,
                length = 4060,
                width = 45,
                rw_threshold = { lat = 25.32, lon = 55.51 },
                rw_end = { lat = 25.31, lon = 55.53 }
            },
            ["30"] = {
                heading = 300,
                length = 4060,
                width = 45,
                rw_threshold = { lat = 25.31, lon = 55.53 },
                rw_end = { lat = 25.32, lon = 55.51 }
            }
        }
    }
    
    ATC_Navigraph.isDataLoaded = true
    ATC_Navigraph.currentICAO = "OMSJ"
    
    ATC_Navigraph.log("Данные в старом формате успешно загружены")
    return true
end

-- Преобразование данных из старого формата в новый
ATC_Navigraph.convertLegacyToNewFormat = function(outputPath)
    if not ATC_Navigraph.isDataLoaded then
        ATC_Navigraph.log("Нет загруженных данных для преобразования")
        return false
    end
    
    if not outputPath then
        outputPath = ATC_Navigraph.DEFAULT_DATA_PATH
    end
    
    -- Проверка существования директории
    local success = os.execute("mkdir -p " .. outputPath)
    if not success then
        ATC_Navigraph.log("Ошибка при создании директории: " .. outputPath)
        return false
    end
    
    local filename = ATC_Navigraph.currentICAO .. "_MOOSE.lua"
    local fullPath = outputPath .. filename
    
    -- Создание файла
    local file = io.open(fullPath, "w")
    if not file then
        ATC_Navigraph.log("Ошибка при создании файла: " .. fullPath)
        return false
    end
    
    -- Запись данных в файл
    file:write("local AirportData = {\n")
    
    -- Метаданные
    file:write("    -- Метаданные аэропорта\n")
    file:write("    Metadata = {\n")
    file:write("        ICAO = \"" .. ATC_Navigraph.data.Metadata.ICAO .. "\",\n")
    file:write("        Name = \"" .. ATC_Navigraph.data.Metadata.Name .. "\",\n")
    file:write("        Elevation = " .. ATC_Navigraph.data.Metadata.Elevation .. ",\n")
    file:write("        MagVar = " .. ATC_Navigraph.data.Metadata.MagVar .. ",\n")
    file:write("        Region = \"" .. ATC_Navigraph.data.Metadata.Region .. "\"\n")
    file:write("    },\n\n")
    
    -- Путевые точки
    file:write("    -- Путевые точки\n")
    file:write("    Waypoints = {\n")
    for name, data in pairs(ATC_Navigraph.data.Waypoints) do
        file:write("        [\"" .. name .. "\"] = { lat = " .. data.lat .. ", lon = " .. data.lon .. ", type = \"" .. (data.type or "FIX") .. "\"")
        if data.frequency then
            file:write(", frequency = " .. data.frequency)
        end
        if data.elevation then
            file:write(", elevation = " .. data.elevation)
        end
        if data.name then
            file:write(", name = \"" .. data.name .. "\"")
        end
        if data.range then
            file:write(", range = " .. data.range)
        end
        file:write(" },\n")
    end
    file:write("    },\n\n")
    
    -- ВПП
    file:write("    -- Данные ВПП\n")
    file:write("    Runways = {\n")
    for name, data in pairs(ATC_Navigraph.data.Runways) do
        file:write("        [\"" .. name .. "\"] = {\n")
        file:write("            heading = " .. data.heading .. ",\n")
        file:write("            length = " .. data.length .. ",\n")
        file:write("            width = " .. data.width .. ",\n")
        file:write("            rw_threshold = { lat = " .. data.rw_threshold.lat .. ", lon = " .. data.rw_threshold.lon .. " },\n")
        file:write("            rw_end = { lat = " .. data.rw_end.lat .. ", lon = " .. data.rw_end.lon .. " }\n")
        file:write("        },\n")
    end
    file:write("    },\n\n")
    
    -- SID
    file:write("    -- Процедуры SID\n")
    file:write("    SID = {\n")
    for name, data in pairs(ATC_Navigraph.data.SID) do
        file:write("        [\"" .. name .. "\"] = {\n")
        file:write("            name = \"" .. data.name .. "\",\n")
        file:write("            runway = \"" .. data.runway .. "\",\n")
        file:write("            waypoints = {\n")
        for _, wp in ipairs(data.waypoints) do
            file:write("                { name = \"" .. wp.name .. "\"")
            if wp.altitude_min then
                file:write(", altitude_min = " .. wp.altitude_min)
            end
            if wp.altitude_max then
                file:write(", altitude_max = " .. wp.altitude_max)
            end
            if wp.speed then
                file:write(", speed = " .. wp.speed)
            end
            file:write(" },\n")
        end
        file:write("            }\n")
        file:write("        },\n")
    end
    file:write("    },\n\n")
    
    -- STAR
    file:write("    -- Процедуры STAR\n")
    file:write("    STAR = {\n")
    for name, data in pairs(ATC_Navigraph.data.STAR) do
        file:write("        [\"" .. name .. "\"] = {\n")
        file:write("            name = \"" .. data.name .. "\",\n")
        file:write("            runway = \"" .. data.runway .. "\",\n")
        file:write("            waypoints = {\n")
        for _, wp in ipairs(data.waypoints) do
            file:write("                { name = \"" .. wp.name .. "\"")
            if wp.altitude_min then
                file:write(", altitude_min = " .. wp.altitude_min)
            end
            if wp.altitude_max then
                file:write(", altitude_max = " .. wp.altitude_max)
            end
            if wp.speed then
                file:write(", speed = " .. wp.speed)
            end
            file:write(" },\n")
        end
        file:write("            }\n")
        file:write("        },\n")
    end
    file:write("    },\n\n")
    
    -- APPROACH
    file:write("    -- Процедуры APPROACH\n")
    file:write("    APPROACH = {\n")
    for name, data in pairs(ATC_Navigraph.data.APPROACH) do
        file:write("        [\"" .. name .. "\"] = {\n")
        file:write("            name = \"" .. data.name .. "\",\n")
        file:write("            type = \"" .. data.type .. "\",\n")
        file:write("            runway = \"" .. data.runway .. "\",\n")
        file:write("            waypoints = {\n")
        for _, wp in ipairs(data.waypoints) do
            file:write("                { name = \"" .. wp.name .. "\"")
            if wp.altitude_min then
                file:write(", altitude_min = " .. wp.altitude_min)
            end
            if wp.altitude_max then
                file:write(", altitude_max = " .. wp.altitude_max)
            end
            if wp.speed then
                file:write(", speed = " .. wp.speed)
            end
            file:write(" },\n")
        end
        file:write("            }\n")
        file:write("        },\n")
    end
    file:write("    },\n\n")
    
    -- Frequencies
    file:write("    -- Частоты\n")
    file:write("    Frequencies = {\n")
    for name, freq in pairs(ATC_Navigraph.data.Frequencies) do
        file:write("        [\"" .. name .. "\"] = " .. freq .. ",\n")
    end
    file:write("    }\n")
    
    file:write("}\n\n")
    file:write("return AirportData\n")
    
    file:close()
    
    ATC_Navigraph.log("Данные успешно преобразованы и сохранены в файл: " .. fullPath)
    return true
end

return ATC_Navigraph
