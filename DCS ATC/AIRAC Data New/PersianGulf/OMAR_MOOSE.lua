local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OMAR",
        Name = "OMAR Airport",
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
            threshold = { lat = 24.783347222222226, lon = 52.556713888888886 },
            end = { lat = 24.783347222222226, lon = 52.556713888888886 }
        },
        ["RW31"] = {
            heading = 310,
            length = 0,
            width = 0,
            threshold = { lat = 24.77833611111111, lon = 52.56310833333333 },
            end = { lat = 24.77833611111111, lon = 52.56310833333333 }
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
