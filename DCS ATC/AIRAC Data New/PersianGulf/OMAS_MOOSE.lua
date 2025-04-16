local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OMAS",
        Name = "OMAS Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
    },

    -- Данные ВПП
    Runways = {
        ["RW13"] = {
            heading = 130,
            length = 0,
            width = 0,
            threshold = { lat = 25.142788888888887, lon = 52.86856944444445 },
            end = { lat = 25.142788888888887, lon = 52.86856944444445 }
        },
        ["RW31"] = {
            heading = 310,
            length = 0,
            width = 0,
            threshold = { lat = 25.133977777777776, lon = 52.87990277777778 },
            end = { lat = 25.133977777777776, lon = 52.87990277777778 }
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
