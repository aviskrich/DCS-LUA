local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KELY",
        Name = "KELY Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["BIVNE"] = { lat = 39.310441667, lon = -114.844641667, type = "KELY" },
        ["JAMKI"] = { lat = 39.564655556, lon = -114.86635, type = "KELY" },
        ["JASIS"] = { lat = 39.500955556, lon = -114.787855556, type = "KELY" },
        ["RW18"] = { lat = 45.645033333, lon = 5.879652778, type = "LFLB" },
        ["FEILL"] = { lat = 39.421975, lon = -114.799861111, type = "KELY" },
        ["GUSME"] = { lat = 39.549538889, lon = -114.869913889, type = "KELY" },
        ["VIANT"] = { lat = 39.558155556, lon = -114.770741667, type = "KELY" },
        ["DOTME"] = { lat = 38.840194444, lon = -114.648144444, type = "ENRT" },
        ["HARRV"] = { lat = 39.539219444, lon = -114.995936111, type = "ENRT" },
        ["INGOL"] = { lat = 39.674741667, lon = -115.079425, type = "ENRT" },
        ["ZOLOB"] = { lat = 39.235919444, lon = -114.858666667, type = "KELY" },
        ["JAMOP"] = { lat = 39.508663889, lon = -114.801813889, type = "KELY" },
        ["MCGIL"] = { lat = 39.407997222, lon = -114.815602778, type = "KELY" },
        ["FAPGI"] = { lat = 39.629136111, lon = -114.794580556, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW12"] = {
            heading = 120,
            length = 0,
            width = 0,
            threshold = { lat = 39.303419444444444, lon = -114.8519 },
            end = { lat = 39.303419444444444, lon = -114.8519 }
        },
        ["RW18"] = {
            heading = 180,
            length = 0,
            width = 0,
            threshold = { lat = 39.30881944444444, lon = -114.83564444444444 },
            end = { lat = 39.30881944444444, lon = -114.83564444444444 }
        },
        ["RW30"] = {
            heading = 300,
            length = 0,
            width = 0,
            threshold = { lat = 39.29318333333333, lon = -114.84109166666666 },
            end = { lat = 39.29318333333333, lon = -114.84109166666666 }
        },
        ["RW36"] = {
            heading = 360,
            length = 0,
            width = 0,
            threshold = { lat = 39.29278055555555, lon = -114.84070555555554 },
            end = { lat = 39.29278055555555, lon = -114.84070555555554 }
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
        ["R18"] = {
            name = "R18",
            type = "A",
            runway = "R18",
            waypoints = {
                { name = "FAPGI", transition = "FAPGI", type = "K2" },
                { name = "JAMOP", transition = "FAPGI", type = "K2", altitude_min = 9500 },
                { name = "INGOL", transition = "INGOL", type = "K2" },
                { name = "GUSME", transition = "INGOL", type = "K2", altitude_min = 10600 },
                { name = "JAMOP", transition = "INGOL", type = "K2", altitude_min = 9500 },
                { name = "JAMOP", transition = "", type = "K2", altitude_min = 9500 },
                { name = "FEILL", transition = "", type = "K2", altitude_min = 8500 },
                { name = "RW18", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 6652 },
                { name = "ZOLOB", transition = "", type = "K2" },
                { name = "DOTME", transition = "", type = "K2", altitude_min = 12000 },
                { name = "DOTME", transition = "", type = "K2" },
            }
        },
        ["VORC"] = {
            name = "VORC",
            type = "A",
            runway = "VORC",
            waypoints = {
                { name = "HARRV", transition = "HARRV", type = "K2" },
                { name = "JAMKI", transition = "HARRV", type = "K2", altitude_min = 13000 },
                { name = "VIANT", transition = "HARRV", type = "K2", altitude_min = 11200 },
                { name = "JASIS", transition = "HARRV", type = "K2", altitude_min = 10400 },
                { name = "JASIS", transition = "", type = "K2", altitude_min = 10400 },
                { name = "MCGIL", transition = "", type = "K2", altitude_min = 9100 },
                { name = "BIVNE", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 8800 },
                { name = "DOTME", transition = "", type = "K2", altitude_min = 12000 },
                { name = "DOTME", transition = "", type = "K2" },
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
