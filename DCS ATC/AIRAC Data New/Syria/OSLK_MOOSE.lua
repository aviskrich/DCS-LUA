local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OSLK",
        Name = "OSLK Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["LIMA"] = { lat = 36.036666667, lon = 37.018333333, type = "ENRT" },
        ["SALIM"] = { lat = 35.495833333, lon = 36.311111111, type = "ENRT" },
        ["KTN"] = { lat = -37.246666667, lon = 144.458333333, type = "ENRT" },
        ["LUBAM"] = { lat = 35.666666667, lon = 36.533333333, type = "ENRT" },
        ["CD17R"] = { lat = 33.507636111, lon = -7.624794444, type = "GMMN" },
        ["38VOR"] = { lat = 61.556566667, lon = 89.914947222, type = "UNIP" },
        ["CI17R"] = { lat = 31.350658333, lon = 121.709191667, type = "ZSPD" },
        ["OM17"] = { lat = -3.248788889, lon = 29.306705556, type = "HBBA" },
        ["BRAVO"] = { lat = 45.543333333, lon = 12.915555556, type = "ENRT" },
        ["FD17R"] = { lat = 33.450613889, lon = -7.612527778, type = "GMMN" },
        ["NIKAS"] = { lat = 35.193333333, lon = 35.716666667, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW17L"] = {
            heading = 170,
            length = 0,
            width = 0,
            threshold = { lat = 35.413866666666664, lon = 35.949188888888884 },
            end = { lat = 35.413866666666664, lon = 35.949188888888884 }
        },
        ["RW17R"] = {
            heading = 170,
            length = 0,
            width = 0,
            threshold = { lat = 35.41513333333333, lon = 35.94735555555555 },
            end = { lat = 35.41513333333333, lon = 35.94735555555555 }
        },
        ["RW35L"] = {
            heading = 350,
            length = 0,
            width = 0,
            threshold = { lat = 35.38814444444444, lon = 35.94931388888889 },
            end = { lat = 35.38814444444444, lon = 35.94931388888889 }
        },
        ["RW35R"] = {
            heading = 350,
            length = 0,
            width = 0,
            threshold = { lat = 35.39138888888889, lon = 35.95111111111111 },
            end = { lat = 35.39138888888889, lon = 35.95111111111111 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BRAV1J"] = {
            name = "BRAV1J",
            runway = "RW17R",
            waypoints = {
                { name = "", type = "", altitude_min = 560 },
                { name = "BAN", type = "D", altitude_min = 5000 },
                { name = "LIMA", type = "P", altitude_min = 24000 },
                { name = "BRAVO", type = "E" },
            }
        },
        ["BRAV2J"] = {
            name = "BRAV2J",
            runway = "RW17R",
            waypoints = {
                { name = "", type = "", altitude_min = 560 },
                { name = "BAN", type = "D", altitude_min = 5000 },
                { name = "BRAVO", type = "E", altitude_min = 24000 },
            }
        },
        ["KTN1J"] = {
            name = "KTN1J",
            runway = "RW17R",
            waypoints = {
                { name = "", type = "", altitude_min = 560 },
                { name = "BAN", type = "D", altitude_min = 7000 },
                { name = "LIMA", type = "P", altitude_min = 24000 },
                { name = "KTN", type = "D" },
            }
        },
        ["KTN2J"] = {
            name = "KTN2J",
            runway = "RW17R",
            waypoints = {
                { name = "", type = "", altitude_min = 560 },
                { name = "BAN", type = "D", altitude_min = 7000 },
                { name = "KTN", type = "D" },
            }
        },
        ["LUBA1J"] = {
            name = "LUBA1J",
            runway = "RW17R",
            waypoints = {
                { name = "", type = "", altitude_min = 560 },
                { name = "LTK", type = "D" },
                { name = "LTK", type = "D", altitude_min = 6500 },
                { name = "SALIM", type = "E", altitude_min = 9000 },
                { name = "LUBAM", type = "E", altitude_min = 24000 },
            }
        },
        ["LUBA2J"] = {
            name = "LUBA2J",
            runway = "RW17R",
            waypoints = {
                { name = "", type = "", altitude_min = 560 },
                { name = "LTK", type = "D" },
                { name = "LTK", type = "D", altitude_min = 6500 },
                { name = "SALIM", type = "E" },
                { name = "LUBAM", type = "E" },
            }
        },
        ["NIKA1J"] = {
            name = "NIKA1J",
            runway = "RW17R",
            waypoints = {
                { name = "", type = "" },
                { name = "NIKAS", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BRAV1C"] = {
            name = "BRAV1C",
            runway = "RW17R",
            waypoints = {
                { name = "BRAVO", type = "OS", altitude_min = 24000 },
                { name = "BAN", type = "OS", altitude_min = 5000 },
                { name = "LTK", type = "OS", altitude_min = 4500 },
            }
        },
        ["BRAV2C"] = {
            name = "BRAV2C",
            runway = "RW17R",
            waypoints = {
                { name = "BRAVO", type = "OS", altitude_min = 24000 },
                { name = "LIMA", type = "OS" },
                { name = "BAN", type = "OS", altitude_min = 5000 },
                { name = "LTK", type = "OS", altitude_min = 4500 },
            }
        },
        ["KTN1C"] = {
            name = "KTN1C",
            runway = "RW17R",
            waypoints = {
                { name = "KTN", type = "OS", altitude_min = 24000 },
                { name = "BAN", type = "OS", altitude_min = 8000 },
                { name = "LTK", type = "OS", altitude_min = 4500 },
            }
        },
        ["KTN2C"] = {
            name = "KTN2C",
            runway = "RW17R",
            waypoints = {
                { name = "KTN", type = "OS", altitude_min = 24000 },
                { name = "LIMA", type = "OS", altitude_min = 24000 },
                { name = "BAN", type = "OS", altitude_min = 8000 },
                { name = "LTK", type = "OS", altitude_min = 4500 },
            }
        },
        ["LUBA1C"] = {
            name = "LUBA1C",
            runway = "RW17R",
            waypoints = {
                { name = "LUBAM", type = "OS", altitude_min = 24000 },
                { name = "LTK", type = "OS", altitude_min = 6500 },
            }
        },
        ["LUBA2C"] = {
            name = "LUBA2C",
            runway = "RW17R",
            waypoints = {
                { name = "LUBAM", type = "OS", altitude_min = 24000 },
                { name = "SALIM", type = "OS", altitude_min = 9000 },
                { name = "LTK", type = "OS", altitude_min = 6500 },
            }
        },
        ["NIKA1C"] = {
            name = "NIKA1C",
            runway = "RW17R",
            waypoints = {
                { name = "NIKAS", type = "LC", altitude_min = 7000 },
                { name = "LTK", type = "OS", altitude_min = 4500 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D17R"] = {
            name = "D17R",
            type = "A",
            runway = "D17R",
            waypoints = {
                { name = "LTK", transition = "LTK", type = "OS", altitude_min = 4500, speed = 250.0 },
                { name = "LTK", transition = "LTK", type = "OS", altitude_min = 2850 },
                { name = "CD17R", transition = "LTK", type = "OS", altitude_min = 2850 },
                { name = "CD17R", transition = "", type = "OS", altitude_min = 2850 },
                { name = "FD17R", transition = "", type = "OS", altitude_min = 2070 },
                { name = "38VOR", transition = "", type = "OS", altitude_min = 1100 },
                { name = "RW17R", transition = "", type = "OS" },
                { name = "LTK", transition = "", type = "OS" },
                { name = "", transition = "", type = "" },
            }
        },
        ["I17R"] = {
            name = "I17R",
            type = "A",
            runway = "I17R",
            waypoints = {
                { name = "LTK", transition = "LTK1", type = "OS", altitude_min = 4500 },
                { name = "LTK", transition = "LTK1", type = "OS" },
                { name = "LTK", transition = "LTK1", type = "OS", altitude_min = 2910 },
                { name = "CI17R", transition = "LTK1", type = "OS", altitude_min = 2910 },
                { name = "LTK", transition = "LTK2", type = "OS", altitude_min = 4500 },
                { name = "LTK", transition = "LTK2", type = "OS" },
                { name = "LTK", transition = "LTK2", type = "OS", altitude_min = 2910 },
                { name = "CI17R", transition = "LTK2", type = "OS", altitude_min = 2910 },
                { name = "CI17R", transition = "", type = "OS" },
                { name = "OM17", transition = "", type = "OS" },
                { name = "RW17R", transition = "", type = "OS" },
                { name = "LTK", transition = "", type = "OS" },
                { name = "", transition = "", type = "" },
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
