local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OOTH",
        Name = "OOTH Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
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
            threshold = { lat = 17.684, lon = 54.022166666666664 },
            end = { lat = 17.684, lon = 54.022166666666664 }
        },
        ["RW35"] = {
            heading = 350,
            length = 0,
            width = 0,
            threshold = { lat = 17.648166666666665, lon = 54.027166666666666 },
            end = { lat = 17.648166666666665, lon = 54.027166666666666 }
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
