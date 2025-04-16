local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OOKB",
        Name = "OOKB Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
    },

    -- Данные ВПП
    Runways = {
        ["RW01"] = {
            heading = 10,
            length = 900.0,
            width = 0,
            threshold = { lat = 26.16083611111111, lon = 56.23770277777778 },
            end = { lat = 26.30670666299471, lon = 56.26635926372099 }
        },
        ["RW19"] = {
            heading = 190,
            length = -900.0,
            width = 0,
            threshold = { lat = 26.1827, lon = 56.24359166666667 },
            end = { lat = 26.3285705518836, lon = 56.27225352722033 }
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
