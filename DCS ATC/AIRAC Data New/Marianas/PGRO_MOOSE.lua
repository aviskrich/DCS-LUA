local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "PGRO",
        Name = "PGRO Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Marianas"
    },

    -- Путевые точки
    Waypoints = {
        ["TOXPA"] = { lat = 14.167952778, lon = 145.445794444, type = "PGRO" },
        ["KAQTU"] = { lat = 13.761927778, lon = 144.970347222, type = "ENRT" },
        ["ZOVIK"] = { lat = 14.311580556, lon = 145.0269, type = "PGRO" },
        ["RW27"] = { lat = 43.322133333, lon = 45.030563889, type = "URMS" },
        ["MONIE"] = { lat = 14.369963889, lon = 145.112788889, type = "ENRT" },
        ["FN09"] = { lat = 13.855255556, lon = 20.728475, type = "FTTC" },
        ["FN27"] = { lat = 36.977919444, lon = 9.075383333, type = "DTKA" },
        ["REWJU"] = { lat = 14.001672222, lon = 145.475822222, type = "PGRO" },
        ["CEPOS"] = { lat = 14.168827778, lon = 145.302227778, type = "PGRO" },
        ["OPBUL"] = { lat = 14.171452778, lon = 145.334341667, type = "PGRO" },
        ["EPCAX"] = { lat = 14.229258333, lon = 145.054230556, type = "PGRO" },
        ["ERTTS"] = { lat = 14.168319444, lon = 145.028916667, type = "ENRT" },
        ["JIRGI"] = { lat = 14.189063889, lon = 145.054986111, type = "PGRO" },
        ["NUJCO"] = { lat = 14.469305556, lon = 145.518961111, type = "ENRT" },
        ["RW09"] = { lat = 43.91315, lon = 2.101808333, type = "LFCI" },
        ["CULPS"] = { lat = 13.997672222, lon = 144.958061111, type = "ENRT" },
        ["ONSUW"] = { lat = 14.180686111, lon = 145.157738889, type = "PGRO" },
    },

    -- Данные ВПП
    Runways = {
        ["RW09"] = {
            heading = 90,
            length = 0,
            width = 0,
            threshold = { lat = 14.17465, lon = 145.23124166666668 },
            end = { lat = 14.17465, lon = 145.23124166666668 }
        },
        ["RW27"] = {
            heading = 270,
            length = 0,
            width = 0,
            threshold = { lat = 14.174047222222221, lon = 145.25099444444444 },
            end = { lat = 14.174047222222221, lon = 145.25099444444444 }
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
        ["N09"] = {
            name = "N09",
            type = "A",
            runway = "N09",
            waypoints = {
                { name = "ERTTS", transition = "ERTTS", type = "PG" },
                { name = "GRO", transition = "ERTTS", type = "PG", altitude_min = 3100 },
                { name = "GRO", transition = "ERTTS", type = "PG", altitude_min = 2900 },
                { name = "FN09", transition = "ERTTS", type = "PG", altitude_min = 2900 },
                { name = "KAQTU", transition = "KAQTU", type = "PG" },
                { name = "GRO", transition = "KAQTU", type = "PG", altitude_min = 3100 },
                { name = "GRO", transition = "KAQTU", type = "PG", altitude_min = 2900 },
                { name = "FN09", transition = "KAQTU", type = "PG", altitude_min = 2900 },
                { name = "FN09", transition = "", type = "PG", altitude_min = 2900 },
                { name = "RW09", transition = "", type = "PG" },
                { name = "GRO", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 2200 },
                { name = "GRO", transition = "", type = "PG", altitude_min = 3100 },
                { name = "GRO", transition = "", type = "PG" },
            }
        },
        ["N27"] = {
            name = "N27",
            type = "A",
            runway = "N27",
            waypoints = {
                { name = "ERTTS", transition = "ERTTS", type = "PG" },
                { name = "GRO", transition = "ERTTS", type = "PG", altitude_min = 3100 },
                { name = "GRO", transition = "ERTTS", type = "PG", altitude_min = 2000 },
                { name = "FN27", transition = "ERTTS", type = "PG", altitude_min = 2000 },
                { name = "KAQTU", transition = "KAQTU", type = "PG" },
                { name = "GRO", transition = "KAQTU", type = "PG", altitude_min = 3100 },
                { name = "GRO", transition = "KAQTU", type = "PG", altitude_min = 2000 },
                { name = "FN27", transition = "KAQTU", type = "PG", altitude_min = 2000 },
                { name = "FN27", transition = "", type = "PG", altitude_min = 2000 },
                { name = "RW27", transition = "", type = "PG" },
                { name = "GRO", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1110 },
                { name = "", transition = "", type = "", altitude_min = 2000 },
                { name = "GRO", transition = "", type = "PG", altitude_min = 3100 },
                { name = "GRO", transition = "", type = "PG" },
            }
        },
        ["R09"] = {
            name = "R09",
            type = "A",
            runway = "R09",
            waypoints = {
                { name = "CULPS", transition = "CULPS", type = "PG" },
                { name = "JIRGI", transition = "CULPS", type = "PG", altitude_min = 3000 },
                { name = "MONIE", transition = "MONIE", type = "PG" },
                { name = "ZOVIK", transition = "MONIE", type = "PG", altitude_min = 3000 },
                { name = "JIRGI", transition = "MONIE", type = "PG", altitude_min = 3000 },
                { name = "JIRGI", transition = "", type = "PG", altitude_min = 3000 },
                { name = "ONSUW", transition = "", type = "PG", altitude_min = 2000 },
                { name = "RW09", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "CEPOS", transition = "", type = "PG" },
                { name = "TOXPA", transition = "", type = "PG", altitude_min = 3000 },
                { name = "TOXPA", transition = "", type = "PG" },
            }
        },
        ["R27"] = {
            name = "R27",
            type = "A",
            runway = "R27",
            waypoints = {
                { name = "KAQTU", transition = "KAQTU", type = "PG" },
                { name = "REWJU", transition = "KAQTU", type = "PG", altitude_min = 3000 },
                { name = "TOXPA", transition = "KAQTU", type = "PG", altitude_min = 3000 },
                { name = "NUJCO", transition = "NUJCO", type = "PG" },
                { name = "TOXPA", transition = "NUJCO", type = "PG", altitude_min = 3000 },
                { name = "TOXPA", transition = "TOXPA", type = "PG", altitude_min = 3000 },
                { name = "TOXPA", transition = "", type = "PG", altitude_min = 3000 },
                { name = "OPBUL", transition = "", type = "PG", altitude_min = 2200 },
                { name = "RW27", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1200 },
                { name = "EPCAX", transition = "", type = "PG", altitude_min = 3000 },
                { name = "EPCAX", transition = "", type = "PG" },
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
