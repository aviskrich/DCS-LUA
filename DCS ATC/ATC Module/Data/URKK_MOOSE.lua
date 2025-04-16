local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "URKK",
        Name = "URKK Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["FS05R"] = { lat = 44.974319444, lon = 39.076838889, type = "URKK" },
        ["CI05R"] = { lat = 29.982416667, lon = 31.266555556, type = "HECA" },
        ["KK213"] = { lat = 45.068916667, lon = 38.8375, type = "URKK" },
        ["D002K"] = { lat = 25.631275, lon = 30.612008333, type = "HEKG" },
        ["CF05R"] = { lat = 43.237083333, lon = 76.807722222, type = "UAAA" },
        ["D053R"] = { lat = 45.164938889, lon = 39.532847222, type = "URKK" },
        ["AGIDA"] = { lat = 45.011388889, lon = 37.878333333, type = "ENRT" },
        ["21THR"] = { lat = 9.332755556, lon = 13.319227778, type = "FKKR" },
        ["NOBLO"] = { lat = 45.481944444, lon = 39.845, type = "ENRT" },
        ["D027H"] = { lat = 60.706927778, lon = -151.000061111, type = "PAEN" },
        ["KK503"] = { lat = 54.907222222, lon = 20.238944444, type = "UMKK" },
        ["D257K"] = { lat = 45.004927778, lon = 38.898586111, type = "URKK" },
        ["MOLIK"] = { lat = 44.366388889, lon = 39.448333333, type = "ENRT" },
        ["KND46"] = { lat = 44.887027778, lon = 38.106075, type = "URKK" },
        ["KND49"] = { lat = 44.947416667, lon = 38.018080556, type = "URKK" },
        ["KK508"] = { lat = 55.206416667, lon = 20.47875, type = "UMKK" },
        ["KK201"] = { lat = 46.932083333, lon = 29.148972222, type = "LUKK" },
        ["FI23L"] = { lat = 30.175305556, lon = 31.523277778, type = "HECA" },
        ["FD05R"] = { lat = 43.28425, lon = 76.902472222, type = "UAAA" },
        ["GINEP"] = { lat = 44.933055556, lon = 37.813333333, type = "ENRT" },
        ["KN46A"] = { lat = 44.589966667, lon = 40.066972222, type = "URKK" },
        ["KK210"] = { lat = 46.91325, lon = 29.147416667, type = "LUKK" },
        ["KK206"] = { lat = 44.587888889, lon = 39.495611111, type = "URKK" },
        ["D002N"] = { lat = 45.247577778, lon = 39.218972222, type = "URKK" },
        ["CD2LY"] = { lat = 45.199994444, lon = 39.500958333, type = "URKK" },
        ["KK202"] = { lat = 46.839777778, lon = 29.048222222, type = "LUKK" },
        ["RINEK"] = { lat = 45.828055556, lon = 39.863333333, type = "ENRT" },
        ["KK204"] = { lat = 45.161222222, lon = 39.42325, type = "URKK" },
        ["FI05R"] = { lat = 30.022861111, lon = 31.32025, type = "HECA" },
        ["CI2LY"] = { lat = 52.288555556, lon = 18.317388889, type = "EPPW" },
        ["15THR"] = { lat = -28.617005556, lon = 16.445891667, type = "FYOG" },
        ["RULAB"] = { lat = 44.366388889, lon = 38.408333333, type = "ENRT" },
        ["CI23L"] = { lat = 30.223416667, lon = 31.587555556, type = "HECA" },
        ["RW23L"] = { lat = 19.444938889, lon = -99.053891667, type = "MMMX" },
        ["KURAD"] = { lat = 44.914722222, lon = 40.583333333, type = "ENRT" },
        ["CD2LZ"] = { lat = 45.159077778, lon = 39.423591667, type = "URKK" },
        ["KK505"] = { lat = 54.962138889, lon = 20.449305556, type = "UMKK" },
        ["D238K"] = { lat = 61.955, lon = 129.508333333, type = "UEEE" },
        ["KK214"] = { lat = 44.775861111, lon = 39.823111111, type = "URKK" },
        ["KK511"] = { lat = 55.082972222, lon = 20.918972222, type = "UMKK" },
        ["BALEG"] = { lat = 45.653055556, lon = 39.318333333, type = "ENRT" },
        ["D262N"] = { lat = -4.288097222, lon = 15.016502778, type = "FCBB" },
        ["16VOR"] = { lat = 45.004919444, lon = 39.133980556, type = "URKK" },
        ["D034N"] = { lat = 45.191611111, lon = 39.381677778, type = "URKK" },
        ["RANIS"] = { lat = 44.419722222, lon = 40.288333333, type = "ENRT" },
        ["D257N"] = { lat = 45.001380556, lon = 38.841016667, type = "URKK" },
        ["FF23L"] = { lat = 48.625, lon = 135.323333333, type = "UHHH" },
        ["OSNIR"] = { lat = 44.642777778, lon = 38.283888889, type = "ENRT" },
        ["KK509"] = { lat = 54.991055556, lon = 20.944083333, type = "UMKK" },
        ["D262K"] = { lat = 65.817944444, lon = 87.508347222, type = "UOTT" },
        ["KK212"] = { lat = 46.908027778, lon = 28.926694444, type = "LUKK" },
        ["KK502"] = { lat = 54.775138889, lon = 20.153361111, type = "UMKK" },
        ["SIBAN"] = { lat = 44.333055556, lon = 38.965, type = "ENRT" },
        ["KK501"] = { lat = 54.72575, lon = 20.381638889, type = "UMKK" },
        ["KK507"] = { lat = 55.00975, lon = 20.633111111, type = "UMKK" },
        ["KK209"] = { lat = 44.903777778, lon = 38.486388889, type = "URKK" },
        ["UMBIK"] = { lat = 45.068055556, lon = 40.576666667, type = "ENRT" },
        ["KK504"] = { lat = 54.8165, lon = 20.310444444, type = "UMKK" },
        ["CI2LX"] = { lat = 45.201833333, lon = 39.498994444, type = "URKK" },
        ["KK207"] = { lat = 44.984694444, lon = 39.32875, type = "URKK" },
        ["KK211"] = { lat = 46.8315, lon = 29.039638889, type = "LUKK" },
        ["KK510"] = { lat = 55.224277778, lon = 20.6715, type = "UMKK" },
        ["LENIR"] = { lat = 45.433055556, lon = 40.015, type = "ENRT" },
        ["KK205"] = { lat = 45.106972222, lon = 39.322583333, type = "URKK" },
        ["FS23L"] = { lat = 45.083911111, lon = 39.282011111, type = "URKK" },
        ["KULED"] = { lat = 45.449722222, lon = 40.565, type = "ENRT" },
        ["KK208"] = { lat = 44.880888889, lon = 38.957277778, type = "URKK" },
    },

    -- Данные ВПП
    Runways = {
        ["RW05L"] = {
            heading = 50,
            length = 0,
            width = 0,
            rw_threshold = { lat = 45.02909722222222, lon = 39.14101111111111 },
            rw_end = { lat = 45.02909722222222, lon = 39.14101111111111 }
        },
        ["RW05R"] = {
            heading = 50,
            length = 0,
            width = 0,
            rw_threshold = { lat = 45.02607777777778, lon = 39.17304166666666 },
            rw_end = { lat = 45.02607777777778, lon = 39.17304166666666 }
        },
        ["RW23L"] = {
            heading = 230,
            length = 0,
            width = 0,
            rw_threshold = { lat = 45.042477777777776, lon = 39.203294444444445 },
            rw_end = { lat = 45.042477777777776, lon = 39.203294444444445 }
        },
        ["RW23R"] = {
            heading = 230,
            length = 0,
            width = 0,
            rw_threshold = { lat = 45.04112222222222, lon = 39.163174999999995 },
            rw_end = { lat = 45.04112222222222, lon = 39.163174999999995 }
        },
    },

    -- Процедуры SID
    SID = {
        ["AGID6A"] = {
            name = "AGID6A",
            runway = "RW05R",
            waypoints = {
                { name = "", type = "" },
                { name = "SM", type = "D", altitude_min = 7000 },
                { name = "AGIDA", type = "E", altitude_min = 8000 },
            }
        },
        ["AGID6D"] = {
            name = "AGID6D",
            runway = "RW23L",
            waypoints = {
                { name = "", type = "" },
                { name = "SM", type = "D", altitude_min = 7000 },
                { name = "AGIDA", type = "E", altitude_min = 8000 },
            }
        },
        ["AGID6T"] = {
            name = "AGID6T",
            runway = "RW23L",
            waypoints = {
                { name = "KK212", type = "P" },
                { name = "SM", type = "D", altitude_min = 7000, altitude_max = 10000 },
                { name = "AGIDA", type = "E", altitude_min = 8000 },
            }
        },
        ["AGID6V"] = {
            name = "AGID6V",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "KK509", type = "P", altitude_min = 4000, speed = 215.0 },
                { name = "KK510", type = "P", altitude_min = 9000, speed = 225.0 },
                { name = "KK507", type = "P", speed = 260.0 },
                { name = "SM", type = "D", altitude_min = 10000 },
                { name = "AGIDA", type = "E", altitude_min = 10000 },
            }
        },
        ["BALE6A"] = {
            name = "BALE6A",
            runway = "RW05R",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "BALEG", type = "E", altitude_min = 7000 },
            }
        },
        ["BALE6D"] = {
            name = "BALE6D",
            runway = "RW23L",
            waypoints = {
                { name = "", type = "", speed = 255.0 },
                { name = "XT", type = "D", speed = 255.0 },
                { name = "NZ", type = "D" },
                { name = "BALEG", type = "E", altitude_min = 7000 },
            }
        },
        ["BALE6T"] = {
            name = "BALE6T",
            runway = "RW23L",
            waypoints = {
                { name = "KK212", type = "P" },
                { name = "KK213", type = "P" },
                { name = "BALEG", type = "E", altitude_min = 7000 },
            }
        },
        ["BALE6V"] = {
            name = "BALE6V",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "BALEG", type = "E", altitude_min = 7000 },
            }
        },
        ["DV6A"] = {
            name = "DV6A",
            runway = "RW05R",
            waypoints = {
                { name = "", type = "" },
                { name = "SM", type = "D", altitude_min = 7000 },
                { name = "DV", type = "D", altitude_min = 8000 },
            }
        },
        ["DV6D"] = {
            name = "DV6D",
            runway = "RW23L",
            waypoints = {
                { name = "", type = "" },
                { name = "SM", type = "D", altitude_min = 7000 },
                { name = "DV", type = "D", altitude_min = 8000 },
            }
        },
        ["DV6T"] = {
            name = "DV6T",
            runway = "RW23L",
            waypoints = {
                { name = "KK212", type = "P" },
                { name = "SM", type = "D", altitude_min = 7000, altitude_max = 10000 },
                { name = "DV", type = "D", altitude_min = 8000 },
            }
        },
        ["DV6V"] = {
            name = "DV6V",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "KK509", type = "P", altitude_min = 4000, speed = 215.0 },
                { name = "KK510", type = "P", altitude_min = 9000, speed = 225.0 },
                { name = "KK507", type = "P", speed = 260.0 },
                { name = "SM", type = "D", altitude_min = 10000 },
                { name = "DV", type = "D", altitude_min = 10000 },
            }
        },
        ["GINE6A"] = {
            name = "GINE6A",
            runway = "RW05R",
            waypoints = {
                { name = "", type = "" },
                { name = "SM", type = "D", altitude_min = 7000 },
                { name = "GINEP", type = "E", altitude_min = 18000 },
            }
        },
        ["GINE6D"] = {
            name = "GINE6D",
            runway = "RW23L",
            waypoints = {
                { name = "", type = "" },
                { name = "SM", type = "D", altitude_min = 7000 },
                { name = "GINEP", type = "E", altitude_min = 18000 },
            }
        },
        ["GINE6T"] = {
            name = "GINE6T",
            runway = "RW23L",
            waypoints = {
                { name = "KK212", type = "P" },
                { name = "SM", type = "D", altitude_min = 7000, altitude_max = 10000 },
                { name = "GINEP", type = "E", altitude_min = 18000 },
            }
        },
        ["GINE6V"] = {
            name = "GINE6V",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "KK509", type = "P", altitude_min = 4000, speed = 215.0 },
                { name = "KK510", type = "P", altitude_min = 9000, speed = 225.0 },
                { name = "KK507", type = "P", speed = 260.0 },
                { name = "SM", type = "D", altitude_min = 10000 },
                { name = "GINEP", type = "E", altitude_min = 18000 },
            }
        },
        ["KULE6A"] = {
            name = "KULE6A",
            runway = "RW05R",
            waypoints = {
                { name = "", type = "" },
                { name = "NZ", type = "D" },
                { name = "KULED", type = "E", altitude_min = 7000 },
            }
        },
        ["KULE6D"] = {
            name = "KULE6D",
            runway = "RW23L",
            waypoints = {
                { name = "", type = "", speed = 255.0 },
                { name = "XT", type = "D", speed = 255.0 },
                { name = "NZ", type = "D" },
                { name = "KULED", type = "E", altitude_min = 7000 },
            }
        },
        ["KULE6T"] = {
            name = "KULE6T",
            runway = "RW23L",
            waypoints = {
                { name = "KK210", type = "P", speed = 215.0 },
                { name = "KK211", type = "P", speed = 240.0 },
                { name = "XT", type = "D", altitude_min = 11000 },
                { name = "RF", type = "D", altitude_min = 14000 },
                { name = "KULED", type = "E", altitude_min = 15000 },
            }
        },
        ["KULE6V"] = {
            name = "KULE6V",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "NZ", type = "D" },
                { name = "RF", type = "D", altitude_max = 14000 },
                { name = "KULED", type = "E", altitude_min = 15000 },
            }
        },
        ["KULE6W"] = {
            name = "KULE6W",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "KK509", type = "P", speed = 215.0 },
                { name = "KK510", type = "P", speed = 275.0 },
                { name = "NZ", type = "D" },
                { name = "RF", type = "D", altitude_max = 14000 },
                { name = "KULED", type = "E", altitude_min = 15000 },
            }
        },
        ["KURA6A"] = {
            name = "KURA6A",
            runway = "RW05R",
            waypoints = {
                { name = "", type = "" },
                { name = "NZ", type = "D" },
                { name = "KURAD", type = "E", altitude_min = 7000 },
            }
        },
        ["KURA6D"] = {
            name = "KURA6D",
            runway = "RW23L",
            waypoints = {
                { name = "", type = "", speed = 255.0 },
                { name = "XT", type = "D" },
                { name = "KURAD", type = "E", altitude_min = 7000 },
            }
        },
        ["KURA6T"] = {
            name = "KURA6T",
            runway = "RW23L",
            waypoints = {
                { name = "KK210", type = "P", speed = 215.0 },
                { name = "KK211", type = "P", speed = 240.0 },
                { name = "XT", type = "D", altitude_min = 11000 },
                { name = "KURAD", type = "E", altitude_min = 11000 },
            }
        },
        ["KURA6V"] = {
            name = "KURA6V",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "NZ", type = "D", altitude_min = 9000 },
                { name = "KURAD", type = "E", altitude_min = 9000 },
            }
        },
        ["OSNI6A"] = {
            name = "OSNI6A",
            runway = "RW05R",
            waypoints = {
                { name = "", type = "" },
                { name = "SM", type = "D", altitude_min = 7000 },
                { name = "OSNIR", type = "E", altitude_min = 8000 },
            }
        },
        ["OSNI6D"] = {
            name = "OSNI6D",
            runway = "RW23L",
            waypoints = {
                { name = "", type = "" },
                { name = "SM", type = "D", altitude_min = 7000 },
                { name = "OSNIR", type = "E", altitude_min = 8000 },
            }
        },
        ["OSNI6T"] = {
            name = "OSNI6T",
            runway = "RW23L",
            waypoints = {
                { name = "KK212", type = "P" },
                { name = "SM", type = "D", altitude_min = 7000, altitude_max = 10000 },
                { name = "OSNIR", type = "E", altitude_min = 8000 },
            }
        },
        ["OSNI6V"] = {
            name = "OSNI6V",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "KK509", type = "P", altitude_min = 4000, speed = 215.0 },
                { name = "KK510", type = "P", altitude_min = 9000, speed = 225.0 },
                { name = "KK507", type = "P", speed = 260.0 },
                { name = "SM", type = "D", altitude_min = 10000 },
                { name = "OSNIR", type = "E", altitude_min = 10000 },
            }
        },
        ["RANI6A"] = {
            name = "RANI6A",
            runway = "RW05R",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "RANIS", type = "E", altitude_min = 19000 },
            }
        },
        ["RANI6D"] = {
            name = "RANI6D",
            runway = "RW23L",
            waypoints = {
                { name = "", type = "", speed = 255.0 },
                { name = "XT", type = "D" },
                { name = "RANIS", type = "E", altitude_min = 19000 },
            }
        },
        ["RANI6T"] = {
            name = "RANI6T",
            runway = "RW23L",
            waypoints = {
                { name = "KK210", type = "P", speed = 215.0 },
                { name = "KK211", type = "P", speed = 240.0 },
                { name = "XT", type = "D", altitude_min = 11000 },
                { name = "RANIS", type = "E", altitude_min = 17000 },
            }
        },
        ["RANI6V"] = {
            name = "RANI6V",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "NZ", type = "D", altitude_min = 9000 },
                { name = "RANIS", type = "E", altitude_min = 19000 },
            }
        },
        ["RINE6A"] = {
            name = "RINE6A",
            runway = "RW05R",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "RINEK", type = "E", altitude_min = 19000 },
            }
        },
        ["RINE6D"] = {
            name = "RINE6D",
            runway = "RW23L",
            waypoints = {
                { name = "", type = "", speed = 255.0 },
                { name = "XT", type = "D", speed = 255.0 },
                { name = "NZ", type = "D" },
                { name = "RINEK", type = "E", altitude_min = 19000 },
            }
        },
        ["RINE6T"] = {
            name = "RINE6T",
            runway = "RW23L",
            waypoints = {
                { name = "KK210", type = "P", speed = 215.0 },
                { name = "KK211", type = "P", speed = 240.0 },
                { name = "XT", type = "D", altitude_min = 11000 },
                { name = "NZ", type = "D", altitude_min = 14000 },
                { name = "RINEK", type = "E", altitude_min = 19000 },
            }
        },
        ["RINE6V"] = {
            name = "RINE6V",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "NZ", type = "D" },
                { name = "RINEK", type = "E", altitude_min = 19000 },
            }
        },
        ["RULA6A"] = {
            name = "RULA6A",
            runway = "RW05R",
            waypoints = {
                { name = "", type = "" },
                { name = "SM", type = "D", altitude_min = 7000 },
                { name = "RULAB", type = "E", altitude_min = 8000 },
            }
        },
        ["RULA6D"] = {
            name = "RULA6D",
            runway = "RW23L",
            waypoints = {
                { name = "", type = "" },
                { name = "SM", type = "D", altitude_min = 7000 },
                { name = "RULAB", type = "E", altitude_min = 8000 },
            }
        },
        ["RULA6T"] = {
            name = "RULA6T",
            runway = "RW23L",
            waypoints = {
                { name = "KK212", type = "P" },
                { name = "SM", type = "D", altitude_min = 7000, altitude_max = 10000 },
                { name = "RULAB", type = "E", altitude_min = 8000 },
            }
        },
        ["RULA6V"] = {
            name = "RULA6V",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "KK509", type = "P", altitude_min = 4000, speed = 215.0 },
                { name = "KK510", type = "P", altitude_min = 9000, speed = 225.0 },
                { name = "KK507", type = "P", speed = 260.0 },
                { name = "SM", type = "D", altitude_min = 10000 },
                { name = "RULAB", type = "E", altitude_min = 10000 },
            }
        },
        ["UH6A"] = {
            name = "UH6A",
            runway = "RW05R",
            waypoints = {
                { name = "", type = "" },
                { name = "NZ", type = "D" },
                { name = "NOBLO", type = "E", altitude_min = 15000 },
                { name = "UH", type = "D", altitude_min = 15000 },
            }
        },
        ["UH6D"] = {
            name = "UH6D",
            runway = "RW23L",
            waypoints = {
                { name = "", type = "", speed = 255.0 },
                { name = "XT", type = "D", speed = 255.0 },
                { name = "NZ", type = "D" },
                { name = "NOBLO", type = "E", altitude_min = 15000 },
                { name = "UH", type = "D", altitude_min = 15000 },
            }
        },
        ["UH6T"] = {
            name = "UH6T",
            runway = "RW23L",
            waypoints = {
                { name = "KK210", type = "P", speed = 215.0 },
                { name = "KK211", type = "P", speed = 240.0 },
                { name = "XT", type = "D", altitude_min = 11000 },
                { name = "NZ", type = "D", altitude_min = 14000 },
                { name = "NOBLO", type = "E", altitude_min = 15000 },
                { name = "UH", type = "D", altitude_min = 15000 },
            }
        },
        ["UH6V"] = {
            name = "UH6V",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "NZ", type = "D" },
                { name = "NOBLO", type = "E", altitude_min = 15000 },
                { name = "UH", type = "D", altitude_min = 16000 },
            }
        },
        ["UH6X"] = {
            name = "UH6X",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "KK509", type = "P", speed = 215.0 },
                { name = "KK510", type = "P", speed = 275.0 },
                { name = "NZ", type = "D" },
                { name = "NOBLO", type = "E", altitude_min = 15000 },
                { name = "UH", type = "D", altitude_min = 16000 },
            }
        },
        ["UMBI6A"] = {
            name = "UMBI6A",
            runway = "RW05R",
            waypoints = {
                { name = "", type = "" },
                { name = "NZ", type = "D" },
                { name = "UMBIK", type = "E", altitude_min = 7000 },
            }
        },
        ["UMBI6D"] = {
            name = "UMBI6D",
            runway = "RW23L",
            waypoints = {
                { name = "", type = "", speed = 255.0 },
                { name = "XT", type = "D" },
                { name = "UMBIK", type = "E", altitude_min = 7000 },
            }
        },
        ["UMBI6T"] = {
            name = "UMBI6T",
            runway = "RW23L",
            waypoints = {
                { name = "KK210", type = "P", speed = 215.0 },
                { name = "KK211", type = "P", speed = 240.0 },
                { name = "XT", type = "D", altitude_min = 11000 },
                { name = "UMBIK", type = "E", altitude_min = 11000 },
            }
        },
        ["UMBI6V"] = {
            name = "UMBI6V",
            runway = "RW05R",
            waypoints = {
                { name = "KK508", type = "P" },
                { name = "NZ", type = "D", altitude_min = 9000 },
                { name = "UMBIK", type = "E", altitude_min = 9000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["AGID6H"] = {
            name = "AGID6H",
            runway = "RW05R",
            waypoints = {
                { name = "AGIDA", type = "UR", altitude_min = 7000 },
                { name = "D262K", type = "UR", altitude_min = 4000 },
            }
        },
        ["AGID6K"] = {
            name = "AGID6K",
            runway = "RW23L",
            waypoints = {
                { name = "AGIDA", type = "UR", altitude_min = 7000 },
                { name = "D262N", type = "UR", altitude_min = 6000 },
            }
        },
        ["AGID6M"] = {
            name = "AGID6M",
            runway = "",
            waypoints = {
                { name = "AGIDA", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
            }
        },
        ["AGID6R"] = {
            name = "AGID6R",
            runway = "RW05R",
            waypoints = {
                { name = "AGIDA", type = "UR", altitude_min = 7000 },
                { name = "KK502", type = "UR", altitude_min = 4000 },
            }
        },
        ["AGID6Y"] = {
            name = "AGID6Y",
            runway = "RW23L",
            waypoints = {
                { name = "AGIDA", type = "UR", altitude_min = 13000 },
                { name = "KK209", type = "UR" },
                { name = "KK208", type = "UR", altitude_min = 12000 },
                { name = "KK207", type = "UR" },
                { name = "KK201", type = "UR", altitude_min = 2600 },
            }
        },
        ["BALE6H"] = {
            name = "BALE6H",
            runway = "RW05R",
            waypoints = {
                { name = "BALEG", type = "UR", altitude_min = 6000 },
                { name = "D002K", type = "UR", altitude_min = 6000 },
            }
        },
        ["BALE6K"] = {
            name = "BALE6K",
            runway = "RW23L",
            waypoints = {
                { name = "BALEG", type = "UR", altitude_min = 6000 },
                { name = "D002N", type = "UR", altitude_min = 6000 },
            }
        },
        ["BALE6M"] = {
            name = "BALE6M",
            runway = "",
            waypoints = {
                { name = "BALEG", type = "UR", altitude_min = 6000 },
                { name = "BALEG", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
                { name = "BALEG", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
            }
        },
        ["BALE6R"] = {
            name = "BALE6R",
            runway = "RW05R",
            waypoints = {
                { name = "BALEG", type = "UR", altitude_min = 6000 },
                { name = "KK503", type = "UR", altitude_min = 4000 },
            }
        },
        ["BALE6Y"] = {
            name = "BALE6Y",
            runway = "RW23L",
            waypoints = {
                { name = "BALEG", type = "UR", altitude_min = 6000 },
                { name = "KK202", type = "UR", altitude_min = 4000 },
            }
        },
        ["GINE6H"] = {
            name = "GINE6H",
            runway = "RW05R",
            waypoints = {
                { name = "GINEP", type = "UR", altitude_min = 17000 },
                { name = "KND49", type = "UR", altitude_min = 8000 },
                { name = "D257K", type = "UR", altitude_min = 4000 },
            }
        },
        ["GINE6K"] = {
            name = "GINE6K",
            runway = "RW23L",
            waypoints = {
                { name = "GINEP", type = "UR", altitude_min = 17000 },
                { name = "KND49", type = "UR", altitude_min = 8000 },
                { name = "D257N", type = "UR", altitude_min = 6000 },
            }
        },
        ["GINE6M"] = {
            name = "GINE6M",
            runway = "",
            waypoints = {
                { name = "GINEP", type = "UR", altitude_min = 17000 },
                { name = "KND46", type = "UR", altitude_min = 8000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
            }
        },
        ["GINE6R"] = {
            name = "GINE6R",
            runway = "RW05R",
            waypoints = {
                { name = "GINEP", type = "UR", altitude_min = 17000 },
                { name = "KK502", type = "UR", altitude_min = 4000 },
            }
        },
        ["GINE6Y"] = {
            name = "GINE6Y",
            runway = "RW23L",
            waypoints = {
                { name = "GINEP", type = "UR", altitude_min = 17000 },
                { name = "KK209", type = "UR" },
                { name = "KK208", type = "UR", altitude_min = 12000 },
                { name = "KK207", type = "UR" },
                { name = "KK201", type = "UR", altitude_min = 2600 },
            }
        },
        ["KULE6H"] = {
            name = "KULE6H",
            runway = "RW05R",
            waypoints = {
                { name = "KULED", type = "UR", altitude_min = 6000 },
                { name = "RF", type = "UR" },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR" },
                { name = "D262K", type = "UR", altitude_min = 4000 },
            }
        },
        ["KULE6K"] = {
            name = "KULE6K",
            runway = "RW23L",
            waypoints = {
                { name = "KULED", type = "UR", altitude_min = 6000 },
                { name = "RF", type = "UR" },
                { name = "NZ", type = "UR", altitude_min = 6000 },
            }
        },
        ["KULE6M"] = {
            name = "KULE6M",
            runway = "",
            waypoints = {
                { name = "KULED", type = "UR", altitude_min = 6000 },
                { name = "KULED", type = "UR", altitude_min = 6000 },
                { name = "RF", type = "UR" },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
                { name = "KULED", type = "UR", altitude_min = 6000 },
                { name = "RF", type = "UR" },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
            }
        },
        ["KULE6R"] = {
            name = "KULE6R",
            runway = "RW05R",
            waypoints = {
                { name = "KULED", type = "UR", altitude_min = 16000 },
                { name = "RF", type = "UR", altitude_min = 16000 },
                { name = "XT", type = "UR", altitude_min = 10000 },
            }
        },
        ["KULE6Y"] = {
            name = "KULE6Y",
            runway = "RW23L",
            waypoints = {
                { name = "KULED", type = "UR", altitude_min = 6000 },
                { name = "RF", type = "UR", altitude_max = 12000 },
                { name = "KK204", type = "UR", altitude_min = 2400 },
            }
        },
        ["KURA6H"] = {
            name = "KURA6H",
            runway = "RW05R",
            waypoints = {
                { name = "KURAD", type = "UR", altitude_min = 8000 },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR" },
                { name = "D262K", type = "UR", altitude_min = 4000 },
            }
        },
        ["KURA6K"] = {
            name = "KURA6K",
            runway = "RW23L",
            waypoints = {
                { name = "KURAD", type = "UR", altitude_min = 8000 },
                { name = "NZ", type = "UR", altitude_min = 6000 },
            }
        },
        ["KURA6M"] = {
            name = "KURA6M",
            runway = "",
            waypoints = {
                { name = "KURAD", type = "UR", altitude_min = 8000 },
                { name = "KURAD", type = "UR", altitude_min = 8000 },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
                { name = "KURAD", type = "UR", altitude_min = 8000 },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
            }
        },
        ["KURA6R"] = {
            name = "KURA6R",
            runway = "RW05R",
            waypoints = {
                { name = "KURAD", type = "UR", altitude_min = 10000 },
                { name = "XT", type = "UR", altitude_min = 10000 },
            }
        },
        ["KURA6Y"] = {
            name = "KURA6Y",
            runway = "RW23L",
            waypoints = {
                { name = "KURAD", type = "UR", altitude_min = 8000 },
                { name = "XT", type = "UR", altitude_min = 3700, altitude_max = 9000 },
            }
        },
        ["MOLI6H"] = {
            name = "MOLI6H",
            runway = "RW05R",
            waypoints = {
                { name = "MOLIK", type = "UR", altitude_min = 9000 },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR" },
                { name = "D262K", type = "UR", altitude_min = 4000 },
            }
        },
        ["MOLI6K"] = {
            name = "MOLI6K",
            runway = "RW23L",
            waypoints = {
                { name = "MOLIK", type = "UR", altitude_min = 9000 },
                { name = "XT", type = "UR", altitude_min = 3700 },
            }
        },
        ["MOLI6M"] = {
            name = "MOLI6M",
            runway = "",
            waypoints = {
                { name = "MOLIK", type = "UR", altitude_min = 9000 },
                { name = "MOLIK", type = "UR", altitude_min = 9000 },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
                { name = "MOLIK", type = "UR", altitude_min = 9000 },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
            }
        },
        ["MOLI6R"] = {
            name = "MOLI6R",
            runway = "RW05R",
            waypoints = {
                { name = "MOLIK", type = "UR", altitude_min = 9000 },
                { name = "SM", type = "UR", altitude_min = 7000, altitude_max = 8000 },
                { name = "KK502", type = "UR", altitude_min = 4000 },
            }
        },
        ["MOLI6Y"] = {
            name = "MOLI6Y",
            runway = "RW23L",
            waypoints = {
                { name = "MOLIK", type = "UR", altitude_min = 9000 },
                { name = "KK206", type = "UR", altitude_min = 6000 },
                { name = "XT", type = "UR", altitude_min = 3700, altitude_max = 9000 },
            }
        },
        ["ND6H"] = {
            name = "ND6H",
            runway = "RW05R",
            waypoints = {
                { name = "ND", type = "UR", altitude_min = 16000 },
                { name = "LENIR", type = "UR", altitude_min = 15000 },
                { name = "RF", type = "UR" },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR" },
                { name = "D262K", type = "UR", altitude_min = 4000 },
            }
        },
        ["ND6K"] = {
            name = "ND6K",
            runway = "RW23L",
            waypoints = {
                { name = "ND", type = "UR", altitude_min = 16000 },
                { name = "LENIR", type = "UR", altitude_min = 15000 },
                { name = "RF", type = "UR" },
                { name = "NZ", type = "UR", altitude_min = 6000 },
            }
        },
        ["ND6M"] = {
            name = "ND6M",
            runway = "",
            waypoints = {
                { name = "ND", type = "UR", altitude_min = 16000 },
                { name = "ND", type = "UR", altitude_min = 16000 },
                { name = "LENIR", type = "UR", altitude_min = 15000 },
                { name = "RF", type = "UR" },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
                { name = "ND", type = "UR", altitude_min = 16000 },
                { name = "LENIR", type = "UR", altitude_min = 15000 },
                { name = "RF", type = "UR" },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
            }
        },
        ["ND6R"] = {
            name = "ND6R",
            runway = "RW05R",
            waypoints = {
                { name = "ND", type = "UR", altitude_min = 16000 },
                { name = "LENIR", type = "UR", altitude_min = 16000 },
                { name = "RF", type = "UR", altitude_min = 16000 },
                { name = "XT", type = "UR", altitude_min = 10000 },
            }
        },
        ["ND6Y"] = {
            name = "ND6Y",
            runway = "RW23L",
            waypoints = {
                { name = "ND", type = "UR", altitude_min = 16000 },
                { name = "LENIR", type = "UR", altitude_min = 15000 },
                { name = "RF", type = "UR", altitude_max = 12000 },
                { name = "KK204", type = "UR", altitude_min = 2400 },
            }
        },
        ["OSNI6H"] = {
            name = "OSNI6H",
            runway = "RW05R",
            waypoints = {
                { name = "OSNIR", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
            }
        },
        ["OSNI6K"] = {
            name = "OSNI6K",
            runway = "RW23L",
            waypoints = {
                { name = "OSNIR", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
            }
        },
        ["OSNI6M"] = {
            name = "OSNI6M",
            runway = "",
            waypoints = {
                { name = "OSNIR", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
            }
        },
        ["OSNI6R"] = {
            name = "OSNI6R",
            runway = "RW05R",
            waypoints = {
                { name = "OSNIR", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000, altitude_max = 8000 },
                { name = "KK502", type = "UR", altitude_min = 4000 },
            }
        },
        ["OSNI6Y"] = {
            name = "OSNI6Y",
            runway = "RW23L",
            waypoints = {
                { name = "OSNIR", type = "UR", altitude_min = 13000 },
                { name = "KK208", type = "UR", altitude_min = 12000 },
                { name = "KK207", type = "UR" },
                { name = "KK201", type = "UR", altitude_min = 2600 },
            }
        },
        ["RANI6H"] = {
            name = "RANI6H",
            runway = "RW05R",
            waypoints = {
                { name = "RANIS", type = "UR", altitude_min = 20000 },
                { name = "KN46A", type = "UR", altitude_min = 19000 },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR" },
                { name = "D262K", type = "UR", altitude_min = 4000 },
            }
        },
        ["RANI6K"] = {
            name = "RANI6K",
            runway = "RW23L",
            waypoints = {
                { name = "RANIS", type = "UR", altitude_min = 20000 },
                { name = "KN46A", type = "UR", altitude_min = 19000 },
                { name = "XT", type = "UR", altitude_min = 3700 },
            }
        },
        ["RANI6M"] = {
            name = "RANI6M",
            runway = "",
            waypoints = {
                { name = "RANIS", type = "UR", altitude_min = 20000 },
                { name = "RANIS", type = "UR", altitude_min = 20000 },
                { name = "KN46A", type = "UR", altitude_min = 19000 },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
                { name = "RANIS", type = "UR", altitude_min = 20000 },
                { name = "KN46A", type = "UR", altitude_min = 19000 },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
            }
        },
        ["RANI6R"] = {
            name = "RANI6R",
            runway = "RW05R",
            waypoints = {
                { name = "RANIS", type = "UR", altitude_min = 18000 },
                { name = "KK511", type = "UR", altitude_min = 12000 },
                { name = "XT", type = "UR", altitude_min = 10000 },
            }
        },
        ["RANI6Y"] = {
            name = "RANI6Y",
            runway = "RW23L",
            waypoints = {
                { name = "RANIS", type = "UR", altitude_min = 18000 },
                { name = "KK214", type = "UR", altitude_min = 6000 },
                { name = "XT", type = "UR", altitude_min = 3700, altitude_max = 9000 },
            }
        },
        ["RULA6H"] = {
            name = "RULA6H",
            runway = "RW05R",
            waypoints = {
                { name = "RULAB", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
            }
        },
        ["RULA6K"] = {
            name = "RULA6K",
            runway = "RW23L",
            waypoints = {
                { name = "RULAB", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
            }
        },
        ["RULA6M"] = {
            name = "RULA6M",
            runway = "",
            waypoints = {
                { name = "RULAB", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
            }
        },
        ["RULA6R"] = {
            name = "RULA6R",
            runway = "RW05R",
            waypoints = {
                { name = "RULAB", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000, altitude_max = 8000 },
                { name = "KK502", type = "UR", altitude_min = 4000 },
            }
        },
        ["RULA6Y"] = {
            name = "RULA6Y",
            runway = "RW23L",
            waypoints = {
                { name = "RULAB", type = "UR", altitude_min = 13000 },
                { name = "SM", type = "UR" },
                { name = "KK208", type = "UR", altitude_min = 12000 },
                { name = "KK207", type = "UR" },
                { name = "KK201", type = "UR", altitude_min = 2600 },
            }
        },
        ["SIBA6H"] = {
            name = "SIBA6H",
            runway = "RW05R",
            waypoints = {
                { name = "SIBAN", type = "UR", altitude_min = 10000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
            }
        },
        ["SIBA6K"] = {
            name = "SIBA6K",
            runway = "RW23L",
            waypoints = {
                { name = "SIBAN", type = "UR", altitude_min = 10000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
            }
        },
        ["SIBA6M"] = {
            name = "SIBA6M",
            runway = "",
            waypoints = {
                { name = "SIBAN", type = "UR", altitude_min = 10000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
                { name = "SM", type = "UR", altitude_min = 7000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
            }
        },
        ["SIBA6R"] = {
            name = "SIBA6R",
            runway = "RW05R",
            waypoints = {
                { name = "SIBAN", type = "UR", altitude_min = 10000 },
                { name = "SM", type = "UR", altitude_min = 7000, altitude_max = 8000 },
                { name = "KK502", type = "UR", altitude_min = 4000 },
            }
        },
        ["SIBA6Y"] = {
            name = "SIBA6Y",
            runway = "RW23L",
            waypoints = {
                { name = "SIBAN", type = "UR", altitude_min = 12000 },
                { name = "SM", type = "UR" },
                { name = "KK208", type = "UR", altitude_min = 12000 },
                { name = "KK207", type = "UR" },
                { name = "KK201", type = "UR", altitude_min = 2600 },
            }
        },
        ["UMBI6H"] = {
            name = "UMBI6H",
            runway = "RW05R",
            waypoints = {
                { name = "UMBIK", type = "UR", altitude_min = 8000 },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR" },
                { name = "D262K", type = "UR", altitude_min = 4000 },
            }
        },
        ["UMBI6K"] = {
            name = "UMBI6K",
            runway = "RW23L",
            waypoints = {
                { name = "UMBIK", type = "UR", altitude_min = 8000 },
                { name = "NZ", type = "UR", altitude_min = 6000 },
            }
        },
        ["UMBI6M"] = {
            name = "UMBI6M",
            runway = "",
            waypoints = {
                { name = "UMBIK", type = "UR", altitude_min = 8000 },
                { name = "UMBIK", type = "UR", altitude_min = 8000 },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
                { name = "UMBIK", type = "UR", altitude_min = 8000 },
                { name = "XT", type = "UR", altitude_min = 6000 },
                { name = "KND", type = "UR", altitude_min = 3500, altitude_max = 4000 },
            }
        },
        ["UMBI6R"] = {
            name = "UMBI6R",
            runway = "RW05R",
            waypoints = {
                { name = "UMBIK", type = "UR", altitude_min = 10000 },
                { name = "XT", type = "UR", altitude_min = 10000 },
            }
        },
        ["UMBI6Y"] = {
            name = "UMBI6Y",
            runway = "RW23L",
            waypoints = {
                { name = "UMBIK", type = "UR", altitude_min = 8000 },
                { name = "KK204", type = "UR", altitude_min = 2400 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D05RY"] = {
            name = "D05RY",
            type = "D",
            runway = "D05RY",
            waypoints = {
                { name = "FD05R", transition = "", type = "UR" },
                { name = "16VOR", transition = "", type = "UR" },
                { name = "KND", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["D05RZ"] = {
            name = "D05RZ",
            type = "A",
            runway = "D05RZ",
            waypoints = {
                { name = "D002K", transition = "D002K", type = "UR", altitude_min = 6000 },
                { name = "D262K", transition = "D002K", type = "UR", altitude_min = 4000 },
                { name = "D257K", transition = "D002K", type = "UR", altitude_min = 4000 },
                { name = "CF05R", transition = "D002K", type = "UR", altitude_min = 2800 },
                { name = "D257K", transition = "D257K", type = "UR", altitude_min = 4000 },
                { name = "CF05R", transition = "D257K", type = "UR", altitude_min = 2800 },
                { name = "D262K", transition = "D262K", type = "UR", altitude_min = 4000 },
                { name = "D257K", transition = "D262K", type = "UR", altitude_min = 4000 },
                { name = "CF05R", transition = "D262K", type = "UR", altitude_min = 2800 },
                { name = "SM", transition = "SM", type = "UR", altitude_min = 7000 },
                { name = "CF05R", transition = "SM", type = "UR", altitude_min = 2800 },
                { name = "CF05R", transition = "", type = "UR", altitude_min = 2800 },
                { name = "FD05R", transition = "", type = "UR" },
                { name = "16VOR", transition = "", type = "UR" },
                { name = "KND", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["D23LX"] = {
            name = "D23LX",
            type = "D",
            runway = "D23LX",
            waypoints = {
                { name = "FF23L", transition = "", type = "UR" },
                { name = "RW23L", transition = "", type = "UR" },
                { name = "KND", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["D23LY"] = {
            name = "D23LY",
            type = "A",
            runway = "D23LY",
            waypoints = {
                { name = "SM", transition = "SM", type = "UR", altitude_min = 7000 },
                { name = "D027H", transition = "SM", type = "UR" },
                { name = "XT", transition = "SM", type = "UR", altitude_min = 3700 },
                { name = "CD2LY", transition = "SM", type = "UR", altitude_min = 3700 },
                { name = "XT", transition = "XT", type = "UR", altitude_min = 3700 },
                { name = "CD2LY", transition = "XT", type = "UR", altitude_min = 3700 },
                { name = "CD2LY", transition = "", type = "UR", altitude_min = 3700 },
                { name = "FF23L", transition = "", type = "UR" },
                { name = "RW23L", transition = "", type = "UR" },
                { name = "KND", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["D23LZ"] = {
            name = "D23LZ",
            type = "A",
            runway = "D23LZ",
            waypoints = {
                { name = "D002N", transition = "D002N", type = "UR", altitude_min = 6000 },
                { name = "CD2LZ", transition = "D002N", type = "UR", altitude_min = 3000 },
                { name = "D257N", transition = "D257N", type = "UR", altitude_min = 6000 },
                { name = "D262N", transition = "D257N", type = "UR", altitude_min = 6000 },
                { name = "D002N", transition = "D257N", type = "UR", altitude_min = 6000 },
                { name = "CD2LZ", transition = "D257N", type = "UR", altitude_min = 3000 },
                { name = "D262N", transition = "D262N", type = "UR", altitude_min = 6000 },
                { name = "D002N", transition = "D262N", type = "UR", altitude_min = 6000 },
                { name = "CD2LZ", transition = "D262N", type = "UR", altitude_min = 3000 },
                { name = "NZ", transition = "NZ", type = "UR", altitude_min = 6000 },
                { name = "CD2LZ", transition = "NZ", type = "UR", altitude_min = 3000 },
                { name = "CD2LZ", transition = "", type = "UR", altitude_min = 3000 },
                { name = "FF23L", transition = "", type = "UR" },
                { name = "RW23L", transition = "", type = "UR" },
                { name = "KND", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["I05RX"] = {
            name = "I05RX",
            type = "I",
            runway = "I05RX",
            waypoints = {
                { name = "CI05R", transition = "", type = "UR" },
                { name = "FI05R", transition = "", type = "UR" },
                { name = "RW05R", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["I05RY"] = {
            name = "I05RY",
            type = "A",
            runway = "I05RY",
            waypoints = {
                { name = "D002K", transition = "D002K", type = "UR", altitude_min = 6000 },
                { name = "D262K", transition = "D002K", type = "UR", altitude_min = 4000 },
                { name = "D257K", transition = "D002K", type = "UR", altitude_min = 4000 },
                { name = "D238K", transition = "D002K", type = "UR" },
                { name = "", transition = "D002K", type = "" },
                { name = "D257K", transition = "D257K", type = "UR", altitude_min = 4000 },
                { name = "D238K", transition = "D257K", type = "UR" },
                { name = "", transition = "D257K", type = "" },
                { name = "D262K", transition = "D262K", type = "UR", altitude_min = 4000 },
                { name = "D257K", transition = "D262K", type = "UR", altitude_min = 4000 },
                { name = "D238K", transition = "D262K", type = "UR" },
                { name = "", transition = "D262K", type = "" },
                { name = "SM", transition = "SM", type = "UR", altitude_min = 7000 },
                { name = "CF05R", transition = "SM", type = "UR", altitude_min = 2800 },
                { name = "CF05R", transition = "", type = "UR" },
                { name = "FI05R", transition = "", type = "UR" },
                { name = "RW05R", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["I05RZ"] = {
            name = "I05RZ",
            type = "A",
            runway = "I05RZ",
            waypoints = {
                { name = "KK502", transition = "KK502", type = "UR", altitude_min = 4000 },
                { name = "KK504", transition = "KK502", type = "UR", altitude_min = 2800 },
                { name = "KK503", transition = "KK503", type = "UR", altitude_min = 4000 },
                { name = "KK504", transition = "KK503", type = "UR", altitude_min = 2800 },
                { name = "XT", transition = "XT", type = "UR", altitude_min = 10000 },
                { name = "KK501", transition = "XT", type = "UR", speed = 210.0 },
                { name = "KK504", transition = "XT", type = "UR", altitude_min = 2800 },
                { name = "KK504", transition = "", type = "UR" },
                { name = "FI05R", transition = "", type = "UR" },
                { name = "RW05R", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["I23LW"] = {
            name = "I23LW",
            type = "I",
            runway = "I23LW",
            waypoints = {
                { name = "CI23L", transition = "", type = "UR" },
                { name = "FI23L", transition = "", type = "UR" },
                { name = "RW23L", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["I23LX"] = {
            name = "I23LX",
            type = "A",
            runway = "I23LX",
            waypoints = {
                { name = "SM", transition = "SM", type = "UR", altitude_min = 7000 },
                { name = "", transition = "SM", type = "" },
                { name = "XT", transition = "SM", type = "UR", altitude_min = 3700 },
                { name = "D053R", transition = "SM", type = "UR" },
                { name = "", transition = "SM", type = "" },
                { name = "XT", transition = "XT", type = "UR", altitude_min = 3700 },
                { name = "D053R", transition = "XT", type = "UR" },
                { name = "", transition = "XT", type = "" },
                { name = "CI2LX", transition = "", type = "UR" },
                { name = "FI23L", transition = "", type = "UR" },
                { name = "RW23L", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["I23LY"] = {
            name = "I23LY",
            type = "A",
            runway = "I23LY",
            waypoints = {
                { name = "D002N", transition = "D002N", type = "UR", altitude_min = 6000 },
                { name = "D034N", transition = "D002N", type = "UR" },
                { name = "", transition = "D002N", type = "" },
                { name = "D257N", transition = "D257N", type = "UR", altitude_min = 6000 },
                { name = "D262N", transition = "D257N", type = "UR", altitude_min = 6000 },
                { name = "D002N", transition = "D257N", type = "UR", altitude_min = 6000 },
                { name = "D034N", transition = "D257N", type = "UR" },
                { name = "", transition = "D257N", type = "" },
                { name = "D262N", transition = "D262N", type = "UR", altitude_min = 6000 },
                { name = "D002N", transition = "D262N", type = "UR", altitude_min = 6000 },
                { name = "D034N", transition = "D262N", type = "UR" },
                { name = "", transition = "D262N", type = "" },
                { name = "NZ", transition = "NZ", type = "UR", altitude_min = 6000 },
                { name = "CI2LY", transition = "NZ", type = "UR", altitude_min = 3000 },
                { name = "CI2LY", transition = "", type = "UR" },
                { name = "FI23L", transition = "", type = "UR" },
                { name = "RW23L", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["I23LZ"] = {
            name = "I23LZ",
            type = "A",
            runway = "I23LZ",
            waypoints = {
                { name = "KK201", transition = "KK201", type = "UR", altitude_min = 2600 },
                { name = "KK204", transition = "KK201", type = "UR", altitude_min = 2400 },
                { name = "KK202", transition = "KK202", type = "UR", altitude_min = 4000 },
                { name = "KK204", transition = "KK202", type = "UR", altitude_min = 2400 },
                { name = "XT", transition = "XT", type = "UR", altitude_min = 3700, altitude_max = 9000 },
                { name = "KK201", transition = "XT", type = "UR", altitude_min = 2600 },
                { name = "KK204", transition = "XT", type = "UR", altitude_min = 2400 },
                { name = "KK204", transition = "", type = "UR" },
                { name = "FI23L", transition = "", type = "UR" },
                { name = "RW23L", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["J05R"] = {
            name = "J05R",
            type = "A",
            runway = "J05R",
            waypoints = {
                { name = "KK502", transition = "KK502", type = "UR", altitude_min = 4000 },
                { name = "KK504", transition = "KK502", type = "UR", altitude_min = 2800 },
                { name = "KK503", transition = "KK503", type = "UR", altitude_min = 4000 },
                { name = "KK504", transition = "KK503", type = "UR", altitude_min = 2800 },
                { name = "XT", transition = "XT", type = "UR", altitude_min = 10000 },
                { name = "KK501", transition = "XT", type = "UR", speed = 210.0 },
                { name = "KK504", transition = "XT", type = "UR", altitude_min = 2800 },
                { name = "KK504", transition = "", type = "UR" },
                { name = "KK505", transition = "", type = "UR" },
                { name = "RW05R", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["J23L"] = {
            name = "J23L",
            type = "A",
            runway = "J23L",
            waypoints = {
                { name = "KK201", transition = "KK201", type = "UR", altitude_min = 2600 },
                { name = "KK204", transition = "KK201", type = "UR", altitude_min = 2400 },
                { name = "KK202", transition = "KK202", type = "UR", altitude_min = 4000 },
                { name = "KK204", transition = "KK202", type = "UR", altitude_min = 2400 },
                { name = "XT", transition = "XT", type = "UR", altitude_min = 3700, altitude_max = 9000 },
                { name = "KK201", transition = "XT", type = "UR", altitude_min = 2600 },
                { name = "KK204", transition = "XT", type = "UR", altitude_min = 2400 },
                { name = "KK204", transition = "", type = "UR" },
                { name = "KK205", transition = "", type = "UK" },
                { name = "RW23L", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["R05R"] = {
            name = "R05R",
            type = "A",
            runway = "R05R",
            waypoints = {
                { name = "KK502", transition = "KK502", type = "UR", altitude_min = 4000 },
                { name = "KK504", transition = "KK502", type = "UR", altitude_min = 2800 },
                { name = "KK503", transition = "KK503", type = "UR", altitude_min = 4000 },
                { name = "KK504", transition = "KK503", type = "UR", altitude_min = 2800 },
                { name = "XT", transition = "XT", type = "UR", altitude_min = 10000 },
                { name = "KK501", transition = "XT", type = "UR", speed = 210.0 },
                { name = "KK504", transition = "XT", type = "UR", altitude_min = 2800 },
                { name = "KK504", transition = "", type = "UR", altitude_min = 2800 },
                { name = "KK505", transition = "", type = "UR" },
                { name = "21THR", transition = "", type = "UR" },
                { name = "RW05R", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["R23L"] = {
            name = "R23L",
            type = "A",
            runway = "R23L",
            waypoints = {
                { name = "KK201", transition = "KK201", type = "UR", altitude_min = 2600 },
                { name = "KK204", transition = "KK201", type = "UR", altitude_min = 2400 },
                { name = "KK202", transition = "KK202", type = "UR", altitude_min = 4000 },
                { name = "KK204", transition = "KK202", type = "UR", altitude_min = 2400 },
                { name = "XT", transition = "XT", type = "UR", altitude_min = 3700, altitude_max = 9000 },
                { name = "KK201", transition = "XT", type = "UR", altitude_min = 2600 },
                { name = "KK204", transition = "XT", type = "UR", altitude_min = 2400 },
                { name = "KK204", transition = "", type = "UR", altitude_min = 2400 },
                { name = "KK205", transition = "", type = "UK" },
                { name = "15THR", transition = "", type = "UR" },
                { name = "RW23L", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["S05RX"] = {
            name = "S05RX",
            type = "S",
            runway = "S05RX",
            waypoints = {
                { name = "FS05R", transition = "", type = "UR" },
                { name = "KND", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "XT", transition = "", type = "UR" },
            }
        },
        ["S23LW"] = {
            name = "S23LW",
            type = "S",
            runway = "S23LW",
            waypoints = {
                { name = "FS23L", transition = "", type = "UR", altitude_min = 1500 },
                { name = "RW23L", transition = "", type = "UR" },
                { name = "KND", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "XT", transition = "", type = "UR" },
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
