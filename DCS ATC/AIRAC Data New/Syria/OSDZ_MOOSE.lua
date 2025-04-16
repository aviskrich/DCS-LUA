local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OSDZ",
        Name = "OSDZ Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["RW28"] = { lat = 26.191502778, lon = 85.930916667, type = "VEDH" },
        ["FS28"] = { lat = 21.772219444, lon = -72.183522222, type = "MBPV" },
    },

    -- Данные ВПП
    Runways = {
        ["RW10"] = {
            heading = 100,
            length = 0,
            width = 0,
            threshold = { lat = 35.29003888888889, lon = 40.16063888888889 },
            end = { lat = 35.29003888888889, lon = 40.16063888888889 }
        },
        ["RW28"] = {
            heading = 280,
            length = 0,
            width = 0,
            threshold = { lat = 35.28091944444444, lon = 40.19152222222222 },
            end = { lat = 35.28091944444444, lon = 40.19152222222222 }
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
        ["S28"] = {
            name = "S28",
            type = "A",
            runway = "S28",
            waypoints = {
                { name = "DRZ", transition = "DRZ1", type = "OS", altitude_min = 4000, speed = 210.0 },
                { name = "DRZ", transition = "DRZ1", type = "OS", altitude_min = 2500 },
                { name = "FS28", transition = "DRZ1", type = "OS", altitude_min = 2500 },
                { name = "DRZ", transition = "DRZ2", type = "OS", altitude_min = 4000, speed = 210.0 },
                { name = "DRZ", transition = "DRZ2", type = "OS", altitude_min = 2500 },
                { name = "FS28", transition = "DRZ2", type = "OS", altitude_min = 2500 },
                { name = "FS28", transition = "", type = "OS", altitude_min = 2500 },
                { name = "RW28", transition = "", type = "OS" },
                { name = "DRZ", transition = "", type = "OS", altitude_min = 1100 },
                { name = "DRZ", transition = "", type = "OS", speed = 185.0 },
            }
        },
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
