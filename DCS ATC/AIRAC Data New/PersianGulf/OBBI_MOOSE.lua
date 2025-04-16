local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OBBI",
        Name = "OBBI Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["OB3N1"] = { lat = 26.248494444, lon = 50.867980556, type = "OBBI" },
        ["KOBOK"] = { lat = 26.97755, lon = 50.5637, type = "ENRT" },
        ["ORDIG"] = { lat = 26.460555556, lon = 51.2675, type = "ENRT" },
        ["OBSAS"] = { lat = 26.439444444, lon = 50.756944444, type = "ENRT" },
        ["MD12R"] = { lat = 41.688666667, lon = -1.102055556, type = "LEZG" },
        ["MD30L"] = { lat = 42.057777778, lon = -0.279472222, type = "LEHC" },
        ["ELELO"] = { lat = 26.538888889, lon = 50.583611111, type = "OBBI" },
        ["BI502"] = { lat = 41.742211111, lon = 16.108077778, type = "ENRT" },
        ["LOVAL"] = { lat = 26.401752778, lon = 50.4062, type = "OBBI" },
        ["BI602"] = { lat = 26.185266667, lon = 50.781666667, type = "OBBI" },
        ["LOVAK"] = { lat = 26.336666667, lon = 50.934166667, type = "OBBI" },
        ["FS30R"] = { lat = 26.218516667, lon = 50.723236111, type = "OBBI" },
        ["MD30R"] = { lat = 41.647555556, lon = -0.988472222, type = "LEZG" },
        ["DAXEL"] = { lat = 26.139569444, lon = 50.860527778, type = "OBBI" },
        ["LADNA"] = { lat = 26.463705556, lon = 50.379063889, type = "ENRT" },
        ["BI501"] = { lat = 26.319336111, lon = 50.549511111, type = "OBBI" },
        ["OB2F1"] = { lat = 26.310172222, lon = 50.561811111, type = "OBBI" },
        ["FD12R"] = { lat = 41.7305, lon = -1.202277778, type = "LEZG" },
        ["BI601"] = { lat = 26.2223, lon = 50.717658333, type = "OBBI" },
        ["CI30R"] = { lat = 34.438472222, lon = 114.136422222, type = "ZHCC" },
        ["FD30L"] = { lat = 42.03425, lon = -0.22025, type = "LEHC" },
        ["OB3F1"] = { lat = 26.218286111, lon = 50.721119444, type = "OBBI" },
        ["ALRAS"] = { lat = 26.468055556, lon = 50.533333333, type = "ENRT" },
        ["OB1N3"] = { lat = 26.453577778, lon = 50.512311111, type = "OBBI" },
        ["FS12L"] = { lat = 26.323363889, lon = 50.544094444, type = "OBBI" },
        ["FI12L"] = { lat = 21.093127778, lon = -86.942786111, type = "MMUN" },
        ["RIGAG"] = { lat = 26.365833333, lon = 50.711388889, type = "ENRT" },
        ["CI12L"] = { lat = 34.650219444, lon = 113.513158333, type = "ZHCC" },
        ["NAGAT"] = { lat = 26.263611111, lon = 50.888611111, type = "ENRT" },
        ["FI30R"] = { lat = 41.598527778, lon = -0.877444444, type = "LEZG" },
        ["FD12L"] = { lat = 43.641944444, lon = 3.834361111, type = "LFMT" },
        ["MD12L"] = { lat = 43.591605556, lon = 3.945547222, type = "LFMT" },
        ["FD30R"] = { lat = 41.626888889, lon = -0.903944444, type = "LEZG" },
    },

    -- Данные ВПП
    Runways = {
        ["RW12L"] = {
            heading = 120,
            length = 0.0,
            width = 0,
            threshold = { lat = 26.278983333333333, lon = 50.61952222222222 },
            end = { lat = 26.278983333333333, lon = 50.61952222222222 }
        },
        ["RW12R"] = {
            heading = 120,
            length = 0.0,
            width = 0,
            threshold = { lat = 26.26965, lon = 50.63211666666667 },
            end = { lat = 26.26965, lon = 50.63211666666667 }
        },
        ["RW30L"] = {
            heading = 300,
            length = 0.0,
            width = 0,
            threshold = { lat = 26.259419444444443, lon = 50.64984444444445 },
            end = { lat = 26.259419444444443, lon = 50.64984444444445 }
        },
        ["RW30R"] = {
            heading = 300,
            length = 0.0,
            width = 0,
            threshold = { lat = 26.26267222222222, lon = 50.64778611111111 },
            end = { lat = 26.26267222222222, lon = 50.64778611111111 }
        },
    },

    -- Процедуры SID
    SID = {
    },

    -- Процедуры STAR
    STAR = {
        ["KOBOK1"] = {
            name = "KOBOK1",
            runway = "",
            waypoints = {
                { name = "KOBOK", type = "OB" },
                { name = "ELELO", type = "OB" },
                { name = "OBSAS", type = "OB" },
                { name = "RIGAG", type = "OB", altitude_min = 5000, altitude_max = 7000 },
                { name = "RIGAG", type = "OB", altitude_min = 5000, altitude_max = 7000 },
                { name = "ALRAS", type = "OB", speed = 210.0 },
                { name = "OBBI", type = "OB" },
                { name = "RIGAG", type = "OB", altitude_min = 5000, altitude_max = 7000 },
                { name = "NAGAT", type = "OB", speed = 210.0 },
                { name = "OBBI", type = "OB" },
            }
        },
        ["LADNA1"] = {
            name = "LADNA1",
            runway = "",
            waypoints = {
                { name = "LADNA", type = "OB" },
                { name = "ELELO", type = "OB" },
                { name = "OBSAS", type = "OB" },
                { name = "RIGAG", type = "OB", altitude_min = 5000, altitude_max = 7000 },
                { name = "RIGAG", type = "OB", altitude_min = 5000, altitude_max = 7000 },
                { name = "ALRAS", type = "OB", speed = 210.0 },
                { name = "OBBI", type = "OB" },
                { name = "RIGAG", type = "OB", altitude_min = 5000, altitude_max = 7000 },
                { name = "NAGAT", type = "OB", speed = 210.0 },
                { name = "OBBI", type = "OB" },
            }
        },
        ["ORDIG1"] = {
            name = "ORDIG1",
            runway = "",
            waypoints = {
                { name = "ORDIG", type = "OB" },
                { name = "LOVAK", type = "OB" },
                { name = "OBSAS", type = "OB" },
                { name = "RIGAG", type = "OB" },
                { name = "RIGAG", type = "OB" },
                { name = "ALRAS", type = "OB", speed = 210.0 },
                { name = "OBBI", type = "OB" },
                { name = "RIGAG", type = "OB" },
                { name = "NAGAT", type = "OB", speed = 210.0 },
                { name = "OBBI", type = "OB" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D12L"] = {
            name = "D12L",
            type = "A",
            runway = "D12L",
            waypoints = {
                { name = "BHR", transition = "BHR1", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR1", type = "OB" },
                { name = "FD12L", transition = "BHR1", type = "OB", altitude_min = 1500 },
                { name = "BHR", transition = "BHR2", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR2", type = "OB" },
                { name = "FD12L", transition = "BHR2", type = "OB", altitude_min = 1500 },
                { name = "FD12L", transition = "", type = "OB", altitude_min = 1500 },
                { name = "MD12L", transition = "", type = "OB" },
                { name = "", transition = "", type = "", altitude_min = 2500 },
            }
        },
        ["D12R"] = {
            name = "D12R",
            type = "A",
            runway = "D12R",
            waypoints = {
                { name = "BHR", transition = "BHR1", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR1", type = "OB" },
                { name = "FD12R", transition = "BHR1", type = "OB", altitude_min = 1500 },
                { name = "BHR", transition = "BHR2", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR2", type = "OB" },
                { name = "FD12R", transition = "BHR2", type = "OB", altitude_min = 1500 },
                { name = "FD12R", transition = "", type = "OB", altitude_min = 1500 },
                { name = "MD12R", transition = "", type = "OB" },
                { name = "", transition = "", type = "", altitude_min = 2500 },
            }
        },
        ["D30L"] = {
            name = "D30L",
            type = "A",
            runway = "D30L",
            waypoints = {
                { name = "BHR", transition = "BHR1", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR1", type = "OB", altitude_min = 1500 },
                { name = "FD30L", transition = "BHR1", type = "OB", altitude_min = 1500 },
                { name = "BHR", transition = "BHR2", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR2", type = "OB", altitude_min = 1500 },
                { name = "FD30L", transition = "BHR2", type = "OB", altitude_min = 1500 },
                { name = "FD30L", transition = "", type = "OB", altitude_min = 1500 },
                { name = "MD30L", transition = "", type = "OB" },
                { name = "", transition = "", type = "", altitude_min = 2500 },
            }
        },
        ["D30R"] = {
            name = "D30R",
            type = "A",
            runway = "D30R",
            waypoints = {
                { name = "BHR", transition = "BHR1", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR1", type = "OB" },
                { name = "FD30R", transition = "BHR1", type = "OB", altitude_min = 1500 },
                { name = "BHR", transition = "BHR2", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR2", type = "OB" },
                { name = "FD30R", transition = "BHR2", type = "OB", altitude_min = 1500 },
                { name = "FD30R", transition = "", type = "OB", altitude_min = 1500 },
                { name = "MD30R", transition = "", type = "OB" },
                { name = "", transition = "", type = "", altitude_min = 2500 },
            }
        },
        ["I12L"] = {
            name = "I12L",
            type = "A",
            runway = "I12L",
            waypoints = {
                { name = "BHR", transition = "BHR", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR", type = "OB", altitude_min = 1500 },
                { name = "CI12L", transition = "BHR", type = "OB", altitude_min = 1500 },
                { name = "CI12L", transition = "", type = "OB" },
                { name = "FI12L", transition = "", type = "OB" },
                { name = "RW12L", transition = "", type = "OB" },
                { name = "", transition = "", type = "", altitude_min = 2500 },
            }
        },
        ["I30R"] = {
            name = "I30R",
            type = "A",
            runway = "I30R",
            waypoints = {
                { name = "BHR", transition = "BHR", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR", type = "OB", altitude_min = 1500 },
                { name = "CI30R", transition = "BHR", type = "OB", altitude_min = 1500 },
                { name = "CI30R", transition = "", type = "OB" },
                { name = "FI30R", transition = "", type = "OB" },
                { name = "RW30R", transition = "", type = "OB" },
                { name = "", transition = "", type = "", altitude_min = 2500 },
            }
        },
        ["R12L"] = {
            name = "R12L",
            type = "A",
            runway = "R12L",
            waypoints = {
                { name = "LOVAL", transition = "LOVAL", type = "OB", altitude_min = 2500 },
                { name = "BI502", transition = "LOVAL", type = "OB", altitude_min = 1400, speed = 210.0 },
                { name = "OB1N3", transition = "OB1N3", type = "OB", altitude_min = 2500 },
                { name = "BI502", transition = "OB1N3", type = "OB", altitude_min = 1400, speed = 210.0 },
                { name = "BI502", transition = "", type = "OB", altitude_min = 1400 },
                { name = "BI501", transition = "", type = "OB", altitude_min = 1400 },
                { name = "RW12L", transition = "", type = "OB" },
                { name = "", transition = "", type = "" },
            }
        },
        ["R12R"] = {
            name = "R12R",
            type = "A",
            runway = "R12R",
            waypoints = {
                { name = "LOVAL", transition = "LOVAL", type = "OB", altitude_min = 2500 },
                { name = "BI502", transition = "LOVAL", type = "OB", altitude_min = 1400, speed = 210.0 },
                { name = "OB1N3", transition = "OB1N3", type = "OB", altitude_min = 2500 },
                { name = "BI502", transition = "OB1N3", type = "OB", altitude_min = 1400, speed = 210.0 },
                { name = "BI502", transition = "", type = "OB", altitude_min = 1400 },
                { name = "OB2F1", transition = "", type = "OB", altitude_min = 1400 },
                { name = "RW12R", transition = "", type = "OB" },
                { name = "", transition = "", type = "" },
            }
        },
        ["R30L"] = {
            name = "R30L",
            type = "A",
            runway = "R30L",
            waypoints = {
                { name = "DAXEL", transition = "DAXEL", type = "OB", altitude_min = 2500 },
                { name = "BI602", transition = "DAXEL", type = "OB", altitude_min = 1400, speed = 210.0 },
                { name = "OB3N1", transition = "OB3N1", type = "OB", altitude_min = 2500 },
                { name = "BI602", transition = "OB3N1", type = "OB", altitude_min = 1400, speed = 210.0 },
                { name = "BI602", transition = "", type = "OB", altitude_min = 1400 },
                { name = "OB3F1", transition = "", type = "OB", altitude_min = 1400 },
                { name = "RW30L", transition = "", type = "OB" },
                { name = "", transition = "", type = "" },
            }
        },
        ["R30R"] = {
            name = "R30R",
            type = "A",
            runway = "R30R",
            waypoints = {
                { name = "DAXEL", transition = "DAXEL", type = "OB", altitude_min = 2500 },
                { name = "BI602", transition = "DAXEL", type = "OB", altitude_min = 1400, speed = 210.0 },
                { name = "OB3N1", transition = "OB3N1", type = "OB", altitude_min = 2500 },
                { name = "BI602", transition = "OB3N1", type = "OB", altitude_min = 1400, speed = 210.0 },
                { name = "BI602", transition = "", type = "OB", altitude_min = 1400 },
                { name = "BI601", transition = "", type = "OB", altitude_min = 1400 },
                { name = "RW30R", transition = "", type = "OB" },
                { name = "", transition = "", type = "" },
            }
        },
        ["S12L"] = {
            name = "S12L",
            type = "A",
            runway = "S12L",
            waypoints = {
                { name = "BHR", transition = "BHR1", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR1", type = "OB" },
                { name = "FS12L", transition = "BHR1", type = "OB", altitude_min = 1500 },
                { name = "BHR", transition = "BHR2", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR2", type = "OB" },
                { name = "FS12L", transition = "BHR2", type = "OB", altitude_min = 1500 },
                { name = "FS12L", transition = "", type = "OB", altitude_min = 1500 },
                { name = "RW12L", transition = "", type = "OB" },
                { name = "BHR", transition = "", type = "OB" },
                { name = "", transition = "", type = "", altitude_min = 2500 },
            }
        },
        ["S30R"] = {
            name = "S30R",
            type = "A",
            runway = "S30R",
            waypoints = {
                { name = "BHR", transition = "BHR1", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR1", type = "OB" },
                { name = "FS30R", transition = "BHR1", type = "OB", altitude_min = 1500 },
                { name = "BHR", transition = "BHR2", type = "OB", altitude_min = 2500 },
                { name = "BHR", transition = "BHR2", type = "OB" },
                { name = "FS30R", transition = "BHR2", type = "OB", altitude_min = 1500 },
                { name = "FS30R", transition = "", type = "OB", altitude_min = 1500 },
                { name = "BHR", transition = "", type = "OB" },
                { name = "", transition = "", type = "", altitude_min = 2500 },
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
