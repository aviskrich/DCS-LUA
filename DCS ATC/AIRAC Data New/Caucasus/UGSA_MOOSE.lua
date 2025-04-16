local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "UGSA",
        Name = "UGSA Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
    },

    -- Данные ВПП
    Runways = {
        ["RW10"] = {
            heading = 100,
            length = 340.0,
            width = 0,
            threshold = { lat = 41.922713888888886, lon = 44.70854444444445 },
            end = { lat = 41.912997099160116, lon = 44.78260787374213 }
        },
        ["RW28"] = {
            heading = 280,
            length = -340.0,
            width = 0,
            threshold = { lat = 41.92086944444444, lon = 44.715608333333336 },
            end = { lat = 41.91115265471567, lon = 44.78966962178416 }
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
