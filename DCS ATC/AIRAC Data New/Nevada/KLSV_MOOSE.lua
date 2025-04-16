local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KLSV",
        Name = "KLSV Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["CUVAX"] = { lat = 36.430141667, lon = -114.832322222, type = "KLSV" },
        ["CADOS"] = { lat = 36.278830556, lon = -114.985725, type = "KLSV" },
        ["LAS"] = { lat = 36.203897222, lon = -115.184352778, type = "DME", frequency = 110.7, elevation = 2151.0, name = "NORTH", range = 25.0 },
        ["VETTT"] = { lat = 36.622244444, lon = -114.587355556, type = "KLSV" },
        ["SHEET"] = { lat = 36.408861111, lon = -114.844194444, type = "KLSV" },
        ["SECRT"] = { lat = 36.336105556, lon = -115.268125, type = "KLSV" },
        ["KUTME"] = { lat = 36.504763889, lon = -114.734591667, type = "KLSV" },
        ["KITCH"] = { lat = 36.253336111, lon = -115.015430556, type = "KLSV" },
        ["JENAR"] = { lat = 36.331438889, lon = -114.928466667, type = "KLSV" },
        ["ROTSE"] = { lat = 36.335544444, lon = -114.924066667, type = "KLSV" },
        ["WILIE"] = { lat = 36.276897222, lon = -114.989222222, type = "KLSV" },
        ["WEBSO"] = { lat = 36.174091667, lon = -115.100713889, type = "KLSV" },
        ["ZINAX"] = { lat = 36.3904, lon = -114.850858333, type = "KLSV" },
        ["IREEN"] = { lat = 36.223825, lon = -115.044241667, type = "KLSV" },
        ["OLNIE"] = { lat = 36.583144444, lon = -114.912608333, type = "KLSV" },
        ["HOKUM"] = { lat = 36.459505556, lon = -114.987702778, type = "KLSV" },
        ["ROCKX"] = { lat = 36.213641667, lon = -115.059536111, type = "KLSV" },
        ["MMM"] = { lat = -34.971666667, lon = 149.025, type = "ENRT" },
        ["LATPE"] = { lat = 36.278538889, lon = -114.986038889, type = "KLSV" },
        ["FESDI"] = { lat = 36.303722222, lon = -114.958677778, type = "KLSV" },
        ["ARCOE"] = { lat = 36.737683333, lon = -114.917066667, type = "KLSV" },
        ["KRYSS"] = { lat = 36.506155556, lon = -114.736508333, type = "KLSV" },
        ["RONKY"] = { lat = 36.655522222, lon = -114.935163889, type = "KLSV" },
        ["MINTT"] = { lat = 36.712355556, lon = -115.10485, type = "ENRT" },
        ["ZAPVO"] = { lat = 36.561172222, lon = -114.796525, type = "KLSV" },
        ["WOXEK"] = { lat = 36.341438889, lon = -114.91765, type = "KLSV" },
        ["CFKPW"] = { lat = 36.459716667, lon = -114.788638889, type = "KLSV" },
        ["HULPU"] = { lat = 36.405761111, lon = -114.845483333, type = "KLSV" },
        ["WISTO"] = { lat = 36.589791667, lon = -114.949613889, type = "KLSV" },
        ["LUCIL"] = { lat = 35.979794444, lon = -115.308, type = "KLSV" },
        ["JEGET"] = { lat = 36.320075, lon = -114.940897222, type = "KLSV" },
        ["DUDBE"] = { lat = 36.364141667, lon = -115.343022222, type = "KLSV" },
        ["ENGLA"] = { lat = 36.143836111, lon = -115.133086111, type = "KLSV" },
        ["HUSTS"] = { lat = 36.047966667, lon = -115.235430556, type = "KLSV" },
        ["JELIR"] = { lat = 36.298886111, lon = -114.963933333, type = "KLSV" },
        ["JUNNO"] = { lat = 36.730027778, lon = -114.879497222, type = "ENRT" },
        ["ENIYO"] = { lat = 36.250911111, lon = -115.016030556, type = "KLSV" },
        ["SESDE"] = { lat = 36.251194444, lon = -115.015719444, type = "KLSV" },
        ["FROZE"] = { lat = 36.339255556, lon = -115.090605556, type = "KLSV" },
        ["BALBE"] = { lat = 36.404197222, lon = -114.849263889, type = "KLSV" },
        ["JOGEV"] = { lat = 36.297975, lon = -114.965758333, type = "KLSV" },
        ["CEDRU"] = { lat = 36.219461111, lon = -115.052111111, type = "KLSV" },
        ["HEREM"] = { lat = 36.375341667, lon = -114.871769444, type = "KLSV" },
        ["ATALF"] = { lat = 36.391933333, lon = -114.872130556, type = "KLSV" },
    },

    -- Данные ВПП
    Runways = {
        ["RW03L"] = {
            heading = 30,
            length = 0,
            width = 0,
            threshold = { lat = 36.22669444444445, lon = -115.04680277777777 },
            end = { lat = 36.22669444444445, lon = -115.04680277777777 }
        },
        ["RW03R"] = {
            heading = 30,
            length = 0,
            width = 0,
            threshold = { lat = 36.22488333333334, lon = -115.04425555555555 },
            end = { lat = 36.22488333333334, lon = -115.04425555555555 }
        },
        ["RW21L"] = {
            heading = 210,
            length = 0,
            width = 0,
            threshold = { lat = 36.24562777777778, lon = -115.02177222222222 },
            end = { lat = 36.24562777777778, lon = -115.02177222222222 }
        },
        ["RW21R"] = {
            heading = 210,
            length = 0,
            width = 0,
            threshold = { lat = 36.24758055555556, lon = -115.02416666666666 },
            end = { lat = 36.24758055555556, lon = -115.02416666666666 }
        },
    },

    -- Процедуры SID
    SID = {
        ["DREAM7"] = {
            name = "DREAM7",
            runway = "RW03L",
            waypoints = {
                { name = "", type = "" },
                { name = "ATALF", type = "P", altitude_max = 16000 },
                { name = "JUNNO", type = "E", altitude_min = 17000, altitude_max = 19000 },
                { name = "", type = "" },
                { name = "HEREM", type = "P", altitude_max = 16000 },
                { name = "JUNNO", type = "E", altitude_min = 17000, altitude_max = 19000 },
                { name = "", type = "", altitude_min = 2270 },
                { name = "MINTT", type = "E", altitude_min = 17000, altitude_max = 19000 },
            }
        },
        ["MMM8"] = {
            name = "MMM8",
            runway = "RW03L",
            waypoints = {
                { name = "", type = "" },
                { name = "CUVAX", type = "P", altitude_max = 11000 },
                { name = "MMM", type = "D" },
                { name = "", type = "" },
                { name = "ZINAX", type = "P", altitude_max = 11000 },
                { name = "MMM", type = "D" },
                { name = "", type = "", altitude_min = 2270 },
                { name = "FROZE", type = "P", altitude_max = 12000 },
                { name = "MMM", type = "D" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I21LX"] = {
            name = "I21LX",
            type = "A",
            runway = "I21LX",
            waypoints = {
                { name = "KRYSS", transition = "KRYSS", type = "K2", altitude_min = 8800 },
                { name = "SHEET", transition = "KRYSS", type = "K2", altitude_min = 5000 },
                { name = "SHEET", transition = "", type = "K2" },
                { name = "ROTSE", transition = "", type = "K2" },
                { name = "RW21L", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2270 },
                { name = "ROCKX", transition = "", type = "K2" },
                { name = "", transition = "", type = "" },
                { name = "ARCOE", transition = "", type = "K2", altitude_min = 15000 },
                { name = "ARCOE", transition = "", type = "K2", altitude_max = 19000 },
            }
        },
        ["I21LZ"] = {
            name = "I21LZ",
            type = "I",
            runway = "I21LZ",
            waypoints = {
                { name = "SHEET", transition = "", type = "K2" },
                { name = "ROTSE", transition = "", type = "K2" },
                { name = "RW21L", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2270 },
                { name = "ROCKX", transition = "", type = "K2" },
                { name = "", transition = "", type = "" },
                { name = "ARCOE", transition = "", type = "K2", altitude_min = 15000 },
                { name = "ARCOE", transition = "", type = "K2", altitude_max = 19000, speed = 310.0 },
            }
        },
        ["L21LX"] = {
            name = "L21LX",
            type = "A",
            runway = "L21LX",
            waypoints = {
                { name = "KRYSS", transition = "KRYSS", type = "K2", altitude_min = 8800 },
                { name = "SHEET", transition = "KRYSS", type = "K2", altitude_min = 5000 },
                { name = "SHEET", transition = "", type = "K2", altitude_min = 5000 },
                { name = "ROTSE", transition = "", type = "K2", altitude_min = 4200 },
                { name = "JELIR", transition = "", type = "K2", altitude_min = 3260 },
                { name = "CADOS", transition = "", type = "K2", altitude_min = 2760 },
                { name = "SESDE", transition = "", type = "K2" },
                { name = "ROCKX", transition = "", type = "K2" },
                { name = "", transition = "", type = "" },
                { name = "ARCOE", transition = "", type = "K2", altitude_min = 15000 },
                { name = "ARCOE", transition = "", type = "K2", altitude_max = 19000 },
            }
        },
        ["L21LY"] = {
            name = "L21LY",
            type = "A",
            runway = "L21LY",
            waypoints = {
                { name = "ZAPVO", transition = "ZAPVO", type = "K2", altitude_min = 7000 },
                { name = "CFKPW", transition = "ZAPVO", type = "K2" },
                { name = "BALBE", transition = "ZAPVO", type = "K2", altitude_min = 5700 },
                { name = "WOXEK", transition = "ZAPVO", type = "K2", altitude_min = 4400 },
                { name = "JEGET", transition = "ZAPVO", type = "K2", altitude_min = 4000 },
                { name = "JEGET", transition = "", type = "K2", altitude_min = 4000 },
                { name = "FESDI", transition = "", type = "K2", altitude_min = 3600 },
                { name = "LATPE", transition = "", type = "K2", altitude_min = 2760 },
                { name = "ENIYO", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2270 },
                { name = "IREEN", transition = "", type = "K2" },
                { name = "LAS", transition = "", type = "K2" },
                { name = "LAS", transition = "", type = "K2" },
            }
        },
        ["L21LZ"] = {
            name = "L21LZ",
            type = "L",
            runway = "L21LZ",
            waypoints = {
                { name = "SHEET", transition = "", type = "K2", altitude_min = 5000 },
                { name = "ROTSE", transition = "", type = "K2", altitude_min = 4200 },
                { name = "JELIR", transition = "", type = "K2", altitude_min = 3260 },
                { name = "CADOS", transition = "", type = "K2", altitude_min = 2760 },
                { name = "SESDE", transition = "", type = "K2" },
                { name = "ROCKX", transition = "", type = "K2" },
                { name = "", transition = "", type = "" },
                { name = "ARCOE", transition = "", type = "K2", altitude_min = 15000 },
                { name = "ARCOE", transition = "", type = "K2", altitude_max = 19000 },
            }
        },
        ["T03R"] = {
            name = "T03R",
            type = "A",
            runway = "T03R",
            waypoints = {
                { name = "LUCIL", transition = "LUCIL", type = "K2", altitude_min = 10300 },
                { name = "HUSTS", transition = "LUCIL", type = "K2", altitude_min = 6300 },
                { name = "HUSTS", transition = "", type = "K2", altitude_min = 6300 },
                { name = "ENGLA", transition = "", type = "K2", altitude_min = 3900 },
                { name = "WEBSO", transition = "", type = "K2", altitude_min = 3220 },
                { name = "CEDRU", transition = "", type = "K2" },
                { name = "VETTT", transition = "", type = "K2", altitude_min = 9000 },
                { name = "VETTT", transition = "", type = "K2", altitude_max = 19000 },
            }
        },
        ["T21LX"] = {
            name = "T21LX",
            type = "A",
            runway = "T21LX",
            waypoints = {
                { name = "KUTME", transition = "KUTME", type = "K2", altitude_min = 8800 },
                { name = "HULPU", transition = "KUTME", type = "K2", altitude_min = 5000 },
                { name = "HULPU", transition = "", type = "K2", altitude_min = 5000 },
                { name = "JENAR", transition = "", type = "K2", altitude_min = 4400 },
                { name = "JOGEV", transition = "", type = "K2", altitude_min = 3380 },
                { name = "WILIE", transition = "", type = "K2", altitude_min = 2800 },
                { name = "KITCH", transition = "", type = "K2" },
                { name = "ROCKX", transition = "", type = "K2" },
                { name = "", transition = "", type = "" },
                { name = "ARCOE", transition = "", type = "K2", altitude_min = 15000 },
                { name = "ARCOE", transition = "", type = "K2", altitude_max = 19000 },
            }
        },
        ["T21LY"] = {
            name = "T21LY",
            type = "A",
            runway = "T21LY",
            waypoints = {
                { name = "DUDBE", transition = "DUDBE", type = "K2", altitude_min = 10000, altitude_max = 15000 },
                { name = "SECRT", transition = "DUDBE", type = "K2" },
                { name = "HOKUM", transition = "DUDBE", type = "K2", altitude_min = 8800 },
                { name = "HULPU", transition = "DUDBE", type = "K2", altitude_min = 5500 },
                { name = "HULPU", transition = "", type = "K2", altitude_min = 5500 },
                { name = "JENAR", transition = "", type = "K2", altitude_min = 4400 },
                { name = "JOGEV", transition = "", type = "K2", altitude_min = 3380 },
                { name = "WILIE", transition = "", type = "K2", altitude_min = 2800 },
                { name = "KITCH", transition = "", type = "K2" },
                { name = "ROCKX", transition = "", type = "K2" },
                { name = "", transition = "", type = "" },
                { name = "ARCOE", transition = "", type = "K2", altitude_min = 15000 },
                { name = "ARCOE", transition = "", type = "K2", altitude_max = 19000 },
            }
        },
        ["T21LZ"] = {
            name = "T21LZ",
            type = "A",
            runway = "T21LZ",
            waypoints = {
                { name = "ARCOE", transition = "ARCOE", type = "K2", altitude_min = 15000 },
                { name = "RONKY", transition = "ARCOE", type = "K2", altitude_min = 15000 },
                { name = "WISTO", transition = "ARCOE", type = "K2" },
                { name = "OLNIE", transition = "ARCOE", type = "K2", altitude_min = 12500 },
                { name = "KUTME", transition = "ARCOE", type = "K2", altitude_min = 8800 },
                { name = "KUTME", transition = "", type = "K2", altitude_min = 8800 },
                { name = "JENAR", transition = "", type = "K2", altitude_min = 4400 },
                { name = "JOGEV", transition = "", type = "K2", altitude_min = 3380 },
                { name = "WILIE", transition = "", type = "K2", altitude_min = 2800 },
                { name = "KITCH", transition = "", type = "K2" },
                { name = "ROCKX", transition = "", type = "K2" },
                { name = "", transition = "", type = "" },
                { name = "ARCOE", transition = "", type = "K2", altitude_min = 15000 },
                { name = "ARCOE", transition = "", type = "K2", altitude_max = 19000 },
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
