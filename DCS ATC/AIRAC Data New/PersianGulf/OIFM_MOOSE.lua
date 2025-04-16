local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIFM",
        Name = "OIFM Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["FF25R"] = { lat = 40.285466667, lon = 29.698702778, type = "LTBR" },
        ["D248Y"] = { lat = 37.989911111, lon = 20.000636111, type = "ENRT" },
        ["LABOT"] = { lat = 32.810833333, lon = 53.014722222, type = "ENRT" },
        ["D255D"] = { lat = 50.760936111, lon = -1.955202778, type = "EGHH" },
        ["D315T"] = { lat = 32.993755556, lon = 51.573169444, type = "OIFM" },
        ["MD25R"] = { lat = 35.635455556, lon = -0.589111111, type = "DAOO" },
        ["FQ07L"] = { lat = 32.742341667, lon = 51.768997222, type = "OIFM" },
        ["IFN27"] = { lat = 32.992863889, lon = 51.450441667, type = "OIFM" },
        ["FQ07R"] = { lat = 32.735816667, lon = 51.770233333, type = "OIFM" },
        ["CD07"] = { lat = 35.570188889, lon = -0.777227778, type = "DAOO" },
        ["70VO2"] = { lat = 36.210605556, lon = 6.710263889, type = "DABC" },
        ["MQ07R"] = { lat = 32.741794444, lon = 51.820275, type = "OIFM" },
        ["FS25L"] = { lat = 32.764644444, lon = 51.977625, type = "OIFM" },
        ["D085T"] = { lat = 32.76945, lon = 52.222380556, type = "OIFM" },
        ["D040P"] = { lat = 42.650527778, lon = 47.370211111, type = "URML" },
        ["D314T"] = { lat = 24.795775, lon = 39.460163889, type = "OEMA" },
        ["GESIP"] = { lat = 31.765555556, lon = 52.066388889, type = "ENRT" },
        ["IS50C"] = { lat = 31.930713889, lon = 52.035502778, type = "OIFM" },
        ["D348J"] = { lat = 42.736063889, lon = 27.487597222, type = "LBBG" },
        ["IS30A"] = { lat = 33.116294444, lon = 51.426597222, type = "OIFM" },
        ["FD25L"] = { lat = 35.681236111, lon = -0.435338889, type = "DAOO" },
        ["MD25L"] = { lat = 35.635355556, lon = -0.58245, type = "DAOO" },
        ["CF25R"] = { lat = 40.30375, lon = 29.782494444, type = "LTBR" },
        ["D318T"] = { lat = 49.464152778, lon = -2.394636111, type = "EGJJ" },
        ["FD07"] = { lat = 35.579997222, lon = -0.749030556, type = "DAOO" },
        ["LADAL"] = { lat = 32.373888889, lon = 52.928611111, type = "ENRT" },
        ["D270S"] = { lat = 36.832511111, lon = -2.653875, type = "LEAM" },
        ["MD07"] = { lat = 35.610688889, lon = -0.660633333, type = "DAOO" },
        ["D113J"] = { lat = 38.915963889, lon = 121.773216667, type = "ZYTL" },
        ["BOMID"] = { lat = 32.984444444, lon = 50.674722222, type = "ENRT" },
        ["EN25R"] = { lat = 32.750461111, lon = 51.886238889, type = "OIFM" },
        ["IS50A"] = { lat = 31.929191667, lon = 52.027002778, type = "OIFM" },
        ["D248J"] = { lat = 39.557455556, lon = 19.703336111, type = "LGKR" },
        ["FS25R"] = { lat = 32.773261111, lon = 51.974880556, type = "OIFM" },
        ["D130P"] = { lat = 31.767066667, lon = 120.030763889, type = "ZSCG" },
        ["CD7R7"] = { lat = 32.683347222, lon = 51.666925, type = "OIFM" },
        ["PEKAM"] = { lat = 33.484444444, lon = 51.021666667, type = "ENRT" },
        ["D109T"] = { lat = -20.884461111, lon = 55.865788889, type = "FMEE" },
        ["FD25R"] = { lat = 35.6907, lon = -0.428975, type = "DAOO" },
        ["D109L"] = { lat = 56.311666667, lon = 102.035, type = "UIBB" },
        ["FF25"] = { lat = 28.084472222, lon = -16.457444444, type = "GCTS" },
        ["EN25L"] = { lat = 32.750355556, lon = 51.885744444, type = "OIFM" },
        ["MA25R"] = { lat = 40.271713889, lon = 29.635888889, type = "LTBR" },
        ["D348H"] = { lat = 67.033333333, lon = 169.483333333, type = "UHEK" },
        ["CD7L5"] = { lat = 32.718172222, lon = 51.653469444, type = "OIFM" },
        ["D166J"] = { lat = 54.2375, lon = 48.812777778, type = "UWLW" },
        ["CD25R"] = { lat = 35.710144444, lon = -0.372402778, type = "DAOO" },
        ["FS07L"] = { lat = 32.731636111, lon = 51.734869444, type = "OIFM" },
        ["FD07R"] = { lat = 50.857186111, lon = 4.342825, type = "EBBR" },
        ["GADLU"] = { lat = 32.279166667, lon = 50.782222222, type = "ENRT" },
        ["D065L"] = { lat = 22.583875, lon = 114.087869444, type = "ZGSZ" },
        ["70VOR"] = { lat = -4.338572222, lon = 15.516494444, type = "FZAA" },
        ["D092L"] = { lat = 54.487222222, lon = 56.23, type = "UWUU" },
        ["D166O"] = { lat = 32.500263889, lon = 51.879330556, type = "OIFM" },
        ["D065I"] = { lat = 54.989777778, lon = 73.481469444, type = "UNOO" },
        ["D052H"] = { lat = 43.141388889, lon = 74.685555556, type = "UCFM" },
        ["D166I"] = { lat = 27.673777778, lon = -17.831322222, type = "GCHI" },
        ["D109J"] = { lat = 47.712525, lon = 23.214486111, type = "LRBM" },
        ["37LOC"] = { lat = 54.626886111, lon = 55.797497222, type = "UWUU" },
        ["D348O"] = { lat = 31.362811111, lon = 121.734663889, type = "ZSPD" },
        ["D230I"] = { lat = 42.036705556, lon = 12.226616667, type = "LIRF" },
        ["CQ07R"] = { lat = 32.724055556, lon = 51.672297222, type = "OIFM" },
        ["MD07R"] = { lat = 50.888080556, lon = 4.47625, type = "EBBR" },
        ["CD25L"] = { lat = 35.702033333, lon = -0.368416667, type = "DAOO" },
        ["DAPOG"] = { lat = 33.628888889, lon = 52.391944444, type = "ENRT" },
        ["IFN28"] = { lat = 32.620858333, lon = 51.357372222, type = "OIFM" },
        ["CQ07L"] = { lat = 32.736388889, lon = 51.670441667, type = "OIFM" },
        ["D087I"] = { lat = 37.795711111, lon = 65.332347222, type = "UTAE" },
        ["IS50B"] = { lat = 31.928855556, lon = 52.025077778, type = "OIFM" },
        ["IS30B"] = { lat = 33.127391667, lon = 51.441419444, type = "OIFM" },
    },

    -- Данные ВПП
    Runways = {
        ["RW07L"] = {
            heading = 70,
            length = -90.0,
            width = 0,
            threshold = { lat = 32.748736111111114, lon = 51.83781944444445 },
            end = { lat = 32.743670080009146, lon = 51.82127014249906 }
        },
        ["RW07R"] = {
            heading = 70,
            length = -140.0,
            width = 0,
            threshold = { lat = 32.744680555555554, lon = 51.83884444444445 },
            end = { lat = 32.73680006273027, lon = 51.813102257758096 }
        },
        ["RW25L"] = {
            heading = 250,
            length = 140.0,
            width = 0,
            threshold = { lat = 32.752963888888885, lon = 51.88474444444444 },
            end = { lat = 32.7450833960636, lon = 51.858999863951034 }
        },
        ["RW25R"] = {
            heading = 250,
            length = 90.0,
            width = 0,
            threshold = { lat = 32.757019444444445, lon = 51.883725 },
            end = { lat = 32.75195341334248, lon = 51.86717415886915 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BOMI1A"] = {
            name = "BOMI1A",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "BOMID", type = "E" },
            }
        },
        ["BOMI1B"] = {
            name = "BOMI1B",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "ISN", type = "D", altitude_min = 6000 },
                { name = "ISN", type = "D" },
                { name = "BOMID", type = "E" },
            }
        },
        ["BOMI3C"] = {
            name = "BOMI3C",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "BOMID", type = "E" },
            }
        },
        ["BOMI3D"] = {
            name = "BOMI3D",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 6000 },
                { name = "IFN", type = "D" },
                { name = "BOMID", type = "E" },
            }
        },
        ["DAPO1A"] = {
            name = "DAPO1A",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "", type = "" },
                { name = "DAPOG", type = "E" },
            }
        },
        ["DAPO1B"] = {
            name = "DAPO1B",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "", type = "" },
                { name = "DAPOG", type = "E" },
            }
        },
        ["DAPO1C"] = {
            name = "DAPO1C",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "", type = "" },
                { name = "DAPOG", type = "E" },
            }
        },
        ["DAPO1D"] = {
            name = "DAPO1D",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "DAPOG", type = "E" },
            }
        },
        ["GADL1C"] = {
            name = "GADL1C",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 6000 },
                { name = "ISN", type = "D" },
                { name = "D248Y", type = "P", altitude_min = 12000 },
                { name = "GADLU", type = "E" },
            }
        },
        ["GADL1J"] = {
            name = "GADL1J",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "GADLU", type = "E" },
            }
        },
        ["GADL2D"] = {
            name = "GADL2D",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "GADLU", type = "E" },
            }
        },
        ["GADL2K"] = {
            name = "GADL2K",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 6000 },
                { name = "IFN28", type = "P", altitude_min = 12000 },
                { name = "", type = "" },
                { name = "GADLU", type = "E" },
            }
        },
        ["GADL2L"] = {
            name = "GADL2L",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 6000 },
                { name = "IFN", type = "D" },
                { name = "IFN28", type = "P", altitude_min = 12000 },
                { name = "", type = "" },
                { name = "GADLU", type = "E" },
            }
        },
        ["GADL3A"] = {
            name = "GADL3A",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "GADLU", type = "E" },
            }
        },
        ["GADL3B"] = {
            name = "GADL3B",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 6000 },
                { name = "ISN", type = "D" },
                { name = "GADLU", type = "E" },
            }
        },
        ["GESI1A"] = {
            name = "GESI1A",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "ISN", type = "D", altitude_min = 7500 },
                { name = "ISN", type = "D" },
                { name = "GESIP", type = "E" },
            }
        },
        ["GESI1B"] = {
            name = "GESI1B",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "", type = "" },
                { name = "ISN", type = "D", altitude_min = 7500 },
                { name = "ISN", type = "D" },
                { name = "GESIP", type = "E" },
            }
        },
        ["GESI1C"] = {
            name = "GESI1C",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "", type = "" },
                { name = "IFN", type = "D", altitude_min = 6500 },
                { name = "IFN", type = "D" },
                { name = "GESIP", type = "E" },
            }
        },
        ["GESI1D"] = {
            name = "GESI1D",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "", type = "" },
                { name = "IFN", type = "D", altitude_min = 6500 },
                { name = "IFN", type = "D" },
                { name = "GESIP", type = "E" },
            }
        },
        ["LABO1A"] = {
            name = "LABO1A",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "ISN", type = "D", altitude_min = 7500 },
                { name = "ISN", type = "D" },
                { name = "LABOT", type = "E" },
            }
        },
        ["LABO1B"] = {
            name = "LABO1B",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "", type = "" },
                { name = "ISN", type = "D", altitude_min = 7500 },
                { name = "ISN", type = "D" },
                { name = "LABOT", type = "E" },
            }
        },
        ["LABO3C"] = {
            name = "LABO3C",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "", type = "" },
                { name = "IFN", type = "D", altitude_min = 6500 },
                { name = "IFN", type = "D" },
                { name = "LABOT", type = "E" },
            }
        },
        ["LABO3D"] = {
            name = "LABO3D",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "LABOT", type = "E" },
            }
        },
        ["LADA1A"] = {
            name = "LADA1A",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "ISN", type = "D", altitude_min = 7500 },
                { name = "ISN", type = "D" },
                { name = "LADAL", type = "E" },
            }
        },
        ["LADA1B"] = {
            name = "LADA1B",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "", type = "" },
                { name = "ISN", type = "D", altitude_min = 7500 },
                { name = "ISN", type = "D" },
                { name = "LADAL", type = "E" },
            }
        },
        ["LADA3C"] = {
            name = "LADA3C",
            runway = "RW25B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "", type = "" },
                { name = "IFN", type = "D", altitude_min = 6500 },
                { name = "IFN", type = "D" },
                { name = "LADAL", type = "E" },
            }
        },
        ["LADA3D"] = {
            name = "LADA3D",
            runway = "RW07B",
            waypoints = {
                { name = "", type = "", altitude_min = 5460 },
                { name = "", type = "" },
                { name = "IFN", type = "D", altitude_min = 6500 },
                { name = "IFN", type = "D" },
                { name = "LADAL", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BOMI1Q"] = {
            name = "BOMI1Q",
            runway = "ALL",
            waypoints = {
                { name = "BOMID", type = "OI" },
                { name = "ISN", type = "OI" },
            }
        },
        ["BOMI1R"] = {
            name = "BOMI1R",
            runway = "ALL",
            waypoints = {
                { name = "BOMID", type = "OI" },
                { name = "D315T", type = "OI" },
                { name = "D348O", type = "OI" },
            }
        },
        ["BOMI1S"] = {
            name = "BOMI1S",
            runway = "ALL",
            waypoints = {
                { name = "BOMID", type = "OI" },
                { name = "IFN", type = "OI" },
            }
        },
        ["BOMI1T"] = {
            name = "BOMI1T",
            runway = "ALL",
            waypoints = {
                { name = "BOMID", type = "OI" },
                { name = "IFN27", type = "OI" },
                { name = "D348O", type = "OI" },
            }
        },
        ["GADL1N"] = {
            name = "GADL1N",
            runway = "ALL",
            waypoints = {
                { name = "GADLU", type = "OI" },
                { name = "D248Y", type = "OI" },
                { name = "D248J", type = "OI" },
                { name = "ISN", type = "OI" },
            }
        },
        ["GADL1P"] = {
            name = "GADL1P",
            runway = "ALL",
            waypoints = {
                { name = "GADLU", type = "OI" },
                { name = "D270S", type = "OI" },
                { name = "D348O", type = "OI" },
            }
        },
        ["GADL1Q"] = {
            name = "GADL1Q",
            runway = "ALL",
            waypoints = {
                { name = "GADLU", type = "OI" },
                { name = "D270S", type = "OI" },
                { name = "D348O", type = "OI" },
            }
        },
        ["GESI1N"] = {
            name = "GESI1N",
            runway = "ALL",
            waypoints = {
                { name = "GESIP", type = "OI" },
                { name = "IS50A", type = "OI" },
                { name = "D166O", type = "OI" },
                { name = "ISN", type = "OI" },
            }
        },
        ["GESI1P"] = {
            name = "GESI1P",
            runway = "ALL",
            waypoints = {
                { name = "GESIP", type = "OI" },
                { name = "IS50A", type = "OI" },
                { name = "D166O", type = "OI" },
            }
        },
        ["GESI1Q"] = {
            name = "GESI1Q",
            runway = "ALL",
            waypoints = {
                { name = "GESIP", type = "OI" },
                { name = "IS50B", type = "OI" },
                { name = "D166O", type = "OI" },
            }
        },
        ["GESI1R"] = {
            name = "GESI1R",
            runway = "ALL",
            waypoints = {
                { name = "GESIP", type = "OI" },
                { name = "IS50C", type = "OI" },
                { name = "IFN", type = "OI" },
                { name = "D348O", type = "OI" },
            }
        },
        ["LABO1N"] = {
            name = "LABO1N",
            runway = "ALL",
            waypoints = {
                { name = "LABOT", type = "OI" },
                { name = "D085T", type = "OI" },
                { name = "ISN", type = "OI" },
            }
        },
        ["LABO1P"] = {
            name = "LABO1P",
            runway = "ALL",
            waypoints = {
                { name = "LABOT", type = "OI" },
                { name = "D085T", type = "OI" },
                { name = "D109T", type = "OI" },
            }
        },
        ["LABO1Q"] = {
            name = "LABO1Q",
            runway = "ALL",
            waypoints = {
                { name = "LABOT", type = "OI" },
                { name = "D040P", type = "OI" },
                { name = "D348O", type = "OI" },
            }
        },
        ["LABO1R"] = {
            name = "LABO1R",
            runway = "ALL",
            waypoints = {
                { name = "LABOT", type = "OI" },
                { name = "D130P", type = "OI" },
                { name = "D166O", type = "OI" },
            }
        },
        ["LADA1N"] = {
            name = "LADA1N",
            runway = "ALL",
            waypoints = {
                { name = "LADAL", type = "OI" },
                { name = "D109T", type = "OI" },
                { name = "ISN", type = "OI" },
            }
        },
        ["LADA1P"] = {
            name = "LADA1P",
            runway = "ALL",
            waypoints = {
                { name = "LADAL", type = "OI" },
                { name = "D109T", type = "OI" },
            }
        },
        ["PEKA1Q"] = {
            name = "PEKA1Q",
            runway = "ALL",
            waypoints = {
                { name = "PEKAM", type = "OI" },
                { name = "IS30A", type = "OI" },
                { name = "D314T", type = "OI" },
                { name = "ISN", type = "OI" },
            }
        },
        ["PEKA1R"] = {
            name = "PEKA1R",
            runway = "ALL",
            waypoints = {
                { name = "PEKAM", type = "OI" },
                { name = "IS30A", type = "OI" },
                { name = "D314T", type = "OI" },
                { name = "D348O", type = "OI" },
            }
        },
        ["PEKA2S"] = {
            name = "PEKA2S",
            runway = "ALL",
            waypoints = {
                { name = "PEKAM", type = "OI" },
                { name = "IS30B", type = "OI" },
                { name = "D318T", type = "OI" },
                { name = "D348O", type = "OI" },
            }
        },
        ["PEKA2T"] = {
            name = "PEKA2T",
            runway = "ALL",
            waypoints = {
                { name = "PEKAM", type = "OI" },
                { name = "IS30B", type = "OI" },
                { name = "D318T", type = "OI" },
                { name = "IFN", type = "OI" },
                { name = "D166O", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D07L4"] = {
            name = "D07L4",
            type = "A",
            runway = "D07L4",
            waypoints = {
                { name = "D348O", transition = "D348O", type = "OI", speed = 210.0 },
                { name = "D348H", transition = "D348O", type = "OI" },
                { name = "CD07", transition = "D348O", type = "OI", altitude_min = 7500 },
                { name = "CD07", transition = "", type = "OI", altitude_min = 7500 },
                { name = "FD07", transition = "", type = "OI", altitude_min = 6200 },
                { name = "MD07", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["D07L5"] = {
            name = "D07L5",
            type = "A",
            runway = "D07L5",
            waypoints = {
                { name = "D166O", transition = "D166O", type = "OI", speed = 230.0 },
                { name = "D166I", transition = "D166O", type = "OI" },
                { name = "D230I", transition = "D166O", type = "OI", altitude_min = 7800 },
                { name = "CD7L5", transition = "D166O", type = "OI", altitude_min = 7500 },
                { name = "CD7L5", transition = "", type = "OI", altitude_min = 7500 },
                { name = "FD07", transition = "", type = "OI", altitude_min = 6200 },
                { name = "MD07", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["D07R6"] = {
            name = "D07R6",
            type = "A",
            runway = "D07R6",
            waypoints = {
                { name = "D348O", transition = "D348O", type = "OI", speed = 210.0 },
                { name = "D348H", transition = "D348O", type = "OI" },
                { name = "CD07", transition = "D348O", type = "OI", altitude_min = 7500 },
                { name = "CD07", transition = "", type = "OI", altitude_min = 7500 },
                { name = "FD07", transition = "", type = "OI", altitude_min = 6200 },
                { name = "MD07", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["D07R7"] = {
            name = "D07R7",
            type = "A",
            runway = "D07R7",
            waypoints = {
                { name = "D166O", transition = "D166O", type = "OI" },
                { name = "D166I", transition = "D166O", type = "OI" },
                { name = "CD7R7", transition = "D166O", type = "OI", altitude_min = 7800 },
                { name = "CD7R7", transition = "", type = "OI", altitude_min = 7800 },
                { name = "FD07R", transition = "", type = "OI", altitude_min = 6200 },
                { name = "MD07R", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["D25L1"] = {
            name = "D25L1",
            type = "A",
            runway = "D25L1",
            waypoints = {
                { name = "D348O", transition = "D348O", type = "OI", speed = 210.0 },
                { name = "D348J", transition = "D348O", type = "OI" },
                { name = "CD25L", transition = "D348O", type = "OI", altitude_min = 7200 },
                { name = "CD25L", transition = "", type = "OI", altitude_min = 7200 },
                { name = "70VO2", transition = "", type = "OI", altitude_min = 6400 },
                { name = "FD25L", transition = "", type = "OI", altitude_min = 5800 },
                { name = "MD25L", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["D25L2"] = {
            name = "D25L2",
            type = "A",
            runway = "D25L2",
            waypoints = {
                { name = "D109T", transition = "D109T", type = "OI", speed = 230.0 },
                { name = "D109J", transition = "D109T", type = "OI" },
                { name = "CD25L", transition = "D109T", type = "OI", altitude_min = 7200 },
                { name = "CD25L", transition = "", type = "OI", altitude_min = 7200 },
                { name = "70VO2", transition = "", type = "OI", altitude_min = 6400 },
                { name = "FD25L", transition = "", type = "OI", altitude_min = 5800 },
                { name = "MD25L", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["D25L3"] = {
            name = "D25L3",
            type = "A",
            runway = "D25L3",
            waypoints = {
                { name = "D166O", transition = "D166O", type = "OI", speed = 230.0 },
                { name = "D166J", transition = "D166O", type = "OI" },
                { name = "CD25L", transition = "D166O", type = "OI", altitude_min = 7200 },
                { name = "CD25L", transition = "", type = "OI", altitude_min = 7200 },
                { name = "70VO2", transition = "", type = "OI", altitude_min = 6400 },
                { name = "FD25L", transition = "", type = "OI", altitude_min = 5800 },
                { name = "MD25L", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["D25R1"] = {
            name = "D25R1",
            type = "A",
            runway = "D25R1",
            waypoints = {
                { name = "D348O", transition = "D348O", type = "OI", speed = 210.0 },
                { name = "D348J", transition = "D348O", type = "OI" },
                { name = "CD25R", transition = "D348O", type = "OI", altitude_min = 7200 },
                { name = "CD25R", transition = "", type = "OI", altitude_min = 7200 },
                { name = "70VOR", transition = "", type = "OI", altitude_min = 6400 },
                { name = "FD25R", transition = "", type = "OI", altitude_min = 5800 },
                { name = "MD25R", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["D25R2"] = {
            name = "D25R2",
            type = "A",
            runway = "D25R2",
            waypoints = {
                { name = "D109T", transition = "D109T", type = "OI", speed = 230.0 },
                { name = "D109J", transition = "D109T", type = "OI" },
                { name = "CD25R", transition = "D109T", type = "OI", altitude_min = 7200 },
                { name = "CD25R", transition = "", type = "OI", altitude_min = 7200 },
                { name = "70VOR", transition = "", type = "OI", altitude_min = 6400 },
                { name = "FD25R", transition = "", type = "OI", altitude_min = 5800 },
                { name = "MD25R", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["D25R3"] = {
            name = "D25R3",
            type = "A",
            runway = "D25R3",
            waypoints = {
                { name = "D166O", transition = "D166O", type = "OI", speed = 230.0 },
                { name = "D166J", transition = "D166O", type = "OI" },
                { name = "CD25R", transition = "D166O", type = "OI", altitude_min = 7200 },
                { name = "CD25R", transition = "", type = "OI", altitude_min = 7200 },
                { name = "70VOR", transition = "", type = "OI", altitude_min = 6400 },
                { name = "FD25R", transition = "", type = "OI", altitude_min = 5800 },
                { name = "MD25R", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["I25R1"] = {
            name = "I25R1",
            type = "A",
            runway = "I25R1",
            waypoints = {
                { name = "D348O", transition = "D348O", type = "OI", speed = 210.0 },
                { name = "", transition = "D348O", type = "" },
                { name = "D065L", transition = "D348O", type = "OI", altitude_min = 7500 },
                { name = "", transition = "D348O", type = "" },
                { name = "CF25R", transition = "", type = "OI" },
                { name = "FF25R", transition = "", type = "OI" },
                { name = "RW25R", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["I25R2"] = {
            name = "I25R2",
            type = "A",
            runway = "I25R2",
            waypoints = {
                { name = "D109T", transition = "D109T", type = "OI", speed = 230.0 },
                { name = "D109L", transition = "D109T", type = "OI" },
                { name = "D092L", transition = "D109T", type = "OI", altitude_min = 7500 },
                { name = "", transition = "D109T", type = "" },
                { name = "CF25R", transition = "", type = "OI" },
                { name = "FF25R", transition = "", type = "OI" },
                { name = "RW25R", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["I25R3"] = {
            name = "I25R3",
            type = "A",
            runway = "I25R3",
            waypoints = {
                { name = "D166O", transition = "D166O", type = "OI", speed = 230.0 },
                { name = "", transition = "D166O", type = "" },
                { name = "D092L", transition = "D166O", type = "OI", altitude_min = 7500 },
                { name = "", transition = "D166O", type = "" },
                { name = "CF25R", transition = "", type = "OI" },
                { name = "FF25R", transition = "", type = "OI" },
                { name = "RW25R", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["L25R1"] = {
            name = "L25R1",
            type = "A",
            runway = "L25R1",
            waypoints = {
                { name = "D348O", transition = "D348O", type = "OI", speed = 210.0 },
                { name = "", transition = "D348O", type = "" },
                { name = "D065L", transition = "D348O", type = "OI", altitude_min = 7500 },
                { name = "", transition = "D348O", type = "" },
                { name = "CF25R", transition = "", type = "OI", altitude_min = 7000 },
                { name = "FF25R", transition = "", type = "OI", altitude_min = 7000 },
                { name = "37LOC", transition = "", type = "OI", altitude_min = 6077 },
                { name = "MA25R", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["L25R4"] = {
            name = "L25R4",
            type = "A",
            runway = "L25R4",
            waypoints = {
                { name = "D348O", transition = "D348O", type = "OI", speed = 210.0 },
                { name = "", transition = "D348O", type = "" },
                { name = "D065I", transition = "D348O", type = "OI", altitude_min = 7500 },
                { name = "", transition = "D348O", type = "" },
                { name = "CF25R", transition = "", type = "OI", altitude_min = 7000 },
                { name = "FF25R", transition = "", type = "OI", altitude_min = 7000 },
                { name = "37LOC", transition = "", type = "OI", altitude_min = 6077 },
                { name = "MA25R", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 5460 },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["L25R5"] = {
            name = "L25R5",
            type = "A",
            runway = "L25R5",
            waypoints = {
                { name = "D109T", transition = "D109T", type = "OI", speed = 210.0 },
                { name = "D113J", transition = "D109T", type = "OI" },
                { name = "D087I", transition = "D109T", type = "OI", altitude_min = 7500 },
                { name = "", transition = "D109T", type = "" },
                { name = "CF25R", transition = "", type = "OI", altitude_min = 7000 },
                { name = "FF25R", transition = "", type = "OI", altitude_min = 7000 },
                { name = "37LOC", transition = "", type = "OI", altitude_min = 6077 },
                { name = "MA25R", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 5460 },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["L25R6"] = {
            name = "L25R6",
            type = "A",
            runway = "L25R6",
            waypoints = {
                { name = "D166O", transition = "D166O", type = "OI", speed = 230.0 },
                { name = "", transition = "D166O", type = "" },
                { name = "D087I", transition = "D166O", type = "OI", altitude_min = 7500 },
                { name = "", transition = "D166O", type = "" },
                { name = "CF25R", transition = "", type = "OI", altitude_min = 7000 },
                { name = "FF25R", transition = "", type = "OI", altitude_min = 7000 },
                { name = "37LOC", transition = "", type = "OI", altitude_min = 6077 },
                { name = "MA25R", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 5460 },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["N25L1"] = {
            name = "N25L1",
            type = "A",
            runway = "N25L1",
            waypoints = {
                { name = "IFN", transition = "IFN", type = "OI", altitude_min = 8000 },
                { name = "IFN", transition = "IFN", type = "OI" },
                { name = "FF25", transition = "IFN", type = "OI" },
                { name = "FF25", transition = "", type = "OI" },
                { name = "EN25L", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI", altitude_min = 5460 },
                { name = "IFN", transition = "", type = "OI", altitude_min = 7000 },
                { name = "IFN", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI", altitude_min = 8000 },
            }
        },
        ["N25L2"] = {
            name = "N25L2",
            type = "A",
            runway = "N25L2",
            waypoints = {
                { name = "IFN", transition = "IFN", type = "OI", altitude_min = 8000, speed = 185.0 },
                { name = "IFN", transition = "IFN", type = "OI" },
                { name = "FF25", transition = "IFN", type = "OI" },
                { name = "FF25", transition = "", type = "OI" },
                { name = "EN25L", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI", altitude_min = 5460 },
                { name = "IFN", transition = "", type = "OI", altitude_min = 7000 },
                { name = "IFN", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["N25R1"] = {
            name = "N25R1",
            type = "A",
            runway = "N25R1",
            waypoints = {
                { name = "IFN", transition = "IFN", type = "OI", altitude_min = 8000 },
                { name = "IFN", transition = "IFN", type = "OI" },
                { name = "FF25", transition = "IFN", type = "OI" },
                { name = "FF25", transition = "", type = "OI" },
                { name = "EN25R", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI", altitude_min = 5460 },
                { name = "IFN", transition = "", type = "OI", altitude_min = 7000 },
                { name = "IFN", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI", altitude_min = 8000 },
            }
        },
        ["N25R2"] = {
            name = "N25R2",
            type = "A",
            runway = "N25R2",
            waypoints = {
                { name = "IFN", transition = "IFN", type = "OI", altitude_min = 8000, speed = 185.0 },
                { name = "IFN", transition = "IFN", type = "OI" },
                { name = "FF25", transition = "IFN", type = "OI" },
                { name = "FF25", transition = "", type = "OI" },
                { name = "EN25R", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI", altitude_min = 5460 },
                { name = "IFN", transition = "", type = "OI", altitude_min = 7000 },
                { name = "IFN", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["Q07L2"] = {
            name = "Q07L2",
            type = "A",
            runway = "Q07L2",
            waypoints = {
                { name = "D348O", transition = "D348O", type = "OI" },
                { name = "", transition = "D348O", type = "" },
                { name = "CQ07L", transition = "D348O", type = "OI", altitude_min = 7500 },
                { name = "CQ07L", transition = "", type = "OI", altitude_min = 7500 },
                { name = "FQ07L", transition = "", type = "OI", altitude_min = 6200 },
                { name = "MD07", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI", altitude_min = 6800 },
                { name = "IFN", transition = "", type = "OI", altitude_min = 8000 },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["Q07L4"] = {
            name = "Q07L4",
            type = "A",
            runway = "Q07L4",
            waypoints = {
                { name = "D166O", transition = "D166O", type = "OI" },
                { name = "", transition = "D166O", type = "" },
                { name = "D052H", transition = "D166O", type = "OI", altitude_min = 8000 },
                { name = "CQ07L", transition = "D166O", type = "OI", altitude_min = 7500 },
                { name = "CQ07L", transition = "", type = "OI", altitude_min = 7500 },
                { name = "FQ07L", transition = "", type = "OI", altitude_min = 6200 },
                { name = "MD07", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI", altitude_min = 6800 },
                { name = "IFN", transition = "", type = "OI", altitude_min = 8000 },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["Q07R1"] = {
            name = "Q07R1",
            type = "A",
            runway = "Q07R1",
            waypoints = {
                { name = "D348O", transition = "D348O", type = "OI" },
                { name = "", transition = "D348O", type = "" },
                { name = "CQ07R", transition = "D348O", type = "OI", altitude_min = 7500 },
                { name = "CQ07R", transition = "", type = "OI", altitude_min = 7500 },
                { name = "FQ07R", transition = "", type = "OI", altitude_min = 6200 },
                { name = "MQ07R", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI", altitude_min = 6800 },
                { name = "IFN", transition = "", type = "OI", altitude_min = 8000 },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["Q07R3"] = {
            name = "Q07R3",
            type = "A",
            runway = "Q07R3",
            waypoints = {
                { name = "D166O", transition = "D166O", type = "OI" },
                { name = "", transition = "D166O", type = "" },
                { name = "D052H", transition = "D166O", type = "OI", altitude_min = 8000 },
                { name = "CQ07R", transition = "D166O", type = "OI", altitude_min = 7500 },
                { name = "CQ07R", transition = "", type = "OI", altitude_min = 7500 },
                { name = "FQ07R", transition = "", type = "OI", altitude_min = 6200 },
                { name = "MQ07R", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI" },
                { name = "IFN", transition = "", type = "OI", altitude_min = 6800 },
                { name = "IFN", transition = "", type = "OI", altitude_min = 8000 },
                { name = "D348O", transition = "", type = "OI" },
                { name = "D348O", transition = "", type = "OI", altitude_min = 10000, speed = 210.0 },
            }
        },
        ["S07L1"] = {
            name = "S07L1",
            type = "A",
            runway = "S07L1",
            waypoints = {
                { name = "ISN", transition = "ISN", type = "OI", altitude_min = 8000, speed = 140.0 },
                { name = "D255D", transition = "ISN", type = "OI" },
                { name = "D255D", transition = "ISN", type = "OI" },
                { name = "FS07L", transition = "ISN", type = "OI", altitude_min = 6800 },
                { name = "FS07L", transition = "", type = "OI", altitude_min = 6800 },
                { name = "ISN", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI", altitude_min = 6800 },
                { name = "ISN", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI", altitude_min = 8000 },
            }
        },
        ["S25L"] = {
            name = "S25L",
            type = "A",
            runway = "S25L",
            waypoints = {
                { name = "ISN", transition = "ISN", type = "OI", altitude_min = 8000, speed = 185.0 },
                { name = "ISN", transition = "ISN", type = "OI" },
                { name = "FS25L", transition = "ISN", type = "OI" },
                { name = "FS25L", transition = "", type = "OI" },
                { name = "RW25L", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI", altitude_min = 7000 },
                { name = "ISN", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["S25R"] = {
            name = "S25R",
            type = "A",
            runway = "S25R",
            waypoints = {
                { name = "ISN", transition = "ISN", type = "OI", altitude_min = 8000, speed = 185.0 },
                { name = "ISN", transition = "ISN", type = "OI" },
                { name = "FS25R", transition = "ISN", type = "OI" },
                { name = "FS25R", transition = "", type = "OI" },
                { name = "RW25R", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI", altitude_min = 7000 },
                { name = "ISN", transition = "", type = "OI" },
                { name = "ISN", transition = "", type = "OI", altitude_min = 8000, speed = 230.0 },
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
