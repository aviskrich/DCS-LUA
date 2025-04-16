local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OJAI",
        Name = "OJAI Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["AI605"] = { lat = 31.246269444, lon = 36.574822222, type = "OJAI" },
        ["D029J"] = { lat = 72.103333333, lon = 102.788333333, type = "UOHH" },
        ["QTR01"] = { lat = 31.248447222, lon = 36.059530556, type = "ENRT" },
        ["QA"] = { lat = 53.580002778, lon = 2.794, type = "NDB", frequency = 4.16, elevation = 0.0, name = "CARRACK", range = 50.0 },
        ["D160J"] = { lat = 58.304041667, lon = -2.984694444, type = "EGPC" },
        ["D048M"] = { lat = 4.520027778, lon = 18.688166667, type = "FEFF" },
        ["34VOR"] = { lat = 36.870747222, lon = 10.164747222, type = "DTTA" },
        ["AI607"] = { lat = 31.386980556, lon = 36.221516667, type = "OJAI" },
        ["AI609"] = { lat = 31.002508333, lon = 35.986308333, type = "OJAI" },
        ["AIWAH"] = { lat = 31.761608333, lon = 36.332283333, type = "OJAI" },
        ["ORDUN"] = { lat = 31.856672222, lon = 36.189169444, type = "OJAI" },
        ["AI617"] = { lat = 37.175188889, lon = 30.704594444, type = "LTAI" },
        ["AI620"] = { lat = 37.324475, lon = 30.724961111, type = "LTAI" },
        ["AI804"] = { lat = 31.504330556, lon = 36.226005556, type = "OJAI" },
        ["GENIS"] = { lat = 31.747730556, lon = 36.210880556, type = "OJAI" },
        ["CF26L"] = { lat = 49.157638889, lon = -122.930247222, type = "CYVR" },
        ["AI801"] = { lat = 31.882413889, lon = 36.124866667, type = "OJAI" },
        ["AI268"] = { lat = 31.499541667, lon = 36.160336111, type = "OJAI" },
        ["MUVIN"] = { lat = 31.816111111, lon = 35.545, type = "ENRT" },
        ["D336O"] = { lat = 57.769038889, lon = -4.236413889, type = "EGPE" },
        ["D186O"] = { lat = 51.305666667, lon = 19.095388889, type = "EPLK" },
        ["SOLUR"] = { lat = 31.7725, lon = 36.288611111, type = "OJAI" },
        ["AI802"] = { lat = 31.946758333, lon = 36.034897222, type = "OJAI" },
        ["MUNRA"] = { lat = 30.828969444, lon = 36.143022222, type = "ENRT" },
        ["MN08R"] = { lat = 31.712183333, lon = 35.947866667, type = "OJAI" },
        ["KINUR"] = { lat = 31.607241667, lon = 36.620216667, type = "ENRT" },
        ["KIPAS"] = { lat = 31.39, lon = 37.111388889, type = "ENRT" },
        ["LUDAN"] = { lat = 32.049055556, lon = 36.620358333, type = "ENRT" },
        ["GEVUP"] = { lat = 31.683705556, lon = 35.768702778, type = "OJAI" },
        ["AI604"] = { lat = 31.969894444, lon = 36.172186111, type = "OJAI" },
        ["LOSAR"] = { lat = 32.15835, lon = 36.480491667, type = "ENRT" },
        ["AI616"] = { lat = 37.09225, lon = 30.693305556, type = "LTAI" },
        ["ASPAL"] = { lat = 31.665402778, lon = 36.227275, type = "OJAI" },
        ["RESOS"] = { lat = 31.779602778, lon = 35.749741667, type = "OJAI" },
        ["AI150"] = { lat = 31.607241667, lon = 36.620216667, type = "ENRT" },
        ["KAPIR"] = { lat = 31.697108333, lon = 35.766083333, type = "OJAI" },
        ["AI606"] = { lat = 31.285497222, lon = 36.879672222, type = "OJAI" },
        ["KITUT"] = { lat = 31.745847222, lon = 36.1016, type = "OJAI" },
        ["ALNOR"] = { lat = 31.66535, lon = 36.418755556, type = "ENRT" },
        ["AI264"] = { lat = 31.726825, lon = 36.066616667, type = "OJAI" },
        ["D080G"] = { lat = 35.36595, lon = 1.655811111, type = "DAOB" },
        ["MOUAB"] = { lat = 31.799444444, lon = 35.599722222, type = "ENRT" },
        ["RALNA"] = { lat = 31.9325, lon = 35.5425, type = "ENRT" },
        ["AI088"] = { lat = 31.478766667, lon = 35.8806, type = "OJAI" },
        ["AI087"] = { lat = 31.492913889, lon = 36.070163889, type = "ENRT" },
        ["AI612"] = { lat = 36.886002778, lon = 30.491233333, type = "LTAI" },
        ["MISEM"] = { lat = 31.745833333, lon = 36.101666667, type = "OJAI" },
        ["D270V"] = { lat = 31.771141667, lon = 35.728894444, type = "OJAI" },
        ["KULDI"] = { lat = 31.313075, lon = 36.537266667, type = "ENRT" },
        ["LONIN"] = { lat = 31.882261111, lon = 36.387419444, type = "OJAI" },
        ["FI26R"] = { lat = 56.744377778, lon = 60.962511111, type = "USSS" },
        ["SIVIK"] = { lat = 31.733722222, lon = 36.114158333, type = "OJAI" },
        ["AI269"] = { lat = 31.506808333, lon = 36.260202778, type = "OJAI" },
        ["AI805"] = { lat = 31.361516667, lon = 36.54835, type = "OJAI" },
        ["D280U"] = { lat = 31.829997222, lon = 35.760547222, type = "OJAI" },
        ["D048O"] = { lat = 42.724708333, lon = 27.787138889, type = "LBBG" },
        ["AI603"] = { lat = 31.878491667, lon = 35.857205556, type = "OJAI" },
        ["KINEN"] = { lat = 31.856236111, lon = 35.85685, type = "OJAI" },
        ["LOTES"] = { lat = 31.601358333, lon = 35.784952778, type = "OJAI" },
        ["D259T"] = { lat = 37.661261111, lon = 112.214508333, type = "ZBYN" },
        ["D268D"] = { lat = 43.378333333, lon = 76.990277778, type = "UAAA" },
        ["IMLOL"] = { lat = 31.957047222, lon = 36.159963889, type = "OJAI" },
        ["AI803"] = { lat = 31.893588889, lon = 35.728008333, type = "OJAI" },
        ["LOXER"] = { lat = 32.029933333, lon = 36.380961111, type = "ENRT" },
        ["D029K"] = { lat = 51.290427778, lon = 51.733688889, type = "UARR" },
        ["D328P"] = { lat = 31.481388889, lon = 35.915277778, type = "OJAI" },
        ["D209J"] = { lat = 55.164747222, lon = -4.914519444, type = "EGPK" },
        ["AI808"] = { lat = 31.971422222, lon = 36.175086111, type = "OJAI" },
        ["EGLOT"] = { lat = 31.282483333, lon = 36.306627778, type = "ENRT" },
        ["OBTAN"] = { lat = 31.700277778, lon = 35.884166667, type = "OJAI" },
        ["DE26R"] = { lat = 56.744827778, lon = 60.778025, type = "USSS" },
        ["AI602"] = { lat = 31.689019444, lon = 35.710516667, type = "OJAI" },
        ["AI614"] = { lat = 37.044775, lon = 30.371102778, type = "LTAI" },
        ["AI601"] = { lat = 31.7143, lon = 35.883755556, type = "OJAI" },
        ["D140O"] = { lat = 42.740794444, lon = -8.198372222, type = "LEST" },
        ["DE08L"] = { lat = 56.744725, lon = 60.827119444, type = "USSS" },
        ["D273L"] = { lat = 29.922288889, lon = 122.133416667, type = "ZSZS" },
        ["D138Q"] = { lat = 31.514444444, lon = 36.358611111, type = "OJAI" },
        ["AI618"] = { lat = 37.22495, lon = 30.711375, type = "LTAI" },
        ["D290L"] = { lat = 35.506272222, lon = 26.924891667, type = "LGKP" },
        ["AI613"] = { lat = 37.7905, lon = 30.391027778, type = "LTAI" },
        ["FI08L"] = { lat = 48.355630556, lon = 11.675466667, type = "EDDM" },
        ["AI806"] = { lat = 31.396016667, lon = 36.837275, type = "OJAI" },
        ["AI608"] = { lat = 31.161727778, lon = 36.149111111, type = "OJAI" },
        ["OSAMA"] = { lat = 31.930555556, lon = 35.618333333, type = "ENRT" },
        ["AI809"] = { lat = 31.647666667, lon = 36.480475, type = "OJAI" },
        ["AI611"] = { lat = 36.706761111, lon = 30.626111111, type = "LTAI" },
        ["AI807"] = { lat = 31.161727778, lon = 36.149111111, type = "OJAI" },
        ["D260O"] = { lat = 19.228191667, lon = -81.628319444, type = "MWCR" },
        ["AI270"] = { lat = 31.514044444, lon = 36.360788889, type = "OJAI" },
        ["GENEX"] = { lat = 31.493055556, lon = 37.014444444, type = "ENRT" },
        ["AI090"] = { lat = 31.718888889, lon = 35.915833333, type = "OJAI" },
        ["LOSIL"] = { lat = 30.814222222, lon = 35.794808333, type = "ENRT" },
        ["SODUK"] = { lat = 31.712788889, lon = 35.873408333, type = "OJAI" },
        ["MIDRU"] = { lat = 31.761041667, lon = 36.208241667, type = "OJAI" },
        ["AI091"] = { lat = 31.485827778, lon = 35.974741667, type = "OJAI" },
        ["QTR15"] = { lat = 31.494444444, lon = 36.113611111, type = "OJAI" },
        ["AI610"] = { lat = 36.652986111, lon = 30.666425, type = "LTAI" },
        ["D104Q"] = { lat = 42.482602778, lon = 27.883911111, type = "LBBG" },
        ["ELOXI"] = { lat = 31.566941667, lon = 36.759508333, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW08L"] = {
            heading = 80,
            length = 0,
            width = 0,
            threshold = { lat = 31.726730555555555, lon = 35.96948611111111 },
            end = { lat = 31.726730555555555, lon = 35.96948611111111 }
        },
        ["RW08R"] = {
            heading = 80,
            length = 0,
            width = 0,
            threshold = { lat = 31.714380555555554, lon = 35.98051111111111 },
            end = { lat = 31.714380555555554, lon = 35.98051111111111 }
        },
        ["RW26L"] = {
            heading = 260,
            length = 0,
            width = 0,
            threshold = { lat = 31.719883333333332, lon = 36.01858333333333 },
            end = { lat = 31.719883333333332, lon = 36.01858333333333 }
        },
        ["RW26R"] = {
            heading = 260,
            length = 0,
            width = 0,
            threshold = { lat = 31.732238888888887, lon = 36.00761111111111 },
            end = { lat = 31.732238888888887, lon = 36.00761111111111 }
        },
    },

    -- Процедуры SID
    SID = {
        ["GENE6E"] = {
            name = "GENE6E",
            runway = "RW08L",
            waypoints = {
                { name = "D268D", type = "P" },
                { name = "D104Q", type = "P", altitude_min = 13000, speed = 210.0 },
                { name = "GENEX", type = "E" },
            }
        },
        ["GENE6T"] = {
            name = "GENE6T",
            runway = "RW08L",
            waypoints = {
                { name = "DE08L", type = "P" },
                { name = "KITUT", type = "P", altitude_min = 4300, speed = 210.0 },
                { name = "AI809", type = "P", altitude_min = 13000 },
                { name = "KINUR", type = "E", altitude_min = 15000, speed = 250.0 },
                { name = "ELOXI", type = "E" },
                { name = "GENEX", type = "E", altitude_min = 25000 },
            }
        },
        ["KINU3D"] = {
            name = "KINU3D",
            runway = "RW08R",
            waypoints = {
                { name = "QA", type = "D", altitude_min = 3200 },
                { name = "", type = "" },
                { name = "ALNOR", type = "E", altitude_min = 7000 },
                { name = "KINUR", type = "E", altitude_min = 15000 },
            }
        },
        ["KIPA6D"] = {
            name = "KIPA6D",
            runway = "RW26R",
            waypoints = {
                { name = "DE26R", type = "P" },
                { name = "AI601", type = "P", altitude_min = 3400, speed = 230.0 },
                { name = "AI088", type = "P", altitude_min = 7000 },
                { name = "EGLOT", type = "E", speed = 250.0 },
                { name = "AI605", type = "P", altitude_min = 15000 },
                { name = "AI606", type = "P" },
                { name = "KIPAS", type = "E", altitude_min = 25000 },
            }
        },
        ["KIPA6E"] = {
            name = "KIPA6E",
            runway = "RW08L",
            waypoints = {
                { name = "D268D", type = "P" },
                { name = "", type = "" },
                { name = "D138Q", type = "P", altitude_min = 7000, speed = 230.0 },
                { name = "KULDI", type = "E", altitude_min = 15000 },
                { name = "KIPAS", type = "E" },
            }
        },
        ["KIPA6T"] = {
            name = "KIPA6T",
            runway = "RW08L",
            waypoints = {
                { name = "DE08L", type = "P" },
                { name = "KITUT", type = "P", altitude_min = 3800, speed = 230.0 },
                { name = "AI804", type = "P", altitude_min = 7000 },
                { name = "AI805", type = "P", altitude_min = 15000, speed = 250.0 },
                { name = "AI806", type = "P" },
                { name = "KIPAS", type = "E", altitude_min = 25000 },
            }
        },
        ["KIPA6W"] = {
            name = "KIPA6W",
            runway = "RW26R",
            waypoints = {
                { name = "D260O", type = "P" },
                { name = "D328P", type = "P", altitude_min = 7000, speed = 230.0 },
                { name = "QTR", type = "D" },
                { name = "KULDI", type = "E", altitude_min = 15000 },
                { name = "KIPAS", type = "E" },
            }
        },
        ["KULD1Q"] = {
            name = "KULD1Q",
            runway = "RW26L",
            waypoints = {
                { name = "OBTAN", type = "P", speed = 210.0 },
                { name = "LOTES", type = "P", speed = 210.0 },
                { name = "AI087", type = "E", altitude_min = 7000 },
                { name = "KULDI", type = "E", altitude_min = 15000 },
            }
        },
        ["KULD1S"] = {
            name = "KULD1S",
            runway = "RW08R",
            waypoints = {
                { name = "SIVIK", type = "P", speed = 210.0 },
                { name = "ASPAL", type = "P", speed = 210.0 },
                { name = "AI270", type = "P", altitude_min = 7000 },
                { name = "KULDI", type = "E", altitude_min = 15000 },
            }
        },
        ["KULD2D"] = {
            name = "KULD2D",
            runway = "RW26L",
            waypoints = {
                { name = "RW26L", type = "P", altitude_min = 3200 },
                { name = "D336O", type = "E", altitude_min = 7000 },
                { name = "QTR", type = "D", altitude_min = 9000 },
                { name = "KULDI", type = "E", altitude_min = 15000 },
            }
        },
        ["KULD3D"] = {
            name = "KULD3D",
            runway = "RW08R",
            waypoints = {
                { name = "QA", type = "D", altitude_min = 3200 },
                { name = "", type = "" },
                { name = "D140O", type = "E", altitude_min = 7000 },
                { name = "KULDI", type = "E", altitude_min = 15000 },
            }
        },
        ["LOSA1Q"] = {
            name = "LOSA1Q",
            runway = "RW26L",
            waypoints = {
                { name = "OBTAN", type = "P", speed = 210.0 },
                { name = "RESOS", type = "P", speed = 210.0 },
                { name = "KINEN", type = "P", speed = 210.0 },
                { name = "IMLOL", type = "P", altitude_min = 8500 },
                { name = "LOXER", type = "E", altitude_min = 9000 },
                { name = "LOSAR", type = "E", altitude_min = 13000 },
            }
        },
        ["LOSA1S"] = {
            name = "LOSA1S",
            runway = "RW08R",
            waypoints = {
                { name = "SIVIK", type = "P", speed = 210.0 },
                { name = "ORDUN", type = "P", speed = 210.0 },
                { name = "LONIN", type = "P", altitude_min = 8500 },
                { name = "LOSAR", type = "E", altitude_min = 13000 },
            }
        },
        ["LOSA2D"] = {
            name = "LOSA2D",
            runway = "RW26L",
            waypoints = {
                { name = "RW26L", type = "P", altitude_min = 3200 },
                { name = "D209J", type = "E", altitude_min = 7000 },
                { name = "AMN", type = "D" },
                { name = "D080G", type = "E", altitude_min = 8500 },
                { name = "LOXER", type = "E", altitude_min = 9000 },
                { name = "LOSAR", type = "E", altitude_min = 13000 },
            }
        },
        ["LOSA3D"] = {
            name = "LOSA3D",
            runway = "RW08R",
            waypoints = {
                { name = "QA", type = "D", altitude_min = 3200 },
                { name = "", type = "" },
                { name = "D029J", type = "E", altitude_min = 8500 },
                { name = "LOXER", type = "E", altitude_min = 9000 },
                { name = "LOSAR", type = "E", altitude_min = 13000 },
            }
        },
        ["LOSA6D"] = {
            name = "LOSA6D",
            runway = "RW26R",
            waypoints = {
                { name = "DE26R", type = "P" },
                { name = "AI601", type = "P", altitude_min = 3200, speed = 230.0 },
                { name = "AI603", type = "P", altitude_min = 6000, altitude_max = 8000 },
                { name = "AI604", type = "P", altitude_min = 8500, speed = 250.0 },
                { name = "LOXER", type = "E" },
                { name = "LOSAR", type = "E", altitude_min = 13000 },
            }
        },
        ["LOSA6E"] = {
            name = "LOSA6E",
            runway = "RW08L",
            waypoints = {
                { name = "D268D", type = "P" },
                { name = "", type = "" },
                { name = "D029K", type = "P", altitude_min = 8500, speed = 210.0 },
                { name = "LOSAR", type = "E", altitude_min = 13000 },
            }
        },
        ["LOSA6T"] = {
            name = "LOSA6T",
            runway = "RW08L",
            waypoints = {
                { name = "DE08L", type = "P" },
                { name = "KITUT", type = "P", altitude_min = 3800, speed = 230.0 },
                { name = "AI801", type = "P", altitude_min = 6000, altitude_max = 9000 },
                { name = "AI808", type = "P", altitude_min = 8500, speed = 250.0 },
                { name = "LOXER", type = "E" },
                { name = "LOSAR", type = "E", altitude_min = 13000 },
            }
        },
        ["LOSA6W"] = {
            name = "LOSA6W",
            runway = "RW26R",
            waypoints = {
                { name = "D260O", type = "P" },
                { name = "AMN", type = "D", speed = 230.0 },
                { name = "LOSAR", type = "E", altitude_min = 13000 },
            }
        },
        ["LOSI6D"] = {
            name = "LOSI6D",
            runway = "RW26R",
            waypoints = {
                { name = "DE26R", type = "P" },
                { name = "AI601", type = "P", altitude_min = 3300, speed = 230.0 },
                { name = "AI088", type = "P", altitude_min = 7000 },
                { name = "LOSIL", type = "E", altitude_min = 15000, speed = 250.0 },
            }
        },
        ["LOSI6E"] = {
            name = "LOSI6E",
            runway = "RW08L",
            waypoints = {
                { name = "D268D", type = "P" },
                { name = "QTR15", type = "P", altitude_min = 7000, speed = 230.0 },
                { name = "QTR", type = "D" },
                { name = "LOSIL", type = "E", altitude_min = 15000 },
            }
        },
        ["LOSI6T"] = {
            name = "LOSI6T",
            runway = "RW08L",
            waypoints = {
                { name = "DE08L", type = "P" },
                { name = "KITUT", type = "P", altitude_min = 3500, speed = 230.0 },
                { name = "AI804", type = "P", altitude_min = 7000 },
                { name = "AI807", type = "P", speed = 250.0 },
                { name = "LOSIL", type = "E", altitude_min = 15000 },
            }
        },
        ["LOSI6W"] = {
            name = "LOSI6W",
            runway = "RW26R",
            waypoints = {
                { name = "D260O", type = "P" },
                { name = "D328P", type = "P", altitude_min = 7000, speed = 230.0 },
                { name = "QTR", type = "D" },
                { name = "LOSIL", type = "E", altitude_min = 15000 },
            }
        },
        ["LUDA1Q"] = {
            name = "LUDA1Q",
            runway = "RW26L",
            waypoints = {
                { name = "OBTAN", type = "P", speed = 210.0 },
                { name = "RESOS", type = "P", speed = 210.0 },
                { name = "KINEN", type = "P", speed = 210.0 },
                { name = "IMLOL", type = "P", altitude_min = 8500 },
                { name = "LOXER", type = "E", altitude_min = 9000 },
                { name = "LUDAN", type = "E", altitude_min = 11000 },
            }
        },
        ["LUDA1S"] = {
            name = "LUDA1S",
            runway = "RW08R",
            waypoints = {
                { name = "SIVIK", type = "P", speed = 210.0 },
                { name = "ORDUN", type = "P", speed = 210.0 },
                { name = "LONIN", type = "P", altitude_min = 8500 },
                { name = "LUDAN", type = "E", altitude_min = 11000 },
            }
        },
        ["LUDA2D"] = {
            name = "LUDA2D",
            runway = "RW26L",
            waypoints = {
                { name = "RW26L", type = "P", altitude_min = 3200 },
                { name = "D209J", type = "E", altitude_min = 7000 },
                { name = "AMN", type = "D" },
                { name = "D080G", type = "E", altitude_min = 8500 },
                { name = "LOXER", type = "E", altitude_min = 9000 },
                { name = "LUDAN", type = "E", altitude_min = 11000 },
            }
        },
        ["LUDA3D"] = {
            name = "LUDA3D",
            runway = "RW08R",
            waypoints = {
                { name = "QA", type = "D", altitude_min = 3200 },
                { name = "", type = "" },
                { name = "D048M", type = "E", altitude_min = 8500 },
                { name = "LUDAN", type = "E", altitude_min = 11000 },
            }
        },
        ["LUDA6D"] = {
            name = "LUDA6D",
            runway = "RW26R",
            waypoints = {
                { name = "DE26R", type = "P" },
                { name = "AI601", type = "P", altitude_min = 3200, speed = 230.0 },
                { name = "AI603", type = "P", altitude_min = 6000, altitude_max = 8000 },
                { name = "AI604", type = "P", altitude_min = 8500, speed = 250.0 },
                { name = "LOXER", type = "E" },
                { name = "LUDAN", type = "E", altitude_min = 13000 },
            }
        },
        ["LUDA6E"] = {
            name = "LUDA6E",
            runway = "RW08L",
            waypoints = {
                { name = "D268D", type = "P" },
                { name = "", type = "" },
                { name = "D048O", type = "P", altitude_min = 8500, speed = 230.0 },
                { name = "LUDAN", type = "E", altitude_min = 13000 },
            }
        },
        ["LUDA6T"] = {
            name = "LUDA6T",
            runway = "RW08L",
            waypoints = {
                { name = "DE08L", type = "P" },
                { name = "KITUT", type = "P", altitude_min = 3800, speed = 230.0 },
                { name = "AI801", type = "P", altitude_min = 6000, altitude_max = 9000 },
                { name = "AI808", type = "P", altitude_min = 8500, speed = 250.0 },
                { name = "LOXER", type = "E" },
                { name = "LUDAN", type = "E", altitude_min = 13000 },
            }
        },
        ["LUDA6W"] = {
            name = "LUDA6W",
            runway = "RW26R",
            waypoints = {
                { name = "D260O", type = "P" },
                { name = "AMN", type = "D", speed = 230.0 },
                { name = "LUDAN", type = "E", altitude_min = 13000 },
            }
        },
        ["MOUA1Q"] = {
            name = "MOUA1Q",
            runway = "RW26L",
            waypoints = {
                { name = "OBTAN", type = "P", speed = 210.0 },
                { name = "RESOS", type = "P", speed = 210.0 },
                { name = "MOUAB", type = "E", altitude_min = 11000 },
            }
        },
        ["MOUA1S"] = {
            name = "MOUA1S",
            runway = "RW08R",
            waypoints = {
                { name = "SIVIK", type = "P", speed = 210.0 },
                { name = "ORDUN", type = "P", speed = 210.0 },
                { name = "KINEN", type = "P" },
                { name = "MOUAB", type = "E", altitude_min = 11000 },
            }
        },
        ["MOUA6D"] = {
            name = "MOUA6D",
            runway = "RW26R",
            waypoints = {
                { name = "DE26R", type = "P" },
                { name = "AI601", type = "P", altitude_min = 4000, speed = 210.0 },
                { name = "AI602", type = "P", speed = 210.0 },
                { name = "MOUAB", type = "E", altitude_min = 12000, speed = 210.0 },
            }
        },
        ["MOUA6E"] = {
            name = "MOUA6E",
            runway = "RW08L",
            waypoints = {
                { name = "D268D", type = "P" },
                { name = "", type = "", speed = 210.0 },
                { name = "MOUAB", type = "E", altitude_min = 12000 },
            }
        },
        ["MOUA6T"] = {
            name = "MOUA6T",
            runway = "RW08L",
            waypoints = {
                { name = "DE08L", type = "P" },
                { name = "KITUT", type = "P", altitude_min = 3600, speed = 230.0 },
                { name = "AI801", type = "P", altitude_min = 6000, altitude_max = 9000 },
                { name = "AI802", type = "P", speed = 250.0 },
                { name = "AI803", type = "P" },
                { name = "MOUAB", type = "E", altitude_min = 12000 },
            }
        },
        ["MOUA6W"] = {
            name = "MOUA6W",
            runway = "RW26R",
            waypoints = {
                { name = "D259T", type = "P", speed = 210.0 },
                { name = "", type = "", speed = 210.0 },
                { name = "MOUAB", type = "E", altitude_min = 12000, speed = 210.0 },
            }
        },
        ["MUNR6D"] = {
            name = "MUNR6D",
            runway = "RW26R",
            waypoints = {
                { name = "DE26R", type = "P" },
                { name = "AI601", type = "P", altitude_min = 3900, speed = 230.0 },
                { name = "AI088", type = "P", altitude_min = 7000 },
                { name = "MUNRA", type = "E", altitude_min = 25000, speed = 250.0 },
            }
        },
        ["MUNR6E"] = {
            name = "MUNR6E",
            runway = "RW08L",
            waypoints = {
                { name = "D268D", type = "P" },
                { name = "QTR15", type = "P", altitude_min = 7000, speed = 230.0 },
                { name = "QTR", type = "D" },
                { name = "MUNRA", type = "E", altitude_min = 25000 },
            }
        },
        ["MUNR6T"] = {
            name = "MUNR6T",
            runway = "RW08L",
            waypoints = {
                { name = "DE08L", type = "P" },
                { name = "KITUT", type = "P", altitude_min = 4000, speed = 230.0 },
                { name = "AI804", type = "P", altitude_min = 7000 },
                { name = "AI807", type = "P", speed = 250.0 },
                { name = "MUNRA", type = "E", altitude_min = 25000 },
            }
        },
        ["MUNR6W"] = {
            name = "MUNR6W",
            runway = "RW26R",
            waypoints = {
                { name = "D260O", type = "P" },
                { name = "D328P", type = "P", altitude_min = 7000, speed = 230.0 },
                { name = "QTR", type = "D" },
                { name = "MUNRA", type = "E", altitude_min = 25000 },
            }
        },
        ["MUVI2D"] = {
            name = "MUVI2D",
            runway = "RW26L",
            waypoints = {
                { name = "RW26L", type = "P", altitude_min = 3200 },
                { name = "D270V", type = "P", altitude_min = 7000 },
                { name = "MOUAB", type = "E", altitude_min = 11000 },
                { name = "MUVIN", type = "E" },
            }
        },
        ["MUVI3D"] = {
            name = "MUVI3D",
            runway = "RW08R",
            waypoints = {
                { name = "QA", type = "D", altitude_min = 3200 },
                { name = "", type = "" },
                { name = "D273L", type = "P", altitude_min = 6000 },
                { name = "MOUAB", type = "E", altitude_min = 11000 },
                { name = "MUVIN", type = "E" },
            }
        },
        ["OSAM1Q"] = {
            name = "OSAM1Q",
            runway = "RW26L",
            waypoints = {
                { name = "OBTAN", type = "P", speed = 210.0 },
                { name = "RESOS", type = "P", speed = 210.0 },
                { name = "OSAMA", type = "E" },
            }
        },
        ["OSAM1S"] = {
            name = "OSAM1S",
            runway = "RW08R",
            waypoints = {
                { name = "SIVIK", type = "P", speed = 210.0 },
                { name = "ORDUN", type = "P", speed = 210.0 },
                { name = "KINEN", type = "P" },
                { name = "OSAMA", type = "E" },
            }
        },
        ["OSAM6D"] = {
            name = "OSAM6D",
            runway = "RW26R",
            waypoints = {
                { name = "DE26R", type = "P" },
                { name = "AI601", type = "P", altitude_min = 3200, speed = 210.0 },
                { name = "AI602", type = "P", altitude_min = 5000, speed = 210.0 },
                { name = "OSAMA", type = "E", altitude_min = 8000, speed = 210.0 },
            }
        },
        ["OSAM6E"] = {
            name = "OSAM6E",
            runway = "RW08L",
            waypoints = {
                { name = "D268D", type = "P" },
                { name = "", type = "", speed = 210.0 },
                { name = "OSAMA", type = "E", altitude_min = 8000 },
            }
        },
        ["OSAM6T"] = {
            name = "OSAM6T",
            runway = "RW08L",
            waypoints = {
                { name = "DE08L", type = "P" },
                { name = "KITUT", type = "P", altitude_min = 3600, speed = 230.0 },
                { name = "AI801", type = "P", altitude_min = 6000, altitude_max = 9000 },
                { name = "AI802", type = "P", speed = 250.0 },
                { name = "AI803", type = "P" },
                { name = "OSAMA", type = "E", altitude_min = 8000 },
            }
        },
        ["OSAM6W"] = {
            name = "OSAM6W",
            runway = "RW26R",
            waypoints = {
                { name = "D259T", type = "P", speed = 210.0 },
                { name = "", type = "", speed = 210.0 },
                { name = "OSAMA", type = "E", altitude_min = 8000, speed = 210.0 },
            }
        },
        ["QTR01Q"] = {
            name = "QTR01Q",
            runway = "RW26L",
            waypoints = {
                { name = "OBTAN", type = "P", speed = 210.0 },
                { name = "LOTES", type = "P", speed = 210.0 },
                { name = "AI088", type = "P", altitude_min = 7000 },
                { name = "QTR01", type = "E", altitude_min = 9000 },
            }
        },
        ["QTR01S"] = {
            name = "QTR01S",
            runway = "RW08R",
            waypoints = {
                { name = "SIVIK", type = "P", speed = 210.0 },
                { name = "ASPAL", type = "P", speed = 210.0 },
                { name = "AI268", type = "P", altitude_min = 7000 },
                { name = "QTR01", type = "E", altitude_min = 9000 },
            }
        },
        ["QTR2D"] = {
            name = "QTR2D",
            runway = "RW26L",
            waypoints = {
                { name = "RW26L", type = "P", altitude_min = 3200 },
                { name = "D336O", type = "E", altitude_min = 7000 },
                { name = "QTR", type = "D", altitude_min = 9000 },
            }
        },
        ["QTR3D"] = {
            name = "QTR3D",
            runway = "RW08R",
            waypoints = {
                { name = "QA", type = "D", altitude_min = 3200 },
                { name = "D186O", type = "E", altitude_min = 7000 },
                { name = "QTR", type = "D", altitude_min = 9000 },
            }
        },
        ["RALN2D"] = {
            name = "RALN2D",
            runway = "RW26L",
            waypoints = {
                { name = "RW26L", type = "P", altitude_min = 3200 },
                { name = "D280U", type = "P", altitude_min = 7000 },
                { name = "OSAMA", type = "E" },
                { name = "RALNA", type = "E" },
            }
        },
        ["RALN3D"] = {
            name = "RALN3D",
            runway = "RW08R",
            waypoints = {
                { name = "QA", type = "D", altitude_min = 3200 },
                { name = "", type = "" },
                { name = "D290L", type = "P", altitude_min = 6000 },
                { name = "OSAMA", type = "E" },
                { name = "RALNA", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["EGLO1C"] = {
            name = "EGLO1C",
            runway = "RW26B",
            waypoints = {
                { name = "EGLOT", type = "OJ", altitude_min = 9000 },
                { name = "AI269", type = "OJ", altitude_min = 7000 },
                { name = "ASPAL", type = "OJ", altitude_min = 6000 },
            }
        },
        ["EGLO1G"] = {
            name = "EGLO1G",
            runway = "RW08B",
            waypoints = {
                { name = "EGLOT", type = "OJ", altitude_min = 9000 },
                { name = "AI091", type = "OJ", altitude_min = 7000 },
                { name = "LOTES", type = "OJ", altitude_min = 6000 },
            }
        },
        ["ELOX1C"] = {
            name = "ELOX1C",
            runway = "RW26B",
            waypoints = {
                { name = "ELOXI", type = "OJ", altitude_min = 15000 },
                { name = "AI150", type = "OJ", altitude_min = 15000 },
                { name = "ALNOR", type = "OJ", altitude_min = 9800 },
                { name = "ASPAL", type = "OJ", altitude_min = 6000 },
            }
        },
        ["ELOX1G"] = {
            name = "ELOX1G",
            runway = "RW08B",
            waypoints = {
                { name = "ELOXI", type = "OJ", altitude_min = 15000 },
                { name = "AI150", type = "OJ", altitude_min = 15000 },
                { name = "ALNOR", type = "OJ", altitude_min = 11600, speed = 250.0 },
                { name = "LOTES", type = "OJ", altitude_min = 6000 },
            }
        },
        ["GENE6A"] = {
            name = "GENE6A",
            runway = "RW26R",
            waypoints = {
                { name = "GENEX", type = "OE", altitude_min = 26000 },
                { name = "ELOXI", type = "OJ", altitude_min = 15000 },
                { name = "KINUR", type = "OJ", altitude_min = 15000 },
                { name = "AI809", type = "OJ", altitude_min = 7000, speed = 210.0 },
                { name = "AIWAH", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["KINU2A"] = {
            name = "KINU2A",
            runway = "RW26B",
            waypoints = {
                { name = "KINUR", type = "OJ", altitude_min = 15000 },
                { name = "ALNOR", type = "OJ", altitude_min = 7000 },
                { name = "QAA", type = "OJ" },
            }
        },
        ["KIPA6A"] = {
            name = "KIPA6A",
            runway = "RW26R",
            waypoints = {
                { name = "KIPAS", type = "OJ", altitude_min = 26000 },
                { name = "AI806", type = "OJ", altitude_min = 20000 },
                { name = "AI805", type = "OJ", altitude_min = 15000 },
                { name = "AI269", type = "OJ", altitude_min = 7000 },
                { name = "ASPAL", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["KIPA6L"] = {
            name = "KIPA6L",
            runway = "RW08L",
            waypoints = {
                { name = "KIPAS", type = "OJ", altitude_min = 26000 },
                { name = "AI606", type = "OJ", altitude_min = 20000 },
                { name = "AI605", type = "OJ", altitude_min = 15000 },
                { name = "EGLOT", type = "OJ" },
                { name = "AI618", type = "OJ", altitude_min = 12000 },
                { name = "AI617", type = "OJ", altitude_min = 7000 },
                { name = "LOTES", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["KULD1C"] = {
            name = "KULD1C",
            runway = "RW26B",
            waypoints = {
                { name = "KULDI", type = "OJ", altitude_min = 15000 },
                { name = "AI270", type = "OJ", altitude_min = 7000 },
                { name = "ASPAL", type = "OJ", altitude_min = 6000 },
            }
        },
        ["KULD1G"] = {
            name = "KULD1G",
            runway = "RW08B",
            waypoints = {
                { name = "KULDI", type = "OJ", altitude_min = 15000 },
                { name = "AI087", type = "OJ", altitude_min = 7000 },
                { name = "LOTES", type = "OJ", altitude_min = 6000 },
            }
        },
        ["KULD2A"] = {
            name = "KULD2A",
            runway = "RW26B",
            waypoints = {
                { name = "KULDI", type = "OJ", altitude_min = 15000 },
                { name = "D140O", type = "OJ", altitude_min = 7000 },
                { name = "QAA", type = "OJ" },
            }
        },
        ["KULD3A"] = {
            name = "KULD3A",
            runway = "RW08B",
            waypoints = {
                { name = "KULDI", type = "OJ", altitude_min = 15000 },
                { name = "QTR", type = "OJ", altitude_min = 9000 },
                { name = "D336O", type = "OJ", altitude_min = 7000 },
                { name = "MDB", type = "OJ" },
            }
        },
        ["LOSA1C"] = {
            name = "LOSA1C",
            runway = "RW26B",
            waypoints = {
                { name = "LOSAR", type = "OJ", altitude_min = 13000 },
                { name = "LONIN", type = "OJ", altitude_min = 8500, speed = 210.0 },
                { name = "ORDUN", type = "OJ", altitude_min = 6000 },
            }
        },
        ["LOSA1G"] = {
            name = "LOSA1G",
            runway = "RW08B",
            waypoints = {
                { name = "LOSAR", type = "OJ", altitude_min = 13000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
                { name = "KINEN", type = "OJ", altitude_min = 8500, speed = 210.0 },
                { name = "RESOS", type = "OJ", altitude_min = 6000 },
            }
        },
        ["LOSA2A"] = {
            name = "LOSA2A",
            runway = "RW26B",
            waypoints = {
                { name = "LOSAR", type = "OJ", altitude_min = 13000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
                { name = "D029J", type = "OJ", altitude_min = 8500 },
                { name = "QAA", type = "OJ" },
            }
        },
        ["LOSA3A"] = {
            name = "LOSA3A",
            runway = "RW08B",
            waypoints = {
                { name = "LOSAR", type = "OJ", altitude_min = 13000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
                { name = "D080G", type = "OJ", altitude_min = 8500 },
                { name = "AMN", type = "OJ" },
                { name = "D209J", type = "OJ", altitude_min = 7000 },
                { name = "MDB", type = "OJ" },
            }
        },
        ["LOSA6A"] = {
            name = "LOSA6A",
            runway = "RW26R",
            waypoints = {
                { name = "LOSAR", type = "OJ", altitude_min = 16000 },
                { name = "AI610", type = "OJ", altitude_min = 13000, speed = 210.0 },
                { name = "AI620", type = "OJ", altitude_min = 8500, speed = 210.0 },
                { name = "AIWAH", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["LOSA6L"] = {
            name = "LOSA6L",
            runway = "RW08L",
            waypoints = {
                { name = "LOSAR", type = "OJ", altitude_min = 16000 },
                { name = "AI610", type = "OJ", altitude_min = 13000 },
                { name = "AI620", type = "OJ", altitude_min = 12000 },
                { name = "AI614", type = "OJ", altitude_min = 10000 },
                { name = "RESOS", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["LOSI6A"] = {
            name = "LOSI6A",
            runway = "RW26R",
            waypoints = {
                { name = "LOSIL", type = "OJ", altitude_min = 16000 },
                { name = "AI609", type = "OJ" },
                { name = "AI608", type = "OJ", altitude_min = 13000 },
                { name = "AI607", type = "OJ", altitude_min = 13000 },
                { name = "AI269", type = "OJ", altitude_min = 7000 },
                { name = "ASPAL", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["LOSI6L"] = {
            name = "LOSI6L",
            runway = "RW08L",
            waypoints = {
                { name = "LOSIL", type = "OJ", altitude_min = 16000 },
                { name = "AI617", type = "OJ", altitude_min = 7000 },
                { name = "LOTES", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["LUDA1C"] = {
            name = "LUDA1C",
            runway = "RW26B",
            waypoints = {
                { name = "LUDAN", type = "OJ", altitude_min = 11000 },
                { name = "LONIN", type = "OJ", altitude_min = 8500, speed = 210.0 },
                { name = "ORDUN", type = "OJ", altitude_min = 6000 },
            }
        },
        ["LUDA1G"] = {
            name = "LUDA1G",
            runway = "RW08B",
            waypoints = {
                { name = "LUDAN", type = "OJ", altitude_min = 11000 },
                { name = "LOXER", type = "OJ", altitude_min = 9000 },
                { name = "KINEN", type = "OJ", altitude_min = 8500, speed = 210.0 },
                { name = "RESOS", type = "OJ", altitude_min = 6000 },
            }
        },
        ["LUDA2A"] = {
            name = "LUDA2A",
            runway = "RW26B",
            waypoints = {
                { name = "LUDAN", type = "OJ", altitude_min = 11000 },
                { name = "D048M", type = "OJ", altitude_min = 8500 },
                { name = "QAA", type = "OJ" },
            }
        },
        ["LUDA3A"] = {
            name = "LUDA3A",
            runway = "RW08B",
            waypoints = {
                { name = "LUDAN", type = "OJ", altitude_min = 11000 },
                { name = "LOXER", type = "OJ" },
                { name = "D080G", type = "OJ", altitude_min = 8500 },
                { name = "AMN", type = "OJ" },
                { name = "D209J", type = "OJ", altitude_min = 7000 },
                { name = "MDB", type = "OJ" },
            }
        },
        ["LUDA6A"] = {
            name = "LUDA6A",
            runway = "RW26R",
            waypoints = {
                { name = "LUDAN", type = "OJ", altitude_min = 16000 },
                { name = "AI610", type = "OJ", altitude_min = 13000, speed = 210.0 },
                { name = "AI620", type = "OJ", altitude_min = 8500, speed = 210.0 },
                { name = "AIWAH", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["LUDA6L"] = {
            name = "LUDA6L",
            runway = "RW08L",
            waypoints = {
                { name = "LUDAN", type = "OJ", altitude_min = 16000 },
                { name = "AI610", type = "OJ", altitude_min = 13000 },
                { name = "AI620", type = "OJ", altitude_min = 12000 },
                { name = "AI614", type = "OJ", altitude_min = 10000 },
                { name = "RESOS", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["MUNR6A"] = {
            name = "MUNR6A",
            runway = "RW26R",
            waypoints = {
                { name = "MUNRA", type = "OJ", altitude_min = 26000 },
                { name = "AI608", type = "OJ", altitude_min = 13000 },
                { name = "AI607", type = "OJ", altitude_min = 13000 },
                { name = "AI269", type = "OJ", altitude_min = 7000 },
                { name = "ASPAL", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["MUNR6L"] = {
            name = "MUNR6L",
            runway = "RW08L",
            waypoints = {
                { name = "MUNRA", type = "OJ", altitude_min = 26000 },
                { name = "AI616", type = "OJ", altitude_min = 16000 },
                { name = "AI617", type = "OJ", altitude_min = 7000 },
                { name = "LOTES", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["OSAM1C"] = {
            name = "OSAM1C",
            runway = "RW26B",
            waypoints = {
                { name = "OSAMA", type = "OJ", altitude_min = 11000 },
                { name = "KINEN", type = "OJ", altitude_min = 8500, speed = 210.0 },
                { name = "ORDUN", type = "OJ", altitude_min = 6000 },
            }
        },
        ["OSAM1G"] = {
            name = "OSAM1G",
            runway = "RW08B",
            waypoints = {
                { name = "OSAMA", type = "OJ", altitude_min = 11000 },
                { name = "RESOS", type = "OJ", altitude_min = 6000 },
            }
        },
        ["OSAM6A"] = {
            name = "OSAM6A",
            runway = "RW26R",
            waypoints = {
                { name = "OSAMA", type = "OJ", altitude_min = 11000 },
                { name = "AI613", type = "OJ", altitude_min = 9000 },
                { name = "ORDUN", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["OSAM6L"] = {
            name = "OSAM6L",
            runway = "RW08L",
            waypoints = {
                { name = "OSAMA", type = "OJ", altitude_min = 11000 },
                { name = "AI803", type = "OJ", altitude_min = 6000 },
                { name = "RESOS", type = "OJ", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["QTR01C"] = {
            name = "QTR01C",
            runway = "RW26B",
            waypoints = {
                { name = "QTR01", type = "OJ", altitude_min = 9000 },
                { name = "AI268", type = "OJ", altitude_min = 7000 },
                { name = "ASPAL", type = "OJ", altitude_min = 6000 },
            }
        },
        ["QTR01G"] = {
            name = "QTR01G",
            runway = "RW08B",
            waypoints = {
                { name = "QTR01", type = "OJ", altitude_min = 9000 },
                { name = "AI088", type = "OJ", altitude_min = 7000 },
                { name = "LOTES", type = "OJ", altitude_min = 6000 },
            }
        },
        ["QTR2A"] = {
            name = "QTR2A",
            runway = "RW26B",
            waypoints = {
                { name = "QTR", type = "OJ", altitude_min = 9000 },
                { name = "D186O", type = "OJ", altitude_min = 7000 },
                { name = "QAA", type = "OJ" },
            }
        },
        ["QTR3A"] = {
            name = "QTR3A",
            runway = "RW08B",
            waypoints = {
                { name = "QTR", type = "OJ", altitude_min = 9000 },
                { name = "D336O", type = "OJ", altitude_min = 7000 },
                { name = "MDB", type = "OJ" },
            }
        },
        ["RALN2A"] = {
            name = "RALN2A",
            runway = "RW26B",
            waypoints = {
                { name = "RALNA", type = "OJ", altitude_min = 11000 },
                { name = "AMN", type = "OJ" },
                { name = "D160J", type = "OJ", altitude_min = 6000 },
                { name = "QAA", type = "OJ" },
            }
        },
        ["RALN3A"] = {
            name = "RALN3A",
            runway = "RW08B",
            waypoints = {
                { name = "RALNA", type = "OJ", altitude_min = 11000 },
                { name = "AMN", type = "OJ" },
                { name = "D209J", type = "OJ", altitude_min = 7000 },
                { name = "MDB", type = "OJ" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I08L"] = {
            name = "I08L",
            type = "A",
            runway = "I08L",
            waypoints = {
                { name = "LOTES", transition = "LOTES", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "KAPIR", transition = "LOTES", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "RESOS", transition = "RESOS", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "KAPIR", transition = "RESOS", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "KAPIR", transition = "", type = "OJ" },
                { name = "FI08L", transition = "", type = "OJ" },
                { name = "RW08L", transition = "", type = "OJ" },
                { name = "MIDRU", transition = "", type = "OJ", speed = 210.0 },
            }
        },
        ["I26L"] = {
            name = "I26L",
            type = "A",
            runway = "I26L",
            waypoints = {
                { name = "QAA", transition = "QAA", type = "OJ", altitude_min = 6000 },
                { name = "QAA", transition = "QAA", type = "OJ", altitude_min = 4600 },
                { name = "CF26L", transition = "", type = "OJ" },
                { name = "QAA", transition = "", type = "OJ" },
                { name = "RW26L", transition = "", type = "OJ" },
                { name = "RW26L", transition = "", type = "OJ", altitude_min = 5000 },
                { name = "QAA", transition = "", type = "OJ" },
            }
        },
        ["I26R"] = {
            name = "I26R",
            type = "A",
            runway = "I26R",
            waypoints = {
                { name = "AIWAH", transition = "AIWAH", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "MIDRU", transition = "AIWAH", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "ASPAL", transition = "ASPAL", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "MIDRU", transition = "ASPAL", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "ORDUN", transition = "ORDUN", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "MIDRU", transition = "ORDUN", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "QAA", transition = "QAA", type = "OJ" },
                { name = "", transition = "QAA", type = "" },
                { name = "SOLUR", transition = "QAA", type = "OJ" },
                { name = "MIDRU", transition = "QAA", type = "OJ", altitude_min = 5000 },
                { name = "MIDRU", transition = "", type = "OJ" },
                { name = "FI26R", transition = "", type = "OJ" },
                { name = "RW26R", transition = "", type = "OJ" },
                { name = "AI601", transition = "", type = "OJ", altitude_min = 3300 },
                { name = "", transition = "", type = "" },
                { name = "RESOS", transition = "", type = "OJ", speed = 210.0 },
            }
        },
        ["L08L"] = {
            name = "L08L",
            type = "A",
            runway = "L08L",
            waypoints = {
                { name = "LOTES", transition = "LOTES", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "KAPIR", transition = "LOTES", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "RESOS", transition = "RESOS", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "KAPIR", transition = "RESOS", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "KAPIR", transition = "", type = "OJ", altitude_min = 5000 },
                { name = "SODUK", transition = "", type = "OJ", altitude_min = 4000 },
                { name = "AI090", transition = "", type = "OJ", altitude_min = 3300 },
                { name = "RW08L", transition = "", type = "OJ" },
                { name = "MIDRU", transition = "", type = "OJ", speed = 210.0 },
            }
        },
        ["L26R"] = {
            name = "L26R",
            type = "A",
            runway = "L26R",
            waypoints = {
                { name = "AIWAH", transition = "AIWAH", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "MIDRU", transition = "AIWAH", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "ASPAL", transition = "ASPAL", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "MIDRU", transition = "ASPAL", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "ORDUN", transition = "ORDUN", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "MIDRU", transition = "ORDUN", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "QAA", transition = "QAA", type = "OJ" },
                { name = "", transition = "QAA", type = "" },
                { name = "SOLUR", transition = "QAA", type = "OJ" },
                { name = "MIDRU", transition = "QAA", type = "OJ", altitude_min = 5000 },
                { name = "MIDRU", transition = "", type = "OJ", altitude_min = 5000 },
                { name = "MISEM", transition = "", type = "OJ", altitude_min = 4000 },
                { name = "AI611", transition = "", type = "OJ", altitude_min = 3300 },
                { name = "AI612", transition = "", type = "OJ" },
                { name = "AI601", transition = "", type = "OJ", altitude_min = 3500 },
                { name = "", transition = "", type = "" },
                { name = "RESOS", transition = "", type = "OJ", speed = 210.0 },
            }
        },
        ["N08R"] = {
            name = "N08R",
            type = "A",
            runway = "N08R",
            waypoints = {
                { name = "MDB", transition = "MDB", type = "OJ", altitude_min = 6000 },
                { name = "MDB", transition = "MDB", type = "OJ", altitude_min = 4500 },
                { name = "MDB", transition = "", type = "OJ", altitude_min = 4500 },
                { name = "MN08R", transition = "", type = "OJ" },
                { name = "MN08R", transition = "", type = "OJ", altitude_min = 5000 },
                { name = "MDB", transition = "", type = "OJ" },
            }
        },
        ["R08R"] = {
            name = "R08R",
            type = "A",
            runway = "R08R",
            waypoints = {
                { name = "LOTES", transition = "LOTES", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "GEVUP", transition = "LOTES", type = "OJ", altitude_min = 5000 },
                { name = "RESOS", transition = "RESOS", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "GEVUP", transition = "RESOS", type = "OJ", altitude_min = 5000 },
                { name = "GEVUP", transition = "", type = "OJ", altitude_min = 5000 },
                { name = "OBTAN", transition = "", type = "OJ", altitude_min = 4000 },
                { name = "RW08R", transition = "", type = "OJ" },
                { name = "SIVIK", transition = "", type = "OJ" },
                { name = "ASPAL", transition = "", type = "OJ", altitude_min = 4800, speed = 210.0 },
                { name = "ASPAL", transition = "", type = "OJ", speed = 210.0 },
            }
        },
        ["R26L"] = {
            name = "R26L",
            type = "A",
            runway = "R26L",
            waypoints = {
                { name = "ASPAL", transition = "ASPAL", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "GENIS", transition = "ASPAL", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "ORDUN", transition = "ORDUN", type = "OJ", altitude_min = 6000, speed = 210.0 },
                { name = "GENIS", transition = "ORDUN", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "GENIS", transition = "", type = "OJ", altitude_min = 5000, speed = 210.0 },
                { name = "SIVIK", transition = "", type = "OJ", altitude_min = 4000, speed = 210.0 },
                { name = "AI264", transition = "", type = "OJ", altitude_min = 3210, speed = 210.0 },
                { name = "RW26L", transition = "", type = "OJ", speed = 210.0 },
                { name = "OBTAN", transition = "", type = "OJ" },
                { name = "LOTES", transition = "", type = "OJ", altitude_min = 4800, speed = 210.0 },
                { name = "LOTES", transition = "", type = "OJ", speed = 210.0 },
            }
        },
        ["S26L"] = {
            name = "S26L",
            type = "A",
            runway = "S26L",
            waypoints = {
                { name = "QAA", transition = "QAA", type = "OJ", altitude_min = 6000 },
                { name = "QAA", transition = "QAA", type = "OJ", altitude_min = 4600 },
                { name = "QAA", transition = "", type = "OJ", altitude_min = 4600 },
                { name = "34VOR", transition = "", type = "OJ", altitude_min = 3600 },
                { name = "RW26L", transition = "", type = "OJ" },
                { name = "RW26L", transition = "", type = "OJ", altitude_min = 5000 },
                { name = "QAA", transition = "", type = "OJ" },
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
