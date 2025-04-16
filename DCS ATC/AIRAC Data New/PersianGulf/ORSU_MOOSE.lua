local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "ORSU",
        Name = "ORSU Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["D220D"] = { lat = 20.652013889, lon = -105.284808333, type = "MMPR" },
        ["SUL"] = { lat = -29.198058333, lon = -51.188630556, type = "VOR", frequency = 112.3, elevation = 2447.0, name = "DO", range = 130.0 },
        ["ASKOM"] = { lat = 35.489166667, lon = 45.69, type = "ORSU" },
        ["CI13"] = { lat = -19.973827778, lon = 28.522027778, type = "FVJN" },
        ["MS31"] = { lat = 35.538986111, lon = 45.341472222, type = "ORSU" },
        ["PARUN"] = { lat = 35.789166667, lon = 45.143055556, type = "ORSU" },
        ["FS31"] = { lat = 34.704841667, lon = 5.866477778, type = "DAUB" },
        ["ERBIL"] = { lat = -21.721627778, lon = 17.086969444, type = "ENRT" },
        ["TOVEN"] = { lat = 35.707777778, lon = 45.120555556, type = "ORSU" },
        ["ORMAM"] = { lat = 35.581944444, lon = 45.286944444, type = "ORSU" },
        ["XADIL"] = { lat = 35.870833333, lon = 45.165833333, type = "ORSU" },
        ["ORBET"] = { lat = 35.413611111, lon = 45.508055556, type = "ORSU" },
        ["D310H"] = { lat = 48.839544444, lon = 1.952622222, type = "LFPV" },
        ["NOSKA"] = { lat = 35.451388889, lon = 45.598611111, type = "ORSU" },
        ["ALVEX"] = { lat = 35.343888889, lon = 45.598888889, type = "ORSU" },
        ["MS13"] = { lat = 26.968611111, lon = 64.115213889, type = "OPPG" },
        ["FI31"] = { lat = 34.701569444, lon = 5.872811111, type = "DAUB" },
        ["FS13"] = { lat = 33.577461111, lon = 6.694727778, type = "DAUO" },
        ["TAKVA"] = { lat = 35.633055556, lon = 45.035833333, type = "ORSU" },
        ["CI31"] = { lat = 34.67495, lon = 5.911730556, type = "DAUB" },
        ["KARUX"] = { lat = 35.319722222, lon = 45.459444444, type = "ORSU" },
        ["FI13"] = { lat = 27.049388889, lon = 14.398655556, type = "HLLS" },
        ["D130K"] = { lat = 29.324977778, lon = 106.889744444, type = "ZUCK" },
        ["D130J"] = { lat = 31.825258333, lon = 119.935236111, type = "ZSCG" },
        ["KIRKK"] = { lat = 35.469444444, lon = 44.348888889, type = "ENRT" },
        ["ORGOS"] = { lat = 35.459166667, lon = 45.448333333, type = "ORSU" },
        ["DESKU"] = { lat = 35.776944444, lon = 45.028888889, type = "ORSU" },
        ["PUTRI"] = { lat = 35.649166667, lon = 45.140555556, type = "ENRT" },
        ["TASRO"] = { lat = 35.6625, lon = 45.180555556, type = "ORSU" },
        ["RANKO"] = { lat = 35.54, lon = 45.342222222, type = "ORSU" },
        ["D310G"] = { lat = 41.347697222, lon = 36.438952778, type = "LTFH" },
        ["RASKI"] = { lat = 21.850805556, lon = 38.952472222, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW13"] = {
            heading = 130,
            length = 0,
            width = 0,
            threshold = { lat = 35.57159166666667, lon = 45.30052777777777 },
            end = { lat = 35.57159166666667, lon = 45.30052777777777 }
        },
        ["RW31"] = {
            heading = 310,
            length = 0,
            width = 0,
            threshold = { lat = 35.55011944444444, lon = 45.3288 },
            end = { lat = 35.55011944444444, lon = 45.3288 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ERBIL1"] = {
            name = "ERBIL1",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 6500 },
                { name = "D220D", type = "P", altitude_min = 8000 },
                { name = "SUL", type = "D" },
                { name = "PUTRI", type = "E", altitude_min = 11000 },
                { name = "ERBIL", type = "E" },
            }
        },
        ["ERBIL2"] = {
            name = "ERBIL2",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 6500 },
                { name = "", type = "", altitude_min = 8000 },
                { name = "PUTRI", type = "E", altitude_min = 11000 },
                { name = "ERBIL", type = "E" },
            }
        },
        ["KIRKK1"] = {
            name = "KIRKK1",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 6500 },
                { name = "D220D", type = "P", altitude_min = 8000 },
                { name = "SUL", type = "D" },
                { name = "RASKI", type = "P", altitude_min = 11000 },
                { name = "KIRKK", type = "E" },
            }
        },
        ["KIRKK2"] = {
            name = "KIRKK2",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 6500 },
                { name = "", type = "", altitude_min = 8000 },
                { name = "", type = "" },
                { name = "RASKI", type = "P", altitude_min = 11000 },
                { name = "KIRKK", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ERBIL1"] = {
            name = "ERBIL1",
            runway = "RW31",
            waypoints = {
                { name = "ERBIL", type = "OR" },
                { name = "PUTRI", type = "OR" },
                { name = "SUL", type = "OR" },
            }
        },
        ["ERBIL2"] = {
            name = "ERBIL2",
            runway = "RW13",
            waypoints = {
                { name = "ERBIL", type = "OR" },
                { name = "PUTRI", type = "OR" },
                { name = "SUL", type = "OR" },
            }
        },
        ["KIRKK1"] = {
            name = "KIRKK1",
            runway = "RW31",
            waypoints = {
                { name = "KIRKK", type = "OR" },
                { name = "RASKI", type = "OR" },
                { name = "SUL", type = "OR" },
            }
        },
        ["KIRKK2"] = {
            name = "KIRKK2",
            runway = "RW13",
            waypoints = {
                { name = "KIRKK", type = "OR" },
                { name = "RASKI", type = "OR" },
                { name = "SUL", type = "OR" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I13"] = {
            name = "I13",
            type = "A",
            runway = "I13",
            waypoints = {
                { name = "SUL", transition = "SUL", type = "OR", altitude_min = 8000 },
                { name = "D310H", transition = "SUL", type = "OR", altitude_min = 6500 },
                { name = "D310H", transition = "SUL", type = "OR", altitude_min = 6500 },
                { name = "CI13", transition = "SUL", type = "OR", altitude_min = 5730 },
                { name = "CI13", transition = "", type = "OR" },
                { name = "FI13", transition = "", type = "OR" },
                { name = "RW13", transition = "", type = "OR" },
                { name = "RW13", transition = "", type = "OR", altitude_min = 6500 },
                { name = "SUL", transition = "", type = "OR" },
            }
        },
        ["I31"] = {
            name = "I31",
            type = "A",
            runway = "I31",
            waypoints = {
                { name = "SUL", transition = "SUL", type = "OR" },
                { name = "D130J", transition = "SUL", type = "OR", altitude_min = 6500 },
                { name = "D130J", transition = "SUL", type = "OR", altitude_min = 6500 },
                { name = "CI31", transition = "SUL", type = "OR", altitude_min = 6500 },
                { name = "CI31", transition = "", type = "OR" },
                { name = "FI31", transition = "", type = "OR" },
                { name = "RW31", transition = "", type = "OR" },
                { name = "", transition = "", type = "", altitude_min = 6500 },
                { name = "SUL", transition = "", type = "OR" },
            }
        },
        ["R13"] = {
            name = "R13",
            type = "A",
            runway = "R13",
            waypoints = {
                { name = "DESKU", transition = "DESKU", type = "OR", altitude_min = 7550, speed = 210.0 },
                { name = "TOVEN", transition = "DESKU", type = "OR", altitude_min = 6060 },
                { name = "TAKVA", transition = "TAKVA", type = "OR", altitude_min = 7550, speed = 210.0 },
                { name = "TOVEN", transition = "TAKVA", type = "OR", altitude_min = 6060 },
                { name = "XADIL", transition = "XADIL", type = "OR", altitude_min = 13000, speed = 210.0 },
                { name = "PARUN", transition = "XADIL", type = "OR", altitude_min = 11000 },
                { name = "TOVEN", transition = "XADIL", type = "OR", altitude_min = 6060 },
                { name = "TOVEN", transition = "", type = "OR", altitude_min = 6060 },
                { name = "TASRO", transition = "", type = "OR", altitude_min = 5100 },
                { name = "ORMAM", transition = "", type = "OR" },
                { name = "", transition = "", type = "", altitude_min = 6500 },
                { name = "TAKVA", transition = "", type = "OR", speed = 210.0 },
                { name = "TAKVA", transition = "", type = "OR", altitude_min = 7550 },
            }
        },
        ["R31"] = {
            name = "R31",
            type = "A",
            runway = "R31",
            waypoints = {
                { name = "ALVEX", transition = "ALVEX", type = "OR", altitude_min = 7550, speed = 210.0 },
                { name = "ORBET", transition = "ALVEX", type = "OR", altitude_min = 6060 },
                { name = "ASKOM", transition = "ASKOM", type = "OR", altitude_min = 13000, speed = 210.0 },
                { name = "NOSKA", transition = "ASKOM", type = "OR", altitude_min = 11000 },
                { name = "ORBET", transition = "ASKOM", type = "OR", altitude_min = 6060 },
                { name = "KARUX", transition = "KARUX", type = "OR", altitude_min = 8500, speed = 210.0 },
                { name = "ORBET", transition = "KARUX", type = "OR", altitude_min = 6060 },
                { name = "ORBET", transition = "", type = "OR", altitude_min = 6060 },
                { name = "ORGOS", transition = "", type = "OR", altitude_min = 5100 },
                { name = "RANKO", transition = "", type = "OR" },
                { name = "", transition = "", type = "", altitude_min = 6500 },
                { name = "KARUX", transition = "", type = "OR", speed = 210.0 },
                { name = "KARUX", transition = "", type = "OR", altitude_min = 8500 },
            }
        },
        ["S13"] = {
            name = "S13",
            type = "A",
            runway = "S13",
            waypoints = {
                { name = "SUL", transition = "SUL", type = "OR" },
                { name = "D310G", transition = "SUL", type = "OR", altitude_min = 6500 },
                { name = "D310G", transition = "SUL", type = "OR" },
                { name = "FS13", transition = "SUL", type = "OR", altitude_min = 6500 },
                { name = "FS13", transition = "", type = "OR", altitude_min = 6500 },
                { name = "MS13", transition = "", type = "OR" },
                { name = "", transition = "", type = "", altitude_min = 6500 },
                { name = "SUL", transition = "", type = "OR" },
            }
        },
        ["S31"] = {
            name = "S31",
            type = "A",
            runway = "S31",
            waypoints = {
                { name = "SUL", transition = "SUL", type = "OR" },
                { name = "D130K", transition = "SUL", type = "OR", altitude_min = 6500 },
                { name = "D130K", transition = "SUL", type = "OR" },
                { name = "FS31", transition = "SUL", type = "OR", altitude_min = 6500 },
                { name = "FS31", transition = "", type = "OR", altitude_min = 6500 },
                { name = "MS31", transition = "", type = "OR" },
                { name = "", transition = "", type = "", altitude_min = 6500 },
                { name = "SUL", transition = "", type = "OR" },
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
