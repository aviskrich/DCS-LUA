local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KBFL",
        Name = "KBFL Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["GRAPE"] = { lat = 34.965691667, lon = -118.917044444, type = "ENRT" },
        ["JIBOP"] = { lat = 35.517361111, lon = -119.157244444, type = "KBFL" },
        ["WIJYI"] = { lat = 35.021347222, lon = -118.573502778, type = "ENRT" },
        ["TEDBE"] = { lat = 35.473155556, lon = -119.107241667, type = "KBFL" },
        ["OJOXY"] = { lat = 35.400494444, lon = -119.019441667, type = "KBFL" },
        ["HOVGA"] = { lat = 35.479566667, lon = -119.11145, type = "KBFL" },
        ["JUPEX"] = { lat = 35.358463889, lon = -118.965211111, type = "KBFL" },
        ["MOMUE"] = { lat = 35.586997222, lon = -119.245277778, type = "KBFL" },
        ["MA137"] = { lat = 35.446627778, lon = -119.0715, type = "KBFL" },
        ["NINTY"] = { lat = 35.047244444, lon = -118.944833333, type = "ENRT" },
        ["WRING"] = { lat = 35.513155556, lon = -118.874961111, type = "ENRT" },
        ["KELEN"] = { lat = 11.808294444, lon = 104.410402778, type = "VDPP" },
        ["DELNO"] = { lat = 35.716047222, lon = -119.214091667, type = "ENRT" },
        ["LEBEC"] = { lat = 35.031161111, lon = -118.861375, type = "ENRT" },
        ["FASTO"] = { lat = 35.272216667, lon = -118.861447222, type = "KBFL" },
        ["COREZ"] = { lat = 35.556666667, lon = -119.483883333, type = "ENRT" },
        ["PONDD"] = { lat = 35.823886111, lon = -119.268347222, type = "ENRT" },
        ["IBWEN"] = { lat = 34.961625, lon = -118.861380556, type = "KBFL" },
        ["STEBN"] = { lat = 35.580908333, lon = -119.148880556, type = "ENRT" },
        ["AMONT"] = { lat = 35.183811111, lon = -118.755380556, type = "ENRT" },
        ["LOPES"] = { lat = 35.031813889, lon = -118.701402778, type = "ENRT" },
        ["WILOG"] = { lat = 35.352688889, lon = -118.961802778, type = "KBFL" },
        ["ISARE"] = { lat = 35.281369444, lon = -118.876008333, type = "KBFL" },
        ["JAPAR"] = { lat = 35.175175, lon = -118.7465, type = "ENRT" },
        ["WENTI"] = { lat = 35.511852778, lon = -119.154097222, type = "KBFL" },
        ["HOTIL"] = { lat = 35.588619444, lon = -119.243722222, type = "KBFL" },
        ["HOYMI"] = { lat = 35.4069, lon = -119.023627778, type = "KBFL" },
        ["ULEYE"] = { lat = 35.384013889, lon = -118.996013889, type = "KBFL" },
        ["GMN"] = { lat = -27.25, lon = 149.683333333, type = "ENRT" },
        ["MARIC"] = { lat = 35.237630556, lon = -119.269694444, type = "ENRT" },
        ["MINGI"] = { lat = 35.193905556, lon = -118.767630556, type = "ENRT" },
        ["AXONE"] = { lat = 35.031916667, lon = -118.861463889, type = "KBFL" },
    },

    -- Данные ВПП
    Runways = {
        ["RW12L"] = {
            heading = 120,
            length = 0,
            width = 0,
            threshold = { lat = 35.44634166666666, lon = -119.07127222222222 },
            end = { lat = 35.44634166666666, lon = -119.07127222222222 }
        },
        ["RW12R"] = {
            heading = 120,
            length = 0,
            width = 0,
            threshold = { lat = 35.43874444444444, lon = -119.06562777777778 },
            end = { lat = 35.43874444444444, lon = -119.06562777777778 }
        },
        ["RW30L"] = {
            heading = 300,
            length = 0,
            width = 0,
            threshold = { lat = 35.426630555555555, lon = -119.05099166666666 },
            end = { lat = 35.426630555555555, lon = -119.05099166666666 }
        },
        ["RW30R"] = {
            heading = 300,
            length = 0,
            width = 0,
            threshold = { lat = 35.43183055555555, lon = -119.05373333333333 },
            end = { lat = 35.43183055555555, lon = -119.05373333333333 }
        },
    },

    -- Процедуры SID
    SID = {
        ["MARIC4"] = {
            name = "MARIC4",
            runway = "RW12B",
            waypoints = {
                { name = "", type = "", altitude_min = 910 },
                { name = "", type = "" },
                { name = "MARIC", type = "E" },
                { name = "", type = "", altitude_min = 910 },
                { name = "", type = "" },
                { name = "MARIC", type = "E" },
                { name = "MARIC", type = "E" },
                { name = "NINTY", type = "E", altitude_min = 8800 },
                { name = "GMN", type = "D" },
                { name = "MARIC", type = "E" },
                { name = "NINTY", type = "E" },
                { name = "LHS", type = "D" },
            }
        },
        ["OILDA1"] = {
            name = "OILDA1",
            runway = "RW12B",
            waypoints = {
                { name = "", type = "", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "", type = "", altitude_min = 6000 },
                { name = "", type = "" },
            }
        },
        ["WRING4"] = {
            name = "WRING4",
            runway = "RW12B",
            waypoints = {
                { name = "", type = "", altitude_min = 910 },
                { name = "EHF", type = "D" },
                { name = "", type = "", altitude_min = 910 },
                { name = "EHF", type = "D" },
                { name = "EHF", type = "D" },
                { name = "WRING", type = "E", altitude_min = 5400 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["FASTO2"] = {
            name = "FASTO2",
            runway = "GMN",
            waypoints = {
                { name = "GMN", type = "K2" },
                { name = "IBWEN", type = "K2" },
                { name = "LEBEC", type = "K2" },
                { name = "FASTO", type = "K2" },
                { name = "LHS", type = "K2" },
                { name = "IBWEN", type = "K2" },
                { name = "LEBEC", type = "K2" },
                { name = "FASTO", type = "K2" },
                { name = "PMD", type = "K2" },
                { name = "WIJYI", type = "K2" },
                { name = "KELEN", type = "K2" },
                { name = "JAPAR", type = "K2" },
                { name = "MINGI", type = "K2" },
                { name = "FASTO", type = "K2" },
                { name = "FASTO", type = "K2" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I30R"] = {
            name = "I30R",
            type = "A",
            runway = "I30R",
            waypoints = {
                { name = "AMONT", transition = "AMONT", type = "K2" },
                { name = "FASTO", transition = "AMONT", type = "K2", altitude_min = 4500 },
                { name = "EHF", transition = "EHF", type = "K2" },
                { name = "JUPEX", transition = "EHF", type = "K2", altitude_min = 3100 },
                { name = "JUPEX", transition = "EHF", type = "K2", altitude_min = 2500 },
                { name = "GMN", transition = "GMN", type = "K2" },
                { name = "LEBEC", transition = "GMN", type = "K2", altitude_min = 9000 },
                { name = "LEBEC", transition = "GMN", type = "K2", altitude_min = 4500 },
                { name = "FASTO", transition = "GMN", type = "K2", altitude_min = 4500 },
                { name = "FASTO", transition = "", type = "K2" },
                { name = "JUPEX", transition = "", type = "K2" },
                { name = "RW30R", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "EHF", transition = "", type = "K2", altitude_min = 3000 },
                { name = "EHF", transition = "", type = "K2" },
            }
        },
        ["R12L"] = {
            name = "R12L",
            type = "A",
            runway = "R12L",
            waypoints = {
                { name = "COREZ", transition = "COREZ", type = "K2" },
                { name = "HOTIL", transition = "COREZ", type = "K2", altitude_min = 3400 },
                { name = "EHF", transition = "EHF", type = "K2" },
                { name = "HOTIL", transition = "EHF", type = "K2", altitude_min = 3400 },
                { name = "HOTIL", transition = "EHF", type = "K2", altitude_min = 3400 },
                { name = "MARIC", transition = "MARIC", type = "K2" },
                { name = "HOTIL", transition = "MARIC", type = "K2", altitude_min = 3400 },
                { name = "HOTIL", transition = "MARIC", type = "K2", altitude_min = 3400 },
                { name = "PONDD", transition = "PONDD", type = "K2" },
                { name = "HOTIL", transition = "PONDD", type = "K2", altitude_min = 3400 },
                { name = "HOTIL", transition = "", type = "K2", altitude_min = 3400 },
                { name = "JIBOP", transition = "", type = "K2", altitude_min = 2500 },
                { name = "HOVGA", transition = "", type = "K2", altitude_min = 1440 },
                { name = "RW12L", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 760 },
                { name = "ULEYE", transition = "", type = "K2" },
                { name = "MARIC", transition = "", type = "K2", altitude_min = 3000 },
                { name = "MARIC", transition = "", type = "K2" },
            }
        },
        ["R12R"] = {
            name = "R12R",
            type = "A",
            runway = "R12R",
            waypoints = {
                { name = "COREZ", transition = "COREZ", type = "K2" },
                { name = "MOMUE", transition = "COREZ", type = "K2", altitude_min = 3400 },
                { name = "EHF", transition = "EHF", type = "K2" },
                { name = "MOMUE", transition = "EHF", type = "K2", altitude_min = 3400 },
                { name = "MOMUE", transition = "EHF", type = "K2", altitude_min = 3400 },
                { name = "MARIC", transition = "MARIC", type = "K2" },
                { name = "MOMUE", transition = "MARIC", type = "K2", altitude_min = 3400 },
                { name = "MOMUE", transition = "MARIC", type = "K2", altitude_min = 3400 },
                { name = "PONDD", transition = "PONDD", type = "K2" },
                { name = "MOMUE", transition = "PONDD", type = "K2", altitude_min = 3400 },
                { name = "MOMUE", transition = "", type = "K2", altitude_min = 3400 },
                { name = "WENTI", transition = "", type = "K2", altitude_min = 2500 },
                { name = "TEDBE", transition = "", type = "K2", altitude_min = 1440 },
                { name = "RW12R", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "MARIC", transition = "", type = "K2", altitude_min = 3500 },
                { name = "MARIC", transition = "", type = "K2" },
            }
        },
        ["R30L"] = {
            name = "R30L",
            type = "A",
            runway = "R30L",
            waypoints = {
                { name = "GMN", transition = "GMN", type = "K2" },
                { name = "AXONE", transition = "GMN", type = "K2", altitude_min = 9800 },
                { name = "ISARE", transition = "GMN", type = "K2", altitude_min = 3500 },
                { name = "GRAPE", transition = "GRAPE", type = "K2" },
                { name = "AXONE", transition = "GRAPE", type = "K2", altitude_min = 8000 },
                { name = "ISARE", transition = "GRAPE", type = "K2", altitude_min = 3500 },
                { name = "LOPES", transition = "LOPES", type = "K2" },
                { name = "AXONE", transition = "LOPES", type = "K2", altitude_min = 8000 },
                { name = "ISARE", transition = "LOPES", type = "K2", altitude_min = 3500 },
                { name = "ISARE", transition = "", type = "K2", altitude_min = 3500 },
                { name = "WILOG", transition = "", type = "K2", altitude_min = 2500 },
                { name = "OJOXY", transition = "", type = "K2", altitude_min = 1200 },
                { name = "RW30L", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "STEBN", transition = "", type = "K2", altitude_min = 3000 },
                { name = "STEBN", transition = "", type = "K2" },
            }
        },
        ["R30R"] = {
            name = "R30R",
            type = "A",
            runway = "R30R",
            waypoints = {
                { name = "GRAPE", transition = "GRAPE", type = "K2" },
                { name = "AXONE", transition = "GRAPE", type = "K2", altitude_min = 8000 },
                { name = "FASTO", transition = "GRAPE", type = "K2", altitude_min = 3500 },
                { name = "LOPES", transition = "LOPES", type = "K2" },
                { name = "AXONE", transition = "LOPES", type = "K2", altitude_min = 8000 },
                { name = "FASTO", transition = "LOPES", type = "K2", altitude_min = 3500 },
                { name = "FASTO", transition = "", type = "K2", altitude_min = 3500 },
                { name = "JUPEX", transition = "", type = "K2", altitude_min = 2500 },
                { name = "HOYMI", transition = "", type = "K2", altitude_min = 1200 },
                { name = "RW30R", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "STEBN", transition = "", type = "K2", altitude_min = 3000 },
                { name = "STEBN", transition = "", type = "K2" },
            }
        },
        ["VORA"] = {
            name = "VORA",
            type = "A",
            runway = "VORA",
            waypoints = {
                { name = "DELNO", transition = "DELNO", type = "K2" },
                { name = "EHF", transition = "DELNO", type = "K2", altitude_min = 1800 },
                { name = "EHF", transition = "EHF", type = "K2", altitude_min = 2500 },
                { name = "EHF", transition = "EHF", type = "K2", altitude_min = 1800 },
                { name = "TTE", transition = "TTE", type = "K2" },
                { name = "DELNO", transition = "TTE", type = "K2", altitude_min = 3000 },
                { name = "EHF", transition = "TTE", type = "K2", altitude_min = 1800 },
                { name = "EHF", transition = "", type = "K2", altitude_min = 1800 },
                { name = "MA137", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "EHF", transition = "", type = "K2", altitude_min = 3000 },
                { name = "EHF", transition = "", type = "K2" },
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
