local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "URWA",
        Name = "URWA Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["FF27"] = { lat = 36.687358333, lon = 3.36395, type = "DAAG" },
        ["DER09"] = { lat = 33.927216667, lon = -4.960569444, type = "GMFF" },
        ["D093P"] = { lat = 46.224983333, lon = 48.376422222, type = "URWA" },
        ["WA021"] = { lat = 46.306819444, lon = 47.717397222, type = "URWA" },
        ["D122L"] = { lat = 45.106975, lon = 37.066325, type = "URKA" },
        ["CF27"] = { lat = 36.686361111, lon = 3.403302778, type = "DAAG" },
        ["UP"] = { lat = 57.812777778, lon = -0.977777778, type = "NDB", frequency = 3.59, elevation = 0.0, name = "BUZZARD", range = 50.0 },
        ["RW27"] = { lat = 43.322133333, lon = 45.030563889, type = "URMS" },
        ["D294L"] = { lat = 46.391444444, lon = 47.762536111, type = "URWA" },
        ["D098L"] = { lat = 46.221419444, lon = 48.289222222, type = "URWA" },
        ["WA025"] = { lat = 46.258197222, lon = 48.303697222, type = "URWA" },
        ["CF09"] = { lat = -3.437352778, lon = 36.890152778, type = "HTKJ" },
        ["D278L"] = { lat = 67.508055556, lon = 86.166944444, type = "UOII" },
        ["WA027"] = { lat = 46.184502778, lon = 48.168016667, type = "URWA" },
        ["D233L"] = { lat = -1.418213889, lon = 36.792369444, type = "HKJK" },
        ["WA017"] = { lat = 46.222847222, lon = 47.702972222, type = "URWA" },
        ["RW09"] = { lat = 43.91315, lon = 2.101808333, type = "LFCI" },
        ["BASKO"] = { lat = 46.2, lon = 46.848611111, type = "ENRT" },
        ["OMIRA"] = { lat = 46.695, lon = 47.071944444, type = "ENRT" },
        ["DER27"] = { lat = 36.075813889, lon = 10.420286111, type = "DTNH" },
        ["WA019"] = { lat = 46.212769444, lon = 47.823930556, type = "URWA" },
        ["FF09"] = { lat = 33.872588889, lon = 10.663594444, type = "DTTJ" },
        ["WA026"] = { lat = 46.174261111, lon = 48.288861111, type = "URWA" },
        ["D258L"] = { lat = 13.43585, lon = 2.006908333, type = "DRRN" },
        ["G"] = { lat = 22.62035, lon = 108.454036111, type = "ZGNN" },
    },

    -- Данные ВПП
    Runways = {
        ["RW09"] = {
            heading = 90,
            length = 0,
            width = 0,
            threshold = { lat = 46.28458611111111, lon = 47.99013611111111 },
            end = { lat = 46.28458611111111, lon = 47.99013611111111 }
        },
        ["RW27"] = {
            heading = 270,
            length = 0,
            width = 0,
            threshold = { lat = 46.281166666666664, lon = 48.03136666666666 },
            end = { lat = 46.281166666666664, lon = 48.03136666666666 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BASK5A"] = {
            name = "BASK5A",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "BASKO", type = "E", altitude_min = 12000 },
            }
        },
        ["BASK5B"] = {
            name = "BASK5B",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", altitude_min = 1000 },
                { name = "BASKO", type = "E", altitude_min = 12000 },
            }
        },
        ["BASK5C"] = {
            name = "BASK5C",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "AST", type = "D" },
                { name = "BASKO", type = "E", altitude_min = 12000 },
            }
        },
        ["BASK5D"] = {
            name = "BASK5D",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "", type = "" },
                { name = "BASKO", type = "E", altitude_min = 12000 },
            }
        },
        ["BASK5E"] = {
            name = "BASK5E",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "G", type = "P" },
                { name = "BASKO", type = "E", altitude_min = 12000 },
            }
        },
        ["BASK5F"] = {
            name = "BASK5F",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "BASKO", type = "E", altitude_min = 12000 },
            }
        },
        ["OMIR5A"] = {
            name = "OMIR5A",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "OMIRA", type = "E", altitude_min = 6000 },
            }
        },
        ["OMIR5B"] = {
            name = "OMIR5B",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", altitude_min = 1000 },
                { name = "OMIRA", type = "E", altitude_min = 6000 },
            }
        },
        ["OMIR5C"] = {
            name = "OMIR5C",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "AST", type = "D" },
                { name = "OMIRA", type = "E", altitude_min = 6000 },
            }
        },
        ["OMIR5D"] = {
            name = "OMIR5D",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "", type = "" },
                { name = "OMIRA", type = "E", altitude_min = 6000 },
            }
        },
        ["OMIR5E"] = {
            name = "OMIR5E",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "G", type = "P" },
                { name = "OMIRA", type = "E", altitude_min = 6000 },
            }
        },
        ["OMIR5F"] = {
            name = "OMIR5F",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "OMIRA", type = "E", altitude_min = 6000 },
            }
        },
        ["UP5A"] = {
            name = "UP5A",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "UP", type = "D", altitude_min = 6000 },
            }
        },
        ["UP5B"] = {
            name = "UP5B",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", altitude_min = 1000 },
                { name = "UP", type = "D", altitude_min = 6000 },
            }
        },
        ["UP5C"] = {
            name = "UP5C",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", speed = 240.0 },
                { name = "", type = "" },
                { name = "UP", type = "D", altitude_min = 6000 },
            }
        },
        ["UP5D"] = {
            name = "UP5D",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", speed = 240.0 },
                { name = "", type = "" },
                { name = "UP", type = "D", altitude_min = 6000 },
            }
        },
        ["UP5E"] = {
            name = "UP5E",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "UP", type = "D", altitude_min = 6000 },
            }
        },
        ["UP5F"] = {
            name = "UP5F",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "UP", type = "D", altitude_min = 6000 },
            }
        },
        ["UP5P"] = {
            name = "UP5P",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "G", type = "P" },
                { name = "UP", type = "D", altitude_min = 6000 },
            }
        },
        ["UP5Q"] = {
            name = "UP5Q",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "UP", type = "D", altitude_min = 6000 },
            }
        },
        ["ZG5A"] = {
            name = "ZG5A",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", altitude_min = 1000 },
                { name = "ZG", type = "D", altitude_min = 7000 },
            }
        },
        ["ZG5B"] = {
            name = "ZG5B",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "ZG", type = "D", altitude_min = 7000 },
            }
        },
        ["ZG5C"] = {
            name = "ZG5C",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", speed = 240.0 },
                { name = "ZG", type = "D", altitude_min = 7000 },
            }
        },
        ["ZG5D"] = {
            name = "ZG5D",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", speed = 240.0 },
                { name = "", type = "" },
                { name = "ZG", type = "D", altitude_min = 7000 },
            }
        },
        ["ZG5E"] = {
            name = "ZG5E",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", altitude_min = 1000 },
                { name = "ZG", type = "D", altitude_min = 7000 },
            }
        },
        ["ZG5F"] = {
            name = "ZG5F",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "ZG", type = "D", altitude_min = 7000 },
            }
        },
        ["ZG5P"] = {
            name = "ZG5P",
            runway = "RW09",
            waypoints = {
                { name = "DER09", type = "P" },
                { name = "", type = "", altitude_min = 1000 },
                { name = "ZG", type = "D", altitude_min = 7000 },
            }
        },
        ["ZG5Q"] = {
            name = "ZG5Q",
            runway = "RW27",
            waypoints = {
                { name = "DER27", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "G", type = "P" },
                { name = "ZG", type = "D", altitude_min = 7000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["OMIR5G"] = {
            name = "OMIR5G",
            runway = "ALL",
            waypoints = {
                { name = "OMIRA", type = "UR", altitude_min = 5000 },
                { name = "G", type = "UR", altitude_min = 2000 },
            }
        },
        ["OMIR5H"] = {
            name = "OMIR5H",
            runway = "RW09",
            waypoints = {
                { name = "OMIRA", type = "UR", altitude_min = 5000 },
                { name = "D294L", type = "UR", altitude_min = 2000 },
            }
        },
        ["OMIR5J"] = {
            name = "OMIR5J",
            runway = "RW27",
            waypoints = {
                { name = "OMIRA", type = "UR", altitude_min = 5000 },
                { name = "AST", type = "UR" },
                { name = "D122L", type = "UR", altitude_min = 2000 },
            }
        },
        ["OMIR5K"] = {
            name = "OMIR5K",
            runway = "RW09",
            waypoints = {
                { name = "OMIRA", type = "UR", altitude_min = 5000 },
                { name = "WA021", type = "UR", altitude_min = 2000 },
            }
        },
        ["OMIR5L"] = {
            name = "OMIR5L",
            runway = "RW27",
            waypoints = {
                { name = "OMIRA", type = "UR", altitude_min = 5000 },
                { name = "WA027", type = "UR", altitude_min = 2000 },
                { name = "WA026", type = "UR", altitude_min = 2000 },
            }
        },
        ["UP5G"] = {
            name = "UP5G",
            runway = "ALL",
            waypoints = {
                { name = "UP", type = "UR", altitude_min = 5000 },
                { name = "G", type = "UR", altitude_min = 2000 },
            }
        },
        ["UP5H"] = {
            name = "UP5H",
            runway = "RW09",
            waypoints = {
                { name = "UP", type = "UR", altitude_min = 5000 },
                { name = "D233L", type = "UR", altitude_min = 2000 },
            }
        },
        ["UP5J"] = {
            name = "UP5J",
            runway = "RW27",
            waypoints = {
                { name = "UP", type = "UR", altitude_min = 5000 },
                { name = "AST", type = "UR" },
                { name = "D122L", type = "UR", altitude_min = 2000 },
            }
        },
        ["UP5K"] = {
            name = "UP5K",
            runway = "RW09",
            waypoints = {
                { name = "UP", type = "UR", altitude_min = 5000 },
                { name = "WA021", type = "UR", altitude_min = 2000 },
            }
        },
        ["UP5L"] = {
            name = "UP5L",
            runway = "RW27",
            waypoints = {
                { name = "UP", type = "UR", altitude_min = 5000 },
                { name = "WA026", type = "UR", altitude_min = 2000 },
            }
        },
        ["ZG5G"] = {
            name = "ZG5G",
            runway = "ALL",
            waypoints = {
                { name = "ZG", type = "UR", altitude_min = 6000 },
                { name = "G", type = "UR", altitude_min = 2000 },
            }
        },
        ["ZG5H"] = {
            name = "ZG5H",
            runway = "RW09",
            waypoints = {
                { name = "ZG", type = "UR", altitude_min = 6000 },
                { name = "AST", type = "UR" },
                { name = "D233L", type = "UR", altitude_min = 2000 },
            }
        },
        ["ZG5J"] = {
            name = "ZG5J",
            runway = "RW27",
            waypoints = {
                { name = "ZG", type = "UR", altitude_min = 6000 },
                { name = "D093P", type = "UR", altitude_min = 2000 },
            }
        },
        ["ZG5K"] = {
            name = "ZG5K",
            runway = "RW09",
            waypoints = {
                { name = "ZG", type = "UR", altitude_min = 6000 },
                { name = "WA019", type = "UR", altitude_min = 2000 },
                { name = "WA017", type = "UR", altitude_min = 2000 },
            }
        },
        ["ZG5L"] = {
            name = "ZG5L",
            runway = "RW27",
            waypoints = {
                { name = "ZG", type = "UR", altitude_min = 6000 },
                { name = "WA025", type = "UR", altitude_min = 2000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I09-X"] = {
            name = "I09-X",
            type = "A",
            runway = "I09-X",
            waypoints = {
                { name = "G", transition = "G1", type = "UR", altitude_min = 2000 },
                { name = "CF09", transition = "G1", type = "UR", altitude_min = 2000 },
                { name = "G", transition = "G2", type = "UR", altitude_min = 2000 },
                { name = "CF09", transition = "G2", type = "UR", altitude_min = 2000 },
                { name = "CF09", transition = "", type = "UR" },
                { name = "FF09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "G", transition = "", type = "UR", altitude_min = 2000, speed = 225.0 },
            }
        },
        ["I09-Y"] = {
            name = "I09-Y",
            type = "A",
            runway = "I09-Y",
            waypoints = {
                { name = "D233L", transition = "D233L", type = "UR", altitude_min = 2000 },
                { name = "D258L", transition = "D233L", type = "UR", altitude_min = 2000 },
                { name = "", transition = "D233L", type = "" },
                { name = "D294L", transition = "D294L", type = "UR", altitude_min = 2000 },
                { name = "D278L", transition = "D294L", type = "UR", altitude_min = 2000 },
                { name = "", transition = "D294L", type = "" },
                { name = "CF09", transition = "", type = "UR" },
                { name = "FF09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "", speed = 215.0 },
                { name = "D233L", transition = "", type = "UR", altitude_min = 2000 },
            }
        },
        ["I09-Z"] = {
            name = "I09-Z",
            type = "A",
            runway = "I09-Z",
            waypoints = {
                { name = "WA017", transition = "WA017", type = "UR", altitude_min = 2000 },
                { name = "WA021", transition = "WA017", type = "UR", altitude_min = 2000 },
                { name = "WA021", transition = "", type = "UR" },
                { name = "FF09", transition = "", type = "UR" },
                { name = "RW09", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 600 },
                { name = "WA019", transition = "", type = "UR", speed = 225.0 },
                { name = "WA017", transition = "", type = "UR", altitude_min = 2000 },
            }
        },
        ["I27-X"] = {
            name = "I27-X",
            type = "A",
            runway = "I27-X",
            waypoints = {
                { name = "G", transition = "G1", type = "UR", altitude_min = 2000 },
                { name = "CF27", transition = "G1", type = "UR", altitude_min = 2000 },
                { name = "G", transition = "G2", type = "UR", altitude_min = 2000 },
                { name = "CF27", transition = "G2", type = "UR", altitude_min = 2000 },
                { name = "CF27", transition = "", type = "UR" },
                { name = "FF27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "G", transition = "", type = "UR", altitude_min = 2000, speed = 225.0 },
            }
        },
        ["I27-Y"] = {
            name = "I27-Y",
            type = "A",
            runway = "I27-Y",
            waypoints = {
                { name = "D093P", transition = "D093P", type = "UR", altitude_min = 2000 },
                { name = "CF27", transition = "D093P", type = "UR", altitude_min = 2000 },
                { name = "D122L", transition = "D122L", type = "UR", altitude_min = 2000 },
                { name = "D098L", transition = "D122L", type = "UR", altitude_min = 2000 },
                { name = "", transition = "D122L", type = "" },
                { name = "CF27", transition = "", type = "UR" },
                { name = "FF27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "", transition = "", type = "", speed = 215.0 },
                { name = "D122L", transition = "", type = "UR", altitude_min = 2000 },
            }
        },
        ["I27-Z"] = {
            name = "I27-Z",
            type = "A",
            runway = "I27-Z",
            waypoints = {
                { name = "WA026", transition = "WA026", type = "UR", altitude_min = 2000 },
                { name = "WA025", transition = "WA026", type = "UR", altitude_min = 2000 },
                { name = "WA025", transition = "", type = "UR" },
                { name = "FF27", transition = "", type = "UR" },
                { name = "RW27", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 600 },
                { name = "WA027", transition = "", type = "UR", speed = 225.0 },
                { name = "WA026", transition = "", type = "UR", altitude_min = 2000 },
            }
        },
        ["Q09"] = {
            name = "Q09",
            type = "A",
            runway = "Q09",
            waypoints = {
                { name = "G", transition = "G1", type = "UR", altitude_min = 2000 },
                { name = "CF09", transition = "G1", type = "UR", altitude_min = 2000 },
                { name = "FF09", transition = "G1", type = "UR" },
                { name = "G", transition = "G2", type = "UR", altitude_min = 2000 },
                { name = "CF09", transition = "G2", type = "UR", altitude_min = 2000 },
                { name = "FF09", transition = "G2", type = "UR" },
                { name = "FF09", transition = "", type = "UR" },
                { name = "G", transition = "", type = "UR" },
                { name = "G", transition = "", type = "UR" },
                { name = "G", transition = "", type = "UR", altitude_min = 2000, speed = 225.0 },
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
