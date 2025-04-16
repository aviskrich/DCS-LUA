local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OINE",
        Name = "OINE Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["FF088"] = { lat = 37.394697222, lon = 55.295783333, type = "OINE" },
    },

    -- Данные ВПП
    Runways = {
        ["RW10"] = {
            heading = 100,
            length = 570.0,
            width = 0,
            threshold = { lat = 37.385819444444444, lon = 55.43988611111111 },
            end = { lat = 37.3695295322521, lon = 55.55615689090337 }
        },
        ["RW28"] = {
            heading = 280,
            length = 570.0,
            width = 0,
            threshold = { lat = 37.38163055555555, lon = 55.459719444444445 },
            end = { lat = 37.397920467747895, lon = 55.343455159803284 }
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
        ["NDBA"] = {
            name = "NDBA",
            type = "A",
            runway = "NDBA",
            waypoints = {
                { name = "KLH", transition = "KLH", type = "OI", altitude_min = 6500 },
                { name = "KLH", transition = "KLH", type = "OI", speed = 185.0 },
                { name = "FF088", transition = "KLH", type = "OI" },
                { name = "FF088", transition = "", type = "OI" },
                { name = "KLH", transition = "", type = "OI" },
                { name = "", transition = "", type = "" },
                { name = "KLH", transition = "", type = "OI", altitude_min = 4500 },
                { name = "KLH", transition = "", type = "OI" },
                { name = "KLH", transition = "", type = "OI", altitude_min = 6500 },
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
