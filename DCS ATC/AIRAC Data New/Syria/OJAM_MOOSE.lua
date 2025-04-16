local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OJAM",
        Name = "OJAM Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["D180E"] = { lat = 31.918327778, lon = 36.060013889, type = "OJAM" },
        ["LUDAN"] = { lat = 32.049055556, lon = 36.620358333, type = "ENRT" },
        ["NIVLU"] = { lat = 32.087997222, lon = 36.271975, type = "OJAM" },
        ["AM240"] = { lat = 52.445305556, lon = 4.584305556, type = "EHAM" },
        ["D029J"] = { lat = 72.103333333, lon = 102.788333333, type = "UOHH" },
        ["QTR01"] = { lat = 31.248447222, lon = 36.059530556, type = "ENRT" },
        ["KULDI"] = { lat = 31.313075, lon = 36.537266667, type = "ENRT" },
        ["D140O"] = { lat = 42.740794444, lon = -8.198372222, type = "LEST" },
        ["LOSAR"] = { lat = 32.15835, lon = 36.480491667, type = "ENRT" },
        ["D250O"] = { lat = 6.084205556, lon = 1.038486111, type = "DXXX" },
        ["ORKAB"] = { lat = 31.929813889, lon = 35.887766667, type = "OJAM" },
        ["D048M"] = { lat = 4.520027778, lon = 18.688166667, type = "FEFF" },
        ["AM065"] = { lat = 31.882377778, lon = 36.370066667, type = "OJAM" },
        ["TALMI"] = { lat = 31.826666667, lon = 35.503888889, type = "ENRT" },
        ["AI150"] = { lat = 31.607241667, lon = 36.620216667, type = "ENRT" },
        ["RW06"] = { lat = 22.978633333, lon = -82.424944444, type = "MUHA" },
        ["QAA01"] = { lat = 31.739836111, lon = 36.157386111, type = "ENRT" },
        ["OSAMA"] = { lat = 31.930555556, lon = 35.618333333, type = "ENRT" },
        ["AM066"] = { lat = 32.004069444, lon = 36.065986111, type = "OJAM" },
        ["D239O"] = { lat = 11.431316667, lon = 42.877994444, type = "HDAM" },
        ["D258M"] = { lat = 42.540522222, lon = 27.229619444, type = "LBBG" },
        ["AM064"] = { lat = 52.251166667, lon = 4.789638889, type = "EHAM" },
        ["FI24"] = { lat = 59.299555556, lon = 24.428805556, type = "EEEI" },
        ["MUVIN"] = { lat = 31.816111111, lon = 35.545, type = "ENRT" },
        ["EMILO"] = { lat = 31.818202778, lon = 35.842419444, type = "OJAM" },
        ["DEBOK"] = { lat = 31.877958333, lon = 36.151047222, type = "OJAM" },
        ["D336O"] = { lat = 57.769038889, lon = -4.236413889, type = "EGPE" },
        ["ALNOR"] = { lat = 31.66535, lon = 36.418755556, type = "ENRT" },
        ["LOXER"] = { lat = 32.029933333, lon = 36.380961111, type = "ENRT" },
        ["CI24"] = { lat = 6.329969444, lon = 6.989611111, type = "DNAN" },
        ["D186O"] = { lat = 51.305666667, lon = 19.095388889, type = "EPLK" },
        ["D080G"] = { lat = 35.36595, lon = 1.655811111, type = "DAOB" },
        ["AM067"] = { lat = 32.004858333, lon = 35.845388889, type = "OJAM" },
        ["CS24"] = { lat = 32.025233333, lon = 36.119288889, type = "OJAM" },
        ["MUSAL"] = { lat = 31.968533333, lon = 35.757113889, type = "OJAM" },
        ["MOUAB"] = { lat = 31.799444444, lon = 35.599722222, type = "ENRT" },
        ["RALNA"] = { lat = 31.9325, lon = 35.5425, type = "ENRT" },
        ["AMN01"] = { lat = 32.004069444, lon = 36.065986111, type = "ENRT" },
        ["ORDAL"] = { lat = 31.88255, lon = 36.267136111, type = "OJAM" },
        ["D106C"] = { lat = 50.738797222, lon = -3.216661111, type = "EGTE" },
        ["IVADO"] = { lat = 32.131366667, lon = 36.378052778, type = "OJAM" },
        ["D209J"] = { lat = 55.164747222, lon = -4.914519444, type = "EGPK" },
        ["AI087"] = { lat = 31.492913889, lon = 36.070163889, type = "ENRT" },
        ["SOLOL"] = { lat = 31.893375, lon = 35.799522222, type = "OJAM" },
        ["KINUR"] = { lat = 31.607241667, lon = 36.620216667, type = "ENRT" },
        ["ELOXI"] = { lat = 31.566941667, lon = 36.759508333, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW06"] = {
            heading = 60,
            length = 0,
            width = 0,
            threshold = { lat = 31.96626111111111, lon = 35.97597777777778 },
            end = { lat = 31.96626111111111, lon = 35.97597777777778 }
        },
        ["RW24"] = {
            heading = 240,
            length = 0,
            width = 0,
            threshold = { lat = 31.97916111111111, lon = 36.007241666666665 },
            end = { lat = 31.97916111111111, lon = 36.007241666666665 }
        },
    },

    -- Процедуры SID
    SID = {
        ["KINU5D"] = {
            name = "KINU5D",
            runway = "RW06",
            waypoints = {
                { name = "AMN", type = "D", altitude_min = 4000 },
                { name = "AMN", type = "D", altitude_min = 5500 },
                { name = "QAA", type = "D", altitude_min = 6000 },
                { name = "ALNOR", type = "E", altitude_min = 7000 },
                { name = "KINUR", type = "E", altitude_min = 15000 },
            }
        },
        ["KULD1M"] = {
            name = "KULD1M",
            runway = "RW06",
            waypoints = {
                { name = "AMN01", type = "E", speed = 210.0 },
                { name = "QAA01", type = "E" },
                { name = "KULDI", type = "E", altitude_min = 15000 },
            }
        },
        ["KULD1N"] = {
            name = "KULD1N",
            runway = "RW24",
            waypoints = {
                { name = "ORKAB", type = "P", speed = 230.0 },
                { name = "AI087", type = "E", altitude_min = 7000 },
                { name = "KULDI", type = "E", altitude_min = 15000 },
            }
        },
        ["KULD4D"] = {
            name = "KULD4D",
            runway = "RW24",
            waypoints = {
                { name = "", type = "", altitude_min = 5000 },
                { name = "D209J", type = "E", altitude_min = 7000 },
                { name = "MDB", type = "D" },
                { name = "QTR", type = "D", altitude_min = 9000 },
                { name = "KULDI", type = "E", altitude_min = 15000 },
            }
        },
        ["KULD5D"] = {
            name = "KULD5D",
            runway = "RW06",
            waypoints = {
                { name = "AMN", type = "D", altitude_min = 4000 },
                { name = "AMN", type = "D", altitude_min = 5500 },
                { name = "QAA", type = "D", altitude_min = 6000 },
                { name = "D140O", type = "E", altitude_min = 7000 },
                { name = "KULDI", type = "E", altitude_min = 15000 },
            }
        },
        ["LOSA1M"] = {
            name = "LOSA1M",
            runway = "RW06",
            waypoints = {
                { name = "AMN01", type = "E", speed = 210.0 },
                { name = "QAA01", type = "E" },
                { name = "ORDAL", type = "P", altitude_min = 8500 },
                { name = "LOSAR", type = "E", altitude_min = 13000 },
            }
        },
        ["LOSA1N"] = {
            name = "LOSA1N",
            runway = "RW24",
            waypoints = {
                { name = "ORKAB", type = "P", speed = 230.0 },
                { name = "DEBOK", type = "P", altitude_min = 8500 },
                { name = "ORDAL", type = "P" },
                { name = "LOXER", type = "E", altitude_min = 9000 },
                { name = "LOSAR", type = "E", altitude_min = 13000 },
            }
        },
        ["LOSA4D"] = {
            name = "LOSA4D",
            runway = "RW24",
            waypoints = {
                { name = "", type = "", altitude_min = 5000 },
                { name = "AMN", type = "D" },
                { name = "D080G", type = "E", altitude_min = 8500 },
                { name = "LOXER", type = "E", altitude_min = 9000 },
                { name = "LOSAR", type = "E", altitude_min = 13000 },
            }
        },
        ["LOSA5D"] = {
            name = "LOSA5D",
            runway = "RW06",
            waypoints = {
                { name = "AMN", type = "D", altitude_min = 4000 },
                { name = "AMN", type = "D", altitude_min = 5500 },
                { name = "QAA", type = "D", altitude_min = 6000 },
                { name = "D029J", type = "E", altitude_min = 8500 },
                { name = "LOXER", type = "E", altitude_min = 9000 },
                { name = "LOSAR", type = "E", altitude_min = 13000 },
            }
        },
        ["LUDA1M"] = {
            name = "LUDA1M",
            runway = "RW06",
            waypoints = {
                { name = "AMN01", type = "E", speed = 210.0 },
                { name = "QAA01", type = "E" },
                { name = "AM065", type = "P", altitude_min = 8500 },
                { name = "LUDAN", type = "E", altitude_min = 11000 },
            }
        },
        ["LUDA1N"] = {
            name = "LUDA1N",
            runway = "RW24",
            waypoints = {
                { name = "ORKAB", type = "P", speed = 230.0 },
                { name = "DEBOK", type = "P", altitude_min = 8500 },
                { name = "ORDAL", type = "P" },
                { name = "LOXER", type = "E", altitude_min = 9000 },
                { name = "LUDAN", type = "E", altitude_min = 11000 },
            }
        },
        ["LUDA4D"] = {
            name = "LUDA4D",
            runway = "RW24",
            waypoints = {
                { name = "", type = "", altitude_min = 5000 },
                { name = "AMN", type = "D" },
                { name = "D080G", type = "E", altitude_min = 8500 },
                { name = "LOXER", type = "E" },
                { name = "LUDAN", type = "E", altitude_min = 11000 },
            }
        },
        ["LUDA5D"] = {
            name = "LUDA5D",
            runway = "RW06",
            waypoints = {
                { name = "AMN", type = "D", altitude_min = 4000 },
                { name = "AMN", type = "D", altitude_min = 5500 },
                { name = "QAA", type = "D", altitude_min = 6000 },
                { name = "D048M", type = "E", altitude_min = 8500 },
                { name = "LUDAN", type = "E", altitude_min = 11000 },
            }
        },
        ["MOUA1M"] = {
            name = "MOUA1M",
            runway = "RW06",
            waypoints = {
                { name = "AMN01", type = "E", speed = 210.0 },
                { name = "EMILO", type = "P" },
                { name = "MOUAB", type = "E", altitude_min = 11000 },
            }
        },
        ["MOUA1N"] = {
            name = "MOUA1N",
            runway = "RW24",
            waypoints = {
                { name = "ORKAB", type = "P", speed = 230.0 },
                { name = "EMILO", type = "P", speed = 230.0 },
                { name = "MOUAB", type = "E", altitude_min = 11000 },
            }
        },
        ["MUVI4D"] = {
            name = "MUVI4D",
            runway = "RW24",
            waypoints = {
                { name = "RW24", type = "P", altitude_min = 6000 },
                { name = "MOUAB", type = "E", altitude_min = 11000 },
                { name = "MUVIN", type = "E" },
                { name = "TALMI", type = "E" },
            }
        },
        ["MUVI5D"] = {
            name = "MUVI5D",
            runway = "RW06",
            waypoints = {
                { name = "AMN", type = "D", altitude_min = 4000 },
                { name = "D180E", type = "P", altitude_min = 5000 },
                { name = "", type = "" },
                { name = "D239O", type = "P", altitude_min = 6000 },
                { name = "MOUAB", type = "E", altitude_min = 11000 },
                { name = "MUVIN", type = "E" },
            }
        },
        ["OSAM1M"] = {
            name = "OSAM1M",
            runway = "RW06",
            waypoints = {
                { name = "AMN01", type = "E", speed = 210.0 },
                { name = "EMILO", type = "P" },
                { name = "OSAMA", type = "E" },
            }
        },
        ["OSAM1N"] = {
            name = "OSAM1N",
            runway = "RW24",
            waypoints = {
                { name = "ORKAB", type = "P", speed = 230.0 },
                { name = "MUSAL", type = "P", speed = 230.0 },
                { name = "OSAMA", type = "E" },
            }
        },
        ["QTR01M"] = {
            name = "QTR01M",
            runway = "RW06",
            waypoints = {
                { name = "AMN01", type = "E", speed = 210.0 },
                { name = "QAA01", type = "E" },
                { name = "QTR01", type = "E", altitude_min = 9000 },
            }
        },
        ["QTR01N"] = {
            name = "QTR01N",
            runway = "RW24",
            waypoints = {
                { name = "ORKAB", type = "P", speed = 230.0 },
                { name = "AI087", type = "E", altitude_min = 7000 },
                { name = "QTR01", type = "E", altitude_min = 9000 },
            }
        },
        ["QTR4D"] = {
            name = "QTR4D",
            runway = "RW24",
            waypoints = {
                { name = "", type = "", altitude_min = 5000 },
                { name = "D209J", type = "E", altitude_min = 7000 },
                { name = "MDB", type = "D" },
                { name = "QTR", type = "D", altitude_min = 9000 },
            }
        },
        ["QTR5D"] = {
            name = "QTR5D",
            runway = "RW06",
            waypoints = {
                { name = "AMN", type = "D", altitude_min = 4000 },
                { name = "AMN", type = "D", altitude_min = 5500 },
                { name = "QAA", type = "D", altitude_min = 6000 },
                { name = "D186O", type = "E", altitude_min = 7000 },
                { name = "QTR", type = "D", altitude_min = 9000 },
            }
        },
        ["RALN4D"] = {
            name = "RALN4D",
            runway = "RW24",
            waypoints = {
                { name = "RW24", type = "P" },
                { name = "D250O", type = "P", altitude_min = 6000 },
                { name = "OSAMA", type = "E" },
                { name = "RALNA", type = "E" },
            }
        },
        ["RALN5D"] = {
            name = "RALN5D",
            runway = "RW06",
            waypoints = {
                { name = "AMN", type = "D", altitude_min = 4000 },
                { name = "D180E", type = "P", altitude_min = 5000 },
                { name = "D250O", type = "P", altitude_min = 6000 },
                { name = "OSAMA", type = "E" },
                { name = "RALNA", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ELOX1K"] = {
            name = "ELOX1K",
            runway = "RW24",
            waypoints = {
                { name = "ELOXI", type = "OJ", altitude_min = 15000 },
                { name = "AI150", type = "OJ", altitude_min = 15000 },
                { name = "ALNOR", type = "OJ" },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
            }
        },
        ["ELOX1L"] = {
            name = "ELOX1L",
            runway = "RW06",
            waypoints = {
                { name = "ELOXI", type = "OJ", altitude_min = 15000 },
                { name = "AI150", type = "OJ", altitude_min = 15000 },
                { name = "ALNOR", type = "OJ" },
                { name = "EMILO", type = "OJ", altitude_min = 7000, speed = 210.0 },
            }
        },
        ["KINU4A"] = {
            name = "KINU4A",
            runway = "RW24",
            waypoints = {
                { name = "KINUR", type = "OJ", altitude_min = 15000 },
                { name = "ALNOR", type = "OJ", altitude_min = 7000 },
                { name = "QAA", type = "OJ" },
                { name = "AMN", type = "OJ" },
            }
        },
        ["KULD1K"] = {
            name = "KULD1K",
            runway = "RW24",
            waypoints = {
                { name = "KULDI", type = "OJ", altitude_min = 15000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
            }
        },
        ["KULD1L"] = {
            name = "KULD1L",
            runway = "RW06",
            waypoints = {
                { name = "KULDI", type = "OJ", altitude_min = 15000 },
                { name = "AI087", type = "OJ", altitude_min = 7000 },
                { name = "EMILO", type = "OJ", altitude_min = 7000, speed = 210.0 },
            }
        },
        ["KULD4A"] = {
            name = "KULD4A",
            runway = "RW24",
            waypoints = {
                { name = "KULDI", type = "OJ", altitude_min = 15000 },
                { name = "D140O", type = "OJ", altitude_min = 7000 },
                { name = "QAA", type = "OJ" },
                { name = "AMN", type = "OJ" },
            }
        },
        ["KULD5A"] = {
            name = "KULD5A",
            runway = "RW06",
            waypoints = {
                { name = "KULDI", type = "OJ", altitude_min = 15000 },
                { name = "QTR", type = "OJ", altitude_min = 9000 },
                { name = "D336O", type = "OJ", altitude_min = 7000 },
                { name = "MDB", type = "OJ" },
                { name = "D209J", type = "OJ", altitude_min = 7000 },
                { name = "AMN", type = "OJ" },
            }
        },
        ["LOSA1K"] = {
            name = "LOSA1K",
            runway = "RW24",
            waypoints = {
                { name = "LOSAR", type = "OJ", altitude_min = 13000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
            }
        },
        ["LOSA1L"] = {
            name = "LOSA1L",
            runway = "RW06",
            waypoints = {
                { name = "LOSAR", type = "OJ", altitude_min = 13000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
                { name = "AM066", type = "OJ", altitude_min = 9000 },
                { name = "AM067", type = "OJ", speed = 210.0 },
                { name = "MUSAL", type = "OJ", altitude_min = 7000, speed = 210.0 },
            }
        },
        ["LOSA4A"] = {
            name = "LOSA4A",
            runway = "RW24",
            waypoints = {
                { name = "LOSAR", type = "OJ", altitude_min = 13000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
                { name = "D029J", type = "OJ", altitude_min = 8500 },
                { name = "QAA", type = "OJ" },
                { name = "AMN", type = "OJ" },
            }
        },
        ["LOSA5A"] = {
            name = "LOSA5A",
            runway = "RW06",
            waypoints = {
                { name = "LOSAR", type = "OJ", altitude_min = 13000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
                { name = "D080G", type = "OJ", altitude_min = 8500 },
                { name = "AMN", type = "OJ" },
            }
        },
        ["LUDA1K"] = {
            name = "LUDA1K",
            runway = "RW24",
            waypoints = {
                { name = "LUDAN", type = "OJ", altitude_min = 11000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
            }
        },
        ["LUDA1L"] = {
            name = "LUDA1L",
            runway = "RW06",
            waypoints = {
                { name = "LUDAN", type = "OJ", altitude_min = 11000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
                { name = "AM066", type = "OJ", altitude_min = 9000 },
                { name = "AM067", type = "OJ", speed = 210.0 },
                { name = "MUSAL", type = "OJ", altitude_min = 7000, speed = 210.0 },
            }
        },
        ["LUDA4A"] = {
            name = "LUDA4A",
            runway = "RW24",
            waypoints = {
                { name = "LUDAN", type = "OJ", altitude_min = 11000 },
                { name = "D048M", type = "OJ", altitude_min = 8500 },
                { name = "QAA", type = "OJ" },
                { name = "AMN", type = "OJ" },
            }
        },
        ["LUDA5A"] = {
            name = "LUDA5A",
            runway = "RW06",
            waypoints = {
                { name = "LUDAN", type = "OJ", altitude_min = 11000 },
                { name = "D080G", type = "OJ", altitude_min = 8500 },
                { name = "AMN", type = "OJ" },
            }
        },
        ["OSAM1K"] = {
            name = "OSAM1K",
            runway = "RW24",
            waypoints = {
                { name = "OSAMA", type = "OJ", altitude_min = 11000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
            }
        },
        ["OSAM1L"] = {
            name = "OSAM1L",
            runway = "RW06",
            waypoints = {
                { name = "OSAMA", type = "OJ", altitude_min = 11000 },
                { name = "MUSAL", type = "OJ", altitude_min = 7000, speed = 210.0 },
            }
        },
        ["QTR01K"] = {
            name = "QTR01K",
            runway = "RW24",
            waypoints = {
                { name = "QTR01", type = "OJ", altitude_min = 9000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
            }
        },
        ["QTR01L"] = {
            name = "QTR01L",
            runway = "RW06",
            waypoints = {
                { name = "QTR01", type = "OJ", altitude_min = 9000 },
                { name = "AI087", type = "OJ", altitude_min = 7000 },
                { name = "EMILO", type = "OJ", altitude_min = 7000, speed = 210.0 },
            }
        },
        ["QTR4A"] = {
            name = "QTR4A",
            runway = "RW24",
            waypoints = {
                { name = "QTR", type = "OJ", altitude_min = 9000 },
                { name = "D186O", type = "OJ", altitude_min = 7000 },
                { name = "QAA", type = "OJ" },
                { name = "AMN", type = "OJ" },
            }
        },
        ["QTR5A"] = {
            name = "QTR5A",
            runway = "RW06",
            waypoints = {
                { name = "QTR", type = "OJ", altitude_min = 9000 },
                { name = "D336O", type = "OJ", altitude_min = 7000 },
                { name = "MDB", type = "OJ" },
                { name = "D209J", type = "OJ", altitude_min = 7000 },
                { name = "AMN", type = "OJ" },
            }
        },
        ["RALN4A"] = {
            name = "RALN4A",
            runway = "RW24",
            waypoints = {
                { name = "RALNA", type = "OJ" },
                { name = "D258M", type = "OJ", altitude_min = 6000 },
                { name = "AMN", type = "OJ" },
            }
        },
        ["RALN5A"] = {
            name = "RALN5A",
            runway = "RW06",
            waypoints = {
                { name = "RALNA", type = "OJ" },
                { name = "D258M", type = "OJ", altitude_min = 6000 },
                { name = "AMN", type = "OJ" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I24"] = {
            name = "I24",
            type = "A",
            runway = "I24",
            waypoints = {
                { name = "AMN", transition = "AMN", type = "OJ", altitude_min = 6000 },
                { name = "CI24", transition = "AMN", type = "OJ" },
                { name = "D106C", transition = "AMN", type = "OJ" },
                { name = "CI24", transition = "AMN", type = "OJ", altitude_min = 4600 },
                { name = "CI24", transition = "", type = "OJ" },
                { name = "FI24", transition = "", type = "OJ" },
                { name = "RW24", transition = "", type = "OJ" },
                { name = "RW24", transition = "", type = "OJ", altitude_min = 5000 },
                { name = "", transition = "", type = "" },
            }
        },
        ["R06"] = {
            name = "R06",
            type = "A",
            runway = "R06",
            waypoints = {
                { name = "EMILO", transition = "EMILO", type = "OJ", altitude_min = 7000, speed = 210.0 },
                { name = "SOLOL", transition = "EMILO", type = "OJ", altitude_min = 5500 },
                { name = "MUSAL", transition = "MUSAL", type = "OJ", altitude_min = 7000, speed = 210.0 },
                { name = "SOLOL", transition = "MUSAL", type = "OJ", altitude_min = 5500 },
                { name = "SOLOL", transition = "", type = "OJ", altitude_min = 5500 },
                { name = "ORKAB", transition = "", type = "OJ", altitude_min = 4200 },
                { name = "RW06", transition = "", type = "OJ" },
                { name = "AM064", transition = "", type = "OJ", altitude_min = 2960 },
                { name = "EMILO", transition = "", type = "OJ", altitude_min = 7000, speed = 210.0 },
                { name = "EMILO", transition = "", type = "OJ", speed = 230.0 },
            }
        },
        ["R24"] = {
            name = "R24",
            type = "A",
            runway = "R24",
            waypoints = {
                { name = "IVADO", transition = "IVADO", type = "OJ", altitude_min = 9000 },
                { name = "NIVLU", transition = "IVADO", type = "OJ", altitude_min = 7200 },
                { name = "LOXER", transition = "LOXER", type = "OJ", altitude_min = 9000 },
                { name = "NIVLU", transition = "LOXER", type = "OJ", altitude_min = 7200 },
                { name = "NIVLU", transition = "", type = "OJ", altitude_min = 7200 },
                { name = "AM240", transition = "", type = "OJ", altitude_min = 4100 },
                { name = "RW24", transition = "", type = "OJ" },
                { name = "ORKAB", transition = "", type = "OJ", altitude_min = 4900 },
                { name = "MUSAL", transition = "", type = "OJ", altitude_min = 7000, speed = 210.0 },
                { name = "MUSAL", transition = "", type = "OJ", speed = 230.0 },
            }
        },
        ["S24"] = {
            name = "S24",
            type = "A",
            runway = "S24",
            waypoints = {
                { name = "AMN", transition = "AMN", type = "OJ", altitude_min = 6000 },
                { name = "CS24", transition = "AMN", type = "OJ" },
                { name = "D106C", transition = "AMN", type = "OJ" },
                { name = "CS24", transition = "AMN", type = "OJ", altitude_min = 4600 },
                { name = "CS24", transition = "", type = "OJ", altitude_min = 4600 },
                { name = "AMN", transition = "", type = "OJ", altitude_min = 3650 },
                { name = "RW24", transition = "", type = "OJ" },
                { name = "RW24", transition = "", type = "OJ", altitude_min = 5000 },
                { name = "", transition = "", type = "" },
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
