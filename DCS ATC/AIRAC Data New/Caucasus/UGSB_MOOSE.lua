local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "UGSB",
        Name = "UGSB Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["IZERO"] = { lat = 41.655833333, lon = 41.108888889, type = "ENRT" },
        ["TUZZA"] = { lat = 41.88, lon = 41.935, type = "ENRT" },
        ["BARUS"] = { lat = 41.903888889, lon = 42.841666667, type = "ENRT" },
        ["SB100"] = { lat = 41.601388889, lon = 41.614166667, type = "UGSB" },
        ["SB201"] = { lat = 41.652222222, lon = 41.330555556, type = "UGSB" },
        ["SOSED"] = { lat = 42.109722222, lon = 41.004166667, type = "ENRT" },
        ["FF12"] = { lat = 28.521944444, lon = -16.460166667, type = "GCXO" },
        ["SB102"] = { lat = 41.738333333, lon = 41.962777778, type = "UGSB" },
        ["SB200"] = { lat = 41.638888889, lon = 41.555277778, type = "UGSB" },
        ["OFFIX"] = { lat = 41.8, lon = 41.476388889, type = "UGSB" },
        ["CF12"] = { lat = 28.552194444, lon = -16.551805556, type = "GCXO" },
        ["SB202"] = { lat = 41.999166667, lon = 42.6125, type = "UGSB" },
        ["DIOMI"] = { lat = 41.791388889, lon = 41.319444444, type = "UGSB" },
        ["SB104"] = { lat = 41.765277778, lon = 41.753333333, type = "UGSB" },
        ["SB103"] = { lat = 41.749722222, lon = 41.875, type = "UGSB" },
        ["ODILI"] = { lat = 41.721388889, lon = 42.094444444, type = "ENRT" },
        ["PORZA"] = { lat = 41.952222222, lon = 40.827222222, type = "ENRT" },
        ["SARPI"] = { lat = 41.548888889, lon = 41.449722222, type = "ENRT" },
        ["FI12"] = { lat = 24.350108333, lon = 9.363047222, type = "DAAJ" },
        ["MA12"] = { lat = -18.090808333, lon = 25.818058333, type = "FVFA" },
        ["UMROS"] = { lat = 41.736916667, lon = 41.40375, type = "UGSB" },
        ["MQ12"] = { lat = 41.639005556, lon = 41.554216667, type = "UGSB" },
        ["FIBBE"] = { lat = 42.009444444, lon = 43.328611111, type = "ENRT" },
        ["SB101"] = { lat = 41.781944444, lon = 41.538611111, type = "UGSB" },
        ["ROLIN"] = { lat = 41.799166667, lon = 40.656388889, type = "ENRT" },
        ["KUSSA"] = { lat = 41.9675, lon = 41.800277778, type = "ENRT" },
        ["CI12"] = { lat = 24.378861111, lon = 9.318177778, type = "DAAJ" },
    },

    -- Данные ВПП
    Runways = {
        ["RW12"] = {
            heading = 120,
            length = 240.0,
            width = 0,
            threshold = { lat = 41.61703333333333, lon = 41.588886111111115 },
            end = { lat = 41.59728388796359, lon = 41.634641878463746 }
        },
        ["RW30"] = {
            heading = 300,
            length = -240.0,
            width = 0,
            threshold = { lat = 41.60229722222223, lon = 41.61156666666667 },
            end = { lat = 41.582547776852486, lon = 41.657311983460254 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BARUS1"] = {
            name = "BARUS1",
            runway = "RW30",
            waypoints = {
                { name = "SB200", type = "P" },
                { name = "TUZZA", type = "E" },
                { name = "SB202", type = "P" },
                { name = "BARUS", type = "E", altitude_min = 13000 },
            }
        },
        ["FIBBE1"] = {
            name = "FIBBE1",
            runway = "RW30",
            waypoints = {
                { name = "SB200", type = "P" },
                { name = "TUZZA", type = "E" },
                { name = "SB202", type = "P" },
                { name = "FIBBE", type = "E", altitude_min = 13000 },
            }
        },
        ["IZERO1"] = {
            name = "IZERO1",
            runway = "RW30",
            waypoints = {
                { name = "SB200", type = "P" },
                { name = "IZERO", type = "E", altitude_min = 7000 },
            }
        },
        ["PORZA1"] = {
            name = "PORZA1",
            runway = "RW30",
            waypoints = {
                { name = "SB200", type = "P" },
                { name = "SB201", type = "P" },
                { name = "PORZA", type = "E", altitude_min = 9000 },
            }
        },
        ["TUZA1D"] = {
            name = "TUZA1D",
            runway = "RW30",
            waypoints = {
                { name = "SB200", type = "P" },
                { name = "TUZZA", type = "E", altitude_min = 7000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["KUSA1A"] = {
            name = "KUSA1A",
            runway = "RW12",
            waypoints = {
                { name = "KUSSA", type = "UG", altitude_min = 7000 },
                { name = "OFFIX", type = "UG", altitude_min = 2000, speed = 220.0 },
            }
        },
        ["ODILI1"] = {
            name = "ODILI1",
            runway = "RW12",
            waypoints = {
                { name = "ODILI", type = "UG", altitude_min = 13000 },
                { name = "SB102", type = "UG", altitude_min = 11000 },
                { name = "SB103", type = "UG", altitude_min = 9000 },
                { name = "SB104", type = "UG", altitude_min = 7000 },
                { name = "OFFIX", type = "UG", altitude_min = 2000, speed = 220.0 },
            }
        },
        ["ROLIN1"] = {
            name = "ROLIN1",
            runway = "RW12",
            waypoints = {
                { name = "ROLIN", type = "UG", altitude_min = 9000 },
                { name = "DIOMI", type = "UG", altitude_min = 2000, speed = 220.0 },
            }
        },
        ["SARPI1"] = {
            name = "SARPI1",
            runway = "RW12",
            waypoints = {
                { name = "SARPI", type = "LT", altitude_min = 9000 },
                { name = "SB100", type = "UG", altitude_min = 7000 },
                { name = "SB101", type = "UG", altitude_min = 4000 },
                { name = "SB101", type = "UG", altitude_min = 2000 },
            }
        },
        ["SOSED1"] = {
            name = "SOSED1",
            runway = "RW12",
            waypoints = {
                { name = "SOSED", type = "UG", altitude_min = 9000 },
                { name = "DIOMI", type = "UG", altitude_min = 2000, speed = 220.0 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["L12-Y"] = {
            name = "L12-Y",
            type = "L",
            runway = "L12-Y",
            waypoints = {
                { name = "CI12", transition = "", type = "UG", altitude_min = 2000 },
                { name = "FI12", transition = "", type = "UG", altitude_min = 2000 },
                { name = "MA12", transition = "", type = "UG" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "", transition = "", type = "", speed = 190.0 },
            }
        },
        ["L12-Z"] = {
            name = "L12-Z",
            type = "A",
            runway = "L12-Z",
            waypoints = {
                { name = "DIOMI", transition = "DIOMI", type = "UG", altitude_min = 2000, speed = 220.0 },
                { name = "UMROS", transition = "DIOMI", type = "UG", altitude_min = 2000, speed = 200.0 },
                { name = "OFFIX", transition = "OFFIX", type = "UG", altitude_min = 2000, speed = 220.0 },
                { name = "UMROS", transition = "OFFIX", type = "UG", altitude_min = 2000, speed = 200.0 },
                { name = "UMROS", transition = "", type = "UG", altitude_min = 2000, speed = 200.0 },
                { name = "FI12", transition = "", type = "UG", altitude_min = 2000 },
                { name = "MA12", transition = "", type = "UG" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "", transition = "", type = "", speed = 190.0 },
            }
        },
        ["Q12"] = {
            name = "Q12",
            type = "Q",
            runway = "Q12",
            waypoints = {
                { name = "CF12", transition = "", type = "UG", altitude_min = 2000 },
                { name = "FF12", transition = "", type = "UG", altitude_min = 2000 },
                { name = "MQ12", transition = "", type = "UG" },
                { name = "", transition = "", type = "", altitude_min = 800 },
                { name = "", transition = "", type = "", speed = 190.0 },
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
