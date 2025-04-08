--- ATC Emulation for Sharjah Airport
-- @module atc_pg

BASE:TraceClass("MSRS")
BASE:TraceLevel(3)
BASE:TraceOnOff( true )-- @date 2023

-- Select the alternate DCS-gRPC backend for new MSRS instances
GRPC.load()
MSRS.SetDefaultBackendGRPC()

-- Whether the `Eval` method is enabled or not.
GRPC.evalEnabled = false
-- Whether debug logging is enabled or not.
GRPC.debug = true
-- Limit of calls per second that are executed inside of the mission scripting environment.
GRPC.throughputLimit = 600

-- Инициализация SRS для Text-to-Speech
-- local SRS_PORT = 5002  -- Стандартный порт SRS
-- local SRS_HOST = "127.0.0.1"  -- Локальный хост
local SHARJAH_FREQ = {
    APPROACH = 124.600,     -- MHz
    TOWER = 118.600,        -- MHz
    DEPARTURE = 126.200,    -- MHz
    ATIS = 122.400,         -- MHz
}

local SHARJAH_SRS = {
    APPROACH = MSRS:New(nil, SHARJAH_FREQ.APPROACH, radio.modulation.AM):SetVoice("en-US-Standard-A"),
    TOWER = MSRS:New(nil, SHARJAH_FREQ.TOWER, radio.modulation.AM):SetVoice("en-US-Standard-B"),
    DEPARTURE = MSRS:New(nil, SHARJAH_FREQ.DEPARTURE, radio.modulation.AM):SetVoice("en-US-Standard-A"),
    ATIS = MSRS:New(nil, SHARJAH_FREQ.ATIS, radio.modulation.AM):SetVoice("en-US-Standard-B")
}

-- Create new ATIS as usual
-- local atis = ATIS:New("Sharjah", 122.4, radio.modulation.AM)
-- ATIS:SetLocale("en")
-- -- ATIS:SetSRS() expects a string for the SRS path even though it is not needed with DCS-gRPC
-- atis:SetSRS('', 'male', 'en-US', 'ar-XA-Standard-B')
-- -- Start ATIS
-- atis:Start()

-- Структура для хранения схем SID/STAR/APP
local ATCSchemes = {
    SID = {
        -- Схемы вылета (SID)
        ["RWY12"] = {
            ["ANVIX"] = {
                name = "ANVIX1C",
                waypoints = {
                    {name = "SHJ", lat = 25.328611, lon = 55.516944, alt = 2000, speed = 200},
                    {name = "SHJ1", lat = 25.328611, lon = 55.616944, alt = 3000, speed = 220},
                    {name = "ANVIX", lat = 25.328611, lon = 55.716944, alt = 5000, speed = 250}
                }
            },
            ["LATEB"] = {
                name = "LATEB1C",
                waypoints = {
                    {name = "SHJ", lat = 25.328611, lon = 55.516944, alt = 2000, speed = 200},
                    {name = "SHJ2", lat = 25.228611, lon = 55.516944, alt = 3000, speed = 220},
                    {name = "LATEB", lat = 25.128611, lon = 55.516944, alt = 5000, speed = 250}
                }
            }
        },
        ["RWY30"] = {
            ["ANVIX"] = {
                name = "ANVIX1D",
                waypoints = {
                    {name = "SHJ", lat = 25.328611, lon = 55.516944, alt = 2000, speed = 200},
                    {name = "SHJ3", lat = 25.428611, lon = 55.516944, alt = 3000, speed = 220},
                    {name = "ANVIX", lat = 25.328611, lon = 55.716944, alt = 5000, speed = 250}
                }
            },
            ["LATEB"] = {
                name = "LATEB1D",
                waypoints = {
                    {name = "SHJ", lat = 25.328611, lon = 55.516944, alt = 2000, speed = 200},
                    {name = "SHJ4", lat = 25.428611, lon = 55.416944, alt = 3000, speed = 220},
                    {name = "LATEB", lat = 25.128611, lon = 55.516944, alt = 5000, speed = 250}
                }
            }
        }
    },
    STAR = {
        -- Схемы прибытия (STAR)
        ["RWY12"] = {
            ["DESDI"] = {
                name = "DESDI1C",
                waypoints = {
                    {name = "DESDI", lat = 25.528611, lon = 55.716944, alt = 10000, speed = 280},
                    {name = "SHJ5", lat = 25.428611, lon = 55.616944, alt = 7000, speed = 250},
                    {name = "SHJ", lat = 25.328611, lon = 55.516944, alt = 4000, speed = 220}
                }
            },
            ["IMPED"] = {
                name = "IMPED1C",
                waypoints = {
                    {name = "IMPED", lat = 25.128611, lon = 55.716944, alt = 10000, speed = 280},
                    {name = "SHJ6", lat = 25.228611, lon = 55.616944, alt = 7000, speed = 250},
                    {name = "SHJ", lat = 25.328611, lon = 55.516944, alt = 4000, speed = 220}
                }
            }
        },
        ["RWY30"] = {
            ["DESDI"] = {
                name = "DESDI1D",
                waypoints = {
                    {name = "DESDI", lat = 25.528611, lon = 55.716944, alt = 10000, speed = 280},
                    {name = "SHJ7", lat = 25.428611, lon = 55.416944, alt = 7000, speed = 250},
                    {name = "SHJ", lat = 25.328611, lon = 55.516944, alt = 4000, speed = 220}
                }
            },
            ["IMPED"] = {
                name = "IMPED1D",
                waypoints = {
                    {name = "IMPED", lat = 25.128611, lon = 55.716944, alt = 10000, speed = 280},
                    {name = "SHJ8", lat = 25.228611, lon = 55.416944, alt = 7000, speed = 250},
                    {name = "SHJ", lat = 25.328611, lon = 55.516944, alt = 4000, speed = 220}
                }
            }
        }
    },
    APP = {
        -- Схемы захода на посадку (APP)
        ["RWY12"] = {
            ["ILS"] = {
                name = "ILS12",
                waypoints = {
                    {name = "SHJ", lat = 25.328611, lon = 55.516944, alt = 4000, speed = 220},
                    {name = "IF12", lat = 25.378611, lon = 55.416944, alt = 3000, speed = 180},
                    {name = "FAF12", lat = 25.348611, lon = 55.466944, alt = 2000, speed = 160},
                    {name = "RWY12", lat = 25.328611, lon = 55.516944, alt = 0, speed = 140}
                }
            },
            ["VISUAL"] = {
                name = "VISUAL12",
                waypoints = {
                    {name = "SHJ", lat = 25.328611, lon = 55.516944, alt = 4000, speed = 220},
                    {name = "DOWNWIND", lat = 25.308611, lon = 55.466944, alt = 2000, speed = 180},
                    {name = "BASE", lat = 25.318611, lon = 55.486944, alt = 1500, speed = 160},
                    {name = "FINAL", lat = 25.328611, lon = 55.506944, alt = 1000, speed = 150},
                    {name = "RWY12", lat = 25.328611, lon = 55.516944, alt = 0, speed = 140}
                }
            }
        },
        ["RWY30"] = {
            ["ILS"] = {
                name = "ILS30",
                waypoints = {
                    {name = "SHJ", lat = 25.328611, lon = 55.516944, alt = 4000, speed = 220},
                    {name = "IF30", lat = 25.278611, lon = 55.616944, alt = 3000, speed = 180},
                    {name = "FAF30", lat = 25.308611, lon = 55.566944, alt = 2000, speed = 160},
                    {name = "RWY30", lat = 25.328611, lon = 55.516944, alt = 0, speed = 140}
                }
            },
            ["VISUAL"] = {
                name = "VISUAL30",
                waypoints = {
                    {name = "SHJ", lat = 25.328611, lon = 55.516944, alt = 4000, speed = 220},
                    {name = "DOWNWIND", lat = 25.348611, lon = 55.566944, alt = 2000, speed = 180},
                    {name = "BASE", lat = 25.338611, lon = 55.546944, alt = 1500, speed = 160},
                    {name = "FINAL", lat = 25.328611, lon = 55.526944, alt = 1000, speed = 150},
                    {name = "RWY30", lat = 25.328611, lon = 55.516944, alt = 0, speed = 140}
                }
            }
        }
    }
}

-- Таблица для хранения активных рейсов
local activeFlights = {}

local SpawnUser = EVENTHANDLER:New()
SpawnUser:HandleEvent(EVENTS.PlayerEnterAircraft)

function SpawnUser:OnEventPlayerEnterAircraft(EventData)
    local name = EventData.IniPlayerName
    local unitMoose = UNIT:FindByName(EventData.IniDCSUnitName)
    local natoName = unitMoose:GetNatoReportingName()   
    local client = CLIENT:FindByPlayerName(EventData.IniPlayerName)

    -- Создаем основное меню
    local mainMenu = MENU_COALITION:New(coalition.side.BLUE, "Sharjah ATC")
    
    -- Создаем подменю для Approach
    local approachMenu = MENU_COALITION:New(coalition.side.BLUE, "Approach", mainMenu)
    MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Request Approach", approachMenu, RequestApproach, unitMoose)
    MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Report Position", approachMenu, ReportPosition, unitMoose)
    
    -- Создаем подменю для Tower
    local towerMenu = MENU_COALITION:New(coalition.side.BLUE, "Tower", mainMenu)
    MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Request Landing", towerMenu, RequestLanding, unitMoose)
    MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Request Takeoff", towerMenu, RequestTakeoff, unitMoose)
    
    -- Создаем подменю для Departure
    local departureMenu = MENU_COALITION:New(coalition.side.BLUE, "Departure", mainMenu)
    MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Request Departure", departureMenu, RequestDeparture, unitMoose)
    MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Report Climbing", departureMenu, ReportClimbing, unitMoose)
end

-- Функция для проверки отклонения от маршрута
local function CheckRouteDeviation(unit, waypoints, toleranceAlt, toleranceLateral)
    local unitPos = unit:GetCoordinate()
    local unitAlt = unit:GetAltitude()
    local unitVec2 = unit:GetVec2()
    
    -- Находим ближайшую точку маршрута
    local closestWP = nil
    local closestDist = math.huge
    
    for i, wp in ipairs(waypoints) do
        local wpCoord = COORDINATE:New(wp.lat, wp.lon, wp.alt)
        local dist = unitPos:Get2DDistance(wpCoord)
        
        if dist < closestDist then
            closestDist = dist
            closestWP = i
        end
    end
    
    -- Если нашли ближайшую точку, проверяем отклонение
    if closestWP then
        local currentWP = waypoints[closestWP]
        local currentCoord = COORDINATE:New(currentWP.lat, currentWP.lon, currentWP.alt)
        
        -- Проверяем отклонение по высоте
        local altDeviation = math.abs(unitAlt - currentWP.alt)
        local altDeviationOK = altDeviation <= toleranceAlt
        
        -- Проверяем отклонение по курсу
        local lateralDeviation = unitPos:Get2DDistance(currentCoord)
        local lateralDeviationOK = lateralDeviation <= toleranceLateral
        
        -- Если есть следующая точка, проверяем отклонение от линии курса
        local courseDeviationOK = true
        if closestWP < #waypoints then
            local nextWP = waypoints[closestWP + 1]
            local nextCoord = COORDINATE:New(nextWP.lat, nextWP.lon, nextWP.alt)
            
            -- Вычисляем отклонение от линии курса
            local courseDeviation = unitPos:GetProjectedDistance(currentCoord, nextCoord)
            courseDeviationOK = math.abs(courseDeviation) <= toleranceLateral
        end
        
        return {
            waypointIndex = closestWP,
            waypointName = currentWP.name,
            altDeviation = altDeviation,
            lateralDeviation = lateralDeviation,
            altDeviationOK = altDeviationOK,
            lateralDeviationOK = lateralDeviationOK,
            courseDeviationOK = courseDeviationOK
        }
    end
    
    return nil
end

-- Функция для отправки сообщения через SRS
local function SendATCMessage(srsInstance, message, gender)
    gender = gender or "female"  -- По умолчанию женский голос

    local text = SOUNDTEXT:New(message):SetVoice("en-US-Standard-B")
    srsInstance:PlaySoundText(text, 0)
end

-- Обработчики команд меню
function RequestApproach(unit)
    local unit = unit
    if not unit then return end
    
    -- Определяем активную ВПП
    local activeRunway = "RWY12"  -- По умолчанию ВПП 12
    
    -- Определяем доступные STAR
    local availableSTARs = {}
    for starName, _ in pairs(ATCSchemes.STAR[activeRunway]) do
        table.insert(availableSTARs, starName)
    end
    
    -- Выбираем случайную STAR
    local selectedSTAR = availableSTARs[math.random(#availableSTARs)]
    local starData = ATCSchemes.STAR[activeRunway][selectedSTAR]
    
    -- Создаем новый рейс
    local flightID = unit:Name() .. "_" .. os.time()
    activeFlights[flightID] = {
        unit = unit,
        phase = "APPROACH",
        runway = activeRunway,
        scheme = starData,
        startTime = os.time()
    }
    
    -- Отправляем сообщение через SRS
    local message = unit:GetCallsign() .. ", Sharjah Approach. Identified. Descend via " .. 
                   starData.name .. " arrival for " .. activeRunway .. ". QNH 1013."
    SendATCMessage(SHARJAH_SRS.APPROACH, message)
    
    -- Отправляем сообщение игроку
    MESSAGE:New("ATC: " .. message, 10):ToUnit(unit)
    
    -- Запускаем мониторинг выполнения схемы
    -- SCHEDULER:New(nil, function()
    --     MonitorFlight(flightID)
    -- end, {}, 5, 10)  -- Проверяем каждые 10 секунд
end

function RequestLanding(unit)
    local unit = unit
    if not unit then return end
    
    local flightID = FindFlightByUnit(unit)
    if not flightID then
        -- Если рейс не найден, создаем новый
        flightID = unit:Name() .. "_" .. os.time()
        activeFlights[flightID] = {
            unit = unit,
            phase = "TOWER",
            runway = "RWY12",  -- По умолчанию ВПП 12
            startTime = os.time()
        }
    else
        -- Обновляем фазу рейса
        activeFlights[flightID].phase = "TOWER"
    end
    
    local runway = activeFlights[flightID].runway
    
    -- Отправляем сообщение через SRS
    local message = unit:GetCallsign() .. ", Sharjah Tower. Wind 120 at 5 knots. " .. 
                   "Cleared to land " .. runway .. "."
    SendATCMessage(SHARJAH_SRS.TOWER, message)
    
    -- Отправляем сообщение игроку
    MESSAGE:New("ATC: " .. message, 10):ToUnit(unit)
end

function RequestTakeoff(unit)
    local unit = unit
    if not unit then return end
    
    -- Определяем активную ВПП
    local activeRunway = "RWY12"  -- По умолчанию ВПП 12
    
    -- Создаем новый рейс
    local flightID = unit:Name() .. "_" .. os.time()
    activeFlights[flightID] = {
        unit = unit,
        phase = "TAKEOFF",
        runway = activeRunway,
        startTime = os.time()
    }
    
    -- Отправляем сообщение через SRS
    local message = unit:GetCallsign() .. ", Sharjah Tower. Wind 120 at 5 knots. " .. 
                   "Cleared for takeoff " .. activeRunway .. ". Contact Departure on 126.2 when airborne."
    SendATCMessage(SHARJAH_SRS.TOWER, message)
    
    -- Отправляем сообщение игроку
    MESSAGE:New("ATC: " .. message, 10):ToUnit(unit)
end

function RequestDeparture(unit)
    local unit = unit
    if not unit then return end
    
    local flightID = FindFlightByUnit(unit)
    if not flightID then
        -- Если рейс не найден, создаем новый
        flightID = unit:Name() .. "_" .. os.time()
        activeFlights[flightID] = {
            unit = unit,
            phase = "DEPARTURE",
            runway = "RWY12",  -- По умолчанию ВПП 12
            startTime = os.time()
        }
    else
        -- Обновляем фазу рейса
        activeFlights[flightID].phase = "DEPARTURE"
    end
    
    local runway = activeFlights[flightID].runway
    
    -- Определяем доступные SID
    local availableSIDs = {}
    for sidName, _ in pairs(ATCSchemes.SID[runway]) do
        table.insert(availableSIDs, sidName)
    end
    
    -- Выбираем случайную SID
    local selectedSID = availableSIDs[math.random(#availableSIDs)]
    local sidData = ATCSchemes.SID[runway][selectedSID]
    
    -- Обновляем информацию о рейсе
    activeFlights[flightID].scheme = sidData
    
    -- Отправляем сообщение через SRS
    local message = unit:GetCallsign() .. ", Sharjah Departure. Radar contact. " .. 
                   "Climb via " .. sidData.name .. " departure. Climb and maintain 5000 feet."
    SendATCMessage(SHARJAH_SRS.DEPARTURE, message)
    
    -- Отправляем сообщение игроку
    MESSAGE:New("ATC: " .. message, 10):ToUnit(unit)
    
    -- Запускаем мониторинг выполнения схемы
    SCHEDULER:New(nil, function()
        MonitorFlight(flightID)
    end, {}, 5, 10)  -- Проверяем каждые 10 секунд
end

function ReportPosition(unit)
    local unit = unit
    if not unit then return end
    
    local flightID = FindFlightByUnit(unit)
    if not flightID then
        -- Если рейс не найден, отправляем общее сообщение
        local message = unit:GetCallsign() .. ", Sharjah Approach. Radar contact. " .. 
                       "Report your intentions."
        SendATCMessage(SHARJAH_SRS.APPROACH, message)
        
        -- Отправляем сообщение игроку
        MESSAGE:New("ATC: " .. message, 10):ToUnit(unit)
        return
    end
    
    local flight = activeFlights[flightID]
    local unitPos = unit:GetCoordinate()
    local unitAlt = math.floor(unit:GetAltitude() * 3.28084)  -- Конвертируем в футы
    
    -- Находим ближайшую точку маршрута, если есть схема
    local nextWP = "unknown position"
    if flight.scheme and flight.scheme.waypoints then
        local deviation = CheckRouteDeviation(unit, flight.scheme.waypoints, 1000, 5000)
        if deviation then
            nextWP = deviation.waypointName
        end
    end
    
    -- Отправляем сообщение через SRS
    local message = unit:GetCallsign() .. ", Sharjah Approach. Roger. " .. 
                   "You are at " .. unitAlt .. " feet, proceeding to " .. nextWP .. "."
    SendATCMessage(SHARJAH_SRS.APPROACH, message)
    
    -- Отправляем сообщение игроку
    MESSAGE:New("ATC: " .. message, 10):ToUnit(unit)
end

function ReportClimbing(unit)
    local unit = unit
    if not unit then return end
    
    local flightID = FindFlightByUnit(unit)
    if not flightID then
        -- Если рейс не найден, отправляем общее сообщение
        local message = unit:GetCallsign() .. ", Sharjah Departure. Radar contact. " .. 
                       "Report your intentions."
        SendATCMessage(SHARJAH_SRS.DEPARTURE, message)
        
        -- Отправляем сообщение игроку
        MESSAGE:New("ATC: " .. message, 10):ToUnit(unit)
        return
    end
    
    local flight = activeFlights[flightID]
    local unitPos = unit:GetCoordinate()
    local unitAlt = math.floor(unitPos:GetAltitude() * 3.28084)  -- Конвертируем в футы
    
    -- Находим ближайшую точку маршрута, если есть схема
    local nextWP = "unknown position"
    if flight.scheme and flight.scheme.waypoints then
        local deviation = CheckRouteDeviation(unit, flight.scheme.waypoints, 1000, 5000)
        if deviation then
            nextWP = deviation.waypointName
        end
    end
    
    -- Отправляем сообщение через SRS
    local message = unit:GetCallsign() .. ", Sharjah Departure. Roger. " .. 
                   "Climbing through " .. unitAlt .. " feet, proceeding to " .. nextWP .. "."
    SendATCMessage(SHARJAH_SRS.DEPARTURE, message)
    
    -- Отправляем сообщение игроку
    MESSAGE:New("ATC: " .. message, 10):ToUnit(unit)
end

-- Функция для мониторинга выполнения схемы
function MonitorFlight(flightID)
    local flight = activeFlights[flightID]
    if not flight then return nil end
    
    local unit = flight.unit
    if not unit or not unit:IsAlive() then
        activeFlights[flightID] = nil
        return nil
    end
    
    -- Проверяем отклонение от маршрута
    if flight.scheme and flight.scheme.waypoints then
        local deviation = CheckRouteDeviation(unit, flight.scheme.waypoints, 1000, 5000)
        if deviation then
            -- Если есть значительное отклонение, отправляем предупреждение
            if not deviation.altDeviationOK then
                local message
                if unit:GetAltitude() * 3.28084 > flight.scheme.waypoints[deviation.waypointIndex].alt then
                    message = unit:GetCallsign() .. ", Sharjah ATC. You are too high. " .. 
                             "Descend to " .. flight.scheme.waypoints[deviation.waypointIndex].alt .. " feet."
                else
                    message = unit:GetCallsign() .. ", Sharjah ATC. You are too low. " .. 
                             "Climb to " .. flight.scheme.waypoints[deviation.waypointIndex].alt .. " feet."
                end
                
                -- Отправляем сообщение через SRS
                if flight.phase == "APPROACH" then
                    SendATCMessage(SHARJAH_SRS.APPROACH, message)
                elseif flight.phase == "DEPARTURE" then
                    SendATCMessage(SHARJAH_SRS.DEPARTURE, message)
                end
                
                -- Отправляем сообщение игроку
                MESSAGE:New("ATC: " .. message, 10):ToUnit(unit)
            end
            
            if not deviation.lateralDeviationOK or not deviation.courseDeviationOK then
                local message = unit:GetCallsign() .. ", Sharjah ATC. You are off course. " .. 
                               "Return to the " .. flight.scheme.name .. " route."
                
                -- Отправляем сообщение через SRS
                if flight.phase == "APPROACH" then
                    SendATCMessage(SHARJAH_SRS.APPROACH, message)
                elseif flight.phase == "DEPARTURE" then
                    SendATCMessage(SHARJAH_SRS.DEPARTURE, message)
                end
                
                -- Отправляем сообщение игроку
                MESSAGE:New("ATC: " .. message, 10):ToUnit(unit)
            end
        end
    end
    
    return 10  -- Продолжаем мониторинг
end

-- Функция для поиска рейса по юниту
function FindFlightByUnit(unit)
    for flightID, flight in pairs(activeFlights) do
        if flight.unit and flight.unit:Name() == unit:Name() then
            return flightID
        end
    end
    return nil
end

-- Инициализация
function Initialize()
    
    -- Запускаем очистку устаревших рейсов
    SCHEDULER:New(nil, function()
        CleanupFlights()
    end, {}, 60, 60)  -- Проверяем каждую минуту
end

-- Функция для очистки устаревших рейсов
function CleanupFlights()
    local currentTime = os.time()
    for flightID, flight in pairs(activeFlights) do
        -- Удаляем рейсы старше 1 часа или если юнит не существует
        if currentTime - flight.startTime > 3600 or not flight.unit or not flight.unit:IsAlive() then
            activeFlights[flightID] = nil
        end
    end
end

-- Запускаем инициализацию
Initialize()
