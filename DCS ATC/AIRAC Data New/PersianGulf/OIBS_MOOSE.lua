local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIBS",
        Name = "OIBS Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["FD12"] = { lat = 24.364894444, lon = 9.345463889, type = "DAAJ" },
        ["D318L"] = { lat = 65.709036111, lon = 21.877788889, type = "ESPA" },
        ["MD12"] = { lat = 24.308311111, lon = 9.424586111, type = "DAAJ" },
        ["FN30"] = { lat = -19.783769444, lon = 63.461466667, type = "FIMR" },
        ["FD30"] = { lat = -20.922388889, lon = 55.670472222, type = "FMEE" },
        ["MD30"] = { lat = 28.470361111, lon = -16.307222222, type = "GCXO" },
        ["EN30"] = { lat = 47.671622222, lon = 1.213708333, type = "LFOQ" },
        ["CD12"] = { lat = 35.562533333, lon = 7.860733333, type = "DABS" },
    },

    -- Данные ВПП
    Runways = {
        ["RW12"] = {
            heading = 120,
            length = -300.0,
            width = 0,
            threshold = { lat = 25.916205555555553, lon = 54.52934166666667 },
            end = { lat = 25.940892362267732, lon = 54.48180199827792 }
        },
        ["RW30"] = {
            heading = 300,
            length = 300.0,
            width = 0,
            threshold = { lat = 25.902930555555553, lon = 54.54934444444444 },
            end = { lat = 25.927617362267732, lon = 54.50181012642183 }
        },
    },

    -- Процедуры SID
    SID = {
        ["KIS1A"] = {
            name = "KIS1A",
            runway = "RW30",
            waypoints = {
                { name = "RW30", type = "P", altitude_min = 1100 },
                { name = "KIS", type = "D" },
            }
        },
        ["KIS1B"] = {
            name = "KIS1B",
            runway = "RW12",
            waypoints = {
                { name = "RW12", type = "P", altitude_min = 1100 },
                { name = "", type = "" },
                { name = "KIS", type = "D" },
            }
        },
        ["KIS1C"] = {
            name = "KIS1C",
            runway = "RW30",
            waypoints = {
                { name = "RW30", type = "P", altitude_min = 1100 },
                { name = "KIS", type = "D" },
            }
        },
        ["KIS1D"] = {
            name = "KIS1D",
            runway = "RW12",
            waypoints = {
                { name = "RW12", type = "P", altitude_min = 1100 },
                { name = "", type = "" },
                { name = "KIS", type = "D" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["KIS1R"] = {
            name = "KIS1R",
            runway = "ALL",
            waypoints = {
                { name = "KIS", type = "OI" },
                { name = "SIR", type = "OI" },
            }
        },
        ["KIS1S"] = {
            name = "KIS1S",
            runway = "ALL",
            waypoints = {
                { name = "KIS", type = "OI" },
                { name = "D318L", type = "OI" },
            }
        },
        ["KIS1T"] = {
            name = "KIS1T",
            runway = "ALL",
            waypoints = {
                { name = "KIS", type = "OI" },
                { name = "SIR", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D12"] = {
            name = "D12",
            type = "A",
            runway = "D12",
            waypoints = {
                { name = "D318L", transition = "D318L", type = "OI", altitude_min = 3000 },
                { name = "", transition = "D318L", type = "" },
                { name = "CD12", transition = "D318L", type = "OI", altitude_min = 1600 },
                { name = "CD12", transition = "", type = "OI", altitude_min = 1600 },
                { name = "FD12", transition = "", type = "OI", altitude_min = 1600 },
                { name = "MD12", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 434 },
                { name = "", transition = "", type = "" },
                { name = "D318L", transition = "", type = "OI" },
                { name = "D318L", transition = "", type = "OI" },
            }
        },
        ["D30"] = {
            name = "D30",
            type = "A",
            runway = "D30",
            waypoints = {
                { name = "SIR", transition = "SIR1", type = "OI", altitude_min = 3000, speed = 220.0 },
                { name = "SIR", transition = "SIR1", type = "OI" },
                { name = "FD30", transition = "SIR1", type = "OI" },
                { name = "SIR", transition = "SIR2", type = "OI", altitude_min = 3000 },
                { name = "SIR", transition = "SIR2", type = "OI" },
                { name = "FD30", transition = "SIR2", type = "OI" },
                { name = "FD30", transition = "", type = "OI" },
                { name = "MD30", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 430 },
                { name = "", transition = "", type = "", altitude_min = 2100 },
                { name = "SIR", transition = "", type = "OI" },
                { name = "SIR", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["N30"] = {
            name = "N30",
            type = "A",
            runway = "N30",
            waypoints = {
                { name = "SIR", transition = "SIR", type = "OI", altitude_min = 3000 },
                { name = "SIR", transition = "SIR", type = "OI" },
                { name = "FN30", transition = "SIR", type = "OI" },
                { name = "FN30", transition = "", type = "OI" },
                { name = "EN30", transition = "", type = "OI" },
                { name = "SIR", transition = "", type = "OI", altitude_min = 430 },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "SIR", transition = "", type = "OI" },
                { name = "SIR", transition = "", type = "OI" },
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
