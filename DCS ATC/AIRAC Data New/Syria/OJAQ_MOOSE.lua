local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OJAQ",
        Name = "OJAQ Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["D090C"] = { lat = 29.581338889, lon = 35.070852778, type = "OJAQ" },
        ["AQ192"] = { lat = 29.815108333, lon = 35.076722222, type = "OJAQ" },
        ["KEDET"] = { lat = 29.409491667, lon = 35.027236111, type = "OJAQ" },
        ["AQ194"] = { lat = 29.707919444, lon = 35.042797222, type = "OJAQ" },
        ["QATIM"] = { lat = 29.933333333, lon = 35.266666667, type = "ENRT" },
        ["LOXUS"] = { lat = 30.216916667, lon = 35.433527778, type = "ENRT" },
        ["MUVON"] = { lat = 29.781666667, lon = 35.077777778, type = "OJAQ" },
        ["METSA"] = { lat = 29.451944444, lon = 34.984166667, type = "ENRT" },
        ["LOXAL"] = { lat = 29.394786111, lon = 35.081961111, type = "OJAQ" },
        ["RW19"] = { lat = 56.701191667, lon = 12.822197222, type = "ESMT" },
        ["KIVAR"] = { lat = 29.391944444, lon = 34.941388889, type = "OJAQ" },
        ["GENUN"] = { lat = 29.429063889, lon = 34.954244444, type = "OJAQ" },
        ["GERAV"] = { lat = 29.894183333, lon = 35.178630556, type = "OJAQ" },
        ["NALBO"] = { lat = 29.855080556, lon = 35.090569444, type = "OJAQ" },
        ["TAMIM"] = { lat = 29.611111111, lon = 35.811111111, type = "ENRT" },
        ["IMSEK"] = { lat = 30.094280556, lon = 35.172236111, type = "OJAQ" },
        ["LONOL"] = { lat = 30.1335, lon = 35.583361111, type = "ENRT" },
        ["AQC01"] = { lat = 29.902280556, lon = 35.118997222, type = "OJAQ" },
        ["CI01"] = { lat = 32.924161111, lon = 6.06305, type = "DAUK" },
        ["DAVOS"] = { lat = 44.856111111, lon = 21.300833333, type = "LYVR" },
        ["AQ190"] = { lat = 29.738722222, lon = 35.050294444, type = "OJAQ" },
        ["AQ196"] = { lat = 29.64425, lon = 35.027311111, type = "OJAQ" },
        ["BAKIR"] = { lat = 39.437777778, lon = 33.324444444, type = "ENRT" },
        ["D194H"] = { lat = 37.443611111, lon = 61.844166667, type = "UTAM" },
        ["RW01"] = { lat = 56.681002778, lon = 12.818208333, type = "ESMT" },
        ["AQ010"] = { lat = 29.503933333, lon = 34.980408333, type = "OJAQ" },
        ["AQ011"] = { lat = 29.543880556, lon = 34.994372222, type = "OJAQ" },
        ["FI01"] = { lat = 32.973705556, lon = 6.071855556, type = "DAUK" },
        ["AQ195"] = { lat = 29.665836111, lon = 35.032555556, type = "OJAQ" },
        ["D194G"] = { lat = 41.8185, lon = 2.731475, type = "LEGE" },
        ["IVATA"] = { lat = 29.4222, lon = 35.232413889, type = "OJAQ" },
        ["ELETA"] = { lat = 29.533555556, lon = 35.483361111, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW01"] = {
            heading = 10,
            length = -650.0,
            width = 0,
            threshold = { lat = 29.59804722222222, lon = 35.01331944444444 },
            end = { lat = 29.492696268084064, lon = 34.991955483158456 }
        },
        ["RW19"] = {
            heading = 190,
            length = 650.0,
            width = 0,
            threshold = { lat = 29.623963888888888, lon = 35.02238333333333 },
            end = { lat = 29.51861293475073, lon = 35.001013879205104 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ARABA"] = {
            name = "ARABA",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "AQC", type = "D", altitude_min = 7000 },
                { name = "", type = "" },
                { name = "QATIM", type = "E" },
                { name = "QTR", type = "D" },
            }
        },
        ["LONO1J"] = {
            name = "LONO1J",
            runway = "RW01",
            waypoints = {
                { name = "AQC01", type = "P", altitude_min = 6100 },
                { name = "LONOL", type = "E", altitude_min = 15000 },
            }
        },
        ["LONO1P"] = {
            name = "LONO1P",
            runway = "RW19",
            waypoints = {
                { name = "GENUN", type = "P", altitude_min = 3700 },
                { name = "QATIM", type = "E", altitude_min = 12400 },
                { name = "LONOL", type = "E", altitude_min = 15000 },
            }
        },
        ["LOXU1J"] = {
            name = "LOXU1J",
            runway = "RW01",
            waypoints = {
                { name = "AQC01", type = "P", altitude_min = 6100 },
                { name = "LOXUS", type = "E", altitude_min = 15000 },
            }
        },
        ["LOXU1P"] = {
            name = "LOXU1P",
            runway = "RW19",
            waypoints = {
                { name = "GENUN", type = "P", altitude_min = 3700 },
                { name = "QATIM", type = "E", altitude_min = 12400 },
                { name = "LOXUS", type = "E", altitude_min = 15000 },
            }
        },
        ["METS1J"] = {
            name = "METS1J",
            runway = "RW01",
            waypoints = {
                { name = "AQC01", type = "P", altitude_min = 6100 },
                { name = "BAKIR", type = "E", altitude_min = 8000, speed = 230.0 },
                { name = "METSA", type = "E", altitude_min = 12000 },
            }
        },
        ["METS1P"] = {
            name = "METS1P",
            runway = "RW19",
            waypoints = {
                { name = "GENUN", type = "P", altitude_min = 3700 },
                { name = "IVATA", type = "P", altitude_min = 8000 },
                { name = "METSA", type = "E", altitude_min = 12000 },
            }
        },
        ["METSA"] = {
            name = "METSA",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 5000 },
                { name = "D194G", type = "P", speed = 210.0 },
                { name = "D090C", type = "P", altitude_min = 7000 },
                { name = "BAKIR", type = "E" },
                { name = "BAKIR", type = "E", altitude_min = 8000 },
                { name = "METSA", type = "E", altitude_min = 12000 },
            }
        },
        ["PETRA"] = {
            name = "PETRA",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 5000, speed = 210.0 },
                { name = "D090C", type = "P", altitude_min = 7000 },
                { name = "BAKIR", type = "E" },
                { name = "QATIM", type = "E" },
                { name = "QTR", type = "D" },
            }
        },
        ["RAHMA"] = {
            name = "RAHMA",
            runway = "RW01",
            waypoints = {
                { name = "", type = "", altitude_min = 580 },
                { name = "AQC", type = "D", altitude_min = 7000 },
                { name = "BAKIR", type = "E" },
                { name = "METSA", type = "E", altitude_min = 12000 },
            }
        },
        ["TAMI1J"] = {
            name = "TAMI1J",
            runway = "RW01",
            waypoints = {
                { name = "AQC01", type = "P", altitude_min = 6100 },
                { name = "BAKIR", type = "E", altitude_min = 8000, speed = 230.0 },
                { name = "ELETA", type = "E", altitude_min = 25000 },
                { name = "TAMIM", type = "E", altitude_min = 25000 },
            }
        },
        ["TAMI1P"] = {
            name = "TAMI1P",
            runway = "RW19",
            waypoints = {
                { name = "GENUN", type = "P", altitude_min = 3700 },
                { name = "IVATA", type = "P", altitude_min = 8000 },
                { name = "ELETA", type = "E", altitude_min = 25000 },
                { name = "TAMIM", type = "E", altitude_min = 25000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["LONO1H"] = {
            name = "LONO1H",
            runway = "RW01",
            waypoints = {
                { name = "LONOL", type = "OJ", altitude_min = 25000 },
                { name = "QATIM", type = "OJ", altitude_min = 16000, speed = 250.0 },
                { name = "LOXAL", type = "OJ", altitude_min = 6500 },
            }
        },
        ["LONO1Q"] = {
            name = "LONO1Q",
            runway = "RW19",
            waypoints = {
                { name = "LONOL", type = "OJ", altitude_min = 25000 },
                { name = "QATIM", type = "OJ", altitude_min = 8000 },
            }
        },
        ["LOXU1H"] = {
            name = "LOXU1H",
            runway = "RW01",
            waypoints = {
                { name = "LOXUS", type = "OJ", altitude_min = 16000 },
                { name = "QATIM", type = "OJ", altitude_min = 16000, speed = 250.0 },
                { name = "LOXAL", type = "OJ", altitude_min = 6500 },
            }
        },
        ["LOXU1Q"] = {
            name = "LOXU1Q",
            runway = "RW19",
            waypoints = {
                { name = "LOXUS", type = "OJ", altitude_min = 16000 },
                { name = "QATIM", type = "OJ", altitude_min = 8000 },
            }
        },
        ["METS1H"] = {
            name = "METS1H",
            runway = "RW01",
            waypoints = {
                { name = "METSA", type = "OJ", altitude_min = 13000 },
                { name = "BAKIR", type = "OJ", altitude_min = 8000 },
                { name = "LOXAL", type = "OJ", altitude_min = 6500 },
            }
        },
        ["METS1Q"] = {
            name = "METS1Q",
            runway = "RW19",
            waypoints = {
                { name = "METSA", type = "OJ", altitude_min = 13000 },
                { name = "QATIM", type = "OJ", altitude_min = 8000 },
            }
        },
        ["TAMI1H"] = {
            name = "TAMI1H",
            runway = "RW01",
            waypoints = {
                { name = "TAMIM", type = "OJ", altitude_min = 25000 },
                { name = "ELETA", type = "OJ", altitude_min = 25000 },
                { name = "LOXAL", type = "OJ", altitude_min = 6500 },
            }
        },
        ["TAMI1Q"] = {
            name = "TAMI1Q",
            runway = "RW19",
            waypoints = {
                { name = "TAMIM", type = "OJ", altitude_min = 25000 },
                { name = "ELETA", type = "OJ", altitude_min = 25000, speed = 250.0 },
                { name = "QATIM", type = "OJ", altitude_min = 8000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I01"] = {
            name = "I01",
            type = "A",
            runway = "I01",
            waypoints = {
                { name = "BAKIR", transition = "BAKIR", type = "OJ", altitude_min = 8000, speed = 180.0 },
                { name = "AQB", transition = "BAKIR", type = "OJ", altitude_min = 6300 },
                { name = "AQB", transition = "BAKIR", type = "OJ", altitude_min = 5000 },
                { name = "D194H", transition = "BAKIR", type = "OJ", altitude_min = 4000 },
                { name = "D194H", transition = "BAKIR", type = "OJ", altitude_min = 4000 },
                { name = "CI01", transition = "BAKIR", type = "OJ", altitude_min = 3200 },
                { name = "CI01", transition = "", type = "OJ", speed = 180.0 },
                { name = "FI01", transition = "", type = "OJ" },
                { name = "RW01", transition = "", type = "OJ" },
                { name = "", transition = "", type = "", altitude_min = 6300 },
                { name = "BAKIR", transition = "", type = "OJ", speed = 180.0 },
                { name = "BAKIR", transition = "", type = "OJ", speed = 180.0 },
            }
        },
        ["I19"] = {
            name = "I19",
            type = "A",
            runway = "I19",
            waypoints = {
                { name = "AQC", transition = "AQC", type = "OJ", altitude_min = 7000, speed = 185.0 },
                { name = "AQC", transition = "AQC", type = "OJ", altitude_min = 6000 },
                { name = "AQC", transition = "", type = "OJ" },
                { name = "MUVON", transition = "", type = "OJ" },
                { name = "RW19", transition = "", type = "OJ" },
                { name = "AQB", transition = "", type = "OJ", altitude_min = 580 },
                { name = "KIVAR", transition = "", type = "HE", altitude_min = 2650 },
                { name = "", transition = "", type = "" },
                { name = "AQB", transition = "", type = "OJ" },
                { name = "AQC", transition = "", type = "OJ", speed = 185.0 },
            }
        },
        ["R01"] = {
            name = "R01",
            type = "A",
            runway = "R01",
            waypoints = {
                { name = "LOXAL", transition = "LOXAL", type = "OJ", altitude_min = 6500, speed = 180.0 },
                { name = "KEDET", transition = "LOXAL", type = "OJ", altitude_min = 5210 },
                { name = "GENUN", transition = "LOXAL", type = "OJ", altitude_min = 3500 },
                { name = "GENUN", transition = "", type = "OJ", altitude_min = 3500, speed = 180.0 },
                { name = "AQ010", transition = "", type = "OJ", altitude_min = 2100 },
                { name = "AQ011", transition = "", type = "OJ", altitude_min = 1310 },
                { name = "RW01", transition = "", type = "OJ" },
                { name = "DAVOS", transition = "", type = "OJ", altitude_min = 1600 },
                { name = "IMSEK", transition = "", type = "OJ", altitude_min = 5100 },
                { name = "BAKIR", transition = "", type = "OJ", altitude_min = 8000, speed = 180.0 },
                { name = "BAKIR", transition = "", type = "OJ", speed = 180.0 },
            }
        },
        ["R19"] = {
            name = "R19",
            type = "A",
            runway = "R19",
            waypoints = {
                { name = "QATIM", transition = "QATIM", type = "OJ", altitude_min = 8000, speed = 180.0 },
                { name = "GERAV", transition = "QATIM", type = "OJ", altitude_min = 6350 },
                { name = "NALBO", transition = "QATIM", type = "OJ", altitude_min = 4700 },
                { name = "NALBO", transition = "", type = "OJ", altitude_min = 4700, speed = 180.0 },
                { name = "AQ192", transition = "", type = "OJ", altitude_min = 3900 },
                { name = "AQ190", transition = "", type = "OJ", altitude_min = 2400 },
                { name = "AQ194", transition = "", type = "OJ", altitude_min = 1800 },
                { name = "AQ195", transition = "", type = "OJ", altitude_min = 980 },
                { name = "AQ196", transition = "", type = "OJ" },
                { name = "GENUN", transition = "", type = "OJ", altitude_min = 4100 },
                { name = "LOXAL", transition = "", type = "OJ", altitude_min = 5100 },
                { name = "QATIM", transition = "", type = "OJ", altitude_min = 8000, speed = 180.0 },
                { name = "QATIM", transition = "", type = "OJ", speed = 180.0 },
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
