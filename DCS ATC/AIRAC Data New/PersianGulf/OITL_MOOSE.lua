local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OITL",
        Name = "OITL Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["MQ33"] = { lat = 47.162527778, lon = 27.63175, type = "LRIA" },
        ["D260R"] = { lat = 50.051747222, lon = 30.928230556, type = "UKBB" },
        ["D270K"] = { lat = 65.842163889, lon = 87.518355556, type = "UOTT" },
        ["FI33"] = { lat = 22.279411111, lon = 31.671758333, type = "HEBL" },
        ["MQ15"] = { lat = 38.775541667, lon = 48.794286111, type = "UBBL" },
        ["GIVTA"] = { lat = 38.013888889, lon = 48.795555556, type = "ENRT" },
        ["FQ33"] = { lat = 53.413025, lon = 50.232144444, type = "UWWW" },
        ["D132N"] = { lat = 49.768013889, lon = 15.626402778, type = "LKCV" },
        ["FD07"] = { lat = 35.579997222, lon = -0.749030556, type = "DAOO" },
        ["FF15"] = { lat = 48.620002778, lon = 32.231416667, type = "UKKG" },
        ["MD07"] = { lat = 35.610688889, lon = -0.660633333, type = "DAOO" },
        ["AR12A"] = { lat = 38.134452778, lon = 48.393383333, type = "OITL" },
        ["D145H"] = { lat = 37.4525, lon = 61.987777778, type = "UTAM" },
        ["CD15"] = { lat = 9.817613889, lon = 41.743025, type = "HADR" },
        ["EGVON"] = { lat = 38.279722222, lon = 47.905833333, type = "ENRT" },
        ["D132H"] = { lat = 27.080583333, lon = 33.899805556, type = "HEGN" },
        ["MD15"] = { lat = 9.687119444, lon = 41.819005556, type = "HADR" },
        ["FD15Y"] = { lat = 38.414711111, lon = 48.356086111, type = "OITL" },
        ["FQ15"] = { lat = 46.08205, lon = 18.186277778, type = "LHPP" },
        ["RW33"] = { lat = -23.016363889, lon = -47.121994444, type = "SBKP" },
        ["D155O"] = { lat = 37.551022222, lon = -0.684877778, type = "LELC" },
        ["CQ33"] = { lat = 53.333708333, lon = 50.280302778, type = "UWWW" },
        ["D260G"] = { lat = 38.305891667, lon = 48.287072222, type = "OITL" },
        ["D215E"] = { lat = 37.932541667, lon = 32.497030556, type = "LTAN" },
        ["D180K"] = { lat = 40.658333333, lon = 47.691944444, type = "UBBQ" },
        ["CQ15"] = { lat = 38.438597222, lon = 48.291411111, type = "OITL" },
        ["D230N"] = { lat = 12.883027778, lon = -59.62085, type = "TBPB" },
        ["MD33"] = { lat = -1.676208333, lon = 13.453669444, type = "FOON" },
        ["D250S"] = { lat = 38.233686111, lon = 48.049741667, type = "OITL" },
        ["CI33"] = { lat = 22.254797222, lon = 31.687052778, type = "HEBL" },
        ["D155N"] = { lat = 11.928194444, lon = 15.136527778, type = "FTTJ" },
        ["D215L"] = { lat = 42.602558333, lon = 10.910658333, type = "LIRS" },
        ["FN312"] = { lat = 38.292163889, lon = 48.459022222, type = "OITL" },
        ["CF15"] = { lat = 50.714011111, lon = 30.107325, type = "UKKM" },
        ["D250R"] = { lat = 3.62265, lon = 11.274505556, type = "FKYS" },
        ["D312E"] = { lat = 38.252661111, lon = 48.504077778, type = "OITL" },
        ["AR15A"] = { lat = 38.095708333, lon = 48.523277778, type = "OITL" },
        ["D029E"] = { lat = 51.518666667, lon = 4.412666667, type = "EHWO" },
        ["D270L"] = { lat = 52.424802778, lon = 13.804944444, type = "EDDB" },
        ["D180L"] = { lat = 44.373333333, lon = 37.976666667, type = "URKG" },
        ["FD15Z"] = { lat = 38.386425, lon = 48.378583333, type = "OITL" },
        ["CD33"] = { lat = 26.187652778, lon = 31.841472222, type = "HESG" },
        ["D230M"] = { lat = 56.563616667, lon = 15.959933333, type = "ESMQ" },
        ["ARB15"] = { lat = 38.090705556, lon = 48.525572222, type = "OITL" },
        ["D205K"] = { lat = 39.395197222, lon = 2.640138889, type = "LEPA" },
        ["FD33"] = { lat = 5.453458333, lon = 10.407069444, type = "FKKU" },
        ["ITUPA"] = { lat = 38.576666667, lon = 48.038888889, type = "ENRT" },
        ["ARB12"] = { lat = 38.128225, lon = 48.392694444, type = "OITL" },
    },

    -- Данные ВПП
    Runways = {
        ["RW07"] = {
            heading = 70,
            length = 0,
            width = 0,
            threshold = { lat = 38.31095555555555, lon = 48.4018 },
            end = { lat = 38.31095555555555, lon = 48.4018 }
        },
        ["RW15"] = {
            heading = 150,
            length = 60.0,
            width = 0,
            threshold = { lat = 38.33838888888889, lon = 48.4148 },
            end = { lat = 38.329837128188466, lon = 48.42109475681913 }
        },
        ["RW25"] = {
            heading = 250,
            length = 30.0,
            width = 0,
            threshold = { lat = 38.316811111111114, lon = 48.4294 },
            end = { lat = 38.315122434077125, lon = 48.423486624248035 }
        },
        ["RW33"] = {
            heading = 330,
            length = 60.0,
            width = 0,
            threshold = { lat = 38.31268333333333, lon = 48.43370833333333 },
            end = { lat = 38.32123509403376, lon = 48.42741580851937 }
        },
    },

    -- Процедуры SID
    SID = {
        ["EGVO1D"] = {
            name = "EGVO1D",
            runway = "RW25",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "ARB", type = "D", altitude_min = 5300 },
                { name = "ARB", type = "D", altitude_min = 6300 },
                { name = "", type = "" },
                { name = "EGVON", type = "E" },
            }
        },
        ["EGVO1E"] = {
            name = "EGVO1E",
            runway = "RW07",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "ARB", type = "D", altitude_min = 5300 },
                { name = "ARB", type = "D", altitude_min = 6300 },
                { name = "EGVON", type = "E" },
            }
        },
        ["EGVO1G"] = {
            name = "EGVO1G",
            runway = "RW25",
            waypoints = {
                { name = "", type = "", altitude_min = 5300 },
                { name = "ARB", type = "D", altitude_min = 6300 },
                { name = "", type = "" },
                { name = "EGVON", type = "E" },
            }
        },
        ["EGVO1H"] = {
            name = "EGVO1H",
            runway = "RW07",
            waypoints = {
                { name = "", type = "", altitude_min = 5300 },
                { name = "ARB", type = "D", altitude_min = 6300 },
                { name = "EGVON", type = "E" },
            }
        },
        ["EGVO1J"] = {
            name = "EGVO1J",
            runway = "RW33",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "ARB", type = "D", altitude_min = 8200 },
                { name = "ARB", type = "D", altitude_min = 12000 },
                { name = "EGVON", type = "E" },
            }
        },
        ["EGVO1L"] = {
            name = "EGVO1L",
            runway = "RW15",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "ARB", type = "D", altitude_min = 8500 },
                { name = "", type = "" },
                { name = "ARB", type = "D", altitude_min = 12000 },
                { name = "EGVON", type = "E" },
            }
        },
        ["GIVT1A"] = {
            name = "GIVT1A",
            runway = "RW33",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "ARB", type = "D", altitude_min = 6000 },
                { name = "ARB", type = "D", altitude_min = 7700 },
                { name = "GIVTA", type = "E" },
            }
        },
        ["GIVT1B"] = {
            name = "GIVT1B",
            runway = "RW15",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "GIVTA", type = "E" },
            }
        },
        ["GIVT1C"] = {
            name = "GIVT1C",
            runway = "RW15",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "ARB", type = "D", altitude_min = 6000 },
                { name = "ARB", type = "D", altitude_min = 7700 },
                { name = "", type = "" },
                { name = "GIVTA", type = "E" },
            }
        },
        ["GIVT1D"] = {
            name = "GIVT1D",
            runway = "RW25",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "ARB", type = "D", altitude_min = 5300 },
                { name = "ARB", type = "D", altitude_min = 6300 },
                { name = "GIVTA", type = "E" },
            }
        },
        ["GIVT1E"] = {
            name = "GIVT1E",
            runway = "RW07",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "ARB", type = "D", altitude_min = 5300 },
                { name = "ARB", type = "D", altitude_min = 6300 },
                { name = "GIVTA", type = "E" },
            }
        },
        ["GIVT1J"] = {
            name = "GIVT1J",
            runway = "RW33",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "ARB", type = "D", altitude_min = 6000 },
                { name = "ARB", type = "D", altitude_min = 7700 },
                { name = "GIVTA", type = "E" },
            }
        },
        ["GIVT1L"] = {
            name = "GIVT1L",
            runway = "RW15",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "GIVTA", type = "E" },
            }
        },
        ["GIVT1M"] = {
            name = "GIVT1M",
            runway = "RW15",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "ARB", type = "D", altitude_min = 6000 },
                { name = "ARB", type = "D", altitude_min = 7700 },
                { name = "GIVTA", type = "E" },
            }
        },
        ["ITUP1D"] = {
            name = "ITUP1D",
            runway = "RW25",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "", type = "" },
                { name = "ITUPA", type = "E" },
            }
        },
        ["ITUP1E"] = {
            name = "ITUP1E",
            runway = "RW07",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "", type = "" },
                { name = "ITUPA", type = "E" },
            }
        },
        ["ITUP1G"] = {
            name = "ITUP1G",
            runway = "RW25",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "", type = "" },
                { name = "ITUPA", type = "E" },
            }
        },
        ["ITUP1H"] = {
            name = "ITUP1H",
            runway = "RW07",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "", type = "" },
                { name = "ITUPA", type = "E" },
            }
        },
        ["ITUP1J"] = {
            name = "ITUP1J",
            runway = "RW33",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "ARB", type = "D", altitude_min = 7000 },
                { name = "", type = "" },
                { name = "ITUPA", type = "E" },
            }
        },
        ["ITUP1L"] = {
            name = "ITUP1L",
            runway = "RW15",
            waypoints = {
                { name = "", type = "", altitude_min = 4720 },
                { name = "ARB", type = "D", altitude_min = 5500 },
                { name = "", type = "" },
                { name = "ITUPA", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["EGVO1N"] = {
            name = "EGVO1N",
            runway = "ALL",
            waypoints = {
                { name = "EGVON", type = "OI" },
                { name = "D260R", type = "OI" },
                { name = "D260G", type = "OI" },
                { name = "ARB", type = "OI" },
            }
        },
        ["EGVO1P"] = {
            name = "EGVO1P",
            runway = "ALL",
            waypoints = {
                { name = "EGVON", type = "OI" },
                { name = "D250R", type = "OI" },
                { name = "D230M", type = "OI" },
                { name = "D205K", type = "OI" },
            }
        },
        ["EGVO1Q"] = {
            name = "EGVO1Q",
            runway = "ALL",
            waypoints = {
                { name = "EGVON", type = "OI" },
                { name = "D250S", type = "OI" },
                { name = "D230N", type = "OI" },
                { name = "D215L", type = "OI" },
            }
        },
        ["GIVT1N"] = {
            name = "GIVT1N",
            runway = "ALL",
            waypoints = {
                { name = "GIVTA", type = "OI" },
                { name = "D132N", type = "OI" },
                { name = "D132H", type = "OI" },
                { name = "ARB", type = "OI" },
            }
        },
        ["GIVT1P"] = {
            name = "GIVT1P",
            runway = "RW33",
            waypoints = {
                { name = "GIVTA", type = "OI" },
                { name = "D155N", type = "OI" },
                { name = "D180K", type = "OI" },
                { name = "D205K", type = "OI" },
            }
        },
        ["GIVT1Q"] = {
            name = "GIVT1Q",
            runway = "ALL",
            waypoints = {
                { name = "GIVTA", type = "OI" },
                { name = "D155O", type = "OI" },
                { name = "D180L", type = "OI" },
                { name = "D215L", type = "OI" },
            }
        },
        ["GIVT1R"] = {
            name = "GIVT1R",
            runway = "RW07",
            waypoints = {
                { name = "GIVTA", type = "OI" },
                { name = "D132N", type = "OI" },
                { name = "D132H", type = "OI" },
                { name = "ARB", type = "OI" },
            }
        },
        ["GIVT1S"] = {
            name = "GIVT1S",
            runway = "ALL",
            waypoints = {
                { name = "GIVTA", type = "OI" },
                { name = "ARB", type = "OI" },
            }
        },
        ["GIVT1T"] = {
            name = "GIVT1T",
            runway = "RW33",
            waypoints = {
                { name = "GIVTA", type = "OI" },
                { name = "AR15A", type = "OI" },
                { name = "AR12A", type = "OI" },
                { name = "D205K", type = "OI" },
            }
        },
        ["GIVT1V"] = {
            name = "GIVT1V",
            runway = "RW15",
            waypoints = {
                { name = "GIVTA", type = "OI" },
                { name = "ARB15", type = "OI" },
                { name = "ARB12", type = "OI" },
                { name = "D215L", type = "OI" },
            }
        },
        ["ITUP1N"] = {
            name = "ITUP1N",
            runway = "ALL",
            waypoints = {
                { name = "ITUPA", type = "OI" },
                { name = "ARB", type = "OI" },
            }
        },
        ["ITUP1P"] = {
            name = "ITUP1P",
            runway = "ALL",
            waypoints = {
                { name = "ITUPA", type = "OI" },
                { name = "D270K", type = "OI" },
                { name = "D205K", type = "OI" },
            }
        },
        ["ITUP1Q"] = {
            name = "ITUP1Q",
            runway = "ALL",
            waypoints = {
                { name = "ITUPA", type = "OI" },
                { name = "D270L", type = "OI" },
                { name = "D215L", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D07-Y"] = {
            name = "D07-Y",
            type = "A",
            runway = "D07-Y",
            waypoints = {
                { name = "ARB", transition = "ARB", type = "OI", altitude_min = 7500 },
                { name = "ARB", transition = "ARB", type = "OI", altitude_min = 6900 },
                { name = "FD07", transition = "ARB", type = "OI", altitude_min = 6900 },
                { name = "FD07", transition = "", type = "OI", altitude_min = 6900 },
                { name = "MD07", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI" },
                { name = "", transition = "", type = "" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 6100 },
                { name = "ARB", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 7500, speed = 185.0 },
            }
        },
        ["D07-Z"] = {
            name = "D07-Z",
            type = "A",
            runway = "D07-Z",
            waypoints = {
                { name = "ARB", transition = "ARB", type = "OI", altitude_min = 7500 },
                { name = "ARB", transition = "ARB", type = "OI", altitude_min = 6900 },
                { name = "FD07", transition = "ARB", type = "OI", altitude_min = 6900 },
                { name = "FD07", transition = "", type = "OI", altitude_min = 6900 },
                { name = "MD07", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI" },
                { name = "", transition = "", type = "" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 6100 },
                { name = "ARB", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 7500, speed = 185.0 },
            }
        },
        ["D15-Y"] = {
            name = "D15-Y",
            type = "D",
            runway = "D15-Y",
            waypoints = {
                { name = "FD15Y", transition = "", type = "OI", altitude_min = 6100 },
                { name = "MD15", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 7000 },
                { name = "ARB", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 9000, speed = 185.0 },
            }
        },
        ["D15-Z"] = {
            name = "D15-Z",
            type = "A",
            runway = "D15-Z",
            waypoints = {
                { name = "D215L", transition = "D215L", type = "OI", speed = 185.0 },
                { name = "", transition = "D215L", type = "" },
                { name = "CD15", transition = "D215L", type = "OI", altitude_min = 6900 },
                { name = "CD15", transition = "", type = "OI", altitude_min = 6900 },
                { name = "FD15Z", transition = "", type = "OI", altitude_min = 5500 },
                { name = "MD15", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 6200 },
                { name = "", transition = "", type = "" },
                { name = "D215E", transition = "", type = "OI" },
                { name = "D215L", transition = "", type = "OI" },
                { name = "D215L", transition = "", type = "OI", altitude_min = 9000, speed = 185.0 },
            }
        },
        ["D33"] = {
            name = "D33",
            type = "A",
            runway = "D33",
            waypoints = {
                { name = "D205K", transition = "D205K", type = "OI", speed = 185.0 },
                { name = "", transition = "D205K", type = "" },
                { name = "CD33", transition = "D205K", type = "OI", altitude_min = 6800 },
                { name = "CD33", transition = "", type = "OI", altitude_min = 6800 },
                { name = "FD33", transition = "", type = "OI", altitude_min = 5300 },
                { name = "MD33", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 5700 },
                { name = "D205K", transition = "", type = "OI" },
                { name = "D205K", transition = "", type = "OI", altitude_min = 8500, speed = 185.0 },
            }
        },
        ["I15"] = {
            name = "I15",
            type = "A",
            runway = "I15",
            waypoints = {
                { name = "ARB", transition = "ARB1", type = "OI" },
                { name = "ARB", transition = "ARB1", type = "OI", altitude_min = 7700, speed = 200.0 },
                { name = "CF15", transition = "ARB1", type = "OI", altitude_min = 7700 },
                { name = "ARB", transition = "ARB2", type = "OI" },
                { name = "ARB", transition = "ARB2", type = "OI", altitude_min = 7700 },
                { name = "CF15", transition = "ARB2", type = "OI", altitude_min = 7700 },
                { name = "CF15", transition = "", type = "OI" },
                { name = "FF15", transition = "", type = "OI" },
                { name = "RW15", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 7500 },
                { name = "ARB", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 11500, speed = 200.0 },
            }
        },
        ["I33-Y"] = {
            name = "I33-Y",
            type = "A",
            runway = "I33-Y",
            waypoints = {
                { name = "D205K", transition = "D205K", type = "OI" },
                { name = "", transition = "D205K", type = "" },
                { name = "D145H", transition = "D205K", type = "OI", altitude_min = 6800 },
                { name = "CI33", transition = "D205K", type = "OI", altitude_min = 6800 },
                { name = "CI33", transition = "", type = "OI" },
                { name = "FI33", transition = "", type = "OI" },
                { name = "RW33", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 5700 },
                { name = "D205K", transition = "", type = "OI" },
                { name = "D205K", transition = "", type = "OI", altitude_min = 8500, speed = 210.0 },
            }
        },
        ["I33-Z"] = {
            name = "I33-Z",
            type = "A",
            runway = "I33-Z",
            waypoints = {
                { name = "D205K", transition = "D205K", type = "OI", speed = 185.0 },
                { name = "", transition = "D205K", type = "" },
                { name = "D145H", transition = "D205K", type = "OI", altitude_min = 6800 },
                { name = "CI33", transition = "D205K", type = "OI", altitude_min = 6800 },
                { name = "CI33", transition = "", type = "OI" },
                { name = "FI33", transition = "", type = "OI" },
                { name = "RW33", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 5700 },
                { name = "D205K", transition = "", type = "OI" },
                { name = "D205K", transition = "", type = "OI", altitude_min = 8500, speed = 185.0 },
            }
        },
        ["NDBA"] = {
            name = "NDBA",
            type = "A",
            runway = "NDBA",
            waypoints = {
                { name = "ARB", transition = "ARB", type = "OI", altitude_min = 7000 },
                { name = "ARB", transition = "ARB", type = "OI", altitude_min = 6300, speed = 185.0 },
                { name = "FN312", transition = "", type = "OI", altitude_min = 6300 },
                { name = "ARB", transition = "", type = "OI" },
                { name = "", transition = "", type = "" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 6300 },
                { name = "ARB", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 7000 },
            }
        },
        ["Q15"] = {
            name = "Q15",
            type = "A",
            runway = "Q15",
            waypoints = {
                { name = "D215L", transition = "D215L", type = "OI" },
                { name = "", transition = "D215L", type = "" },
                { name = "CQ15", transition = "D215L", type = "OI", altitude_min = 6900 },
                { name = "CQ15", transition = "", type = "OI", altitude_min = 6900 },
                { name = "FQ15", transition = "", type = "OI", altitude_min = 5300 },
                { name = "MQ15", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI" },
                { name = "D312E", transition = "", type = "OI" },
                { name = "D029E", transition = "", type = "OI" },
                { name = "D215L", transition = "", type = "OI" },
                { name = "D215L", transition = "", type = "OI", altitude_min = 8500, speed = 210.0 },
            }
        },
        ["Q33"] = {
            name = "Q33",
            type = "A",
            runway = "Q33",
            waypoints = {
                { name = "D205K", transition = "D205K", type = "OI" },
                { name = "", transition = "D205K", type = "" },
                { name = "CQ33", transition = "D205K", type = "OI", altitude_min = 6800 },
                { name = "CQ33", transition = "", type = "OI", altitude_min = 6800 },
                { name = "FQ33", transition = "", type = "OI", altitude_min = 5300 },
                { name = "MQ33", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI" },
                { name = "ARB", transition = "", type = "OI", altitude_min = 5700 },
                { name = "D205K", transition = "", type = "OI" },
                { name = "D205K", transition = "", type = "OI", altitude_min = 8500, speed = 210.0 },
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
