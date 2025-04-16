local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OISR",
        Name = "OISR Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["D085Y"] = { lat = 27.395413889, lon = 53.651391667, type = "OISR" },
        ["FD29"] = { lat = 6.170194444, lon = 6.769363889, type = "DNAS" },
        ["ROTAL"] = { lat = 27.544722222, lon = 53.888888889, type = "ENRT" },
        ["CD29"] = { lat = 36.773597222, lon = 10.437925, type = "DTTA" },
        ["D084Y"] = { lat = 27.398161111, lon = 53.651216667, type = "OISR" },
        ["MD29"] = { lat = -33.034661111, lon = 27.842786111, type = "FAEL" },
        ["D107P"] = { lat = 11.874888889, lon = -15.376833333, type = "GGOV" },
        ["KUPTO"] = { lat = 28.405, lon = 52.908888889, type = "ENRT" },
        ["D109P"] = { lat = 43.4844, lon = -5.702672222, type = "LEAS" },
    },

    -- Данные ВПП
    Runways = {
        ["RW11"] = {
            heading = 110,
            length = 0.0,
            width = 0,
            threshold = { lat = 27.378680555555555, lon = 53.17440277777778 },
            end = { lat = 27.378680555555555, lon = 53.17440277777778 }
        },
        ["RW29"] = {
            heading = 290,
            length = 0.0,
            width = 0,
            threshold = { lat = 27.367491666666666, lon = 53.20266388888889 },
            end = { lat = 27.367491666666666, lon = 53.20266388888889 }
        },
    },

    -- Процедуры SID
    SID = {
        ["KUPT1D"] = {
            name = "KUPT1D",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 1740 },
                { name = "LAM", type = "D", altitude_min = 4400 },
                { name = "LAM", type = "D", altitude_min = 7500 },
                { name = "KUPTO", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["LAM1U"] = {
            name = "LAM1U",
            runway = "RW29",
            waypoints = {
                { name = "LAM", type = "OI" },
                { name = "D109P", type = "OI" },
            }
        },
        ["LAM1V"] = {
            name = "LAM1V",
            runway = "RW29",
            waypoints = {
                { name = "LAM", type = "OI" },
                { name = "D107P", type = "OI" },
            }
        },
        ["LVA1N"] = {
            name = "LVA1N",
            runway = "RW29",
            waypoints = {
                { name = "LVA", type = "OI" },
                { name = "D109P", type = "OI" },
            }
        },
        ["LVA1P"] = {
            name = "LVA1P",
            runway = "RW29",
            waypoints = {
                { name = "LVA", type = "OI" },
                { name = "D107P", type = "OI" },
            }
        },
        ["ROTA1N"] = {
            name = "ROTA1N",
            runway = "RW29",
            waypoints = {
                { name = "ROTAL", type = "OI" },
                { name = "D085Y", type = "OI" },
                { name = "D109P", type = "OI" },
            }
        },
        ["ROTA1P"] = {
            name = "ROTA1P",
            runway = "RW29",
            waypoints = {
                { name = "ROTAL", type = "OI" },
                { name = "D084Y", type = "OI" },
                { name = "D107P", type = "OI" },
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
                { name = "D109P", transition = "D109P", type = "OI", altitude_min = 6800 },
                { name = "CD29", transition = "D109P", type = "OI", altitude_min = 4000 },
                { name = "CD29", transition = "", type = "OI", altitude_min = 4000 },
                { name = "FD29", transition = "", type = "OI", altitude_min = 2850 },
                { name = "MD29", transition = "", type = "OI" },
                { name = "LAM", transition = "", type = "OI", altitude_min = 2010 },
                { name = "LAM", transition = "", type = "OI" },
                { name = "", transition = "", type = "" },
                { name = "D109P", transition = "", type = "OI" },
                { name = "D109P", transition = "", type = "OI", speed = 230.0 },
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
