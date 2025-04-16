local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIII",
        Name = "OIII Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["D107O"] = { lat = 6.123077778, lon = 1.512244444, type = "DXXX" },
        ["EGVEL"] = { lat = 34.716111111, lon = 50.501388889, type = "ENRT" },
        ["BOXAM"] = { lat = 34.630277778, lon = 51.863055556, type = "ENRT" },
        ["ROSEP"] = { lat = 35.611583333, lon = 51.575194444, type = "OIII" },
        ["D130R"] = { lat = 35.49015, lon = 51.536338889, type = "OIII" },
        ["RW29R"] = { lat = 20.518, lon = -103.295666667, type = "MMGL" },
        ["D120S"] = { lat = 45.054311111, lon = 20.022861111, type = "LYBT" },
        ["MD286"] = { lat = 35.680808333, lon = 51.335344444, type = "OIII" },
        ["TRN35"] = { lat = 35.896847222, lon = 50.602355556, type = "OIII" },
        ["DAXIL"] = { lat = 34.859722222, lon = 49.581666667, type = "ENRT" },
        ["D014G"] = { lat = 42.340530556, lon = -8.597222222, type = "LEVX" },
        ["II502"] = { lat = 35.694666667, lon = 51.291638889, type = "OIII" },
        ["GOLKI"] = { lat = 35.6175, lon = 51.252611111, type = "OIII" },
        ["OBRIX"] = { lat = 34.761111111, lon = 52.144444444, type = "ENRT" },
        ["DE29L"] = { lat = 35.69465, lon = 51.291644444, type = "OIII" },
        ["D245L"] = { lat = 13.365002778, lon = -89.238691667, type = "MSLP" },
        ["CI29L"] = { lat = 37.906666667, lon = 58.525, type = "UTAA" },
        ["PAROT"] = { lat = 36.191111111, lon = 49.978055556, type = "ENRT" },
        ["ORBIN"] = { lat = 35.387222222, lon = 51.345, type = "OIII" },
        ["FD286"] = { lat = 35.637, lon = 51.474669444, type = "OIII" },
        ["MD11R"] = { lat = 35.699291667, lon = 51.263511111, type = "OIII" },
        ["TOPMI"] = { lat = 35.486944444, lon = 51.163611111, type = "OIII" },
        ["MUXOR"] = { lat = 35.491666667, lon = 52.696388889, type = "ENRT" },
        ["FD29L"] = { lat = 34.298927778, lon = 47.279408333, type = "OICC" },
        ["D190I"] = { lat = 30.459430556, lon = 104.467780556, type = "ZUTF" },
        ["TRN37"] = { lat = 35.385961111, lon = 51.937827778, type = "ENRT" },
        ["DE11L"] = { lat = 35.525725, lon = 24.168280556, type = "LGSA" },
        ["RW29L"] = { lat = 20.514083333, lon = -103.292666667, type = "MMGL" },
        ["NAGMO"] = { lat = 36.037222222, lon = 51.348611111, type = "ENRT" },
        ["D137O"] = { lat = 54.192283333, lon = -110.083033333, type = "CYOD" },
        ["IVIGO"] = { lat = 35.561027778, lon = 51.444777778, type = "OIII" },
        ["PAXID"] = { lat = 36.284166667, lon = 50.339166667, type = "ENRT" },
        ["D135L"] = { lat = 16.605372222, lon = -99.619122222, type = "MMAA" },
        ["DE11R"] = { lat = 35.682413889, lon = 51.333627778, type = "OIII" },
        ["FD11R"] = { lat = 35.453044444, lon = 51.024155556, type = "OIIE" },
        ["D116O"] = { lat = 61.044019444, lon = 7.625713889, type = "ENSG" },
        ["PARIR"] = { lat = 35.555305556, lon = 51.767555556, type = "OIII" },
        ["D105O"] = { lat = 30.486875, lon = 111.790691667, type = "ZHYC" },
        ["MIVAK"] = { lat = 35.9875, lon = 49.89, type = "ENRT" },
        ["CD11R"] = { lat = 35.480055556, lon = 50.927627778, type = "OIIE" },
        ["II501"] = { lat = 35.63975, lon = 51.478944444, type = "OIII" },
        ["TRN57"] = { lat = 35.445369444, lon = 50.160205556, type = "OIII" },
        ["LOPAR"] = { lat = 35.583444444, lon = 51.671388889, type = "OIII" },
        ["TRN36"] = { lat = 35.778122222, lon = 50.555988889, type = "OIII" },
        ["D204Y"] = { lat = 35.33165, lon = 51.036958333, type = "ENRT" },
        ["DENVU"] = { lat = 35.532972222, lon = 51.540944444, type = "OIII" },
        ["D116R"] = { lat = 35.546133333, lon = 51.59015, type = "OIII" },
        ["FI29R"] = { lat = 39.475113889, lon = 116.661361111, type = "ZBAD" },
        ["ELUSI"] = { lat = 34.526388889, lon = 51.363333333, type = "ENRT" },
        ["RADAL"] = { lat = 34.906388889, lon = 52.339722222, type = "ENRT" },
        ["CD286"] = { lat = 35.606902778, lon = 51.570008333, type = "OIII" },
        ["D106T"] = { lat = 35.576727778, lon = 51.665275, type = "OIII" },
        ["D270L"] = { lat = 52.424802778, lon = 13.804944444, type = "EDDB" },
        ["DE29R"] = { lat = 35.536875, lon = 24.133977778, type = "LGSA" },
        ["SOBUR"] = { lat = 35.744722222, lon = 50.878333333, type = "OIII" },
        ["TRN29"] = { lat = 35.763252778, lon = 50.69245, type = "OIII" },
        ["CD29L"] = { lat = 34.264855556, lon = 47.371216667, type = "OICC" },
        ["D200H"] = { lat = 51.904972222, lon = 85.784344444, type = "UNBG" },
        ["PAVET"] = { lat = 35.444166667, lon = 49.883611111, type = "ENRT" },
        ["D270Y"] = { lat = 35.732261111, lon = 50.773930556, type = "OIII" },
        ["CI29R"] = { lat = 38.651627778, lon = 41.908963889, type = "LTCK" },
        ["TRN40"] = { lat = 35.078105556, lon = 51.589880556, type = "ENRT" },
        ["FI29L"] = { lat = 37.927222222, lon = 58.478333333, type = "UTAA" },
    },

    -- Данные ВПП
    Runways = {
        ["RW11L"] = {
            heading = 110,
            length = -1300.0,
            width = 0,
            threshold = { lat = 35.692994444444444, lon = 51.30461666666666 },
            end = { lat = 35.766170449250694, lon = 51.05706607234557 }
        },
        ["RW11R"] = {
            heading = 110,
            length = -1170.0,
            width = 0,
            threshold = { lat = 35.692702777777775, lon = 51.298344444444446 },
            end = { lat = 35.7585611821034, lon = 51.07554972430908 }
        },
        ["RW29L"] = {
            heading = 290,
            length = 1170.0,
            width = 0,
            threshold = { lat = 35.68241388888889, lon = 51.33362777777778 },
            end = { lat = 35.74827229321452, lon = 51.110861791540316 }
        },
        ["RW29R"] = {
            heading = 290,
            length = 1300.0,
            width = 0,
            threshold = { lat = 35.68452222222222, lon = 51.33371666666667 },
            end = { lat = 35.75769822702847, lon = 51.0861923633165 }
        },
    },

    -- Процедуры SID
    SID = {
        ["DAXI1A"] = {
            name = "DAXI1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "RUS", type = "D" },
                { name = "DAXIL", type = "E" },
            }
        },
        ["DAXI1B"] = {
            name = "DAXI1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "RUS", type = "D" },
                { name = "DAXIL", type = "E" },
            }
        },
        ["DHN2C"] = {
            name = "DHN2C",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360, speed = 240.0 },
                { name = "TRN", type = "D" },
                { name = "TRN", type = "D", altitude_min = 13000 },
                { name = "DHN", type = "D" },
            }
        },
        ["DHN3A"] = {
            name = "DHN3A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "D107O", type = "P" },
                { name = "DHN", type = "D" },
            }
        },
        ["DHN3B"] = {
            name = "DHN3B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "TRN", type = "D", altitude_min = 8000 },
                { name = "", type = "" },
                { name = "DHN", type = "D" },
            }
        },
        ["EGVE2A"] = {
            name = "EGVE2A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "RUS", type = "D" },
                { name = "EGVEL", type = "E" },
            }
        },
        ["EGVE2B"] = {
            name = "EGVE2B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "RUS", type = "D" },
                { name = "EGVEL", type = "E" },
            }
        },
        ["ELUS1A"] = {
            name = "ELUS1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "ELUSI", type = "E" },
            }
        },
        ["ELUS1B"] = {
            name = "ELUS1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "ELUSI", type = "E" },
            }
        },
        ["ELUS1C"] = {
            name = "ELUS1C",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "TRN", type = "D" },
                { name = "TRN", type = "D", altitude_min = 13000 },
                { name = "ELUSI", type = "E" },
            }
        },
        ["ELUS1D"] = {
            name = "ELUS1D",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "TRN", type = "D" },
                { name = "TRN", type = "D", altitude_min = 13000 },
                { name = "ELUSI", type = "E" },
            }
        },
        ["MEHR1B"] = {
            name = "MEHR1B",
            runway = "RW11L",
            waypoints = {
                { name = "DE11L", type = "P" },
                { name = "", type = "" },
                { name = "DE11R", type = "P" },
                { name = "", type = "" },
            }
        },
        ["MEHR2A"] = {
            name = "MEHR2A",
            runway = "RW29L",
            waypoints = {
                { name = "DE29L", type = "P" },
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "DE29R", type = "P" },
                { name = "", type = "" },
                { name = "", type = "" },
            }
        },
        ["NAGM1A"] = {
            name = "NAGM1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "D245L", type = "P", speed = 240.0 },
                { name = "TRN", type = "D", altitude_min = 13000 },
                { name = "NAGMO", type = "E" },
            }
        },
        ["NAGM1B"] = {
            name = "NAGM1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "D135L", type = "P", speed = 240.0 },
                { name = "TRN", type = "D", altitude_min = 13000 },
                { name = "NAGMO", type = "E" },
            }
        },
        ["OBRI2A"] = {
            name = "OBRI2A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "OBRIX", type = "E" },
            }
        },
        ["OBRI2B"] = {
            name = "OBRI2B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "OBRIX", type = "E" },
            }
        },
        ["OBRI2C"] = {
            name = "OBRI2C",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "TRN", type = "D", speed = 240.0 },
                { name = "TRN", type = "D", altitude_min = 13000 },
                { name = "OBRIX", type = "E" },
            }
        },
        ["PARO3A"] = {
            name = "PARO3A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "D270L", type = "P", altitude_min = 9000 },
                { name = "", type = "" },
                { name = "PAROT", type = "E" },
            }
        },
        ["PARO3B"] = {
            name = "PARO3B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "D270L", type = "P", altitude_min = 9000 },
                { name = "", type = "" },
                { name = "PAROT", type = "E" },
            }
        },
        ["PARO4C"] = {
            name = "PARO4C",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "TRN", type = "D", speed = 240.0 },
                { name = "TRN", type = "D", altitude_min = 13000 },
                { name = "PAROT", type = "E" },
            }
        },
        ["PAVE2A"] = {
            name = "PAVE2A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "PAVET", type = "E" },
            }
        },
        ["PAVE2B"] = {
            name = "PAVE2B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "PAVET", type = "E" },
            }
        },
        ["PAVE3C"] = {
            name = "PAVE3C",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "TRN", type = "D", speed = 240.0 },
                { name = "TRN", type = "D", altitude_min = 13000 },
                { name = "PAVET", type = "E" },
            }
        },
        ["PAXI3A"] = {
            name = "PAXI3A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "D270Y", type = "P" },
                { name = "", type = "" },
                { name = "PAXID", type = "E" },
            }
        },
        ["PAXI3B"] = {
            name = "PAXI3B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "D270Y", type = "P" },
                { name = "", type = "" },
                { name = "PAXID", type = "E" },
            }
        },
        ["RUS2A"] = {
            name = "RUS2A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "RUS", type = "D" },
            }
        },
        ["RUS2B"] = {
            name = "RUS2B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "RUS", type = "D" },
            }
        },
        ["SAV2A"] = {
            name = "SAV2A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "SAV", type = "D" },
            }
        },
        ["SAV2B"] = {
            name = "SAV2B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "SAV", type = "D" },
            }
        },
        ["SAV3C"] = {
            name = "SAV3C",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "TRN", type = "D", speed = 240.0 },
                { name = "TRN", type = "D", altitude_min = 13000 },
                { name = "SAV", type = "D" },
            }
        },
        ["VR1A"] = {
            name = "VR1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "VR", type = "D" },
            }
        },
        ["VR1B"] = {
            name = "VR1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 4360 },
                { name = "", type = "" },
                { name = "VR", type = "D" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BOXA1P"] = {
            name = "BOXA1P",
            runway = "ALL",
            waypoints = {
                { name = "BOXAM", type = "OI" },
                { name = "PARIR", type = "OI" },
            }
        },
        ["BOXA1R"] = {
            name = "BOXA1R",
            runway = "ALL",
            waypoints = {
                { name = "BOXAM", type = "OI" },
                { name = "TRN40", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["BOXA1S"] = {
            name = "BOXA1S",
            runway = "RW29B",
            waypoints = {
                { name = "BOXAM", type = "OI" },
                { name = "VR", type = "OI" },
                { name = "TOPMI", type = "OI" },
                { name = "D200H", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["BOXA1Z"] = {
            name = "BOXA1Z",
            runway = "ALL",
            waypoints = {
                { name = "BOXAM", type = "OI" },
                { name = "TRN40", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["BOXA2N"] = {
            name = "BOXA2N",
            runway = "ALL",
            waypoints = {
                { name = "BOXAM", type = "OI" },
                { name = "VR", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["BOXA2V"] = {
            name = "BOXA2V",
            runway = "ALL",
            waypoints = {
                { name = "BOXAM", type = "OI" },
                { name = "VR", type = "OI" },
            }
        },
        ["MIVA1S"] = {
            name = "MIVA1S",
            runway = "RW11B",
            waypoints = {
                { name = "MIVAK", type = "OI" },
                { name = "RUS", type = "OI" },
                { name = "ORBIN", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["MIVA1Y"] = {
            name = "MIVA1Y",
            runway = "ALL",
            waypoints = {
                { name = "MIVAK", type = "OI" },
                { name = "TRN36", type = "OI" },
                { name = "SOBUR", type = "OI" },
            }
        },
        ["MIVA2Z"] = {
            name = "MIVA2Z",
            runway = "ALL",
            waypoints = {
                { name = "MIVAK", type = "OI" },
                { name = "TRN36", type = "OI" },
                { name = "D190I", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["MIVA3R"] = {
            name = "MIVA3R",
            runway = "ALL",
            waypoints = {
                { name = "MIVAK", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["MIVA4N"] = {
            name = "MIVA4N",
            runway = "ALL",
            waypoints = {
                { name = "MIVAK", type = "OI" },
                { name = "RUS", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["MUXO1N"] = {
            name = "MUXO1N",
            runway = "ALL",
            waypoints = {
                { name = "MUXOR", type = "OI" },
                { name = "TRN37", type = "OI" },
                { name = "VR", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["MUXO1S"] = {
            name = "MUXO1S",
            runway = "RW29B",
            waypoints = {
                { name = "MUXOR", type = "OI" },
                { name = "TRN37", type = "OI" },
                { name = "VR", type = "OI" },
                { name = "TOPMI", type = "OI" },
                { name = "D200H", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["MUXO1V"] = {
            name = "MUXO1V",
            runway = "ALL",
            waypoints = {
                { name = "MUXOR", type = "OI" },
                { name = "TRN37", type = "OI" },
                { name = "VR", type = "OI" },
            }
        },
        ["MUXO2P"] = {
            name = "MUXO2P",
            runway = "ALL",
            waypoints = {
                { name = "MUXOR", type = "OI" },
                { name = "PARIR", type = "OI" },
            }
        },
        ["MUXO2Z"] = {
            name = "MUXO2Z",
            runway = "ALL",
            waypoints = {
                { name = "MUXOR", type = "OI" },
                { name = "D120S", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["NAGM1V"] = {
            name = "NAGM1V",
            runway = "ALL",
            waypoints = {
                { name = "NAGMO", type = "OI" },
                { name = "TRN", type = "OI" },
                { name = "VR", type = "OI" },
            }
        },
        ["NAGM2R"] = {
            name = "NAGM2R",
            runway = "ALL",
            waypoints = {
                { name = "NAGMO", type = "OI" },
                { name = "TRN", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["PAVE1S"] = {
            name = "PAVE1S",
            runway = "RW11B",
            waypoints = {
                { name = "PAVET", type = "OI" },
                { name = "TRN57", type = "OI" },
                { name = "RUS", type = "OI" },
                { name = "ORBIN", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["PAVE2R"] = {
            name = "PAVE2R",
            runway = "ALL",
            waypoints = {
                { name = "PAVET", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["PAXI1S"] = {
            name = "PAXI1S",
            runway = "RW11B",
            waypoints = {
                { name = "PAXID", type = "OI" },
                { name = "TRN35", type = "OI" },
                { name = "RUS", type = "OI" },
                { name = "ORBIN", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["PAXI1Y"] = {
            name = "PAXI1Y",
            runway = "ALL",
            waypoints = {
                { name = "PAXID", type = "OI" },
                { name = "TRN35", type = "OI" },
                { name = "TRN29", type = "OI" },
                { name = "SOBUR", type = "OI" },
            }
        },
        ["PAXI2N"] = {
            name = "PAXI2N",
            runway = "ALL",
            waypoints = {
                { name = "PAXID", type = "OI" },
                { name = "TRN35", type = "OI" },
                { name = "RUS", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["PAXI2R"] = {
            name = "PAXI2R",
            runway = "ALL",
            waypoints = {
                { name = "PAXID", type = "OI" },
                { name = "TRN35", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["PAXI2Z"] = {
            name = "PAXI2Z",
            runway = "ALL",
            waypoints = {
                { name = "PAXID", type = "OI" },
                { name = "TRN35", type = "OI" },
                { name = "TRN29", type = "OI" },
                { name = "D190I", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["RADA1N"] = {
            name = "RADA1N",
            runway = "ALL",
            waypoints = {
                { name = "RADAL", type = "OI" },
                { name = "VR", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["RADA1S"] = {
            name = "RADA1S",
            runway = "RW29B",
            waypoints = {
                { name = "RADAL", type = "OI" },
                { name = "VR", type = "OI" },
                { name = "TOPMI", type = "OI" },
                { name = "D200H", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["RADA2P"] = {
            name = "RADA2P",
            runway = "ALL",
            waypoints = {
                { name = "RADAL", type = "OI" },
                { name = "PARIR", type = "OI" },
            }
        },
        ["RADA2R"] = {
            name = "RADA2R",
            runway = "ALL",
            waypoints = {
                { name = "RADAL", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["RADA2V"] = {
            name = "RADA2V",
            runway = "ALL",
            waypoints = {
                { name = "RADAL", type = "OI" },
                { name = "VR", type = "OI" },
            }
        },
        ["RUS1V"] = {
            name = "RUS1V",
            runway = "ALL",
            waypoints = {
                { name = "RUS", type = "OI" },
                { name = "VR", type = "OI" },
            }
        },
        ["RUS2Z"] = {
            name = "RUS2Z",
            runway = "ALL",
            waypoints = {
                { name = "RUS", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["SAV1R"] = {
            name = "SAV1R",
            runway = "ALL",
            waypoints = {
                { name = "SAV", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["SAV1V"] = {
            name = "SAV1V",
            runway = "RW11B",
            waypoints = {
                { name = "SAV", type = "OI" },
                { name = "RUS", type = "OI" },
                { name = "ORBIN", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["SAV1Z"] = {
            name = "SAV1Z",
            runway = "ALL",
            waypoints = {
                { name = "SAV", type = "OI" },
                { name = "D204Y", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["SAV2N"] = {
            name = "SAV2N",
            runway = "ALL",
            waypoints = {
                { name = "SAV", type = "OI" },
                { name = "RUS", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["VR1R"] = {
            name = "VR1R",
            runway = "ALL",
            waypoints = {
                { name = "VR", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["VR1Z"] = {
            name = "VR1Z",
            runway = "ALL",
            waypoints = {
                { name = "VR", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D11R"] = {
            name = "D11R",
            type = "A",
            runway = "D11R",
            waypoints = {
                { name = "KAZ", transition = "KAZ", type = "OI" },
                { name = "D014G", transition = "KAZ", type = "OI" },
                { name = "CD11R", transition = "KAZ", type = "OI", altitude_min = 7800 },
                { name = "RUS", transition = "RUS", type = "OI" },
                { name = "D014G", transition = "RUS", type = "OI" },
                { name = "CD11R", transition = "RUS", type = "OI", altitude_min = 7800 },
                { name = "SOBUR", transition = "SOBUR", type = "OI" },
                { name = "CD11R", transition = "SOBUR", type = "OI", altitude_min = 7800 },
                { name = "CD11R", transition = "", type = "OI", altitude_min = 7800 },
                { name = "FD11R", transition = "", type = "OI", altitude_min = 6700 },
                { name = "MD11R", transition = "", type = "OI" },
                { name = "TRN", transition = "", type = "OI" },
                { name = "TRN", transition = "", type = "OI", altitude_min = 7000 },
                { name = "KAZ", transition = "", type = "OI" },
                { name = "KAZ", transition = "", type = "OI", altitude_min = 8000, speed = 220.0 },
            }
        },
        ["D29L"] = {
            name = "D29L",
            type = "A",
            runway = "D29L",
            waypoints = {
                { name = "PARIR", transition = "PARIR", type = "OI" },
                { name = "D106T", transition = "PARIR", type = "OI" },
                { name = "CD29L", transition = "PARIR", type = "OI", altitude_min = 8000 },
                { name = "VR", transition = "VR", type = "OI", speed = 185.0 },
                { name = "D106T", transition = "VR", type = "OI", altitude_min = 9000 },
                { name = "CD29L", transition = "VR", type = "OI", altitude_min = 8000 },
                { name = "CD29L", transition = "", type = "OI", altitude_min = 8000 },
                { name = "FD29L", transition = "", type = "OI", altitude_min = 6600 },
                { name = "RW29L", transition = "", type = "OI" },
                { name = "TRN", transition = "", type = "OI" },
                { name = "KAZ", transition = "", type = "OI" },
                { name = "KAZ", transition = "", type = "OI", speed = 220.0 },
            }
        },
        ["I29LY"] = {
            name = "I29LY",
            type = "A",
            runway = "I29LY",
            waypoints = {
                { name = "KAZ", transition = "KAZ", type = "OI", speed = 185.0 },
                { name = "D137O", transition = "KAZ", type = "OI" },
                { name = "D116O", transition = "KAZ", type = "OI", altitude_min = 8000 },
                { name = "", transition = "KAZ", type = "" },
                { name = "PARIR", transition = "PARIR", type = "OI" },
                { name = "PARIR", transition = "PARIR", type = "OI" },
                { name = "CI29L", transition = "PARIR", type = "OI", altitude_min = 8000 },
                { name = "VR", transition = "VR", type = "OI", speed = 220.0 },
                { name = "", transition = "VR", type = "", altitude_min = 8000 },
                { name = "", transition = "VR", type = "" },
                { name = "CI29L", transition = "", type = "OI" },
                { name = "FI29L", transition = "", type = "OI" },
                { name = "RW29L", transition = "", type = "OI" },
                { name = "TRN", transition = "", type = "OI", altitude_min = 4360 },
                { name = "KAZ", transition = "", type = "OI" },
                { name = "KAZ", transition = "", type = "OI", speed = 220.0 },
            }
        },
        ["I29LZ"] = {
            name = "I29LZ",
            type = "A",
            runway = "I29LZ",
            waypoints = {
                { name = "DENVU", transition = "DENVU", type = "OI", altitude_min = 8500, speed = 200.0 },
                { name = "ROSEP", transition = "DENVU", type = "OI", altitude_min = 7400 },
                { name = "PARIR", transition = "PARIR", type = "OI", altitude_min = 11000, speed = 220.0 },
                { name = "LOPAR", transition = "PARIR", type = "OI", altitude_min = 9000 },
                { name = "ROSEP", transition = "PARIR", type = "OI", altitude_min = 7400 },
                { name = "ROSEP", transition = "", type = "OI" },
                { name = "II501", transition = "", type = "OI" },
                { name = "RW29L", transition = "", type = "OI" },
                { name = "II502", transition = "", type = "OI", altitude_min = 4040 },
                { name = "GOLKI", transition = "", type = "OI", altitude_min = 5200, speed = 200.0 },
                { name = "IVIGO", transition = "", type = "OI", altitude_min = 7000, speed = 200.0 },
                { name = "DENVU", transition = "", type = "OI", altitude_min = 8500, speed = 200.0 },
                { name = "DENVU", transition = "", type = "OI", altitude_min = 8500, speed = 200.0 },
            }
        },
        ["I29R"] = {
            name = "I29R",
            type = "A",
            runway = "I29R",
            waypoints = {
                { name = "KAZ", transition = "KAZ", type = "OI", speed = 185.0 },
                { name = "D130R", transition = "KAZ", type = "OI" },
                { name = "D116R", transition = "KAZ", type = "OI", altitude_min = 8000 },
                { name = "", transition = "KAZ", type = "" },
                { name = "CI29R", transition = "KAZ", type = "OI", altitude_min = 7600 },
                { name = "PARIR", transition = "PARIR", type = "OI" },
                { name = "D105O", transition = "PARIR", type = "OI", altitude_min = 8000 },
                { name = "CI29R", transition = "PARIR", type = "OI", altitude_min = 7600 },
                { name = "VR", transition = "VR", type = "OI" },
                { name = "D105O", transition = "VR", type = "OI", altitude_min = 8000 },
                { name = "CI29R", transition = "VR", type = "OI", altitude_min = 7600 },
                { name = "CI29R", transition = "", type = "OI" },
                { name = "FI29R", transition = "", type = "OI" },
                { name = "RW29R", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 4500 },
                { name = "", transition = "", type = "" },
                { name = "TRN", transition = "", type = "OI", altitude_min = 7000 },
                { name = "KAZ", transition = "", type = "OI" },
                { name = "KAZ", transition = "", type = "OI", altitude_min = 8000, speed = 220.0 },
            }
        },
        ["VORA"] = {
            name = "VORA",
            type = "A",
            runway = "VORA",
            waypoints = {
                { name = "KAZ", transition = "KAZ", type = "OI", speed = 185.0 },
                { name = "D137O", transition = "KAZ", type = "OI" },
                { name = "CD286", transition = "KAZ", type = "OI", altitude_min = 8000 },
                { name = "VR", transition = "VR", type = "OI", speed = 220.0 },
                { name = "CD286", transition = "VR", type = "OI", altitude_min = 8000 },
                { name = "CD286", transition = "", type = "OI", altitude_min = 8000 },
                { name = "FD286", transition = "", type = "OI", altitude_min = 7700 },
                { name = "MD286", transition = "", type = "OI" },
                { name = "TRN", transition = "", type = "OI" },
                { name = "KAZ", transition = "", type = "OI" },
                { name = "KAZ", transition = "", type = "OI", speed = 220.0 },
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
