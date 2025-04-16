local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KINS",
        Name = "KINS Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
    },

    -- Данные ВПП
    Runways = {
        ["RW08"] = {
            heading = 80,
            length = 0,
            width = 0,
            threshold = { lat = 36.58445555555556, lon = -115.69556666666666 },
            end = { lat = 36.58445555555556, lon = -115.69556666666666 }
        },
        ["RW13"] = {
            heading = 130,
            length = 0,
            width = 0,
            threshold = { lat = 36.596497222222226, lon = -115.67786666666667 },
            end = { lat = 36.596497222222226, lon = -115.67786666666667 }
        },
        ["RW26"] = {
            heading = 260,
            length = 0,
            width = 0,
            threshold = { lat = 36.58345, lon = -115.6649388888889 },
            end = { lat = 36.58345, lon = -115.6649388888889 }
        },
        ["RW31"] = {
            heading = 310,
            length = 0,
            width = 0,
            threshold = { lat = 36.585100000000004, lon = -115.66828055555555 },
            end = { lat = 36.585100000000004, lon = -115.66828055555555 }
        },
    },

    -- Процедуры SID
    SID = {
    },

    -- Процедуры STAR
    STAR = {
    },

    -- Процедуры захода на посадку
    APPROACH = {
    },

    -- Частоты
    Frequencies = {
        TOWER = 118.0,
        APPROACH = 121.0,
        DEPARTURE = 125.0,
        GROUND = 121.7,
        ATIS = 126.0,
    }
}

return AirportData
