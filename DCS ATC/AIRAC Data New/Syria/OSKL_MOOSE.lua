local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OSKL",
        Name = "OSKL Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["MD03"] = { lat = 4.999219444, lon = 6.941038889, type = "DNPO" },
        ["FD03"] = { lat = 7.635186111, lon = -5.109291667, type = "DIBK" },
    },

    -- Данные ВПП
    Runways = {
        ["RW03"] = {
            heading = 30,
            length = 0,
            width = 0,
            threshold = { lat = 37.00781666666666, lon = 41.178644444444444 },
            end = { lat = 37.00781666666666, lon = 41.178644444444444 }
        },
        ["RW21"] = {
            heading = 210,
            length = 0,
            width = 0,
            threshold = { lat = 37.03317222222222, lon = 41.20388055555556 },
            end = { lat = 37.03317222222222, lon = 41.20388055555556 }
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
        ["D03"] = {
            name = "D03",
            type = "A",
            runway = "D03",
            waypoints = {
                { name = "KML", transition = "KML", type = "OS", altitude_min = 4000 },
                { name = "KML", transition = "KML", type = "OS", altitude_min = 3000, speed = 200.0 },
                { name = "FD03", transition = "", type = "OS", altitude_min = 3000 },
                { name = "MD03", transition = "", type = "OS" },
                { name = "KML", transition = "", type = "OS", altitude_min = 1830 },
                { name = "KML", transition = "", type = "OS", speed = 200.0 },
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
