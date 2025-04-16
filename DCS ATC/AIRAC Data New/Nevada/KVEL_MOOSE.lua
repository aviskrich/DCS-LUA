local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KVEL",
        Name = "KVEL Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["ZIKOS"] = { lat = 39.962836111, lon = -109.269111111, type = "ENRT" },
        ["BONGO"] = { lat = 37.4125, lon = 140.957222222, type = "ENRT" },
        ["WAGUG"] = { lat = 40.369777778, lon = -109.509955556, type = "KVEL" },
        ["RIYAJ"] = { lat = 40.331941667, lon = -109.509119444, type = "KVEL" },
        ["OHAPE"] = { lat = 40.128966667, lon = -109.464911111, type = "ENRT" },
        ["ENSEN"] = { lat = 40.229419444, lon = -109.412380556, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW17"] = {
            heading = 170,
            length = 0,
            width = 0,
            threshold = { lat = 40.445680555555555, lon = -109.51163611111112 },
            end = { lat = 40.445680555555555, lon = -109.51163611111112 }
        },
        ["RW35"] = {
            heading = 350,
            length = 0,
            width = 0,
            threshold = { lat = 40.426474999999996, lon = -109.51121111111111 },
            end = { lat = 40.426474999999996, lon = -109.51121111111111 }
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
        ["R35-Y"] = {
            name = "R35-Y",
            type = "A",
            runway = "R35-Y",
            waypoints = {
                { name = "VEL", transition = "VEL", type = "K2" },
                { name = "OHAPE", transition = "VEL", type = "K2", altitude_min = 10000 },
                { name = "OHAPE", transition = "VEL", type = "K2", altitude_min = 10000 },
                { name = "ZIKOS", transition = "ZIKOS", type = "K2" },
                { name = "OHAPE", transition = "ZIKOS", type = "K2", altitude_min = 10000 },
                { name = "OHAPE", transition = "", type = "K2", altitude_min = 10000 },
                { name = "RIYAJ", transition = "", type = "K2", altitude_min = 7200 },
                { name = "WAGUG", transition = "", type = "K2", altitude_min = 6440 },
                { name = "RW35", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 7000 },
                { name = "OHAPE", transition = "", type = "K2", altitude_min = 10000 },
                { name = "OHAPE", transition = "", type = "K2" },
            }
        },
        ["R35-Z"] = {
            name = "R35-Z",
            type = "A",
            runway = "R35-Z",
            waypoints = {
                { name = "VEL", transition = "VEL", type = "K2" },
                { name = "OHAPE", transition = "VEL", type = "K2", altitude_min = 10000 },
                { name = "OHAPE", transition = "VEL", type = "K2", altitude_min = 10000 },
                { name = "ZIKOS", transition = "ZIKOS", type = "K2" },
                { name = "OHAPE", transition = "ZIKOS", type = "K2", altitude_min = 10000 },
                { name = "OHAPE", transition = "", type = "K2", altitude_min = 10000 },
                { name = "RIYAJ", transition = "", type = "K2", altitude_min = 7200 },
                { name = "RW35", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 7000 },
                { name = "OHAPE", transition = "", type = "K2", altitude_min = 10000 },
                { name = "OHAPE", transition = "", type = "K2" },
            }
        },
        ["S35"] = {
            name = "S35",
            type = "A",
            runway = "S35",
            waypoints = {
                { name = "BONGO", transition = "BONGO", type = "K2" },
                { name = "ENSEN", transition = "BONGO", type = "K2", altitude_min = 8000 },
                { name = "VEL", transition = "BONGO", type = "K2", altitude_min = 6400 },
                { name = "VEL", transition = "VEL", type = "K2", altitude_min = 8000 },
                { name = "VEL", transition = "VEL", type = "K2", altitude_min = 6400 },
                { name = "VEL", transition = "", type = "K2", altitude_min = 6400 },
                { name = "RW35", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 6200 },
                { name = "VEL", transition = "", type = "K2" },
                { name = "ENSEN", transition = "", type = "K2", altitude_min = 8000 },
                { name = "ENSEN", transition = "", type = "K2" },
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
