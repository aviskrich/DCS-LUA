local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "UGKO",
        Name = "UGKO Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["28VOR"] = { lat = -4.427969444, lon = 15.379361111, type = "FZAA" },
        ["CD07"] = { lat = 35.570188889, lon = -0.777227778, type = "DAOO" },
        ["CF25"] = { lat = 62.590358333, lon = 114.218994444, type = "UERR" },
        ["KO103"] = { lat = 42.070833333, lon = 42.445833333, type = "UGKO" },
        ["BASKA"] = { lat = 42.583055556, lon = 43.448611111, type = "ENRT" },
        ["KO202"] = { lat = 42.205, lon = 42.71, type = "UGKO" },
        ["TUZZA"] = { lat = 41.88, lon = 41.935, type = "ENRT" },
        ["KO100"] = { lat = 42.398333333, lon = 42.937222222, type = "UGKO" },
        ["NEZAS"] = { lat = 42.301944444, lon = 42.674722222, type = "UGKO" },
        ["OQLES"] = { lat = 42.132777778, lon = 42.134166667, type = "UGKO" },
        ["FD07"] = { lat = 35.579997222, lon = -0.749030556, type = "DAOO" },
        ["KO107"] = { lat = 42.205, lon = 42.71, type = "UGKO" },
        ["IKSEQ"] = { lat = 42.043611111, lon = 42.270555556, type = "UGKO" },
        ["LANNU"] = { lat = 42.238611111, lon = 42.235, type = "UGKO" },
        ["24VOR"] = { lat = -20.401175, lon = 57.624788889, type = "FIMP" },
        ["KO108"] = { lat = 41.951944444, lon = 41.991388889, type = "UGKO" },
        ["FD25"] = { lat = 35.073477778, lon = -1.293394444, type = "DAON" },
        ["RW25"] = { lat = 13.445891667, lon = -89.041872222, type = "MSLP" },
        ["FF25"] = { lat = 28.084472222, lon = -16.457444444, type = "GCTS" },
        ["KO104"] = { lat = 42.114444444, lon = 42.73, type = "UGKO" },
        ["20LOC"] = { lat = -20.409411111, lon = 57.640383333, type = "FIMP" },
        ["RANZO"] = { lat = 42.223055556, lon = 43.045555556, type = "UGKO" },
        ["KADZE"] = { lat = 42.306111111, lon = 41.640277778, type = "ENRT" },
        ["KO102"] = { lat = 42.148222222, lon = 42.255722222, type = "UGKO" },
        ["DER07"] = { lat = 46.790194444, lon = 23.696461111, type = "LRCL" },
        ["KO201"] = { lat = 42.139722222, lon = 42.189166667, type = "UGKO" },
        ["DER25"] = { lat = 46.785147222, lon = 23.674058333, type = "LRCL" },
        ["KTS"] = { lat = -9.683333333, lon = 143.45, type = "ENRT" },
        ["18LOC"] = { lat = 42.183638889, lon = 42.537366667, type = "UGKO" },
        ["CD25"] = { lat = 28.126194444, lon = -16.337472222, type = "GCTS" },
        ["KO105"] = { lat = 42.380833333, lon = 43.350833333, type = "UGKO" },
        ["VIZRO"] = { lat = 42.119166667, lon = 43.305277778, type = "ENRT" },
        ["KO200"] = { lat = 42.097777778, lon = 42.485277778, type = "UGKO" },
        ["LAGGI"] = { lat = 42.213055556, lon = 42.858333333, type = "UGKO" },
        ["RW07"] = { lat = 13.435988889, lon = -89.069633333, type = "MSLP" },
        ["KO101"] = { lat = 42.270555556, lon = 42.963888889, type = "UGKO" },
        ["FF07"] = { lat = 28.008666667, lon = -16.675277778, type = "GCTS" },
        ["EMBUS"] = { lat = 42.235, lon = 43.280555556, type = "ENRT" },
        ["KO203"] = { lat = 42.103888889, lon = 43.032777778, type = "UGKO" },
        ["KUSSA"] = { lat = 41.9675, lon = 41.800277778, type = "ENRT" },
        ["MAQQO"] = { lat = 42.075555556, lon = 41.695555556, type = "ENRT" },
        ["CF07"] = { lat = 42.519730556, lon = 76.387911111, type = "UCFL" },
    },

    -- Данные ВПП
    Runways = {
        ["RW07"] = {
            heading = 70,
            length = 300.0,
            width = 0,
            threshold = { lat = 42.17495833333333, lon = 42.46778888888889 },
            end = { lat = 42.19184510367323, lon = 42.530393312962424 }
        },
        ["RW25"] = {
            heading = 250,
            length = -300.0,
            width = 0,
            threshold = { lat = 42.17868611111111, lon = 42.497619444444446 },
            end = { lat = 42.195572881451014, lon = 42.56022755894934 }
        },
    },

    -- Процедуры SID
    SID = {
        ["KADZ1D"] = {
            name = "KADZ1D",
            runway = "RW07",
            waypoints = {
                { name = "DER07", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "KADZE", type = "E", altitude_min = 9000 },
            }
        },
        ["KADZ1E"] = {
            name = "KADZ1E",
            runway = "RW25",
            waypoints = {
                { name = "DER25", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "KADZE", type = "E", altitude_min = 9000 },
            }
        },
        ["KADZ1F"] = {
            name = "KADZ1F",
            runway = "RW07",
            waypoints = {
                { name = "DER07", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "KO200", type = "P", speed = 240.0 },
                { name = "KADZE", type = "E", altitude_min = 9000 },
            }
        },
        ["KADZ1G"] = {
            name = "KADZ1G",
            runway = "RW07",
            waypoints = {
                { name = "DER07", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "KTS", type = "D", speed = 280.0 },
                { name = "KADZE", type = "E", altitude_min = 9000 },
            }
        },
        ["KUSA1D"] = {
            name = "KUSA1D",
            runway = "RW07",
            waypoints = {
                { name = "DER07", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "KO200", type = "P", speed = 240.0 },
                { name = "KUSSA", type = "E", altitude_min = 7000 },
            }
        },
        ["KUSA1E"] = {
            name = "KUSA1E",
            runway = "RW25",
            waypoints = {
                { name = "KO201", type = "P" },
                { name = "KUSSA", type = "E", altitude_min = 7000 },
            }
        },
        ["KUSA1G"] = {
            name = "KUSA1G",
            runway = "RW07",
            waypoints = {
                { name = "DER07", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "KTS", type = "D", speed = 280.0 },
                { name = "KUSSA", type = "E", altitude_min = 7000 },
            }
        },
        ["VIZR1D"] = {
            name = "VIZR1D",
            runway = "RW07",
            waypoints = {
                { name = "DER07", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "VIZRO", type = "E", altitude_min = 9000 },
            }
        },
        ["VIZR1E"] = {
            name = "VIZR1E",
            runway = "RW25",
            waypoints = {
                { name = "DER25", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "KO202", type = "P" },
                { name = "KO203", type = "P" },
                { name = "VIZRO", type = "E", altitude_min = 9000 },
            }
        },
        ["VIZR1G"] = {
            name = "VIZR1G",
            runway = "RW07",
            waypoints = {
                { name = "DER07", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "VIZRO", type = "E", altitude_min = 9000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BASK1A"] = {
            name = "BASK1A",
            runway = "RW07",
            waypoints = {
                { name = "BASKA", type = "UG", altitude_min = 16000 },
                { name = "KO100", type = "UG", altitude_min = 11000 },
                { name = "NEZAS", type = "UG", altitude_min = 7000 },
                { name = "LANNU", type = "UG", altitude_min = 3500, speed = 230.0 },
            }
        },
        ["BASK1B"] = {
            name = "BASK1B",
            runway = "RW25",
            waypoints = {
                { name = "BASKA", type = "UG", altitude_min = 16000 },
                { name = "KO105", type = "UG", altitude_min = 11000 },
                { name = "EMBUS", type = "UG", altitude_min = 9000 },
                { name = "RANZO", type = "UG", altitude_min = 7000 },
            }
        },
        ["EMBU1A"] = {
            name = "EMBU1A",
            runway = "RW07",
            waypoints = {
                { name = "EMBUS", type = "UG", altitude_min = 9000 },
                { name = "KO101", type = "UG", altitude_min = 9000 },
                { name = "NEZAS", type = "UG", altitude_min = 7000 },
                { name = "LANNU", type = "UG", altitude_min = 3500, speed = 230.0 },
            }
        },
        ["EMBU1B"] = {
            name = "EMBU1B",
            runway = "RW25",
            waypoints = {
                { name = "EMBUS", type = "UG", altitude_min = 9000 },
                { name = "RANZO", type = "UG", altitude_min = 7000 },
            }
        },
        ["MAQO1A"] = {
            name = "MAQO1A",
            runway = "RW07",
            waypoints = {
                { name = "MAQQO", type = "UG", altitude_min = 9000 },
                { name = "OQLES", type = "UG", altitude_min = 3500, speed = 230.0 },
            }
        },
        ["MAQO1B"] = {
            name = "MAQO1B",
            runway = "RW25",
            waypoints = {
                { name = "MAQQO", type = "UG", altitude_min = 9000 },
                { name = "IKSEQ", type = "UG", altitude_min = 7000 },
            }
        },
        ["TUZA1A"] = {
            name = "TUZA1A",
            runway = "RW07",
            waypoints = {
                { name = "TUZZA", type = "UG", altitude_min = 7000 },
                { name = "KO108", type = "UG", altitude_min = 5000 },
                { name = "OQLES", type = "UG", altitude_min = 3500, speed = 230.0 },
            }
        },
        ["TUZA1B"] = {
            name = "TUZA1B",
            runway = "RW25",
            waypoints = {
                { name = "TUZZA", type = "UG", altitude_min = 7000 },
                { name = "IKSEQ", type = "UG", altitude_min = 7000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D07"] = {
            name = "D07",
            type = "A",
            runway = "D07",
            waypoints = {
                { name = "KTS", transition = "KTS", type = "UG", altitude_min = 5000 },
                { name = "KTS", transition = "KTS", type = "UG", altitude_min = 2500 },
                { name = "CD07", transition = "KTS", type = "UG", altitude_min = 2500 },
                { name = "CD07", transition = "", type = "UG", altitude_min = 2500 },
                { name = "FD07", transition = "", type = "UG", altitude_min = 2000 },
                { name = "28VOR", transition = "", type = "UG", altitude_min = 841 },
                { name = "RW07", transition = "", type = "UG" },
                { name = "RW07", transition = "", type = "UG", altitude_min = 3500 },
                { name = "KTS", transition = "", type = "UG", speed = 220.0 },
            }
        },
        ["D25"] = {
            name = "D25",
            type = "A",
            runway = "D25",
            waypoints = {
                { name = "KTS", transition = "KTS", type = "UG", altitude_min = 5000 },
                { name = "KTS", transition = "KTS", type = "UG", altitude_min = 2500 },
                { name = "CD25", transition = "KTS", type = "UG", altitude_min = 2500 },
                { name = "CD25", transition = "", type = "UG", altitude_min = 2500 },
                { name = "FD25", transition = "", type = "UG", altitude_min = 2000 },
                { name = "24VOR", transition = "", type = "UG", altitude_min = 785 },
                { name = "RW25", transition = "", type = "UG" },
                { name = "RW25", transition = "", type = "UG", altitude_min = 3500 },
                { name = "KTS", transition = "", type = "UG", speed = 220.0 },
            }
        },
        ["I07-Y"] = {
            name = "I07-Y",
            type = "A",
            runway = "I07-Y",
            waypoints = {
                { name = "KTS", transition = "KTS", type = "UG", altitude_min = 5000 },
                { name = "KTS", transition = "KTS", type = "UG", altitude_min = 2500 },
                { name = "CF07", transition = "KTS", type = "UG", altitude_min = 2500, speed = 220.0 },
                { name = "CF07", transition = "", type = "UG" },
                { name = "FF07", transition = "", type = "UG" },
                { name = "RW07", transition = "", type = "UG" },
                { name = "RW07", transition = "", type = "UG", altitude_min = 3500 },
                { name = "KTS", transition = "", type = "UG", speed = 220.0 },
            }
        },
        ["I07-Z"] = {
            name = "I07-Z",
            type = "A",
            runway = "I07-Z",
            waypoints = {
                { name = "LANNU", transition = "LANNU", type = "UG", altitude_min = 3500, speed = 230.0 },
                { name = "KO102", transition = "LANNU", type = "UG", altitude_min = 2500, speed = 200.0 },
                { name = "OQLES", transition = "OQLES", type = "UG", altitude_min = 3500, speed = 230.0 },
                { name = "KO102", transition = "OQLES", type = "UG", altitude_min = 2500, speed = 200.0 },
                { name = "KO102", transition = "", type = "UG", speed = 200.0 },
                { name = "FF07", transition = "", type = "UG" },
                { name = "RW07", transition = "", type = "UG" },
                { name = "RW07", transition = "", type = "UG", altitude_min = 3500 },
                { name = "KTS", transition = "", type = "UG", speed = 220.0 },
            }
        },
        ["I25-Y"] = {
            name = "I25-Y",
            type = "A",
            runway = "I25-Y",
            waypoints = {
                { name = "KTS", transition = "KTS", type = "UG", altitude_min = 5000 },
                { name = "KTS", transition = "KTS", type = "UG", altitude_min = 2500 },
                { name = "CF25", transition = "KTS", type = "UG", altitude_min = 2500, speed = 220.0 },
                { name = "CF25", transition = "", type = "UG" },
                { name = "FF25", transition = "", type = "UG" },
                { name = "RW25", transition = "", type = "UG" },
                { name = "RW25", transition = "", type = "UG", altitude_min = 3500 },
                { name = "KTS", transition = "", type = "UG" },
            }
        },
        ["I25-Z"] = {
            name = "I25-Z",
            type = "A",
            runway = "I25-Z",
            waypoints = {
                { name = "IKSEQ", transition = "IKSEQ", type = "UG", altitude_min = 7000 },
                { name = "KO103", transition = "IKSEQ", type = "UG", altitude_min = 6000 },
                { name = "KO104", transition = "IKSEQ", type = "UG", altitude_min = 3500, speed = 230.0 },
                { name = "KO107", transition = "IKSEQ", type = "UG", altitude_min = 2500, speed = 200.0 },
                { name = "RANZO", transition = "RANZO", type = "UG", altitude_min = 7000 },
                { name = "LAGGI", transition = "RANZO", type = "UG", altitude_min = 4500 },
                { name = "KO107", transition = "RANZO", type = "UG", altitude_min = 2500, speed = 200.0 },
                { name = "KO107", transition = "", type = "UG", speed = 200.0 },
                { name = "FF25", transition = "", type = "UG" },
                { name = "RW25", transition = "", type = "UG" },
                { name = "RW25", transition = "", type = "UG", altitude_min = 3500 },
                { name = "KTS", transition = "", type = "UG" },
            }
        },
        ["L07-Y"] = {
            name = "L07-Y",
            type = "A",
            runway = "L07-Y",
            waypoints = {
                { name = "KTS", transition = "KTS", type = "UG", altitude_min = 5000 },
                { name = "KTS", transition = "KTS", type = "UG", altitude_min = 2500 },
                { name = "CF07", transition = "KTS", type = "UG", altitude_min = 2500, speed = 220.0 },
                { name = "CF07", transition = "", type = "UG", altitude_min = 2500 },
                { name = "FF07", transition = "", type = "UG", altitude_min = 2000 },
                { name = "20LOC", transition = "", type = "UG", altitude_min = 831 },
                { name = "RW07", transition = "", type = "UG" },
                { name = "RW07", transition = "", type = "UG", altitude_min = 3500 },
                { name = "KTS", transition = "", type = "UG", speed = 220.0 },
            }
        },
        ["L07-Z"] = {
            name = "L07-Z",
            type = "A",
            runway = "L07-Z",
            waypoints = {
                { name = "LANNU", transition = "LANNU", type = "UG", altitude_min = 3500, speed = 230.0 },
                { name = "KO102", transition = "LANNU", type = "UG", altitude_min = 2500, speed = 200.0 },
                { name = "OQLES", transition = "OQLES", type = "UG", altitude_min = 3500, speed = 230.0 },
                { name = "KO102", transition = "OQLES", type = "UG", altitude_min = 2500, speed = 200.0 },
                { name = "KO102", transition = "", type = "UG", altitude_min = 2500, speed = 200.0 },
                { name = "FF07", transition = "", type = "UG", altitude_min = 2000 },
                { name = "20LOC", transition = "", type = "UG", altitude_min = 831 },
                { name = "RW07", transition = "", type = "UG" },
                { name = "RW07", transition = "", type = "UG", altitude_min = 3500 },
                { name = "KTS", transition = "", type = "UG", speed = 220.0 },
            }
        },
        ["L25-Y"] = {
            name = "L25-Y",
            type = "A",
            runway = "L25-Y",
            waypoints = {
                { name = "KTS", transition = "KTS", type = "UG", altitude_min = 5000 },
                { name = "KTS", transition = "KTS", type = "UG", altitude_min = 2500 },
                { name = "CF25", transition = "KTS", type = "UG", altitude_min = 2500, speed = 220.0 },
                { name = "CF25", transition = "", type = "UG", altitude_min = 2500 },
                { name = "FF25", transition = "", type = "UG", altitude_min = 2000 },
                { name = "18LOC", transition = "", type = "UG", altitude_min = 785 },
                { name = "RW25", transition = "", type = "UG" },
                { name = "RW25", transition = "", type = "UG", altitude_min = 3500 },
                { name = "KTS", transition = "", type = "UG" },
            }
        },
        ["L25-Z"] = {
            name = "L25-Z",
            type = "A",
            runway = "L25-Z",
            waypoints = {
                { name = "IKSEQ", transition = "IKSEQ", type = "UG", altitude_min = 7000 },
                { name = "KO103", transition = "IKSEQ", type = "UG", altitude_min = 6000 },
                { name = "KO104", transition = "IKSEQ", type = "UG", altitude_min = 3500, speed = 230.0 },
                { name = "KO107", transition = "IKSEQ", type = "UG", altitude_min = 2500, speed = 200.0 },
                { name = "RANZO", transition = "RANZO", type = "UG", altitude_min = 7000 },
                { name = "LAGGI", transition = "RANZO", type = "UG", altitude_min = 4500 },
                { name = "KO107", transition = "RANZO", type = "UG", altitude_min = 2500, speed = 200.0 },
                { name = "KO107", transition = "", type = "UG", altitude_min = 2500, speed = 200.0 },
                { name = "FF25", transition = "", type = "UG", altitude_min = 2000 },
                { name = "18LOC", transition = "", type = "UG", altitude_min = 785 },
                { name = "RW25", transition = "", type = "UG" },
                { name = "RW25", transition = "", type = "UG", altitude_min = 3500 },
                { name = "KTS", transition = "", type = "UG" },
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
