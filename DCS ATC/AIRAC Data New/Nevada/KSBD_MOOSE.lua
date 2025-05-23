local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KSBD",
        Name = "KSBD Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["ROLIE"] = { lat = 33.952372222, lon = -117.158983333, type = "KSBD" },
        ["BERDU"] = { lat = 33.905897222, lon = -117.224066667, type = "ENRT" },
        ["PETIS"] = { lat = 34.056472222, lon = -117.366113889, type = "ENRT" },
        ["AVRRY"] = { lat = 33.752041667, lon = -115.570711111, type = "ENRT" },
        ["ELICA"] = { lat = 33.839544444, lon = -117.058177778, type = "KSBD" },
        ["WIDAD"] = { lat = 34.052669444, lon = -117.378916667, type = "KSBD" },
        ["MAJRU"] = { lat = 34.081655556, lon = -117.102563889, type = "KSBD" },
        ["UCUDO"] = { lat = 34.019494444, lon = -117.490375, type = "KSBD" },
        ["BULGY"] = { lat = 34.667825, lon = -116.621944444, type = "ENRT" },
        ["MASPV"] = { lat = 34.108977778, lon = -117.183708333, type = "KSBD" },
        ["LANDO"] = { lat = 35.012427778, lon = -118.616372222, type = "ENRT" },
        ["SENIK"] = { lat = 33.851058333, lon = -117.111894444, type = "KSBD" },
        ["AHLEX"] = { lat = 33.882313889, lon = -116.689594444, type = "ENRT" },
        ["ARRAN"] = { lat = -35.837555556, lon = 147.639388889, type = "ENRT" },
        ["PEELR"] = { lat = 33.611005556, lon = -116.336933333, type = "ENRT" },
        ["LOSOM"] = { lat = 34.094636111, lon = -117.075155556, type = "KSBD" },
        ["PSP"] = { lat = -33.816666667, lon = 150.916666667, type = "ENRT" },
        ["BLUUH"] = { lat = 34.792338889, lon = -118.296152778, type = "ENRT" },
        ["RW06"] = { lat = 22.978633333, lon = -82.424944444, type = "MUHA" },
        ["OVULE"] = { lat = 34.080441667, lon = -117.299025, type = "KSBD" },
        ["COMIX"] = { lat = 33.137436111, lon = -117.483794444, type = "ENRT" },
        ["ROHRS"] = { lat = 33.427577778, lon = -117.064680556, type = "KSBD" },
        ["PADRZ"] = { lat = 33.193888889, lon = -117.861944444, type = "ENRT" },
        ["ZIGGY"] = { lat = 34.119802778, lon = -117.288302778, type = "ENRT" },
        ["SUDOC"] = { lat = 34.022588889, lon = -117.479991667, type = "KSBD" },
        ["ADOVE"] = { lat = 34.036008333, lon = -117.096547222, type = "KSBD" },
        ["DEGLE"] = { lat = 33.268083333, lon = -117.117147222, type = "ENRT" },
        ["STRKS"] = { lat = 33.969611111, lon = -117.044530556, type = "ENRT" },
        ["WELDR"] = { lat = 34.136969444, lon = -117.329241667, type = "KSBD" },
        ["JADKO"] = { lat = 33.675080556, lon = -116.982866667, type = "KSBD" },
        ["HITOP"] = { lat = 34.299638889, lon = -117.34255, type = "ENRT" },
        ["FLAVR"] = { lat = 34.429261111, lon = -117.622591667, type = "ENRT" },
        ["ZEELA"] = { lat = 34.148352778, lon = -117.529802778, type = "KSBD" },
        ["ROTHY"] = { lat = 33.593133333, lon = -116.896019444, type = "ENRT" },
        ["FASNI"] = { lat = 33.888919444, lon = -117.459677778, type = "KSBD" },
        ["GAREY"] = { lat = 34.166330556, lon = -117.232233333, type = "ENRT" },
        ["MTBAL"] = { lat = 33.603313889, lon = -116.042305556, type = "ENRT" },
        ["XONIA"] = { lat = 34.020913889, lon = -117.105030556, type = "KSBD" },
        ["HESPE"] = { lat = 34.341166667, lon = -117.432030556, type = "ENRT" },
        ["HHATT"] = { lat = 34.054972222, lon = -117.590627778, type = "KSBD" },
        ["SETER"] = { lat = 33.901008333, lon = -117.109125, type = "ENRT" },
        ["DAWNA"] = { lat = 34.264977778, lon = -117.113061111, type = "ENRT" },
        ["MAJEK"] = { lat = 34.388647222, lon = -117.534602778, type = "ENRT" },
        ["NITIY"] = { lat = 34.177208333, lon = -117.305591667, type = "ENRT" },
        ["CFMLB"] = { lat = 34.100161111, lon = -117.219397222, type = "KSBD" },
        ["PESLE"] = { lat = 33.994891667, lon = -117.289655556, type = "KSBD" },
        ["ARRDY"] = { lat = 33.655013889, lon = -116.778002778, type = "ENRT" },
        ["ZARTI"] = { lat = 28.161505556, lon = 9.419744444, type = "DAUZ" },
        ["BANDS"] = { lat = 33.889608333, lon = -116.849480556, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW06"] = {
            heading = 60,
            length = 0,
            width = 0,
            threshold = { lat = 34.09075555555556, lon = -117.25043611111111 },
            end = { lat = 34.09075555555556, lon = -117.25043611111111 }
        },
        ["RW24"] = {
            heading = 240,
            length = 0,
            width = 0,
            threshold = { lat = 34.09995555555556, lon = -117.21931666666667 },
            end = { lat = 34.09995555555556, lon = -117.21931666666667 }
        },
    },

    -- Процедуры SID
    SID = {
        ["JADKO1"] = {
            name = "JADKO1",
            runway = "RW06",
            waypoints = {
                { name = "", type = "", altitude_min = 2100 },
                { name = "LOSOM", type = "P", altitude_min = 5500 },
                { name = "STRKS", type = "E", altitude_min = 6100, altitude_max = 6900 },
                { name = "ELICA", type = "P" },
                { name = "", type = "" },
                { name = "PESLE", type = "P" },
                { name = "ROLIE", type = "P" },
                { name = "ELICA", type = "P" },
                { name = "ELICA", type = "P" },
                { name = "JADKO", type = "P" },
                { name = "JADKO", type = "P" },
                { name = "ARRDY", type = "E", altitude_min = 13000 },
                { name = "PEELR", type = "E" },
                { name = "MTBAL", type = "E" },
                { name = "AVRRY", type = "E" },
                { name = "JADKO", type = "P" },
                { name = "ARRDY", type = "E", altitude_min = 13000 },
                { name = "PEELR", type = "E" },
                { name = "MTBAL", type = "E" },
                { name = "JADKO", type = "P" },
                { name = "ROHRS", type = "P", altitude_min = 15000 },
                { name = "DEGLE", type = "E" },
                { name = "COMIX", type = "E" },
                { name = "PADRZ", type = "E" },
                { name = "SXC", type = "D" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["SETER5"] = {
            name = "SETER5",
            runway = "JLI",
            waypoints = {
                { name = "JLI", type = "K2" },
                { name = "ROTHY", type = "K2" },
                { name = "SETER", type = "K2" },
                { name = "PSP", type = "K2" },
                { name = "AHLEX", type = "K2" },
                { name = "BANDS", type = "K2" },
                { name = "SETER", type = "K2" },
                { name = "SETER", type = "K2" },
                { name = "BERDU", type = "K2" },
                { name = "PDZ", type = "K2" },
            }
        },
        ["ZIGGY8"] = {
            name = "ZIGGY8",
            runway = "EHF",
            waypoints = {
                { name = "EHF", type = "K2" },
                { name = "ZARTI", type = "K2" },
                { name = "LANDO", type = "K2" },
                { name = "BLUUH", type = "K2" },
                { name = "PMD", type = "K2" },
                { name = "FLAVR", type = "K2", speed = 250.0 },
                { name = "MAJEK", type = "K2", speed = 250.0 },
                { name = "HESPE", type = "K2" },
                { name = "HITOP", type = "K2" },
                { name = "NITIY", type = "K2" },
                { name = "ZIGGY", type = "K2" },
                { name = "HEC", type = "K2" },
                { name = "BULGY", type = "K2", speed = 280.0 },
                { name = "DAWNA", type = "K2", speed = 250.0 },
                { name = "ARRAN", type = "K2" },
                { name = "GAREY", type = "K2" },
                { name = "ZIGGY", type = "K2" },
                { name = "PMD", type = "K2" },
                { name = "FLAVR", type = "K2", speed = 250.0 },
                { name = "MAJEK", type = "K2", speed = 250.0 },
                { name = "HESPE", type = "K2" },
                { name = "HITOP", type = "K2" },
                { name = "NITIY", type = "K2" },
                { name = "ZIGGY", type = "K2" },
                { name = "TTE", type = "K2" },
                { name = "ZARTI", type = "K2" },
                { name = "LANDO", type = "K2" },
                { name = "BLUUH", type = "K2" },
                { name = "PMD", type = "K2" },
                { name = "FLAVR", type = "K2", speed = 250.0 },
                { name = "MAJEK", type = "K2", speed = 250.0 },
                { name = "HESPE", type = "K2" },
                { name = "HITOP", type = "K2" },
                { name = "NITIY", type = "K2" },
                { name = "ZIGGY", type = "K2" },
                { name = "ZIGGY", type = "K2" },
                { name = "PETIS", type = "K2" },
                { name = "PDZ", type = "K2" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I06"] = {
            name = "I06",
            type = "A",
            runway = "I06",
            waypoints = {
                { name = "PDZ", transition = "PDZ", type = "K2" },
                { name = "SUDOC", transition = "PDZ", type = "K2", altitude_min = 4000 },
                { name = "SUDOC", transition = "", type = "K2" },
                { name = "PETIS", transition = "", type = "K2" },
                { name = "RW06", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2000 },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
            }
        },
        ["L06-Y"] = {
            name = "L06-Y",
            type = "A",
            runway = "L06-Y",
            waypoints = {
                { name = "PDZ", transition = "PDZ", type = "K2" },
                { name = "SUDOC", transition = "PDZ", type = "K2", altitude_min = 4000 },
                { name = "SUDOC", transition = "", type = "K2", altitude_min = 4000 },
                { name = "PETIS", transition = "", type = "K2", altitude_min = 3300 },
                { name = "RW06", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2700 },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
            }
        },
        ["L06-Z"] = {
            name = "L06-Z",
            type = "A",
            runway = "L06-Z",
            waypoints = {
                { name = "PDZ", transition = "PDZ", type = "K2" },
                { name = "SUDOC", transition = "PDZ", type = "K2", altitude_min = 4000 },
                { name = "SUDOC", transition = "", type = "K2", altitude_min = 4000 },
                { name = "PETIS", transition = "", type = "K2", altitude_min = 3300 },
                { name = "RW06", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2000 },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
            }
        },
        ["R06-X"] = {
            name = "R06-X",
            type = "A",
            runway = "R06-X",
            waypoints = {
                { name = "ARRAN", transition = "ARRAN", type = "K2", speed = 250.0 },
                { name = "NITIY", transition = "ARRAN", type = "K2", altitude_min = 8500 },
                { name = "ZEELA", transition = "ARRAN", type = "K2", altitude_min = 7300 },
                { name = "HHATT", transition = "ARRAN", type = "K2", altitude_min = 6000 },
                { name = "UCUDO", transition = "ARRAN", type = "K2", altitude_min = 5000 },
                { name = "PDZ", transition = "PDZ", type = "K2" },
                { name = "UCUDO", transition = "PDZ", type = "K2", altitude_min = 5000 },
                { name = "SETER", transition = "SETER", type = "K2" },
                { name = "FASNI", transition = "SETER", type = "K2", altitude_min = 6000 },
                { name = "UCUDO", transition = "SETER", type = "K2", altitude_min = 5000 },
                { name = "UCUDO", transition = "", type = "K2", altitude_min = 5000 },
                { name = "WIDAD", transition = "", type = "K2", altitude_min = 3300 },
                { name = "RW06", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2000 },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
                { name = "PDZ", transition = "", type = "K2" },
            }
        },
        ["R06-Y"] = {
            name = "R06-Y",
            type = "A",
            runway = "R06-Y",
            waypoints = {
                { name = "PDZ", transition = "PDZ", type = "K2" },
                { name = "UCUDO", transition = "PDZ", type = "K2", altitude_min = 4000 },
                { name = "UCUDO", transition = "", type = "K2", altitude_min = 4000 },
                { name = "WIDAD", transition = "", type = "K2", altitude_min = 3300 },
                { name = "RW06", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2800 },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
            }
        },
        ["R06-Z"] = {
            name = "R06-Z",
            type = "A",
            runway = "R06-Z",
            waypoints = {
                { name = "PDZ", transition = "PDZ", type = "K2" },
                { name = "UCUDO", transition = "PDZ", type = "K2", altitude_min = 4000 },
                { name = "UCUDO", transition = "", type = "K2", altitude_min = 4000 },
                { name = "WIDAD", transition = "", type = "K2", altitude_min = 3300 },
                { name = "RW06", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2000 },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
            }
        },
        ["R24"] = {
            name = "R24",
            type = "A",
            runway = "R24",
            waypoints = {
                { name = "BANDS", transition = "BANDS", type = "K2" },
                { name = "ELICA", transition = "BANDS", type = "K2", altitude_min = 9000 },
                { name = "SENIK", transition = "BANDS", type = "K2", altitude_min = 8000 },
                { name = "ROLIE", transition = "BANDS", type = "K2", altitude_min = 6000 },
                { name = "PDZ", transition = "PDZ", type = "K2" },
                { name = "ROLIE", transition = "PDZ", type = "K2", altitude_min = 6000 },
                { name = "WELDR", transition = "WELDR", type = "K2" },
                { name = "PESLE", transition = "WELDR", type = "K2", altitude_min = 6000 },
                { name = "ROLIE", transition = "WELDR", type = "K2", altitude_min = 6000 },
                { name = "ZIGGY", transition = "ZIGGY", type = "K2" },
                { name = "PESLE", transition = "ZIGGY", type = "K2", altitude_min = 6000 },
                { name = "ROLIE", transition = "ZIGGY", type = "K2", altitude_min = 6000 },
                { name = "ROLIE", transition = "", type = "K2", altitude_min = 6000 },
                { name = "XONIA", transition = "", type = "K2", altitude_min = 4500 },
                { name = "ADOVE", transition = "", type = "K2", altitude_min = 4200 },
                { name = "MAJRU", transition = "", type = "K2", altitude_min = 3300 },
                { name = "MASPV", transition = "", type = "K2", altitude_min = 1800 },
                { name = "CFMLB", transition = "", type = "K2" },
                { name = "OVULE", transition = "", type = "K2" },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
                { name = "PDZ", transition = "", type = "K2", altitude_min = 6000 },
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
