local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OBBS",
        Name = "OBBS Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["FI33R"] = { lat = 25.831211111, lon = 50.637958333, type = "OBBS" },
        ["CI33R"] = { lat = 46.265933333, lon = 4.147058333, type = "LFLN" },
        ["D332C"] = { lat = 25.966277778, lon = 50.564572222, type = "OBBS" },
    },

    -- Данные ВПП
    Runways = {
        ["RW15L"] = {
            heading = 150,
            length = 0,
            width = 0,
            threshold = { lat = 25.93376388888889, lon = 50.58225555555556 },
            end = { lat = 25.93376388888889, lon = 50.58225555555556 }
        },
        ["RW33R"] = {
            heading = 330,
            length = 900.0,
            width = 0,
            threshold = { lat = 25.902969444444444, lon = 50.59899444444444 },
            end = { lat = 26.031245854950818, lon = 50.51666256338781 }
        },
    },

    -- Процедуры SID
    SID = {
    },

    -- Процедуры STAR
    STAR = {
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I33R"] = {
            name = "I33R",
            type = "I",
            runway = "I33R",
            waypoints = {
                { name = "CI33R", transition = "", type = "OB" },
                { name = "FI33R", transition = "", type = "OB" },
                { name = "RW33R", transition = "", type = "OB" },
                { name = "D332C", transition = "", type = "OB" },
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
