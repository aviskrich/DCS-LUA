local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "ULMM",
        Name = "ULMM Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Kola"
    },

    -- Путевые точки
    Waypoints = {
        ["PELOR"] = { lat = 68.616666667, lon = 31.78, type = "ENRT" },
        ["FN31"] = { lat = 54.522055556, lon = 18.6124, type = "EPOK" },
        ["MM413"] = { lat = 68.798222222, lon = 32.389944444, type = "ULMM" },
        ["CF31"] = { lat = 54.158733333, lon = -130.329380556, type = "CYPR" },
        ["MM127"] = { lat = 68.678166667, lon = 32.942805556, type = "ULMM" },
        ["DER13"] = { lat = 53.513072222, lon = 142.891380556, type = "UHSH" },
        ["EKLED"] = { lat = 68.835833333, lon = 32.954444444, type = "ENRT" },
        ["P"] = { lat = 40.9961, lon = 13.589302778, type = "LIRM" },
        ["D155G"] = { lat = 68.635333333, lon = 32.869241667, type = "ULMM" },
        ["MM310"] = { lat = 68.699694444, lon = 32.902388889, type = "ULMM" },
        ["MM129"] = { lat = 68.716611111, lon = 32.8715, type = "ULMM" },
        ["ASGOR"] = { lat = 68.516666667, lon = 32.766666667, type = "ENRT" },
        ["30THR"] = { lat = 9.376638889, lon = -5.615933333, type = "DIKO" },
        ["20THR"] = { lat = 4.936302778, lon = 8.327166667, type = "DNCA" },
        ["CF13Z"] = { lat = 68.928191667, lon = 32.477527778, type = "ULMM" },
        ["MM313"] = { lat = 68.869944444, lon = 32.2555, type = "ULMM" },
        ["CF13Y"] = { lat = 68.925355556, lon = 32.48225, type = "ULMM" },
        ["FN13"] = { lat = -12.294863889, lon = 49.205702778, type = "FMNA" },
        ["D142G"] = { lat = 68.641902778, lon = 32.934544444, type = "ULMM" },
        ["FF13"] = { lat = 33.586588889, lon = 6.6771, type = "DAUO" },
        ["LOPRA"] = { lat = 68.633333333, lon = 33.196666667, type = "ENRT" },
        ["CF13"] = { lat = 33.618641667, lon = 6.631097222, type = "DAUO" },
        ["MM401"] = { lat = 68.835833333, lon = 32.651111111, type = "ULMM" },
        ["FF31W"] = { lat = 68.665041667, lon = 32.967277778, type = "ULMM" },
        ["R"] = { lat = 48.117097222, lon = -123.484841667, type = "DME", frequency = 108.9, elevation = 291.0, name = "WILLIAM", range = 25.0 },
        ["MM631"] = { lat = 68.672, lon = 32.722055556, type = "ULMM" },
        ["D285F"] = { lat = 68.871266667, lon = 32.453497222, type = "ULMM" },
        ["MM231"] = { lat = 68.629833333, lon = 33.030527778, type = "ULMM" },
        ["DER31"] = { lat = 53.520194444, lon = 142.870355556, type = "UHSH" },
        ["MM406"] = { lat = 68.723333333, lon = 32.859166667, type = "ULMM" },
        ["FF31"] = { lat = 64.179413889, lon = -76.324816667, type = "CYTE" },
        ["MM130"] = { lat = 68.864888889, lon = 32.596833333, type = "ULMM" },
        ["MM213"] = { lat = 68.925111111, lon = 32.484083333, type = "ULMM" },
        ["FF31X"] = { lat = 68.673702778, lon = 32.951327778, type = "ULMM" },
        ["MM402"] = { lat = 68.743055556, lon = 32.822416667, type = "ULMM" },
        ["D296F"] = { lat = -12.317925, lon = 49.195005556, type = "FMNA" },
        ["MM713"] = { lat = 68.818055556, lon = 32.684027778, type = "ULMM" },
        ["MM613"] = { lat = 68.729361111, lon = 32.518027778, type = "ULMM" },
        ["MM431"] = { lat = 68.597722222, lon = 32.617972222, type = "ULMM" },
        ["MM404"] = { lat = 68.823611111, lon = 32.673611111, type = "ULMM" },
        ["FF13X"] = { lat = 68.882125, lon = 32.563755556, type = "ULMM" },
        ["MM128"] = { lat = 68.622777778, lon = 32.714416667, type = "ULMM" },
        ["ULMER"] = { lat = 68.966666667, lon = 32.516666667, type = "ENRT" },
        ["MM311"] = { lat = 68.698861111, lon = 32.903916667, type = "ULMM" },
        ["MM013"] = { lat = 59.795972222, lon = 151.218055556, type = "UHMM" },
        ["CF31Y"] = { lat = 68.630883333, lon = 33.030025, type = "ULMM" },
        ["CF31Z"] = { lat = 68.624563889, lon = 33.041319444, type = "ULMM" },
    },

    -- Данные ВПП
    Runways = {
        ["RW13"] = {
            heading = 130,
            length = 0,
            width = 0,
            threshold = { lat = 68.79110833333333, lon = 32.734011111111116 },
            end = { lat = 68.79110833333333, lon = 32.734011111111116 }
        },
        ["RW31"] = {
            heading = 310,
            length = 0,
            width = 0,
            threshold = { lat = 68.7724861111111, lon = 32.76845 },
            end = { lat = 68.7724861111111, lon = 32.76845 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ASGO1E"] = {
            name = "ASGO1E",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "ASGOR", type = "E", altitude_min = 7000 },
            }
        },
        ["ASGO1G"] = {
            name = "ASGO1G",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 700 },
                { name = "", type = "", speed = 230.0 },
                { name = "ASGOR", type = "E", altitude_min = 7000 },
            }
        },
        ["ASGO1K"] = {
            name = "ASGO1K",
            runway = "RW13",
            waypoints = {
                { name = "MM406", type = "P", speed = 220.0 },
                { name = "MM404", type = "P", speed = 240.0 },
                { name = "ASGOR", type = "E", altitude_min = 7000 },
            }
        },
        ["ASGO1N"] = {
            name = "ASGO1N",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "ASGOR", type = "E", altitude_min = 7000 },
            }
        },
        ["ASGO1P"] = {
            name = "ASGO1P",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 700 },
                { name = "ASGOR", type = "E", altitude_min = 7000 },
            }
        },
        ["EKLE1E"] = {
            name = "EKLE1E",
            runway = "RW13",
            waypoints = {
                { name = "DER13", type = "P" },
                { name = "", type = "", altitude_min = 900 },
                { name = "PF", type = "P", speed = 215.0 },
                { name = "EKLED", type = "E", altitude_min = 9000 },
            }
        },
        ["EKLE1G"] = {
            name = "EKLE1G",
            runway = "RW31",
            waypoints = {
                { name = "DER31", type = "P" },
                { name = "", type = "", altitude_min = 700 },
                { name = "RD", type = "P", speed = 215.0 },
                { name = "EKLED", type = "E", altitude_min = 9000 },
            }
        },
        ["EKLE1N"] = {
            name = "EKLE1N",
            runway = "RW13",
            waypoints = {
                { name = "MM406", type = "P", speed = 220.0 },
                { name = "MM404", type = "P" },
                { name = "EKLED", type = "E", altitude_min = 9000 },
            }
        },
        ["EKLE1P"] = {
            name = "EKLE1P",
            runway = "RW31",
            waypoints = {
                { name = "MM401", type = "P", speed = 240.0 },
                { name = "MM402", type = "P" },
                { name = "EKLED", type = "E", altitude_min = 9000 },
            }
        },
        ["LOPR1E"] = {
            name = "LOPR1E",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "LOPRA", type = "E", altitude_min = 7000 },
            }
        },
        ["LOPR1G"] = {
            name = "LOPR1G",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 700 },
                { name = "", type = "", speed = 230.0 },
                { name = "LOPRA", type = "E", altitude_min = 7000 },
            }
        },
        ["LOPR1K"] = {
            name = "LOPR1K",
            runway = "RW13",
            waypoints = {
                { name = "MM406", type = "P", speed = 220.0 },
                { name = "MM404", type = "P", speed = 240.0 },
                { name = "LOPRA", type = "E", altitude_min = 7000 },
            }
        },
        ["LOPR1N"] = {
            name = "LOPR1N",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "LOPRA", type = "E", altitude_min = 7000 },
            }
        },
        ["LOPR1P"] = {
            name = "LOPR1P",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 700 },
                { name = "LOPRA", type = "E", altitude_min = 7000 },
            }
        },
        ["LOPR1S"] = {
            name = "LOPR1S",
            runway = "RW13",
            waypoints = {
                { name = "DER13", type = "P" },
                { name = "", type = "", altitude_min = 1000 },
                { name = "PF", type = "P", speed = 210.0 },
                { name = "", type = "" },
                { name = "LOPRA", type = "E", altitude_min = 7000 },
            }
        },
        ["PELO1E"] = {
            name = "PELO1E",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "PELOR", type = "E", altitude_min = 8000 },
            }
        },
        ["PELO1G"] = {
            name = "PELO1G",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 700 },
                { name = "", type = "" },
                { name = "PELOR", type = "E", altitude_min = 8000 },
            }
        },
        ["PELO1N"] = {
            name = "PELO1N",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "PELOR", type = "E", altitude_min = 8000 },
            }
        },
        ["PELO1P"] = {
            name = "PELO1P",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 700 },
                { name = "PELOR", type = "E", altitude_min = 8000 },
            }
        },
        ["ULME1E"] = {
            name = "ULME1E",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "ULMER", type = "E", altitude_min = 8000 },
            }
        },
        ["ULME1J"] = {
            name = "ULME1J",
            runway = "RW31",
            waypoints = {
                { name = "DER31", type = "P" },
                { name = "", type = "", altitude_min = 900 },
                { name = "RD", type = "P", speed = 210.0 },
                { name = "", type = "" },
                { name = "ULMER", type = "E", altitude_min = 8000 },
            }
        },
        ["ULME1N"] = {
            name = "ULME1N",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "ULMER", type = "E", altitude_min = 8000 },
            }
        },
        ["ULME1P"] = {
            name = "ULME1P",
            runway = "RW31",
            waypoints = {
                { name = "MM401", type = "P", speed = 240.0 },
                { name = "MM402", type = "P", speed = 240.0 },
                { name = "ULMER", type = "E", altitude_min = 8000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ASGO1A"] = {
            name = "ASGO1A",
            runway = "RW13",
            waypoints = {
                { name = "ASGOR", type = "UL", altitude_min = 6000 },
                { name = "P", type = "UL", altitude_min = 4000 },
            }
        },
        ["ASGO1B"] = {
            name = "ASGO1B",
            runway = "RW13",
            waypoints = {
                { name = "ASGOR", type = "UL", altitude_min = 6000 },
                { name = "PF", type = "UL", altitude_min = 4000 },
            }
        },
        ["ASGO1C"] = {
            name = "ASGO1C",
            runway = "RW31",
            waypoints = {
                { name = "ASGOR", type = "UL", altitude_min = 6000 },
                { name = "R", type = "UL", altitude_min = 4000 },
            }
        },
        ["ASGO1H"] = {
            name = "ASGO1H",
            runway = "RW31",
            waypoints = {
                { name = "ASGOR", type = "UL", altitude_min = 6000 },
                { name = "RD", type = "UL", altitude_min = 4000 },
            }
        },
        ["ASGO1L"] = {
            name = "ASGO1L",
            runway = "RW13",
            waypoints = {
                { name = "ASGOR", type = "UL", altitude_min = 6000 },
                { name = "MM613", type = "UL", altitude_min = 2800 },
                { name = "MM313", type = "UL", altitude_min = 2400, speed = 230.0 },
            }
        },
        ["EKLE1A"] = {
            name = "EKLE1A",
            runway = "RW13",
            waypoints = {
                { name = "EKLED", type = "UL", altitude_min = 8000 },
                { name = "P", type = "UL", altitude_min = 4000 },
            }
        },
        ["EKLE1B"] = {
            name = "EKLE1B",
            runway = "RW13",
            waypoints = {
                { name = "EKLED", type = "UL", altitude_min = 8000 },
                { name = "PF", type = "UL", altitude_min = 4000 },
            }
        },
        ["EKLE1C"] = {
            name = "EKLE1C",
            runway = "RW31",
            waypoints = {
                { name = "EKLED", type = "UL", altitude_min = 8000 },
                { name = "R", type = "UL", altitude_min = 4000 },
            }
        },
        ["EKLE1H"] = {
            name = "EKLE1H",
            runway = "RW31",
            waypoints = {
                { name = "EKLED", type = "UL", altitude_min = 8000 },
                { name = "RD", type = "UL", altitude_min = 4000 },
            }
        },
        ["EKLE1L"] = {
            name = "EKLE1L",
            runway = "RW13",
            waypoints = {
                { name = "EKLED", type = "UL", altitude_min = 8000 },
                { name = "MM413", type = "UL" },
                { name = "MM313", type = "UL", altitude_min = 2400, speed = 230.0 },
            }
        },
        ["EKLE1M"] = {
            name = "EKLE1M",
            runway = "RW31",
            waypoints = {
                { name = "EKLED", type = "UL", altitude_min = 8000 },
                { name = "MM431", type = "UL" },
                { name = "ASGOR", type = "UL", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["LOPR1A"] = {
            name = "LOPR1A",
            runway = "RW13",
            waypoints = {
                { name = "LOPRA", type = "UL", altitude_min = 6000 },
                { name = "P", type = "UL", altitude_min = 4000 },
            }
        },
        ["LOPR1B"] = {
            name = "LOPR1B",
            runway = "RW13",
            waypoints = {
                { name = "LOPRA", type = "UL", altitude_min = 6000 },
                { name = "PF", type = "UL", altitude_min = 4000 },
            }
        },
        ["LOPR1C"] = {
            name = "LOPR1C",
            runway = "RW31",
            waypoints = {
                { name = "LOPRA", type = "UL", altitude_min = 6000 },
                { name = "R", type = "UL", altitude_min = 4000 },
            }
        },
        ["LOPR1H"] = {
            name = "LOPR1H",
            runway = "RW31",
            waypoints = {
                { name = "LOPRA", type = "UL", altitude_min = 6000 },
                { name = "RD", type = "UL", altitude_min = 4000 },
            }
        },
        ["LOPR1L"] = {
            name = "LOPR1L",
            runway = "RW13",
            waypoints = {
                { name = "LOPRA", type = "UL", altitude_min = 6000 },
                { name = "MM613", type = "UL", altitude_min = 2800 },
                { name = "MM313", type = "UL", altitude_min = 2400, speed = 230.0 },
            }
        },
        ["LOPR1M"] = {
            name = "LOPR1M",
            runway = "RW31",
            waypoints = {
                { name = "LOPRA", type = "UL", altitude_min = 6000 },
                { name = "MM631", type = "UL" },
                { name = "MM431", type = "UL" },
                { name = "ASGOR", type = "UL", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["PELO1A"] = {
            name = "PELO1A",
            runway = "RW13",
            waypoints = {
                { name = "PELOR", type = "UL", altitude_min = 9000 },
                { name = "P", type = "UL", altitude_min = 4000 },
            }
        },
        ["PELO1B"] = {
            name = "PELO1B",
            runway = "RW13",
            waypoints = {
                { name = "PELOR", type = "UL", altitude_min = 9000 },
                { name = "PF", type = "UL", altitude_min = 4000 },
            }
        },
        ["PELO1C"] = {
            name = "PELO1C",
            runway = "RW31",
            waypoints = {
                { name = "PELOR", type = "UL", altitude_min = 9000 },
                { name = "R", type = "UL", altitude_min = 4000 },
            }
        },
        ["PELO1H"] = {
            name = "PELO1H",
            runway = "RW31",
            waypoints = {
                { name = "PELOR", type = "UL", altitude_min = 9000 },
                { name = "RD", type = "UL", altitude_min = 4000 },
            }
        },
        ["PELO1L"] = {
            name = "PELO1L",
            runway = "RW13",
            waypoints = {
                { name = "PELOR", type = "UL", altitude_min = 9000 },
                { name = "MM313", type = "UL", altitude_min = 2400, speed = 230.0 },
            }
        },
        ["PELO1M"] = {
            name = "PELO1M",
            runway = "RW31",
            waypoints = {
                { name = "PELOR", type = "UL", altitude_min = 9000 },
                { name = "ASGOR", type = "UL", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["ULME1A"] = {
            name = "ULME1A",
            runway = "RW13",
            waypoints = {
                { name = "ULMER", type = "UL", altitude_min = 9000 },
                { name = "P", type = "UL", altitude_min = 4000 },
            }
        },
        ["ULME1B"] = {
            name = "ULME1B",
            runway = "RW13",
            waypoints = {
                { name = "ULMER", type = "UL", altitude_min = 9000 },
                { name = "PF", type = "UL", altitude_min = 4000 },
            }
        },
        ["ULME1C"] = {
            name = "ULME1C",
            runway = "RW31",
            waypoints = {
                { name = "ULMER", type = "UL", altitude_min = 9000 },
                { name = "R", type = "UL", altitude_min = 4000 },
            }
        },
        ["ULME1H"] = {
            name = "ULME1H",
            runway = "RW31",
            waypoints = {
                { name = "ULMER", type = "UL", altitude_min = 9000 },
                { name = "RD", type = "UL", altitude_min = 4000 },
            }
        },
        ["ULME1L"] = {
            name = "ULME1L",
            runway = "RW13",
            waypoints = {
                { name = "ULMER", type = "UL", altitude_min = 9000 },
                { name = "MM713", type = "UL", altitude_min = 6000, speed = 245.0 },
                { name = "MM413", type = "UL" },
                { name = "MM313", type = "UL", altitude_min = 2400, speed = 230.0 },
            }
        },
        ["ULME1M"] = {
            name = "ULME1M",
            runway = "RW31",
            waypoints = {
                { name = "ULMER", type = "UL", altitude_min = 9000 },
                { name = "MM431", type = "UL" },
                { name = "ASGOR", type = "UL", altitude_min = 3000, speed = 230.0 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I13-X"] = {
            name = "I13-X",
            type = "A",
            runway = "I13-X",
            waypoints = {
                { name = "PF", transition = "PF1", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "D285F", transition = "PF1", type = "UL" },
                { name = "CF13", transition = "PF1", type = "UL" },
                { name = "PF", transition = "PF2", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "D296F", transition = "PF2", type = "UL" },
                { name = "CF13", transition = "PF2", type = "UL" },
                { name = "CF13", transition = "", type = "UL" },
                { name = "FF13", transition = "", type = "UL" },
                { name = "RW13", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "PF", transition = "", type = "UL", speed = 215.0 },
            }
        },
        ["I13-Y"] = {
            name = "I13-Y",
            type = "A",
            runway = "I13-Y",
            waypoints = {
                { name = "MM313", transition = "MM313", type = "UL", altitude_min = 2400, speed = 230.0 },
                { name = "MM213", transition = "MM313", type = "UL", altitude_min = 2400 },
                { name = "MM213", transition = "", type = "UL" },
                { name = "FF13", transition = "", type = "UL" },
                { name = "RW13", transition = "", type = "UL" },
                { name = "MM127", transition = "", type = "UL", speed = 210.0 },
                { name = "MM128", transition = "", type = "UL" },
                { name = "MM413", transition = "", type = "UL" },
                { name = "MM313", transition = "", type = "UL", altitude_min = 2400 },
            }
        },
        ["I31-W"] = {
            name = "I31-W",
            type = "A",
            runway = "I31-W",
            waypoints = {
                { name = "RD", transition = "RD", type = "UL", altitude_min = 4000 },
                { name = "D142G", transition = "RD", type = "UL" },
                { name = "CF31", transition = "RD", type = "UL" },
                { name = "CF31", transition = "", type = "UL" },
                { name = "FF31", transition = "", type = "UL" },
                { name = "RW31", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1400 },
                { name = "RD", transition = "", type = "UL" },
            }
        },
        ["I31-X"] = {
            name = "I31-X",
            type = "A",
            runway = "I31-X",
            waypoints = {
                { name = "RD", transition = "RD", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "D155G", transition = "RD", type = "UL" },
                { name = "CF31", transition = "RD", type = "UL" },
                { name = "CF31", transition = "", type = "UL" },
                { name = "FF31", transition = "", type = "UL" },
                { name = "RW31", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1400 },
                { name = "RD", transition = "", type = "UL", speed = 215.0 },
            }
        },
        ["I31-Y"] = {
            name = "I31-Y",
            type = "A",
            runway = "I31-Y",
            waypoints = {
                { name = "ASGOR", transition = "ASGOR", type = "UL", altitude_min = 3000, speed = 230.0 },
                { name = "MM231", transition = "ASGOR", type = "UL", altitude_min = 2800 },
                { name = "MM231", transition = "", type = "UL" },
                { name = "FF31", transition = "", type = "UL" },
                { name = "RW31", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1400 },
                { name = "MM431", transition = "", type = "UL" },
                { name = "ASGOR", transition = "", type = "UL" },
            }
        },
        ["I31-Z"] = {
            name = "I31-Z",
            type = "A",
            runway = "I31-Z",
            waypoints = {
                { name = "ASGOR", transition = "ASGOR", type = "UL", altitude_min = 6000, speed = 230.0 },
                { name = "MM231", transition = "ASGOR", type = "UL", altitude_min = 2800 },
                { name = "MM231", transition = "", type = "UL" },
                { name = "FF31", transition = "", type = "UL" },
                { name = "RW31", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1400 },
                { name = "MM431", transition = "", type = "UL" },
                { name = "ASGOR", transition = "", type = "UL" },
            }
        },
        ["J13"] = {
            name = "J13",
            type = "A",
            runway = "J13",
            waypoints = {
                { name = "MM313", transition = "MM313", type = "UL", altitude_min = 2400, speed = 230.0 },
                { name = "MM213", transition = "MM313", type = "UL", altitude_min = 2400 },
                { name = "MM213", transition = "", type = "UL" },
                { name = "MM130", transition = "", type = "UL" },
                { name = "RW13", transition = "", type = "UL" },
                { name = "MM127", transition = "", type = "UL", speed = 210.0 },
                { name = "MM128", transition = "", type = "UL" },
                { name = "MM413", transition = "", type = "UL" },
                { name = "MM313", transition = "", type = "UL", altitude_min = 2400 },
            }
        },
        ["J31-Y"] = {
            name = "J31-Y",
            type = "A",
            runway = "J31-Y",
            waypoints = {
                { name = "ASGOR", transition = "ASGOR", type = "UL", altitude_min = 3000, speed = 230.0 },
                { name = "MM231", transition = "ASGOR", type = "UL", altitude_min = 2800 },
                { name = "MM231", transition = "", type = "UL" },
                { name = "MM310", transition = "", type = "UL" },
                { name = "RW31", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1400 },
                { name = "MM431", transition = "", type = "UL" },
                { name = "ASGOR", transition = "", type = "UL" },
            }
        },
        ["J31-Z"] = {
            name = "J31-Z",
            type = "A",
            runway = "J31-Z",
            waypoints = {
                { name = "ASGOR", transition = "ASGOR", type = "UL", altitude_min = 6000, speed = 230.0 },
                { name = "MM231", transition = "ASGOR", type = "UL", altitude_min = 2800 },
                { name = "MM231", transition = "", type = "UL" },
                { name = "MM310", transition = "", type = "UL" },
                { name = "RW31", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1400 },
                { name = "MM431", transition = "", type = "UL" },
                { name = "ASGOR", transition = "", type = "UL" },
            }
        },
        ["N13-X"] = {
            name = "N13-X",
            type = "A",
            runway = "N13-X",
            waypoints = {
                { name = "P", transition = "P1", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "P", transition = "P1", type = "UL" },
                { name = "FF13X", transition = "P1", type = "UL" },
                { name = "P", transition = "P2", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "P", transition = "P2", type = "UL" },
                { name = "FF13X", transition = "P2", type = "UL" },
                { name = "FF13X", transition = "", type = "UL" },
                { name = "P", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1700 },
                { name = "P", transition = "", type = "UL", speed = 215.0 },
            }
        },
        ["N13-Y"] = {
            name = "N13-Y",
            type = "A",
            runway = "N13-Y",
            waypoints = {
                { name = "P", transition = "P1", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "P", transition = "P1", type = "UL" },
                { name = "CF13Y", transition = "P1", type = "UL" },
                { name = "P", transition = "P2", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "P", transition = "P2", type = "UL" },
                { name = "CF13Y", transition = "P2", type = "UL" },
                { name = "CF13Y", transition = "", type = "UL" },
                { name = "FN13", transition = "", type = "UL" },
                { name = "P", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "P", transition = "", type = "UL", speed = 215.0 },
            }
        },
        ["N13-Z"] = {
            name = "N13-Z",
            type = "A",
            runway = "N13-Z",
            waypoints = {
                { name = "PF", transition = "PF1", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "PF", transition = "PF1", type = "UL" },
                { name = "CF13Z", transition = "PF1", type = "UL" },
                { name = "PF", transition = "PF2", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "PF", transition = "PF2", type = "UL" },
                { name = "CF13Z", transition = "PF2", type = "UL" },
                { name = "CF13Z", transition = "", type = "UL" },
                { name = "FN13", transition = "", type = "UL" },
                { name = "PF", transition = "", type = "UL" },
                { name = "RW13", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "PF", transition = "", type = "UL", speed = 215.0 },
            }
        },
        ["N31-W"] = {
            name = "N31-W",
            type = "A",
            runway = "N31-W",
            waypoints = {
                { name = "R", transition = "R", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "R", transition = "R", type = "UL" },
                { name = "FF31W", transition = "R", type = "UL" },
                { name = "FF31W", transition = "", type = "UL" },
                { name = "R", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 2000 },
                { name = "R", transition = "", type = "UL", speed = 215.0 },
            }
        },
        ["N31-X"] = {
            name = "N31-X",
            type = "A",
            runway = "N31-X",
            waypoints = {
                { name = "R", transition = "R", type = "UL", altitude_min = 4000 },
                { name = "R", transition = "R", type = "UL" },
                { name = "FF31X", transition = "R", type = "UL" },
                { name = "FF31X", transition = "", type = "UL" },
                { name = "R", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 2000 },
                { name = "R", transition = "", type = "UL" },
            }
        },
        ["N31-Y"] = {
            name = "N31-Y",
            type = "A",
            runway = "N31-Y",
            waypoints = {
                { name = "R", transition = "R1", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "R", transition = "R1", type = "UL" },
                { name = "CF31Y", transition = "R1", type = "UL" },
                { name = "R", transition = "R2", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "R", transition = "R2", type = "UL" },
                { name = "CF31Y", transition = "R2", type = "UL" },
                { name = "CF31Y", transition = "", type = "UL" },
                { name = "FN31", transition = "", type = "UL" },
                { name = "R", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1700 },
                { name = "R", transition = "", type = "UL", speed = 215.0 },
            }
        },
        ["N31-Z"] = {
            name = "N31-Z",
            type = "A",
            runway = "N31-Z",
            waypoints = {
                { name = "RD", transition = "RD1", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "RD", transition = "RD1", type = "UL" },
                { name = "CF31Z", transition = "RD1", type = "UL" },
                { name = "RD", transition = "RD2", type = "UL", altitude_min = 4000, speed = 215.0 },
                { name = "RD", transition = "RD2", type = "UL" },
                { name = "CF31Z", transition = "RD2", type = "UL" },
                { name = "CF31Z", transition = "", type = "UL" },
                { name = "FN31", transition = "", type = "UL" },
                { name = "RD", transition = "", type = "UL" },
                { name = "RW31", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1400 },
                { name = "RD", transition = "", type = "UL", speed = 215.0 },
            }
        },
        ["R13"] = {
            name = "R13",
            type = "A",
            runway = "R13",
            waypoints = {
                { name = "MM313", transition = "MM313", type = "UL", altitude_min = 2400, speed = 230.0 },
                { name = "MM213", transition = "MM313", type = "UL", altitude_min = 2400 },
                { name = "MM213", transition = "", type = "UL", altitude_min = 2400 },
                { name = "MM013", transition = "", type = "UL" },
                { name = "30THR", transition = "", type = "UL" },
                { name = "RW13", transition = "", type = "UL" },
                { name = "MM129", transition = "", type = "UL" },
                { name = "MM413", transition = "", type = "UL", speed = 210.0 },
                { name = "MM313", transition = "", type = "UL", altitude_min = 2400 },
            }
        },
        ["R31-Y"] = {
            name = "R31-Y",
            type = "A",
            runway = "R31-Y",
            waypoints = {
                { name = "ASGOR", transition = "ASGOR", type = "UL", altitude_min = 3000, speed = 230.0 },
                { name = "MM231", transition = "ASGOR", type = "UL", altitude_min = 2800 },
                { name = "MM231", transition = "", type = "UL", altitude_min = 2800 },
                { name = "MM311", transition = "", type = "UL" },
                { name = "20THR", transition = "", type = "UL" },
                { name = "RW31", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1400 },
                { name = "MM431", transition = "", type = "UL" },
                { name = "ASGOR", transition = "", type = "UL" },
            }
        },
        ["R31-Z"] = {
            name = "R31-Z",
            type = "A",
            runway = "R31-Z",
            waypoints = {
                { name = "ASGOR", transition = "ASGOR", type = "UL", altitude_min = 6000, speed = 230.0 },
                { name = "MM231", transition = "ASGOR", type = "UL", altitude_min = 2800 },
                { name = "MM231", transition = "", type = "UL", altitude_min = 2800 },
                { name = "MM311", transition = "", type = "UL" },
                { name = "20THR", transition = "", type = "UL" },
                { name = "RW31", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 1400 },
                { name = "MM431", transition = "", type = "UL" },
                { name = "ASGOR", transition = "", type = "UL" },
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
