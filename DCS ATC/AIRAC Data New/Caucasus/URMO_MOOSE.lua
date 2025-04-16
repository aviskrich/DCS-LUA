local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "URMO",
        Name = "URMO Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["MO103"] = { lat = -15.255644444, lon = 11.943452778, type = "FNMO" },
        ["MO205"] = { lat = 43.262691667, lon = 44.830369444, type = "URMO" },
        ["MO208"] = { lat = 43.186016667, lon = 44.734575, type = "URMO" },
        ["D088P"] = { lat = 43.184166667, lon = 44.930277778, type = "URMO" },
        ["MO106"] = { lat = -15.265844444, lon = 12.135980556, type = "FNMO" },
        ["TAFIK"] = { lat = 43.417222222, lon = 43.946944444, type = "ENRT" },
        ["MO201"] = { lat = 43.103641667, lon = 44.787486111, type = "URMO" },
        ["D255L"] = { lat = 66.884869444, lon = -163.047041667, type = "PAOT" },
        ["MO202"] = { lat = 43.136058333, lon = 44.558158333, type = "URMO" },
        ["MO006"] = { lat = 43.224041667, lon = 44.478861111, type = "URMO" },
        ["D266K"] = { lat = 43.217777778, lon = 44.321944444, type = "URMO" },
        ["RW27"] = { lat = 43.322133333, lon = 45.030563889, type = "URMS" },
        ["MO211"] = { lat = 43.192258333, lon = 44.693266667, type = "URMO" },
        ["SD09"] = { lat = 43.211702778, lon = 44.562066667, type = "URMO" },
        ["MO008"] = { lat = 43.154216667, lon = 44.319452778, type = "URMO" },
        ["FN09"] = { lat = 13.855255556, lon = 20.728475, type = "FTTC" },
        ["FN27"] = { lat = 36.977919444, lon = 9.075383333, type = "DTKA" },
        ["MO101"] = { lat = -15.365661111, lon = 11.898625, type = "FNMO" },
        ["MO104"] = { lat = -15.332416667, lon = 11.977766667, type = "FNMO" },
        ["GORAK"] = { lat = 50.006666667, lon = -104.043611111, type = "ENRT" },
        ["MO203"] = { lat = 43.209641667, lon = 44.576602778, type = "URMO" },
        ["MO009"] = { lat = 43.136972222, lon = 44.44015, type = "URMO" },
        ["MA27"] = { lat = 33.927083333, lon = -4.941494444, type = "GMFF" },
        ["D288S"] = { lat = 43.343888889, lon = 44.177222222, type = "URMO" },
        ["CI27Z"] = { lat = 36.075527778, lon = 10.702527778, type = "DTNH" },
        ["D306J"] = { lat = 43.098888889, lon = 44.742222222, type = "URMO" },
        ["D127I"] = { lat = 43.106944444, lon = 44.721388889, type = "URMO" },
        ["MO209"] = { lat = 43.217672222, lon = 44.522341667, type = "URMO" },
        ["MO002"] = { lat = 43.243827778, lon = 44.3433, type = "URMO" },
        ["FI27"] = { lat = 36.972780556, lon = 9.044186111, type = "DTKA" },
        ["CF27Y"] = { lat = 30.317325, lon = -9.200594444, type = "GMAD" },
        ["MO212"] = { lat = 43.279102778, lon = 44.715475, type = "URMO" },
        ["CF09"] = { lat = -3.437352778, lon = 36.890152778, type = "HTKJ" },
        ["MO102"] = { lat = -15.409183333, lon = 12.012108333, type = "FNMO" },
        ["D082O"] = { lat = 43.211111111, lon = 44.911388889, type = "URMO" },
        ["MO005"] = { lat = 43.224502778, lon = 44.476113889, type = "URMO" },
        ["MO105"] = { lat = -15.299144444, lon = 12.056886111, type = "FNMO" },
        ["D276O"] = { lat = 43.263827778, lon = 44.252711111, type = "URMO" },
        ["MO007"] = { lat = 43.186758333, lon = 44.730241667, type = "URMO" },
        ["D285J"] = { lat = 67.515, lon = 86.260555556, type = "UOII" },
        ["MO210"] = { lat = 43.119908333, lon = 44.67285, type = "URMO" },
        ["FI09"] = { lat = 36.075861111, lon = 10.293416667, type = "DTNH" },
        ["ATMAG"] = { lat = 43.434166667, lon = 44.784722222, type = "ENRT" },
        ["RW09"] = { lat = 43.91315, lon = 2.101808333, type = "LFCI" },
        ["D184D"] = { lat = 43.144180556, lon = 44.559233333, type = "URMO" },
        ["MO003"] = { lat = 43.331002778, lon = 44.366405556, type = "URMO" },
        ["MO204"] = { lat = 43.410302778, lon = 44.925238889, type = "URMO" },
        ["MO206"] = { lat = 43.175352778, lon = 44.806433333, type = "URMO" },
        ["SD27"] = { lat = 60.461711111, lon = -145.373977778, type = "PACV" },
        ["MO207"] = { lat = 43.187427778, lon = 44.725691667, type = "URMO" },
        ["MO004"] = { lat = 43.296386111, lon = 44.608433333, type = "URMO" },
    },

    -- Данные ВПП
    Runways = {
        ["RW09"] = {
            heading = 90,
            length = 420.0,
            width = 0,
            threshold = { lat = 43.20784444444445, lon = 44.588661111111115 },
            end = { lat = 43.20784444444445, lon = 44.68349639622725 }
        },
        ["RW27"] = {
            heading = 270,
            length = -420.0,
            width = 0,
            threshold = { lat = 43.202466666666666, lon = 44.62483611111111 },
            end = { lat = 43.202466666666666, lon = 44.71966303627409 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ATMA5A"] = {
            name = "ATMA5A",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 2620 },
                { name = "D184D", type = "P" },
                { name = "CH", type = "D" },
                { name = "ATMAG", type = "E", altitude_min = 8000, altitude_max = 12000 },
            }
        },
        ["ATMA5B"] = {
            name = "ATMA5B",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 2620 },
                { name = "", type = "" },
                { name = "ATMAG", type = "E", altitude_min = 8000, altitude_max = 12000 },
            }
        },
        ["ATMA5C"] = {
            name = "ATMA5C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 2660 },
                { name = "", type = "" },
                { name = "ATMAG", type = "E", altitude_min = 8000, altitude_max = 12000 },
            }
        },
        ["ATMA5D"] = {
            name = "ATMA5D",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 2660 },
                { name = "CH", type = "D" },
                { name = "ATMAG", type = "E", altitude_min = 8000, altitude_max = 12000 },
            }
        },
        ["ATMA5E"] = {
            name = "ATMA5E",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 2620 },
                { name = "CH", type = "D" },
                { name = "", type = "" },
                { name = "ATMAG", type = "E", altitude_min = 8000, altitude_max = 12000 },
            }
        },
        ["ATMA5G"] = {
            name = "ATMA5G",
            runway = "RW09",
            waypoints = {
                { name = "MO101", type = "P", altitude_min = 2620, speed = 245.0 },
                { name = "MO104", type = "P", speed = 245.0 },
                { name = "MO105", type = "P", speed = 245.0 },
                { name = "MO106", type = "P", speed = 245.0 },
                { name = "ATMAG", type = "E", altitude_min = 8000, altitude_max = 12000 },
            }
        },
        ["ATMA5H"] = {
            name = "ATMA5H",
            runway = "RW09",
            waypoints = {
                { name = "MO101", type = "P", altitude_min = 2620, speed = 245.0 },
                { name = "ATMAG", type = "E", altitude_min = 8000, altitude_max = 12000 },
            }
        },
        ["ATMA5J"] = {
            name = "ATMA5J",
            runway = "RW09",
            waypoints = {
                { name = "MO101", type = "P", altitude_min = 2620, speed = 245.0 },
                { name = "MO102", type = "P", speed = 245.0 },
                { name = "ATMAG", type = "E", altitude_min = 8000, altitude_max = 12000 },
            }
        },
        ["ATMA5K"] = {
            name = "ATMA5K",
            runway = "RW27",
            waypoints = {
                { name = "MO103", type = "P", altitude_min = 2660 },
                { name = "ATMAG", type = "E", altitude_min = 8000, altitude_max = 12000 },
            }
        },
        ["ATMA5L"] = {
            name = "ATMA5L",
            runway = "RW27",
            waypoints = {
                { name = "MO103", type = "P", altitude_min = 2660 },
                { name = "MO102", type = "P", altitude_min = 4960 },
                { name = "ATMAG", type = "E", altitude_min = 8000, altitude_max = 12000 },
            }
        },
        ["GORA5A"] = {
            name = "GORA5A",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 2620 },
                { name = "D184D", type = "P" },
                { name = "CH", type = "D" },
                { name = "GORAK", type = "E", altitude_min = 7000 },
            }
        },
        ["GORA5B"] = {
            name = "GORA5B",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 2620 },
                { name = "", type = "" },
                { name = "GORAK", type = "E", altitude_min = 7000 },
            }
        },
        ["GORA5C"] = {
            name = "GORA5C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 2660 },
                { name = "", type = "" },
                { name = "GORAK", type = "E", altitude_min = 7000 },
            }
        },
        ["GORA5D"] = {
            name = "GORA5D",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 2660 },
                { name = "CH", type = "D" },
                { name = "GORAK", type = "E", altitude_min = 7000 },
            }
        },
        ["GORA5G"] = {
            name = "GORA5G",
            runway = "RW09",
            waypoints = {
                { name = "MO101", type = "P", altitude_min = 2620, speed = 245.0 },
                { name = "MO104", type = "P", speed = 245.0 },
                { name = "MO105", type = "P", speed = 245.0 },
                { name = "MO106", type = "P", speed = 245.0 },
                { name = "GORAK", type = "E", altitude_min = 7000 },
            }
        },
        ["GORA5H"] = {
            name = "GORA5H",
            runway = "RW09",
            waypoints = {
                { name = "MO101", type = "P", altitude_min = 2620, speed = 245.0 },
                { name = "GORAK", type = "E", altitude_min = 7000 },
            }
        },
        ["GORA5K"] = {
            name = "GORA5K",
            runway = "RW27",
            waypoints = {
                { name = "MO103", type = "P", altitude_min = 2660 },
                { name = "GORAK", type = "E", altitude_min = 7000 },
            }
        },
        ["GORA5L"] = {
            name = "GORA5L",
            runway = "RW27",
            waypoints = {
                { name = "MO103", type = "P", altitude_min = 2660 },
                { name = "MO102", type = "P", altitude_min = 4960 },
                { name = "GORAK", type = "E", altitude_min = 7000 },
            }
        },
        ["TAFI5A"] = {
            name = "TAFI5A",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 2620 },
                { name = "CH", type = "D" },
                { name = "TAFIK", type = "E", altitude_min = 8000 },
            }
        },
        ["TAFI5B"] = {
            name = "TAFI5B",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 2620 },
                { name = "", type = "" },
                { name = "TAFIK", type = "E", altitude_min = 8000 },
            }
        },
        ["TAFI5C"] = {
            name = "TAFI5C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 2660 },
                { name = "", type = "" },
                { name = "TAFIK", type = "E", altitude_min = 8000 },
            }
        },
        ["TAFI5G"] = {
            name = "TAFI5G",
            runway = "RW09",
            waypoints = {
                { name = "MO101", type = "P", altitude_min = 2620, speed = 245.0 },
                { name = "MO104", type = "P", speed = 245.0 },
                { name = "MO105", type = "P", speed = 245.0 },
                { name = "TAFIK", type = "E", altitude_min = 8000, speed = 245.0 },
            }
        },
        ["TAFI5H"] = {
            name = "TAFI5H",
            runway = "RW09",
            waypoints = {
                { name = "MO101", type = "P", altitude_min = 2620, speed = 245.0 },
                { name = "TAFIK", type = "E", altitude_min = 8000 },
            }
        },
        ["TAFI5K"] = {
            name = "TAFI5K",
            runway = "RW27",
            waypoints = {
                { name = "MO103", type = "P", altitude_min = 2660 },
                { name = "TAFIK", type = "E", altitude_min = 8000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ATMA5Q"] = {
            name = "ATMA5Q",
            runway = "",
            waypoints = {
                { name = "ATMAG", type = "UR", altitude_min = 7000, altitude_max = 13000 },
                { name = "ATMAG", type = "UR", altitude_min = 7000, altitude_max = 13000 },
                { name = "CH", type = "UR", altitude_min = 5250 },
                { name = "ATMAG", type = "UR", altitude_min = 7000, altitude_max = 13000 },
                { name = "CH", type = "UR", altitude_min = 5290 },
            }
        },
        ["ATMA5S"] = {
            name = "ATMA5S",
            runway = "RW09",
            waypoints = {
                { name = "ATMAG", type = "UR", altitude_min = 7000, altitude_max = 13000 },
                { name = "MO004", type = "UR" },
                { name = "MO003", type = "UR", altitude_min = 5080 },
            }
        },
        ["ATMA5T"] = {
            name = "ATMA5T",
            runway = "RW27",
            waypoints = {
                { name = "ATMAG", type = "UR", altitude_min = 7000, altitude_max = 13000 },
                { name = "MO203", type = "UR" },
                { name = "MO202", type = "UR", altitude_min = 4630 },
                { name = "MO210", type = "UR" },
                { name = "MO201", type = "UR", speed = 225.0 },
            }
        },
        ["ATMA5U"] = {
            name = "ATMA5U",
            runway = "RW27",
            waypoints = {
                { name = "ATMAG", type = "UR", altitude_min = 7000, altitude_max = 13000 },
                { name = "MO205", type = "UR", altitude_min = 4630 },
            }
        },
        ["GORA5Q"] = {
            name = "GORA5Q",
            runway = "",
            waypoints = {
                { name = "GORAK", type = "UR", altitude_min = 8000 },
                { name = "GORAK", type = "UR", altitude_min = 8000 },
                { name = "CH", type = "UR", altitude_min = 5250 },
                { name = "GORAK", type = "UR", altitude_min = 8000 },
                { name = "CH", type = "UR", altitude_min = 5290 },
            }
        },
        ["GORA5S"] = {
            name = "GORA5S",
            runway = "RW09",
            waypoints = {
                { name = "GORAK", type = "UR", altitude_min = 8000 },
                { name = "MO004", type = "UR" },
                { name = "MO003", type = "UR", altitude_min = 5080 },
            }
        },
        ["GORA5T"] = {
            name = "GORA5T",
            runway = "RW27",
            waypoints = {
                { name = "GORAK", type = "UR", altitude_min = 8000 },
                { name = "MO204", type = "UR" },
                { name = "MO203", type = "UR" },
                { name = "MO202", type = "UR", altitude_min = 4630 },
                { name = "MO210", type = "UR" },
                { name = "MO201", type = "UR", speed = 225.0 },
            }
        },
        ["GORA5U"] = {
            name = "GORA5U",
            runway = "RW27",
            waypoints = {
                { name = "GORAK", type = "UR", altitude_min = 8000 },
                { name = "MO204", type = "UR" },
                { name = "MO205", type = "UR", altitude_min = 4630 },
            }
        },
        ["TAFI5Q"] = {
            name = "TAFI5Q",
            runway = "",
            waypoints = {
                { name = "TAFIK", type = "UR", altitude_min = 11000, altitude_max = 23000 },
                { name = "TAFIK", type = "UR", altitude_min = 11000, altitude_max = 23000 },
                { name = "CH", type = "UR", altitude_min = 5250 },
                { name = "TAFIK", type = "UR", altitude_min = 11000, altitude_max = 23000 },
                { name = "CH", type = "UR", altitude_min = 5290 },
            }
        },
        ["TAFI5R"] = {
            name = "TAFI5R",
            runway = "ALL",
            waypoints = {
                { name = "TAFIK", type = "UR", altitude_min = 11000, altitude_max = 23000 },
                { name = "D288S", type = "UR" },
            }
        },
        ["TAFI5S"] = {
            name = "TAFI5S",
            runway = "RW09",
            waypoints = {
                { name = "TAFIK", type = "UR", altitude_min = 11000, altitude_max = 23000 },
                { name = "MO002", type = "UR" },
            }
        },
        ["TAFI5T"] = {
            name = "TAFI5T",
            runway = "RW27",
            waypoints = {
                { name = "TAFIK", type = "UR", altitude_min = 11000, altitude_max = 23000 },
                { name = "MO202", type = "UR", altitude_min = 4630 },
                { name = "MO210", type = "UR" },
                { name = "MO201", type = "UR", speed = 225.0 },
            }
        },
        ["TAFI5U"] = {
            name = "TAFI5U",
            runway = "RW27",
            waypoints = {
                { name = "TAFIK", type = "UR", altitude_min = 11000, altitude_max = 23000 },
                { name = "MO205", type = "UR", altitude_min = 4630 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I09-Y"] = {
            name = "I09-Y",
            type = "A",
            runway = "I09-Y",
            waypoints = {
                { name = "MO002", transition = "MO002", type = "UR" },
                { name = "MO003", transition = "MO003", type = "UR", altitude_min = 5080 },
                { name = "MO002", transition = "MO003", type = "UR" },
                { name = "MO002", transition = "", type = "UR" },
                { name = "FI09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "MO007", transition = "", type = "UR", altitude_min = 2620 },
                { name = "MO009", transition = "", type = "UR" },
                { name = "MO008", transition = "", type = "UR" },
                { name = "MO002", transition = "", type = "UR" },
            }
        },
        ["I09-Z"] = {
            name = "I09-Z",
            type = "A",
            runway = "I09-Z",
            waypoints = {
                { name = "CH", transition = "CH1", type = "UR", altitude_min = 4590 },
                { name = "D255L", transition = "CH1", type = "UR", speed = 225.0 },
                { name = "CF09", transition = "CH1", type = "UR" },
                { name = "CH", transition = "CH2", type = "UR", altitude_min = 4590 },
                { name = "D266K", transition = "CH2", type = "UR", speed = 140.0 },
                { name = "CF09", transition = "CH2", type = "UR" },
                { name = "D288S", transition = "D288S", type = "UR" },
                { name = "D276O", transition = "D288S", type = "UR", altitude_min = 4590 },
                { name = "CF09", transition = "D288S", type = "UR" },
                { name = "CF09", transition = "", type = "UR" },
                { name = "FI09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2620 },
                { name = "", transition = "", type = "" },
            }
        },
        ["I27-W"] = {
            name = "I27-W",
            type = "A",
            runway = "I27-W",
            waypoints = {
                { name = "MO205", transition = "MO205", type = "UR", altitude_min = 4630, speed = 225.0 },
                { name = "MO206", transition = "MO205", type = "UR", speed = 195.0 },
                { name = "MO206", transition = "", type = "UR", speed = 195.0 },
                { name = "FI27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "MO209", transition = "", type = "UR", altitude_min = 2660 },
                { name = "MO212", transition = "", type = "UR" },
                { name = "MO205", transition = "", type = "UR", speed = 225.0 },
            }
        },
        ["I27-X"] = {
            name = "I27-X",
            type = "A",
            runway = "I27-X",
            waypoints = {
                { name = "MO201", transition = "MO201", type = "UR", speed = 225.0 },
                { name = "MO206", transition = "MO201", type = "UR", speed = 195.0 },
                { name = "MO206", transition = "", type = "UR", speed = 195.0 },
                { name = "FI27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "MO209", transition = "", type = "UR", altitude_min = 2660 },
                { name = "MO210", transition = "", type = "UR" },
                { name = "MO201", transition = "", type = "UR", speed = 225.0 },
            }
        },
        ["I27-Y"] = {
            name = "I27-Y",
            type = "A",
            runway = "I27-Y",
            waypoints = {
                { name = "CH", transition = "CH1", type = "UR", altitude_min = 5290 },
                { name = "D082O", transition = "CH1", type = "UR", speed = 195.0 },
                { name = "CF27Y", transition = "CH1", type = "UR" },
                { name = "CH", transition = "CH2", type = "UR", altitude_min = 5290 },
                { name = "D088P", transition = "CH2", type = "UR", speed = 130.0 },
                { name = "CF27Y", transition = "CH2", type = "UR" },
                { name = "CF27Y", transition = "", type = "UR" },
                { name = "FI27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "CH", transition = "", type = "UR", altitude_min = 2080 },
                { name = "", transition = "", type = "", altitude_min = 2990 },
                { name = "CH", transition = "", type = "UR" },
            }
        },
        ["I27-Z"] = {
            name = "I27-Z",
            type = "A",
            runway = "I27-Z",
            waypoints = {
                { name = "CH", transition = "CH", type = "UR", altitude_min = 5290 },
                { name = "D127I", transition = "CH", type = "UR", speed = 195.0 },
                { name = "D285J", transition = "CH", type = "UR", speed = 195.0 },
                { name = "CI27Z", transition = "CH", type = "UR" },
                { name = "CI27Z", transition = "", type = "UR" },
                { name = "FI27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2660 },
                { name = "D306J", transition = "", type = "UR", speed = 195.0 },
            }
        },
        ["J09"] = {
            name = "J09",
            type = "A",
            runway = "J09",
            waypoints = {
                { name = "MO002", transition = "MO002", type = "UR" },
                { name = "MO003", transition = "MO003", type = "UR", altitude_min = 5080 },
                { name = "MO002", transition = "MO003", type = "UR" },
                { name = "MO002", transition = "", type = "UR" },
                { name = "MO006", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "MO007", transition = "", type = "UR", altitude_min = 2620 },
                { name = "MO009", transition = "", type = "UR" },
                { name = "MO008", transition = "", type = "UR" },
                { name = "MO002", transition = "", type = "UR" },
            }
        },
        ["J27-Y"] = {
            name = "J27-Y",
            type = "A",
            runway = "J27-Y",
            waypoints = {
                { name = "MO205", transition = "MO205", type = "UR", altitude_min = 4630, speed = 225.0 },
                { name = "MO206", transition = "MO205", type = "UR", speed = 195.0 },
                { name = "MO206", transition = "", type = "UR" },
                { name = "MO208", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "MO209", transition = "", type = "UR", altitude_min = 2660 },
                { name = "MO212", transition = "", type = "UR" },
                { name = "MO205", transition = "", type = "UR", speed = 225.0 },
            }
        },
        ["J27-Z"] = {
            name = "J27-Z",
            type = "A",
            runway = "J27-Z",
            waypoints = {
                { name = "MO201", transition = "MO201", type = "UR", speed = 225.0 },
                { name = "MO206", transition = "MO201", type = "UR", speed = 195.0 },
                { name = "MO206", transition = "", type = "UR" },
                { name = "MO208", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "MO209", transition = "", type = "UR", altitude_min = 2660 },
                { name = "MO210", transition = "", type = "UR" },
                { name = "MO201", transition = "", type = "UR", speed = 225.0 },
            }
        },
        ["N09"] = {
            name = "N09",
            type = "A",
            runway = "N09",
            waypoints = {
                { name = "CH", transition = "CH1", type = "UR", altitude_min = 5250 },
                { name = "D255L", transition = "CH1", type = "UR", speed = 225.0 },
                { name = "CF09", transition = "CH1", type = "UR" },
                { name = "CH", transition = "CH2", type = "UR", altitude_min = 5250 },
                { name = "D266K", transition = "CH2", type = "UR", speed = 140.0 },
                { name = "CF09", transition = "CH2", type = "UR" },
                { name = "D288S", transition = "D288S", type = "UR" },
                { name = "D276O", transition = "D288S", type = "UR", altitude_min = 4590 },
                { name = "CF09", transition = "D288S", type = "UR" },
                { name = "CF09", transition = "", type = "UR" },
                { name = "FN09", transition = "", type = "UR" },
                { name = "SD09", transition = "", type = "UR" },
                { name = "CH", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2620 },
                { name = "", transition = "", type = "" },
            }
        },
        ["N27-Y"] = {
            name = "N27-Y",
            type = "A",
            runway = "N27-Y",
            waypoints = {
                { name = "CH", transition = "CH1", type = "UR", altitude_min = 5290 },
                { name = "D082O", transition = "CH1", type = "UR", speed = 195.0 },
                { name = "CF27Y", transition = "CH1", type = "UR" },
                { name = "CH", transition = "CH2", type = "UR", altitude_min = 5290 },
                { name = "D088P", transition = "CH2", type = "UR", speed = 130.0 },
                { name = "CF27Y", transition = "CH2", type = "UR" },
                { name = "CF27Y", transition = "", type = "UR" },
                { name = "FN27", transition = "", type = "UR" },
                { name = "SD27", transition = "", type = "UR" },
                { name = "MA27", transition = "", type = "UR" },
                { name = "CH", transition = "", type = "UR", altitude_min = 2080 },
                { name = "", transition = "", type = "", altitude_min = 2990 },
                { name = "CH", transition = "", type = "UR" },
            }
        },
        ["N27-Z"] = {
            name = "N27-Z",
            type = "A",
            runway = "N27-Z",
            waypoints = {
                { name = "CH", transition = "CH", type = "UR", altitude_min = 5290 },
                { name = "D127I", transition = "CH", type = "UR", speed = 195.0 },
                { name = "D285J", transition = "CH", type = "UR", speed = 195.0 },
                { name = "FN27", transition = "CH", type = "UR" },
                { name = "FN27", transition = "", type = "UR" },
                { name = "SD27", transition = "", type = "UR" },
                { name = "MA27", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2660 },
                { name = "D306J", transition = "", type = "UR", speed = 195.0 },
            }
        },
        ["R09"] = {
            name = "R09",
            type = "A",
            runway = "R09",
            waypoints = {
                { name = "MO002", transition = "MO002", type = "UR" },
                { name = "MO003", transition = "MO003", type = "UR", altitude_min = 5080 },
                { name = "MO002", transition = "MO003", type = "UR" },
                { name = "MO002", transition = "", type = "UR" },
                { name = "MO005", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "MO007", transition = "", type = "UR", altitude_min = 2620 },
                { name = "MO009", transition = "", type = "UR" },
                { name = "MO008", transition = "", type = "UR" },
                { name = "MO002", transition = "", type = "UR" },
            }
        },
        ["R27-Y"] = {
            name = "R27-Y",
            type = "A",
            runway = "R27-Y",
            waypoints = {
                { name = "MO205", transition = "MO205", type = "UR", altitude_min = 4630, speed = 225.0 },
                { name = "MO206", transition = "MO205", type = "UR", speed = 195.0 },
                { name = "MO206", transition = "", type = "UR" },
                { name = "MO207", transition = "", type = "UR" },
                { name = "MO211", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "MO209", transition = "", type = "UR", altitude_min = 2660 },
                { name = "MO212", transition = "", type = "UR" },
                { name = "MO205", transition = "", type = "UR", speed = 225.0 },
            }
        },
        ["R27-Z"] = {
            name = "R27-Z",
            type = "A",
            runway = "R27-Z",
            waypoints = {
                { name = "MO201", transition = "MO201", type = "UR", speed = 225.0 },
                { name = "MO206", transition = "MO201", type = "UR", speed = 195.0 },
                { name = "MO206", transition = "", type = "UR" },
                { name = "MO207", transition = "", type = "UR" },
                { name = "MO211", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "MO209", transition = "", type = "UR", altitude_min = 2660 },
                { name = "MO210", transition = "", type = "UR" },
                { name = "MO201", transition = "", type = "UR", speed = 225.0 },
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
