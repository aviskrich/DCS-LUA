local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OMAJ",
        Name = "OMAJ Airport",
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
            threshold = { lat = 24.19465, lon = 52.60611388888889 },
            end = { lat = 24.19465, lon = 52.60611388888889 }
        },
        ["RW31"] = {
            heading = 310,
            length = 0,
            width = 0,
            threshold = { lat = 24.18088888888889, lon = 52.621775 },
            end = { lat = 24.18088888888889, lon = 52.621775 }
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
