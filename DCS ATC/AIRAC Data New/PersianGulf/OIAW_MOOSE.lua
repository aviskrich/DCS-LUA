local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIAW",
        Name = "OIAW Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["GABSU"] = { lat = 30.888611111, lon = 48.509722222, type = "ENRT" },
        ["FN30"] = { lat = -19.783769444, lon = 63.461466667, type = "FIMR" },
        ["FD30"] = { lat = -20.922388889, lon = 55.670472222, type = "FMEE" },
        ["FS30"] = { lat = 32.326847222, lon = 3.902986111, type = "DAUG" },
        ["CI30"] = { lat = 32.297358333, lon = 3.963441667, type = "DAUG" },
        ["CD12"] = { lat = 35.562533333, lon = 7.860733333, type = "DABS" },
        ["FD12"] = { lat = 24.364894444, lon = 9.345463889, type = "DAAJ" },
        ["D121G"] = { lat = 32.331280556, lon = 3.89465, type = "DAUG" },
        ["ITIBI"] = { lat = 31.580833333, lon = 49.275277778, type = "ENRT" },
        ["MD30"] = { lat = 28.470361111, lon = -16.307222222, type = "GCXO" },
        ["CD30"] = { lat = 0.403638889, lon = 25.448533333, type = "FZIC" },
        ["D121F"] = { lat = 32.340144444, lon = 3.877977778, type = "DAUG" },
        ["D299M"] = { lat = 31.455672222, lon = 48.552138889, type = "OIAW" },
        ["50VOR"] = { lat = 35.396983333, lon = 4.272536111, type = "DAAD" },
        ["FN12"] = { lat = -19.735055556, lon = 63.279555556, type = "FIMR" },
        ["EGVAX"] = { lat = 31.726944444, lon = 49.133888889, type = "ENRT" },
        ["D124M"] = { lat = 23.878027778, lon = 35.629583333, type = "HEBR" },
        ["GODMO"] = { lat = 30.907222222, lon = 48.976111111, type = "ENRT" },
        ["MD12"] = { lat = 24.308311111, lon = 9.424586111, type = "DAAJ" },
        ["FF30"] = { lat = 28.437111111, lon = -16.204527778, type = "GCXO" },
        ["FS12"] = { lat = 35.50215, lon = 7.937091667, type = "DABS" },
        ["CF30"] = { lat = 28.402305556, lon = -16.100138889, type = "GCXO" },
    },

    -- Данные ВПП
    Runways = {
        ["RW12"] = {
            heading = 120,
            length = 0,
            width = 0,
            threshold = { lat = 31.344066666666667, lon = 48.750527777777776 },
            end = { lat = 31.344066666666667, lon = 48.750527777777776 }
        },
        ["RW30"] = {
            heading = 300,
            length = 63.0,
            width = 0,
            threshold = { lat = 31.328836111111112, lon = 48.77672222222222 },
            end = { lat = 31.33402034052067, lon = 48.76621019039886 }
        },
    },

    -- Процедуры SID
    SID = {
        ["EGVA1A"] = {
            name = "EGVA1A",
            runway = "RW30",
            waypoints = {
                { name = "RW30", type = "P", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "EGVAX", type = "E", altitude_min = 14000 },
            }
        },
        ["EGVA1B"] = {
            name = "EGVA1B",
            runway = "RW12",
            waypoints = {
                { name = "RW12", type = "P", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "EGVAX", type = "E", altitude_min = 14000 },
            }
        },
        ["EGVA1C"] = {
            name = "EGVA1C",
            runway = "RW30",
            waypoints = {
                { name = "RW30", type = "P", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "AWZ", type = "D", altitude_min = 4000 },
                { name = "AWZ", type = "D", altitude_min = 8000 },
                { name = "EGVAX", type = "E", altitude_min = 14000 },
            }
        },
        ["EGVA1D"] = {
            name = "EGVA1D",
            runway = "RW12",
            waypoints = {
                { name = "", type = "", altitude_min = 470 },
                { name = "AWZ", type = "D", altitude_min = 4000 },
                { name = "AWZ", type = "D", altitude_min = 8000 },
                { name = "EGVAX", type = "E", altitude_min = 14000 },
            }
        },
        ["EGVA1E"] = {
            name = "EGVA1E",
            runway = "RW30",
            waypoints = {
                { name = "RW30", type = "P", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "AWZ", type = "D", altitude_min = 4000 },
                { name = "AWZ", type = "D", altitude_min = 8000 },
                { name = "EGVAX", type = "E", altitude_min = 14000 },
            }
        },
        ["EGVA1F"] = {
            name = "EGVA1F",
            runway = "RW12",
            waypoints = {
                { name = "", type = "", altitude_min = 470 },
                { name = "", type = "" },
                { name = "AWZ", type = "D", altitude_min = 4000 },
                { name = "AWZ", type = "D", altitude_min = 8000 },
                { name = "EGVAX", type = "E", altitude_min = 14000 },
            }
        },
        ["EGVA1G"] = {
            name = "EGVA1G",
            runway = "RW30",
            waypoints = {
                { name = "RW30", type = "P", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "EGVAX", type = "E", altitude_min = 14000 },
            }
        },
        ["EGVA1H"] = {
            name = "EGVA1H",
            runway = "RW12",
            waypoints = {
                { name = "RW12", type = "P", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "EGVAX", type = "E", altitude_min = 14000 },
            }
        },
        ["GABS1A"] = {
            name = "GABS1A",
            runway = "RW30",
            waypoints = {
                { name = "RW30", type = "P", altitude_min = 1100 },
                { name = "", type = "" },
                { name = "GABSU", type = "E" },
            }
        },
        ["GABS1B"] = {
            name = "GABS1B",
            runway = "RW12",
            waypoints = {
                { name = "RW12", type = "P", altitude_min = 1100 },
                { name = "", type = "" },
                { name = "GABSU", type = "E" },
            }
        },
        ["GABS1G"] = {
            name = "GABS1G",
            runway = "RW30",
            waypoints = {
                { name = "RW30", type = "P", altitude_min = 1100 },
                { name = "", type = "" },
                { name = "GABSU", type = "E" },
            }
        },
        ["GABS1H"] = {
            name = "GABS1H",
            runway = "RW12",
            waypoints = {
                { name = "RW12", type = "P", altitude_min = 1100 },
                { name = "", type = "" },
                { name = "GABSU", type = "E" },
            }
        },
        ["GODM1A"] = {
            name = "GODM1A",
            runway = "RW30",
            waypoints = {
                { name = "RW30", type = "P", altitude_min = 1100 },
                { name = "", type = "" },
                { name = "GODMO", type = "E" },
            }
        },
        ["GODM1B"] = {
            name = "GODM1B",
            runway = "RW12",
            waypoints = {
                { name = "RW12", type = "P", altitude_min = 1100 },
                { name = "", type = "" },
                { name = "GODMO", type = "E" },
            }
        },
        ["GODM1G"] = {
            name = "GODM1G",
            runway = "RW30",
            waypoints = {
                { name = "RW30", type = "P", altitude_min = 1100 },
                { name = "", type = "" },
                { name = "GODMO", type = "E" },
            }
        },
        ["GODM1H"] = {
            name = "GODM1H",
            runway = "RW12",
            waypoints = {
                { name = "RW12", type = "P", altitude_min = 1100 },
                { name = "", type = "" },
                { name = "GODMO", type = "E" },
            }
        },
        ["ITIB1A"] = {
            name = "ITIB1A",
            runway = "RW30",
            waypoints = {
                { name = "", type = "", altitude_min = 470 },
                { name = "AWZ", type = "D", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "ITIBI", type = "E", altitude_min = 11000 },
            }
        },
        ["ITIB1B"] = {
            name = "ITIB1B",
            runway = "RW12",
            waypoints = {
                { name = "", type = "", altitude_min = 470 },
                { name = "AWZ", type = "D", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "ITIBI", type = "E", altitude_min = 11000 },
            }
        },
        ["ITIB1C"] = {
            name = "ITIB1C",
            runway = "RW30",
            waypoints = {
                { name = "", type = "", altitude_min = 470 },
                { name = "AWZ", type = "D", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "AWZ", type = "D", altitude_min = 3000 },
                { name = "AWZ", type = "D", altitude_min = 6000 },
                { name = "ITIBI", type = "E" },
            }
        },
        ["ITIB1D"] = {
            name = "ITIB1D",
            runway = "RW12",
            waypoints = {
                { name = "", type = "", altitude_min = 470 },
                { name = "AWZ", type = "D", altitude_min = 3000 },
                { name = "AWZ", type = "D", altitude_min = 6000 },
                { name = "ITIBI", type = "E" },
            }
        },
        ["ITIB1E"] = {
            name = "ITIB1E",
            runway = "RW30",
            waypoints = {
                { name = "", type = "", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "AWZ", type = "D", altitude_min = 3000 },
                { name = "AWZ", type = "D", altitude_min = 6000 },
                { name = "ITIBI", type = "E" },
            }
        },
        ["ITIB1F"] = {
            name = "ITIB1F",
            runway = "RW12",
            waypoints = {
                { name = "", type = "", altitude_min = 470 },
                { name = "", type = "" },
                { name = "AWZ", type = "D", altitude_min = 3000 },
                { name = "AWZ", type = "D", altitude_min = 6000 },
                { name = "ITIBI", type = "E" },
            }
        },
        ["ITIB1G"] = {
            name = "ITIB1G",
            runway = "RW30",
            waypoints = {
                { name = "", type = "", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "ITIBI", type = "E", altitude_min = 11000 },
            }
        },
        ["ITIB1H"] = {
            name = "ITIB1H",
            runway = "RW12",
            waypoints = {
                { name = "", type = "", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "ITIBI", type = "E", altitude_min = 11000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["EGVA1W"] = {
            name = "EGVA1W",
            runway = "ALL",
            waypoints = {
                { name = "EGVAX", type = "OI" },
                { name = "AWZ", type = "OI" },
            }
        },
        ["EGVA1X"] = {
            name = "EGVA1X",
            runway = "RW12",
            waypoints = {
                { name = "EGVAX", type = "OI" },
                { name = "D299M", type = "OI" },
            }
        },
        ["EGVA1Y"] = {
            name = "EGVA1Y",
            runway = "ALL",
            waypoints = {
                { name = "EGVAX", type = "OI" },
                { name = "AWZ", type = "OI" },
            }
        },
        ["EGVA1Z"] = {
            name = "EGVA1Z",
            runway = "RW30",
            waypoints = {
                { name = "EGVAX", type = "OI" },
                { name = "D124M", type = "OI" },
            }
        },
        ["GABS1W"] = {
            name = "GABS1W",
            runway = "ALL",
            waypoints = {
                { name = "GABSU", type = "OI" },
                { name = "AWZ", type = "OI" },
            }
        },
        ["GABS1X"] = {
            name = "GABS1X",
            runway = "RW12",
            waypoints = {
                { name = "GABSU", type = "OI" },
                { name = "D299M", type = "OI" },
            }
        },
        ["GABS1Y"] = {
            name = "GABS1Y",
            runway = "ALL",
            waypoints = {
                { name = "GABSU", type = "OI" },
                { name = "AWZ", type = "OI" },
            }
        },
        ["GABS1Z"] = {
            name = "GABS1Z",
            runway = "RW30",
            waypoints = {
                { name = "GABSU", type = "OI" },
                { name = "D124M", type = "OI" },
            }
        },
        ["GODM1W"] = {
            name = "GODM1W",
            runway = "ALL",
            waypoints = {
                { name = "GODMO", type = "OI" },
                { name = "AWZ", type = "OI" },
            }
        },
        ["GODM1X"] = {
            name = "GODM1X",
            runway = "RW12",
            waypoints = {
                { name = "GODMO", type = "OI" },
                { name = "D299M", type = "OI" },
            }
        },
        ["GODM1Y"] = {
            name = "GODM1Y",
            runway = "ALL",
            waypoints = {
                { name = "GODMO", type = "OI" },
                { name = "AWZ", type = "OI" },
            }
        },
        ["GODM1Z"] = {
            name = "GODM1Z",
            runway = "RW30",
            waypoints = {
                { name = "GODMO", type = "OI" },
                { name = "D124M", type = "OI" },
            }
        },
        ["ITIB1W"] = {
            name = "ITIB1W",
            runway = "ALL",
            waypoints = {
                { name = "ITIBI", type = "OI" },
                { name = "AWZ", type = "OI" },
            }
        },
        ["ITIB1X"] = {
            name = "ITIB1X",
            runway = "RW12",
            waypoints = {
                { name = "ITIBI", type = "OI" },
                { name = "D299M", type = "OI" },
            }
        },
        ["ITIB1Y"] = {
            name = "ITIB1Y",
            runway = "ALL",
            waypoints = {
                { name = "ITIBI", type = "OI" },
                { name = "AWZ", type = "OI" },
            }
        },
        ["ITIB1Z"] = {
            name = "ITIB1Z",
            runway = "RW30",
            waypoints = {
                { name = "ITIBI", type = "OI" },
                { name = "D124M", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D12-Y"] = {
            name = "D12-Y",
            type = "A",
            runway = "D12-Y",
            waypoints = {
                { name = "D299M", transition = "D299M", type = "OI", altitude_min = 3000 },
                { name = "CD12", transition = "D299M", type = "OI", altitude_min = 1800 },
                { name = "CD12", transition = "", type = "OI", altitude_min = 1800 },
                { name = "FD12", transition = "", type = "OI", altitude_min = 1100 },
                { name = "MD12", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "D299M", transition = "", type = "OI" },
                { name = "D299M", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["D12-Z"] = {
            name = "D12-Z",
            type = "A",
            runway = "D12-Z",
            waypoints = {
                { name = "AWZ", transition = "AWZ1", type = "OI", altitude_min = 3000 },
                { name = "AWZ", transition = "AWZ1", type = "OI", altitude_min = 1800, speed = 220.0 },
                { name = "CD12", transition = "AWZ1", type = "OI", altitude_min = 1800 },
                { name = "AWZ", transition = "AWZ2", type = "OI", altitude_min = 3000 },
                { name = "AWZ", transition = "AWZ2", type = "OI", altitude_min = 1800 },
                { name = "CD12", transition = "AWZ2", type = "OI", altitude_min = 1800 },
                { name = "CD12", transition = "", type = "OI", altitude_min = 1800 },
                { name = "FD12", transition = "", type = "OI", altitude_min = 1100 },
                { name = "MD12", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 1700 },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["D30-Y"] = {
            name = "D30-Y",
            type = "A",
            runway = "D30-Y",
            waypoints = {
                { name = "D124M", transition = "D124M", type = "OI", altitude_min = 4000 },
                { name = "CD30", transition = "D124M", type = "OI", altitude_min = 2000 },
                { name = "CD30", transition = "", type = "OI", altitude_min = 2000 },
                { name = "50VOR", transition = "", type = "OI", altitude_min = 1300 },
                { name = "FD30", transition = "", type = "OI", altitude_min = 800 },
                { name = "MD30", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "D124M", transition = "", type = "OI" },
                { name = "D124M", transition = "", type = "OI", altitude_min = 4000, speed = 230.0 },
            }
        },
        ["D30-Z"] = {
            name = "D30-Z",
            type = "A",
            runway = "D30-Z",
            waypoints = {
                { name = "AWZ", transition = "AWZ1", type = "OI", altitude_min = 3000, speed = 220.0 },
                { name = "AWZ", transition = "AWZ1", type = "OI", altitude_min = 2000 },
                { name = "CD30", transition = "AWZ1", type = "OI", altitude_min = 2000 },
                { name = "AWZ", transition = "AWZ2", type = "OI", altitude_min = 3000 },
                { name = "AWZ", transition = "AWZ2", type = "OI", altitude_min = 2000 },
                { name = "CD30", transition = "AWZ2", type = "OI", altitude_min = 2000 },
                { name = "CD30", transition = "", type = "OI", altitude_min = 2000 },
                { name = "50VOR", transition = "", type = "OI", altitude_min = 1300 },
                { name = "FD30", transition = "", type = "OI", altitude_min = 800 },
                { name = "MD30", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 1700 },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["I30-X"] = {
            name = "I30-X",
            type = "A",
            runway = "I30-X",
            waypoints = {
                { name = "AWZ", transition = "AWZ1", type = "OI", altitude_min = 3000, speed = 185.0 },
                { name = "D121F", transition = "AWZ1", type = "OI" },
                { name = "D121F", transition = "AWZ1", type = "OI" },
                { name = "CI30", transition = "AWZ1", type = "OI" },
                { name = "AWZ", transition = "AWZ2", type = "OI", altitude_min = 3000, speed = 140.0 },
                { name = "D121G", transition = "AWZ2", type = "OI" },
                { name = "D121G", transition = "AWZ2", type = "OI" },
                { name = "CI30", transition = "AWZ2", type = "OI" },
                { name = "CI30", transition = "", type = "OI" },
                { name = "FF30", transition = "", type = "OI" },
                { name = "RW30", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 1600 },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["I30-Y"] = {
            name = "I30-Y",
            type = "A",
            runway = "I30-Y",
            waypoints = {
                { name = "D124M", transition = "D124M", type = "OI", altitude_min = 4000, speed = 220.0 },
                { name = "CF30", transition = "D124M", type = "OI" },
                { name = "CF30", transition = "", type = "OI" },
                { name = "FF30", transition = "", type = "OI" },
                { name = "RW30", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "", transition = "", type = "" },
                { name = "D124M", transition = "", type = "OI" },
                { name = "D124M", transition = "", type = "OI", altitude_min = 4000, speed = 230.0 },
            }
        },
        ["I30-Z"] = {
            name = "I30-Z",
            type = "A",
            runway = "I30-Z",
            waypoints = {
                { name = "AWZ", transition = "AWZ1", type = "OI" },
                { name = "AWZ", transition = "AWZ1", type = "OI", altitude_min = 3000, speed = 220.0 },
                { name = "CF30", transition = "AWZ1", type = "OI", altitude_min = 3000 },
                { name = "AWZ", transition = "AWZ2", type = "OI" },
                { name = "AWZ", transition = "AWZ2", type = "OI", altitude_min = 3000, speed = 220.0 },
                { name = "CF30", transition = "AWZ2", type = "OI", altitude_min = 3000 },
                { name = "CF30", transition = "", type = "OI" },
                { name = "FF30", transition = "", type = "OI" },
                { name = "RW30", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 1600 },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["N12"] = {
            name = "N12",
            type = "A",
            runway = "N12",
            waypoints = {
                { name = "AWZ", transition = "AWZ1", type = "OI", altitude_min = 3000 },
                { name = "AWZ", transition = "AWZ1", type = "OI" },
                { name = "FN12", transition = "AWZ1", type = "OI" },
                { name = "AWZ", transition = "AWZ2", type = "OI", altitude_min = 3000 },
                { name = "AWZ", transition = "AWZ2", type = "OI" },
                { name = "FN12", transition = "AWZ2", type = "OI" },
                { name = "FN12", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 1700 },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["N30"] = {
            name = "N30",
            type = "A",
            runway = "N30",
            waypoints = {
                { name = "AWZ", transition = "AWZ1", type = "OI", altitude_min = 3000 },
                { name = "AWZ", transition = "AWZ1", type = "OI", altitude_min = 1700 },
                { name = "FN30", transition = "AWZ1", type = "OI", altitude_min = 1700 },
                { name = "AWZ", transition = "AWZ2", type = "OI", altitude_min = 3000 },
                { name = "AWZ", transition = "AWZ2", type = "OI", altitude_min = 1700 },
                { name = "FN30", transition = "AWZ2", type = "OI", altitude_min = 1700 },
                { name = "FN30", transition = "", type = "OI", altitude_min = 1700 },
                { name = "RW30", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 1700 },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["S12-X"] = {
            name = "S12-X",
            type = "A",
            runway = "S12-X",
            waypoints = {
                { name = "AWZ", transition = "AWZ1", type = "OI", altitude_min = 3000, speed = 185.0 },
                { name = "AWZ", transition = "AWZ1", type = "OI" },
                { name = "FS12", transition = "AWZ1", type = "OI" },
                { name = "AWZ", transition = "AWZ2", type = "OI", altitude_min = 3000 },
                { name = "AWZ", transition = "AWZ2", type = "OI" },
                { name = "FS12", transition = "AWZ2", type = "OI" },
                { name = "FS12", transition = "", type = "OI" },
                { name = "RW12", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 1700 },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["S30-X"] = {
            name = "S30-X",
            type = "A",
            runway = "S30-X",
            waypoints = {
                { name = "AWZ", transition = "AWZ1", type = "OI", altitude_min = 3000 },
                { name = "AWZ", transition = "AWZ1", type = "OI" },
                { name = "FS30", transition = "AWZ1", type = "OI" },
                { name = "AWZ", transition = "AWZ2", type = "OI", altitude_min = 3000 },
                { name = "AWZ", transition = "AWZ2", type = "OI" },
                { name = "FS30", transition = "AWZ2", type = "OI" },
                { name = "FS30", transition = "", type = "OI" },
                { name = "RW30", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 1700 },
                { name = "AWZ", transition = "", type = "OI" },
                { name = "AWZ", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
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
