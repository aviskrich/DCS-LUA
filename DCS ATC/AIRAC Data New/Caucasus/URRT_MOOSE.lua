local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "URRT",
        Name = "URRT Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["D118I"] = { lat = 54.503, lon = 18.7079, type = "EPOK" },
        ["RT286"] = { lat = 47.204938889, lon = 38.810469444, type = "URRT" },
        ["RT105"] = { lat = 47.244422222, lon = 38.580488889, type = "URRT" },
        ["RT381"] = { lat = 47.221822222, lon = 38.712188889, type = "URRT" },
        ["D318F"] = { lat = 50.318102778, lon = 127.557955556, type = "UHBB" },
        ["D263H"] = { lat = 43.224733333, lon = 27.632716667, type = "LBWN" },
        ["RT103"] = { lat = 47.142711111, lon = 38.669322222, type = "URRT" },
        ["D159G"] = { lat = 47.093888889, lon = 38.821944444, type = "URRT" },
        ["D085I"] = { lat = 36.983258333, lon = 9.070686111, type = "DTKA" },
        ["KENEN"] = { lat = 46.879722222, lon = 38.755, type = "ENRT" },
        ["D308H"] = { lat = 33.5909, lon = 6.665983333, type = "DAUO" },
        ["D234F"] = { lat = 48.456163889, lon = 135.093880556, type = "UHHH" },
        ["RT106"] = { lat = 47.223969444, lon = 38.699627778, type = "URRT" },
        ["RT107"] = { lat = 47.188472222, lon = 38.90595, type = "URRT" },
        ["FF10"] = { lat = 31.617222222, lon = -8.152777778, type = "GMMX" },
        ["PESOD"] = { lat = 47.439166667, lon = 39.035555556, type = "URRT" },
        ["RT201"] = { lat = 47.175191667, lon = 38.982725, type = "URRT" },
        ["RW10"] = { lat = 26.194661111, lon = 85.90615, type = "VEDH" },
        ["RT281"] = { lat = 47.233469444, lon = 39.144908333, type = "URRT" },
        ["FF28"] = { lat = 51.996388889, lon = 19.241666667, type = "EPLY" },
        ["D108I"] = { lat = 67.346111111, lon = 86.961944444, type = "UOII" },
        ["D074J"] = { lat = 47.216944444, lon = 39.107777778, type = "URRT" },
        ["MN10V"] = { lat = 47.206105556, lon = 38.803816667, type = "URRT" },
        ["D249H"] = { lat = 47.178744444, lon = 38.586147222, type = "URRT" },
        ["D290H"] = { lat = 47.269166667, lon = 38.612777778, type = "URRT" },
        ["RT282"] = { lat = 47.152341667, lon = 39.114788889, type = "URRT" },
        ["D238G"] = { lat = 56.465825, lon = 20.885616667, type = "EVLA" },
        ["D099M"] = { lat = 47.133333333, lon = 39.193333333, type = "URRT" },
        ["OKMAN"] = { lat = 47.071666667, lon = 39.291666667, type = "ENRT" },
        ["RT104"] = { lat = 47.163286111, lon = 38.550411111, type = "URRT" },
        ["RT284"] = { lat = 47.086861111, lon = 38.966597222, type = "URRT" },
        ["RT283"] = { lat = 47.082544444, lon = 39.088955556, type = "URRT" },
        ["RT101"] = { lat = 47.325547222, lon = 38.610661111, type = "URRT" },
        ["D217C"] = { lat = 47.153052778, lon = 38.817969444, type = "URRT" },
        ["TAGNG"] = { lat = 47.195, lon = 38.853888889, type = "URRT" },
        ["RT102"] = { lat = 47.084344444, lon = 38.757172222, type = "URRT" },
        ["RW28"] = { lat = 26.191502778, lon = 85.930916667, type = "VEDH" },
        ["RT287"] = { lat = 47.172916667, lon = 38.995855556, type = "URRT" },
        ["D128H"] = { lat = 47.092222222, lon = 39.020277778, type = "URRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW10"] = {
            heading = 100,
            length = 0,
            width = 0,
            threshold = { lat = 47.20127777777778, lon = 38.83177777777778 },
            end = { lat = 47.20127777777778, lon = 38.83177777777778 }
        },
        ["RW28"] = {
            heading = 280,
            length = 0,
            width = 0,
            threshold = { lat = 47.19577777777778, lon = 38.86383333333333 },
            end = { lat = 47.19577777777778, lon = 38.86383333333333 }
        },
    },

    -- Процедуры SID
    SID = {
        ["KENE5A"] = {
            name = "KENE5A",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 1110, speed = 225.0 },
                { name = "", type = "" },
                { name = "KENEN", type = "E", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["KENE5B"] = {
            name = "KENE5B",
            runway = "RW10",
            waypoints = {
                { name = "RT201", type = "P", altitude_min = 1110 },
                { name = "KENEN", type = "E", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["KENE5C"] = {
            name = "KENE5C",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 1110, speed = 225.0 },
                { name = "", type = "" },
                { name = "KENEN", type = "E", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["KENE5D"] = {
            name = "KENE5D",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 1050, speed = 225.0 },
                { name = "", type = "" },
                { name = "KENEN", type = "E", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["KENE5E"] = {
            name = "KENE5E",
            runway = "RW28",
            waypoints = {
                { name = "RT381", type = "P", altitude_min = 1050 },
                { name = "KENEN", type = "E", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["KENE5F"] = {
            name = "KENE5F",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 1050, speed = 225.0 },
                { name = "", type = "" },
                { name = "KENEN", type = "E", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["OKMA5A"] = {
            name = "OKMA5A",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 1110, speed = 225.0 },
                { name = "", type = "" },
                { name = "OKMAN", type = "E", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["OKMA5B"] = {
            name = "OKMA5B",
            runway = "RW10",
            waypoints = {
                { name = "RT201", type = "P", altitude_min = 1110 },
                { name = "OKMAN", type = "E", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["OKMA5C"] = {
            name = "OKMA5C",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 1110, speed = 225.0 },
                { name = "", type = "" },
                { name = "OKMAN", type = "E", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["OKMA5D"] = {
            name = "OKMA5D",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 1050, speed = 225.0 },
                { name = "", type = "" },
                { name = "OKMAN", type = "E", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["OKMA5E"] = {
            name = "OKMA5E",
            runway = "RW28",
            waypoints = {
                { name = "RT381", type = "P", altitude_min = 1050 },
                { name = "OKMAN", type = "E", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["OKMA5F"] = {
            name = "OKMA5F",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 1050, speed = 225.0 },
                { name = "", type = "" },
                { name = "OKMAN", type = "E", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["SB5A"] = {
            name = "SB5A",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 1110, speed = 225.0 },
                { name = "", type = "" },
                { name = "PESOD", type = "P", altitude_min = 5000, altitude_max = 8000 },
                { name = "SB", type = "D", altitude_min = 7000 },
            }
        },
        ["SB5B"] = {
            name = "SB5B",
            runway = "RW10",
            waypoints = {
                { name = "RT201", type = "P", altitude_min = 1110 },
                { name = "PESOD", type = "P", altitude_min = 5000, altitude_max = 8000 },
                { name = "SB", type = "D", altitude_min = 7000 },
            }
        },
        ["SB5C"] = {
            name = "SB5C",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 1110, speed = 225.0 },
                { name = "", type = "" },
                { name = "PESOD", type = "P", altitude_min = 5000, altitude_max = 8000 },
                { name = "SB", type = "D", altitude_min = 7000 },
            }
        },
        ["SB5D"] = {
            name = "SB5D",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 1050, speed = 225.0 },
                { name = "MS", type = "P" },
                { name = "PESOD", type = "P", altitude_min = 5000, altitude_max = 8000 },
                { name = "SB", type = "D", altitude_min = 7000 },
            }
        },
        ["SB5E"] = {
            name = "SB5E",
            runway = "RW28",
            waypoints = {
                { name = "RT381", type = "P", altitude_min = 1050 },
                { name = "PESOD", type = "P", altitude_min = 5000, altitude_max = 8000 },
                { name = "SB", type = "D", altitude_min = 7000 },
            }
        },
        ["SB5F"] = {
            name = "SB5F",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 1050, speed = 225.0 },
                { name = "TAGNG", type = "P" },
                { name = "PESOD", type = "P", altitude_min = 5000, altitude_max = 8000 },
                { name = "SB", type = "D", altitude_min = 7000 },
            }
        },
        ["SB5G"] = {
            name = "SB5G",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 1050, speed = 225.0 },
                { name = "", type = "" },
                { name = "PESOD", type = "P", altitude_min = 5000, altitude_max = 8000 },
                { name = "SB", type = "D", altitude_min = 7000 },
            }
        },
        ["SB5H"] = {
            name = "SB5H",
            runway = "RW28",
            waypoints = {
                { name = "RT381", type = "P", altitude_min = 1050 },
                { name = "PESOD", type = "P", altitude_min = 5000, altitude_max = 8000 },
                { name = "SB", type = "D", altitude_min = 7000 },
            }
        },
        ["SB5J"] = {
            name = "SB5J",
            runway = "RW28",
            waypoints = {
                { name = "", type = "", altitude_min = 1050, speed = 225.0 },
                { name = "", type = "" },
                { name = "PESOD", type = "P", altitude_min = 5000, altitude_max = 8000 },
                { name = "SB", type = "D", altitude_min = 7000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["KENE5K"] = {
            name = "KENE5K",
            runway = "RW10",
            waypoints = {
                { name = "KENEN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "UF", type = "UR", altitude_min = 1760 },
                { name = "D318F", type = "UR" },
                { name = "D308H", type = "UR" },
                { name = "D290H", type = "UR" },
                { name = "FF10", type = "UN" },
            }
        },
        ["KENE5L"] = {
            name = "KENE5L",
            runway = "RW10",
            waypoints = {
                { name = "KENEN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "D249H", type = "UR" },
                { name = "D263H", type = "UR" },
                { name = "FF10", type = "UN" },
            }
        },
        ["KENE5M"] = {
            name = "KENE5M",
            runway = "RW28",
            waypoints = {
                { name = "KENEN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "D118I", type = "UR" },
                { name = "D108I", type = "UR" },
                { name = "FF28", type = "UN" },
            }
        },
        ["KENE5P"] = {
            name = "KENE5P",
            runway = "RW10",
            waypoints = {
                { name = "KENEN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "RT102", type = "UR" },
                { name = "RT103", type = "UR" },
                { name = "RT104", type = "UR", altitude_min = 1760 },
            }
        },
        ["KENE5Q"] = {
            name = "KENE5Q",
            runway = "RW28",
            waypoints = {
                { name = "KENEN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "RT284", type = "UN", altitude_min = 1710 },
                { name = "RT283", type = "UN", altitude_min = 1710, speed = 215.0 },
            }
        },
        ["KENE5R"] = {
            name = "KENE5R",
            runway = "RW10",
            waypoints = {
                { name = "KENEN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "D159G", type = "UR" },
                { name = "D238G", type = "UR" },
                { name = "D263H", type = "UR" },
                { name = "FF10", type = "UN" },
            }
        },
        ["KENE5S"] = {
            name = "KENE5S",
            runway = "RW28",
            waypoints = {
                { name = "KENEN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "D118I", type = "UR" },
                { name = "D108I", type = "UR" },
                { name = "FF28", type = "UN" },
            }
        },
        ["OKMA5K"] = {
            name = "OKMA5K",
            runway = "RW10",
            waypoints = {
                { name = "OKMAN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "UF", type = "UR", altitude_min = 1760 },
                { name = "D234F", type = "UR" },
                { name = "D238G", type = "UR" },
                { name = "D263H", type = "UR" },
                { name = "FF10", type = "UN" },
            }
        },
        ["OKMA5L"] = {
            name = "OKMA5L",
            runway = "RW10",
            waypoints = {
                { name = "OKMAN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "D238G", type = "UR" },
                { name = "D263H", type = "UR" },
                { name = "FF10", type = "UN" },
            }
        },
        ["OKMA5M"] = {
            name = "OKMA5M",
            runway = "RW28",
            waypoints = {
                { name = "OKMAN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "D099M", type = "UR" },
                { name = "FF28", type = "UN" },
            }
        },
        ["OKMA5N"] = {
            name = "OKMA5N",
            runway = "RW28",
            waypoints = {
                { name = "OKMAN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "MS", type = "UR" },
                { name = "", type = "" },
                { name = "D128H", type = "UR" },
                { name = "D118I", type = "UR" },
                { name = "D108I", type = "UR" },
                { name = "FF28", type = "UN" },
            }
        },
        ["OKMA5P"] = {
            name = "OKMA5P",
            runway = "RW10",
            waypoints = {
                { name = "OKMAN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "RT103", type = "UR" },
                { name = "RT104", type = "UR", altitude_min = 1760 },
            }
        },
        ["OKMA5Q"] = {
            name = "OKMA5Q",
            runway = "RW28",
            waypoints = {
                { name = "OKMAN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "RT282", type = "UN", altitude_min = 1710 },
            }
        },
        ["OKMA5R"] = {
            name = "OKMA5R",
            runway = "RW10",
            waypoints = {
                { name = "OKMAN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "D238G", type = "UR" },
                { name = "D263H", type = "UR" },
                { name = "FF10", type = "UN" },
            }
        },
        ["OKMA5S"] = {
            name = "OKMA5S",
            runway = "RW28",
            waypoints = {
                { name = "OKMAN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "D099M", type = "UR" },
                { name = "FF28", type = "UN" },
            }
        },
        ["OKMA5T"] = {
            name = "OKMA5T",
            runway = "RW28",
            waypoints = {
                { name = "OKMAN", type = "UR", altitude_min = 5000, altitude_max = 6000 },
                { name = "MS", type = "UR" },
                { name = "D217C", type = "UR" },
                { name = "D128H", type = "UR" },
                { name = "D108I", type = "UR" },
                { name = "FF28", type = "UN" },
            }
        },
        ["SB5K"] = {
            name = "SB5K",
            runway = "RW10",
            waypoints = {
                { name = "SB", type = "UR", altitude_min = 7000 },
                { name = "PESOD", type = "UR", altitude_min = 5000, altitude_max = 8000 },
                { name = "UF", type = "UR", altitude_min = 1760 },
                { name = "D234F", type = "UR" },
                { name = "D238G", type = "UR" },
                { name = "D263H", type = "UR" },
                { name = "FF10", type = "UN" },
            }
        },
        ["SB5L"] = {
            name = "SB5L",
            runway = "RW10",
            waypoints = {
                { name = "SB", type = "UR", altitude_min = 7000 },
                { name = "PESOD", type = "UR", altitude_min = 5000, altitude_max = 8000 },
                { name = "D308H", type = "UR" },
                { name = "D290H", type = "UR" },
                { name = "FF10", type = "UN" },
            }
        },
        ["SB5M"] = {
            name = "SB5M",
            runway = "RW28",
            waypoints = {
                { name = "SB", type = "UR", altitude_min = 7000 },
                { name = "PESOD", type = "UR", altitude_min = 5000, altitude_max = 8000 },
                { name = "D074J", type = "UR" },
                { name = "D085I", type = "UR" },
                { name = "FF28", type = "UN" },
            }
        },
        ["SB5N"] = {
            name = "SB5N",
            runway = "RW28",
            waypoints = {
                { name = "SB", type = "UR", altitude_min = 7000 },
                { name = "PESOD", type = "UR", altitude_min = 5000, altitude_max = 8000 },
                { name = "MS", type = "UR" },
                { name = "D128H", type = "UR" },
                { name = "D118I", type = "UR" },
                { name = "D108I", type = "UR" },
                { name = "FF28", type = "UN" },
            }
        },
        ["SB5P"] = {
            name = "SB5P",
            runway = "RW10",
            waypoints = {
                { name = "SB", type = "UR", altitude_min = 7000 },
                { name = "PESOD", type = "UR", altitude_min = 5000, altitude_max = 8000 },
                { name = "RT101", type = "UR", altitude_min = 1760 },
            }
        },
        ["SB5Q"] = {
            name = "SB5Q",
            runway = "RW28",
            waypoints = {
                { name = "SB", type = "UR", altitude_min = 7000 },
                { name = "PESOD", type = "UR", altitude_min = 5000, altitude_max = 8000 },
                { name = "RT281", type = "UR", altitude_min = 1710 },
            }
        },
        ["SB5R"] = {
            name = "SB5R",
            runway = "RW10",
            waypoints = {
                { name = "SB", type = "UR", altitude_min = 7000 },
                { name = "PESOD", type = "UR", altitude_min = 5000, altitude_max = 8000 },
                { name = "D308H", type = "UR" },
                { name = "D290H", type = "UR" },
                { name = "FF10", type = "UN" },
            }
        },
        ["SB5S"] = {
            name = "SB5S",
            runway = "RW28",
            waypoints = {
                { name = "SB", type = "UR", altitude_min = 7000 },
                { name = "PESOD", type = "UR", altitude_min = 5000, altitude_max = 8000 },
                { name = "D074J", type = "UR" },
                { name = "D085I", type = "UR" },
                { name = "FF28", type = "UN" },
            }
        },
        ["SB5T"] = {
            name = "SB5T",
            runway = "RW28",
            waypoints = {
                { name = "SB", type = "UR", altitude_min = 7000 },
                { name = "PESOD", type = "UR", altitude_min = 5000, altitude_max = 8000 },
                { name = "MS", type = "UR" },
                { name = "D128H", type = "UR" },
                { name = "D108I", type = "UR" },
                { name = "FF28", type = "UN" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["N10-V"] = {
            name = "N10-V",
            type = "N",
            runway = "N10-V",
            waypoints = {
                { name = "FF10", transition = "", type = "UN", speed = 225.0 },
                { name = "UF", transition = "", type = "UR" },
                { name = "MN10V", transition = "", type = "UN" },
                { name = "", transition = "", type = "", altitude_min = 780 },
                { name = "", transition = "", type = "", speed = 225.0 },
            }
        },
        ["N10-W"] = {
            name = "N10-W",
            type = "N",
            runway = "N10-W",
            waypoints = {
                { name = "FF10", transition = "", type = "UN", speed = 225.0 },
                { name = "U", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 780 },
                { name = "", transition = "", type = "", speed = 225.0 },
            }
        },
        ["N10-X"] = {
            name = "N10-X",
            type = "A",
            runway = "N10-X",
            waypoints = {
                { name = "UF", transition = "UF", type = "UR" },
                { name = "FF10", transition = "UF", type = "UN" },
                { name = "FF10", transition = "UF", type = "UN" },
                { name = "FF10", transition = "UF", type = "UN" },
                { name = "FF10", transition = "", type = "UN" },
                { name = "UF", transition = "", type = "UR" },
                { name = "U", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 780 },
                { name = "UF", transition = "", type = "UR" },
            }
        },
        ["N10-Y"] = {
            name = "N10-Y",
            type = "N",
            runway = "N10-Y",
            waypoints = {
                { name = "FF10", transition = "", type = "UN" },
                { name = "UF", transition = "", type = "UR" },
                { name = "U", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 780 },
                { name = "", transition = "", type = "" },
            }
        },
        ["N10-Z"] = {
            name = "N10-Z",
            type = "N",
            runway = "N10-Z",
            waypoints = {
                { name = "FF10", transition = "", type = "UN", speed = 225.0 },
                { name = "UF", transition = "", type = "UR" },
                { name = "U", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 780 },
                { name = "", transition = "", type = "", speed = 225.0 },
            }
        },
        ["N28-X"] = {
            name = "N28-X",
            type = "A",
            runway = "N28-X",
            waypoints = {
                { name = "MS", transition = "MS", type = "UR" },
                { name = "FF28", transition = "MS", type = "UN" },
                { name = "FF28", transition = "MS", type = "UN" },
                { name = "FF28", transition = "MS", type = "UN" },
                { name = "FF28", transition = "", type = "UN" },
                { name = "MS", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 730 },
                { name = "MS", transition = "", type = "UR" },
            }
        },
        ["N28-Y"] = {
            name = "N28-Y",
            type = "N",
            runway = "N28-Y",
            waypoints = {
                { name = "FF28", transition = "", type = "UN" },
                { name = "MS", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 730 },
                { name = "", transition = "", type = "" },
            }
        },
        ["N28-Z"] = {
            name = "N28-Z",
            type = "N",
            runway = "N28-Z",
            waypoints = {
                { name = "FF28", transition = "", type = "UN", speed = 225.0 },
                { name = "MS", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 730 },
                { name = "", transition = "", type = "", speed = 225.0 },
            }
        },
        ["R10"] = {
            name = "R10",
            type = "A",
            runway = "R10",
            waypoints = {
                { name = "RT101", transition = "RT101", type = "UR", altitude_min = 1760 },
                { name = "RT105", transition = "RT101", type = "UR", altitude_min = 1760 },
                { name = "RT104", transition = "RT104", type = "UR", altitude_min = 1760 },
                { name = "RT105", transition = "RT104", type = "UR", altitude_min = 1760 },
                { name = "RT105", transition = "", type = "UR", altitude_min = 1760 },
                { name = "RT106", transition = "", type = "UR" },
                { name = "RW10", transition = "", type = "UR" },
                { name = "RT107", transition = "", type = "UR", altitude_min = 780 },
                { name = "RT103", transition = "", type = "UR", altitude_min = 1760 },
                { name = "RT104", transition = "", type = "UR", altitude_min = 1760 },
            }
        },
        ["R28"] = {
            name = "R28",
            type = "A",
            runway = "R28",
            waypoints = {
                { name = "RT281", transition = "RT281", type = "UR", altitude_min = 1710 },
                { name = "RT282", transition = "RT281", type = "UN", altitude_min = 1710 },
                { name = "RT283", transition = "RT283", type = "UN", altitude_min = 1710, speed = 215.0 },
                { name = "RT282", transition = "RT283", type = "UN", altitude_min = 1710 },
                { name = "RT282", transition = "", type = "UN", altitude_min = 1710 },
                { name = "RT287", transition = "", type = "UR" },
                { name = "RW28", transition = "", type = "UR" },
                { name = "RT286", transition = "", type = "UN", altitude_min = 730 },
                { name = "RT284", transition = "", type = "UN", altitude_min = 1710 },
                { name = "RT283", transition = "", type = "UN", altitude_min = 1710, speed = 215.0 },
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
