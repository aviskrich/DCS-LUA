local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIBQ",
        Name = "OIBQ Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["FN31"] = { lat = 54.522055556, lon = 18.6124, type = "EPOK" },
        ["MD31"] = { lat = 36.269655556, lon = 6.637469444, type = "DABC" },
        ["IBKUG"] = { lat = 29.433611111, lon = 50.004722222, type = "ENRT" },
        ["D312G"] = { lat = 29.176788889, lon = 50.415572222, type = "OIBQ" },
        ["D312I"] = { lat = 29.153136111, lon = 50.442469444, type = "OIBQ" },
        ["D079Y"] = { lat = 29.325186111, lon = 50.788713889, type = "OIBQ" },
        ["D313O"] = { lat = 42.396722222, lon = 11.50105, type = "LIRF" },
        ["D050O"] = { lat = 31.116547222, lon = 122.081036111, type = "ZSPD" },
        ["IVERA"] = { lat = 29.384166667, lon = 51.261111111, type = "ENRT" },
        ["FS31"] = { lat = 34.704841667, lon = 5.866477778, type = "DAUB" },
        ["FD133"] = { lat = 29.323966667, lon = 50.250636111, type = "OIBQ" },
        ["FN13"] = { lat = -12.294863889, lon = 49.205702778, type = "FMNA" },
        ["CD31"] = { lat = 36.163333333, lon = 6.768419444, type = "DABC" },
        ["CD133"] = { lat = 29.384013889, lon = 50.184333333, type = "OIBQ" },
        ["MD133"] = { lat = 29.275905556, lon = 50.303622222, type = "OIBQ" },
        ["FS13"] = { lat = 33.577461111, lon = 6.694727778, type = "DAUO" },
        ["D135I"] = { lat = 38.168366667, lon = 114.855591667, type = "ZBSJ" },
        ["KH30A"] = { lat = 29.479427778, lon = 50.834261111, type = "OIBQ" },
        ["D135G"] = { lat = 39.160655556, lon = 9.159297222, type = "LIEE" },
        ["KHG28"] = { lat = 29.404969444, lon = 50.829261111, type = "OIBQ" },
        ["D030P"] = { lat = 29.496552778, lon = 50.486222222, type = "OIBQ" },
        ["SESMA"] = { lat = 29.578055556, lon = 51.085833333, type = "ENRT" },
        ["KHG30"] = { lat = 29.501991667, lon = 50.8213, type = "OIBQ" },
        ["FD31"] = { lat = 36.186975, lon = 6.73935, type = "DABC" },
    },

    -- Данные ВПП
    Runways = {
        ["RW13"] = {
            heading = 130,
            length = 100.0,
            width = 0,
            threshold = { lat = 29.26563611111111, lon = 50.316336111111106 },
            end = { lat = 29.255057195459568, lon = 50.33078819825189 }
        },
        ["RW31"] = {
            heading = 310,
            length = 100.0,
            width = 0,
            threshold = { lat = 29.255947222222222, lon = 50.327580555555556 },
            end = { lat = 29.266526137873765, lon = 50.31312983759963 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BUZ1A"] = {
            name = "BUZ1A",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "BUZ", type = "D" },
            }
        },
        ["BUZ1B"] = {
            name = "BUZ1B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "BUZ", type = "D" },
            }
        },
        ["BUZ1E"] = {
            name = "BUZ1E",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "BUZ", type = "D" },
            }
        },
        ["BUZ1F"] = {
            name = "BUZ1F",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "BUZ", type = "D" },
            }
        },
        ["IBKU1A"] = {
            name = "IBKU1A",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "IBKUG", type = "E" },
            }
        },
        ["IBKU1B"] = {
            name = "IBKU1B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "IBKUG", type = "E" },
            }
        },
        ["IBKU1D"] = {
            name = "IBKU1D",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "IBKUG", type = "E" },
            }
        },
        ["IBKU1E"] = {
            name = "IBKU1E",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "IBKUG", type = "E" },
            }
        },
        ["IVER1D"] = {
            name = "IVER1D",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "IVERA", type = "E" },
            }
        },
        ["IVER1E"] = {
            name = "IVER1E",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "IVERA", type = "E" },
            }
        },
        ["IVER2A"] = {
            name = "IVER2A",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "IVERA", type = "E" },
            }
        },
        ["IVER2B"] = {
            name = "IVER2B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "", type = "" },
                { name = "IVERA", type = "E" },
            }
        },
        ["SESM1E"] = {
            name = "SESM1E",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "KHG", type = "D", altitude_min = 2500 },
                { name = "KHG", type = "D", altitude_min = 5000 },
                { name = "SESMA", type = "E" },
            }
        },
        ["SESM1F"] = {
            name = "SESM1F",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "KHG", type = "D", altitude_min = 2500 },
                { name = "KHG", type = "D", altitude_min = 5000 },
                { name = "SESMA", type = "E" },
            }
        },
        ["SESM1G"] = {
            name = "SESM1G",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "KHG", type = "D", altitude_min = 2500 },
                { name = "KHG", type = "D", altitude_min = 5000 },
                { name = "SESMA", type = "E" },
            }
        },
        ["SESM1H"] = {
            name = "SESM1H",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 430 },
                { name = "KHG", type = "D", altitude_min = 2500 },
                { name = "KHG", type = "D", altitude_min = 5000 },
                { name = "SESMA", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BUZ1A"] = {
            name = "BUZ1A",
            runway = "RW31",
            waypoints = {
                { name = "BUZ", type = "OI" },
                { name = "D050O", type = "OI" },
            }
        },
        ["BUZ1B"] = {
            name = "BUZ1B",
            runway = "RW13",
            waypoints = {
                { name = "BUZ", type = "OI" },
                { name = "KHG", type = "OI" },
                { name = "D313O", type = "OI" },
            }
        },
        ["BUZ1C"] = {
            name = "BUZ1C",
            runway = "ALL",
            waypoints = {
                { name = "BUZ", type = "OI" },
                { name = "KHG", type = "OI" },
            }
        },
        ["BUZ1E"] = {
            name = "BUZ1E",
            runway = "ALL",
            waypoints = {
                { name = "BUZ", type = "OI" },
                { name = "KHG", type = "OI" },
            }
        },
        ["IBKU1A"] = {
            name = "IBKU1A",
            runway = "RW31",
            waypoints = {
                { name = "IBKUG", type = "OI" },
                { name = "D050O", type = "OI" },
            }
        },
        ["IBKU1B"] = {
            name = "IBKU1B",
            runway = "RW13",
            waypoints = {
                { name = "IBKUG", type = "OI" },
                { name = "D313O", type = "OI" },
            }
        },
        ["IBKU1C"] = {
            name = "IBKU1C",
            runway = "ALL",
            waypoints = {
                { name = "IBKUG", type = "OI" },
                { name = "KHG", type = "OI" },
            }
        },
        ["IBKU1E"] = {
            name = "IBKU1E",
            runway = "ALL",
            waypoints = {
                { name = "IBKUG", type = "OI" },
                { name = "KHG", type = "OI" },
            }
        },
        ["IVER1A"] = {
            name = "IVER1A",
            runway = "RW31",
            waypoints = {
                { name = "IVERA", type = "OI" },
                { name = "KHG28", type = "OI" },
                { name = "D050O", type = "OI" },
            }
        },
        ["IVER1C"] = {
            name = "IVER1C",
            runway = "ALL",
            waypoints = {
                { name = "IVERA", type = "OI" },
                { name = "D079Y", type = "OI" },
                { name = "KHG", type = "OI" },
            }
        },
        ["SESM1G"] = {
            name = "SESM1G",
            runway = "RW31",
            waypoints = {
                { name = "SESMA", type = "OI" },
                { name = "KHG30", type = "OI" },
                { name = "D050O", type = "OI" },
            }
        },
        ["SESM1H"] = {
            name = "SESM1H",
            runway = "RW13",
            waypoints = {
                { name = "SESMA", type = "OI" },
                { name = "D030P", type = "OI" },
                { name = "D313O", type = "OI" },
            }
        },
        ["SESM1J"] = {
            name = "SESM1J",
            runway = "ALL",
            waypoints = {
                { name = "SESMA", type = "OI" },
                { name = "KH30A", type = "OI" },
                { name = "KHG", type = "OI" },
            }
        },
        ["SESM1K"] = {
            name = "SESM1K",
            runway = "ALL",
            waypoints = {
                { name = "SESMA", type = "OI" },
                { name = "KHG", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D31-1"] = {
            name = "D31-1",
            type = "A",
            runway = "D31-1",
            waypoints = {
                { name = "D050O", transition = "D050O", type = "OI", altitude_min = 3000, speed = 220.0 },
                { name = "", transition = "D050O", type = "" },
                { name = "CD31", transition = "D050O", type = "OI", altitude_min = 1500 },
                { name = "CD31", transition = "", type = "OI", altitude_min = 1500 },
                { name = "FD31", transition = "", type = "OI", altitude_min = 1200 },
                { name = "MD31", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI" },
                { name = "", transition = "", type = "" },
                { name = "D050O", transition = "", type = "OI" },
                { name = "D050O", transition = "", type = "OI", speed = 230.0 },
            }
        },
        ["D31-2"] = {
            name = "D31-2",
            type = "A",
            runway = "D31-2",
            waypoints = {
                { name = "KHG", transition = "KHG", type = "OI", altitude_min = 3000, speed = 220.0 },
                { name = "KHG", transition = "KHG", type = "OI" },
                { name = "CD31", transition = "KHG", type = "OI" },
                { name = "CD31", transition = "", type = "OI" },
                { name = "FD31", transition = "", type = "OI", altitude_min = 1200 },
                { name = "MD31", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI", altitude_min = 1700 },
                { name = "KHG", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["N13"] = {
            name = "N13",
            type = "A",
            runway = "N13",
            waypoints = {
                { name = "KHG", transition = "KHG1", type = "OI", altitude_min = 3000 },
                { name = "D135G", transition = "KHG1", type = "OI", altitude_min = 1500 },
                { name = "D135G", transition = "KHG1", type = "OI" },
                { name = "FN13", transition = "KHG1", type = "OI", altitude_min = 1500 },
                { name = "KHG", transition = "KHG2", type = "OI", altitude_min = 3000 },
                { name = "D135I", transition = "KHG2", type = "OI", altitude_min = 1500 },
                { name = "D135I", transition = "KHG2", type = "OI" },
                { name = "FN13", transition = "KHG2", type = "OI", altitude_min = 1500 },
                { name = "FN13", transition = "", type = "OI", altitude_min = 1500 },
                { name = "RW13", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI", altitude_min = 2000 },
                { name = "KHG", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI", altitude_min = 3000 },
            }
        },
        ["N31"] = {
            name = "N31",
            type = "A",
            runway = "N31",
            waypoints = {
                { name = "KHG", transition = "KHG1", type = "OI", altitude_min = 3000 },
                { name = "D312G", transition = "KHG1", type = "OI", altitude_min = 1500 },
                { name = "D312G", transition = "KHG1", type = "OI" },
                { name = "FN31", transition = "KHG1", type = "OI", altitude_min = 1500 },
                { name = "KHG", transition = "KHG2", type = "OI", altitude_min = 3000 },
                { name = "D312I", transition = "KHG2", type = "OI", altitude_min = 1500 },
                { name = "D312I", transition = "KHG2", type = "OI" },
                { name = "FN31", transition = "KHG2", type = "OI", altitude_min = 1500 },
                { name = "FN31", transition = "", type = "OI", altitude_min = 1500 },
                { name = "RW31", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI", altitude_min = 2000 },
                { name = "KHG", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI", altitude_min = 3000 },
            }
        },
        ["S13"] = {
            name = "S13",
            type = "A",
            runway = "S13",
            waypoints = {
                { name = "KHG", transition = "KHG", type = "OI", altitude_min = 3000 },
                { name = "KHG", transition = "KHG", type = "OI" },
                { name = "FS13", transition = "KHG", type = "OI" },
                { name = "FS13", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI", altitude_min = 1700 },
                { name = "KHG", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["S31"] = {
            name = "S31",
            type = "A",
            runway = "S31",
            waypoints = {
                { name = "KHG", transition = "KHG", type = "OI", altitude_min = 3000, speed = 220.0 },
                { name = "KHG", transition = "KHG", type = "OI" },
                { name = "FS31", transition = "KHG", type = "OI" },
                { name = "FS31", transition = "", type = "OI" },
                { name = "RW31", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI", altitude_min = 1700 },
                { name = "KHG", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["VDM1"] = {
            name = "VDM1",
            type = "A",
            runway = "VDM1",
            waypoints = {
                { name = "D313O", transition = "D313O", type = "OI", altitude_min = 3000, speed = 220.0 },
                { name = "CD133", transition = "D313O", type = "OI", altitude_min = 1800 },
                { name = "CD133", transition = "", type = "OI", altitude_min = 1800 },
                { name = "FD133", transition = "", type = "OI", altitude_min = 1500 },
                { name = "MD133", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI" },
                { name = "D313O", transition = "", type = "OI" },
                { name = "D313O", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["VDM2"] = {
            name = "VDM2",
            type = "A",
            runway = "VDM2",
            waypoints = {
                { name = "KHG", transition = "KHG", type = "OI", altitude_min = 3000, speed = 220.0 },
                { name = "KHG", transition = "KHG", type = "OI" },
                { name = "CD133", transition = "KHG", type = "OI", altitude_min = 1800 },
                { name = "CD133", transition = "", type = "OI", altitude_min = 1800 },
                { name = "FD133", transition = "", type = "OI", altitude_min = 1500 },
                { name = "MD133", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI", altitude_min = 1700 },
                { name = "KHG", transition = "", type = "OI" },
                { name = "KHG", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
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
