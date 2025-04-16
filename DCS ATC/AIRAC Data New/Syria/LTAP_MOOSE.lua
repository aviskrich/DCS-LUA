local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LTAP",
        Name = "LTAP Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["D040K"] = { lat = 38.484341667, lon = 106.543338889, type = "ZLIC" },
        ["D047N"] = { lat = 43.204444444, lon = 74.766944444, type = "UCFM" },
        ["AKEDO"] = { lat = 40.952777778, lon = 35.446944444, type = "ENRT" },
        ["MA227"] = { lat = 40.83655, lon = 35.539247222, type = "LTAP" },
        ["80DME"] = { lat = 45.788833333, lon = 23.897666667, type = "LRSB" },
        ["FF05R"] = { lat = 48.431816667, lon = 135.0601, type = "UHHH" },
        ["AP613"] = { lat = 40.668455556, lon = 35.225580556, type = "LTAP" },
        ["CF05R"] = { lat = 43.237083333, lon = 76.807722222, type = "UAAA" },
        ["FF227"] = { lat = 40.871647222, lon = 35.600672222, type = "LTAP" },
        ["FF05L"] = { lat = 30.043377778, lon = 31.27785, type = "HECA" },
        ["60DME"] = { lat = 69.324025, lon = -50.908527778, type = "BGJN" },
        ["HAVZA"] = { lat = 41.0925, lon = 35.928611111, type = "ENRT" },
        ["CF227"] = { lat = 40.891688889, lon = 35.635802778, type = "LTAP" },
        ["ERGUN"] = { lat = 40.746388889, lon = 34.738888889, type = "ENRT" },
        ["D314I"] = { lat = 40.912713889, lon = 16.768861111, type = "LIBV" },
        ["GOKTO"] = { lat = 40.745080556, lon = 35.366411111, type = "LTAP" },
        ["80DM2"] = { lat = 40.77575, lon = 35.348022222, type = "LTAP" },
        ["D040I"] = { lat = 45.074183333, lon = 9.114552778, type = "LIML" },
        ["MA05R"] = { lat = 37.759916667, lon = -0.831972222, type = "LELC" },
        ["AP612"] = { lat = 40.629580556, lon = 35.154402778, type = "LTAP" },
        ["D230I"] = { lat = 42.036705556, lon = 12.226616667, type = "LIRF" },
        ["D352I"] = { lat = 40.971563889, lon = 35.506652778, type = "LTAP" },
        ["30DME"] = { lat = 1.752830556, lon = 11.020625, type = "FGMY" },
        ["FI05R"] = { lat = 30.022861111, lon = 31.32025, type = "HECA" },
        ["D229P"] = { lat = 40.668686111, lon = 35.225358333, type = "LTAP" },
        ["D048K"] = { lat = 49.807330556, lon = 18.319022222, type = "LKMT" },
        ["30DM2"] = { lat = 51.681127778, lon = 5.775833333, type = "EHVK" },
        ["D048I"] = { lat = 55.9715, lon = -4.248930556, type = "EGPF" },
        ["D230K"] = { lat = 51.661447222, lon = 12.957780556, type = "ETSH" },
        ["AP614"] = { lat = 40.707305556, lon = 35.296875, type = "LTAP" },
        ["MA05L"] = { lat = 40.818647222, lon = 35.502627778, type = "LTAP" },
        ["D229L"] = { lat = 61.931666667, lon = 129.556666667, type = "UEEE" },
        ["60DM2"] = { lat = 48.86715, lon = 8.1631, type = "EDSB" },
    },

    -- Данные ВПП
    Runways = {
        ["RW05L"] = {
            heading = 50,
            length = 0,
            width = 0,
            threshold = { lat = 40.824397222222224, lon = 35.50531111111111 },
            end = { lat = 40.824397222222224, lon = 35.50531111111111 }
        },
        ["RW05R"] = {
            heading = 50,
            length = 0,
            width = 0,
            threshold = { lat = 40.821738888888895, lon = 35.50785833333333 },
            end = { lat = 40.821738888888895, lon = 35.50785833333333 }
        },
        ["RW23L"] = {
            heading = 230,
            length = 300.0,
            width = 0,
            threshold = { lat = 40.83860555555556, lon = 35.53908055555555 },
            end = { lat = 40.80686880860093, lon = 35.48908762503339 }
        },
        ["RW23R"] = {
            heading = 230,
            length = 360.0,
            width = 0,
            threshold = { lat = 40.841319444444444, lon = 35.536630555555554 },
            end = { lat = 40.80323534809889, lon = 35.476636582635386 }
        },
    },

    -- Процедуры SID
    SID = {
        ["AKED1C"] = {
            name = "AKED1C",
            runway = "RW05R",
            waypoints = {
                { name = "D048I", type = "P" },
                { name = "D352I", type = "P" },
                { name = "AKEDO", type = "E" },
            }
        },
        ["AKED1D"] = {
            name = "AKED1D",
            runway = "RW05R",
            waypoints = {
                { name = "D048I", type = "P" },
                { name = "D352I", type = "P" },
                { name = "AKEDO", type = "E" },
            }
        },
        ["AKED1E"] = {
            name = "AKED1E",
            runway = "RW23L",
            waypoints = {
                { name = "D230I", type = "P" },
                { name = "D314I", type = "P" },
                { name = "AKEDO", type = "E" },
            }
        },
        ["AKED1K"] = {
            name = "AKED1K",
            runway = "RW23L",
            waypoints = {
                { name = "D230I", type = "P" },
                { name = "D314I", type = "P" },
                { name = "AKEDO", type = "E" },
            }
        },
        ["AKED1M"] = {
            name = "AKED1M",
            runway = "RW05L",
            waypoints = {
                { name = "", type = "", altitude_min = 2200 },
                { name = "D040I", type = "P" },
                { name = "D352I", type = "P" },
                { name = "AKEDO", type = "E" },
            }
        },
        ["AKED1N"] = {
            name = "AKED1N",
            runway = "RW05L",
            waypoints = {
                { name = "", type = "", altitude_min = 2200 },
                { name = "D040I", type = "P" },
                { name = "D352I", type = "P" },
                { name = "AKEDO", type = "E" },
            }
        },
        ["AKED1P"] = {
            name = "AKED1P",
            runway = "RW23R",
            waypoints = {
                { name = "D230I", type = "P" },
                { name = "D314I", type = "P" },
                { name = "AKEDO", type = "E" },
            }
        },
        ["AKED1S"] = {
            name = "AKED1S",
            runway = "RW23R",
            waypoints = {
                { name = "D230I", type = "P" },
                { name = "D314I", type = "P" },
                { name = "AKEDO", type = "E" },
            }
        },
        ["ERGU1C"] = {
            name = "ERGU1C",
            runway = "RW05R",
            waypoints = {
                { name = "D048K", type = "P" },
                { name = "MNI", type = "D", altitude_min = 9000 },
                { name = "ERGUN", type = "E" },
            }
        },
        ["ERGU1D"] = {
            name = "ERGU1D",
            runway = "RW05R",
            waypoints = {
                { name = "D048K", type = "P" },
                { name = "MNI", type = "D", altitude_min = 9000 },
                { name = "ERGUN", type = "E" },
            }
        },
        ["ERGU1E"] = {
            name = "ERGU1E",
            runway = "RW23L",
            waypoints = {
                { name = "D230K", type = "P" },
                { name = "", type = "" },
                { name = "ERGUN", type = "E" },
            }
        },
        ["ERGU1K"] = {
            name = "ERGU1K",
            runway = "RW23L",
            waypoints = {
                { name = "D230K", type = "P" },
                { name = "", type = "" },
                { name = "ERGUN", type = "E" },
            }
        },
        ["ERGU1M"] = {
            name = "ERGU1M",
            runway = "RW05L",
            waypoints = {
                { name = "", type = "", altitude_min = 2200 },
                { name = "D040K", type = "P" },
                { name = "MNI", type = "D", altitude_min = 9000 },
                { name = "ERGUN", type = "E" },
            }
        },
        ["ERGU1N"] = {
            name = "ERGU1N",
            runway = "RW05L",
            waypoints = {
                { name = "", type = "", altitude_min = 2200 },
                { name = "D040K", type = "P" },
                { name = "MNI", type = "D", altitude_min = 9000 },
                { name = "ERGUN", type = "E" },
            }
        },
        ["ERGU1P"] = {
            name = "ERGU1P",
            runway = "RW23R",
            waypoints = {
                { name = "D230K", type = "P" },
                { name = "", type = "" },
                { name = "ERGUN", type = "E" },
            }
        },
        ["ERGU1S"] = {
            name = "ERGU1S",
            runway = "RW23R",
            waypoints = {
                { name = "D230K", type = "P" },
                { name = "", type = "" },
                { name = "ERGUN", type = "E" },
            }
        },
        ["HAVZ1C"] = {
            name = "HAVZ1C",
            runway = "RW05R",
            waypoints = {
                { name = "D048K", type = "P" },
                { name = "HAVZA", type = "E" },
            }
        },
        ["HAVZ1D"] = {
            name = "HAVZ1D",
            runway = "RW05R",
            waypoints = {
                { name = "D048K", type = "P" },
                { name = "HAVZA", type = "E" },
            }
        },
        ["HAVZ1E"] = {
            name = "HAVZ1E",
            runway = "RW23L",
            waypoints = {
                { name = "D230K", type = "P" },
                { name = "MNI", type = "D", altitude_min = 9000 },
                { name = "HAVZA", type = "E" },
            }
        },
        ["HAVZ1K"] = {
            name = "HAVZ1K",
            runway = "RW23L",
            waypoints = {
                { name = "D230K", type = "P" },
                { name = "MNI", type = "D", altitude_min = 9000 },
                { name = "HAVZA", type = "E" },
            }
        },
        ["HAVZ1M"] = {
            name = "HAVZ1M",
            runway = "RW05L",
            waypoints = {
                { name = "", type = "", altitude_min = 2200 },
                { name = "D040K", type = "P" },
                { name = "HAVZA", type = "E" },
            }
        },
        ["HAVZ1N"] = {
            name = "HAVZ1N",
            runway = "RW05L",
            waypoints = {
                { name = "", type = "", altitude_min = 2200 },
                { name = "D040K", type = "P" },
                { name = "HAVZA", type = "E" },
            }
        },
        ["HAVZ1P"] = {
            name = "HAVZ1P",
            runway = "RW23R",
            waypoints = {
                { name = "D230K", type = "P" },
                { name = "MNI", type = "D", altitude_min = 9000 },
                { name = "HAVZA", type = "E" },
            }
        },
        ["HAVZ1S"] = {
            name = "HAVZ1S",
            runway = "RW23R",
            waypoints = {
                { name = "D230K", type = "P" },
                { name = "MNI", type = "D", altitude_min = 9000 },
                { name = "HAVZA", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["AKED1A"] = {
            name = "AKED1A",
            runway = "ALL",
            waypoints = {
                { name = "AKEDO", type = "LT" },
                { name = "MNI", type = "LT" },
            }
        },
        ["AKED1B"] = {
            name = "AKED1B",
            runway = "ALL",
            waypoints = {
                { name = "AKEDO", type = "LT" },
                { name = "MNI", type = "LT" },
            }
        },
        ["ERGU1A"] = {
            name = "ERGU1A",
            runway = "ALL",
            waypoints = {
                { name = "ERGUN", type = "LT" },
                { name = "MNI", type = "LT" },
            }
        },
        ["ERGU1B"] = {
            name = "ERGU1B",
            runway = "ALL",
            waypoints = {
                { name = "ERGUN", type = "LT" },
                { name = "MNI", type = "LT" },
            }
        },
        ["ERGU1F"] = {
            name = "ERGU1F",
            runway = "RW05R",
            waypoints = {
                { name = "ERGUN", type = "LT", altitude_min = 10000 },
                { name = "AP612", type = "LT", altitude_min = 7500 },
                { name = "AP613", type = "LT", altitude_min = 6200 },
                { name = "AP614", type = "LT", altitude_min = 5000 },
            }
        },
        ["HAVZ1A"] = {
            name = "HAVZ1A",
            runway = "ALL",
            waypoints = {
                { name = "HAVZA", type = "LT" },
                { name = "MNI", type = "LT" },
            }
        },
        ["HAVZ1B"] = {
            name = "HAVZ1B",
            runway = "ALL",
            waypoints = {
                { name = "HAVZA", type = "LT" },
                { name = "MNI", type = "LT" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D05LY"] = {
            name = "D05LY",
            type = "A",
            runway = "D05LY",
            waypoints = {
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 5800, speed = 185.0 },
                { name = "FF05L", transition = "MNI1", type = "LT", altitude_min = 5800 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 5800, speed = 185.0 },
                { name = "FF05L", transition = "MNI2", type = "LT", altitude_min = 5800 },
                { name = "FF05L", transition = "", type = "LT", altitude_min = 5800 },
                { name = "80DM2", transition = "", type = "LT", altitude_min = 4450 },
                { name = "60DM2", transition = "", type = "LT", altitude_min = 3750 },
                { name = "30DM2", transition = "", type = "LT", altitude_min = 2750 },
                { name = "MA05L", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", altitude_min = 5600, speed = 185.0 },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", speed = 230.0 },
            }
        },
        ["D05RZ"] = {
            name = "D05RZ",
            type = "A",
            runway = "D05RZ",
            waypoints = {
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 5800, speed = 185.0 },
                { name = "FF05R", transition = "MNI1", type = "LT", altitude_min = 5800 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 5800, speed = 185.0 },
                { name = "FF05R", transition = "MNI2", type = "LT", altitude_min = 5800 },
                { name = "FF05R", transition = "", type = "LT", altitude_min = 5800 },
                { name = "80DME", transition = "", type = "LT", altitude_min = 4450 },
                { name = "60DME", transition = "", type = "LT", altitude_min = 3750 },
                { name = "30DME", transition = "", type = "LT", altitude_min = 2750 },
                { name = "MA05R", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", altitude_min = 5600, speed = 185.0 },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", speed = 230.0 },
            }
        },
        ["I05RY"] = {
            name = "I05RY",
            type = "I",
            runway = "I05RY",
            waypoints = {
                { name = "AP614", transition = "", type = "LT" },
                { name = "GOKTO", transition = "", type = "LT", speed = 180.0 },
                { name = "RW05R", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", altitude_min = 5600 },
                { name = "MNI", transition = "", type = "LT", speed = 185.0 },
                { name = "MNI", transition = "", type = "LT", altitude_min = 9000, speed = 230.0 },
            }
        },
        ["I05RZ"] = {
            name = "I05RZ",
            type = "A",
            runway = "I05RZ",
            waypoints = {
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 6200, speed = 185.0 },
                { name = "D229P", transition = "MNI1", type = "LT", altitude_min = 6200 },
                { name = "D229L", transition = "MNI1", type = "LT", altitude_min = 5000 },
                { name = "CF05R", transition = "MNI1", type = "LT", altitude_min = 4400 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 6200, speed = 185.0 },
                { name = "D229P", transition = "MNI2", type = "LT", altitude_min = 6200 },
                { name = "D229L", transition = "MNI2", type = "LT", altitude_min = 5000 },
                { name = "CF05R", transition = "MNI2", type = "LT", altitude_min = 4400 },
                { name = "CF05R", transition = "", type = "LT" },
                { name = "FI05R", transition = "", type = "LT" },
                { name = "RW05R", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", altitude_min = 5600 },
                { name = "MNI", transition = "", type = "LT", speed = 185.0 },
                { name = "MNI", transition = "", type = "LT", altitude_min = 9000, speed = 230.0 },
            }
        },
        ["NDMA"] = {
            name = "NDMA",
            type = "A",
            runway = "NDMA",
            waypoints = {
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 5900, speed = 185.0 },
                { name = "D047N", transition = "MNI1", type = "LT", altitude_min = 5900 },
                { name = "CF227", transition = "MNI1", type = "LT", altitude_min = 3700 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 5900, speed = 185.0 },
                { name = "D047N", transition = "MNI2", type = "LT", altitude_min = 5900 },
                { name = "CF227", transition = "MNI2", type = "LT", altitude_min = 3700 },
                { name = "CF227", transition = "", type = "LT", altitude_min = 3700 },
                { name = "FF227", transition = "", type = "LT", altitude_min = 3700 },
                { name = "MA227", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", altitude_min = 5700, speed = 185.0 },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", speed = 230.0 },
            }
        },
        ["Q05LY"] = {
            name = "Q05LY",
            type = "A",
            runway = "Q05LY",
            waypoints = {
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 5800, speed = 185.0 },
                { name = "FF05L", transition = "MNI1", type = "LT", altitude_min = 5800 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 5800, speed = 185.0 },
                { name = "FF05L", transition = "MNI2", type = "LT", altitude_min = 5800 },
                { name = "FF05L", transition = "", type = "LT", altitude_min = 5800 },
                { name = "80DM2", transition = "", type = "LT", altitude_min = 4450 },
                { name = "60DM2", transition = "", type = "LT", altitude_min = 3750 },
                { name = "30DM2", transition = "", type = "LT", altitude_min = 2750 },
                { name = "MA05L", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", altitude_min = 5600, speed = 185.0 },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", speed = 230.0 },
            }
        },
        ["Q05RZ"] = {
            name = "Q05RZ",
            type = "A",
            runway = "Q05RZ",
            waypoints = {
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 5800, speed = 185.0 },
                { name = "FF05R", transition = "MNI1", type = "LT", altitude_min = 5800 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 5800, speed = 185.0 },
                { name = "FF05R", transition = "MNI2", type = "LT", altitude_min = 5800 },
                { name = "FF05R", transition = "", type = "LT", altitude_min = 5800 },
                { name = "80DME", transition = "", type = "LT", altitude_min = 4450 },
                { name = "60DME", transition = "", type = "LT", altitude_min = 3750 },
                { name = "30DME", transition = "", type = "LT", altitude_min = 2750 },
                { name = "MA05R", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", altitude_min = 5600, speed = 185.0 },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", speed = 230.0 },
            }
        },
        ["VORA"] = {
            name = "VORA",
            type = "A",
            runway = "VORA",
            waypoints = {
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI1", type = "LT", altitude_min = 5900, speed = 185.0 },
                { name = "D047N", transition = "MNI1", type = "LT", altitude_min = 5900 },
                { name = "CF227", transition = "MNI1", type = "LT", altitude_min = 3700 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 9000 },
                { name = "MNI", transition = "MNI2", type = "LT", altitude_min = 5900, speed = 185.0 },
                { name = "D047N", transition = "MNI2", type = "LT", altitude_min = 5900 },
                { name = "CF227", transition = "MNI2", type = "LT", altitude_min = 3700 },
                { name = "CF227", transition = "", type = "LT", altitude_min = 3700 },
                { name = "FF227", transition = "", type = "LT", altitude_min = 3700 },
                { name = "MA227", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", altitude_min = 5700, speed = 185.0 },
                { name = "MNI", transition = "", type = "LT" },
                { name = "MNI", transition = "", type = "LT", speed = 230.0 },
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
