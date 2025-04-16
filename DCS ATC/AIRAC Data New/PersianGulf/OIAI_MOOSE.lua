local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIAI",
        Name = "OIAI Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
    },

    -- Данные ВПП
    Runways = {
        ["RW14"] = {
            heading = 140,
            length = 0,
            width = 0,
            threshold = { lat = 32.009166666666665, lon = 49.26166666666666 },
            end = { lat = 32.009166666666665, lon = 49.26166666666666 }
        },
        ["RW32"] = {
            heading = 320,
            length = 0,
            width = 0,
            threshold = { lat = 31.995555555555555, lon = 49.275555555555556 },
            end = { lat = 31.995555555555555, lon = 49.275555555555556 }
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
