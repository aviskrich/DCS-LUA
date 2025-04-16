local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "ULNR",
        Name = "ULNR Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Kola"
    },

    -- Путевые точки
    Waypoints = {
    },

    -- Данные ВПП
    Runways = {
        ["RW01"] = {
            heading = 10,
            length = -80.0,
            width = 0,
            threshold = { lat = 57.95166666666667, lon = 31.3795 },
            end = { lat = 57.938700395388125, lon = 31.375191377772243 }
        },
        ["RW19"] = {
            heading = 190,
            length = 80.0,
            width = 0,
            threshold = { lat = 57.969, lon = 31.388555555555556 },
            end = { lat = 57.95603372872146, lon = 31.38424485006139 }
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
