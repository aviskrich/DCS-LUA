local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIBV",
        Name = "OIBV Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["FD29"] = { lat = 6.170194444, lon = 6.769363889, type = "DNAS" },
        ["D343O"] = { lat = 40.902308333, lon = 17.87775, type = "LIBR" },
        ["FN29"] = { lat = 0.349008333, lon = 6.7912, type = "FPST" },
        ["CD29"] = { lat = 36.773597222, lon = 10.437925, type = "DTTA" },
        ["MD29"] = { lat = -33.034661111, lon = 27.842786111, type = "FAEL" },
        ["D063O"] = { lat = 68.662311111, lon = 15.677547222, type = "ENSK" },
    },

    -- Данные ВПП
    Runways = {
        ["RW11"] = {
            heading = 110,
            length = 700.0,
            width = 0,
            threshold = { lat = 26.815408333333334, lon = 53.34045277777778 },
            end = { lat = 26.77600586920689, lon = 53.461754382945045 }
        },
        ["RW29"] = {
            heading = 290,
            length = -200.0,
            width = 0,
            threshold = { lat = 26.806825, lon = 53.36584722222222 },
            end = { lat = 26.79556715310673, lon = 53.400502199882574 }
        },
    },

    -- Процедуры SID
    SID = {
        ["KIS1G"] = {
            name = "KIS1G",
            runway = "RW29",
            waypoints = {
                { name = "", type = "", altitude_min = 450 },
                { name = "", type = "" },
                { name = "KIS", type = "D" },
            }
        },
        ["KIS1H"] = {
            name = "KIS1H",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 450 },
                { name = "KIS", type = "D" },
            }
        },
        ["LAM2A"] = {
            name = "LAM2A",
            runway = "RW29",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "LVA", type = "D", altitude_min = 2000 },
                { name = "LVA", type = "D", altitude_min = 4000 },
                { name = "LAM", type = "D" },
            }
        },
        ["LAM2B"] = {
            name = "LAM2B",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 480 },
                { name = "LVA", type = "D", altitude_min = 2000 },
                { name = "LVA", type = "D", altitude_min = 4000 },
                { name = "LAM", type = "D" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["KIS1V"] = {
            name = "KIS1V",
            runway = "RW29",
            waypoints = {
                { name = "KIS", type = "OI" },
                { name = "D063O", type = "OI" },
            }
        },
        ["LAM1P"] = {
            name = "LAM1P",
            runway = "RW29",
            waypoints = {
                { name = "LAM", type = "OI" },
                { name = "D343O", type = "OI" },
                { name = "D063O", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D29"] = {
            name = "D29",
            type = "A",
            runway = "D29",
            waypoints = {
                { name = "D063O", transition = "D063O", type = "OI", altitude_min = 6000 },
                { name = "", transition = "D063O", type = "" },
                { name = "CD29", transition = "D063O", type = "OI", altitude_min = 2500 },
                { name = "CD29", transition = "", type = "OI", altitude_min = 2500 },
                { name = "FD29", transition = "", type = "OI", altitude_min = 1500 },
                { name = "MD29", transition = "", type = "OI" },
                { name = "LVA", transition = "", type = "OI", altitude_min = 450 },
                { name = "LVA", transition = "", type = "OI", altitude_min = 2200 },
                { name = "LVA", transition = "", type = "OI" },
                { name = "D063O", transition = "", type = "OI" },
                { name = "D063O", transition = "", type = "OI", speed = 220.0 },
            }
        },
        ["N29"] = {
            name = "N29",
            type = "A",
            runway = "N29",
            waypoints = {
                { name = "LVA", transition = "LVA1", type = "OI", altitude_min = 3000, speed = 185.0 },
                { name = "LVA", transition = "LVA1", type = "OI" },
                { name = "FN29", transition = "LVA1", type = "OI" },
                { name = "LVA", transition = "LVA2", type = "OI", altitude_min = 3000 },
                { name = "LVA", transition = "LVA2", type = "OI" },
                { name = "FN29", transition = "LVA2", type = "OI" },
                { name = "FN29", transition = "", type = "OI" },
                { name = "LVA", transition = "", type = "OI" },
                { name = "LVA", transition = "", type = "OI", altitude_min = 1500 },
                { name = "LVA", transition = "", type = "OI" },
                { name = "LVA", transition = "", type = "OI", speed = 210.0 },
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
