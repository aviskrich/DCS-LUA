local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OSPR",
        Name = "OSPR Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
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
            threshold = { lat = 34.55594166666666, lon = 38.30038333333333 },
            end = { lat = 34.55594166666666, lon = 38.30038333333333 }
        },
        ["RW26"] = {
            heading = 260,
            length = 0,
            width = 0,
            threshold = { lat = 34.558658333333334, lon = 38.33248888888889 },
            end = { lat = 34.558658333333334, lon = 38.33248888888889 }
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
