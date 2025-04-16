local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KGXF",
        Name = "KGXF Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
    },

    -- Данные ВПП
    Runways = {
        ["RW17"] = {
            heading = 170,
            length = 0,
            width = 0,
            threshold = { lat = 32.89953055555556, lon = -112.71958055555555 },
            end = { lat = 32.89953055555556, lon = -112.71958055555555 }
        },
        ["RW35"] = {
            heading = 350,
            length = 0,
            width = 0,
            threshold = { lat = 32.87616388888889, lon = -112.7196388888889 },
            end = { lat = 32.87616388888889, lon = -112.7196388888889 }
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
