local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "URKA",
        Name = "URKA Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["DIBAT"] = { lat = 44.573055556, lon = 37.258333333, type = "ENRT" },
        ["D079O"] = { lat = 45.020036111, lon = 37.031055556, type = "URKA" },
        ["KA009"] = { lat = 44.925527778, lon = 37.059666667, type = "URKA" },
        ["CF03"] = { lat = 9.645591667, lon = 1.039133333, type = "DXNG" },
        ["SORUL"] = { lat = 45.383055556, lon = 37.348333333, type = "ENRT" },
        ["KA014"] = { lat = 44.952444444, lon = 37.283722222, type = "URKA" },
        ["KA017"] = { lat = 45.093027778, lon = 37.383027778, type = "URKA" },
        ["D122L"] = { lat = 45.106975, lon = 37.066325, type = "URKA" },
        ["PALER"] = { lat = 45.153333333, lon = 36.545, type = "ENRT" },
        ["KA008"] = { lat = 44.791444444, lon = 37.267916667, type = "URKA" },
        ["KA024"] = { lat = 45.047638889, lon = 37.036583333, type = "URKA" },
        ["P"] = { lat = 40.9961, lon = 13.589302778, type = "LIRM" },
        ["FF03"] = { lat = 9.676416667, lon = 1.052327778, type = "DXNG" },
        ["KA019"] = { lat = 44.879777778, lon = 37.190972222, type = "URKA" },
        ["KA021"] = { lat = 45.176111111, lon = 37.145944444, type = "URKA" },
        ["ARNAD"] = { lat = 45.35, lon = 36.646666667, type = "ENRT" },
        ["KA018"] = { lat = 45.183916667, lon = 37.273833333, type = "URKA" },
        ["N"] = { lat = 11.707583333, lon = 43.332972222, type = "HDAM" },
        ["FF21"] = { lat = 4.949455556, lon = 8.131291667, type = "DNAI" },
        ["25THR"] = { lat = 7.318433333, lon = -7.565622222, type = "DIMN" },
        ["KA023"] = { lat = 45.055888889, lon = 37.039194444, type = "URKA" },
        ["GAMAN"] = { lat = 45.0, lon = 36.591666667, type = "ENRT" },
        ["D101L"] = { lat = 50.164527778, lon = 14.695727778, type = "LKVO" },
        ["AGIDA"] = { lat = 45.011388889, lon = 37.878333333, type = "ENRT" },
        ["FN03"] = { lat = 4.811558333, lon = -1.823338889, type = "DGTK" },
        ["D086L"] = { lat = 46.415294444, lon = -79.157166667, type = "CYYB" },
        ["TUNOT"] = { lat = 44.716388889, lon = 37.398333333, type = "ENRT" },
        ["KA010"] = { lat = 45.099805556, lon = 37.127638889, type = "URKA" },
        ["KA013"] = { lat = 45.064333333, lon = 37.236694444, type = "URKA" },
        ["CF21"] = { lat = 5.015686111, lon = 8.163508333, type = "DNAI" },
        ["D113O"] = { lat = -4.491788889, lon = 15.652575, type = "FZAA" },
        ["KA006"] = { lat = 44.931083333, lon = 37.256416667, type = "URKA" },
        ["KA001"] = { lat = 45.071722222, lon = 37.436666667, type = "URKA" },
        ["KA005"] = { lat = 45.077972222, lon = 37.635694444, type = "URKA" },
        ["FN21"] = { lat = 5.014616667, lon = -1.706452778, type = "DGTK" },
        ["D093O"] = { lat = 45.083330556, lon = 37.051227778, type = "URKA" },
        ["DER21"] = { lat = 53.679922222, lon = 127.087197222, type = "UHBE" },
        ["TIBET"] = { lat = -1.350916667, lon = 36.374, type = "HKJK" },
        ["NALUD"] = { lat = 44.479722222, lon = 37.403611111, type = "ENRT" },
        ["KA003"] = { lat = 45.212722222, lon = 37.427194444, type = "URKA" },
        ["KA002"] = { lat = 45.145388889, lon = 37.531555556, type = "URKA" },
        ["KA022"] = { lat = 45.1165, lon = 37.073916667, type = "URKA" },
        ["KA011"] = { lat = 45.056166667, lon = 37.387416667, type = "URKA" },
        ["KA012"] = { lat = 44.865027778, lon = 37.532277778, type = "URKA" },
        ["KA026"] = { lat = 45.068888889, lon = 36.997777778, type = "URKA" },
        ["RUDOL"] = { lat = 3.996666667, lon = 37.418333333, type = "ENRT" },
        ["KA016"] = { lat = 59.068527778, lon = 22.734194444, type = "EEKA" },
        ["KA027"] = { lat = 45.08775, lon = 37.45725, type = "URKA" },
        ["KA015"] = { lat = 45.102694444, lon = 37.285444444, type = "URKA" },
        ["KA007"] = { lat = 44.858527778, lon = 37.163916667, type = "URKA" },
        ["DER03"] = { lat = 53.696611111, lon = 127.095133333, type = "UHBE" },
        ["KA004"] = { lat = 45.219111111, lon = 37.626888889, type = "URKA" },
        ["KA020"] = { lat = 44.919444444, lon = 37.113333333, type = "URKA" },
    },

    -- Данные ВПП
    Runways = {
        ["RW03"] = {
            heading = 30,
            length = 0,
            width = 0,
            threshold = { lat = 44.99378611111111, lon = 37.336622222222225 },
            end = { lat = 44.99378611111111, lon = 37.336622222222225 }
        },
        ["RW21"] = {
            heading = 210,
            length = 0,
            width = 0,
            threshold = { lat = 45.01043888888889, lon = 37.35796111111111 },
            end = { lat = 45.01043888888889, lon = 37.35796111111111 }
        },
    },

    -- Процедуры SID
    SID = {
        ["AGID2C"] = {
            name = "AGID2C",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "", type = "" },
                { name = "AGIDA", type = "E", altitude_min = 6000 },
            }
        },
        ["AGID2D"] = {
            name = "AGID2D",
            runway = "RW21",
            waypoints = {
                { name = "DER21", type = "P" },
                { name = "", type = "", altitude_min = 1800 },
                { name = "AP", type = "D", speed = 215.0 },
                { name = "AGIDA", type = "E", altitude_min = 6000 },
            }
        },
        ["AGID2E"] = {
            name = "AGID2E",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "AGIDA", type = "E", altitude_min = 6000 },
            }
        },
        ["AGID2F"] = {
            name = "AGID2F",
            runway = "RW21",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA014", type = "P", speed = 260.0 },
                { name = "KA017", type = "P" },
                { name = "AGIDA", type = "E", altitude_min = 6000 },
            }
        },
        ["ARNA2C"] = {
            name = "ARNA2C",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "AN", type = "D", speed = 215.0 },
                { name = "D122L", type = "P", altitude_min = 5000 },
                { name = "ARNAD", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["ARNA2D"] = {
            name = "ARNA2D",
            runway = "RW21",
            waypoints = {
                { name = "DER21", type = "P" },
                { name = "", type = "", altitude_min = 1800 },
                { name = "", type = "" },
                { name = "D113O", type = "P", altitude_min = 5000 },
                { name = "ARNAD", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["ARNA2E"] = {
            name = "ARNA2E",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "KA021", type = "P", altitude_min = 5000, altitude_max = 6000, speed = 260.0 },
                { name = "ARNAD", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["ARNA2F"] = {
            name = "ARNA2F",
            runway = "RW21",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA014", type = "P", speed = 260.0 },
                { name = "KA024", type = "P", altitude_min = 5000, altitude_max = 6000 },
                { name = "ARNAD", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["ARNA2Z"] = {
            name = "ARNA2Z",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "AN", type = "D", speed = 215.0 },
                { name = "D122L", type = "P", altitude_min = 5000 },
                { name = "ARNAD", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["DIBA2C"] = {
            name = "DIBA2C",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "AN", type = "D", speed = 215.0 },
                { name = "DIBAT", type = "E", altitude_min = 5000 },
            }
        },
        ["DIBA2D"] = {
            name = "DIBA2D",
            runway = "RW21",
            waypoints = {
                { name = "DER21", type = "P" },
                { name = "", type = "", altitude_min = 1800 },
                { name = "AP", type = "D", speed = 215.0 },
                { name = "", type = "" },
                { name = "DIBAT", type = "E", altitude_min = 5000 },
            }
        },
        ["DIBA2E"] = {
            name = "DIBA2E",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "KA020", type = "P" },
                { name = "DIBAT", type = "E", altitude_min = 5000 },
            }
        },
        ["DIBA2F"] = {
            name = "DIBA2F",
            runway = "RW21",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA019", type = "P" },
                { name = "DIBAT", type = "E", altitude_min = 5000 },
            }
        },
        ["DIBA2Y"] = {
            name = "DIBA2Y",
            runway = "RW03",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA027", type = "P", speed = 260.0 },
                { name = "TUNOT", type = "E", altitude_min = 5000 },
                { name = "DIBAT", type = "E", altitude_min = 5000 },
            }
        },
        ["GAMA2C"] = {
            name = "GAMA2C",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "AN", type = "D", speed = 215.0 },
                { name = "D086L", type = "P", altitude_min = 5000 },
                { name = "GAMAN", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["GAMA2D"] = {
            name = "GAMA2D",
            runway = "RW21",
            waypoints = {
                { name = "DER21", type = "P" },
                { name = "", type = "", altitude_min = 1800 },
                { name = "", type = "" },
                { name = "D079O", type = "P", altitude_min = 5000 },
                { name = "GAMAN", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["GAMA2E"] = {
            name = "GAMA2E",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "KA023", type = "P", altitude_min = 5000, altitude_max = 6000 },
                { name = "GAMAN", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["GAMA2F"] = {
            name = "GAMA2F",
            runway = "RW21",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA014", type = "P", speed = 260.0 },
                { name = "KA016", type = "P", altitude_min = 5000, altitude_max = 6000 },
                { name = "GAMAN", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["GAMA2Z"] = {
            name = "GAMA2Z",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "AN", type = "D", speed = 215.0 },
                { name = "D086L", type = "P", altitude_min = 5000 },
                { name = "GAMAN", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["NALU2C"] = {
            name = "NALU2C",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "AN", type = "D", speed = 215.0 },
                { name = "NALUD", type = "E", altitude_min = 6000 },
            }
        },
        ["NALU2D"] = {
            name = "NALU2D",
            runway = "RW21",
            waypoints = {
                { name = "DER21", type = "P" },
                { name = "", type = "", altitude_min = 1800 },
                { name = "AP", type = "D", speed = 215.0 },
                { name = "", type = "" },
                { name = "NALUD", type = "E", altitude_min = 6000 },
            }
        },
        ["NALU2E"] = {
            name = "NALU2E",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "KA020", type = "P" },
                { name = "NALUD", type = "E", altitude_min = 6000 },
            }
        },
        ["NALU2F"] = {
            name = "NALU2F",
            runway = "RW21",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA019", type = "P" },
                { name = "NALUD", type = "E", altitude_min = 6000 },
            }
        },
        ["NALU2Y"] = {
            name = "NALU2Y",
            runway = "RW03",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA027", type = "P", speed = 260.0 },
                { name = "TUNOT", type = "E", altitude_min = 5000 },
                { name = "NALUD", type = "E", altitude_min = 6000 },
            }
        },
        ["PALE2C"] = {
            name = "PALE2C",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "AN", type = "D", speed = 215.0 },
                { name = "D101L", type = "P", altitude_min = 5000 },
                { name = "PALER", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["PALE2D"] = {
            name = "PALE2D",
            runway = "RW21",
            waypoints = {
                { name = "DER21", type = "P" },
                { name = "", type = "", altitude_min = 1800 },
                { name = "", type = "" },
                { name = "D093O", type = "P", altitude_min = 5000 },
                { name = "PALER", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["PALE2E"] = {
            name = "PALE2E",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "KA022", type = "P", altitude_min = 5000, altitude_max = 6000 },
                { name = "PALER", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["PALE2F"] = {
            name = "PALE2F",
            runway = "RW21",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA014", type = "P", speed = 260.0 },
                { name = "KA024", type = "P", altitude_min = 5000, altitude_max = 6000 },
                { name = "PALER", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["PALE2Z"] = {
            name = "PALE2Z",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "AN", type = "D", speed = 215.0 },
                { name = "D101L", type = "P", altitude_min = 5000 },
                { name = "PALER", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["RUDO2C"] = {
            name = "RUDO2C",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "RUDOL", type = "E", altitude_min = 5000 },
            }
        },
        ["RUDO2D"] = {
            name = "RUDO2D",
            runway = "RW21",
            waypoints = {
                { name = "DER21", type = "P" },
                { name = "", type = "", altitude_min = 1800 },
                { name = "AP", type = "D", speed = 215.0 },
                { name = "RUDOL", type = "E", altitude_min = 5000 },
            }
        },
        ["RUDO2E"] = {
            name = "RUDO2E",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "RUDOL", type = "E", altitude_min = 5000 },
            }
        },
        ["RUDO2F"] = {
            name = "RUDO2F",
            runway = "RW21",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA014", type = "P", speed = 260.0 },
                { name = "KA017", type = "P" },
                { name = "RUDOL", type = "E", altitude_min = 5000 },
            }
        },
        ["SORU2C"] = {
            name = "SORU2C",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "", type = "" },
                { name = "SORUL", type = "E", altitude_min = 5000 },
            }
        },
        ["SORU2D"] = {
            name = "SORU2D",
            runway = "RW21",
            waypoints = {
                { name = "DER21", type = "P" },
                { name = "", type = "", altitude_min = 1800 },
                { name = "AP", type = "D", speed = 215.0 },
                { name = "", type = "" },
                { name = "SORUL", type = "E", altitude_min = 5000 },
            }
        },
        ["SORU2E"] = {
            name = "SORU2E",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "SORUL", type = "E", altitude_min = 5000 },
            }
        },
        ["SORU2F"] = {
            name = "SORU2F",
            runway = "RW21",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA014", type = "P" },
                { name = "KA018", type = "P" },
                { name = "SORUL", type = "E", altitude_min = 5000 },
            }
        },
        ["TIBE2C"] = {
            name = "TIBE2C",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 700 },
                { name = "", type = "" },
                { name = "TIBET", type = "E", altitude_min = 6000 },
            }
        },
        ["TIBE2D"] = {
            name = "TIBE2D",
            runway = "RW21",
            waypoints = {
                { name = "DER21", type = "P" },
                { name = "", type = "", altitude_min = 1800 },
                { name = "AP", type = "D", speed = 215.0 },
                { name = "", type = "" },
                { name = "TIBET", type = "E", altitude_min = 6000 },
            }
        },
        ["TIBE2E"] = {
            name = "TIBE2E",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "TIBET", type = "E", altitude_min = 6000 },
            }
        },
        ["TIBE2F"] = {
            name = "TIBE2F",
            runway = "RW21",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA014", type = "P" },
                { name = "TIBET", type = "E", altitude_min = 6000 },
            }
        },
        ["TUNO2C"] = {
            name = "TUNO2C",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "AN", type = "D", speed = 215.0 },
                { name = "TUNOT", type = "E", altitude_min = 5000 },
            }
        },
        ["TUNO2D"] = {
            name = "TUNO2D",
            runway = "RW21",
            waypoints = {
                { name = "DER21", type = "P" },
                { name = "", type = "", altitude_min = 1800 },
                { name = "AP", type = "D", speed = 215.0 },
                { name = "", type = "" },
                { name = "TUNOT", type = "E", altitude_min = 5000 },
            }
        },
        ["TUNO2E"] = {
            name = "TUNO2E",
            runway = "RW03",
            waypoints = {
                { name = "DER03", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "KA020", type = "P", speed = 215.0 },
                { name = "TUNOT", type = "E", altitude_min = 5000 },
            }
        },
        ["TUNO2F"] = {
            name = "TUNO2F",
            runway = "RW21",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA019", type = "P", speed = 215.0 },
                { name = "TUNOT", type = "E", altitude_min = 5000 },
            }
        },
        ["TUNO2Y"] = {
            name = "TUNO2Y",
            runway = "RW03",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "KA027", type = "P", speed = 260.0 },
                { name = "TUNOT", type = "E", altitude_min = 5000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["AGID2A"] = {
            name = "AGID2A",
            runway = "RW03",
            waypoints = {
                { name = "AGIDA", type = "UR", altitude_min = 6000 },
                { name = "KA011", type = "UR" },
                { name = "KA009", type = "UR", altitude_min = 4000 },
            }
        },
        ["AGID2B"] = {
            name = "AGID2B",
            runway = "RW21",
            waypoints = {
                { name = "AGIDA", type = "UR", altitude_min = 6000 },
                { name = "KA005", type = "UR", altitude_min = 4000 },
            }
        },
        ["AGID2G"] = {
            name = "AGID2G",
            runway = "RW03",
            waypoints = {
                { name = "AGIDA", type = "UR", altitude_min = 6000 },
                { name = "AN", type = "UR", altitude_min = 5000 },
            }
        },
        ["AGID2H"] = {
            name = "AGID2H",
            runway = "RW03",
            waypoints = {
                { name = "AGIDA", type = "UR", altitude_min = 6000 },
                { name = "N", type = "UR", altitude_min = 5000 },
            }
        },
        ["AGID2J"] = {
            name = "AGID2J",
            runway = "RW21",
            waypoints = {
                { name = "AGIDA", type = "UR", altitude_min = 6000 },
                { name = "AP", type = "UR", altitude_min = 5000 },
            }
        },
        ["AGID2K"] = {
            name = "AGID2K",
            runway = "RW21",
            waypoints = {
                { name = "AGIDA", type = "UR", altitude_min = 6000 },
                { name = "P", type = "UR", altitude_min = 5000 },
            }
        },
        ["ARNA2A"] = {
            name = "ARNA2A",
            runway = "RW03",
            waypoints = {
                { name = "ARNAD", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "KA026", type = "UR", altitude_min = 5000, altitude_max = 7000 },
                { name = "KA009", type = "UR", altitude_min = 4000 },
            }
        },
        ["ARNA2B"] = {
            name = "ARNA2B",
            runway = "RW21",
            waypoints = {
                { name = "ARNAD", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "TIBET", type = "UR", altitude_min = 6000 },
                { name = "KA003", type = "UR", altitude_min = 4000 },
            }
        },
        ["ARNA2G"] = {
            name = "ARNA2G",
            runway = "RW03",
            waypoints = {
                { name = "ARNAD", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "AN", type = "UR", altitude_min = 5000 },
            }
        },
        ["ARNA2H"] = {
            name = "ARNA2H",
            runway = "RW03",
            waypoints = {
                { name = "ARNAD", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "N", type = "UR", altitude_min = 5000 },
            }
        },
        ["ARNA2J"] = {
            name = "ARNA2J",
            runway = "RW21",
            waypoints = {
                { name = "ARNAD", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "AP", type = "UR", altitude_min = 5000 },
            }
        },
        ["ARNA2K"] = {
            name = "ARNA2K",
            runway = "RW21",
            waypoints = {
                { name = "ARNAD", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "P", type = "UR", altitude_min = 5000 },
            }
        },
        ["DIBA2A"] = {
            name = "DIBA2A",
            runway = "RW03",
            waypoints = {
                { name = "DIBAT", type = "UR", altitude_min = 5000 },
                { name = "KA008", type = "UR", altitude_min = 4000 },
            }
        },
        ["DIBA2B"] = {
            name = "DIBA2B",
            runway = "RW21",
            waypoints = {
                { name = "DIBAT", type = "UR", altitude_min = 5000 },
                { name = "TUNOT", type = "UR", altitude_min = 5000 },
                { name = "KA012", type = "UR" },
                { name = "KA005", type = "UR", altitude_min = 4000 },
            }
        },
        ["DIBA2G"] = {
            name = "DIBA2G",
            runway = "RW03",
            waypoints = {
                { name = "DIBAT", type = "UR", altitude_min = 5000 },
                { name = "AN", type = "UR", altitude_min = 5000 },
            }
        },
        ["DIBA2H"] = {
            name = "DIBA2H",
            runway = "RW03",
            waypoints = {
                { name = "DIBAT", type = "UR", altitude_min = 5000 },
                { name = "N", type = "UR", altitude_min = 5000 },
            }
        },
        ["DIBA2J"] = {
            name = "DIBA2J",
            runway = "RW21",
            waypoints = {
                { name = "DIBAT", type = "UR", altitude_min = 5000 },
                { name = "AP", type = "UR", altitude_min = 5000 },
            }
        },
        ["DIBA2K"] = {
            name = "DIBA2K",
            runway = "RW21",
            waypoints = {
                { name = "DIBAT", type = "UR", altitude_min = 5000 },
                { name = "P", type = "UR", altitude_min = 5000 },
            }
        },
        ["GAMA2A"] = {
            name = "GAMA2A",
            runway = "RW03",
            waypoints = {
                { name = "GAMAN", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "KA026", type = "UR", altitude_min = 5000, altitude_max = 7000 },
                { name = "KA009", type = "UR", altitude_min = 4000 },
            }
        },
        ["GAMA2B"] = {
            name = "GAMA2B",
            runway = "RW21",
            waypoints = {
                { name = "GAMAN", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "KA026", type = "UR", altitude_min = 5000, altitude_max = 7000 },
                { name = "KA003", type = "UR", altitude_min = 4000 },
            }
        },
        ["GAMA2G"] = {
            name = "GAMA2G",
            runway = "RW03",
            waypoints = {
                { name = "GAMAN", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "AN", type = "UR", altitude_min = 5000 },
            }
        },
        ["GAMA2H"] = {
            name = "GAMA2H",
            runway = "RW03",
            waypoints = {
                { name = "GAMAN", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "N", type = "UR", altitude_min = 5000 },
            }
        },
        ["GAMA2J"] = {
            name = "GAMA2J",
            runway = "RW21",
            waypoints = {
                { name = "GAMAN", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "AP", type = "UR", altitude_min = 5000 },
            }
        },
        ["GAMA2K"] = {
            name = "GAMA2K",
            runway = "RW21",
            waypoints = {
                { name = "GAMAN", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "P", type = "UR", altitude_min = 5000 },
            }
        },
        ["NALU2A"] = {
            name = "NALU2A",
            runway = "RW03",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 6000 },
                { name = "KA008", type = "UR", altitude_min = 4000 },
            }
        },
        ["NALU2B"] = {
            name = "NALU2B",
            runway = "RW21",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 6000 },
                { name = "TUNOT", type = "UR", altitude_min = 5000 },
                { name = "KA012", type = "UR" },
                { name = "KA005", type = "UR", altitude_min = 4000 },
            }
        },
        ["NALU2G"] = {
            name = "NALU2G",
            runway = "RW03",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 6000 },
                { name = "AN", type = "UR", altitude_min = 5000 },
            }
        },
        ["NALU2H"] = {
            name = "NALU2H",
            runway = "RW03",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 6000 },
                { name = "N", type = "UR", altitude_min = 5000 },
            }
        },
        ["NALU2J"] = {
            name = "NALU2J",
            runway = "RW21",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 6000 },
                { name = "AP", type = "UR", altitude_min = 5000 },
            }
        },
        ["NALU2K"] = {
            name = "NALU2K",
            runway = "RW21",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 6000 },
                { name = "P", type = "UR", altitude_min = 5000 },
            }
        },
        ["PALE2A"] = {
            name = "PALE2A",
            runway = "RW03",
            waypoints = {
                { name = "PALER", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "KA026", type = "UR", altitude_min = 5000, altitude_max = 7000 },
                { name = "KA009", type = "UR", altitude_min = 4000 },
            }
        },
        ["PALE2B"] = {
            name = "PALE2B",
            runway = "RW21",
            waypoints = {
                { name = "PALER", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "KA026", type = "UR", altitude_min = 5000, altitude_max = 7000 },
                { name = "KA003", type = "UR", altitude_min = 4000 },
            }
        },
        ["PALE2G"] = {
            name = "PALE2G",
            runway = "RW03",
            waypoints = {
                { name = "PALER", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "AN", type = "UR", altitude_min = 5000 },
            }
        },
        ["PALE2H"] = {
            name = "PALE2H",
            runway = "RW03",
            waypoints = {
                { name = "PALER", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "N", type = "UR", altitude_min = 5000 },
            }
        },
        ["PALE2J"] = {
            name = "PALE2J",
            runway = "RW21",
            waypoints = {
                { name = "PALER", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "AP", type = "UR", altitude_min = 5000 },
            }
        },
        ["PALE2K"] = {
            name = "PALE2K",
            runway = "RW21",
            waypoints = {
                { name = "PALER", type = "UK", altitude_min = 7000, altitude_max = 9000 },
                { name = "P", type = "UR", altitude_min = 5000 },
            }
        },
        ["RUDO2A"] = {
            name = "RUDO2A",
            runway = "RW03",
            waypoints = {
                { name = "RUDOL", type = "UR", altitude_min = 5000 },
                { name = "KA011", type = "UR" },
                { name = "KA009", type = "UR", altitude_min = 4000 },
            }
        },
        ["RUDO2B"] = {
            name = "RUDO2B",
            runway = "RW21",
            waypoints = {
                { name = "RUDOL", type = "UR", altitude_min = 5000 },
                { name = "KA004", type = "UR", altitude_min = 4000 },
            }
        },
        ["RUDO2G"] = {
            name = "RUDO2G",
            runway = "RW03",
            waypoints = {
                { name = "RUDOL", type = "UR", altitude_min = 5000 },
                { name = "AN", type = "UR", altitude_min = 5000 },
            }
        },
        ["RUDO2H"] = {
            name = "RUDO2H",
            runway = "RW03",
            waypoints = {
                { name = "RUDOL", type = "UR", altitude_min = 5000 },
                { name = "N", type = "UR", altitude_min = 5000 },
            }
        },
        ["RUDO2J"] = {
            name = "RUDO2J",
            runway = "RW21",
            waypoints = {
                { name = "RUDOL", type = "UR", altitude_min = 5000 },
                { name = "AP", type = "UR", altitude_min = 5000 },
            }
        },
        ["RUDO2K"] = {
            name = "RUDO2K",
            runway = "RW21",
            waypoints = {
                { name = "RUDOL", type = "UR", altitude_min = 5000 },
                { name = "P", type = "UR", altitude_min = 5000 },
            }
        },
        ["SORU2A"] = {
            name = "SORU2A",
            runway = "RW03",
            waypoints = {
                { name = "SORUL", type = "UR", altitude_min = 5000 },
                { name = "KA010", type = "UR" },
                { name = "KA009", type = "UR", altitude_min = 4000 },
            }
        },
        ["SORU2B"] = {
            name = "SORU2B",
            runway = "RW21",
            waypoints = {
                { name = "SORUL", type = "UR", altitude_min = 5000 },
                { name = "KA003", type = "UR", altitude_min = 4000 },
            }
        },
        ["SORU2G"] = {
            name = "SORU2G",
            runway = "RW03",
            waypoints = {
                { name = "SORUL", type = "UR", altitude_min = 5000 },
                { name = "AN", type = "UR", altitude_min = 5000 },
            }
        },
        ["SORU2H"] = {
            name = "SORU2H",
            runway = "RW03",
            waypoints = {
                { name = "SORUL", type = "UR", altitude_min = 5000 },
                { name = "N", type = "UR", altitude_min = 5000 },
            }
        },
        ["SORU2J"] = {
            name = "SORU2J",
            runway = "RW21",
            waypoints = {
                { name = "SORUL", type = "UR", altitude_min = 5000 },
                { name = "AP", type = "UR", altitude_min = 5000 },
            }
        },
        ["SORU2K"] = {
            name = "SORU2K",
            runway = "RW21",
            waypoints = {
                { name = "SORUL", type = "UR", altitude_min = 5000 },
                { name = "P", type = "UR", altitude_min = 5000 },
            }
        },
        ["TIBE2A"] = {
            name = "TIBE2A",
            runway = "RW03",
            waypoints = {
                { name = "TIBET", type = "UR", altitude_min = 6000 },
                { name = "KA010", type = "UR" },
                { name = "KA009", type = "UR", altitude_min = 4000 },
            }
        },
        ["TIBE2B"] = {
            name = "TIBE2B",
            runway = "RW21",
            waypoints = {
                { name = "TIBET", type = "UR", altitude_min = 6000 },
                { name = "KA003", type = "UR", altitude_min = 4000 },
            }
        },
        ["TIBE2G"] = {
            name = "TIBE2G",
            runway = "RW03",
            waypoints = {
                { name = "TIBET", type = "UR", altitude_min = 6000 },
                { name = "AN", type = "UR", altitude_min = 5000 },
            }
        },
        ["TIBE2H"] = {
            name = "TIBE2H",
            runway = "RW03",
            waypoints = {
                { name = "TIBET", type = "UR", altitude_min = 6000 },
                { name = "N", type = "UR", altitude_min = 5000 },
            }
        },
        ["TIBE2J"] = {
            name = "TIBE2J",
            runway = "RW21",
            waypoints = {
                { name = "TIBET", type = "UR", altitude_min = 6000 },
                { name = "AP", type = "UR", altitude_min = 5000 },
            }
        },
        ["TIBE2K"] = {
            name = "TIBE2K",
            runway = "RW21",
            waypoints = {
                { name = "TIBET", type = "UR", altitude_min = 6000 },
                { name = "P", type = "UR", altitude_min = 5000 },
            }
        },
        ["TUNO2A"] = {
            name = "TUNO2A",
            runway = "RW03",
            waypoints = {
                { name = "TUNOT", type = "UR", altitude_min = 5000 },
                { name = "KA008", type = "UR", altitude_min = 4000 },
            }
        },
        ["TUNO2B"] = {
            name = "TUNO2B",
            runway = "RW21",
            waypoints = {
                { name = "TUNOT", type = "UR", altitude_min = 5000 },
                { name = "KA012", type = "UR" },
                { name = "KA005", type = "UR", altitude_min = 4000 },
            }
        },
        ["TUNO2G"] = {
            name = "TUNO2G",
            runway = "RW03",
            waypoints = {
                { name = "TUNOT", type = "UR", altitude_min = 5000 },
                { name = "AN", type = "UR", altitude_min = 5000 },
            }
        },
        ["TUNO2H"] = {
            name = "TUNO2H",
            runway = "RW03",
            waypoints = {
                { name = "TUNOT", type = "UR", altitude_min = 5000 },
                { name = "N", type = "UR", altitude_min = 5000 },
            }
        },
        ["TUNO2J"] = {
            name = "TUNO2J",
            runway = "RW21",
            waypoints = {
                { name = "TUNOT", type = "UR", altitude_min = 5000 },
                { name = "AP", type = "UR", altitude_min = 5000 },
            }
        },
        ["TUNO2K"] = {
            name = "TUNO2K",
            runway = "RW21",
            waypoints = {
                { name = "TUNOT", type = "UR", altitude_min = 5000 },
                { name = "P", type = "UR", altitude_min = 5000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I03-Y"] = {
            name = "I03-Y",
            type = "I",
            runway = "I03-Y",
            waypoints = {
                { name = "CF03", transition = "", type = "UR" },
                { name = "FF03", transition = "", type = "UR" },
                { name = "RW03", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1200, speed = 260.0 },
                { name = "AN", transition = "", type = "UR", altitude_min = 2200 },
            }
        },
        ["I03-Z"] = {
            name = "I03-Z",
            type = "A",
            runway = "I03-Z",
            waypoints = {
                { name = "KA008", transition = "KA008", type = "UR", altitude_min = 4000 },
                { name = "KA007", transition = "KA008", type = "UR", altitude_min = 2500 },
                { name = "KA009", transition = "KA009", type = "UR", altitude_min = 4000 },
                { name = "KA007", transition = "KA009", type = "UR", altitude_min = 2500 },
                { name = "KA007", transition = "", type = "UR" },
                { name = "FF03", transition = "", type = "UR" },
                { name = "RW03", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "KA013", transition = "", type = "UR", speed = 205.0 },
                { name = "KA009", transition = "", type = "UR", altitude_min = 4000 },
            }
        },
        ["I21-Y"] = {
            name = "I21-Y",
            type = "I",
            runway = "I21-Y",
            waypoints = {
                { name = "CF21", transition = "", type = "UR" },
                { name = "FF21", transition = "", type = "UR" },
                { name = "RW21", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1500, speed = 240.0 },
                { name = "AP", transition = "", type = "UR", altitude_min = 2100 },
            }
        },
        ["I21-Z"] = {
            name = "I21-Z",
            type = "A",
            runway = "I21-Z",
            waypoints = {
                { name = "KA003", transition = "KA003", type = "UR", altitude_min = 4000 },
                { name = "KA002", transition = "KA003", type = "UR", altitude_min = 2500 },
                { name = "KA004", transition = "KA004", type = "UR", altitude_min = 4000 },
                { name = "KA002", transition = "KA004", type = "UR", altitude_min = 2500 },
                { name = "KA005", transition = "KA005", type = "UR", altitude_min = 4000 },
                { name = "KA002", transition = "KA005", type = "UR", altitude_min = 2500 },
                { name = "KA002", transition = "", type = "UR" },
                { name = "FF21", transition = "", type = "UR" },
                { name = "RW21", transition = "", type = "UR" },
                { name = "KA014", transition = "", type = "UR", speed = 210.0 },
                { name = "KA015", transition = "", type = "UR" },
                { name = "KA003", transition = "", type = "UR", altitude_min = 4000 },
            }
        },
        ["J03"] = {
            name = "J03",
            type = "A",
            runway = "J03",
            waypoints = {
                { name = "KA008", transition = "KA008", type = "UR", altitude_min = 4000 },
                { name = "KA007", transition = "KA008", type = "UR", altitude_min = 2500 },
                { name = "KA009", transition = "KA009", type = "UR", altitude_min = 4000 },
                { name = "KA007", transition = "KA009", type = "UR", altitude_min = 2500 },
                { name = "KA007", transition = "", type = "UR" },
                { name = "KA006", transition = "", type = "UR" },
                { name = "RW03", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "KA013", transition = "", type = "UR", speed = 205.0 },
                { name = "KA009", transition = "", type = "UR", altitude_min = 4000 },
            }
        },
        ["J21"] = {
            name = "J21",
            type = "A",
            runway = "J21",
            waypoints = {
                { name = "KA003", transition = "KA003", type = "UR", altitude_min = 4000 },
                { name = "KA002", transition = "KA003", type = "UR", altitude_min = 2500 },
                { name = "KA004", transition = "KA004", type = "UR", altitude_min = 4000 },
                { name = "KA002", transition = "KA004", type = "UR", altitude_min = 2500 },
                { name = "KA005", transition = "KA005", type = "UR", altitude_min = 4000 },
                { name = "KA002", transition = "KA005", type = "UR", altitude_min = 2500 },
                { name = "KA002", transition = "", type = "UR" },
                { name = "KA001", transition = "", type = "UR" },
                { name = "RW21", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 580 },
                { name = "KA014", transition = "", type = "UR", speed = 210.0 },
                { name = "KA015", transition = "", type = "UR" },
                { name = "KA003", transition = "", type = "UR", altitude_min = 4000 },
            }
        },
        ["N03-A"] = {
            name = "N03-A",
            type = "N",
            runway = "N03-A",
            waypoints = {
                { name = "FN03", transition = "", type = "UR", altitude_min = 2200 },
                { name = "AN", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "AN", transition = "", type = "UR", altitude_min = 2200 },
            }
        },
        ["N03-X"] = {
            name = "N03-X",
            type = "N",
            runway = "N03-X",
            waypoints = {
                { name = "FF03", transition = "", type = "UR" },
                { name = "RW03", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "AN", transition = "", type = "UR", altitude_min = 2200 },
            }
        },
        ["N03-Y"] = {
            name = "N03-Y",
            type = "N",
            runway = "N03-Y",
            waypoints = {
                { name = "FN03", transition = "", type = "UR", altitude_min = 2200 },
                { name = "N", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "N", transition = "", type = "UR", altitude_min = 2300 },
            }
        },
        ["N03-Z"] = {
            name = "N03-Z",
            type = "N",
            runway = "N03-Z",
            waypoints = {
                { name = "FF03", transition = "", type = "UR" },
                { name = "N", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "N", transition = "", type = "UR", altitude_min = 2300 },
            }
        },
        ["N21-B"] = {
            name = "N21-B",
            type = "N",
            runway = "N21-B",
            waypoints = {
                { name = "FN21", transition = "", type = "UR", altitude_min = 2100 },
                { name = "AP", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "AP", transition = "", type = "UR", altitude_min = 2100 },
            }
        },
        ["N21-X"] = {
            name = "N21-X",
            type = "N",
            runway = "N21-X",
            waypoints = {
                { name = "FN21", transition = "", type = "UR", altitude_min = 2100 },
                { name = "P", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "P", transition = "", type = "UR", altitude_min = 2200 },
            }
        },
        ["N21-Y"] = {
            name = "N21-Y",
            type = "N",
            runway = "N21-Y",
            waypoints = {
                { name = "FF21", transition = "", type = "UR" },
                { name = "P", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1500, speed = 260.0 },
                { name = "P", transition = "", type = "UR", altitude_min = 2200 },
            }
        },
        ["N21-Z"] = {
            name = "N21-Z",
            type = "N",
            runway = "N21-Z",
            waypoints = {
                { name = "FF21", transition = "", type = "UR" },
                { name = "AP", transition = "", type = "UR" },
                { name = "RW21", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1500, speed = 220.0 },
                { name = "AP", transition = "", type = "UR", altitude_min = 2100 },
            }
        },
        ["R03"] = {
            name = "R03",
            type = "A",
            runway = "R03",
            waypoints = {
                { name = "KA008", transition = "KA008", type = "UR", altitude_min = 4000 },
                { name = "KA007", transition = "KA008", type = "UR", altitude_min = 2500 },
                { name = "KA009", transition = "KA009", type = "UR", altitude_min = 4000 },
                { name = "KA007", transition = "KA009", type = "UR", altitude_min = 2500 },
                { name = "KA007", transition = "", type = "UR", altitude_min = 2500 },
                { name = "KA006", transition = "", type = "UR" },
                { name = "RW03", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "KA013", transition = "", type = "UR", speed = 205.0 },
                { name = "KA009", transition = "", type = "UR", altitude_min = 4000 },
            }
        },
        ["R21"] = {
            name = "R21",
            type = "A",
            runway = "R21",
            waypoints = {
                { name = "KA003", transition = "KA003", type = "UR", altitude_min = 4000 },
                { name = "KA002", transition = "KA003", type = "UR", altitude_min = 2500 },
                { name = "KA004", transition = "KA004", type = "UR", altitude_min = 4000 },
                { name = "KA002", transition = "KA004", type = "UR", altitude_min = 2500 },
                { name = "KA005", transition = "KA005", type = "UR", altitude_min = 4000 },
                { name = "KA002", transition = "KA005", type = "UR", altitude_min = 2500 },
                { name = "KA002", transition = "", type = "UR", altitude_min = 2500 },
                { name = "KA001", transition = "", type = "UR" },
                { name = "25THR", transition = "", type = "UR" },
                { name = "RW21", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 580 },
                { name = "KA014", transition = "", type = "UR", speed = 210.0 },
                { name = "KA015", transition = "", type = "UR" },
                { name = "KA003", transition = "", type = "UR", altitude_min = 4000 },
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
