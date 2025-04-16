local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "ULPB",
        Name = "ULPB Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Kola"
    },

    -- Путевые точки
    Waypoints = {
        ["PB002"] = { lat = 61.721913889, lon = 34.007997222, type = "ULPB" },
        ["28VOR"] = { lat = -4.427969444, lon = 15.379361111, type = "FZAA" },
        ["PB005"] = { lat = 61.682708333, lon = 34.201088889, type = "ULPB" },
        ["CI19"] = { lat = -33.745725, lon = 18.532288889, type = "FACT" },
        ["SOPID"] = { lat = 62.398611111, lon = 35.085, type = "ENRT" },
        ["X"] = { lat = 38.940172222, lon = 121.856380556, type = "ZYTL" },
        ["PB302"] = { lat = 61.883177778, lon = 33.394230556, type = "ULPB" },
        ["PB023"] = { lat = 62.139833333, lon = 34.387247222, type = "ULPB" },
        ["PB024"] = { lat = 62.008891667, lon = 34.497952778, type = "ULPB" },
        ["CN01"] = { lat = 43.805833333, lon = 145.665, type = "UHSM" },
        ["PB303"] = { lat = 62.181430556, lon = 33.722066667, type = "ULPB" },
        ["PB306"] = { lat = 61.995088889, lon = 34.0248, type = "ULPB" },
        ["RW19"] = { lat = 56.701191667, lon = 12.822197222, type = "ESMT" },
        ["FQ01"] = { lat = 61.798052778, lon = 34.076683333, type = "ULPB" },
        ["PB304"] = { lat = 62.162311111, lon = 34.652419444, type = "ULPB" },
        ["PB301"] = { lat = 61.667891667, lon = 33.551677778, type = "ULPB" },
        ["PB003"] = { lat = 61.760866667, lon = 33.814280556, type = "ULPB" },
        ["FQ19"] = { lat = 61.972375, lon = 34.233869444, type = "ULPB" },
        ["21THR"] = { lat = 9.332755556, lon = 13.319227778, type = "FKKR" },
        ["PB307"] = { lat = 61.853430556, lon = 33.897613889, type = "ULPB" },
        ["PB025"] = { lat = 62.004941667, lon = 34.033252778, type = "ULPB" },
        ["PB022"] = { lat = 62.087513889, lon = 34.108055556, type = "ULPB" },
        ["11THR"] = { lat = 60.737980556, lon = 114.8727, type = "UERL" },
        ["28DME"] = { lat = 61.845475, lon = 34.11925, type = "ULPB" },
        ["FD01"] = { lat = 32.978241667, lon = 6.056547222, type = "DAUK" },
        ["FI19"] = { lat = 36.966138889, lon = 10.258372222, type = "DTTA" },
        ["PB021"] = { lat = 62.048344444, lon = 34.303258333, type = "ULPB" },
        ["BOBMU"] = { lat = 61.475277778, lon = 33.030555556, type = "ENRT" },
        ["PB001"] = { lat = 61.798388889, lon = 34.076566667, type = "ULPB" },
        ["PB006"] = { lat = 61.846383333, lon = 33.887855556, type = "ULPB" },
        ["23DME"] = { lat = 61.923461111, lon = 34.189566667, type = "ULPB" },
        ["PB305"] = { lat = 61.559197222, lon = 34.466377778, type = "ULPB" },
        ["GITOS"] = { lat = 61.876666667, lon = 32.729166667, type = "ENRT" },
        ["PB020"] = { lat = 61.971930556, lon = 34.233533333, type = "ULPB" },
        ["PEMEM"] = { lat = 61.270555556, lon = 34.729166667, type = "ENRT" },
        ["RW01"] = { lat = 56.681002778, lon = 12.818208333, type = "ESMT" },
        ["FD19"] = { lat = 36.950513889, lon = 10.248472222, type = "DTTA" },
        ["OSNEN"] = { lat = 62.437222222, lon = 33.331388889, type = "ENRT" },
        ["PB004"] = { lat = 61.630194444, lon = 33.926247222, type = "ULPB" },
        ["23VOR"] = { lat = 61.923775, lon = 34.187427778, type = "ULPB" },
        ["22THR"] = { lat = -20.407966667, lon = 57.637225, type = "FIMP" },
    },

    -- Данные ВПП
    Runways = {
        ["RW01"] = {
            heading = 10,
            length = -150.0,
            width = 0,
            threshold = { lat = 61.874830555555555, lon = 34.14547777777778 },
            end = { lat = 61.85051879690829, lon = 34.13638396158226 }
        },
        ["RW19"] = {
            heading = 190,
            length = 150.0,
            width = 0,
            threshold = { lat = 61.89548333333333, lon = 34.16415555555555 },
            end = { lat = 61.871171574686066, lon = 34.15505560206514 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BOBM2A"] = {
            name = "BOBM2A",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "PTZ", type = "D", speed = 205.0 },
                { name = "BOBMU", type = "E", altitude_min = 7000 },
            }
        },
        ["BOBM2B"] = {
            name = "BOBM2B",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "XO", type = "D", speed = 205.0 },
                { name = "BOBMU", type = "E", altitude_min = 7000 },
            }
        },
        ["BOBM2C"] = {
            name = "BOBM2C",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "", type = "", speed = 205.0 },
                { name = "BOBMU", type = "E", altitude_min = 7000 },
            }
        },
        ["BOBM2D"] = {
            name = "BOBM2D",
            runway = "RW19",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "BOBMU", type = "E", altitude_min = 7000 },
            }
        },
        ["BOBM2E"] = {
            name = "BOBM2E",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "PB307", type = "P" },
                { name = "PB301", type = "P" },
                { name = "BOBMU", type = "E", altitude_min = 7000 },
            }
        },
        ["BOBM2F"] = {
            name = "BOBM2F",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "PB301", type = "P" },
                { name = "BOBMU", type = "E", altitude_min = 7000 },
            }
        },
        ["GITO2A"] = {
            name = "GITO2A",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "PTZ", type = "D", speed = 205.0 },
                { name = "GITOS", type = "E", altitude_min = 7000 },
            }
        },
        ["GITO2B"] = {
            name = "GITO2B",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "XO", type = "D", speed = 205.0 },
                { name = "GITOS", type = "E", altitude_min = 7000 },
            }
        },
        ["GITO2C"] = {
            name = "GITO2C",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "", type = "", speed = 205.0 },
                { name = "GITOS", type = "E", altitude_min = 7000 },
            }
        },
        ["GITO2D"] = {
            name = "GITO2D",
            runway = "RW19",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", speed = 205.0 },
                { name = "GITOS", type = "E", altitude_min = 7000 },
            }
        },
        ["GITO2E"] = {
            name = "GITO2E",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "PB307", type = "P" },
                { name = "GITOS", type = "E", altitude_min = 7000 },
            }
        },
        ["GITO2F"] = {
            name = "GITO2F",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "GITOS", type = "E", altitude_min = 7000 },
            }
        },
        ["OSNE2A"] = {
            name = "OSNE2A",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "", type = "" },
                { name = "OSNEN", type = "E", altitude_min = 7000 },
            }
        },
        ["OSNE2B"] = {
            name = "OSNE2B",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "", type = "", speed = 205.0 },
                { name = "OSNEN", type = "E", altitude_min = 7000 },
            }
        },
        ["OSNE2C"] = {
            name = "OSNE2C",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "", type = "", speed = 205.0 },
                { name = "OSNEN", type = "E", altitude_min = 7000 },
            }
        },
        ["OSNE2D"] = {
            name = "OSNE2D",
            runway = "RW19",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", speed = 205.0 },
                { name = "OSNEN", type = "E", altitude_min = 7000 },
            }
        },
        ["OSNE2E"] = {
            name = "OSNE2E",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "PB303", type = "P" },
                { name = "OSNEN", type = "E", altitude_min = 7000 },
            }
        },
        ["OSNE2F"] = {
            name = "OSNE2F",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "PB306", type = "P" },
                { name = "PB303", type = "P" },
                { name = "OSNEN", type = "E", altitude_min = 7000 },
            }
        },
        ["PEME2A"] = {
            name = "PEME2A",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "PTZ", type = "D", speed = 205.0 },
                { name = "PEMEM", type = "E", altitude_min = 7000 },
            }
        },
        ["PEME2B"] = {
            name = "PEME2B",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "XO", type = "D", speed = 205.0 },
                { name = "PEMEM", type = "E", altitude_min = 7000 },
            }
        },
        ["PEME2C"] = {
            name = "PEME2C",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "", type = "" },
                { name = "PEMEM", type = "E", altitude_min = 7000 },
            }
        },
        ["PEME2D"] = {
            name = "PEME2D",
            runway = "RW19",
            waypoints = {
                { name = "", type = "" },
                { name = "XO", type = "D" },
                { name = "PEMEM", type = "E", altitude_min = 7000 },
            }
        },
        ["PEME2E"] = {
            name = "PEME2E",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "PB305", type = "P" },
                { name = "PEMEM", type = "E", altitude_min = 7000 },
            }
        },
        ["PEME2F"] = {
            name = "PEME2F",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "PB305", type = "P" },
                { name = "PEMEM", type = "E", altitude_min = 7000 },
            }
        },
        ["SOPI2A"] = {
            name = "SOPI2A",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "SOPID", type = "E", altitude_min = 7000 },
            }
        },
        ["SOPI2B"] = {
            name = "SOPI2B",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "SOPID", type = "E", altitude_min = 7000, speed = 205.0 },
            }
        },
        ["SOPI2C"] = {
            name = "SOPI2C",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "PTZ", type = "D", speed = 205.0 },
                { name = "SOPID", type = "E", altitude_min = 7000 },
            }
        },
        ["SOPI2D"] = {
            name = "SOPI2D",
            runway = "RW19",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", speed = 205.0 },
                { name = "SOPID", type = "E", altitude_min = 7000 },
            }
        },
        ["SOPI2E"] = {
            name = "SOPI2E",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "PB304", type = "P" },
                { name = "SOPID", type = "E", altitude_min = 7000 },
            }
        },
        ["SOPI2F"] = {
            name = "SOPI2F",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "PB306", type = "P" },
                { name = "PB304", type = "P" },
                { name = "SOPID", type = "E", altitude_min = 7000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BOBM2G"] = {
            name = "BOBM2G",
            runway = "RW01",
            waypoints = {
                { name = "BOBMU", type = "UL", altitude_min = 7000 },
                { name = "PB301", type = "UL" },
                { name = "PB004", type = "UL", altitude_min = 3110 },
            }
        },
        ["BOBM2H"] = {
            name = "BOBM2H",
            runway = "RW19",
            waypoints = {
                { name = "BOBMU", type = "UL", altitude_min = 7000 },
                { name = "PB003", type = "UL", altitude_min = 3110 },
                { name = "PB022", type = "UL", altitude_min = 3110 },
            }
        },
        ["BOBM2J"] = {
            name = "BOBM2J",
            runway = "",
            waypoints = {
                { name = "BOBMU", type = "UL", altitude_min = 7000 },
                { name = "BOBMU", type = "UL", altitude_min = 7000 },
                { name = "PTZ", type = "UL", altitude_min = 3110 },
                { name = "BOBMU", type = "UL", altitude_min = 7000 },
                { name = "PTZ", type = "UL", altitude_min = 3100 },
            }
        },
        ["BOBM2K"] = {
            name = "BOBM2K",
            runway = "",
            waypoints = {
                { name = "BOBMU", type = "UL", altitude_min = 7000 },
                { name = "BOBMU", type = "UL", altitude_min = 7000 },
                { name = "XO", type = "UL", altitude_min = 3110 },
                { name = "BOBMU", type = "UL", altitude_min = 7000 },
                { name = "XO", type = "UL", altitude_min = 3100 },
            }
        },
        ["GITO2G"] = {
            name = "GITO2G",
            runway = "RW01",
            waypoints = {
                { name = "GITOS", type = "UL", altitude_min = 7000 },
                { name = "PB003", type = "UL", altitude_min = 3110 },
            }
        },
        ["GITO2H"] = {
            name = "GITO2H",
            runway = "RW19",
            waypoints = {
                { name = "GITOS", type = "UL", altitude_min = 7000 },
                { name = "PB302", type = "UL" },
                { name = "PB003", type = "UL", altitude_min = 3110 },
                { name = "PB022", type = "UL", altitude_min = 3110 },
            }
        },
        ["GITO2J"] = {
            name = "GITO2J",
            runway = "",
            waypoints = {
                { name = "GITOS", type = "UL", altitude_min = 7000 },
                { name = "GITOS", type = "UL", altitude_min = 7000 },
                { name = "PTZ", type = "UL", altitude_min = 3110 },
                { name = "GITOS", type = "UL", altitude_min = 7000 },
                { name = "PTZ", type = "UL", altitude_min = 3100 },
            }
        },
        ["GITO2K"] = {
            name = "GITO2K",
            runway = "",
            waypoints = {
                { name = "GITOS", type = "UL", altitude_min = 7000 },
                { name = "GITOS", type = "UL", altitude_min = 7000 },
                { name = "XO", type = "UL", altitude_min = 3110 },
                { name = "GITOS", type = "UL", altitude_min = 7000 },
                { name = "XO", type = "UL", altitude_min = 3100 },
            }
        },
        ["OSNE2G"] = {
            name = "OSNE2G",
            runway = "RW01",
            waypoints = {
                { name = "OSNEN", type = "UL", altitude_min = 7000 },
                { name = "PB303", type = "UL" },
                { name = "PB306", type = "UL" },
                { name = "PB003", type = "UL", altitude_min = 3110 },
            }
        },
        ["OSNE2H"] = {
            name = "OSNE2H",
            runway = "RW19",
            waypoints = {
                { name = "OSNEN", type = "UL", altitude_min = 7000 },
                { name = "PB303", type = "UL" },
                { name = "PB022", type = "UL", altitude_min = 3110 },
            }
        },
        ["OSNE2J"] = {
            name = "OSNE2J",
            runway = "",
            waypoints = {
                { name = "OSNEN", type = "UL", altitude_min = 7000 },
                { name = "OSNEN", type = "UL", altitude_min = 7000 },
                { name = "PTZ", type = "UL", altitude_min = 3110 },
                { name = "OSNEN", type = "UL", altitude_min = 7000 },
                { name = "PTZ", type = "UL", altitude_min = 3100 },
            }
        },
        ["OSNE2K"] = {
            name = "OSNE2K",
            runway = "",
            waypoints = {
                { name = "OSNEN", type = "UL", altitude_min = 7000 },
                { name = "OSNEN", type = "UL", altitude_min = 7000 },
                { name = "XO", type = "UL", altitude_min = 3110 },
                { name = "OSNEN", type = "UL", altitude_min = 7000 },
                { name = "XO", type = "UL", altitude_min = 3100 },
            }
        },
        ["PEME2G"] = {
            name = "PEME2G",
            runway = "RW01",
            waypoints = {
                { name = "PEMEM", type = "UL", altitude_min = 7000 },
                { name = "PB305", type = "UL" },
                { name = "PB005", type = "UL", altitude_min = 3110 },
            }
        },
        ["PEME2H"] = {
            name = "PEME2H",
            runway = "RW19",
            waypoints = {
                { name = "PEMEM", type = "UL", altitude_min = 7000 },
                { name = "PB305", type = "UL" },
                { name = "PB024", type = "UL", altitude_min = 3110 },
            }
        },
        ["PEME2J"] = {
            name = "PEME2J",
            runway = "",
            waypoints = {
                { name = "PEMEM", type = "UL", altitude_min = 7000 },
                { name = "PEMEM", type = "UL", altitude_min = 7000 },
                { name = "PTZ", type = "UL", altitude_min = 3110 },
                { name = "PEMEM", type = "UL", altitude_min = 7000 },
                { name = "PTZ", type = "UL", altitude_min = 3100 },
            }
        },
        ["PEME2K"] = {
            name = "PEME2K",
            runway = "",
            waypoints = {
                { name = "PEMEM", type = "UL", altitude_min = 7000 },
                { name = "PEMEM", type = "UL", altitude_min = 7000 },
                { name = "XO", type = "UL", altitude_min = 3110 },
                { name = "PEMEM", type = "UL", altitude_min = 7000 },
                { name = "XO", type = "UL", altitude_min = 3100 },
            }
        },
        ["SOPI2G"] = {
            name = "SOPI2G",
            runway = "RW01",
            waypoints = {
                { name = "SOPID", type = "UL", altitude_min = 7000 },
                { name = "PB304", type = "UL" },
                { name = "PB306", type = "UL" },
                { name = "PB003", type = "UL", altitude_min = 3110 },
            }
        },
        ["SOPI2H"] = {
            name = "SOPI2H",
            runway = "RW19",
            waypoints = {
                { name = "SOPID", type = "UL", altitude_min = 7000 },
                { name = "PB304", type = "UL" },
                { name = "PB023", type = "UL", altitude_min = 3110 },
            }
        },
        ["SOPI2J"] = {
            name = "SOPI2J",
            runway = "",
            waypoints = {
                { name = "SOPID", type = "UL", altitude_min = 7000 },
                { name = "SOPID", type = "UL", altitude_min = 7000 },
                { name = "PTZ", type = "UL", altitude_min = 3110 },
                { name = "SOPID", type = "UL", altitude_min = 7000 },
                { name = "PTZ", type = "UL", altitude_min = 3100 },
            }
        },
        ["SOPI2K"] = {
            name = "SOPI2K",
            runway = "",
            waypoints = {
                { name = "SOPID", type = "UL", altitude_min = 7000 },
                { name = "SOPID", type = "UL", altitude_min = 7000 },
                { name = "XO", type = "UL", altitude_min = 3110 },
                { name = "SOPID", type = "UL", altitude_min = 7000 },
                { name = "XO", type = "UL", altitude_min = 3100 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D01"] = {
            name = "D01",
            type = "A",
            runway = "D01",
            waypoints = {
                { name = "PTZ", transition = "PTZ1", type = "UL", altitude_min = 3110 },
                { name = "PTZ", transition = "PTZ1", type = "UL", altitude_min = 2120 },
                { name = "FD01", transition = "PTZ1", type = "UL" },
                { name = "PTZ", transition = "PTZ2", type = "UL", altitude_min = 3110 },
                { name = "PTZ", transition = "PTZ2", type = "UL", altitude_min = 2120 },
                { name = "FD01", transition = "PTZ2", type = "UL" },
                { name = "FD01", transition = "", type = "UL" },
                { name = "28VOR", transition = "", type = "UL" },
                { name = "RW01", transition = "", type = "UL" },
                { name = "RW01", transition = "", type = "UL" },
                { name = "PTZ", transition = "", type = "UL", altitude_min = 2120 },
            }
        },
        ["D19"] = {
            name = "D19",
            type = "A",
            runway = "D19",
            waypoints = {
                { name = "PTZ", transition = "PTZ1", type = "UL", altitude_min = 3110 },
                { name = "PTZ", transition = "PTZ1", type = "UL", altitude_min = 2110 },
                { name = "FD19", transition = "PTZ1", type = "UL" },
                { name = "PTZ", transition = "PTZ2", type = "UL", altitude_min = 3110 },
                { name = "PTZ", transition = "PTZ2", type = "UL", altitude_min = 2110 },
                { name = "FD19", transition = "PTZ2", type = "UL" },
                { name = "FD19", transition = "", type = "UL" },
                { name = "23VOR", transition = "", type = "UL" },
                { name = "RW19", transition = "", type = "UL" },
                { name = "RW19", transition = "", type = "UL" },
                { name = "PTZ", transition = "", type = "UL", altitude_min = 2110, speed = 185.0 },
            }
        },
        ["I19-X"] = {
            name = "I19-X",
            type = "A",
            runway = "I19-X",
            waypoints = {
                { name = "XO", transition = "XO1", type = "UL", altitude_min = 3110 },
                { name = "XO", transition = "XO1", type = "UL", altitude_min = 2110 },
                { name = "CI19", transition = "XO1", type = "UL", altitude_min = 2110 },
                { name = "XO", transition = "XO2", type = "UL", altitude_min = 3110 },
                { name = "XO", transition = "XO2", type = "UL", altitude_min = 2110 },
                { name = "CI19", transition = "XO2", type = "UL", altitude_min = 2110 },
                { name = "CI19", transition = "", type = "UL" },
                { name = "FI19", transition = "", type = "UL" },
                { name = "RW19", transition = "", type = "UL" },
                { name = "XO", transition = "", type = "UL", altitude_min = 1130, speed = 200.0 },
                { name = "", transition = "", type = "", altitude_min = 2110 },
            }
        },
        ["I19-Y"] = {
            name = "I19-Y",
            type = "A",
            runway = "I19-Y",
            waypoints = {
                { name = "PTZ", transition = "PTZ1", type = "UL", altitude_min = 3110 },
                { name = "PTZ", transition = "PTZ1", type = "UL", altitude_min = 2110 },
                { name = "CI19", transition = "PTZ1", type = "UL", altitude_min = 2110 },
                { name = "PTZ", transition = "PTZ2", type = "UL", altitude_min = 3110 },
                { name = "PTZ", transition = "PTZ2", type = "UL", altitude_min = 2110 },
                { name = "CI19", transition = "PTZ2", type = "UL", altitude_min = 2110 },
                { name = "CI19", transition = "", type = "UL" },
                { name = "FI19", transition = "", type = "UL" },
                { name = "RW19", transition = "", type = "UL" },
                { name = "RW19", transition = "", type = "UL" },
                { name = "PTZ", transition = "", type = "UL", altitude_min = 2110, speed = 185.0 },
            }
        },
        ["I19-Z"] = {
            name = "I19-Z",
            type = "A",
            runway = "I19-Z",
            waypoints = {
                { name = "PB022", transition = "PB022", type = "UL", altitude_min = 3110 },
                { name = "PB021", transition = "PB022", type = "UL", altitude_min = 2110 },
                { name = "PB023", transition = "PB023", type = "UL", altitude_min = 3110 },
                { name = "PB021", transition = "PB023", type = "UL", altitude_min = 2110 },
                { name = "PB024", transition = "PB024", type = "UL", altitude_min = 3110 },
                { name = "PB021", transition = "PB024", type = "UL", altitude_min = 2110 },
                { name = "PB021", transition = "", type = "UL" },
                { name = "FI19", transition = "", type = "UL" },
                { name = "RW19", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "PB025", transition = "", type = "UL", speed = 185.0 },
                { name = "PB022", transition = "", type = "UL", altitude_min = 3110 },
            }
        },
        ["J01"] = {
            name = "J01",
            type = "A",
            runway = "J01",
            waypoints = {
                { name = "PB003", transition = "PB003", type = "UL", altitude_min = 3110 },
                { name = "PB002", transition = "PB003", type = "UL", altitude_min = 2120 },
                { name = "PB004", transition = "PB004", type = "UL", altitude_min = 3110 },
                { name = "PB002", transition = "PB004", type = "UL", altitude_min = 2120 },
                { name = "PB005", transition = "PB005", type = "UL", altitude_min = 3110 },
                { name = "PB002", transition = "PB005", type = "UL", altitude_min = 2120 },
                { name = "PB002", transition = "", type = "UL" },
                { name = "PB001", transition = "", type = "UL" },
                { name = "RW01", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 810 },
                { name = "PB006", transition = "", type = "UL", speed = 185.0 },
                { name = "PB003", transition = "", type = "UL", altitude_min = 3110 },
            }
        },
        ["J19"] = {
            name = "J19",
            type = "A",
            runway = "J19",
            waypoints = {
                { name = "PB022", transition = "PB022", type = "UL", altitude_min = 3110 },
                { name = "PB021", transition = "PB022", type = "UL", altitude_min = 2110 },
                { name = "PB023", transition = "PB023", type = "UL", altitude_min = 3110 },
                { name = "PB021", transition = "PB023", type = "UL", altitude_min = 2110 },
                { name = "PB024", transition = "PB024", type = "UL", altitude_min = 3110 },
                { name = "PB021", transition = "PB024", type = "UL", altitude_min = 2110 },
                { name = "PB021", transition = "", type = "UL" },
                { name = "PB020", transition = "", type = "UL" },
                { name = "RW19", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "PB025", transition = "", type = "UL", speed = 185.0 },
                { name = "PB022", transition = "", type = "UL", altitude_min = 3110 },
            }
        },
        ["N01-Y"] = {
            name = "N01-Y",
            type = "N",
            runway = "N01-Y",
            waypoints = {
                { name = "CN01", transition = "", type = "UL" },
                { name = "XO", transition = "", type = "UL" },
                { name = "11THR", transition = "", type = "UL" },
                { name = "X", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 810 },
                { name = "", transition = "", type = "", altitude_min = 2120 },
            }
        },
        ["Q01-Z"] = {
            name = "Q01-Z",
            type = "A",
            runway = "Q01-Z",
            waypoints = {
                { name = "XO", transition = "XO1", type = "UL", altitude_min = 3110 },
                { name = "XO", transition = "XO1", type = "UL", altitude_min = 2120 },
                { name = "FQ01", transition = "XO1", type = "UL" },
                { name = "XO", transition = "XO2", type = "UL", altitude_min = 3110 },
                { name = "XO", transition = "XO2", type = "UL", altitude_min = 2120 },
                { name = "FQ01", transition = "XO2", type = "UL" },
                { name = "FQ01", transition = "", type = "UL" },
                { name = "28DME", transition = "", type = "UL" },
                { name = "RW01", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 810 },
                { name = "XO", transition = "", type = "UL", altitude_min = 2120 },
            }
        },
        ["Q19"] = {
            name = "Q19",
            type = "A",
            runway = "Q19",
            waypoints = {
                { name = "XO", transition = "XO1", type = "UL", altitude_min = 3110 },
                { name = "XO", transition = "XO1", type = "UL", altitude_min = 2110 },
                { name = "FQ19", transition = "XO1", type = "UL" },
                { name = "XO", transition = "XO2", type = "UL", altitude_min = 3110 },
                { name = "XO", transition = "XO2", type = "UL", altitude_min = 2110 },
                { name = "FQ19", transition = "XO2", type = "UL" },
                { name = "FQ19", transition = "", type = "UL" },
                { name = "23DME", transition = "", type = "UL" },
                { name = "RW19", transition = "", type = "UL" },
                { name = "XO", transition = "", type = "UL", altitude_min = 1130, speed = 200.0 },
                { name = "", transition = "", type = "", altitude_min = 2110 },
            }
        },
        ["R01"] = {
            name = "R01",
            type = "A",
            runway = "R01",
            waypoints = {
                { name = "PB003", transition = "PB003", type = "UL", altitude_min = 3110 },
                { name = "PB002", transition = "PB003", type = "UL", altitude_min = 2120 },
                { name = "PB004", transition = "PB004", type = "UL", altitude_min = 3110 },
                { name = "PB002", transition = "PB004", type = "UL", altitude_min = 2120 },
                { name = "PB005", transition = "PB005", type = "UL", altitude_min = 3110 },
                { name = "PB002", transition = "PB005", type = "UL", altitude_min = 2120 },
                { name = "PB002", transition = "", type = "UL", altitude_min = 2120 },
                { name = "PB001", transition = "", type = "UL" },
                { name = "21THR", transition = "", type = "UL" },
                { name = "RW01", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 810 },
                { name = "PB006", transition = "", type = "UL", speed = 185.0 },
                { name = "PB003", transition = "", type = "UL", altitude_min = 3110 },
            }
        },
        ["R19"] = {
            name = "R19",
            type = "A",
            runway = "R19",
            waypoints = {
                { name = "PB022", transition = "PB022", type = "UL", altitude_min = 3110 },
                { name = "PB021", transition = "PB022", type = "UL", altitude_min = 2110 },
                { name = "PB023", transition = "PB023", type = "UL", altitude_min = 3110 },
                { name = "PB021", transition = "PB023", type = "UL", altitude_min = 2110 },
                { name = "PB024", transition = "PB024", type = "UL", altitude_min = 3110 },
                { name = "PB021", transition = "PB024", type = "UL", altitude_min = 2110 },
                { name = "PB021", transition = "", type = "UL", altitude_min = 2110 },
                { name = "PB020", transition = "", type = "UL" },
                { name = "22THR", transition = "", type = "UL" },
                { name = "RW19", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "PB025", transition = "", type = "UL", speed = 185.0 },
                { name = "PB022", transition = "", type = "UL", altitude_min = 3110 },
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
