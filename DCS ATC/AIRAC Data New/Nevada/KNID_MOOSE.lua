local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KNID",
        Name = "KNID Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["OYSER"] = { lat = 35.606722222, lon = -117.78505, type = "KNID" },
        ["EKJER"] = { lat = 35.614286111, lon = -117.644969444, type = "KNID" },
        ["ROSIE"] = { lat = 33.713455556, lon = 133.49065, type = "ENRT" },
        ["IDALE"] = { lat = 35.581725, lon = -117.834752778, type = "KNID" },
        ["CIBIV"] = { lat = 35.317919444, lon = -117.810425, type = "ENRT" },
        ["SAVEW"] = { lat = 35.552011111, lon = -117.845769444, type = "KNID" },
        ["MIGPE"] = { lat = 35.480955556, lon = -117.954602778, type = "ENRT" },
        ["JEBUR"] = { lat = 35.533863889, lon = -117.568152778, type = "KNID" },
        ["RANDS"] = { lat = 35.417758333, lon = -117.851397222, type = "KNID" },
        ["SERUE"] = { lat = 35.477813889, lon = -117.523780556, type = "KNID" },
        ["KATIE"] = { lat = 35.583855556, lon = -117.627869444, type = "KNID" },
        ["FIDDY"] = { lat = 35.50475, lon = -117.706161111, type = "KNID" },
        ["POLSE"] = { lat = 35.576747222, lon = -117.818330556, type = "KNID" },
        ["DAG"] = { lat = -23.72, lon = 149.668333333, type = "ENRT" },
        ["HAMEN"] = { lat = 35.609686111, lon = -117.796827778, type = "KNID" },
        ["ODGEE"] = { lat = 35.4628, lon = -117.824655556, type = "KNID" },
        ["JARIS"] = { lat = 34.568716667, lon = -118.250947222, type = "KNID" },
        ["DANEC"] = { lat = 35.188355556, lon = -117.73305, type = "KNID" },
        ["SALTD"] = { lat = 35.4557, lon = -117.983941667, type = "ENRT" },
        ["CORKO"] = { lat = 35.5393, lon = -117.822541667, type = "KNID" },
        ["RW32"] = { lat = 56.285166667, lon = 12.865880556, type = "ESTA" },
        ["BUGWU"] = { lat = 35.650027778, lon = -117.713897222, type = "KNID" },
        ["CAMAD"] = { lat = 35.425075, lon = -117.593330556, type = "KNID" },
        ["ZUDID"] = { lat = 35.2755, lon = -117.995872222, type = "KNID" },
        ["RINGE"] = { lat = 35.617908333, lon = -117.634825, type = "KNID" },
        ["GLADI"] = { lat = 35.674513889, lon = -117.708738889, type = "KNID" },
        ["FABAT"] = { lat = 35.665516667, lon = -117.672672222, type = "KNID" },
        ["OKECI"] = { lat = 35.5899, lon = -117.612586111, type = "KNID" },
        ["PIBAE"] = { lat = 35.523163889, lon = -117.593811111, type = "KNID" },
        ["GMN"] = { lat = -27.25, lon = 149.683333333, type = "ENRT" },
        ["FONOD"] = { lat = 35.321577778, lon = -117.721752778, type = "KNID" },
        ["FAMAK"] = { lat = 35.606705556, lon = -117.793413889, type = "KNID" },
        ["CISUN"] = { lat = 35.564941667, lon = -117.857494444, type = "KNID" },
        ["OLRAE"] = { lat = 35.041438889, lon = -118.164261111, type = "KNID" },
        ["PEXOE"] = { lat = 35.418286111, lon = -117.737383333, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW03"] = {
            heading = 30,
            length = 0,
            width = 0,
            threshold = { lat = 35.67562777777778, lon = -117.70840833333334 },
            end = { lat = 35.67562777777778, lon = -117.70840833333334 }
        },
        ["RW08"] = {
            heading = 80,
            length = 0,
            width = 0,
            threshold = { lat = 35.68343888888889, lon = -117.71922222222223 },
            end = { lat = 35.68343888888889, lon = -117.71922222222223 }
        },
        ["RW14"] = {
            heading = 140,
            length = 0,
            width = 0,
            threshold = { lat = 35.69875833333333, lon = -117.6932 },
            end = { lat = 35.69875833333333, lon = -117.6932 }
        },
        ["RW21"] = {
            heading = 210,
            length = 0,
            width = 0,
            threshold = { lat = 35.69595555555555, lon = -117.68576111111112 },
            end = { lat = 35.69595555555555, lon = -117.68576111111112 }
        },
        ["RW26"] = {
            heading = 260,
            length = 0,
            width = 0,
            threshold = { lat = 35.68302222222222, lon = -117.68151666666667 },
            end = { lat = 35.68302222222222, lon = -117.68151666666667 }
        },
        ["RW32"] = {
            heading = 320,
            length = 0,
            width = 0,
            threshold = { lat = 35.67647777777778, lon = -117.67996111111111 },
            end = { lat = 35.67647777777778, lon = -117.67996111111111 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ROSIE4"] = {
            name = "ROSIE4",
            runway = "RW03",
            waypoints = {
                { name = "", type = "", altitude_min = 3100 },
                { name = "ZUDID", type = "P" },
                { name = "OLRAE", type = "P" },
                { name = "ROSIE", type = "E", altitude_min = 8000 },
                { name = "JARIS", type = "P" },
                { name = "FIM", type = "D" },
                { name = "", type = "", altitude_min = 3000 },
                { name = "ZUDID", type = "P" },
                { name = "OLRAE", type = "P" },
                { name = "ROSIE", type = "E", altitude_min = 8000 },
                { name = "JARIS", type = "P" },
                { name = "FIM", type = "D" },
                { name = "", type = "", altitude_min = 3000 },
                { name = "ZUDID", type = "P" },
                { name = "OLRAE", type = "P" },
                { name = "ROSIE", type = "E", altitude_min = 8000 },
                { name = "JARIS", type = "P" },
                { name = "FIM", type = "D" },
                { name = "", type = "", altitude_min = 2700 },
                { name = "ZUDID", type = "P" },
                { name = "OLRAE", type = "P" },
                { name = "ROSIE", type = "E", altitude_min = 8000 },
                { name = "JARIS", type = "P" },
                { name = "FIM", type = "D" },
                { name = "", type = "", altitude_min = 3100 },
                { name = "BUGWU", type = "P" },
                { name = "ZUDID", type = "P" },
                { name = "OLRAE", type = "P" },
                { name = "ROSIE", type = "E", altitude_min = 8000 },
                { name = "JARIS", type = "P" },
                { name = "FIM", type = "D" },
            }
        },
        ["SALTD7"] = {
            name = "SALTD7",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 2690 },
                { name = "", type = "" },
                { name = "SALTD", type = "E", altitude_min = 15000 },
                { name = "", type = "", altitude_min = 2690 },
                { name = "FAMAK", type = "P", altitude_min = 5000 },
                { name = "SALTD", type = "E", altitude_min = 15000 },
                { name = "", type = "", speed = 240.0 },
                { name = "", type = "", altitude_min = 3300 },
                { name = "NID", type = "D" },
                { name = "FAMAK", type = "P", altitude_min = 5000 },
                { name = "SALTD", type = "E", altitude_min = 15000 },
                { name = "SALTD", type = "E", altitude_min = 15000 },
                { name = "GMN", type = "D" },
                { name = "SALTD", type = "E", altitude_min = 15000 },
                { name = "HEC", type = "D" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["R03"] = {
            name = "R03",
            type = "A",
            runway = "R03",
            waypoints = {
                { name = "MIGPE", transition = "MIGPE", type = "K2", altitude_min = 7600 },
                { name = "SAVEW", transition = "MIGPE", type = "K2", altitude_min = 5400 },
                { name = "SAVEW", transition = "", type = "K2", altitude_min = 5400 },
                { name = "POLSE", transition = "", type = "K2", altitude_min = 4800 },
                { name = "OYSER", transition = "", type = "K2", altitude_min = 4100 },
                { name = "RW03", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 3600 },
                { name = "JEBUR", transition = "", type = "K2", speed = 185.0 },
                { name = "PEXOE", transition = "", type = "K2" },
                { name = "MIGPE", transition = "", type = "K2", altitude_min = 7600 },
                { name = "MIGPE", transition = "", type = "K2", altitude_max = 7600, speed = 230.0 },
            }
        },
        ["R32"] = {
            name = "R32",
            type = "A",
            runway = "R32",
            waypoints = {
                { name = "CIBIV", transition = "CIBIV", type = "K2", altitude_min = 6500 },
                { name = "CAMAD", transition = "CIBIV", type = "K2", altitude_min = 6500 },
                { name = "CAMAD", transition = "", type = "K2", altitude_min = 6500 },
                { name = "PIBAE", transition = "", type = "K2", altitude_min = 5300 },
                { name = "KATIE", transition = "", type = "K2", altitude_min = 4400 },
                { name = "EKJER", transition = "", type = "K2", altitude_min = 3600 },
                { name = "RW32", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2800 },
                { name = "CIBIV", transition = "", type = "K2", altitude_min = 8100 },
                { name = "CIBIV", transition = "", type = "K2", altitude_max = 13000, speed = 230.0 },
            }
        },
        ["T03-Y"] = {
            name = "T03-Y",
            type = "A",
            runway = "T03-Y",
            waypoints = {
                { name = "DAG", transition = "DAG", type = "K2", altitude_min = 13000 },
                { name = "FONOD", transition = "DAG", type = "K2", altitude_min = 9500 },
                { name = "FIDDY", transition = "DAG", type = "K2" },
                { name = "CORKO", transition = "DAG", type = "K2", altitude_min = 6600 },
                { name = "CISUN", transition = "DAG", type = "K2", altitude_min = 6100 },
                { name = "CISUN", transition = "", type = "K2", altitude_min = 6100 },
                { name = "IDALE", transition = "", type = "K2", altitude_min = 5600 },
                { name = "HAMEN", transition = "", type = "K2", altitude_min = 4500 },
                { name = "GLADI", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 3600 },
                { name = "", transition = "", type = "" },
                { name = "FONOD", transition = "", type = "K2", altitude_min = 9500 },
                { name = "FONOD", transition = "", type = "K2", altitude_max = 9500, speed = 230.0 },
            }
        },
        ["T03-Z"] = {
            name = "T03-Z",
            type = "A",
            runway = "T03-Z",
            waypoints = {
                { name = "EHF", transition = "EHF", type = "K2", altitude_min = 17000 },
                { name = "DANEC", transition = "EHF", type = "K2", altitude_min = 17000 },
                { name = "DANEC", transition = "EHF", type = "K2", altitude_min = 17000, speed = 310.0 },
                { name = "FIDDY", transition = "EHF", type = "K2" },
                { name = "CORKO", transition = "EHF", type = "K2", altitude_min = 6600 },
                { name = "CISUN", transition = "EHF", type = "K2", altitude_min = 6100 },
                { name = "HEC", transition = "HEC", type = "K2", altitude_min = 17000 },
                { name = "DANEC", transition = "HEC", type = "K2", altitude_min = 17000 },
                { name = "FIDDY", transition = "HEC", type = "K2" },
                { name = "CORKO", transition = "HEC", type = "K2", altitude_min = 6600 },
                { name = "CISUN", transition = "HEC", type = "K2", altitude_min = 6100 },
                { name = "CISUN", transition = "", type = "K2", altitude_min = 6100 },
                { name = "IDALE", transition = "", type = "K2", altitude_min = 5600 },
                { name = "HAMEN", transition = "", type = "K2", altitude_min = 4500 },
                { name = "GLADI", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 3600 },
                { name = "", transition = "", type = "" },
                { name = "FONOD", transition = "", type = "K2", altitude_min = 9500 },
                { name = "FONOD", transition = "", type = "K2", altitude_max = 12500, speed = 230.0 },
            }
        },
        ["T32"] = {
            name = "T32",
            type = "A",
            runway = "T32",
            waypoints = {
                { name = "DAG", transition = "DAG", type = "K2", altitude_min = 13000 },
                { name = "RANDS", transition = "DAG", type = "K2", altitude_min = 7300 },
                { name = "ODGEE", transition = "DAG", type = "K2" },
                { name = "SERUE", transition = "DAG", type = "K2", altitude_min = 6600 },
                { name = "SERUE", transition = "", type = "K2", altitude_min = 6600 },
                { name = "JEBUR", transition = "", type = "K2", altitude_min = 5400 },
                { name = "OKECI", transition = "", type = "K2", altitude_min = 4300 },
                { name = "RINGE", transition = "", type = "K2", altitude_min = 3700 },
                { name = "FABAT", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 3600 },
                { name = "", transition = "", type = "" },
                { name = "RANDS", transition = "", type = "K2", altitude_min = 7300 },
                { name = "RANDS", transition = "", type = "K2", altitude_max = 13000, speed = 230.0 },
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
