local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KVGT",
        Name = "KVGT Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["LAS"] = { lat = 36.203897222, lon = -115.184352778, type = "DME", frequency = 110.7, elevation = 2151.0, name = "NORTH", range = 25.0 },
        ["MISEN"] = { lat = 34.435727778, lon = 132.641913889, type = "ENRT" },
        ["OPNOW"] = { lat = 36.696183333, lon = -116.529166667, type = "KVGT" },
        ["BYSEN"] = { lat = 35.043580556, lon = -114.176986111, type = "ENRT" },
        ["ZELMA"] = { lat = 34.783330556, lon = -115.329863889, type = "ENRT" },
        ["NTNDO"] = { lat = 35.690736111, lon = -115.048083333, type = "ENRT" },
        ["JOKUS"] = { lat = 36.350636111, lon = -115.371458333, type = "KVGT" },
        ["KEEKE"] = { lat = 36.507280556, lon = -115.653208333, type = "ENRT" },
        ["OXYAP"] = { lat = 36.238658333, lon = -115.232980556, type = "KVGT" },
        ["SUVIE"] = { lat = 36.359425, lon = -114.804752778, type = "ENRT" },
        ["WYLND"] = { lat = 36.1574, lon = -114.416166667, type = "ENRT" },
        ["CUXIV"] = { lat = 36.356622222, lon = -115.382816667, type = "KVGT" },
        ["LNDIN"] = { lat = 36.21765, lon = -114.8444, type = "ENRT" },
        ["SSKEE"] = { lat = 35.6331, lon = -111.824313889, type = "ENRT" },
        ["FLCHR"] = { lat = 37.100630556, lon = -116.875377778, type = "ENRT" },
        ["LINCK"] = { lat = 35.072880556, lon = -115.896158333, type = "ENRT" },
        ["GEOOF"] = { lat = 36.524161111, lon = -115.897719444, type = "KVGT" },
        ["TNP"] = { lat = -19.358333333, lon = 146.461666667, type = "ENRT" },
        ["KONNG"] = { lat = 35.460941667, lon = -114.950597222, type = "ENRT" },
        ["KIGGE"] = { lat = 36.324352778, lon = -115.338097222, type = "KVGT" },
        ["ECAKO"] = { lat = 36.459927778, lon = -115.526625, type = "ENRT" },
        ["TETRS"] = { lat = 35.219361111, lon = -115.086616667, type = "ENRT" },
        ["RUZCO"] = { lat = 36.242411111, lon = -115.285358333, type = "KVGT" },
        ["JOTNU"] = { lat = 34.325863889, lon = -115.529525, type = "ENRT" },
        ["TOADD"] = { lat = 36.296, lon = -111.510336111, type = "ENRT" },
        ["TUPUC"] = { lat = 36.216363889, lon = -115.277936111, type = "KVGT" },
        ["WOLON"] = { lat = 36.271591667, lon = -115.274663889, type = "KVGT" },
        ["KEEKO"] = { lat = 35.674966667, lon = -115.041375, type = "ENRT" },
        ["YITLU"] = { lat = 36.319136111, lon = -115.334930556, type = "KVGT" },
        ["UYUKA"] = { lat = 36.388972222, lon = -115.423655556, type = "KVGT" },
        ["GUILE"] = { lat = 34.915866667, lon = -113.49555, type = "ENRT" },
        ["BOEGY"] = { lat = 36.089213889, lon = -114.059280556, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW07"] = {
            heading = 70,
            length = 0,
            width = 0,
            threshold = { lat = 36.21329444444445, lon = -115.20337500000001 },
            end = { lat = 36.21329444444445, lon = -115.20337500000001 }
        },
        ["RW12L"] = {
            heading = 120,
            length = 0,
            width = 0,
            threshold = { lat = 36.21242222222222, lon = -115.19641944444444 },
            end = { lat = 36.21242222222222, lon = -115.19641944444444 }
        },
        ["RW12R"] = {
            heading = 120,
            length = 0,
            width = 0,
            threshold = { lat = 36.21467777777778, lon = -115.20266666666667 },
            end = { lat = 36.21467777777778, lon = -115.20266666666667 }
        },
        ["RW25"] = {
            heading = 250,
            length = 0,
            width = 0,
            threshold = { lat = 36.21363055555556, lon = -115.18641666666667 },
            end = { lat = 36.21363055555556, lon = -115.18641666666667 }
        },
        ["RW30L"] = {
            heading = 300,
            length = 0,
            width = 0,
            threshold = { lat = 36.20508055555556, lon = -115.19054166666668 },
            end = { lat = 36.20508055555556, lon = -115.19054166666668 }
        },
        ["RW30R"] = {
            heading = 300,
            length = 0,
            width = 0,
            threshold = { lat = 36.20474444444445, lon = -115.18672222222223 },
            end = { lat = 36.20474444444445, lon = -115.18672222222223 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BLD1"] = {
            name = "BLD1",
            runway = "RW07",
            waypoints = {
                { name = "", type = "", altitude_min = 2605 },
                { name = "", type = "" },
                { name = "LAS", type = "D", altitude_min = 4000 },
                { name = "BLD", type = "D", altitude_min = 6000 },
                { name = "", type = "", altitude_min = 2605 },
                { name = "", type = "" },
                { name = "LAS", type = "D", altitude_min = 4000 },
                { name = "BLD", type = "D", altitude_min = 6000 },
                { name = "", type = "", altitude_min = 2605 },
                { name = "", type = "" },
                { name = "LAS", type = "D", altitude_min = 4000 },
                { name = "BLD", type = "D", altitude_min = 6000 },
                { name = "", type = "", altitude_min = 2605 },
                { name = "", type = "" },
                { name = "LAS", type = "D", altitude_min = 4000 },
                { name = "BLD", type = "D", altitude_min = 6000 },
            }
        },
        ["NOTWN5"] = {
            name = "NOTWN5",
            runway = "RW07",
            waypoints = {
                { name = "", type = "", altitude_min = 2610 },
                { name = "", type = "", altitude_min = 3700 },
                { name = "RUZCO", type = "P", altitude_min = 3700, altitude_max = 5000, speed = 240.0 },
                { name = "LAS", type = "D", altitude_min = 7000 },
                { name = "", type = "", altitude_min = 2610 },
                { name = "", type = "", altitude_min = 3700 },
                { name = "RUZCO", type = "P", altitude_min = 3700, altitude_max = 5000, speed = 240.0 },
                { name = "LAS", type = "D", altitude_min = 7000 },
                { name = "", type = "", altitude_min = 2610 },
                { name = "", type = "", altitude_min = 3700 },
                { name = "RUZCO", type = "P", altitude_min = 3700, altitude_max = 5000, speed = 240.0 },
                { name = "LAS", type = "D", altitude_min = 7000 },
                { name = "", type = "", altitude_min = 2610 },
                { name = "", type = "", altitude_min = 3700 },
                { name = "RUZCO", type = "P", altitude_min = 3700, altitude_max = 5000, speed = 240.0 },
                { name = "LAS", type = "D", altitude_min = 7000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["FLCHR1"] = {
            name = "FLCHR1",
            runway = "ALL",
            waypoints = {
                { name = "FLCHR", type = "K2" },
                { name = "OPNOW", type = "K2" },
                { name = "GEOOF", type = "K2" },
                { name = "KEEKE", type = "K2", altitude_min = 10500, speed = 250.0 },
                { name = "ECAKO", type = "K2", speed = 230.0 },
                { name = "ECAKO", type = "K2" },
            }
        },
        ["NTNDO1"] = {
            name = "NTNDO1",
            runway = "GUILE",
            waypoints = {
                { name = "GUILE", type = "K2" },
                { name = "BYSEN", type = "K2", altitude_min = 24000 },
                { name = "KONNG", type = "K2", altitude_min = 10000, speed = 250.0 },
                { name = "MISEN", type = "K2" },
                { name = "LINCK", type = "K2" },
                { name = "TETRS", type = "K2", altitude_min = 13000 },
                { name = "KONNG", type = "K2", altitude_min = 10000, speed = 250.0 },
                { name = "TNP", type = "K2" },
                { name = "JOTNU", type = "K2" },
                { name = "ZELMA", type = "K2", altitude_min = 15000 },
                { name = "TETRS", type = "K2", altitude_min = 13000 },
                { name = "KONNG", type = "K2", altitude_min = 10000, speed = 250.0 },
                { name = "KONNG", type = "K2", altitude_min = 10000, speed = 250.0 },
                { name = "KEEKO", type = "K2", altitude_min = 7200 },
                { name = "NTNDO", type = "K2" },
                { name = "NTNDO", type = "K2" },
            }
        },
        ["WYLND1"] = {
            name = "WYLND1",
            runway = "SSKEE",
            waypoints = {
                { name = "SSKEE", type = "K2" },
                { name = "BOEGY", type = "K2", speed = 250.0 },
                { name = "TOADD", type = "K2" },
                { name = "BOEGY", type = "K2", speed = 250.0 },
                { name = "BOEGY", type = "K2", speed = 250.0 },
                { name = "WYLND", type = "K2" },
                { name = "LNDIN", type = "K2" },
                { name = "LNDIN", type = "K2" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I12L"] = {
            name = "I12L",
            type = "I",
            runway = "I12L",
            waypoints = {
                { name = "JOKUS", transition = "", type = "K2" },
                { name = "KIGGE", transition = "", type = "K2" },
                { name = "RW12L", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2660 },
                { name = "", transition = "", type = "" },
                { name = "TUPUC", transition = "", type = "K2", altitude_min = 6000 },
                { name = "LAS", transition = "", type = "K2" },
                { name = "LAS", transition = "", type = "K2" },
            }
        },
        ["R12R"] = {
            name = "R12R",
            type = "A",
            runway = "R12R",
            waypoints = {
                { name = "ECAKO", transition = "ECAKO", type = "K2", speed = 230.0 },
                { name = "UYUKA", transition = "ECAKO", type = "K2", altitude_min = 6700 },
                { name = "UYUKA", transition = "", type = "K2", altitude_min = 6700 },
                { name = "CUXIV", transition = "", type = "K2", altitude_min = 6100 },
                { name = "YITLU", transition = "", type = "K2", altitude_min = 5100 },
                { name = "WOLON", transition = "", type = "K2", altitude_min = 3800 },
                { name = "OXYAP", transition = "", type = "K2", altitude_min = 2900 },
                { name = "RW12R", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2900 },
                { name = "SUVIE", transition = "", type = "K2", altitude_min = 7500 },
                { name = "SUVIE", transition = "", type = "K2", altitude_min = 7500 },
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
