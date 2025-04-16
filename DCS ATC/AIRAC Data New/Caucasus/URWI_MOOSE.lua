local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "URWI",
        Name = "URWI Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["WI102"] = { lat = 46.238736111, lon = 44.535008333, type = "URWI" },
        ["BEFOM"] = { lat = 46.993333333, lon = 44.0075, type = "ENRT" },
        ["WI201"] = { lat = 46.362622222, lon = 44.450291667, type = "URWI" },
        ["WI005"] = { lat = 46.496580556, lon = 44.097072222, type = "URWI" },
        ["WI007"] = { lat = 46.088319444, lon = 44.322816667, type = "URWI" },
        ["FD27"] = { lat = 36.686708333, lon = 3.364586111, type = "DAAG" },
        ["BURUT"] = { lat = 46.8425, lon = 44.565833333, type = "ENRT" },
        ["WI305"] = { lat = 46.185388889, lon = 44.173630556, type = "URWI" },
        ["WI006"] = { lat = 46.484455556, lon = 44.226133333, type = "URWI" },
        ["WI206"] = { lat = 46.462069444, lon = 44.460375, type = "URWI" },
        ["WI008"] = { lat = 46.617008333, lon = 44.259297222, type = "URWI" },
        ["KISEL"] = { lat = 46.003055556, lon = 43.671666667, type = "ENRT" },
        ["WI202"] = { lat = 46.351133333, lon = 44.570027778, type = "URWI" },
        ["SUFOR"] = { lat = 46.408611111, lon = 45.493055556, type = "ENRT" },
        ["RW27"] = { lat = 43.322133333, lon = 45.030563889, type = "URMS" },
        ["FQ27"] = { lat = 46.3625, lon = 44.450277778, type = "URWI" },
        ["GUBTA"] = { lat = 46.163055556, lon = 43.411666667, type = "ENRT" },
        ["WI100"] = { lat = 46.355288889, lon = 44.526788889, type = "URWI" },
        ["WI103"] = { lat = 46.658852778, lon = 44.343627778, type = "URWI" },
        ["WI301"] = { lat = 46.545119444, lon = 44.070508333, type = "URWI" },
        ["WI303"] = { lat = 46.660688889, lon = 44.211263889, type = "URWI" },
        ["WI004"] = { lat = 46.298669444, lon = 44.058397222, type = "URWI" },
        ["LUTIN"] = { lat = 46.029722222, lon = 45.035277778, type = "ENRT" },
        ["WI209"] = { lat = 46.362619444, lon = 44.449663889, type = "URWI" },
        ["FD09"] = { lat = 36.172252778, lon = 5.185822222, type = "DAAS" },
        ["WI101"] = { lat = 46.453405556, lon = 44.609080556, type = "URWI" },
        ["TIKNA"] = { lat = 46.479722222, lon = 43.263333333, type = "ENRT" },
        ["WI205"] = { lat = 46.450088889, lon = 44.589383333, type = "URWI" },
        ["SOREG"] = { lat = 45.908055556, lon = 43.995277778, type = "ENRT" },
        ["WI207"] = { lat = 46.168211111, lon = 44.250902778, type = "URWI" },
        ["WI203"] = { lat = 46.337663889, lon = 44.7129, type = "URWI" },
        ["WI002"] = { lat = 46.397627778, lon = 44.0777, type = "URWI" },
        ["SA"] = { lat = 41.258166667, lon = -8.682555556, type = "DME", frequency = 109.9, elevation = 200.0, name = "FRANCISCO", range = 25.0 },
        ["WI302"] = { lat = 46.651372222, lon = 43.980519444, type = "URWI" },
        ["CF09"] = { lat = -3.437352778, lon = 36.890152778, type = "HTKJ" },
        ["D120L"] = { lat = 14.868861111, lon = -23.288611111, type = "GVNP" },
        ["CI09"] = { lat = 36.697369444, lon = 2.936127778, type = "DAAG" },
        ["D100L"] = { lat = 46.4262, lon = 44.061791667, type = "URWI" },
        ["BAKAM"] = { lat = 46.943333333, lon = 43.631111111, type = "ENRT" },
        ["WI010"] = { lat = 46.386291667, lon = 44.198955556, type = "URWI" },
        ["WI304"] = { lat = 46.291252778, lon = 43.965547222, type = "URWI" },
        ["FQ09"] = { lat = 49.166208333, lon = 16.503744444, type = "LKTB" },
        ["WI001"] = { lat = 46.386486111, lon = 44.197577778, type = "URWI" },
        ["WI009"] = { lat = 46.386363889, lon = 44.198180556, type = "URWI" },
        ["WI204"] = { lat = 46.252172222, lon = 44.550741667, type = "URWI" },
        ["RW09"] = { lat = 43.91315, lon = 2.101808333, type = "LFCI" },
        ["WI003"] = { lat = 46.410916667, lon = 43.934636111, type = "URWI" },
        ["FF09"] = { lat = 33.872588889, lon = 10.663594444, type = "DTTJ" },
        ["BAGON"] = { lat = 46.941111111, lon = 44.3525, type = "ENRT" },
        ["AKTUR"] = { lat = 45.649722222, lon = 44.865277778, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW09"] = {
            heading = 90,
            length = 0,
            width = 0,
            threshold = { lat = 46.376555555555555, lon = 44.30327777777777 },
            end = { lat = 46.376555555555555, lon = 44.30327777777777 }
        },
        ["RW27"] = {
            heading = 270,
            length = 0,
            width = 0,
            threshold = { lat = 46.37266666666667, lon = 44.34447222222222 },
            end = { lat = 46.37266666666667, lon = 44.34447222222222 }
        },
    },

    -- Процедуры SID
    SID = {
        ["AKTU1B"] = {
            name = "AKTU1B",
            runway = "RW09",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "AKTUR", type = "E", altitude_min = 5000 },
            }
        },
        ["AKTU1C"] = {
            name = "AKTU1C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "" },
                { name = "ELI", type = "D", speed = 225.0 },
                { name = "AKTUR", type = "E", altitude_min = 5000 },
            }
        },
        ["AKTU1F"] = {
            name = "AKTU1F",
            runway = "RW09",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "AKTUR", type = "E", altitude_min = 5000 },
            }
        },
        ["AKTU1G"] = {
            name = "AKTU1G",
            runway = "RW27",
            waypoints = {
                { name = "", type = "" },
                { name = "SA", type = "D", speed = 225.0 },
                { name = "AKTUR", type = "E", altitude_min = 5000 },
            }
        },
        ["AKTU1H"] = {
            name = "AKTU1H",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "WI305", type = "P" },
                { name = "AKTUR", type = "E", altitude_min = 5000 },
            }
        },
        ["AKTU1J"] = {
            name = "AKTU1J",
            runway = "RW09",
            waypoints = {
                { name = "WI100", type = "P" },
                { name = "AKTUR", type = "E", altitude_min = 5000 },
            }
        },
        ["BAGO1B"] = {
            name = "BAGO1B",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BAGON", type = "E", altitude_min = 9000 },
            }
        },
        ["BAGO1C"] = {
            name = "BAGO1C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BAGON", type = "E", altitude_min = 9000 },
            }
        },
        ["BAGO1F"] = {
            name = "BAGO1F",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BAGON", type = "E", altitude_min = 9000 },
            }
        },
        ["BAGO1G"] = {
            name = "BAGO1G",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BAGON", type = "E", altitude_min = 9000 },
            }
        },
        ["BAGO1H"] = {
            name = "BAGO1H",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "WI301", type = "P" },
                { name = "WI303", type = "P" },
                { name = "BAGON", type = "E", altitude_min = 9000 },
            }
        },
        ["BAGO1J"] = {
            name = "BAGO1J",
            runway = "RW09",
            waypoints = {
                { name = "WI100", type = "P" },
                { name = "WI101", type = "P" },
                { name = "WI103", type = "P" },
                { name = "BAGON", type = "E", altitude_min = 9000 },
            }
        },
        ["BAKA1B"] = {
            name = "BAKA1B",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BAKAM", type = "E", altitude_min = 12000 },
            }
        },
        ["BAKA1C"] = {
            name = "BAKA1C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BAKAM", type = "E", altitude_min = 12000 },
            }
        },
        ["BAKA1F"] = {
            name = "BAKA1F",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BAKAM", type = "E", altitude_min = 12000 },
            }
        },
        ["BAKA1G"] = {
            name = "BAKA1G",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "BAKAM", type = "E", altitude_min = 12000 },
            }
        },
        ["BAKA1H"] = {
            name = "BAKA1H",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "WI301", type = "P" },
                { name = "WI302", type = "P" },
                { name = "BAKAM", type = "E", altitude_min = 12000 },
            }
        },
        ["BAKA1J"] = {
            name = "BAKA1J",
            runway = "RW09",
            waypoints = {
                { name = "WI100", type = "P" },
                { name = "WI101", type = "P" },
                { name = "WI103", type = "P" },
                { name = "BAKAM", type = "E", altitude_min = 12000 },
            }
        },
        ["BEFO1B"] = {
            name = "BEFO1B",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BEFOM", type = "E", altitude_min = 9000 },
            }
        },
        ["BEFO1C"] = {
            name = "BEFO1C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BEFOM", type = "E", altitude_min = 9000 },
            }
        },
        ["BEFO1F"] = {
            name = "BEFO1F",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BEFOM", type = "E", altitude_min = 9000 },
            }
        },
        ["BEFO1G"] = {
            name = "BEFO1G",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BEFOM", type = "E", altitude_min = 9000 },
            }
        },
        ["BEFO1H"] = {
            name = "BEFO1H",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "WI301", type = "P" },
                { name = "WI302", type = "P" },
                { name = "BEFOM", type = "E", altitude_min = 9000 },
            }
        },
        ["BEFO1J"] = {
            name = "BEFO1J",
            runway = "RW09",
            waypoints = {
                { name = "WI100", type = "P" },
                { name = "WI101", type = "P" },
                { name = "WI103", type = "P" },
                { name = "BEFOM", type = "E", altitude_min = 9000 },
            }
        },
        ["BURU1B"] = {
            name = "BURU1B",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BURUT", type = "E", altitude_min = 7000 },
            }
        },
        ["BURU1C"] = {
            name = "BURU1C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BURUT", type = "E", altitude_min = 7000 },
            }
        },
        ["BURU1F"] = {
            name = "BURU1F",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BURUT", type = "E", altitude_min = 7000 },
            }
        },
        ["BURU1G"] = {
            name = "BURU1G",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 900 },
                { name = "", type = "" },
                { name = "BURUT", type = "E", altitude_min = 7000 },
            }
        },
        ["BURU1H"] = {
            name = "BURU1H",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "WI301", type = "P" },
                { name = "WI303", type = "P" },
                { name = "BURUT", type = "E", altitude_min = 7000 },
            }
        },
        ["BURU1J"] = {
            name = "BURU1J",
            runway = "RW09",
            waypoints = {
                { name = "WI100", type = "P" },
                { name = "WI101", type = "P" },
                { name = "BURUT", type = "E", altitude_min = 7000 },
            }
        },
        ["GUBT1B"] = {
            name = "GUBT1B",
            runway = "RW09",
            waypoints = {
                { name = "", type = "" },
                { name = "ELI", type = "D", speed = 225.0 },
                { name = "GUBTA", type = "E", altitude_min = 10000 },
            }
        },
        ["GUBT1C"] = {
            name = "GUBT1C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "GUBTA", type = "E", altitude_min = 10000 },
            }
        },
        ["GUBT1F"] = {
            name = "GUBT1F",
            runway = "RW09",
            waypoints = {
                { name = "", type = "" },
                { name = "SA", type = "D", speed = 225.0 },
                { name = "GUBTA", type = "E", altitude_min = 10000 },
            }
        },
        ["GUBT1G"] = {
            name = "GUBT1G",
            runway = "RW27",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "GUBTA", type = "E", altitude_min = 10000 },
            }
        },
        ["GUBT1H"] = {
            name = "GUBT1H",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "WI304", type = "P" },
                { name = "GUBTA", type = "E", altitude_min = 10000 },
            }
        },
        ["GUBT1J"] = {
            name = "GUBT1J",
            runway = "RW09",
            waypoints = {
                { name = "WI100", type = "P" },
                { name = "WI102", type = "P" },
                { name = "GUBTA", type = "E", altitude_min = 10000 },
            }
        },
        ["KISE1B"] = {
            name = "KISE1B",
            runway = "RW09",
            waypoints = {
                { name = "", type = "" },
                { name = "ELI", type = "D", speed = 225.0 },
                { name = "KISEL", type = "E", altitude_min = 6000 },
            }
        },
        ["KISE1C"] = {
            name = "KISE1C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "KISEL", type = "E", altitude_min = 6000 },
            }
        },
        ["KISE1F"] = {
            name = "KISE1F",
            runway = "RW09",
            waypoints = {
                { name = "", type = "" },
                { name = "SA", type = "D", speed = 225.0 },
                { name = "KISEL", type = "E", altitude_min = 6000 },
            }
        },
        ["KISE1G"] = {
            name = "KISE1G",
            runway = "RW27",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "KISEL", type = "E", altitude_min = 6000 },
            }
        },
        ["KISE1H"] = {
            name = "KISE1H",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "WI304", type = "P" },
                { name = "KISEL", type = "E", altitude_min = 6000 },
            }
        },
        ["KISE1J"] = {
            name = "KISE1J",
            runway = "RW09",
            waypoints = {
                { name = "WI100", type = "P" },
                { name = "WI102", type = "P" },
                { name = "KISEL", type = "E", altitude_min = 6000 },
            }
        },
        ["LUTI1B"] = {
            name = "LUTI1B",
            runway = "RW09",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "LUTIN", type = "E", altitude_min = 7000 },
            }
        },
        ["LUTI1C"] = {
            name = "LUTI1C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "" },
                { name = "ELI", type = "D", speed = 225.0 },
                { name = "LUTIN", type = "E", altitude_min = 7000 },
            }
        },
        ["LUTI1F"] = {
            name = "LUTI1F",
            runway = "RW09",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "LUTIN", type = "E", altitude_min = 7000 },
            }
        },
        ["LUTI1G"] = {
            name = "LUTI1G",
            runway = "RW27",
            waypoints = {
                { name = "", type = "" },
                { name = "SA", type = "D", speed = 225.0 },
                { name = "LUTIN", type = "E", altitude_min = 7000 },
            }
        },
        ["LUTI1H"] = {
            name = "LUTI1H",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "WI305", type = "P" },
                { name = "LUTIN", type = "E", altitude_min = 7000 },
            }
        },
        ["LUTI1J"] = {
            name = "LUTI1J",
            runway = "RW09",
            waypoints = {
                { name = "WI100", type = "P" },
                { name = "LUTIN", type = "E", altitude_min = 7000 },
            }
        },
        ["SORE1B"] = {
            name = "SORE1B",
            runway = "RW09",
            waypoints = {
                { name = "", type = "" },
                { name = "ELI", type = "D", speed = 225.0 },
                { name = "SOREG", type = "E", altitude_min = 16000 },
            }
        },
        ["SORE1C"] = {
            name = "SORE1C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "" },
                { name = "ELI", type = "D", speed = 225.0 },
                { name = "SOREG", type = "E", altitude_min = 16000 },
            }
        },
        ["SORE1F"] = {
            name = "SORE1F",
            runway = "RW09",
            waypoints = {
                { name = "", type = "" },
                { name = "SA", type = "D", speed = 225.0 },
                { name = "SOREG", type = "E", altitude_min = 16000 },
            }
        },
        ["SORE1G"] = {
            name = "SORE1G",
            runway = "RW27",
            waypoints = {
                { name = "", type = "" },
                { name = "SA", type = "D", speed = 225.0 },
                { name = "SOREG", type = "E", altitude_min = 16000 },
            }
        },
        ["SORE1H"] = {
            name = "SORE1H",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "WI305", type = "P" },
                { name = "SOREG", type = "E", altitude_min = 16000 },
            }
        },
        ["SORE1J"] = {
            name = "SORE1J",
            runway = "RW09",
            waypoints = {
                { name = "WI100", type = "P" },
                { name = "WI102", type = "P" },
                { name = "SOREG", type = "E", altitude_min = 16000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["AKTU1A"] = {
            name = "AKTU1A",
            runway = "",
            waypoints = {
                { name = "AKTUR", type = "UR", altitude_min = 6000 },
                { name = "AKTUR", type = "UR", altitude_min = 6000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
                { name = "AKTUR", type = "UR", altitude_min = 6000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
            }
        },
        ["AKTU1D"] = {
            name = "AKTU1D",
            runway = "",
            waypoints = {
                { name = "AKTUR", type = "UR", altitude_min = 6000 },
                { name = "AKTUR", type = "UR", altitude_min = 6000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
                { name = "AKTUR", type = "UR", altitude_min = 6000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
            }
        },
        ["AKTU1E"] = {
            name = "AKTU1E",
            runway = "RW27",
            waypoints = {
                { name = "AKTUR", type = "UR", altitude_min = 6000 },
                { name = "WI203", type = "UR", altitude_min = 3000 },
            }
        },
        ["AKTU1K"] = {
            name = "AKTU1K",
            runway = "RW09",
            waypoints = {
                { name = "AKTUR", type = "UR", altitude_min = 6000 },
                { name = "WI007", type = "UR" },
                { name = "WI004", type = "UR", altitude_min = 3000 },
            }
        },
        ["BAGO1A"] = {
            name = "BAGO1A",
            runway = "",
            waypoints = {
                { name = "BAGON", type = "UR", altitude_min = 10000 },
                { name = "BAGON", type = "UR", altitude_min = 10000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
                { name = "BAGON", type = "UR", altitude_min = 10000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
            }
        },
        ["BAGO1D"] = {
            name = "BAGO1D",
            runway = "",
            waypoints = {
                { name = "BAGON", type = "UR", altitude_min = 10000 },
                { name = "BAGON", type = "UR", altitude_min = 10000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
                { name = "BAGON", type = "UR", altitude_min = 10000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
            }
        },
        ["BAGO1E"] = {
            name = "BAGO1E",
            runway = "RW27",
            waypoints = {
                { name = "BAGON", type = "UR", altitude_min = 10000 },
                { name = "WI205", type = "UR", altitude_min = 3000 },
            }
        },
        ["BAGO1K"] = {
            name = "BAGO1K",
            runway = "RW09",
            waypoints = {
                { name = "BAGON", type = "UR", altitude_min = 10000 },
                { name = "WI005", type = "UR", altitude_min = 3000 },
            }
        },
        ["BEFO1A"] = {
            name = "BEFO1A",
            runway = "",
            waypoints = {
                { name = "BEFOM", type = "UR", altitude_min = 10000 },
                { name = "BEFOM", type = "UR", altitude_min = 10000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
                { name = "BEFOM", type = "UR", altitude_min = 10000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
            }
        },
        ["BEFO1D"] = {
            name = "BEFO1D",
            runway = "",
            waypoints = {
                { name = "BEFOM", type = "UR", altitude_min = 10000 },
                { name = "BEFOM", type = "UR", altitude_min = 10000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
                { name = "BEFOM", type = "UR", altitude_min = 10000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
            }
        },
        ["BEFO1E"] = {
            name = "BEFO1E",
            runway = "RW27",
            waypoints = {
                { name = "BEFOM", type = "UR", altitude_min = 10000 },
                { name = "WI205", type = "UR", altitude_min = 3000 },
            }
        },
        ["BEFO1K"] = {
            name = "BEFO1K",
            runway = "RW09",
            waypoints = {
                { name = "BEFOM", type = "UR", altitude_min = 10000 },
                { name = "WI005", type = "UR", altitude_min = 3000 },
            }
        },
        ["BURU1A"] = {
            name = "BURU1A",
            runway = "",
            waypoints = {
                { name = "BURUT", type = "UR", altitude_min = 6000 },
                { name = "BURUT", type = "UR", altitude_min = 6000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
                { name = "BURUT", type = "UR", altitude_min = 6000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
            }
        },
        ["BURU1D"] = {
            name = "BURU1D",
            runway = "",
            waypoints = {
                { name = "BURUT", type = "UR", altitude_min = 6000 },
                { name = "BURUT", type = "UR", altitude_min = 6000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
                { name = "BURUT", type = "UR", altitude_min = 6000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
            }
        },
        ["BURU1E"] = {
            name = "BURU1E",
            runway = "RW27",
            waypoints = {
                { name = "BURUT", type = "UR", altitude_min = 6000 },
                { name = "WI205", type = "UR", altitude_min = 3000 },
            }
        },
        ["BURU1K"] = {
            name = "BURU1K",
            runway = "RW09",
            waypoints = {
                { name = "BURUT", type = "UR", altitude_min = 6000 },
                { name = "WI008", type = "UR" },
                { name = "WI005", type = "UR", altitude_min = 3000 },
            }
        },
        ["GUBT1A"] = {
            name = "GUBT1A",
            runway = "",
            waypoints = {
                { name = "GUBTA", type = "UR", altitude_min = 9000 },
                { name = "GUBTA", type = "UR", altitude_min = 9000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
                { name = "GUBTA", type = "UR", altitude_min = 9000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
            }
        },
        ["GUBT1D"] = {
            name = "GUBT1D",
            runway = "",
            waypoints = {
                { name = "GUBTA", type = "UR", altitude_min = 9000 },
                { name = "GUBTA", type = "UR", altitude_min = 9000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
                { name = "GUBTA", type = "UR", altitude_min = 9000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
            }
        },
        ["GUBT1E"] = {
            name = "GUBT1E",
            runway = "RW27",
            waypoints = {
                { name = "GUBTA", type = "UR", altitude_min = 9000 },
                { name = "WI207", type = "UR" },
                { name = "WI204", type = "UR", altitude_min = 3000 },
            }
        },
        ["GUBT1K"] = {
            name = "GUBT1K",
            runway = "RW09",
            waypoints = {
                { name = "GUBTA", type = "UR", altitude_min = 9000 },
                { name = "WI003", type = "UR", altitude_min = 3000 },
            }
        },
        ["KISE1A"] = {
            name = "KISE1A",
            runway = "",
            waypoints = {
                { name = "KISEL", type = "UR", altitude_min = 5000 },
                { name = "KISEL", type = "UR", altitude_min = 5000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
                { name = "KISEL", type = "UR", altitude_min = 5000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
            }
        },
        ["KISE1D"] = {
            name = "KISE1D",
            runway = "",
            waypoints = {
                { name = "KISEL", type = "UR", altitude_min = 5000 },
                { name = "KISEL", type = "UR", altitude_min = 5000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
                { name = "KISEL", type = "UR", altitude_min = 5000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
            }
        },
        ["KISE1E"] = {
            name = "KISE1E",
            runway = "RW27",
            waypoints = {
                { name = "KISEL", type = "UR", altitude_min = 5000 },
                { name = "WI207", type = "UR" },
                { name = "WI204", type = "UR", altitude_min = 3000 },
            }
        },
        ["KISE1K"] = {
            name = "KISE1K",
            runway = "RW09",
            waypoints = {
                { name = "KISEL", type = "UR", altitude_min = 5000 },
                { name = "WI004", type = "UR", altitude_min = 3000 },
            }
        },
        ["LUTI1A"] = {
            name = "LUTI1A",
            runway = "",
            waypoints = {
                { name = "LUTIN", type = "UR", altitude_min = 8000 },
                { name = "LUTIN", type = "UR", altitude_min = 8000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
                { name = "LUTIN", type = "UR", altitude_min = 8000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
            }
        },
        ["LUTI1D"] = {
            name = "LUTI1D",
            runway = "",
            waypoints = {
                { name = "LUTIN", type = "UR", altitude_min = 8000 },
                { name = "LUTIN", type = "UR", altitude_min = 8000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
                { name = "LUTIN", type = "UR", altitude_min = 8000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
            }
        },
        ["LUTI1E"] = {
            name = "LUTI1E",
            runway = "RW27",
            waypoints = {
                { name = "LUTIN", type = "UR", altitude_min = 8000 },
                { name = "WI203", type = "UR", altitude_min = 3000 },
            }
        },
        ["LUTI1K"] = {
            name = "LUTI1K",
            runway = "RW09",
            waypoints = {
                { name = "LUTIN", type = "UR", altitude_min = 8000 },
                { name = "WI007", type = "UR" },
                { name = "WI004", type = "UR", altitude_min = 3000 },
            }
        },
        ["SORE1A"] = {
            name = "SORE1A",
            runway = "",
            waypoints = {
                { name = "SOREG", type = "UR", altitude_min = 15000 },
                { name = "SOREG", type = "UR", altitude_min = 15000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
                { name = "SOREG", type = "UR", altitude_min = 15000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
            }
        },
        ["SORE1D"] = {
            name = "SORE1D",
            runway = "",
            waypoints = {
                { name = "SOREG", type = "UR", altitude_min = 15000 },
                { name = "SOREG", type = "UR", altitude_min = 15000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
                { name = "SOREG", type = "UR", altitude_min = 15000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
            }
        },
        ["SORE1E"] = {
            name = "SORE1E",
            runway = "RW27",
            waypoints = {
                { name = "SOREG", type = "UR", altitude_min = 15000 },
                { name = "WI204", type = "UR", altitude_min = 3000 },
            }
        },
        ["SORE1K"] = {
            name = "SORE1K",
            runway = "RW09",
            waypoints = {
                { name = "SOREG", type = "UR", altitude_min = 15000 },
                { name = "WI004", type = "UR", altitude_min = 3000 },
            }
        },
        ["SUFO1A"] = {
            name = "SUFO1A",
            runway = "",
            waypoints = {
                { name = "SUFOR", type = "UR", altitude_min = 12000 },
                { name = "SUFOR", type = "UR", altitude_min = 12000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
                { name = "SUFOR", type = "UR", altitude_min = 12000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
            }
        },
        ["SUFO1D"] = {
            name = "SUFO1D",
            runway = "",
            waypoints = {
                { name = "SUFOR", type = "UR", altitude_min = 12000 },
                { name = "SUFOR", type = "UR", altitude_min = 12000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
                { name = "SUFOR", type = "UR", altitude_min = 12000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
            }
        },
        ["SUFO1E"] = {
            name = "SUFO1E",
            runway = "RW27",
            waypoints = {
                { name = "SUFOR", type = "UR", altitude_min = 12000 },
                { name = "WI203", type = "UR", altitude_min = 3000 },
            }
        },
        ["SUFO1K"] = {
            name = "SUFO1K",
            runway = "RW09",
            waypoints = {
                { name = "SUFOR", type = "UR", altitude_min = 12000 },
                { name = "WI008", type = "UR" },
                { name = "WI005", type = "UR", altitude_min = 3000 },
            }
        },
        ["TIKN1A"] = {
            name = "TIKN1A",
            runway = "",
            waypoints = {
                { name = "TIKNA", type = "UR", altitude_min = 11000 },
                { name = "TIKNA", type = "UR", altitude_min = 11000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
                { name = "TIKNA", type = "UR", altitude_min = 11000 },
                { name = "ELI", type = "UR", altitude_min = 4000 },
            }
        },
        ["TIKN1D"] = {
            name = "TIKN1D",
            runway = "",
            waypoints = {
                { name = "TIKNA", type = "UR", altitude_min = 11000 },
                { name = "TIKNA", type = "UR", altitude_min = 11000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
                { name = "TIKNA", type = "UR", altitude_min = 11000 },
                { name = "SA", type = "UR", altitude_min = 4000 },
            }
        },
        ["TIKN1E"] = {
            name = "TIKN1E",
            runway = "RW27",
            waypoints = {
                { name = "TIKNA", type = "UR", altitude_min = 11000 },
                { name = "WI207", type = "UR" },
                { name = "WI204", type = "UR", altitude_min = 3000 },
            }
        },
        ["TIKN1K"] = {
            name = "TIKN1K",
            runway = "RW09",
            waypoints = {
                { name = "TIKNA", type = "UR", altitude_min = 11000 },
                { name = "WI003", type = "UR", altitude_min = 3000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D09-Y"] = {
            name = "D09-Y",
            type = "A",
            runway = "D09-Y",
            waypoints = {
                { name = "ELI", transition = "ELI", type = "UR", altitude_min = 4000 },
                { name = "ELI", transition = "ELI", type = "UR", altitude_min = 2500 },
                { name = "FD09", transition = "ELI", type = "UR" },
                { name = "FD09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "ELI", transition = "", type = "UR", altitude_min = 2500 },
            }
        },
        ["D09-Z"] = {
            name = "D09-Z",
            type = "A",
            runway = "D09-Z",
            waypoints = {
                { name = "ELI", transition = "ELI", type = "UR", altitude_min = 4000 },
                { name = "ELI", transition = "ELI", type = "UR", altitude_min = 2500 },
                { name = "FD09", transition = "ELI", type = "UR" },
                { name = "FD09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "ELI", transition = "", type = "UR", altitude_min = 2500, speed = 225.0 },
            }
        },
        ["D27-Y"] = {
            name = "D27-Y",
            type = "A",
            runway = "D27-Y",
            waypoints = {
                { name = "ELI", transition = "ELI", type = "UR", altitude_min = 4000 },
                { name = "ELI", transition = "ELI", type = "UR", altitude_min = 2500 },
                { name = "FD27", transition = "ELI", type = "UR" },
                { name = "FD27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "ELI", transition = "", type = "UR", altitude_min = 2500 },
            }
        },
        ["D27-Z"] = {
            name = "D27-Z",
            type = "A",
            runway = "D27-Z",
            waypoints = {
                { name = "ELI", transition = "ELI", type = "UR", altitude_min = 4000 },
                { name = "ELI", transition = "ELI", type = "UR", altitude_min = 2500 },
                { name = "FD27", transition = "ELI", type = "UR" },
                { name = "FD27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "ELI", transition = "", type = "UR", altitude_min = 2500, speed = 225.0 },
            }
        },
        ["I09-V"] = {
            name = "I09-V",
            type = "A",
            runway = "I09-V",
            waypoints = {
                { name = "ELI", transition = "ELI", type = "UR", altitude_min = 4000 },
                { name = "ELI", transition = "ELI", type = "UR", altitude_min = 2500 },
                { name = "CF09", transition = "ELI", type = "UR", altitude_min = 2500 },
                { name = "CF09", transition = "", type = "UR" },
                { name = "FF09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "ELI", transition = "", type = "UR", altitude_min = 2500 },
            }
        },
        ["I09-W"] = {
            name = "I09-W",
            type = "A",
            runway = "I09-W",
            waypoints = {
                { name = "ELI", transition = "ELI", type = "UR", altitude_min = 4000 },
                { name = "ELI", transition = "ELI", type = "UR", altitude_min = 2500 },
                { name = "CI09", transition = "ELI", type = "UR", altitude_min = 2500 },
                { name = "CI09", transition = "", type = "UR" },
                { name = "FF09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "ELI", transition = "", type = "UR", altitude_min = 2500, speed = 225.0 },
            }
        },
        ["I09-X"] = {
            name = "I09-X",
            type = "A",
            runway = "I09-X",
            waypoints = {
                { name = "SA", transition = "SA", type = "UR", altitude_min = 4000 },
                { name = "D100L", transition = "SA", type = "UR", altitude_min = 2500 },
                { name = "CF09", transition = "SA", type = "UR", altitude_min = 2500 },
                { name = "CF09", transition = "", type = "UR" },
                { name = "FF09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "SA", transition = "", type = "UR", altitude_min = 2500 },
            }
        },
        ["I09-Y"] = {
            name = "I09-Y",
            type = "A",
            runway = "I09-Y",
            waypoints = {
                { name = "SA", transition = "SA", type = "UR", altitude_min = 4000 },
                { name = "D120L", transition = "SA", type = "UR", altitude_min = 2500 },
                { name = "CI09", transition = "SA", type = "UR", altitude_min = 2500 },
                { name = "CI09", transition = "", type = "UR" },
                { name = "FF09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "SA", transition = "", type = "UR", altitude_min = 2700, speed = 225.0 },
            }
        },
        ["I09-Z"] = {
            name = "I09-Z",
            type = "A",
            runway = "I09-Z",
            waypoints = {
                { name = "WI003", transition = "WI003", type = "UR", altitude_min = 3000 },
                { name = "WI002", transition = "WI003", type = "UR", altitude_min = 2100 },
                { name = "WI004", transition = "WI004", type = "UR", altitude_min = 3000 },
                { name = "WI002", transition = "WI004", type = "UR", altitude_min = 2100 },
                { name = "WI005", transition = "WI005", type = "UR", altitude_min = 3000 },
                { name = "WI002", transition = "WI005", type = "UR", altitude_min = 2100 },
                { name = "WI002", transition = "", type = "UR" },
                { name = "WI010", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "WI006", transition = "", type = "UR", speed = 225.0 },
                { name = "WI005", transition = "", type = "UR", altitude_min = 3000 },
            }
        },
        ["J09"] = {
            name = "J09",
            type = "A",
            runway = "J09",
            waypoints = {
                { name = "WI003", transition = "WI003", type = "UR", altitude_min = 3000 },
                { name = "WI002", transition = "WI003", type = "UR", altitude_min = 2100 },
                { name = "WI004", transition = "WI004", type = "UR", altitude_min = 3000 },
                { name = "WI002", transition = "WI004", type = "UR", altitude_min = 2100 },
                { name = "WI005", transition = "WI005", type = "UR", altitude_min = 3000 },
                { name = "WI002", transition = "WI005", type = "UR", altitude_min = 2100 },
                { name = "WI002", transition = "", type = "UR" },
                { name = "WI009", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "WI006", transition = "", type = "UR", speed = 225.0 },
                { name = "WI005", transition = "", type = "UR", altitude_min = 3000 },
            }
        },
        ["J27"] = {
            name = "J27",
            type = "A",
            runway = "J27",
            waypoints = {
                { name = "WI203", transition = "WI203", type = "UR", altitude_min = 3000 },
                { name = "WI202", transition = "WI203", type = "UR", altitude_min = 2100 },
                { name = "WI204", transition = "WI204", type = "UR", altitude_min = 3000 },
                { name = "WI202", transition = "WI204", type = "UR", altitude_min = 2100 },
                { name = "WI205", transition = "WI205", type = "UR", altitude_min = 3000 },
                { name = "WI202", transition = "WI205", type = "UR", altitude_min = 2100 },
                { name = "WI202", transition = "", type = "UR" },
                { name = "WI209", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "WI206", transition = "", type = "UR", speed = 225.0 },
                { name = "WI205", transition = "", type = "UR", altitude_min = 3000 },
            }
        },
        ["Q09-Y"] = {
            name = "Q09-Y",
            type = "A",
            runway = "Q09-Y",
            waypoints = {
                { name = "SA", transition = "SA", type = "UR", altitude_min = 4000 },
                { name = "SA", transition = "SA", type = "UR", altitude_min = 2500 },
                { name = "FQ09", transition = "SA", type = "UR" },
                { name = "FQ09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "SA", transition = "", type = "UR", altitude_min = 2500 },
            }
        },
        ["Q09-Z"] = {
            name = "Q09-Z",
            type = "A",
            runway = "Q09-Z",
            waypoints = {
                { name = "SA", transition = "SA", type = "UR", altitude_min = 4000 },
                { name = "SA", transition = "SA", type = "UR", altitude_min = 2500 },
                { name = "FQ09", transition = "SA", type = "UR" },
                { name = "FQ09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "SA", transition = "", type = "UR", altitude_min = 2500, speed = 225.0 },
            }
        },
        ["Q27-Y"] = {
            name = "Q27-Y",
            type = "A",
            runway = "Q27-Y",
            waypoints = {
                { name = "SA", transition = "SA", type = "UR", altitude_min = 4000 },
                { name = "SA", transition = "SA", type = "UR", altitude_min = 2500 },
                { name = "FQ27", transition = "SA", type = "UR" },
                { name = "FQ27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "SA", transition = "", type = "UR", altitude_min = 2500 },
            }
        },
        ["Q27-Z"] = {
            name = "Q27-Z",
            type = "A",
            runway = "Q27-Z",
            waypoints = {
                { name = "SA", transition = "SA", type = "UR", altitude_min = 4000 },
                { name = "SA", transition = "SA", type = "UR", altitude_min = 2500 },
                { name = "FQ27", transition = "SA", type = "UR" },
                { name = "FQ27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "SA", transition = "", type = "UR", altitude_min = 2500, speed = 225.0 },
            }
        },
        ["R09"] = {
            name = "R09",
            type = "A",
            runway = "R09",
            waypoints = {
                { name = "WI003", transition = "WI003", type = "UR", altitude_min = 3000 },
                { name = "WI002", transition = "WI003", type = "UR", altitude_min = 2100 },
                { name = "WI004", transition = "WI004", type = "UR", altitude_min = 3000 },
                { name = "WI002", transition = "WI004", type = "UR", altitude_min = 2100 },
                { name = "WI005", transition = "WI005", type = "UR", altitude_min = 3000 },
                { name = "WI002", transition = "WI005", type = "UR", altitude_min = 2100 },
                { name = "WI002", transition = "", type = "UR", altitude_min = 2100 },
                { name = "WI001", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "WI006", transition = "", type = "UR", speed = 225.0 },
                { name = "WI005", transition = "", type = "UR", altitude_min = 3000 },
            }
        },
        ["R27"] = {
            name = "R27",
            type = "A",
            runway = "R27",
            waypoints = {
                { name = "WI203", transition = "WI203", type = "UR", altitude_min = 3000 },
                { name = "WI202", transition = "WI203", type = "UR", altitude_min = 2100 },
                { name = "WI204", transition = "WI204", type = "UR", altitude_min = 3000 },
                { name = "WI202", transition = "WI204", type = "UR", altitude_min = 2100 },
                { name = "WI205", transition = "WI205", type = "UR", altitude_min = 3000 },
                { name = "WI202", transition = "WI205", type = "UR", altitude_min = 2100 },
                { name = "WI202", transition = "", type = "UR", altitude_min = 2100 },
                { name = "WI201", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "WI206", transition = "", type = "UR", speed = 225.0 },
                { name = "WI205", transition = "", type = "UR", altitude_min = 3000 },
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
