local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIMB",
        Name = "OIMB Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["D270O"] = { lat = 28.930166667, lon = -13.889341667, type = "GCRR" },
        ["TULKU"] = { lat = 33.017222222, lon = 58.84, type = "ENRT" },
        ["FN270"] = { lat = 32.885630556, lon = 59.401986111, type = "OIMB" },
        ["BOPEB"] = { lat = 33.320277778, lon = 59.246666667, type = "ENRT" },
        ["MD28"] = { lat = -17.816608333, lon = 25.831508333, type = "FLHN" },
        ["ODBES"] = { lat = 32.513888889, lon = 59.432222222, type = "ENRT" },
        ["MD10"] = { lat = -17.815505556, lon = 25.802813889, type = "FLHN" },
        ["CD28"] = { lat = -17.881183333, lon = 26.017088889, type = "FLHN" },
        ["CD10"] = { lat = -17.847363889, lon = 25.613541667, type = "FLHN" },
        ["FD10"] = { lat = -17.830011111, lon = 25.716794444, type = "FLHN" },
        ["ROSOS"] = { lat = 32.970833333, lon = 58.803888889, type = "ENRT" },
        ["FD28"] = { lat = -17.845775, lon = 25.915255556, type = "FLHN" },
    },

    -- Данные ВПП
    Runways = {
        ["RW08"] = {
            heading = 80,
            length = 1080.0,
            width = 0,
            threshold = { lat = 32.89541666666667, lon = 59.25714722222222 },
            end = { lat = 32.92628176345217, lon = 59.465617283514575 }
        },
        ["RW10"] = {
            heading = 100,
            length = 480.0,
            width = 0,
            threshold = { lat = 32.89651944444444, lon = 59.26968055555555 },
            end = { lat = 32.88280162365089, lon = 59.362335069633296 }
        },
        ["RW26"] = {
            heading = 260,
            length = -1080.0,
            width = 0,
            threshold = { lat = 32.89895833333333, lon = 59.27814444444444 },
            end = { lat = 32.92982343011883, lon = 59.48662284153727 }
        },
        ["RW28"] = {
            heading = 280,
            length = -480.0,
            width = 0,
            threshold = { lat = 32.891333333333336, lon = 59.30979722222222 },
            end = { lat = 32.87761551253978, lon = 59.4024463121869 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BOPE1B"] = {
            name = "BOPE1B",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 5380 },
                { name = "BRN", type = "D", altitude_min = 8000 },
                { name = "BRN", type = "D", altitude_min = 11000 },
                { name = "BOPEB", type = "E" },
            }
        },
        ["BOPE1C"] = {
            name = "BOPE1C",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 5380 },
                { name = "BRN", type = "D", altitude_min = 8000 },
                { name = "BRN", type = "D", altitude_min = 11000 },
                { name = "", type = "" },
                { name = "BOPEB", type = "E" },
            }
        },
        ["ODBE1B"] = {
            name = "ODBE1B",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 5380 },
                { name = "BRN", type = "D", altitude_min = 8000 },
                { name = "BRN", type = "D", altitude_min = 11000 },
                { name = "ODBES", type = "E" },
            }
        },
        ["ODBE1C"] = {
            name = "ODBE1C",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 5380 },
                { name = "BRN", type = "D", altitude_min = 8000 },
                { name = "BRN", type = "D", altitude_min = 11000 },
                { name = "ODBES", type = "E" },
            }
        },
        ["ROSO1B"] = {
            name = "ROSO1B",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 5380 },
                { name = "BRN", type = "D", altitude_min = 8000 },
                { name = "BRN", type = "D", altitude_min = 11000 },
                { name = "ROSOS", type = "E" },
            }
        },
        ["ROSO1C"] = {
            name = "ROSO1C",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 5380 },
                { name = "BRN", type = "D", altitude_min = 8000 },
                { name = "BRN", type = "D", altitude_min = 11000 },
                { name = "", type = "" },
                { name = "ROSOS", type = "E" },
            }
        },
        ["TULK1B"] = {
            name = "TULK1B",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 5380 },
                { name = "BRN", type = "D", altitude_min = 8000 },
                { name = "BRN", type = "D", altitude_min = 11000 },
                { name = "TULKU", type = "E" },
            }
        },
        ["TULK1C"] = {
            name = "TULK1C",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 5380 },
                { name = "BRN", type = "D", altitude_min = 8000 },
                { name = "BRN", type = "D", altitude_min = 11000 },
                { name = "", type = "" },
                { name = "TULKU", type = "E" },
            }
        },
        ["TULK2A"] = {
            name = "TULK2A",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 5380 },
                { name = "TULKU", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BOPE1N"] = {
            name = "BOPE1N",
            runway = "",
            waypoints = {
                { name = "BOPEB", type = "OI" },
                { name = "BOPEB", type = "OI" },
                { name = "BRN", type = "OI" },
                { name = "BOPEB", type = "OI" },
                { name = "BRN", type = "OI" },
            }
        },
        ["BOPE1P"] = {
            name = "BOPE1P",
            runway = "",
            waypoints = {
                { name = "BOPEB", type = "OI" },
                { name = "BOPEB", type = "OI" },
                { name = "BRN", type = "OI" },
                { name = "D270O", type = "OI" },
                { name = "BOPEB", type = "OI" },
                { name = "BRN", type = "OI" },
                { name = "D270O", type = "OI" },
            }
        },
        ["BOPE1T"] = {
            name = "BOPE1T",
            runway = "",
            waypoints = {
                { name = "BOPEB", type = "OI" },
                { name = "BOPEB", type = "OI" },
                { name = "BRN", type = "OI" },
                { name = "BOPEB", type = "OI" },
                { name = "BRN", type = "OI" },
            }
        },
        ["ODBE1N"] = {
            name = "ODBE1N",
            runway = "",
            waypoints = {
                { name = "ODBES", type = "OI" },
                { name = "ODBES", type = "OI" },
                { name = "BRN", type = "OI" },
                { name = "ODBES", type = "OI" },
                { name = "BRN", type = "OI" },
            }
        },
        ["ODBE1P"] = {
            name = "ODBE1P",
            runway = "",
            waypoints = {
                { name = "ODBES", type = "OI" },
                { name = "ODBES", type = "OI" },
                { name = "BRN", type = "OI" },
                { name = "D270O", type = "OI" },
                { name = "ODBES", type = "OI" },
                { name = "BRN", type = "OI" },
                { name = "D270O", type = "OI" },
            }
        },
        ["ODBE1T"] = {
            name = "ODBE1T",
            runway = "",
            waypoints = {
                { name = "ODBES", type = "OI" },
                { name = "ODBES", type = "OI" },
                { name = "BRN", type = "OI" },
                { name = "ODBES", type = "OI" },
                { name = "BRN", type = "OI" },
            }
        },
        ["TULK1N"] = {
            name = "TULK1N",
            runway = "",
            waypoints = {
                { name = "TULKU", type = "OI" },
                { name = "TULKU", type = "OI" },
                { name = "BRN", type = "OI" },
                { name = "TULKU", type = "OI" },
                { name = "BRN", type = "OI" },
            }
        },
        ["TULK1P"] = {
            name = "TULK1P",
            runway = "",
            waypoints = {
                { name = "TULKU", type = "OI" },
                { name = "TULKU", type = "OI" },
                { name = "D270O", type = "OI" },
                { name = "TULKU", type = "OI" },
                { name = "D270O", type = "OI" },
            }
        },
        ["TULK1T"] = {
            name = "TULK1T",
            runway = "",
            waypoints = {
                { name = "TULKU", type = "OI" },
                { name = "TULKU", type = "OI" },
                { name = "BRN", type = "OI" },
                { name = "TULKU", type = "OI" },
                { name = "BRN", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["CNDB"] = {
            name = "CNDB",
            type = "A",
            runway = "CNDB",
            waypoints = {
                { name = "BRN", transition = "BRN", type = "OI", altitude_min = 10000, speed = 185.0 },
                { name = "FN270", transition = "BRN", type = "OI" },
                { name = "FN270", transition = "BRN", type = "OI" },
                { name = "FN270", transition = "BRN", type = "OI" },
                { name = "FN270", transition = "", type = "OI" },
                { name = "BRN", transition = "", type = "OI" },
                { name = "BRN", transition = "", type = "OI", altitude_min = 8800 },
                { name = "BRN", transition = "", type = "OI" },
                { name = "BRN", transition = "", type = "OI", speed = 230.0 },
            }
        },
        ["D10"] = {
            name = "D10",
            type = "A",
            runway = "D10",
            waypoints = {
                { name = "D270O", transition = "D270O", type = "OI", altitude_min = 9500 },
                { name = "CD10", transition = "D270O", type = "OI", altitude_min = 7500 },
                { name = "CD10", transition = "", type = "OI", altitude_min = 7500 },
                { name = "FD10", transition = "", type = "OI", altitude_min = 6500 },
                { name = "MD10", transition = "", type = "OI" },
                { name = "BRN", transition = "", type = "OI" },
                { name = "BRN", transition = "", type = "OI", altitude_min = 6500 },
                { name = "BRN", transition = "", type = "OI" },
                { name = "D270O", transition = "", type = "OI", altitude_min = 9500 },
                { name = "D270O", transition = "", type = "OI", altitude_min = 9500, speed = 230.0 },
            }
        },
        ["D28"] = {
            name = "D28",
            type = "A",
            runway = "D28",
            waypoints = {
                { name = "BRN", transition = "BRN1", type = "OI", altitude_min = 10000 },
                { name = "BRN", transition = "BRN1", type = "OI", altitude_min = 8300 },
                { name = "CD28", transition = "BRN1", type = "OI", altitude_min = 8300 },
                { name = "BRN", transition = "BRN2", type = "OI", altitude_min = 10000 },
                { name = "BRN", transition = "BRN2", type = "OI", altitude_min = 8300 },
                { name = "CD28", transition = "BRN2", type = "OI", altitude_min = 8300 },
                { name = "CD28", transition = "", type = "OI", altitude_min = 8300 },
                { name = "FD28", transition = "", type = "OI", altitude_min = 6800 },
                { name = "MD28", transition = "", type = "OI" },
                { name = "BRN", transition = "", type = "OI" },
                { name = "BRN", transition = "", type = "OI", altitude_min = 7000 },
                { name = "BRN", transition = "", type = "OI" },
                { name = "BRN", transition = "", type = "OI", altitude_min = 10000, speed = 230.0 },
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
