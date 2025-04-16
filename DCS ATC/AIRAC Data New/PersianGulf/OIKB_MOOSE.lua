local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIKB",
        Name = "OIKB Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["D058Y"] = { lat = 27.410233333, lon = 56.769063889, type = "OIKB" },
        ["D114M"] = { lat = 6.280808333, lon = 2.595125, type = "DBBB" },
        ["D055M"] = { lat = 61.500602778, lon = 23.987405556, type = "EFTP" },
        ["D270K"] = { lat = 65.842163889, lon = 87.518355556, type = "UOTT" },
        ["FS03R"] = { lat = 27.131819444, lon = 56.327983333, type = "OIKB" },
        ["DAVEP"] = { lat = 27.707222222, lon = 57.335833333, type = "ENRT" },
        ["D007M"] = { lat = 11.3625, lon = -4.341666667, type = "DFOO" },
        ["ASMUK"] = { lat = 28.164444444, lon = 56.081388889, type = "ENRT" },
        ["FI21L"] = { lat = -26.077936111, lon = 28.274963889, type = "FAOR" },
        ["D343M"] = { lat = 69.916977778, lon = 18.920219444, type = "ENTC" },
        ["D299K"] = { lat = 52.508069444, lon = 13.885813889, type = "EDDB" },
        ["CD21L"] = { lat = 38.101711111, lon = 24.119772222, type = "LGAV" },
        ["D222O"] = { lat = 32.481486111, lon = 12.949408333, type = "HLLT" },
        ["FN03R"] = { lat = 27.129652778, lon = 56.339497222, type = "OIKB" },
        ["BND45"] = { lat = 26.880627778, lon = 57.128786111, type = "OIKB" },
        ["MD21L"] = { lat = 37.957213889, lon = 23.9767, type = "LGAV" },
        ["FN21L"] = { lat = 27.292069444, lon = 56.439186111, type = "OIKB" },
        ["BND"] = { lat = -30.883333333, lon = 151.15, type = "ENRT" },
        ["FD03R"] = { lat = 37.799380556, lon = 23.821258333, type = "LGAV" },
        ["FS21L"] = { lat = 27.289130556, lon = 56.421552778, type = "OIKB" },
        ["MELMI"] = { lat = 26.773611111, lon = 57.383333333, type = "ENRT" },
        ["FD21L"] = { lat = 38.022916667, lon = 24.041661111, type = "LGAV" },
        ["D299J"] = { lat = 40.304472222, lon = 69.520725, type = "UTDL" },
        ["CI21L"] = { lat = -26.005316667, lon = 28.297383333, type = "FAOR" },
        ["TAVNO"] = { lat = 28.186666667, lon = 56.548055556, type = "ENRT" },
        ["D343L"] = { lat = 45.652644444, lon = 9.207225, type = "LIML" },
        ["CD03R"] = { lat = 37.733555556, lon = 23.756686111, type = "LGAV" },
        ["D007Y"] = { lat = 27.609475, lon = 56.441919444, type = "OIKB" },
        ["D343T"] = { lat = 40.018938889, lon = 3.31765, type = "LEPA" },
        ["MOBON"] = { lat = 27.737222222, lon = 55.420277778, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW03L"] = {
            heading = 30,
            length = 0,
            width = 0,
            threshold = { lat = 27.20503888888889, lon = 56.36860277777778 },
            end = { lat = 27.20503888888889, lon = 56.36860277777778 }
        },
        ["RW03R"] = {
            heading = 30,
            length = 0,
            width = 0,
            threshold = { lat = 27.203152777777778, lon = 56.37034444444444 },
            end = { lat = 27.203152777777778, lon = 56.37034444444444 }
        },
        ["RW21L"] = {
            heading = 210,
            length = 0,
            width = 0,
            threshold = { lat = 27.232391666666665, lon = 56.38755833333333 },
            end = { lat = 27.232391666666665, lon = 56.38755833333333 }
        },
        ["RW21R"] = {
            heading = 210,
            length = 0,
            width = 0,
            threshold = { lat = 27.232652777777776, lon = 56.38486388888889 },
            end = { lat = 27.232652777777776, lon = 56.38486388888889 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ASMU1A"] = {
            name = "ASMU1A",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "BND", type = "D", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 11000 },
                { name = "", type = "" },
                { name = "ASMUK", type = "E" },
            }
        },
        ["ASMU1B"] = {
            name = "ASMU1B",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "BND", type = "D", altitude_min = 3000 },
                { name = "BND", type = "D", altitude_min = 6000 },
                { name = "ASMUK", type = "E" },
            }
        },
        ["ASMU1C"] = {
            name = "ASMU1C",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 8000 },
                { name = "", type = "" },
                { name = "ASMUK", type = "E", altitude_min = 17000 },
            }
        },
        ["ASMU1D"] = {
            name = "ASMU1D",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 3000 },
                { name = "BND", type = "D", altitude_min = 6000 },
                { name = "ASMUK", type = "E" },
            }
        },
        ["ASMU1F"] = {
            name = "ASMU1F",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 3000 },
                { name = "BND", type = "D", altitude_min = 6000 },
                { name = "ASMUK", type = "E", altitude_min = 17000 },
            }
        },
        ["ASMU1G"] = {
            name = "ASMU1G",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 8000 },
                { name = "", type = "" },
                { name = "ASMUK", type = "E", altitude_min = 17000 },
            }
        },
        ["ASMU1H"] = {
            name = "ASMU1H",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 3000 },
                { name = "BND", type = "D", altitude_min = 6000 },
                { name = "ASMUK", type = "E", altitude_min = 17000 },
            }
        },
        ["DAVE1A"] = {
            name = "DAVE1A",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "DAVEP", type = "E", altitude_min = 15000 },
            }
        },
        ["DAVE1C"] = {
            name = "DAVE1C",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "DAVEP", type = "E", altitude_min = 15000 },
            }
        },
        ["DAVE1E"] = {
            name = "DAVE1E",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "DAVEP", type = "E", altitude_min = 15000 },
            }
        },
        ["DAVE1G"] = {
            name = "DAVE1G",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "DAVEP", type = "E", altitude_min = 15000 },
            }
        },
        ["KHM1K"] = {
            name = "KHM1K",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "KHM", type = "D" },
            }
        },
        ["KHM1L"] = {
            name = "KHM1L",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "KHM", type = "D" },
            }
        },
        ["MELM1A"] = {
            name = "MELM1A",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "MELMI", type = "E" },
            }
        },
        ["MELM1C"] = {
            name = "MELM1C",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "MELMI", type = "E" },
            }
        },
        ["MELM1E"] = {
            name = "MELM1E",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "MELMI", type = "E" },
            }
        },
        ["MELM1G"] = {
            name = "MELM1G",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "MELMI", type = "E" },
            }
        },
        ["MOBO1A"] = {
            name = "MOBO1A",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "BND", type = "D", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 11000 },
                { name = "", type = "" },
                { name = "MOBON", type = "E", altitude_min = 13000 },
            }
        },
        ["MOBO1B"] = {
            name = "MOBO1B",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "BND", type = "D", altitude_min = 3000 },
                { name = "BND", type = "D", altitude_min = 6000 },
                { name = "BND", type = "D", altitude_min = 11000 },
                { name = "", type = "" },
                { name = "MOBON", type = "E" },
            }
        },
        ["MOBO1D"] = {
            name = "MOBO1D",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 3000 },
                { name = "BND", type = "D", altitude_min = 6000 },
                { name = "BND", type = "D", altitude_min = 11000 },
                { name = "", type = "" },
                { name = "MOBON", type = "E" },
            }
        },
        ["MOBO1E"] = {
            name = "MOBO1E",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 11000 },
                { name = "", type = "" },
                { name = "MOBON", type = "E", altitude_min = 13000 },
            }
        },
        ["MOBO1F"] = {
            name = "MOBO1F",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 3000 },
                { name = "BND", type = "D", altitude_min = 6000 },
                { name = "BND", type = "D", altitude_min = 11000 },
                { name = "", type = "" },
                { name = "MOBON", type = "E" },
            }
        },
        ["MOBO1H"] = {
            name = "MOBO1H",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 3000 },
                { name = "BND", type = "D", altitude_min = 6000 },
                { name = "BND", type = "D", altitude_min = 11000 },
                { name = "", type = "" },
                { name = "MOBON", type = "E" },
            }
        },
        ["TAVN1B"] = {
            name = "TAVN1B",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "BND", type = "D", altitude_min = 3000 },
                { name = "BND", type = "D", altitude_min = 6000 },
                { name = "TAVNO", type = "E", altitude_min = 17000 },
            }
        },
        ["TAVN1C"] = {
            name = "TAVN1C",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "BND", type = "D", altitude_min = 8000 },
                { name = "", type = "" },
                { name = "TAVNO", type = "E", altitude_min = 17000 },
            }
        },
        ["TAVN1D"] = {
            name = "TAVN1D",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 3000 },
                { name = "BND", type = "D", altitude_min = 6000 },
                { name = "TAVNO", type = "E", altitude_min = 17000 },
            }
        },
        ["TAVN1F"] = {
            name = "TAVN1F",
            runway = "RW21L",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 3000 },
                { name = "BND", type = "D", altitude_min = 6000 },
                { name = "TAVNO", type = "E", altitude_min = 17000 },
            }
        },
        ["TAVN1G"] = {
            name = "TAVN1G",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "BND", type = "D", altitude_min = 8000 },
                { name = "", type = "" },
                { name = "TAVNO", type = "E", altitude_min = 17000 },
            }
        },
        ["TAVN1H"] = {
            name = "TAVN1H",
            runway = "RW03R",
            waypoints = {
                { name = "", type = "" },
                { name = "BND", type = "D", altitude_min = 3000 },
                { name = "BND", type = "D", altitude_min = 6000 },
                { name = "TAVNO", type = "E", altitude_min = 17000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ASMU1P"] = {
            name = "ASMU1P",
            runway = "RW21L",
            waypoints = {
                { name = "ASMUK", type = "OI" },
                { name = "D343M", type = "OI" },
                { name = "D055M", type = "OI" },
            }
        },
        ["ASMU1S"] = {
            name = "ASMU1S",
            runway = "RW03R",
            waypoints = {
                { name = "ASMUK", type = "OI" },
                { name = "D343T", type = "OI" },
                { name = "D343L", type = "OI" },
                { name = "BND", type = "OI" },
                { name = "CD03R", type = "OI" },
            }
        },
        ["ASMU1X"] = {
            name = "ASMU1X",
            runway = "ALL",
            waypoints = {
                { name = "ASMUK", type = "OI" },
                { name = "D343T", type = "OI" },
                { name = "D343L", type = "OI" },
                { name = "BND", type = "OI" },
            }
        },
        ["DAVE1P"] = {
            name = "DAVE1P",
            runway = "RW21L",
            waypoints = {
                { name = "DAVEP", type = "OI" },
                { name = "D058Y", type = "OI" },
                { name = "D055M", type = "OI" },
            }
        },
        ["DAVE1X"] = {
            name = "DAVE1X",
            runway = "ALL",
            waypoints = {
                { name = "DAVEP", type = "OI" },
                { name = "D058Y", type = "OI" },
                { name = "BND", type = "OI" },
            }
        },
        ["KHM1S"] = {
            name = "KHM1S",
            runway = "RW03R",
            waypoints = {
                { name = "KHM", type = "OI" },
                { name = "CD03R", type = "OI" },
            }
        },
        ["KHM1X"] = {
            name = "KHM1X",
            runway = "ALL",
            waypoints = {
                { name = "KHM", type = "OI" },
                { name = "D222O", type = "OI" },
                { name = "BND", type = "OI" },
            }
        },
        ["MELM1P"] = {
            name = "MELM1P",
            runway = "RW21L",
            waypoints = {
                { name = "MELMI", type = "OI" },
                { name = "BND45", type = "OI" },
                { name = "D114M", type = "OI" },
                { name = "D055M", type = "OI" },
            }
        },
        ["MELM1X"] = {
            name = "MELM1X",
            runway = "ALL",
            waypoints = {
                { name = "MELMI", type = "OI" },
                { name = "BND45", type = "OI" },
                { name = "BND", type = "OI" },
            }
        },
        ["MOBO1P"] = {
            name = "MOBO1P",
            runway = "RW21L",
            waypoints = {
                { name = "MOBON", type = "OI" },
                { name = "D299J", type = "OI" },
                { name = "BND", type = "OI" },
                { name = "D055M", type = "OI" },
            }
        },
        ["MOBO1S"] = {
            name = "MOBO1S",
            runway = "RW03R",
            waypoints = {
                { name = "MOBON", type = "OI" },
                { name = "D299K", type = "OI" },
                { name = "D270K", type = "OI" },
                { name = "CD03R", type = "OI" },
            }
        },
        ["MOBO1X"] = {
            name = "MOBO1X",
            runway = "ALL",
            waypoints = {
                { name = "MOBON", type = "OI" },
                { name = "D299J", type = "OI" },
                { name = "BND", type = "OI" },
            }
        },
        ["TAVN1P"] = {
            name = "TAVN1P",
            runway = "RW21L",
            waypoints = {
                { name = "TAVNO", type = "OI" },
                { name = "D007Y", type = "OI" },
                { name = "D007M", type = "OI" },
                { name = "D055M", type = "OI" },
            }
        },
        ["TAVN1X"] = {
            name = "TAVN1X",
            runway = "ALL",
            waypoints = {
                { name = "TAVNO", type = "OI" },
                { name = "D007Y", type = "OI" },
                { name = "D007M", type = "OI" },
                { name = "BND", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D03R2"] = {
            name = "D03R2",
            type = "D",
            runway = "D03R2",
            waypoints = {
                { name = "CD03R", transition = "", type = "OI", altitude_min = 3000 },
                { name = "FD03R", transition = "", type = "OI", altitude_min = 1500 },
                { name = "BND", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI", altitude_min = 1000 },
                { name = "CD03R", transition = "", type = "OI" },
                { name = "CD03R", transition = "", type = "OI", speed = 220.0 },
            }
        },
        ["D21L1"] = {
            name = "D21L1",
            type = "A",
            runway = "D21L1",
            waypoints = {
                { name = "D055M", transition = "D055M", type = "OI" },
                { name = "", transition = "D055M", type = "" },
                { name = "CD21L", transition = "D055M", type = "OI", altitude_min = 2700, speed = 210.0 },
                { name = "CD21L", transition = "", type = "OI", altitude_min = 2700 },
                { name = "FD21L", transition = "", type = "OI", altitude_min = 1200 },
                { name = "MD21L", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI", altitude_min = 430 },
                { name = "BND", transition = "", type = "OI", altitude_min = 1600 },
                { name = "D055M", transition = "", type = "OI" },
                { name = "D055M", transition = "", type = "OI", speed = 220.0 },
            }
        },
        ["I21L"] = {
            name = "I21L",
            type = "A",
            runway = "I21L",
            waypoints = {
                { name = "BND", transition = "BND", type = "OI", altitude_min = 3000 },
                { name = "BND", transition = "BND", type = "OI", speed = 210.0 },
                { name = "CI21L", transition = "BND", type = "OI" },
                { name = "CI21L", transition = "", type = "OI" },
                { name = "FI21L", transition = "", type = "OI" },
                { name = "RW21L", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI", altitude_min = 1600 },
                { name = "BND", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI", speed = 220.0 },
            }
        },
        ["N03R"] = {
            name = "N03R",
            type = "A",
            runway = "N03R",
            waypoints = {
                { name = "BND", transition = "BND1", type = "OI", altitude_min = 3000 },
                { name = "BND", transition = "BND1", type = "OI" },
                { name = "FN03R", transition = "BND1", type = "OI" },
                { name = "BND", transition = "BND2", type = "OI", altitude_min = 3000 },
                { name = "BND", transition = "BND2", type = "OI" },
                { name = "FN03R", transition = "BND2", type = "OI" },
                { name = "FN03R", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI", altitude_min = 1500 },
                { name = "BND", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI", speed = 210.0 },
            }
        },
        ["N21L"] = {
            name = "N21L",
            type = "A",
            runway = "N21L",
            waypoints = {
                { name = "BND", transition = "BND1", type = "OI", altitude_min = 3000 },
                { name = "BND", transition = "BND1", type = "OI" },
                { name = "FN21L", transition = "BND1", type = "OI" },
                { name = "BND", transition = "BND2", type = "OI", altitude_min = 3000 },
                { name = "BND", transition = "BND2", type = "OI" },
                { name = "FN21L", transition = "BND2", type = "OI" },
                { name = "FN21L", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI", altitude_min = 1500 },
                { name = "BND", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI", speed = 210.0 },
            }
        },
        ["S03R"] = {
            name = "S03R",
            type = "A",
            runway = "S03R",
            waypoints = {
                { name = "BND", transition = "BND", type = "OI", altitude_min = 3000, speed = 210.0 },
                { name = "BND", transition = "BND", type = "OI" },
                { name = "FS03R", transition = "BND", type = "OI" },
                { name = "FS03R", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI", altitude_min = 1700 },
                { name = "BND", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI", speed = 220.0 },
            }
        },
        ["S21L"] = {
            name = "S21L",
            type = "A",
            runway = "S21L",
            waypoints = {
                { name = "BND", transition = "BND", type = "OI", altitude_min = 3000, speed = 210.0 },
                { name = "BND", transition = "BND", type = "OI" },
                { name = "FS21L", transition = "BND", type = "OI" },
                { name = "FS21L", transition = "", type = "OI" },
                { name = "RW21L", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI", altitude_min = 1600 },
                { name = "BND", transition = "", type = "OI" },
                { name = "BND", transition = "", type = "OI", speed = 220.0 },
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
