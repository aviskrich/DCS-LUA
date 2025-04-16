local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LTDA",
        Name = "LTDA Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["ADA"] = { lat = -44.718083333, lon = 167.852277778, type = "ENRT" },
        ["FF04"] = { lat = 27.756305556, lon = -0.263136111, type = "DAUA" },
        ["MA04"] = { lat = 64.167886111, lon = -51.696125, type = "BGGH" },
        ["FF22"] = { lat = 9.107830556, lon = 7.334552778, type = "DNAA" },
        ["MA22"] = { lat = 51.042736111, lon = 71.498797222, type = "UACC" },
        ["70DME"] = { lat = 18.521430556, lon = 31.878241667, type = "HSMN" },
        ["EKHAS"] = { lat = 36.710433333, lon = 35.644686111, type = "ENRT" },
        ["CF04"] = { lat = 8.842433333, lon = 7.1477, type = "DNAA" },
        ["CF22"] = { lat = 9.148938889, lon = 7.363602778, type = "DNAA" },
        ["D299J"] = { lat = 40.304472222, lon = 69.520725, type = "UTDL" },
        ["D009J"] = { lat = 23.187980556, lon = 113.208908333, type = "ZGGG" },
        ["MILBA"] = { lat = 36.951388889, lon = 36.479444444, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW04"] = {
            heading = 40,
            length = 40.0,
            width = 0,
            threshold = { lat = 36.35239444444444, lon = 36.27612222222222 },
            end = { lat = 36.35743742873783, lon = 36.28137630316767 }
        },
        ["RW22"] = {
            heading = 220,
            length = 0,
            width = 0,
            threshold = { lat = 36.366197222222226, lon = 36.29188055555555 },
            end = { lat = 36.366197222222226, lon = 36.29188055555555 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ADA1W"] = {
            name = "ADA1W",
            runway = "RW22",
            waypoints = {
                { name = "", type = "", altitude_min = 670 },
                { name = "HTY", type = "D", altitude_min = 2500 },
                { name = "HTY", type = "D", altitude_min = 5000, speed = 204.0 },
                { name = "EKHAS", type = "E" },
                { name = "ADA", type = "D" },
            }
        },
        ["ADA1X"] = {
            name = "ADA1X",
            runway = "RW04",
            waypoints = {
                { name = "", type = "", altitude_min = 670 },
                { name = "HTY", type = "D", altitude_min = 2600 },
                { name = "HTY", type = "D", altitude_min = 5000, speed = 204.0 },
                { name = "EKHAS", type = "E" },
                { name = "ADA", type = "D" },
            }
        },
        ["ADA1Y"] = {
            name = "ADA1Y",
            runway = "RW22",
            waypoints = {
                { name = "", type = "", altitude_min = 670 },
                { name = "HTY", type = "D", altitude_min = 2500 },
                { name = "HTY", type = "D", altitude_min = 5000, speed = 204.0 },
                { name = "EKHAS", type = "E" },
                { name = "ADA", type = "D" },
            }
        },
        ["ADA1Z"] = {
            name = "ADA1Z",
            runway = "RW04",
            waypoints = {
                { name = "", type = "", altitude_min = 670 },
                { name = "HTY", type = "D", altitude_min = 2600 },
                { name = "HTY", type = "D", altitude_min = 5000, speed = 204.0 },
                { name = "EKHAS", type = "E" },
                { name = "ADA", type = "D" },
            }
        },
        ["MILB1W"] = {
            name = "MILB1W",
            runway = "RW22",
            waypoints = {
                { name = "", type = "", altitude_min = 670 },
                { name = "HTY", type = "D", altitude_min = 2500 },
                { name = "HTY", type = "D", altitude_min = 5000, speed = 204.0 },
                { name = "MILBA", type = "E" },
            }
        },
        ["MILB1X"] = {
            name = "MILB1X",
            runway = "RW04",
            waypoints = {
                { name = "", type = "", altitude_min = 670 },
                { name = "HTY", type = "D", altitude_min = 2600 },
                { name = "HTY", type = "D", altitude_min = 5000, speed = 204.0 },
                { name = "MILBA", type = "E" },
            }
        },
        ["MILB1Y"] = {
            name = "MILB1Y",
            runway = "RW22",
            waypoints = {
                { name = "", type = "", altitude_min = 670 },
                { name = "HTY", type = "D", altitude_min = 2500 },
                { name = "HTY", type = "D", altitude_min = 5000, speed = 204.0 },
                { name = "MILBA", type = "E" },
            }
        },
        ["MILB1Z"] = {
            name = "MILB1Z",
            runway = "RW04",
            waypoints = {
                { name = "", type = "", altitude_min = 670 },
                { name = "HTY", type = "D", altitude_min = 2600 },
                { name = "HTY", type = "D", altitude_min = 5000, speed = 204.0 },
                { name = "MILBA", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ADA1U"] = {
            name = "ADA1U",
            runway = "ALL",
            waypoints = {
                { name = "ADA", type = "LT" },
                { name = "EKHAS", type = "LT" },
                { name = "D299J", type = "LT" },
                { name = "HTY", type = "LT" },
            }
        },
        ["MILB1U"] = {
            name = "MILB1U",
            runway = "ALL",
            waypoints = {
                { name = "MILBA", type = "LT" },
                { name = "D009J", type = "LT" },
                { name = "HTY", type = "LT" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D04-Z"] = {
            name = "D04-Z",
            type = "D",
            runway = "D04-Z",
            waypoints = {
                { name = "CF04", transition = "", type = "LT", altitude_min = 4400 },
                { name = "70DME", transition = "", type = "LT", altitude_min = 2550 },
                { name = "FF04", transition = "", type = "LT", altitude_min = 1810 },
                { name = "MA04", transition = "", type = "LT" },
                { name = "HTY", transition = "", type = "LT" },
                { name = "HTY", transition = "", type = "LT", altitude_min = 2350, speed = 185.0 },
                { name = "HTY", transition = "", type = "LT" },
                { name = "HTY", transition = "", type = "LT", altitude_min = 8500, speed = 230.0 },
            }
        },
        ["D22-Z"] = {
            name = "D22-Z",
            type = "D",
            runway = "D22-Z",
            waypoints = {
                { name = "CF22", transition = "", type = "LT", altitude_min = 4800 },
                { name = "FF22", transition = "", type = "LT", altitude_min = 2650 },
                { name = "MA22", transition = "", type = "LT" },
                { name = "HTY", transition = "", type = "LT" },
                { name = "HTY", transition = "", type = "LT", altitude_min = 2300, speed = 185.0 },
                { name = "HTY", transition = "", type = "LT" },
                { name = "HTY", transition = "", type = "LT", altitude_min = 8500, speed = 230.0 },
            }
        },
        ["Q04-Z"] = {
            name = "Q04-Z",
            type = "Q",
            runway = "Q04-Z",
            waypoints = {
                { name = "CF04", transition = "", type = "LT", altitude_min = 4400 },
                { name = "70DME", transition = "", type = "LT", altitude_min = 2550 },
                { name = "FF04", transition = "", type = "LT", altitude_min = 1810 },
                { name = "MA04", transition = "", type = "LT" },
                { name = "HTY", transition = "", type = "LT" },
                { name = "HTY", transition = "", type = "LT", altitude_min = 2350, speed = 185.0 },
                { name = "HTY", transition = "", type = "LT" },
                { name = "HTY", transition = "", type = "LT", altitude_min = 8500, speed = 230.0 },
            }
        },
        ["Q22-Z"] = {
            name = "Q22-Z",
            type = "Q",
            runway = "Q22-Z",
            waypoints = {
                { name = "CF22", transition = "", type = "LT", altitude_min = 4800 },
                { name = "FF22", transition = "", type = "LT", altitude_min = 2650 },
                { name = "MA22", transition = "", type = "LT" },
                { name = "HTY", transition = "", type = "LT" },
                { name = "HTY", transition = "", type = "LT", altitude_min = 2300, speed = 185.0 },
                { name = "HTY", transition = "", type = "LT" },
                { name = "HTY", transition = "", type = "LT", altitude_min = 8500, speed = 230.0 },
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
