local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OMAZ",
        Name = "OMAZ Airport",
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
            threshold = { lat = 24.866258333333334, lon = 53.07268888888889 },
            end = { lat = 24.866258333333334, lon = 53.07268888888889 }
        },
        ["RW31"] = {
            heading = 310,
            length = 0,
            width = 0,
            threshold = { lat = 24.857436111111113, lon = 53.08314722222222 },
            end = { lat = 24.857436111111113, lon = 53.08314722222222 }
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
