local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "PGWT",
        Name = "PGWT Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Marianas"
    },

    -- Путевые точки
    Waypoints = {
        ["ELOXE"] = { lat = 14.981975, lon = 145.527833333, type = "PGWT" },
        ["DAMQY"] = { lat = 14.962538889, lon = 145.424830556, type = "PGWT" },
        ["COVHI"] = { lat = 14.880386111, lon = 145.44125, type = "PGWT" },
        ["HIRCH"] = { lat = 14.789197222, lon = 145.768522222, type = "ENRT" },
        ["SNAPP"] = { lat = 15.853438889, lon = 146.605783333, type = "ENRT" },
        ["WILLE"] = { lat = 14.974166667, lon = 145.365086111, type = "ENRT" },
        ["HEXUG"] = { lat = 14.850669444, lon = 145.313408333, type = "ENRT" },
        ["CENOR"] = { lat = 15.061119444, lon = 145.405111111, type = "ENRT" },
        ["GAFWY"] = { lat = 14.802833333, lon = 145.840769444, type = "PGWT" },
        ["FIPMU"] = { lat = 15.006316667, lon = 145.625127778, type = "PGWT" },
        ["DUCFI"] = { lat = 15.016069444, lon = 145.709127778, type = "PGWT" },
        ["SHODA"] = { lat = 15.142694444, lon = 145.787908333, type = "ENRT" },
        ["UYHEW"] = { lat = 15.049622222, lon = 145.660216667, type = "PGWT" },
        ["SADVE"] = { lat = 15.036344444, lon = 145.817316667, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW08"] = {
            heading = 80,
            length = 400.0,
            width = 0,
            threshold = { lat = 14.996980555555554, lon = 145.6073861111111 },
            end = { lat = 15.008412072883516, lon = 145.67450352247513 }
        },
        ["RW26"] = {
            heading = 260,
            length = 0,
            width = 0,
            threshold = { lat = 15.001480555555556, lon = 145.63131388888888 },
            end = { lat = 15.001480555555556, lon = 145.63131388888888 }
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
                { name = "HIRCH", transition = "HIRCH", type = "PG" },
                { name = "SN", transition = "HIRCH", type = "PG", altitude_min = 2800 },
                { name = "SN", transition = "HIRCH", type = "PG", altitude_min = 2800 },
                { name = "WILLE", transition = "WILLE", type = "PG" },
                { name = "SN", transition = "WILLE", type = "PG", altitude_min = 2800 },
                { name = "SN", transition = "WILLE", type = "PG", altitude_min = 2800 },
                { name = "SN", transition = "", type = "PG", altitude_min = 2800 },
                { name = "UYHEW", transition = "", type = "PG", altitude_min = 1060 },
                { name = "FIPMU", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1060 },
                { name = "SN", transition = "", type = "PG", altitude_min = 2800 },
                { name = "SN", transition = "", type = "PG" },
            }
        },
        ["R08"] = {
            name = "R08",
            type = "A",
            runway = "R08",
            waypoints = {
                { name = "HEXUG", transition = "HEXUG", type = "PG" },
                { name = "DAMQY", transition = "HEXUG", type = "PG", altitude_min = 2600 },
                { name = "HIRCH", transition = "HIRCH", type = "PG" },
                { name = "COVHI", transition = "HIRCH", type = "PG", altitude_min = 2600 },
                { name = "DAMQY", transition = "HIRCH", type = "PG", altitude_min = 2600 },
                { name = "SN", transition = "SN", type = "PG" },
                { name = "CENOR", transition = "SN", type = "PG", altitude_min = 2600 },
                { name = "DAMQY", transition = "SN", type = "PG", altitude_min = 2600 },
                { name = "DAMQY", transition = "", type = "PG", altitude_min = 2600 },
                { name = "ELOXE", transition = "", type = "PG", altitude_min = 1800 },
                { name = "RW08", transition = "", type = "PG" },
                { name = "DUCFI", transition = "", type = "PG" },
                { name = "SN", transition = "", type = "PG", altitude_min = 2800 },
                { name = "SN", transition = "", type = "PG", altitude_min = 2800 },
            }
        },
        ["R26"] = {
            name = "R26",
            type = "A",
            runway = "R26",
            waypoints = {
                { name = "HIRCH", transition = "HIRCH", type = "PG" },
                { name = "GAFWY", transition = "HIRCH", type = "PG", altitude_min = 7000 },
                { name = "SADVE", transition = "HIRCH", type = "PG", altitude_min = 2600 },
                { name = "SNAPP", transition = "SNAPP", type = "PG" },
                { name = "SHODA", transition = "SNAPP", type = "PG", altitude_min = 4700 },
                { name = "SADVE", transition = "SNAPP", type = "PG", altitude_min = 2600 },
                { name = "SADVE", transition = "", type = "PG", altitude_min = 2600 },
                { name = "DUCFI", transition = "", type = "PG", altitude_min = 1800 },
                { name = "RW26", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 780 },
                { name = "SN", transition = "", type = "PG", altitude_min = 2800 },
                { name = "SN", transition = "", type = "PG", altitude_min = 2800 },
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
