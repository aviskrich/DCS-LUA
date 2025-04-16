--[[
ATC_Navigraph.lua
Модуль для загрузки и обработки данных Navigraph для универсального ATC модуля
Автор: Andrey Iskrich
Дата: Апрель 2025
--]]

local ATC_Navigraph = {}

-- Путь к файлам данных Navigraph по умолчанию
ATC_Navigraph.DEFAULT_DATA_PATH = project_path .. "Scripts/Navigraph/"

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
    local filename = nil
    if not icao then
        -- Проверяем, является ли path полным путем к файлу .lua
        if string.sub(path, -4) == ".lua" then
            icao = ""
            filename = ""
        else
            icao = ATC_Navigraph.currentICAO
            filename = icao .. "_MOOSE.lua"
        end
    end    
    
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
ATC_Navigraph.loadAirportData = function(self, icao, path)
    if not icao then
        icao = self.currentICAO
    end
    
    if not path then
        path = self.DEFAULT_DATA_PATH
    end

    -- Проверка наличия файла данных
    if not self.checkDataFileExists(path) then
        ATC_Navigraph.log("Файл данных Navigraph не найден: " .. path )
        return false
    end
    
    -- Загрузка данных
    ATC_Navigraph.log("Загрузка данных Navigraph из файла: " .. path )
    
    -- Использование dofile для загрузки данных
    local success, result = pcall(function()
        return dofile(path )
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

return ATC_Navigraph
