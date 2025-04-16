local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KBTY",
        Name = "KBTY Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
    },

    -- Данные ВПП
    Runways = {
        ["RW16"] = {
            heading = 160,
            length = 0,
            width = 0,
            threshold = { lat = 36.86884166666667, lon = -116.78640555555555 },
            end = { lat = 36.86884166666667, lon = -116.78640555555555 }
        },
        ["RW34"] = {
            heading = 340,
            length = 0,
            width = 0,
            threshold = { lat = 36.853425, lon = -116.78639166666666 },
            end = { lat = 36.853425, lon = -116.78639166666666 }
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
