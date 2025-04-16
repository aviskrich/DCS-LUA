local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LTAY",
        Name = "LTAY Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["D061J"] = { lat = 39.511538889, lon = 20.269508333, type = "LGKR" },
        ["D061K"] = { lat = 45.778630556, lon = 25.762652778, type = "LRBV" },
        ["CQ23"] = { lat = 51.851027778, lon = 94.776211111, type = "UNKY" },
        ["AY616"] = { lat = 37.984716667, lon = 29.788861111, type = "LTAY" },
        ["RW05"] = { lat = 6.273472222, lon = 81.11275, type = "VCRI" },
        ["ASNAB"] = { lat = 37.728427778, lon = 30.066969444, type = "LTAY" },
        ["ELVIT"] = { lat = 37.513733333, lon = 29.436397222, type = "LTAY" },
        ["EKVOT"] = { lat = 37.691208333, lon = 30.085625, type = "LTAY" },
        ["PELLO"] = { lat = 37.649638889, lon = 29.418272222, type = "LTAY" },
        ["RESLI"] = { lat = 38.294444444, lon = 30.119722222, type = "ENRT" },
        ["AY234"] = { lat = 37.772769444, lon = 29.674544444, type = "LTAY" },
        ["AY205"] = { lat = 37.744125, lon = 29.614747222, type = "LTAY" },
        ["D078J"] = { lat = 35.441994444, lon = 27.349369444, type = "LGKP" },
        ["AY612"] = { lat = 37.713930556, lon = 29.551827778, type = "LTAY" },
        ["AY303"] = { lat = 37.964372222, lon = 29.831297222, type = "LTAY" },
        ["AY235"] = { lat = 37.809930556, lon = 29.537569444, type = "LTAY" },
        ["REPGO"] = { lat = 37.856230556, lon = 30.095211111, type = "LTAY" },
        ["FQ23"] = { lat = 55.187327778, lon = 30.550916667, type = "UMII" },
        ["MQ23"] = { lat = 47.508044444, lon = 39.952994444, type = "URRP" },
        ["AY603"] = { lat = 37.758788889, lon = 29.929433333, type = "LTAY" },
        ["VEGUT"] = { lat = 37.89075, lon = 29.922044444, type = "LTAY" },
        ["FD23"] = { lat = 36.781294444, lon = 3.364605556, type = "DAAG" },
        ["90DME"] = { lat = 48.359158333, lon = 12.001194444, type = "EDDM" },
        ["AY604"] = { lat = 37.942116667, lon = 30.030413889, type = "LTAY" },
        ["OSGOM"] = { lat = 37.840605556, lon = 29.534783333, type = "LTAY" },
        ["MEZON"] = { lat = 37.692355556, lon = 29.506947222, type = "LTAY" },
        ["AY305"] = { lat = 37.990352778, lon = 29.7092, type = "LTAY" },
        ["KOZLU"] = { lat = 37.497222222, lon = 30.074444444, type = "ENRT" },
        ["AY613"] = { lat = 37.735502778, lon = 29.596763889, type = "LTAY" },
        ["EKTUB"] = { lat = 37.59495, lon = 29.362894444, type = "LTAY" },
        ["PELIL"] = { lat = 37.839722222, lon = 30.232777778, type = "ENRT" },
        ["VAGDA"] = { lat = 38.028036111, lon = 29.965605556, type = "LTAY" },
        ["AY236"] = { lat = 37.911338889, lon = 29.516816667, type = "LTAY" },
        ["AY209"] = { lat = 37.556655556, lon = 29.857572222, type = "LTAY" },
        ["AY614"] = { lat = 37.822336111, lon = 29.830091667, type = "LTAY" },
        ["CI23"] = { lat = 36.8017, lon = 3.39725, type = "DAAG" },
        ["AY615"] = { lat = 37.903241667, lon = 29.862241667, type = "LTAY" },
        ["AY206"] = { lat = 37.766691667, lon = 29.531505556, type = "LTAY" },
        ["TAVAS"] = { lat = -21.016666667, lon = 21.0, type = "ENRT" },
        ["65DME"] = { lat = 53.838558333, lon = 10.893055556, type = "EDHL" },
        ["BALSU"] = { lat = 37.458333333, lon = 29.423611111, type = "ENRT" },
        ["FF241"] = { lat = 37.864436111, lon = 29.915527778, type = "LTAY" },
        ["NEXER"] = { lat = 37.634102778, lon = 29.431205556, type = "LTAY" },
        ["ATGIT"] = { lat = 38.201502778, lon = 29.749069444, type = "ENRT" },
        ["D308J"] = { lat = 58.858813889, lon = -156.940597222, type = "PAKN" },
        ["EVPAN"] = { lat = 37.511088889, lon = 29.548230556, type = "LTAY" },
        ["NOBTU"] = { lat = 37.606919444, lon = 29.672763889, type = "LTAY" },
        ["D078H"] = { lat = 51.190911111, lon = 4.397641667, type = "EBAW" },
        ["D028J"] = { lat = 54.532777778, lon = 49.003611111, type = "UWLW" },
        ["AY617"] = { lat = 38.072980556, lon = 30.063508333, type = "LTAY" },
        ["MAZUR"] = { lat = 37.848669444, lon = 29.833527778, type = "LTAY" },
        ["AY208"] = { lat = 37.62875, lon = 29.592091667, type = "LTAY" },
        ["D130J"] = { lat = 31.825258333, lon = 119.935236111, type = "ZSCG" },
        ["D229P"] = { lat = 40.668686111, lon = 35.225358333, type = "LTAP" },
        ["DESEM"] = { lat = 38.152222222, lon = 30.001944444, type = "ENRT" },
        ["OTGEL"] = { lat = 37.677938889, lon = 29.507861111, type = "LTAY" },
        ["MD23"] = { lat = 36.723125, lon = 3.268461111, type = "DAAG" },
        ["D234E"] = { lat = 48.457922222, lon = 135.090919444, type = "UHHH" },
        ["D209J"] = { lat = 55.164747222, lon = -4.914519444, type = "EGPK" },
        ["BAGLU"] = { lat = 38.071111111, lon = 29.325277778, type = "ENRT" },
        ["AY207"] = { lat = 37.854922222, lon = 29.471925, type = "LTAY" },
        ["TEBGA"] = { lat = 38.051152778, lon = 29.628438889, type = "LTAY" },
        ["D236J"] = { lat = 50.153, lon = 4.4335, type = "EBFS" },
        ["AY611"] = { lat = 37.662022222, lon = 29.696011111, type = "LTAY" },
        ["AY302"] = { lat = 37.859408333, lon = 30.062736111, type = "LTAY" },
        ["MA05"] = { lat = 28.991827778, lon = -10.091097222, type = "GMAG" },
        ["ETAPU"] = { lat = 37.878447222, lon = 29.896147222, type = "LTAY" },
        ["CD23"] = { lat = 36.801336111, lon = 3.397791667, type = "DAAG" },
    },

    -- Данные ВПП
    Runways = {
        ["RW05"] = {
            heading = 50,
            length = 0,
            width = 0,
            threshold = { lat = 37.778591666666664, lon = 29.686716666666666 },
            end = { lat = 37.778591666666664, lon = 29.686716666666666 }
        },
        ["RW23"] = {
            heading = 230,
            length = 0,
            width = 0,
            threshold = { lat = 37.792538888888885, lon = 29.715877777777777 },
            end = { lat = 37.792538888888885, lon = 29.715877777777777 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ATGI1L"] = {
            name = "ATGI1L",
            runway = "RW23",
            waypoints = {
                { name = "AY205", type = "P", altitude_min = 4100, speed = 200.0 },
                { name = "AY206", type = "P", speed = 220.0 },
                { name = "AY207", type = "P" },
                { name = "TEBGA", type = "P" },
                { name = "ATGIT", type = "E" },
            }
        },
        ["ATGI1N"] = {
            name = "ATGI1N",
            runway = "RW05",
            waypoints = {
                { name = "ETAPU", type = "P" },
                { name = "AY303", type = "P" },
                { name = "ATGIT", type = "E", altitude_max = 15000 },
            }
        },
        ["BAGL1K"] = {
            name = "BAGL1K",
            runway = "RW23",
            waypoints = {
                { name = "", type = "", altitude_min = 3200 },
                { name = "D234E", type = "P", altitude_min = 3300 },
                { name = "CRD", type = "D" },
                { name = "D061J", type = "P", altitude_min = 5500 },
                { name = "CRD", type = "D", altitude_min = 8000 },
                { name = "BAGLU", type = "E" },
            }
        },
        ["BAGL1L"] = {
            name = "BAGL1L",
            runway = "RW23",
            waypoints = {
                { name = "AY205", type = "P", altitude_min = 4100, speed = 200.0 },
                { name = "AY206", type = "P", speed = 220.0 },
                { name = "AY207", type = "P" },
                { name = "BAGLU", type = "E" },
            }
        },
        ["BAGL1M"] = {
            name = "BAGL1M",
            runway = "RW05",
            waypoints = {
                { name = "", type = "", altitude_min = 3200 },
                { name = "D061J", type = "P", altitude_min = 5500 },
                { name = "CRD", type = "D", altitude_min = 8000 },
                { name = "BAGLU", type = "E" },
            }
        },
        ["BAGL1N"] = {
            name = "BAGL1N",
            runway = "RW05",
            waypoints = {
                { name = "ETAPU", type = "P" },
                { name = "AY303", type = "P" },
                { name = "AY305", type = "P" },
                { name = "BAGLU", type = "E" },
            }
        },
        ["BALS1K"] = {
            name = "BALS1K",
            runway = "RW23",
            waypoints = {
                { name = "", type = "", altitude_min = 3200 },
                { name = "D234E", type = "P", altitude_min = 3300 },
                { name = "CRD", type = "D" },
                { name = "D061J", type = "P", altitude_min = 5500 },
                { name = "CRD", type = "D", altitude_min = 8000 },
                { name = "BALSU", type = "E" },
            }
        },
        ["BALS1L"] = {
            name = "BALS1L",
            runway = "RW23",
            waypoints = {
                { name = "AY205", type = "P", altitude_min = 4100, speed = 200.0 },
                { name = "AY208", type = "P", speed = 220.0 },
                { name = "BALSU", type = "E" },
            }
        },
        ["BALS1M"] = {
            name = "BALS1M",
            runway = "RW05",
            waypoints = {
                { name = "", type = "", altitude_min = 3200 },
                { name = "D061J", type = "P", altitude_min = 5500 },
                { name = "CRD", type = "D", altitude_min = 8000 },
                { name = "BALSU", type = "E" },
            }
        },
        ["BALS1N"] = {
            name = "BALS1N",
            runway = "RW05",
            waypoints = {
                { name = "ETAPU", type = "P" },
                { name = "AY302", type = "P" },
                { name = "ASNAB", type = "P" },
                { name = "EVPAN", type = "P" },
                { name = "BALSU", type = "E" },
            }
        },
        ["DESE1K"] = {
            name = "DESE1K",
            runway = "RW23",
            waypoints = {
                { name = "", type = "", altitude_min = 3200 },
                { name = "D234E", type = "P", altitude_min = 3300 },
                { name = "CRD", type = "D" },
                { name = "D061J", type = "P", altitude_min = 5500 },
                { name = "", type = "" },
                { name = "DESEM", type = "E" },
            }
        },
        ["DESE1M"] = {
            name = "DESE1M",
            runway = "RW05",
            waypoints = {
                { name = "", type = "", altitude_min = 3200 },
                { name = "D061J", type = "P", altitude_min = 5500 },
                { name = "", type = "" },
                { name = "DESEM", type = "E" },
            }
        },
        ["IPT1L"] = {
            name = "IPT1L",
            runway = "RW23",
            waypoints = {
                { name = "AY205", type = "P", altitude_min = 4100, speed = 200.0 },
                { name = "AY208", type = "P", speed = 220.0 },
                { name = "NOBTU", type = "P" },
                { name = "AY209", type = "P" },
                { name = "EKVOT", type = "P" },
                { name = "IPT", type = "D" },
            }
        },
        ["KOZL1K"] = {
            name = "KOZL1K",
            runway = "RW23",
            waypoints = {
                { name = "", type = "", altitude_min = 3200 },
                { name = "D234E", type = "P", altitude_min = 3300 },
                { name = "CRD", type = "D" },
                { name = "D061J", type = "P", altitude_min = 5500 },
                { name = "CRD", type = "D", altitude_min = 8000 },
                { name = "KOZLU", type = "E" },
            }
        },
        ["KOZL1L"] = {
            name = "KOZL1L",
            runway = "RW23",
            waypoints = {
                { name = "AY205", type = "P", altitude_min = 4100, speed = 200.0 },
                { name = "AY208", type = "P", speed = 220.0 },
                { name = "NOBTU", type = "P" },
                { name = "AY209", type = "P" },
                { name = "KOZLU", type = "E" },
            }
        },
        ["KOZL1M"] = {
            name = "KOZL1M",
            runway = "RW05",
            waypoints = {
                { name = "", type = "", altitude_min = 3200 },
                { name = "D061J", type = "P", altitude_min = 5500 },
                { name = "CRD", type = "D", altitude_min = 8000 },
                { name = "KOZLU", type = "E" },
            }
        },
        ["KOZL1N"] = {
            name = "KOZL1N",
            runway = "RW05",
            waypoints = {
                { name = "ETAPU", type = "P" },
                { name = "AY302", type = "P" },
                { name = "ASNAB", type = "P" },
                { name = "KOZLU", type = "E" },
            }
        },
        ["PELI1J"] = {
            name = "PELI1J",
            runway = "RW05",
            waypoints = {
                { name = "ETAPU", type = "P" },
                { name = "AY302", type = "P" },
                { name = "PELIL", type = "E" },
            }
        },
        ["PELI1K"] = {
            name = "PELI1K",
            runway = "RW23",
            waypoints = {
                { name = "", type = "", altitude_min = 3200 },
                { name = "D234E", type = "P", altitude_min = 3700 },
                { name = "CRD", type = "D", altitude_min = 5300 },
                { name = "D078H", type = "P", altitude_min = 7800 },
                { name = "PELIL", type = "E" },
            }
        },
        ["PELI1M"] = {
            name = "PELI1M",
            runway = "RW05",
            waypoints = {
                { name = "", type = "", altitude_min = 3200 },
                { name = "D061J", type = "P", altitude_min = 5500 },
                { name = "CRD", type = "D", altitude_min = 8000 },
                { name = "PELIL", type = "E" },
            }
        },
        ["TAVA1K"] = {
            name = "TAVA1K",
            runway = "RW23",
            waypoints = {
                { name = "", type = "", altitude_min = 3200 },
                { name = "D234E", type = "P", altitude_min = 3300 },
                { name = "CRD", type = "D" },
                { name = "D061J", type = "P", altitude_min = 5500 },
                { name = "CRD", type = "D", altitude_min = 8000 },
                { name = "TAVAS", type = "E" },
            }
        },
        ["TAVA1L"] = {
            name = "TAVA1L",
            runway = "RW23",
            waypoints = {
                { name = "AY205", type = "P", altitude_min = 4100, speed = 200.0 },
                { name = "AY208", type = "P", speed = 220.0 },
                { name = "TAVAS", type = "E" },
            }
        },
        ["TAVA1M"] = {
            name = "TAVA1M",
            runway = "RW05",
            waypoints = {
                { name = "", type = "", altitude_min = 3200 },
                { name = "D061J", type = "P", altitude_min = 5500 },
                { name = "CRD", type = "D", altitude_min = 8000 },
                { name = "TAVAS", type = "E" },
            }
        },
        ["TAVA1N"] = {
            name = "TAVA1N",
            runway = "RW05",
            waypoints = {
                { name = "ETAPU", type = "P" },
                { name = "AY303", type = "P" },
                { name = "AY305", type = "P" },
                { name = "OSGOM", type = "P" },
                { name = "TAVAS", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BAGL1B"] = {
            name = "BAGL1B",
            runway = "RW05",
            waypoints = {
                { name = "BAGLU", type = "LT" },
                { name = "OSGOM", type = "LT" },
                { name = "AY611", type = "LT" },
                { name = "ELVIT", type = "LT", altitude_min = 9000 },
                { name = "EKTUB", type = "LT", altitude_min = 8000 },
                { name = "NEXER", type = "LT", altitude_min = 7500 },
                { name = "OTGEL", type = "LT" },
            }
        },
        ["BAGL1C"] = {
            name = "BAGL1C",
            runway = "RW05",
            waypoints = {
                { name = "BAGLU", type = "LT" },
                { name = "OSGOM", type = "LT" },
                { name = "AY611", type = "LT" },
                { name = "ELVIT", type = "LT", altitude_min = 9000 },
                { name = "EKTUB", type = "LT", altitude_min = 8000 },
                { name = "PELLO", type = "LT", altitude_min = 7500 },
            }
        },
        ["BAGL1J"] = {
            name = "BAGL1J",
            runway = "RW23",
            waypoints = {
                { name = "BAGLU", type = "LT" },
                { name = "TEBGA", type = "LT" },
                { name = "VAGDA", type = "LT", altitude_min = 9000 },
                { name = "AY604", type = "LT", altitude_min = 8000 },
                { name = "VEGUT", type = "LT", altitude_min = 6000 },
            }
        },
        ["BAGL1U"] = {
            name = "BAGL1U",
            runway = "ALL",
            waypoints = {
                { name = "BAGLU", type = "LT" },
                { name = "D308J", type = "LT" },
                { name = "CRD", type = "LT" },
            }
        },
        ["BALS1B"] = {
            name = "BALS1B",
            runway = "RW05",
            waypoints = {
                { name = "BALSU", type = "LT", altitude_min = 9000 },
                { name = "EKTUB", type = "LT", altitude_min = 8000 },
                { name = "NEXER", type = "LT", altitude_min = 7500 },
                { name = "OTGEL", type = "LT" },
            }
        },
        ["BALS1C"] = {
            name = "BALS1C",
            runway = "RW05",
            waypoints = {
                { name = "BALSU", type = "LT", altitude_min = 9000 },
                { name = "EKTUB", type = "LT", altitude_min = 8000 },
                { name = "PELLO", type = "LT", altitude_min = 7500 },
            }
        },
        ["BALS1J"] = {
            name = "BALS1J",
            runway = "RW23",
            waypoints = {
                { name = "BALSU", type = "LT" },
                { name = "NOBTU", type = "LT" },
                { name = "AY603", type = "LT" },
                { name = "REPGO", type = "LT", altitude_min = 9000 },
                { name = "AY604", type = "LT", altitude_min = 8000 },
                { name = "VEGUT", type = "LT", altitude_min = 6000 },
            }
        },
        ["BALS1U"] = {
            name = "BALS1U",
            runway = "ALL",
            waypoints = {
                { name = "BALSU", type = "LT" },
                { name = "D209J", type = "LT" },
                { name = "CRD", type = "LT" },
            }
        },
        ["DESE1B"] = {
            name = "DESE1B",
            runway = "RW05",
            waypoints = {
                { name = "DESEM", type = "LT" },
                { name = "ETAPU", type = "LT", altitude_min = 16000 },
                { name = "AY611", type = "LT" },
                { name = "ELVIT", type = "LT", altitude_min = 9000 },
                { name = "EKTUB", type = "LT", altitude_min = 8000 },
                { name = "NEXER", type = "LT", altitude_min = 7500 },
                { name = "OTGEL", type = "LT" },
            }
        },
        ["DESE1C"] = {
            name = "DESE1C",
            runway = "RW05",
            waypoints = {
                { name = "DESEM", type = "LT" },
                { name = "ETAPU", type = "LT", altitude_min = 16000 },
                { name = "AY611", type = "LT" },
                { name = "ELVIT", type = "LT", altitude_min = 9000 },
                { name = "EKTUB", type = "LT", altitude_min = 8000 },
                { name = "PELLO", type = "LT", altitude_min = 7500 },
            }
        },
        ["DESE1U"] = {
            name = "DESE1U",
            runway = "ALL",
            waypoints = {
                { name = "DESEM", type = "LT" },
                { name = "D028J", type = "LT" },
                { name = "CRD", type = "LT" },
            }
        },
        ["IPT1B"] = {
            name = "IPT1B",
            runway = "RW05",
            waypoints = {
                { name = "IPT", type = "LT" },
                { name = "ASNAB", type = "LT" },
                { name = "AY611", type = "LT" },
                { name = "ELVIT", type = "LT", altitude_min = 9000 },
                { name = "EKTUB", type = "LT", altitude_min = 8000 },
                { name = "NEXER", type = "LT", altitude_min = 7500 },
                { name = "OTGEL", type = "LT" },
            }
        },
        ["IPT1C"] = {
            name = "IPT1C",
            runway = "RW05",
            waypoints = {
                { name = "IPT", type = "LT" },
                { name = "ASNAB", type = "LT" },
                { name = "AY611", type = "LT" },
                { name = "ELVIT", type = "LT", altitude_min = 9000 },
                { name = "EKTUB", type = "LT", altitude_min = 8000 },
                { name = "PELLO", type = "LT", altitude_min = 7500 },
            }
        },
        ["IPT1J"] = {
            name = "IPT1J",
            runway = "RW23",
            waypoints = {
                { name = "IPT", type = "LT" },
                { name = "AY604", type = "LT", altitude_min = 8000 },
                { name = "VEGUT", type = "LT", altitude_min = 6000 },
            }
        },
        ["KOZL1B"] = {
            name = "KOZL1B",
            runway = "RW05",
            waypoints = {
                { name = "KOZLU", type = "LT" },
                { name = "EVPAN", type = "LT" },
                { name = "ELVIT", type = "LT", altitude_min = 9000 },
                { name = "EKTUB", type = "LT", altitude_min = 8000 },
                { name = "NEXER", type = "LT", altitude_min = 7500 },
                { name = "OTGEL", type = "LT" },
            }
        },
        ["KOZL1C"] = {
            name = "KOZL1C",
            runway = "RW05",
            waypoints = {
                { name = "KOZLU", type = "LT" },
                { name = "EVPAN", type = "LT" },
                { name = "ELVIT", type = "LT", altitude_min = 9000 },
                { name = "EKTUB", type = "LT", altitude_min = 8000 },
                { name = "PELLO", type = "LT", altitude_min = 7500 },
            }
        },
        ["KOZL1J"] = {
            name = "KOZL1J",
            runway = "RW23",
            waypoints = {
                { name = "KOZLU", type = "LT" },
                { name = "EKVOT", type = "LT" },
                { name = "REPGO", type = "LT", altitude_min = 9000 },
                { name = "AY604", type = "LT", altitude_min = 8000 },
                { name = "VEGUT", type = "LT", altitude_min = 6000 },
            }
        },
        ["KOZL1U"] = {
            name = "KOZL1U",
            runway = "ALL",
            waypoints = {
                { name = "KOZLU", type = "LT" },
                { name = "D130J", type = "LT" },
                { name = "CRD", type = "LT" },
            }
        },
        ["PELI1U"] = {
            name = "PELI1U",
            runway = "ALL",
            waypoints = {
                { name = "PELIL", type = "LT" },
                { name = "D078J", type = "LT" },
                { name = "CRD", type = "LT" },
            }
        },
        ["RESL1J"] = {
            name = "RESL1J",
            runway = "RW23",
            waypoints = {
                { name = "RESLI", type = "LT" },
                { name = "AY617", type = "LT", altitude_min = 10500 },
                { name = "AY604", type = "LT", altitude_min = 8000 },
                { name = "VEGUT", type = "LT", altitude_min = 6000 },
            }
        },
        ["TAVA1B"] = {
            name = "TAVA1B",
            runway = "RW05",
            waypoints = {
                { name = "TAVAS", type = "LT" },
                { name = "EKTUB", type = "LT", altitude_min = 8000 },
                { name = "NEXER", type = "LT", altitude_min = 7500 },
                { name = "OTGEL", type = "LT" },
            }
        },
        ["TAVA1C"] = {
            name = "TAVA1C",
            runway = "RW05",
            waypoints = {
                { name = "TAVAS", type = "LT" },
                { name = "PELLO", type = "LT", altitude_min = 7500 },
            }
        },
        ["TAVA1U"] = {
            name = "TAVA1U",
            runway = "ALL",
            waypoints = {
                { name = "TAVAS", type = "LT" },
                { name = "D236J", type = "LT" },
                { name = "CRD", type = "LT" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D05-Y"] = {
            name = "D05-Y",
            type = "A",
            runway = "D05-Y",
            waypoints = {
                { name = "CRD", transition = "CRD1", type = "LT", altitude_min = 8000 },
                { name = "CRD", transition = "CRD1", type = "LT", altitude_min = 7500, speed = 185.0 },
                { name = "D229P", transition = "CRD1", type = "LT", altitude_min = 7500 },
                { name = "OTGEL", transition = "CRD1", type = "LT", altitude_min = 6700 },
                { name = "CRD", transition = "CRD2", type = "LT", altitude_min = 8000 },
                { name = "CRD", transition = "CRD2", type = "LT", altitude_min = 7500, speed = 185.0 },
                { name = "D229P", transition = "CRD2", type = "LT", altitude_min = 7500 },
                { name = "OTGEL", transition = "CRD2", type = "LT", altitude_min = 6700 },
                { name = "OTGEL", transition = "", type = "LT", altitude_min = 6700 },
                { name = "90DME", transition = "", type = "LT", altitude_min = 5780 },
                { name = "65DME", transition = "", type = "LT", altitude_min = 4850 },
                { name = "MA05", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT", altitude_min = 6500 },
                { name = "CRD", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["D23-Z"] = {
            name = "D23-Z",
            type = "A",
            runway = "D23-Z",
            waypoints = {
                { name = "CRD", transition = "CRD", type = "LT", altitude_min = 8000 },
                { name = "CD23", transition = "CRD", type = "LT", altitude_min = 6500 },
                { name = "CD23", transition = "CRD", type = "LT" },
                { name = "CD23", transition = "CRD", type = "LT", altitude_min = 6500, speed = 185.0 },
                { name = "CD23", transition = "", type = "LT", altitude_min = 6500 },
                { name = "FD23", transition = "", type = "LT", altitude_min = 4500 },
                { name = "MD23", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT", altitude_min = 6000 },
                { name = "CRD", transition = "", type = "LT", speed = 220.0 },
                { name = "CRD", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["I23-Y"] = {
            name = "I23-Y",
            type = "I",
            runway = "I23-Y",
            waypoints = {
                { name = "VEGUT", transition = "", type = "LT" },
                { name = "MAZUR", transition = "", type = "LT" },
                { name = "RW23", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 3200 },
                { name = "CRD", transition = "", type = "LT", altitude_min = 6000 },
                { name = "CRD", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["I23-Z"] = {
            name = "I23-Z",
            type = "A",
            runway = "I23-Z",
            waypoints = {
                { name = "CRD", transition = "CRD", type = "LT", altitude_min = 8000 },
                { name = "VEGUT", transition = "CRD", type = "LT", altitude_min = 6500 },
                { name = "VEGUT", transition = "CRD", type = "LT" },
                { name = "CI23", transition = "CRD", type = "LT", altitude_min = 6500, speed = 185.0 },
                { name = "CI23", transition = "", type = "LT" },
                { name = "VEGUT", transition = "", type = "LT" },
                { name = "RW23", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 3200 },
                { name = "CRD", transition = "", type = "LT", altitude_min = 6000 },
                { name = "CRD", transition = "", type = "LT", speed = 220.0 },
                { name = "CRD", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["NDBA"] = {
            name = "NDBA",
            type = "A",
            runway = "NDBA",
            waypoints = {
                { name = "CRD", transition = "CRD", type = "LT", altitude_min = 8000 },
                { name = "D061K", transition = "CRD", type = "LT", altitude_min = 7000 },
                { name = "D061K", transition = "CRD", type = "LT" },
                { name = "FF241", transition = "CRD", type = "LT", altitude_min = 7000, speed = 185.0 },
                { name = "FF241", transition = "", type = "LT", altitude_min = 7000 },
                { name = "CRD", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT", altitude_min = 7000 },
                { name = "CRD", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["Q05-Y"] = {
            name = "Q05-Y",
            type = "A",
            runway = "Q05-Y",
            waypoints = {
                { name = "CRD", transition = "CRD1", type = "LT", altitude_min = 8000 },
                { name = "CRD", transition = "CRD1", type = "LT", altitude_min = 7500, speed = 185.0 },
                { name = "D229P", transition = "CRD1", type = "LT", altitude_min = 7500 },
                { name = "OTGEL", transition = "CRD1", type = "LT", altitude_min = 6700 },
                { name = "CRD", transition = "CRD2", type = "LT", altitude_min = 8000 },
                { name = "CRD", transition = "CRD2", type = "LT", altitude_min = 7500, speed = 185.0 },
                { name = "D229P", transition = "CRD2", type = "LT", altitude_min = 7500 },
                { name = "OTGEL", transition = "CRD2", type = "LT", altitude_min = 6700 },
                { name = "OTGEL", transition = "", type = "LT", altitude_min = 6700 },
                { name = "90DME", transition = "", type = "LT", altitude_min = 5780 },
                { name = "65DME", transition = "", type = "LT", altitude_min = 4850 },
                { name = "MA05", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT", altitude_min = 6500 },
                { name = "CRD", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["Q23-Z"] = {
            name = "Q23-Z",
            type = "A",
            runway = "Q23-Z",
            waypoints = {
                { name = "CRD", transition = "CRD", type = "LT", altitude_min = 8000 },
                { name = "CQ23", transition = "CRD", type = "LT", altitude_min = 6500 },
                { name = "CQ23", transition = "CRD", type = "LT" },
                { name = "CQ23", transition = "CRD", type = "LT", altitude_min = 6500, speed = 185.0 },
                { name = "CQ23", transition = "", type = "LT", altitude_min = 6500 },
                { name = "FQ23", transition = "", type = "LT", altitude_min = 4500 },
                { name = "MQ23", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT", altitude_min = 6000 },
                { name = "CRD", transition = "", type = "LT", speed = 220.0 },
                { name = "CRD", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["R05"] = {
            name = "R05",
            type = "R",
            runway = "R05",
            waypoints = {
                { name = "PELLO", transition = "", type = "LT", altitude_min = 7500 },
                { name = "MEZON", transition = "", type = "LT" },
                { name = "AY612", transition = "", type = "LT", altitude_min = 5590 },
                { name = "AY613", transition = "", type = "LT", altitude_min = 4670 },
                { name = "RW05", transition = "", type = "LT" },
                { name = "AY614", transition = "", type = "LT" },
                { name = "AY615", transition = "", type = "LT", altitude_min = 6000 },
                { name = "AY616", transition = "", type = "LT" },
                { name = "OSGOM", transition = "", type = "LT" },
                { name = "ELVIT", transition = "", type = "LT", altitude_min = 9000 },
                { name = "ELVIT", transition = "", type = "LT", altitude_min = 9000 },
            }
        },
        ["R23"] = {
            name = "R23",
            type = "R",
            runway = "R23",
            waypoints = {
                { name = "VEGUT", transition = "", type = "LT", altitude_min = 6000 },
                { name = "MAZUR", transition = "", type = "LT" },
                { name = "RW23", transition = "", type = "LT" },
                { name = "AY234", transition = "", type = "LT" },
                { name = "AY235", transition = "", type = "LT" },
                { name = "AY236", transition = "", type = "LT" },
                { name = "VAGDA", transition = "", type = "LT", altitude_min = 9000 },
                { name = "VAGDA", transition = "", type = "LT", altitude_min = 9000 },
            }
        },
        ["VORA"] = {
            name = "VORA",
            type = "A",
            runway = "VORA",
            waypoints = {
                { name = "CRD", transition = "CRD", type = "LT", altitude_min = 8000 },
                { name = "D061K", transition = "CRD", type = "LT", altitude_min = 7000 },
                { name = "D061K", transition = "CRD", type = "LT" },
                { name = "FF241", transition = "CRD", type = "LT", altitude_min = 7000, speed = 185.0 },
                { name = "FF241", transition = "", type = "LT", altitude_min = 7000 },
                { name = "CRD", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT", altitude_min = 7000 },
                { name = "CRD", transition = "", type = "LT" },
                { name = "CRD", transition = "", type = "LT", altitude_min = 8000, speed = 230.0 },
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
