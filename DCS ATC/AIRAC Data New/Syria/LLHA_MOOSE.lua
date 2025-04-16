local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LLHA",
        Name = "LLHA Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["MERVA"] = { lat = 32.781666667, lon = 34.543888889, type = "ENRT" },
        ["ZAHAV"] = { lat = 32.814444444, lon = 34.81, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW15"] = {
            heading = 150,
            length = 0,
            width = 0,
            threshold = { lat = 32.81543055555555, lon = 35.04146111111111 },
            end = { lat = 32.81543055555555, lon = 35.04146111111111 }
        },
        ["RW33"] = {
            heading = 330,
            length = 0,
            width = 0,
            threshold = { lat = 32.80594722222222, lon = 35.04559444444444 },
            end = { lat = 32.80594722222222, lon = 35.04559444444444 }
        },
    },

    -- Процедуры SID
    SID = {
    },

    -- Процедуры STAR
    STAR = {
        ["GALI1A"] = {
            name = "GALI1A",
            runway = "ALL",
            waypoints = {
                { name = "MERVA", type = "LL" },
                { name = "ZAHAV", type = "LL", altitude_min = 3000, altitude_max = 5000 },
            }
        },
        ["GALI1B"] = {
            name = "GALI1B",
            runway = "ALL",
            waypoints = {
                { name = "MERVA", type = "LL" },
                { name = "ZAHAV", type = "LL" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
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
