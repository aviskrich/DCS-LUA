local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LTAN",
        Name = "LTAN Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["OKELI"] = { lat = 38.728888889, lon = 33.016666667, type = "ENRT" },
        ["MA19R"] = { lat = 38.107958333, lon = -7.928569444, type = "LPBJ" },
        ["YANIK"] = { lat = 37.64545, lon = 32.433352778, type = "LTAN" },
        ["FF19R"] = { lat = 38.200891667, lon = -7.916325, type = "LPBJ" },
        ["FF009"] = { lat = 4.499444444, lon = 18.493333333, type = "FEFF" },
        ["FF01L"] = { lat = 37.868536111, lon = 32.517183333, type = "LTAN" },
        ["KNY30"] = { lat = 38.070488889, lon = 31.9385, type = "LTAN" },
        ["MA01L"] = { lat = 37.943813889, lon = 32.544927778, type = "LTAN" },
        ["CESUR"] = { lat = 37.773316667, lon = 32.481594444, type = "LTAN" },
        ["D021H"] = { lat = 10.574455556, lon = 14.321211111, type = "FKKL" },
        ["D019C"] = { lat = 38.042636111, lon = 32.589477778, type = "LTAN" },
        ["D189H"] = { lat = 30.735016667, lon = 114.459072222, type = "ZHHH" },
        ["D021G"] = { lat = 48.290986111, lon = -77.798986111, type = "CYVO" },
        ["OBRUK"] = { lat = 38.023888889, lon = 33.118888889, type = "ENRT" },
        ["D189I"] = { lat = 37.842394444, lon = 32.518458333, type = "LTAN" },
        ["LUMOS"] = { lat = 37.6725, lon = 32.464166667, type = "ENRT" },
        ["HISAR"] = { lat = 38.115555556, lon = 31.541111111, type = "ENRT" },
        ["D019E"] = { lat = 38.073280556, lon = 32.606186111, type = "LTAN" },
        ["MA19L"] = { lat = 38.01175, lon = 32.573455556, type = "LTAN" },
        ["D274E"] = { lat = 51.756727778, lon = -1.736911111, type = "EGVN" },
        ["TUTUM"] = { lat = 38.348611111, lon = 32.780555556, type = "LTAN" },
        ["FF01R"] = { lat = 37.86675, lon = 32.5257, type = "LTAN" },
        ["PENON"] = { lat = 38.046388889, lon = 32.147222222, type = "LTAN" },
        ["D192J"] = { lat = 54.243333333, lon = 48.685277778, type = "UWLW" },
        ["D189N"] = { lat = 40.32375, lon = 109.976788889, type = "ZBOW" },
        ["D189J"] = { lat = 48.456944444, lon = 17.767222222, type = "LZPP" },
        ["D019H"] = { lat = -16.96605, lon = 49.826058333, type = "FMMS" },
        ["D215E"] = { lat = 37.932541667, lon = 32.497030556, type = "LTAN" },
        ["FI01L"] = { lat = 29.973416667, lon = 31.802305556, type = "HECP" },
        ["D082L"] = { lat = 24.141577778, lon = -104.297797222, type = "MMDO" },
        ["D189E"] = { lat = -18.207452778, lon = 49.4034, type = "FMMT" },
        ["FF19L"] = { lat = 38.087161111, lon = 32.618575, type = "LTAN" },
        ["CI01L"] = { lat = 29.828277778, lon = 31.757055556, type = "HECP" },
        ["MA01R"] = { lat = 37.943077778, lon = 32.548447222, type = "LTAN" },
        ["GIPIR"] = { lat = 38.221944444, lon = 32.7025, type = "ENRT" },
        ["D021N"] = { lat = 23.008594444, lon = 5.535877778, type = "DAAT" },
        ["SEHIR"] = { lat = 37.651666667, lon = 32.203611111, type = "ENRT" },
        ["YENER"] = { lat = 37.693463889, lon = 32.616283333, type = "LTAN" },
        ["ANZER"] = { lat = 37.8852, lon = 32.523877778, type = "LTAN" },
    },

    -- Данные ВПП
    Runways = {
        ["RW01L"] = {
            heading = 10,
            length = 230.0,
            width = 0,
            threshold = { lat = 37.9651, lon = 32.55416111111111 },
            end = { lat = 38.00237802992581, lon = 32.56249855703183 }
        },
        ["RW01R"] = {
            heading = 10,
            length = 270.0,
            width = 0,
            threshold = { lat = 37.96455, lon = 32.55648055555555 },
            end = { lat = 38.00831116556508, lon = 32.56626791876045 }
        },
        ["RW19L"] = {
            heading = 190,
            length = 270.0,
            width = 0,
            threshold = { lat = 37.99344166666667, lon = 32.56744444444445 },
            end = { lat = 37.94968050110159, lon = 32.55765322749602 }
        },
        ["RW19R"] = {
            heading = 190,
            length = 230.0,
            width = 0,
            threshold = { lat = 37.993991666666666, lon = 32.56512222222222 },
            end = { lat = 37.95671363674086, lon = 32.55678149339336 }
        },
    },

    -- Процедуры SID
    SID = {
        ["HISA1A"] = {
            name = "HISA1A",
            runway = "RW01B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "D019H", type = "P", speed = 204.0 },
                { name = "KNY", type = "D", altitude_min = 8000 },
                { name = "PENON", type = "P" },
                { name = "HISAR", type = "E" },
            }
        },
        ["HISA1B"] = {
            name = "HISA1B",
            runway = "RW19B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "D189H", type = "P", speed = 204.0 },
                { name = "KNY", type = "D", altitude_min = 7700 },
                { name = "PENON", type = "P" },
                { name = "HISAR", type = "E" },
            }
        },
        ["HISA1C"] = {
            name = "HISA1C",
            runway = "RW01B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "KNY", type = "D", altitude_min = 5700, speed = 204.0 },
                { name = "KNY", type = "D", altitude_min = 8000 },
                { name = "PENON", type = "P" },
                { name = "HISAR", type = "E" },
            }
        },
        ["HISA1D"] = {
            name = "HISA1D",
            runway = "RW19B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "KNY", type = "D", altitude_min = 5200, speed = 204.0 },
                { name = "KNY", type = "D", altitude_min = 7700 },
                { name = "PENON", type = "P" },
                { name = "HISAR", type = "E" },
            }
        },
        ["OBRU1A"] = {
            name = "OBRU1A",
            runway = "RW01B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "D019C", type = "P" },
                { name = "", type = "" },
                { name = "D082L", type = "P" },
                { name = "OBRUK", type = "E" },
            }
        },
        ["OBRU1B"] = {
            name = "OBRU1B",
            runway = "RW19B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "D189E", type = "P" },
                { name = "", type = "" },
                { name = "D082L", type = "P" },
                { name = "OBRUK", type = "E" },
            }
        },
        ["OBRU1C"] = {
            name = "OBRU1C",
            runway = "RW19B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "D189H", type = "P", speed = 204.0 },
                { name = "KNY", type = "D", altitude_min = 7500 },
                { name = "D082L", type = "P" },
                { name = "OBRUK", type = "E" },
            }
        },
        ["OBRU1D"] = {
            name = "OBRU1D",
            runway = "RW01B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "KNY", type = "D", altitude_min = 4150 },
                { name = "", type = "" },
                { name = "OBRUK", type = "E" },
            }
        },
        ["OBRU1E"] = {
            name = "OBRU1E",
            runway = "RW19B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "KNY", type = "D", altitude_min = 4160 },
                { name = "", type = "" },
                { name = "OBRUK", type = "E" },
            }
        },
        ["OBRU1F"] = {
            name = "OBRU1F",
            runway = "RW19B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "KNY", type = "D", altitude_min = 5100, speed = 204.0 },
                { name = "KNY", type = "D", altitude_min = 7500 },
                { name = "OBRUK", type = "E" },
            }
        },
        ["OKEL1A"] = {
            name = "OKEL1A",
            runway = "RW01B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "KNY", type = "D", altitude_min = 5600 },
                { name = "TUTUM", type = "P" },
                { name = "OKELI", type = "E" },
            }
        },
        ["OKEL1B"] = {
            name = "OKEL1B",
            runway = "RW19B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "D189H", type = "P", speed = 204.0 },
                { name = "KNY", type = "D", altitude_min = 7500 },
                { name = "TUTUM", type = "P" },
                { name = "OKELI", type = "E" },
            }
        },
        ["OKEL1C"] = {
            name = "OKEL1C",
            runway = "RW19B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "KNY", type = "D", altitude_min = 5100, speed = 204.0 },
                { name = "KNY", type = "D", altitude_min = 7500 },
                { name = "TUTUM", type = "P" },
                { name = "OKELI", type = "E" },
            }
        },
        ["OKEL1D"] = {
            name = "OKEL1D",
            runway = "RW01B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "D019H", type = "P", speed = 205.0 },
                { name = "KNY", type = "D", altitude_min = 7700 },
                { name = "D021N", type = "P", altitude_min = 11000 },
                { name = "TUTUM", type = "P" },
                { name = "OKELI", type = "E" },
            }
        },
        ["SEHI1A"] = {
            name = "SEHI1A",
            runway = "RW01B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "D019E", type = "P", speed = 204.0 },
                { name = "KNY", type = "D" },
                { name = "SEHIR", type = "E" },
            }
        },
        ["SEHI1B"] = {
            name = "SEHI1B",
            runway = "RW01B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "D019H", type = "P", speed = 204.0 },
                { name = "KNY", type = "D", altitude_min = 7700 },
                { name = "SEHIR", type = "E" },
            }
        },
        ["SEHI1C"] = {
            name = "SEHI1C",
            runway = "RW19B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "D189N", type = "P" },
                { name = "", type = "" },
                { name = "SEHIR", type = "E" },
            }
        },
        ["SEHI1D"] = {
            name = "SEHI1D",
            runway = "RW01B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "KNY", type = "D", altitude_min = 4650 },
                { name = "KNY", type = "D" },
                { name = "SEHIR", type = "E" },
            }
        },
        ["SEHI1E"] = {
            name = "SEHI1E",
            runway = "RW01B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "KNY", type = "D", altitude_min = 5500, speed = 204.0 },
                { name = "KNY", type = "D", altitude_min = 7700 },
                { name = "SEHIR", type = "E" },
            }
        },
        ["SEHI1F"] = {
            name = "SEHI1F",
            runway = "RW19B",
            waypoints = {
                { name = "", type = "", altitude_min = 3800 },
                { name = "KNY", type = "D", altitude_min = 6400 },
                { name = "", type = "" },
                { name = "SEHIR", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["HISA1S"] = {
            name = "HISA1S",
            runway = "RW01B",
            waypoints = {
                { name = "HISAR", type = "LT" },
                { name = "KNY30", type = "LT" },
                { name = "PENON", type = "LT" },
                { name = "D274E", type = "LT" },
                { name = "KNY", type = "LT" },
            }
        },
        ["HISA1T"] = {
            name = "HISA1T",
            runway = "RW01B",
            waypoints = {
                { name = "HISAR", type = "LT" },
                { name = "KNY30", type = "LT" },
                { name = "PENON", type = "LT" },
                { name = "LUMOS", type = "LT" },
            }
        },
        ["HISA1V"] = {
            name = "HISA1V",
            runway = "RW19B",
            waypoints = {
                { name = "HISAR", type = "LT" },
                { name = "KNY30", type = "LT" },
                { name = "PENON", type = "LT" },
                { name = "D274E", type = "LT" },
                { name = "KNY", type = "LT" },
            }
        },
        ["HISA1Y"] = {
            name = "HISA1Y",
            runway = "RW19B",
            waypoints = {
                { name = "HISAR", type = "LT" },
                { name = "KNY30", type = "LT" },
                { name = "PENON", type = "LT" },
                { name = "D274E", type = "LT" },
                { name = "KNY", type = "LT" },
                { name = "GIPIR", type = "LT" },
            }
        },
        ["HISA1Z"] = {
            name = "HISA1Z",
            runway = "RW19B",
            waypoints = {
                { name = "HISAR", type = "LT" },
                { name = "KNY30", type = "LT" },
                { name = "PENON", type = "LT" },
                { name = "GIPIR", type = "LT" },
            }
        },
        ["OBRU1S"] = {
            name = "OBRU1S",
            runway = "RW01B",
            waypoints = {
                { name = "OBRUK", type = "LT" },
                { name = "KNY", type = "LT" },
            }
        },
        ["OBRU1T"] = {
            name = "OBRU1T",
            runway = "RW01B",
            waypoints = {
                { name = "OBRUK", type = "LT" },
                { name = "LUMOS", type = "LT" },
            }
        },
        ["OBRU1V"] = {
            name = "OBRU1V",
            runway = "RW19B",
            waypoints = {
                { name = "OBRUK", type = "LT" },
                { name = "KNY", type = "LT" },
            }
        },
        ["OBRU1Y"] = {
            name = "OBRU1Y",
            runway = "RW19B",
            waypoints = {
                { name = "OBRUK", type = "LT" },
                { name = "GIPIR", type = "LT" },
            }
        },
        ["OKEL1S"] = {
            name = "OKEL1S",
            runway = "RW01B",
            waypoints = {
                { name = "OKELI", type = "LT" },
                { name = "TUTUM", type = "LT" },
                { name = "KNY", type = "LT" },
            }
        },
        ["OKEL1T"] = {
            name = "OKEL1T",
            runway = "RW01B",
            waypoints = {
                { name = "OKELI", type = "LT" },
                { name = "TUTUM", type = "LT" },
                { name = "KNY", type = "LT" },
                { name = "LUMOS", type = "LT" },
            }
        },
        ["OKEL1V"] = {
            name = "OKEL1V",
            runway = "RW19B",
            waypoints = {
                { name = "OKELI", type = "LT" },
                { name = "TUTUM", type = "LT" },
                { name = "KNY", type = "LT" },
            }
        },
        ["OKEL1Y"] = {
            name = "OKEL1Y",
            runway = "RW19B",
            waypoints = {
                { name = "OKELI", type = "LT" },
                { name = "TUTUM", type = "LT" },
                { name = "GIPIR", type = "LT" },
            }
        },
        ["SEHI1S"] = {
            name = "SEHI1S",
            runway = "RW01B",
            waypoints = {
                { name = "SEHIR", type = "LT" },
                { name = "D215E", type = "LT" },
                { name = "KNY", type = "LT" },
            }
        },
        ["SEHI1T"] = {
            name = "SEHI1T",
            runway = "RW01B",
            waypoints = {
                { name = "SEHIR", type = "LT" },
                { name = "LUMOS", type = "LT" },
            }
        },
        ["SEHI1V"] = {
            name = "SEHI1V",
            runway = "RW19B",
            waypoints = {
                { name = "SEHIR", type = "LT" },
                { name = "D215E", type = "LT" },
                { name = "KNY", type = "LT" },
            }
        },
        ["SEHI1Y"] = {
            name = "SEHI1Y",
            runway = "RW19B",
            waypoints = {
                { name = "SEHIR", type = "LT" },
                { name = "D215E", type = "LT" },
                { name = "KNY", type = "LT" },
                { name = "GIPIR", type = "LT" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D01LU"] = {
            name = "D01LU",
            type = "A",
            runway = "D01LU",
            waypoints = {
                { name = "KNY", transition = "KNY", type = "LT", altitude_min = 8000 },
                { name = "FF01L", transition = "KNY", type = "LT", altitude_min = 5700 },
                { name = "FF01L", transition = "KNY", type = "LT", speed = 220.0 },
                { name = "D192J", transition = "KNY", type = "LT", altitude_min = 5700 },
                { name = "FF01L", transition = "KNY", type = "LT", altitude_min = 5300 },
                { name = "FF01L", transition = "", type = "LT", altitude_min = 5300 },
                { name = "MA01L", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 6000 },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["D01RW"] = {
            name = "D01RW",
            type = "A",
            runway = "D01RW",
            waypoints = {
                { name = "LUMOS", transition = "LUMOS", type = "LT", altitude_min = 8500 },
                { name = "D189I", transition = "LUMOS", type = "LT", altitude_min = 5300 },
                { name = "FF01R", transition = "LUMOS", type = "LT", altitude_min = 5300 },
                { name = "FF01R", transition = "", type = "LT", altitude_min = 5300 },
                { name = "MA01R", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 5700, speed = 185.0 },
                { name = "KNY", transition = "", type = "LT", altitude_min = 7400 },
                { name = "LUMOS", transition = "", type = "LT" },
                { name = "LUMOS", transition = "", type = "LT", altitude_min = 8500, speed = 230.0 },
            }
        },
        ["D01RY"] = {
            name = "D01RY",
            type = "A",
            runway = "D01RY",
            waypoints = {
                { name = "KNY", transition = "KNY", type = "LT", altitude_min = 8000 },
                { name = "FF01R", transition = "KNY", type = "LT", altitude_min = 5700 },
                { name = "FF01R", transition = "KNY", type = "LT", speed = 220.0 },
                { name = "D189J", transition = "KNY", type = "LT", altitude_min = 5700 },
                { name = "FF01R", transition = "KNY", type = "LT", altitude_min = 5300 },
                { name = "FF01R", transition = "", type = "LT", altitude_min = 5300 },
                { name = "MA01R", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 6000 },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["D19LX"] = {
            name = "D19LX",
            type = "A",
            runway = "D19LX",
            waypoints = {
                { name = "GIPIR", transition = "GIPIR", type = "LT", altitude_min = 7500 },
                { name = "D021G", transition = "GIPIR", type = "LT", altitude_min = 5700 },
                { name = "FF19L", transition = "GIPIR", type = "LT", altitude_min = 5700 },
                { name = "FF19L", transition = "", type = "LT", altitude_min = 5700 },
                { name = "MA19L", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 5100, speed = 185.0 },
                { name = "KNY", transition = "", type = "LT", altitude_min = 6400 },
                { name = "GIPIR", transition = "", type = "LT" },
                { name = "GIPIR", transition = "", type = "LT", altitude_min = 7500, speed = 230.0 },
            }
        },
        ["D19LZ"] = {
            name = "D19LZ",
            type = "A",
            runway = "D19LZ",
            waypoints = {
                { name = "KNY", transition = "KNY", type = "LT", altitude_min = 8000 },
                { name = "FF19L", transition = "KNY", type = "LT", altitude_min = 6300 },
                { name = "FF19L", transition = "KNY", type = "LT", speed = 220.0 },
                { name = "D021H", transition = "KNY", type = "LT", altitude_min = 6300 },
                { name = "FF19L", transition = "KNY", type = "LT", altitude_min = 5700 },
                { name = "FF19L", transition = "", type = "LT", altitude_min = 5700 },
                { name = "MA19L", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 6000 },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["D19RV"] = {
            name = "D19RV",
            type = "A",
            runway = "D19RV",
            waypoints = {
                { name = "KNY", transition = "KNY", type = "LT", altitude_min = 8000 },
                { name = "FF19R", transition = "KNY", type = "LT", altitude_min = 6300 },
                { name = "FF19R", transition = "KNY", type = "LT", speed = 220.0 },
                { name = "D019H", transition = "KNY", type = "LT", altitude_min = 6300 },
                { name = "FF19R", transition = "KNY", type = "LT", altitude_min = 5700 },
                { name = "FF19R", transition = "", type = "LT", altitude_min = 5700 },
                { name = "MA19R", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 6000 },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["I01LZ"] = {
            name = "I01LZ",
            type = "A",
            runway = "I01LZ",
            waypoints = {
                { name = "KNY", transition = "KNYN1", type = "LT", altitude_min = 8000 },
                { name = "KNY", transition = "KNYN1", type = "LT", altitude_min = 5700, speed = 220.0 },
                { name = "CI01L", transition = "KNYN1", type = "LT", altitude_min = 5700 },
                { name = "KNY", transition = "KNYN2", type = "LT", altitude_min = 8000 },
                { name = "KNY", transition = "KNYN2", type = "LT", altitude_min = 5700, speed = 220.0 },
                { name = "CI01L", transition = "KNYN2", type = "LT", altitude_min = 5700 },
                { name = "KNY", transition = "KNYV1", type = "LT", altitude_min = 8000 },
                { name = "KNY", transition = "KNYV1", type = "LT", altitude_min = 5700, speed = 220.0 },
                { name = "CI01L", transition = "KNYV1", type = "LT", altitude_min = 5700 },
                { name = "KNY", transition = "KNYV2", type = "LT", altitude_min = 8000 },
                { name = "KNY", transition = "KNYV2", type = "LT", altitude_min = 5700, speed = 220.0 },
                { name = "CI01L", transition = "KNYV2", type = "LT", altitude_min = 5700 },
                { name = "CI01L", transition = "", type = "LT" },
                { name = "FI01L", transition = "", type = "LT" },
                { name = "RW01L", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 5900 },
                { name = "", transition = "", type = "" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", speed = 230.0 },
            }
        },
        ["NDBA"] = {
            name = "NDBA",
            type = "A",
            runway = "NDBA",
            waypoints = {
                { name = "KNY", transition = "KNY1", type = "LT", altitude_min = 8000 },
                { name = "FF009", transition = "KNY1", type = "LT", altitude_min = 5700 },
                { name = "FF009", transition = "KNY1", type = "LT", speed = 185.0 },
                { name = "FF009", transition = "KNY1", type = "LT", altitude_min = 5700 },
                { name = "KNY", transition = "KNY2", type = "LT", altitude_min = 8000 },
                { name = "FF009", transition = "KNY2", type = "LT", altitude_min = 5700 },
                { name = "FF009", transition = "KNY2", type = "LT", speed = 185.0 },
                { name = "FF009", transition = "KNY2", type = "LT", altitude_min = 5700 },
                { name = "FF009", transition = "", type = "LT", altitude_min = 5700 },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 6000 },
                { name = "KNY", transition = "", type = "LT", speed = 185.0 },
                { name = "KNY", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["Q01LU"] = {
            name = "Q01LU",
            type = "A",
            runway = "Q01LU",
            waypoints = {
                { name = "KNY", transition = "KNY", type = "LT", altitude_min = 8000 },
                { name = "FF01L", transition = "KNY", type = "LT", altitude_min = 5700 },
                { name = "FF01L", transition = "KNY", type = "LT", speed = 220.0 },
                { name = "D192J", transition = "KNY", type = "LT", altitude_min = 5700 },
                { name = "FF01L", transition = "KNY", type = "LT", altitude_min = 5300 },
                { name = "FF01L", transition = "", type = "LT", altitude_min = 5300 },
                { name = "MA01L", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 6000 },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["Q01RW"] = {
            name = "Q01RW",
            type = "A",
            runway = "Q01RW",
            waypoints = {
                { name = "LUMOS", transition = "LUMOS", type = "LT", altitude_min = 8500 },
                { name = "D189I", transition = "LUMOS", type = "LT", altitude_min = 5300 },
                { name = "FF01R", transition = "LUMOS", type = "LT", altitude_min = 5300 },
                { name = "FF01R", transition = "", type = "LT", altitude_min = 5300 },
                { name = "MA01R", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 5700, speed = 185.0 },
                { name = "KNY", transition = "", type = "LT", altitude_min = 7400 },
                { name = "LUMOS", transition = "", type = "LT" },
                { name = "LUMOS", transition = "", type = "LT", altitude_min = 8500, speed = 230.0 },
            }
        },
        ["Q01RY"] = {
            name = "Q01RY",
            type = "A",
            runway = "Q01RY",
            waypoints = {
                { name = "KNY", transition = "KNY", type = "LT", altitude_min = 8000 },
                { name = "FF01R", transition = "KNY", type = "LT", altitude_min = 5700 },
                { name = "FF01R", transition = "KNY", type = "LT", speed = 220.0 },
                { name = "D189J", transition = "KNY", type = "LT", altitude_min = 5700 },
                { name = "FF01R", transition = "KNY", type = "LT", altitude_min = 5300 },
                { name = "FF01R", transition = "", type = "LT", altitude_min = 5300 },
                { name = "MA01R", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 6000 },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["Q19LX"] = {
            name = "Q19LX",
            type = "A",
            runway = "Q19LX",
            waypoints = {
                { name = "GIPIR", transition = "GIPIR", type = "LT", altitude_min = 7500 },
                { name = "D021G", transition = "GIPIR", type = "LT", altitude_min = 5700 },
                { name = "FF19L", transition = "GIPIR", type = "LT", altitude_min = 5700 },
                { name = "FF19L", transition = "", type = "LT", altitude_min = 5700 },
                { name = "MA19L", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 5100, speed = 185.0 },
                { name = "KNY", transition = "", type = "LT", altitude_min = 6400 },
                { name = "GIPIR", transition = "", type = "LT" },
                { name = "GIPIR", transition = "", type = "LT", altitude_min = 7500, speed = 230.0 },
            }
        },
        ["Q19LZ"] = {
            name = "Q19LZ",
            type = "A",
            runway = "Q19LZ",
            waypoints = {
                { name = "KNY", transition = "KNY", type = "LT", altitude_min = 8000 },
                { name = "FF19L", transition = "KNY", type = "LT", altitude_min = 6300 },
                { name = "FF19L", transition = "KNY", type = "LT", speed = 220.0 },
                { name = "D021H", transition = "KNY", type = "LT", altitude_min = 6300 },
                { name = "FF19L", transition = "KNY", type = "LT", altitude_min = 5700 },
                { name = "FF19L", transition = "", type = "LT", altitude_min = 5700 },
                { name = "MA19L", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 6000 },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["Q19RV"] = {
            name = "Q19RV",
            type = "A",
            runway = "Q19RV",
            waypoints = {
                { name = "KNY", transition = "KNY", type = "LT", altitude_min = 8000 },
                { name = "FF19R", transition = "KNY", type = "LT", altitude_min = 6300 },
                { name = "FF19R", transition = "KNY", type = "LT", speed = 220.0 },
                { name = "D019H", transition = "KNY", type = "LT", altitude_min = 6300 },
                { name = "FF19R", transition = "KNY", type = "LT", altitude_min = 5700 },
                { name = "FF19R", transition = "", type = "LT", altitude_min = 5700 },
                { name = "MA19R", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 6000 },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["R01L"] = {
            name = "R01L",
            type = "A",
            runway = "R01L",
            waypoints = {
                { name = "YANIK", transition = "YANIK", type = "LT", altitude_min = 8000, altitude_max = 14000 },
                { name = "CESUR", transition = "YANIK", type = "LT", altitude_min = 7000 },
                { name = "YENER", transition = "YENER", type = "LT", altitude_min = 7000, altitude_max = 14000 },
                { name = "CESUR", transition = "YENER", type = "LT", altitude_min = 7000 },
                { name = "CESUR", transition = "", type = "LT", altitude_min = 7000 },
                { name = "ANZER", transition = "", type = "LT", speed = 200.0 },
                { name = "RW01L", transition = "", type = "LT" },
                { name = "YENER", transition = "", type = "LT", altitude_min = 7000 },
                { name = "YENER", transition = "", type = "LT", altitude_max = 14000 },
            }
        },
        ["VORA"] = {
            name = "VORA",
            type = "A",
            runway = "VORA",
            waypoints = {
                { name = "KNY", transition = "KNY1", type = "LT", altitude_min = 8000 },
                { name = "FF009", transition = "KNY1", type = "LT", altitude_min = 5700 },
                { name = "FF009", transition = "KNY1", type = "LT", speed = 185.0 },
                { name = "FF009", transition = "KNY1", type = "LT", altitude_min = 5700 },
                { name = "KNY", transition = "KNY2", type = "LT", altitude_min = 8000 },
                { name = "FF009", transition = "KNY2", type = "LT", altitude_min = 5700 },
                { name = "FF009", transition = "KNY2", type = "LT", speed = 185.0 },
                { name = "FF009", transition = "KNY2", type = "LT", altitude_min = 5700 },
                { name = "FF009", transition = "", type = "LT", altitude_min = 5700 },
                { name = "KNY", transition = "", type = "LT" },
                { name = "KNY", transition = "", type = "LT", altitude_min = 6000 },
                { name = "KNY", transition = "", type = "LT", speed = 185.0 },
                { name = "KNY", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
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
