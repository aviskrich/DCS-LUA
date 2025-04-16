local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "UGTB",
        Name = "UGTB Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["CF13R"] = { lat = 41.880944444, lon = 44.682166667, type = "UGTB" },
        ["UDVIN"] = { lat = 41.954805556, lon = 44.773027778, type = "UGTB" },
        ["ZAGOT"] = { lat = 41.785, lon = 44.136388889, type = "ENRT" },
        ["TB106"] = { lat = 49.377155556, lon = 16.221416667, type = "LKTB" },
        ["TB201"] = { lat = 41.861944444, lon = 44.928888889, type = "UGTB" },
        ["TB205"] = { lat = 49.055741667, lon = 16.69105, type = "LKTB" },
        ["DANQI"] = { lat = 41.936472222, lon = 44.61125, type = "UGTB" },
        ["TAVRO"] = { lat = 41.191388889, lon = 44.5025, type = "ENRT" },
        ["KUFAN"] = { lat = 41.955, lon = 46.285555556, type = "ENRT" },
        ["LAPTO"] = { lat = 42.631388889, lon = 44.188611111, type = "ENRT" },
        ["GEMNA"] = { lat = 41.526305556, lon = 45.250944444, type = "UGTB" },
        ["TB103"] = { lat = 49.143644444, lon = 16.782133333, type = "LKTB" },
        ["FF31L"] = { lat = 49.838472222, lon = -98.195975, type = "CYPG" },
        ["D296Q"] = { lat = 41.827111111, lon = 44.623222222, type = "UGTB" },
        ["GIMUR"] = { lat = 42.016666667, lon = 44.132222222, type = "ENRT" },
        ["CS13R"] = { lat = 41.881194444, lon = 44.683416667, type = "UGTB" },
        ["TISOT"] = { lat = 41.268055556, lon = 44.885833333, type = "ENRT" },
        ["FS13R"] = { lat = 41.79725, lon = 44.788722222, type = "UGTB" },
        ["51VOR"] = { lat = 41.609269444, lon = 45.025602778, type = "UGTB" },
        ["FS31L"] = { lat = 41.567333333, lon = 45.079722222, type = "UGTB" },
        ["TB202"] = { lat = 49.166344444, lon = 16.518672222, type = "LKTB" },
        ["CF31L"] = { lat = 41.518777778, lon = 45.140416667, type = "UGTB" },
        ["TB200"] = { lat = 49.156377778, lon = 16.635216667, type = "LKTB" },
        ["TB100"] = { lat = 41.7175, lon = 44.635833333, type = "UGTB" },
        ["41VOR"] = { lat = 59.244913889, lon = 24.120994444, type = "EEEI" },
        ["BAZIK"] = { lat = 41.461527778, lon = 45.05975, type = "UGTB" },
        ["CS31L"] = { lat = 41.507277778, lon = 45.156722222, type = "UGTB" },
        ["TB101"] = { lat = 49.146477778, lon = 16.749638889, type = "LKTB" },
        ["D150N"] = { lat = 41.461722222, lon = 45.064972222, type = "UGTB" },
        ["TB104"] = { lat = 41.404166667, lon = 44.979166667, type = "UGTB" },
        ["TB107"] = { lat = 41.893611111, lon = 44.886388889, type = "UGTB" },
        ["DISKA"] = { lat = 41.463888889, lon = 45.292777778, type = "ENRT" },
        ["PALLE"] = { lat = 41.476388889, lon = 44.323611111, type = "ENRT" },
        ["NATIP"] = { lat = 41.518777778, lon = 45.140416667, type = "UGTB" },
        ["TB102"] = { lat = 49.288711111, lon = 16.657777778, type = "LKTB" },
        ["NAMME"] = { lat = 41.885777778, lon = 44.676, type = "UGTB" },
        ["ML31L"] = { lat = 47.423941667, lon = 19.260811111, type = "LHBP" },
        ["TB105"] = { lat = 41.959444444, lon = 44.474722222, type = "UGTB" },
        ["LATVA"] = { lat = 41.816666667, lon = 44.579166667, type = "UGTB" },
        ["LAMUS"] = { lat = 41.544444444, lon = 45.523333333, type = "ENRT" },
        ["TB206"] = { lat = 41.592222222, lon = 44.6, type = "UGTB" },
        ["D150M"] = { lat = 4.1865, lon = 18.631916667, type = "FEFF" },
        ["LAGAS"] = { lat = 41.571944444, lon = 44.231388889, type = "ENRT" },
        ["MS31L"] = { lat = 41.629675, lon = 44.999380556, type = "UGTB" },
        ["TB203"] = { lat = 49.248902778, lon = 16.535022222, type = "LKTB" },
        ["FF13R"] = { lat = 41.797583333, lon = 44.788305556, type = "UGTB" },
        ["TB204"] = { lat = 49.210233333, lon = 16.979641667, type = "LKTB" },
    },

    -- Данные ВПП
    Runways = {
        ["RW13R"] = {
            heading = 130,
            length = -700.0,
            width = 0,
            threshold = { lat = 41.677813888888885, lon = 44.94010833333333 },
            end = { lat = 41.751866298449684, lon = 44.82194963581359 }
        },
        ["RW31L"] = {
            heading = 310,
            length = 700.0,
            width = 0,
            threshold = { lat = 41.658202777777774, lon = 44.96488611111111 },
            end = { lat = 41.73225518733857, lon = 44.84676340117902 }
        },
    },

    -- Процедуры SID
    SID = {
        ["DF1D"] = {
            name = "DF1D",
            runway = "RW31L",
            waypoints = {
                { name = "", type = "", altitude_min = 5000 },
                { name = "DF", type = "D", altitude_min = 9000 },
            }
        },
        ["DF1E"] = {
            name = "DF1E",
            runway = "RW13R",
            waypoints = {
                { name = "", type = "", altitude_min = 2030 },
                { name = "", type = "", altitude_min = 4000 },
                { name = "DF", type = "D" },
            }
        },
        ["DISK1D"] = {
            name = "DISK1D",
            runway = "RW31L",
            waypoints = {
                { name = "", type = "", altitude_min = 6500 },
                { name = "TB200", type = "P" },
                { name = "DISKA", type = "E", altitude_min = 9000 },
            }
        },
        ["DISK1E"] = {
            name = "DISK1E",
            runway = "RW13R",
            waypoints = {
                { name = "TB203", type = "P" },
                { name = "DISKA", type = "E", altitude_min = 6000 },
            }
        },
        ["KUFA1D"] = {
            name = "KUFA1D",
            runway = "RW31L",
            waypoints = {
                { name = "", type = "", altitude_min = 6500 },
                { name = "KUFAN", type = "E", altitude_min = 17000 },
            }
        },
        ["KUFA1E"] = {
            name = "KUFA1E",
            runway = "RW13R",
            waypoints = {
                { name = "TB203", type = "P" },
                { name = "TB204", type = "P" },
                { name = "KUFAN", type = "E", altitude_min = 17000 },
            }
        },
        ["LAPT1D"] = {
            name = "LAPT1D",
            runway = "RW31L",
            waypoints = {
                { name = "", type = "", altitude_min = 6000 },
                { name = "LAPTO", type = "E", altitude_min = 20000 },
            }
        },
        ["LAPT1E"] = {
            name = "LAPT1E",
            runway = "RW13R",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "TB201", type = "P" },
                { name = "LAPTO", type = "E", altitude_min = 20000 },
            }
        },
        ["PALLE1"] = {
            name = "PALLE1",
            runway = "RW13R",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "PALLE", type = "E", altitude_min = 13000 },
                { name = "LAGAS", type = "E" },
            }
        },
        ["TAVR1E"] = {
            name = "TAVR1E",
            runway = "RW13R",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "TB202", type = "P" },
                { name = "TAVRO", type = "E", altitude_min = 13000 },
            }
        },
        ["TAVR2D"] = {
            name = "TAVR2D",
            runway = "RW31L",
            waypoints = {
                { name = "TB205", type = "P" },
                { name = "TB206", type = "P" },
                { name = "TAVRO", type = "E", altitude_min = 13000 },
            }
        },
        ["ZAGOT1"] = {
            name = "ZAGOT1",
            runway = "RW31L",
            waypoints = {
                { name = "", type = "", altitude_min = 7000 },
                { name = "ZAGOT", type = "E", altitude_min = 13000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["GIMU1A"] = {
            name = "GIMU1A",
            runway = "RW31L",
            waypoints = {
                { name = "GIMUR", type = "UG", altitude_min = 10000 },
                { name = "TB100", type = "UG", altitude_min = 10000 },
                { name = "TB101", type = "UG", altitude_min = 7000 },
                { name = "BAZIK", type = "UG", altitude_min = 4500, speed = 220.0 },
            }
        },
        ["GIMU1B"] = {
            name = "GIMU1B",
            runway = "RW13R",
            waypoints = {
                { name = "GIMUR", type = "UG", altitude_min = 10000 },
                { name = "TB105", type = "UG", altitude_min = 9000 },
                { name = "DANQI", type = "UG", altitude_min = 7000, speed = 230.0 },
            }
        },
        ["LAGA1A"] = {
            name = "LAGA1A",
            runway = "RW31L",
            waypoints = {
                { name = "LAGAS", type = "UG", altitude_min = 11000 },
                { name = "TB102", type = "UG", altitude_min = 10000 },
                { name = "TB103", type = "UG", altitude_min = 7000 },
                { name = "BAZIK", type = "UG", altitude_min = 4500, speed = 220.0 },
            }
        },
        ["LAGA1B"] = {
            name = "LAGA1B",
            runway = "RW13R",
            waypoints = {
                { name = "LAGAS", type = "UG", altitude_min = 11000 },
                { name = "TB106", type = "UG", altitude_min = 10000 },
                { name = "DANQI", type = "UG", altitude_min = 7000, speed = 230.0 },
            }
        },
        ["LAMU1A"] = {
            name = "LAMU1A",
            runway = "RW31L",
            waypoints = {
                { name = "LAMUS", type = "UG", altitude_min = 8000 },
                { name = "GEMNA", type = "UG", altitude_min = 5500, speed = 220.0 },
            }
        },
        ["LAMU1B"] = {
            name = "LAMU1B",
            runway = "RW13R",
            waypoints = {
                { name = "LAMUS", type = "UG", altitude_min = 9000 },
                { name = "TB107", type = "UG", altitude_min = 9000 },
                { name = "UDVIN", type = "UG", altitude_min = 7000, speed = 230.0 },
            }
        },
        ["TISO1A"] = {
            name = "TISO1A",
            runway = "RW31L",
            waypoints = {
                { name = "TISOT", type = "UD", altitude_min = 11000 },
                { name = "TB104", type = "UG", altitude_min = 6000 },
                { name = "BAZIK", type = "UG", altitude_min = 4500, speed = 220.0 },
            }
        },
        ["TISO1B"] = {
            name = "TISO1B",
            runway = "RW13R",
            waypoints = {
                { name = "TISOT", type = "UD", altitude_min = 11000 },
                { name = "LATVA", type = "UG", altitude_min = 8000, speed = 230.0 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D13R"] = {
            name = "D13R",
            type = "A",
            runway = "D13R",
            waypoints = {
                { name = "TBS", transition = "TBS", type = "UG", altitude_min = 7000 },
                { name = "D296Q", transition = "TBS", type = "UG", altitude_min = 7000, speed = 230.0 },
                { name = "CS13R", transition = "TBS", type = "UG", altitude_min = 7000 },
                { name = "CS13R", transition = "", type = "UG", altitude_min = 7000 },
                { name = "FS13R", transition = "", type = "UG", altitude_min = 5300 },
                { name = "41VOR", transition = "", type = "UG", altitude_min = 2940 },
                { name = "RW13R", transition = "", type = "UG" },
                { name = "TBS", transition = "", type = "UG" },
                { name = "TBS", transition = "", type = "UG", altitude_min = 4500 },
                { name = "TBS", transition = "", type = "UG" },
            }
        },
        ["D31L"] = {
            name = "D31L",
            type = "A",
            runway = "D31L",
            waypoints = {
                { name = "TBS", transition = "TBS", type = "UG", altitude_min = 7000 },
                { name = "D150N", transition = "TBS", type = "UG", altitude_min = 4500 },
                { name = "CS31L", transition = "TBS", type = "UG", altitude_min = 4500 },
                { name = "CS31L", transition = "", type = "UG", altitude_min = 4500 },
                { name = "FS31L", transition = "", type = "UG", altitude_min = 4000 },
                { name = "51VOR", transition = "", type = "UG", altitude_min = 2870 },
                { name = "MS31L", transition = "", type = "UG" },
                { name = "TBS", transition = "", type = "UG" },
                { name = "TBS", transition = "", type = "UG", altitude_min = 6000 },
                { name = "TBS", transition = "", type = "UG" },
            }
        },
        ["I13RY"] = {
            name = "I13RY",
            type = "A",
            runway = "I13RY",
            waypoints = {
                { name = "TBS", transition = "TBS", type = "UG", altitude_min = 7000 },
                { name = "D296Q", transition = "TBS", type = "UG", altitude_min = 7000, speed = 230.0 },
                { name = "CF13R", transition = "TBS", type = "UG", altitude_min = 7000 },
                { name = "CF13R", transition = "", type = "UG" },
                { name = "FF13R", transition = "", type = "UG" },
                { name = "RW13R", transition = "", type = "UG" },
                { name = "", transition = "", type = "", altitude_min = 4500 },
                { name = "TBS", transition = "", type = "UG" },
            }
        },
        ["I13RZ"] = {
            name = "I13RZ",
            type = "A",
            runway = "I13RZ",
            waypoints = {
                { name = "DANQI", transition = "DANQI", type = "UG", altitude_min = 7000, speed = 230.0 },
                { name = "NAMME", transition = "DANQI", type = "UG", altitude_min = 7000, speed = 210.0 },
                { name = "LATVA", transition = "LATVA", type = "UG", altitude_min = 8000, speed = 230.0 },
                { name = "NAMME", transition = "LATVA", type = "UG", altitude_min = 7000, speed = 210.0 },
                { name = "UDVIN", transition = "UDVIN", type = "UG", altitude_min = 7000, speed = 230.0 },
                { name = "NAMME", transition = "UDVIN", type = "UG", altitude_min = 7000, speed = 210.0 },
                { name = "NAMME", transition = "", type = "UG", speed = 210.0 },
                { name = "FF13R", transition = "", type = "UG" },
                { name = "RW13R", transition = "", type = "UG" },
                { name = "", transition = "", type = "", altitude_min = 4500 },
                { name = "TBS", transition = "", type = "UG" },
            }
        },
        ["I31LY"] = {
            name = "I31LY",
            type = "A",
            runway = "I31LY",
            waypoints = {
                { name = "TBS", transition = "TBS", type = "UG", altitude_min = 7000 },
                { name = "D150M", transition = "TBS", type = "UG", altitude_min = 4500 },
                { name = "CF31L", transition = "TBS", type = "UG", altitude_min = 4500 },
                { name = "CF31L", transition = "", type = "UG" },
                { name = "FF31L", transition = "", type = "UG" },
                { name = "RW31L", transition = "", type = "UG" },
                { name = "", transition = "", type = "", altitude_min = 6000 },
                { name = "TBS", transition = "", type = "UG" },
            }
        },
        ["I31LZ"] = {
            name = "I31LZ",
            type = "A",
            runway = "I31LZ",
            waypoints = {
                { name = "BAZIK", transition = "BAZIK", type = "UG", altitude_min = 4500, speed = 220.0 },
                { name = "NATIP", transition = "BAZIK", type = "UG", altitude_min = 4500, speed = 200.0 },
                { name = "GEMNA", transition = "GEMNA", type = "UG", altitude_min = 5500, speed = 220.0 },
                { name = "NATIP", transition = "GEMNA", type = "UG", altitude_min = 4500, speed = 200.0 },
                { name = "NATIP", transition = "", type = "UG", speed = 200.0 },
                { name = "FF31L", transition = "", type = "UG" },
                { name = "RW31L", transition = "", type = "UG" },
                { name = "", transition = "", type = "", altitude_min = 6000 },
                { name = "TBS", transition = "", type = "UG" },
            }
        },
        ["L13RY"] = {
            name = "L13RY",
            type = "A",
            runway = "L13RY",
            waypoints = {
                { name = "TBS", transition = "TBS", type = "UG", altitude_min = 7000 },
                { name = "D296Q", transition = "TBS", type = "UG", altitude_min = 7000, speed = 230.0 },
                { name = "CF13R", transition = "TBS", type = "UG", altitude_min = 7000 },
                { name = "CF13R", transition = "", type = "UG", altitude_min = 7000 },
                { name = "FF13R", transition = "", type = "UG", altitude_min = 5300 },
                { name = "RW13R", transition = "", type = "UG" },
                { name = "", transition = "", type = "", altitude_min = 4500 },
                { name = "TBS", transition = "", type = "UG" },
            }
        },
        ["L13RZ"] = {
            name = "L13RZ",
            type = "A",
            runway = "L13RZ",
            waypoints = {
                { name = "DANQI", transition = "DANQI", type = "UG", altitude_min = 7000, speed = 230.0 },
                { name = "NAMME", transition = "DANQI", type = "UG", altitude_min = 7000, speed = 210.0 },
                { name = "LATVA", transition = "LATVA", type = "UG", altitude_min = 8000, speed = 230.0 },
                { name = "NAMME", transition = "LATVA", type = "UG", altitude_min = 7000, speed = 210.0 },
                { name = "UDVIN", transition = "UDVIN", type = "UG", altitude_min = 7000, speed = 230.0 },
                { name = "NAMME", transition = "UDVIN", type = "UG", altitude_min = 7000, speed = 210.0 },
                { name = "NAMME", transition = "", type = "UG", altitude_min = 7000, speed = 210.0 },
                { name = "FF13R", transition = "", type = "UG", altitude_min = 5300 },
                { name = "RW13R", transition = "", type = "UG" },
                { name = "", transition = "", type = "", altitude_min = 4500 },
                { name = "TBS", transition = "", type = "UG" },
            }
        },
        ["L31LY"] = {
            name = "L31LY",
            type = "A",
            runway = "L31LY",
            waypoints = {
                { name = "TBS", transition = "TBS", type = "UG", altitude_min = 7000 },
                { name = "D150M", transition = "TBS", type = "UG", altitude_min = 4500 },
                { name = "CF31L", transition = "TBS", type = "UG", altitude_min = 4500 },
                { name = "CF31L", transition = "", type = "UG", altitude_min = 4500 },
                { name = "FF31L", transition = "", type = "UG", altitude_min = 4000 },
                { name = "ML31L", transition = "", type = "UG" },
                { name = "", transition = "", type = "", altitude_min = 6000 },
                { name = "TBS", transition = "", type = "UG" },
            }
        },
        ["L31LZ"] = {
            name = "L31LZ",
            type = "A",
            runway = "L31LZ",
            waypoints = {
                { name = "BAZIK", transition = "BAZIK", type = "UG", altitude_min = 4500, speed = 220.0 },
                { name = "NATIP", transition = "BAZIK", type = "UG", altitude_min = 4500, speed = 200.0 },
                { name = "GEMNA", transition = "GEMNA", type = "UG", altitude_min = 5500, speed = 220.0 },
                { name = "NATIP", transition = "GEMNA", type = "UG", altitude_min = 4500, speed = 200.0 },
                { name = "NATIP", transition = "", type = "UG", altitude_min = 4500, speed = 200.0 },
                { name = "FF31L", transition = "", type = "UG", altitude_min = 4000 },
                { name = "ML31L", transition = "", type = "UG" },
                { name = "", transition = "", type = "", altitude_min = 6000 },
                { name = "TBS", transition = "", type = "UG" },
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
