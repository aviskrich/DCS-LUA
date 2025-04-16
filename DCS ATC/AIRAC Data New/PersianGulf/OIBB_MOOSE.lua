local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIBB",
        Name = "OIBB Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["D310J"] = { lat = 42.686627778, lon = 27.357136111, type = "LBBG" },
        ["FN31R"] = { lat = 54.301966667, lon = -110.202747222, type = "CYOD" },
        ["VATOB"] = { lat = 28.857222222, lon = 51.276666667, type = "ENRT" },
        ["D030J"] = { lat = 49.832102778, lon = 18.260380556, type = "LKMT" },
        ["EN31L"] = { lat = 28.93245, lon = 50.853241667, type = "OIBB" },
        ["FD31R"] = { lat = 47.352241667, lon = 19.409741667, type = "LHBP" },
        ["FN13"] = { lat = -12.294863889, lon = 49.205702778, type = "FMNA" },
        ["FN31L"] = { lat = 28.878691667, lon = 50.9082, type = "OIBB" },
        ["D130O"] = { lat = 54.070488889, lon = -130.249916667, type = "CYPR" },
        ["FS13R"] = { lat = 41.79725, lon = 44.788722222, type = "UGTB" },
        ["FS31L"] = { lat = 41.567333333, lon = 45.079722222, type = "UGTB" },
        ["KUGVU"] = { lat = 29.129722222, lon = 51.338888889, type = "ENRT" },
        ["CF31R"] = { lat = 54.194280556, lon = -110.142466667, type = "CYOD" },
        ["MD31L"] = { lat = 28.917191667, lon = 50.86775, type = "OIBB" },
        ["D101O"] = { lat = 19.092730556, lon = -98.116066667, type = "MMPB" },
        ["FS31R"] = { lat = 28.885363889, lon = 50.915444444, type = "OIBB" },
        ["FD13"] = { lat = -21.098266667, lon = 27.359930556, type = "FBPM" },
        ["D101T"] = { lat = 13.421694444, lon = 2.5435, type = "DRRN" },
        ["FF31R"] = { lat = 53.792777778, lon = 28.199444444, type = "UMMS" },
        ["D130J"] = { lat = 31.825258333, lon = 119.935236111, type = "ZSCG" },
        ["FD31L"] = { lat = 37.844577778, lon = 12.596097222, type = "LICT" },
        ["D090R"] = { lat = 44.394697222, lon = -77.295447222, type = "CYTR" },
        ["SESMA"] = { lat = 29.578055556, lon = 51.085833333, type = "ENRT" },
        ["MD31R"] = { lat = 28.917191667, lon = 50.86775, type = "OIBB" },
        ["FS13L"] = { lat = 29.012125, lon = 50.756966667, type = "OIBB" },
    },

    -- Данные ВПП
    Runways = {
        ["RW13L"] = {
            heading = 130,
            length = 0,
            width = 0,
            threshold = { lat = 28.959144444444444, lon = 50.81841111111112 },
            end = { lat = 28.959144444444444, lon = 50.81841111111112 }
        },
        ["RW13R"] = {
            heading = 130,
            length = 0,
            width = 0,
            threshold = { lat = 28.957533333333334, lon = 50.81676666666667 },
            end = { lat = 28.957533333333334, lon = 50.81676666666667 }
        },
        ["RW31L"] = {
            heading = 310,
            length = 0,
            width = 0,
            threshold = { lat = 28.930558333333334, lon = 50.85085277777778 },
            end = { lat = 28.930558333333334, lon = 50.85085277777778 }
        },
        ["RW31R"] = {
            heading = 310,
            length = 0,
            width = 0,
            threshold = { lat = 28.932172222222224, lon = 50.852494444444446 },
            end = { lat = 28.932172222222224, lon = 50.852494444444446 }
        },
    },

    -- Процедуры SID
    SID = {
        ["KHG3C"] = {
            name = "KHG3C",
            runway = "RW31B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "KHG", type = "D" },
            }
        },
        ["KHG3D"] = {
            name = "KHG3D",
            runway = "RW13B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "", type = "", altitude_min = 2500 },
                { name = "", type = "" },
                { name = "KHG", type = "D" },
            }
        },
        ["KHG4A"] = {
            name = "KHG4A",
            runway = "RW31B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "KHG", type = "D" },
            }
        },
        ["KHG4B"] = {
            name = "KHG4B",
            runway = "RW13B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "BUZ", type = "D", altitude_min = 2500 },
                { name = "", type = "" },
                { name = "KHG", type = "D" },
            }
        },
        ["KUGV1E"] = {
            name = "KUGV1E",
            runway = "RW13B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "", type = "", altitude_min = 2500 },
                { name = "BUZ", type = "D", altitude_min = 5000 },
                { name = "KUGVU", type = "E", altitude_min = 14000 },
            }
        },
        ["KUGV2C"] = {
            name = "KUGV2C",
            runway = "RW31B",
            waypoints = {
                { name = "", type = "", altitude_min = 2500 },
                { name = "BUZ", type = "D", altitude_min = 5000 },
                { name = "KUGVU", type = "E", altitude_min = 14000 },
            }
        },
        ["KUGV2F"] = {
            name = "KUGV2F",
            runway = "RW13B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "BUZ", type = "D", altitude_min = 2500 },
                { name = "BUZ", type = "D", altitude_min = 5000 },
                { name = "KUGVU", type = "E", altitude_min = 14000 },
            }
        },
        ["KUGV3A"] = {
            name = "KUGV3A",
            runway = "RW31B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "BUZ", type = "D", altitude_min = 2500 },
                { name = "BUZ", type = "D", altitude_min = 5000 },
                { name = "KUGVU", type = "E", altitude_min = 14000 },
            }
        },
        ["SESM1A"] = {
            name = "SESM1A",
            runway = "RW31B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "BUZ", type = "D", altitude_min = 2500 },
                { name = "BUZ", type = "D", altitude_min = 5000 },
                { name = "SESMA", type = "E", altitude_min = 14000 },
            }
        },
        ["SESM1F"] = {
            name = "SESM1F",
            runway = "RW13B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "BUZ", type = "D", altitude_min = 2500 },
                { name = "BUZ", type = "D", altitude_min = 5000 },
                { name = "SESMA", type = "E", altitude_min = 14000 },
            }
        },
        ["VATO1C"] = {
            name = "VATO1C",
            runway = "RW31B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "", type = "" },
                { name = "VATOB", type = "E", altitude_min = 12000 },
            }
        },
        ["VATO1D"] = {
            name = "VATO1D",
            runway = "RW13B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "", type = "" },
                { name = "VATOB", type = "E", altitude_min = 12000 },
            }
        },
        ["VATO1E"] = {
            name = "VATO1E",
            runway = "RW31B",
            waypoints = {
                { name = "", type = "", altitude_min = 2500 },
                { name = "BUZ", type = "D", altitude_min = 5000 },
                { name = "VATOB", type = "E", altitude_min = 12000 },
            }
        },
        ["VATO2A"] = {
            name = "VATO2A",
            runway = "RW31B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "", type = "" },
                { name = "VATOB", type = "E", altitude_min = 12000 },
            }
        },
        ["VATO2B"] = {
            name = "VATO2B",
            runway = "RW13B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "", type = "" },
                { name = "VATOB", type = "E", altitude_min = 12000 },
            }
        },
        ["VATO2F"] = {
            name = "VATO2F",
            runway = "RW31B",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "BUZ", type = "D", altitude_min = 2500 },
                { name = "BUZ", type = "D", altitude_min = 5000 },
                { name = "VATOB", type = "E", altitude_min = 12000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["KHG1P"] = {
            name = "KHG1P",
            runway = "RW13B",
            waypoints = {
                { name = "KHG", type = "OI" },
                { name = "D310J", type = "OI" },
            }
        },
        ["KHG1Q"] = {
            name = "KHG1Q",
            runway = "ALL",
            waypoints = {
                { name = "KHG", type = "OI" },
                { name = "BUZ", type = "OI" },
            }
        },
        ["KUGV1N"] = {
            name = "KUGV1N",
            runway = "RW31B",
            waypoints = {
                { name = "KUGVU", type = "OI" },
                { name = "D090R", type = "OI" },
                { name = "D130O", type = "OI" },
            }
        },
        ["KUGV1P"] = {
            name = "KUGV1P",
            runway = "RW13B",
            waypoints = {
                { name = "KUGVU", type = "OI" },
                { name = "D030J", type = "OI" },
                { name = "D310J", type = "OI" },
            }
        },
        ["SESM1N"] = {
            name = "SESM1N",
            runway = "RW31B",
            waypoints = {
                { name = "SESMA", type = "OI" },
                { name = "BUZ", type = "OI" },
                { name = "D130O", type = "OI" },
            }
        },
        ["SESM1P"] = {
            name = "SESM1P",
            runway = "RW13B",
            waypoints = {
                { name = "SESMA", type = "OI" },
                { name = "D310J", type = "OI" },
            }
        },
        ["SESM1Q"] = {
            name = "SESM1Q",
            runway = "ALL",
            waypoints = {
                { name = "SESMA", type = "OI" },
                { name = "BUZ", type = "OI" },
            }
        },
        ["VATO1N"] = {
            name = "VATO1N",
            runway = "RW31B",
            waypoints = {
                { name = "VATOB", type = "OI" },
                { name = "D101T", type = "OI" },
                { name = "D101O", type = "OI" },
                { name = "D130O", type = "OI" },
            }
        },
        ["VATO1Q"] = {
            name = "VATO1Q",
            runway = "ALL",
            waypoints = {
                { name = "VATOB", type = "OI" },
                { name = "D101T", type = "OI" },
                { name = "BUZ", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D13L2"] = {
            name = "D13L2",
            type = "A",
            runway = "D13L2",
            waypoints = {
                { name = "D310J", transition = "D310J", type = "OI", altitude_min = 3000, speed = 210.0 },
                { name = "FD13", transition = "D310J", type = "OI", altitude_min = 1500 },
                { name = "FD13", transition = "", type = "OI", altitude_min = 1500 },
                { name = "RW13L", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", altitude_min = 1000 },
                { name = "D310J", transition = "", type = "OI" },
                { name = "D310J", transition = "", type = "OI", speed = 230.0 },
            }
        },
        ["D13R2"] = {
            name = "D13R2",
            type = "A",
            runway = "D13R2",
            waypoints = {
                { name = "D310J", transition = "D310J", type = "OI", altitude_min = 3000, speed = 210.0 },
                { name = "FD13", transition = "D310J", type = "OI", altitude_min = 1500 },
                { name = "FD13", transition = "", type = "OI", altitude_min = 1500 },
                { name = "RW13R", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", altitude_min = 1000 },
                { name = "D310J", transition = "", type = "OI" },
                { name = "D310J", transition = "", type = "OI", speed = 230.0 },
            }
        },
        ["D31L1"] = {
            name = "D31L1",
            type = "A",
            runway = "D31L1",
            waypoints = {
                { name = "D130O", transition = "D130O", type = "OI", altitude_min = 3000 },
                { name = "D130J", transition = "D130O", type = "OI", altitude_min = 2000, speed = 210.0 },
                { name = "FD31L", transition = "D130O", type = "OI", altitude_min = 1000 },
                { name = "FD31L", transition = "", type = "OI", altitude_min = 1000 },
                { name = "MD31L", transition = "", type = "OI" },
                { name = "MD31L", transition = "", type = "OI", altitude_min = 1000 },
                { name = "D130O", transition = "", type = "OI" },
                { name = "D130O", transition = "", type = "OI", speed = 210.0 },
            }
        },
        ["D31R1"] = {
            name = "D31R1",
            type = "A",
            runway = "D31R1",
            waypoints = {
                { name = "D130O", transition = "D130O", type = "OI", altitude_min = 3000 },
                { name = "D130J", transition = "D130O", type = "OI", altitude_min = 2000, speed = 210.0 },
                { name = "FD31R", transition = "D130O", type = "OI", altitude_min = 1000 },
                { name = "FD31R", transition = "", type = "OI", altitude_min = 1000 },
                { name = "MD31R", transition = "", type = "OI" },
                { name = "MD31R", transition = "", type = "OI", altitude_min = 1000 },
                { name = "D130O", transition = "", type = "OI" },
                { name = "D130O", transition = "", type = "OI", speed = 210.0 },
            }
        },
        ["I31R"] = {
            name = "I31R",
            type = "A",
            runway = "I31R",
            waypoints = {
                { name = "D130O", transition = "D130O", type = "OI", altitude_min = 3000 },
                { name = "CF31R", transition = "D130O", type = "OI", altitude_min = 2000 },
                { name = "CF31R", transition = "", type = "OI" },
                { name = "FF31R", transition = "", type = "OI" },
                { name = "RW31R", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "D130O", transition = "", type = "OI" },
                { name = "D130O", transition = "", type = "OI", speed = 210.0 },
            }
        },
        ["N13L"] = {
            name = "N13L",
            type = "A",
            runway = "N13L",
            waypoints = {
                { name = "BUZ", transition = "BUZ", type = "OI", altitude_min = 3000, speed = 185.0 },
                { name = "BUZ", transition = "BUZ", type = "OI" },
                { name = "FN13", transition = "BUZ", type = "OI" },
                { name = "FN13", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", altitude_min = 2000 },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", speed = 230.0 },
            }
        },
        ["N13R"] = {
            name = "N13R",
            type = "A",
            runway = "N13R",
            waypoints = {
                { name = "BUZ", transition = "BUZ", type = "OI", altitude_min = 3000, speed = 185.0 },
                { name = "BUZ", transition = "BUZ", type = "OI" },
                { name = "FN13", transition = "BUZ", type = "OI" },
                { name = "FN13", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", altitude_min = 2000 },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", speed = 230.0 },
            }
        },
        ["N31L"] = {
            name = "N31L",
            type = "A",
            runway = "N31L",
            waypoints = {
                { name = "BUZ", transition = "BUZ", type = "OI", altitude_min = 3000, speed = 185.0 },
                { name = "BUZ", transition = "BUZ", type = "OI" },
                { name = "FN31L", transition = "BUZ", type = "OI" },
                { name = "FN31L", transition = "", type = "OI" },
                { name = "EN31L", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", altitude_min = 480 },
                { name = "BUZ", transition = "", type = "OI", altitude_min = 2000 },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", speed = 210.0 },
            }
        },
        ["N31R"] = {
            name = "N31R",
            type = "A",
            runway = "N31R",
            waypoints = {
                { name = "BUZ", transition = "BUZ", type = "OI", altitude_min = 3000, speed = 185.0 },
                { name = "BUZ", transition = "BUZ", type = "OI" },
                { name = "FN31R", transition = "BUZ", type = "OI" },
                { name = "FN31R", transition = "", type = "OI" },
                { name = "RW31R", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", altitude_min = 2000 },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", speed = 210.0 },
            }
        },
        ["S13L"] = {
            name = "S13L",
            type = "A",
            runway = "S13L",
            waypoints = {
                { name = "BUZ", transition = "BUZ", type = "OI", altitude_min = 3000, speed = 185.0 },
                { name = "BUZ", transition = "BUZ", type = "OI" },
                { name = "FS13L", transition = "BUZ", type = "OI" },
                { name = "FS13L", transition = "", type = "OI" },
                { name = "RW13L", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", altitude_min = 2000 },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", speed = 230.0 },
            }
        },
        ["S13R"] = {
            name = "S13R",
            type = "A",
            runway = "S13R",
            waypoints = {
                { name = "BUZ", transition = "BUZ", type = "OI", altitude_min = 3000, speed = 185.0 },
                { name = "BUZ", transition = "BUZ", type = "OI" },
                { name = "FS13R", transition = "BUZ", type = "OI" },
                { name = "FS13R", transition = "", type = "OI" },
                { name = "RW13R", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", altitude_min = 2000 },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", speed = 230.0 },
            }
        },
        ["S31L"] = {
            name = "S31L",
            type = "A",
            runway = "S31L",
            waypoints = {
                { name = "BUZ", transition = "BUZ", type = "OI", altitude_min = 3000, speed = 185.0 },
                { name = "BUZ", transition = "BUZ", type = "OI" },
                { name = "FS31L", transition = "BUZ", type = "OI" },
                { name = "FS31L", transition = "", type = "OI" },
                { name = "RW31L", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", altitude_min = 2000 },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", speed = 210.0 },
            }
        },
        ["S31R"] = {
            name = "S31R",
            type = "A",
            runway = "S31R",
            waypoints = {
                { name = "BUZ", transition = "BUZ", type = "OI", altitude_min = 3000, speed = 185.0 },
                { name = "BUZ", transition = "BUZ", type = "OI" },
                { name = "FS31R", transition = "BUZ", type = "OI" },
                { name = "FS31R", transition = "", type = "OI" },
                { name = "RW31R", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", altitude_min = 2000 },
                { name = "BUZ", transition = "", type = "OI" },
                { name = "BUZ", transition = "", type = "OI", speed = 210.0 },
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
