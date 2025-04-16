local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OMDM",
        Name = "OMDM Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
    },

    -- Данные ВПП
    Runways = {
        ["RW09"] = {
            heading = 90,
            length = 0,
            width = 0,
            threshold = { lat = 25.0265, lon = 55.34666666666667 },
            end = { lat = 25.0265, lon = 55.34666666666667 }
        },
        ["RW27"] = {
            heading = 270,
            length = 0,
            width = 0,
            threshold = { lat = 25.027166666666666, lon = 55.38583333333333 },
            end = { lat = 25.027166666666666, lon = 55.38583333333333 }
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
