local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KRIV",
        Name = "KRIV Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["KRATZ"] = { lat = 33.542997222, lon = -116.440958333, type = "KRIV" },
        ["BERDU"] = { lat = 33.905897222, lon = -117.224066667, type = "ENRT" },
        ["DALCO"] = { lat = 33.897622222, lon = -117.269397222, type = "KRIV" },
        ["CEMBO"] = { lat = 33.632455556, lon = -117.083602778, type = "KRIV" },
        ["NOKDE"] = { lat = 33.915530556, lon = -117.51005, type = "KRIV" },
        ["DIAMD"] = { lat = 33.630877778, lon = -117.289569444, type = "ENRT" },
        ["AKOME"] = { lat = 33.68525, lon = -117.134386111, type = "KRIV" },
        ["MIRLE"] = { lat = 33.68655, lon = -117.121822222, type = "KRIV" },
        ["COMGA"] = { lat = 33.637183333, lon = -117.085402778, type = "KRIV" },
        ["DEGNE"] = { lat = 33.772377778, lon = -117.182575, type = "KRIV" },
        ["LOGTE"] = { lat = 33.772397222, lon = -117.182536111, type = "KRIV" },
        ["DEHAM"] = { lat = 33.686797222, lon = -117.121997222, type = "KRIV" },
        ["RIV"] = { lat = -35.055, lon = 147.346666667, type = "ENRT" },
        ["CULAX"] = { lat = 33.857813889, lon = -117.244033333, type = "KRIV" },
        ["AARCI"] = { lat = 33.577125, lon = -117.044722222, type = "KRIV" },
        ["SKYES"] = { lat = 33.368888889, lon = -117.072180556, type = "KRIV" },
        ["ZALUR"] = { lat = 33.626227778, lon = -117.097, type = "KRIV" },
        ["GUMSE"] = { lat = 33.693688889, lon = -116.985469444, type = "KRIV" },
        ["WAYLE"] = { lat = 33.535097222, lon = -117.012333333, type = "KRIV" },
        ["HENSA"] = { lat = 33.248525, lon = -116.841483333, type = "KRIV" },
        ["WAREK"] = { lat = 33.227616667, lon = -116.679641667, type = "KRIV" },
        ["RW14"] = { lat = 47.852847222, lon = 106.753533333, type = "ZMUB" },
        ["GOOBR"] = { lat = 33.592944444, lon = -117.189025, type = "KRIV" },
        ["HUGDI"] = { lat = 33.493391667, lon = -117.013069444, type = "KRIV" },
        ["HITOP"] = { lat = 34.299638889, lon = -117.34255, type = "ENRT" },
        ["PASKO"] = { lat = 34.205175, lon = -117.313988889, type = "ENRT" },
        ["JEGEX"] = { lat = 33.948177778, lon = -117.361788889, type = "KRIV" },
        ["RW32"] = { lat = 56.285166667, lon = 12.865880556, type = "ESTA" },
        ["TENRE"] = { lat = 34.1455, lon = -117.302122222, type = "KRIV" },
        ["CAJON"] = { lat = 34.090008333, lon = -117.279305556, type = "ENRT" },
        ["HAYOO"] = { lat = 33.527694444, lon = -116.924719444, type = "KRIV" },
        ["HIRVO"] = { lat = 33.977019444, lon = -117.328036111, type = "KRIV" },
        ["BOGLE"] = { lat = 33.744255556, lon = -117.171822222, type = "KRIV" },
        ["HESPE"] = { lat = 34.341166667, lon = -117.432030556, type = "ENRT" },
        ["GAUSE"] = { lat = 33.907141667, lon = -117.279613889, type = "KRIV" },
        ["WUNKA"] = { lat = 34.039983333, lon = -117.372969444, type = "KRIV" },
        ["MA32"] = { lat = 61.749886111, lon = -121.234041667, type = "CYFS" },
        ["SAKQU"] = { lat = 33.99815, lon = -117.466002778, type = "KRIV" },
        ["ANOTE"] = { lat = 33.242313889, lon = -116.855225, type = "KRIV" },
        ["BEMLE"] = { lat = 33.497266667, lon = -117.004497222, type = "KRIV" },
        ["MAJEK"] = { lat = 34.388647222, lon = -117.534602778, type = "ENRT" },
        ["ARKOE"] = { lat = 33.628286111, lon = -117.080655556, type = "ENRT" },
        ["MEKIE"] = { lat = 33.914813889, lon = -117.292383333, type = "KRIV" },
        ["TALPE"] = { lat = 33.899397222, lon = -117.274027778, type = "KRIV" },
        ["MURRE"] = { lat = 33.544711111, lon = -117.025777778, type = "ENRT" },
        ["GAZOO"] = { lat = 33.501202778, lon = -116.577725, type = "KRIV" },
        ["HIGOP"] = { lat = 33.164455556, lon = -116.903672222, type = "ENRT" },
        ["OSTOR"] = { lat = 53.829444444, lon = 9.052777778, type = "ENRT" },
        ["CASIT"] = { lat = 33.436886111, lon = -116.787222222, type = "KRIV" },
    },

    -- Данные ВПП
    Runways = {
        ["RW12"] = {
            heading = 120,
            length = 0,
            width = 0,
            threshold = { lat = 33.890258333333335, lon = -117.26068055555555 },
            end = { lat = 33.890258333333335, lon = -117.26068055555555 }
        },
        ["RW14"] = {
            heading = 140,
            length = 0,
            width = 0,
            threshold = { lat = 33.896430555555554, lon = -117.27063611111112 },
            end = { lat = 33.896430555555554, lon = -117.27063611111112 }
        },
        ["RW30"] = {
            heading = 300,
            length = 0,
            width = 0,
            threshold = { lat = 33.88431944444444, lon = -117.25353611111112 },
            end = { lat = 33.88431944444444, lon = -117.25353611111112 }
        },
        ["RW32"] = {
            heading = 320,
            length = 0,
            width = 0,
            threshold = { lat = 33.86499444444445, lon = -117.24828055555555 },
            end = { lat = 33.86499444444445, lon = -117.24828055555555 }
        },
    },

    -- Процедуры SID
    SID = {
        ["SKYES4"] = {
            name = "SKYES4",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 1940 },
                { name = "HDF", type = "D" },
                { name = "MURRE", type = "E", altitude_min = 7000 },
                { name = "SKYES", type = "P", altitude_min = 12000 },
                { name = "", type = "", altitude_min = 1940 },
                { name = "", type = "" },
                { name = "DIAMD", type = "E", altitude_min = 5800, speed = 310.0 },
                { name = "SKYES", type = "P", altitude_min = 12000 },
                { name = "SKYES", type = "P", altitude_min = 12000 },
                { name = "JLI", type = "D", speed = 310.0 },
                { name = "SKYES", type = "P", altitude_min = 12000 },
                { name = "HIGOP", type = "E" },
                { name = "OCN", type = "D" },
                { name = "SKYES", type = "P", altitude_min = 12000 },
                { name = "TRM", type = "D" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ARKOE1"] = {
            name = "ARKOE1",
            runway = "TRM",
            waypoints = {
                { name = "TRM", type = "K2" },
                { name = "KRATZ", type = "K2" },
                { name = "GAZOO", type = "K2" },
                { name = "CASIT", type = "K2" },
                { name = "HAYOO", type = "K2" },
                { name = "ARKOE", type = "K2" },
                { name = "ARKOE", type = "K2" },
            }
        },
        ["MARCH4"] = {
            name = "MARCH4",
            runway = "ALL",
            waypoints = {
                { name = "PMD", type = "K2" },
                { name = "MAJEK", type = "K2" },
                { name = "HESPE", type = "K2" },
                { name = "HITOP", type = "K2" },
                { name = "PASKO", type = "K2" },
                { name = "CAJON", type = "K2" },
                { name = "BERDU", type = "K2" },
                { name = "HDF", type = "K2" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I32-X"] = {
            name = "I32-X",
            type = "A",
            runway = "I32-X",
            waypoints = {
                { name = "CEMBO", transition = "CEMBO", type = "K2", altitude_min = 7200 },
                { name = "DEHAM", transition = "CEMBO", type = "K2", altitude_min = 5400 },
                { name = "DEHAM", transition = "", type = "K2" },
                { name = "DEGNE", transition = "", type = "K2" },
                { name = "RW32", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1940 },
                { name = "RIV", transition = "", type = "K2" },
                { name = "BOGLE", transition = "", type = "K2", altitude_min = 5300 },
                { name = "BOGLE", transition = "", type = "K2", altitude_max = 6000, speed = 310.0 },
            }
        },
        ["I32-Y"] = {
            name = "I32-Y",
            type = "A",
            runway = "I32-Y",
            waypoints = {
                { name = "ARKOE", transition = "ARKOE", type = "K2", altitude_min = 7300 },
                { name = "MIRLE", transition = "ARKOE", type = "K2", altitude_min = 5400 },
                { name = "MIRLE", transition = "", type = "K2" },
                { name = "DEGNE", transition = "", type = "K2" },
                { name = "RW32", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1940 },
                { name = "GAUSE", transition = "", type = "K2" },
                { name = "HDF", transition = "", type = "K2", altitude_min = 5300 },
                { name = "HDF", transition = "", type = "K2", altitude_max = 6000, speed = 310.0 },
            }
        },
        ["I32-Z"] = {
            name = "I32-Z",
            type = "A",
            runway = "I32-Z",
            waypoints = {
                { name = "HENSA", transition = "HENSA", type = "K2", altitude_min = 24000 },
                { name = "BEMLE", transition = "HENSA", type = "K2", altitude_min = 12000 },
                { name = "AARCI", transition = "HENSA", type = "K2" },
                { name = "CEMBO", transition = "HENSA", type = "K2", altitude_min = 6000 },
                { name = "CEMBO", transition = "", type = "K2" },
                { name = "DEGNE", transition = "", type = "K2" },
                { name = "RW32", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1940 },
                { name = "RIV", transition = "", type = "K2" },
                { name = "BOGLE", transition = "", type = "K2", altitude_min = 5300 },
                { name = "BOGLE", transition = "", type = "K2", altitude_max = 6000, speed = 310.0 },
            }
        },
        ["R14"] = {
            name = "R14",
            type = "A",
            runway = "R14",
            waypoints = {
                { name = "TENRE", transition = "TENRE", type = "K2", altitude_min = 6000 },
                { name = "WUNKA", transition = "TENRE", type = "K2", altitude_min = 4000 },
                { name = "WUNKA", transition = "", type = "K2", altitude_min = 4000 },
                { name = "HIRVO", transition = "", type = "K2", altitude_min = 3200 },
                { name = "RW14", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2300 },
                { name = "ZALUR", transition = "", type = "K2", altitude_min = 7700 },
                { name = "ZALUR", transition = "", type = "K2", altitude_max = 8300 },
            }
        },
        ["R32"] = {
            name = "R32",
            type = "A",
            runway = "R32",
            waypoints = {
                { name = "GOOBR", transition = "GOOBR", type = "K2", altitude_min = 5000 },
                { name = "DEHAM", transition = "GOOBR", type = "K2", altitude_min = 4500 },
                { name = "GUMSE", transition = "GUMSE", type = "K2", altitude_min = 5000 },
                { name = "DEHAM", transition = "GUMSE", type = "K2", altitude_min = 4500 },
                { name = "DEHAM", transition = "", type = "K2", altitude_min = 4500 },
                { name = "LOGTE", transition = "", type = "K2", altitude_min = 3600 },
                { name = "RW32", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2100 },
                { name = "NOKDE", transition = "", type = "K2", altitude_min = 5500 },
                { name = "NOKDE", transition = "", type = "K2", altitude_max = 6100 },
            }
        },
        ["T14-Y"] = {
            name = "T14-Y",
            type = "T",
            runway = "T14-Y",
            waypoints = {
                { name = "SAKQU", transition = "", type = "K2", altitude_min = 4500 },
                { name = "JEGEX", transition = "", type = "K2", altitude_min = 3100 },
                { name = "MEKIE", transition = "", type = "K2" },
                { name = "RIV", transition = "", type = "K2" },
                { name = "BOGLE", transition = "", type = "K2", altitude_min = 5300 },
                { name = "BOGLE", transition = "", type = "K2", altitude_max = 6000, speed = 310.0 },
            }
        },
        ["T14-Z"] = {
            name = "T14-Z",
            type = "T",
            runway = "T14-Z",
            waypoints = {
                { name = "SAKQU", transition = "", type = "K2", altitude_min = 4500 },
                { name = "JEGEX", transition = "", type = "K2", altitude_min = 3100 },
                { name = "MEKIE", transition = "", type = "K2" },
                { name = "RIV", transition = "", type = "K2" },
                { name = "BOGLE", transition = "", type = "K2", altitude_min = 5300 },
                { name = "BOGLE", transition = "", type = "K2", altitude_max = 6000, speed = 310.0 },
            }
        },
        ["T32-Y"] = {
            name = "T32-Y",
            type = "A",
            runway = "T32-Y",
            waypoints = {
                { name = "ZALUR", transition = "ZALUR", type = "K2", altitude_min = 7300 },
                { name = "AKOME", transition = "ZALUR", type = "K2", altitude_min = 5400 },
                { name = "AKOME", transition = "", type = "K2", altitude_min = 5400 },
                { name = "OSTOR", transition = "", type = "K2", altitude_min = 3600 },
                { name = "CULAX", transition = "", type = "K2" },
                { name = "DALCO", transition = "", type = "K2" },
                { name = "BOGLE", transition = "", type = "K2", altitude_min = 5300 },
                { name = "BOGLE", transition = "", type = "K2", altitude_max = 6000, speed = 310.0 },
            }
        },
        ["T32-Z"] = {
            name = "T32-Z",
            type = "A",
            runway = "T32-Z",
            waypoints = {
                { name = "ANOTE", transition = "ANOTE", type = "K2", altitude_min = 24000 },
                { name = "HUGDI", transition = "ANOTE", type = "K2", altitude_min = 12000 },
                { name = "ZALUR", transition = "ANOTE", type = "K2", altitude_min = 6000 },
                { name = "ZALUR", transition = "", type = "K2", altitude_min = 6000 },
                { name = "OSTOR", transition = "", type = "K2", altitude_min = 3600 },
                { name = "CULAX", transition = "", type = "K2" },
                { name = "DALCO", transition = "", type = "K2" },
                { name = "BOGLE", transition = "", type = "K2", altitude_min = 5300 },
                { name = "BOGLE", transition = "", type = "K2", altitude_max = 6000, speed = 310.0 },
            }
        },
        ["V32-Y"] = {
            name = "V32-Y",
            type = "A",
            runway = "V32-Y",
            waypoints = {
                { name = "HDF", transition = "HDF", type = "K2", altitude_min = 5300 },
                { name = "HDF", transition = "HDF", type = "K2", altitude_min = 5300 },
                { name = "HDF", transition = "HDF", type = "K2", altitude_min = 3700 },
                { name = "HDF", transition = "", type = "K2", altitude_min = 3700 },
                { name = "MA32", transition = "", type = "K2" },
                { name = "TALPE", transition = "", type = "K2" },
                { name = "HDF", transition = "", type = "K2", altitude_min = 5300 },
                { name = "HDF", transition = "", type = "K2", altitude_max = 6000, speed = 310.0 },
            }
        },
        ["V32-Z"] = {
            name = "V32-Z",
            type = "A",
            runway = "V32-Z",
            waypoints = {
                { name = "JLI", transition = "JLI", type = "K2", altitude_min = 24000 },
                { name = "WAREK", transition = "JLI", type = "K2", altitude_min = 24000 },
                { name = "WAYLE", transition = "JLI", type = "K2", altitude_min = 12000 },
                { name = "COMGA", transition = "JLI", type = "K2", altitude_min = 6000 },
                { name = "COMGA", transition = "", type = "K2", altitude_min = 6000 },
                { name = "HDF", transition = "", type = "K2", altitude_min = 3600 },
                { name = "MA32", transition = "", type = "K2" },
                { name = "TALPE", transition = "", type = "K2" },
                { name = "HDF", transition = "", type = "K2", altitude_min = 5300 },
                { name = "HDF", transition = "", type = "K2", altitude_max = 6000, speed = 310.0 },
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
