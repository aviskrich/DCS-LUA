local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "PGUA",
        Name = "PGUA Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Marianas"
    },

    -- Путевые точки
    Waypoints = {
        ["WEVUS"] = { lat = 13.587575, lon = 144.946925, type = "PGUA" },
        ["BRTNE"] = { lat = 13.615522222, lon = 144.584011111, type = "PGUA" },
        ["WESOK"] = { lat = 13.620947222, lon = 145.020680556, type = "PGUA" },
        ["HAAMR"] = { lat = 13.716411111, lon = 145.109897222, type = "PGUA" },
        ["FABED"] = { lat = 13.709494444, lon = 145.211247222, type = "PGUA" },
        ["OSKKR"] = { lat = 13.691655556, lon = 145.182044444, type = "PGUA" },
        ["FOKAI"] = { lat = 13.553038889, lon = 145.277994444, type = "PGUA" },
        ["VEAGA"] = { lat = 13.43515, lon = 144.705433333, type = "PGUA" },
        ["TOCOG"] = { lat = 13.435833333, lon = 144.70495, type = "PGUA" },
        ["JALOB"] = { lat = 13.529411111, lon = 144.846791667, type = "PGUA" },
        ["HILRI"] = { lat = 13.472480556, lon = 144.682261111, type = "PGUA" },
        ["DWAFF"] = { lat = 13.724, lon = 145.16655, type = "PGUA" },
        ["ANIKA"] = { lat = 13.543055556, lon = 144.842919444, type = "PGUA" },
        ["COLMA"] = { lat = 13.539330556, lon = 144.846877778, type = "PGUA" },
        ["MDBUG"] = { lat = 13.733191667, lon = 145.160425, type = "PGUA" },
        ["ENWHY"] = { lat = 13.592102778, lon = 144.943911111, type = "PGUA" },
        ["OWEND"] = { lat = 13.623372222, lon = 145.026183333, type = "PGUA" },
        ["WUVEN"] = { lat = 14.056186111, lon = 144.432641667, type = "ENRT" },
        ["ADTIN"] = { lat = 13.457488889, lon = 144.689858333, type = "PGUA" },
        ["JIPRO"] = { lat = 13.596255556, lon = 144.953413889, type = "PGUA" },
        ["BANNI"] = { lat = 13.532202778, lon = 144.844802778, type = "PGUA" },
        ["PANNS"] = { lat = 13.705094444, lon = 145.213255556, type = "PGUA" },
        ["FABHA"] = { lat = 14.043780556, lon = 145.562777778, type = "PGUA" },
        ["JORUN"] = { lat = 13.545655556, lon = 144.836447222, type = "PGUA" },
        ["FOVEM"] = { lat = 13.762369444, lon = 145.179086111, type = "PGUA" },
        ["OKIBE"] = { lat = 13.608608333, lon = 145.030280556, type = "PGUA" },
        ["EVEBE"] = { lat = 13.641580556, lon = 145.014930556, type = "PGUA" },
        ["CREET"] = { lat = 13.637605556, lon = 145.013686111, type = "PGUA" },
        ["ROUDY"] = { lat = 13.693280556, lon = 145.173663889, type = "PGUA" },
        ["JWILL"] = { lat = 13.624894444, lon = 145.017422222, type = "PGUA" },
        ["HASRA"] = { lat = 13.62495, lon = 145.017577778, type = "PGUA" },
        ["LUAAP"] = { lat = 13.691705556, lon = 145.182447222, type = "PGUA" },
        ["ISLAA"] = { lat = 13.696594444, lon = 145.181241667, type = "PGUA" },
        ["TIMAE"] = { lat = 13.688119444, lon = 145.108730556, type = "PGUA" },
        ["SNOYL"] = { lat = 13.314755556, lon = 144.722033333, type = "PGUA" },
        ["CCOOK"] = { lat = 13.575236111, lon = 144.916325, type = "PGUA" },
        ["FOMOD"] = { lat = 13.546258333, lon = 144.835966667, type = "PGUA" },
        ["ITUME"] = { lat = 13.575166667, lon = 144.907069444, type = "PGUA" },
        ["EDIAZ"] = { lat = 13.85895, lon = 145.139533333, type = "PGUA" },
        ["FAYZR"] = { lat = 13.578780556, lon = 144.911738889, type = "PGUA" },
        ["LOGLE"] = { lat = 13.477058333, lon = 144.680161111, type = "PGUA" },
        ["HURUG"] = { lat = 13.481944444, lon = 144.678022222, type = "PGUA" },
        ["FAXEL"] = { lat = 13.571569444, lon = 144.908808333, type = "PGUA" },
        ["WELKU"] = { lat = 13.650222222, lon = 145.231213889, type = "PGUA" },
        ["ZUKIE"] = { lat = 13.696077778, lon = 145.103436111, type = "PGUA" },
        ["BAVAC"] = { lat = 13.592958333, lon = 144.95495, type = "PGUA" },
        ["RW06R"] = { lat = 40.884847222, lon = 29.302591667, type = "LTFJ" },
        ["HIPRI"] = { lat = 13.631575, lon = 145.017697222, type = "PGUA" },
        ["D252Q"] = { lat = 44.744341667, lon = -63.710897222, type = "CYHZ" },
        ["D251Q"] = { lat = -18.962222222, lon = 47.270822222, type = "FMMI" },
        ["ARKEE"] = { lat = 13.8154, lon = 144.767302778, type = "PGUA" },
    },

    -- Данные ВПП
    Runways = {
        ["RW06L"] = {
            heading = 60,
            length = 800.0,
            width = 0,
            threshold = { lat = 13.580355555555556, lon = 144.91564444444444 },
            end = { lat = 13.646187040121365, lon = 145.0329475312568 }
        },
        ["RW06R"] = {
            heading = 60,
            length = 400.0,
            width = 0,
            threshold = { lat = 13.575327777777778, lon = 144.91649444444445 },
            end = { lat = 13.608243520060682, lon = 144.9751447448412 }
        },
        ["RW24L"] = {
            heading = 240,
            length = -400.0,
            width = 0,
            threshold = { lat = 13.587941666666667, lon = 144.9452777777778 },
            end = { lat = 13.620857408949572, lon = 145.00393119764064 }
        },
        ["RW24R"] = {
            heading = 240,
            length = -800.0,
            width = 0,
            threshold = { lat = 13.592202777777779, lon = 144.94270555555556 },
            end = { lat = 13.658034262343588, lon = 145.06001450429628 }
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
        ["I06LY"] = {
            name = "I06LY",
            type = "A",
            runway = "I06LY",
            waypoints = {
                { name = "FABHA", transition = "FABHA", type = "PG", altitude_min = 18000 },
                { name = "FOVEM", transition = "FABHA", type = "PG", altitude_min = 3000 },
                { name = "ARKEE", transition = "FABHA", type = "PG", altitude_min = 2600 },
                { name = "D252Q", transition = "FABHA", type = "PG", altitude_min = 2600 },
                { name = "", transition = "FABHA", type = "" },
                { name = "FOVEM", transition = "FOVEM", type = "PG", altitude_min = 3000 },
                { name = "ARKEE", transition = "FOVEM", type = "PG", altitude_min = 2600 },
                { name = "D252Q", transition = "FOVEM", type = "PG", altitude_min = 2600 },
                { name = "", transition = "FOVEM", type = "" },
                { name = "LOGLE", transition = "", type = "PG" },
                { name = "JORUN", transition = "", type = "PG" },
                { name = "RW06L", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1120 },
                { name = "FOVEM", transition = "", type = "PG", altitude_min = 3000 },
                { name = "FOVEM", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["I06LZ"] = {
            name = "I06LZ",
            type = "A",
            runway = "I06LZ",
            waypoints = {
                { name = "ARKEE", transition = "ARKEE", type = "PG", altitude_min = 2600 },
                { name = "D252Q", transition = "ARKEE", type = "PG", altitude_min = 2600 },
                { name = "", transition = "ARKEE", type = "" },
                { name = "FOVEM", transition = "FOVEM", type = "PG", altitude_min = 3000 },
                { name = "ARKEE", transition = "FOVEM", type = "PG", altitude_min = 2600 },
                { name = "D252Q", transition = "FOVEM", type = "PG", altitude_min = 2600 },
                { name = "", transition = "FOVEM", type = "" },
                { name = "LOGLE", transition = "", type = "PG" },
                { name = "JORUN", transition = "", type = "PG" },
                { name = "RW06L", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1120 },
                { name = "FOVEM", transition = "", type = "PG", altitude_min = 3000 },
                { name = "FOVEM", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["I06RZ"] = {
            name = "I06RZ",
            type = "A",
            runway = "I06RZ",
            waypoints = {
                { name = "ARKEE", transition = "ARKEE", type = "PG", altitude_min = 2600 },
                { name = "D251Q", transition = "ARKEE", type = "PG", altitude_min = 2600 },
                { name = "", transition = "ARKEE", type = "" },
                { name = "FOVEM", transition = "FOVEM", type = "PG", altitude_min = 3000 },
                { name = "ARKEE", transition = "FOVEM", type = "PG", altitude_min = 2600 },
                { name = "D251Q", transition = "FOVEM", type = "PG", altitude_min = 2600 },
                { name = "", transition = "FOVEM", type = "" },
                { name = "HILRI", transition = "", type = "PG" },
                { name = "ANIKA", transition = "", type = "PG" },
                { name = "RW06R", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1120 },
                { name = "FOVEM", transition = "", type = "PG", altitude_min = 3000 },
                { name = "FOVEM", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["I24LZ"] = {
            name = "I24LZ",
            type = "A",
            runway = "I24LZ",
            waypoints = {
                { name = "PANNS", transition = "PANNS", type = "PG", altitude_min = 3000, speed = 265.0 },
                { name = "PANNS", transition = "", type = "PG" },
                { name = "WESOK", transition = "", type = "PG" },
                { name = "RW24L", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "", transition = "", type = "" },
                { name = "PANNS", transition = "", type = "PG", altitude_min = 3000 },
                { name = "PANNS", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["I24RZ"] = {
            name = "I24RZ",
            type = "A",
            runway = "I24RZ",
            waypoints = {
                { name = "FABED", transition = "FABED", type = "PG", altitude_min = 3000, speed = 265.0 },
                { name = "FABED", transition = "", type = "PG" },
                { name = "HASRA", transition = "", type = "PG" },
                { name = "RW24R", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1100 },
                { name = "", transition = "", type = "" },
                { name = "FABED", transition = "", type = "PG", altitude_min = 3000 },
                { name = "FABED", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["R06L"] = {
            name = "R06L",
            type = "A",
            runway = "R06L",
            waypoints = {
                { name = "SNOYL", transition = "SNOYL", type = "PG", altitude_min = 3000 },
                { name = "LOGLE", transition = "SNOYL", type = "PG", altitude_min = 2600 },
                { name = "WUVEN", transition = "WUVEN", type = "PG", altitude_min = 10000 },
                { name = "BRTNE", transition = "WUVEN", type = "PG", altitude_min = 3000 },
                { name = "LOGLE", transition = "WUVEN", type = "PG", altitude_min = 2600 },
                { name = "LOGLE", transition = "", type = "PG", altitude_min = 2600 },
                { name = "JORUN", transition = "", type = "PG", altitude_min = 2200 },
                { name = "RW06L", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1017 },
                { name = "ISLAA", transition = "", type = "PG", altitude_min = 3000 },
                { name = "ISLAA", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["R06R"] = {
            name = "R06R",
            type = "A",
            runway = "R06R",
            waypoints = {
                { name = "SNOYL", transition = "SNOYL", type = "PG", altitude_min = 3000 },
                { name = "HILRI", transition = "SNOYL", type = "PG", altitude_min = 2700 },
                { name = "WUVEN", transition = "WUVEN", type = "PG", altitude_min = 10000 },
                { name = "BRTNE", transition = "WUVEN", type = "PG", altitude_min = 3000 },
                { name = "HILRI", transition = "WUVEN", type = "PG", altitude_min = 2700 },
                { name = "HILRI", transition = "", type = "PG", altitude_min = 2700 },
                { name = "ANIKA", transition = "", type = "PG", altitude_min = 2100 },
                { name = "RW06R", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1017 },
                { name = "OSKKR", transition = "", type = "PG", altitude_min = 3000 },
                { name = "OSKKR", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["R24L"] = {
            name = "R24L",
            type = "A",
            runway = "R24L",
            waypoints = {
                { name = "EDIAZ", transition = "EDIAZ", type = "PG", altitude_min = 3000 },
                { name = "LUAAP", transition = "EDIAZ", type = "PG", altitude_min = 2700 },
                { name = "FOKAI", transition = "FOKAI", type = "PG", altitude_min = 3000 },
                { name = "LUAAP", transition = "FOKAI", type = "PG", altitude_min = 2700 },
                { name = "LUAAP", transition = "", type = "PG", altitude_min = 2700 },
                { name = "OWEND", transition = "", type = "PG", altitude_min = 2300 },
                { name = "RW24L", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "FOKAI", transition = "", type = "PG", altitude_min = 3000 },
                { name = "FOKAI", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["R24R"] = {
            name = "R24R",
            type = "A",
            runway = "R24R",
            waypoints = {
                { name = "EDIAZ", transition = "EDIAZ", type = "PG", altitude_min = 3000 },
                { name = "ROUDY", transition = "EDIAZ", type = "PG", altitude_min = 2700 },
                { name = "FOKAI", transition = "FOKAI", type = "PG", altitude_min = 3000 },
                { name = "ROUDY", transition = "FOKAI", type = "PG", altitude_min = 2700 },
                { name = "ROUDY", transition = "", type = "PG", altitude_min = 2700 },
                { name = "JWILL", transition = "", type = "PG", altitude_min = 2200 },
                { name = "RW24R", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "FOKAI", transition = "", type = "PG", altitude_min = 3000 },
                { name = "FOKAI", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["T06LX"] = {
            name = "T06LX",
            type = "A",
            runway = "T06LX",
            waypoints = {
                { name = "FABHA", transition = "FABHA", type = "PG", altitude_min = 18000 },
                { name = "FOVEM", transition = "FABHA", type = "PG", altitude_min = 3000 },
                { name = "ARKEE", transition = "FABHA", type = "PG", altitude_min = 2600 },
                { name = "HURUG", transition = "FABHA", type = "PG", altitude_min = 2600 },
                { name = "FOVEM", transition = "FOVEM", type = "PG", altitude_min = 3000 },
                { name = "ARKEE", transition = "FOVEM", type = "PG", altitude_min = 2600 },
                { name = "HURUG", transition = "FOVEM", type = "PG", altitude_min = 2600 },
                { name = "HURUG", transition = "", type = "PG", altitude_min = 2600 },
                { name = "FOMOD", transition = "", type = "PG", altitude_min = 2200 },
                { name = "ITUME", transition = "", type = "PG" },
                { name = "FOVEM", transition = "", type = "PG", altitude_min = 3000 },
                { name = "FOVEM", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["T06LY"] = {
            name = "T06LY",
            type = "A",
            runway = "T06LY",
            waypoints = {
                { name = "VEAGA", transition = "VEAGA", type = "PG", altitude_min = 2700 },
                { name = "UNZ", transition = "VEAGA", type = "PG", altitude_min = 2700 },
                { name = "UNZ", transition = "", type = "PG", altitude_min = 2700 },
                { name = "BANNI", transition = "", type = "PG", altitude_min = 2200 },
                { name = "FAYZR", transition = "", type = "PG" },
                { name = "HAAMR", transition = "", type = "PG", altitude_min = 3000 },
                { name = "HAAMR", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["T06LZ"] = {
            name = "T06LZ",
            type = "A",
            runway = "T06LZ",
            waypoints = {
                { name = "ARKEE", transition = "ARKEE", type = "PG", altitude_min = 2600 },
                { name = "HURUG", transition = "ARKEE", type = "PG", altitude_min = 2600 },
                { name = "FOVEM", transition = "FOVEM", type = "PG", altitude_min = 3000 },
                { name = "ARKEE", transition = "FOVEM", type = "PG" },
                { name = "HURUG", transition = "FOVEM", type = "PG", altitude_min = 2600 },
                { name = "HURUG", transition = "", type = "PG", altitude_min = 2600 },
                { name = "FOMOD", transition = "", type = "PG", altitude_min = 2200 },
                { name = "ITUME", transition = "", type = "PG" },
                { name = "FOVEM", transition = "", type = "PG", altitude_min = 3000 },
                { name = "FOVEM", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["T06RY"] = {
            name = "T06RY",
            type = "A",
            runway = "T06RY",
            waypoints = {
                { name = "TOCOG", transition = "TOCOG", type = "PG", altitude_min = 2700 },
                { name = "UNZ", transition = "TOCOG", type = "PG", altitude_min = 2700 },
                { name = "UNZ", transition = "", type = "PG", altitude_min = 2700 },
                { name = "JALOB", transition = "", type = "PG", altitude_min = 2200 },
                { name = "CCOOK", transition = "", type = "PG" },
                { name = "HAAMR", transition = "", type = "PG", altitude_min = 3000 },
                { name = "HAAMR", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["T06RZ"] = {
            name = "T06RZ",
            type = "A",
            runway = "T06RZ",
            waypoints = {
                { name = "FOVEM", transition = "FOVEM", type = "PG", altitude_min = 3000 },
                { name = "ARKEE", transition = "FOVEM", type = "PG" },
                { name = "ADTIN", transition = "FOVEM", type = "PG", altitude_min = 2600 },
                { name = "ADTIN", transition = "", type = "PG", altitude_min = 2600 },
                { name = "COLMA", transition = "", type = "PG", altitude_min = 2200 },
                { name = "FAXEL", transition = "", type = "PG" },
                { name = "FOVEM", transition = "", type = "PG", altitude_min = 3000 },
                { name = "FOVEM", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["T24LY"] = {
            name = "T24LY",
            type = "A",
            runway = "T24LY",
            waypoints = {
                { name = "DWAFF", transition = "DWAFF", type = "PG", altitude_min = 3000 },
                { name = "TIMAE", transition = "DWAFF", type = "PG", altitude_min = 2600 },
                { name = "TIMAE", transition = "", type = "PG", altitude_min = 2600 },
                { name = "HIPRI", transition = "", type = "PG", altitude_min = 2200 },
                { name = "WEVUS", transition = "", type = "PG" },
                { name = "CCOOK", transition = "", type = "PG" },
                { name = "DWAFF", transition = "", type = "PG", altitude_min = 3000 },
                { name = "DWAFF", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["T24LZ"] = {
            name = "T24LZ",
            type = "A",
            runway = "T24LZ",
            waypoints = {
                { name = "WELKU", transition = "WELKU", type = "PG", altitude_min = 3000, speed = 265.0 },
                { name = "WELKU", transition = "", type = "PG", altitude_min = 3000 },
                { name = "OKIBE", transition = "", type = "PG", altitude_min = 2200 },
                { name = "BAVAC", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1100 },
                { name = "WELKU", transition = "", type = "PG", altitude_min = 3000 },
                { name = "WELKU", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["T24RY"] = {
            name = "T24RY",
            type = "A",
            runway = "T24RY",
            waypoints = {
                { name = "MDBUG", transition = "MDBUG", type = "PG", altitude_min = 3000 },
                { name = "ZUKIE", transition = "MDBUG", type = "PG", altitude_min = 2600 },
                { name = "ZUKIE", transition = "", type = "PG", altitude_min = 2600 },
                { name = "CREET", transition = "", type = "PG", altitude_min = 2200 },
                { name = "ENWHY", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1100 },
                { name = "MDBUG", transition = "", type = "PG", altitude_min = 3000 },
                { name = "MDBUG", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
            }
        },
        ["T24RZ"] = {
            name = "T24RZ",
            type = "A",
            runway = "T24RZ",
            waypoints = {
                { name = "FOVEM", transition = "FOVEM", type = "PG", altitude_min = 3000, speed = 265.0 },
                { name = "FOVEM", transition = "", type = "PG", altitude_min = 3000 },
                { name = "EVEBE", transition = "", type = "PG", altitude_min = 2200 },
                { name = "JIPRO", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1100 },
                { name = "FOVEM", transition = "", type = "PG", altitude_min = 3000 },
                { name = "FOVEM", transition = "", type = "PG", altitude_max = 10000, speed = 265.0 },
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
