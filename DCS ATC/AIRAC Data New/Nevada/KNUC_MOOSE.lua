local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KNUC",
        Name = "KNUC Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["FARNA"] = { lat = 33.033186111, lon = -118.561213889, type = "KNUC" },
        ["WEBUK"] = { lat = 33.058172222, lon = -118.487661111, type = "KNUC" },
        ["ZUPET"] = { lat = 33.114238889, lon = -118.322019444, type = "KNUC" },
        ["SHOTS"] = { lat = 33.089347222, lon = -118.395663889, type = "KNUC" },
        ["PUMPE"] = { lat = 33.057319444, lon = -118.490277778, type = "KNUC" },
        ["BIREE"] = { lat = 33.163891667, lon = -118.174605556, type = "KNUC" },
        ["PYRAS"] = { lat = 33.139086111, lon = -118.248333333, type = "KNUC" },
        ["HETIT"] = { lat = 33.239211111, lon = -118.326675, type = "KNUC" },
        ["JUROR"] = { lat = 25.344966667, lon = 121.393652778, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW06"] = {
            heading = 60,
            length = 0,
            width = 0,
            threshold = { lat = 33.01781388888889, lon = -118.60248888888889 },
            end = { lat = 33.01781388888889, lon = -118.60248888888889 }
        },
        ["RW24"] = {
            heading = 240,
            length = 0,
            width = 0,
            threshold = { lat = 33.027680555555555, lon = -118.57449722222222 },
            end = { lat = 33.027680555555555, lon = -118.57449722222222 }
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
        ["R24"] = {
            name = "R24",
            type = "A",
            runway = "R24",
            waypoints = {
                { name = "MZB", transition = "MZB", type = "K2", altitude_min = 4000 },
                { name = "JUROR", transition = "MZB", type = "K2", altitude_min = 3000 },
                { name = "JUROR", transition = "MZB", type = "K2", altitude_min = 3000, speed = 230.0 },
                { name = "OCN", transition = "OCN", type = "K2", altitude_min = 4000 },
                { name = "JUROR", transition = "OCN", type = "K2", altitude_min = 3000 },
                { name = "JUROR", transition = "OCN", type = "K2", altitude_min = 3000, speed = 230.0 },
                { name = "SLI", transition = "SLI", type = "K2", altitude_min = 4000 },
                { name = "JUROR", transition = "SLI", type = "K2", altitude_min = 3000 },
                { name = "JUROR", transition = "SLI", type = "K2", altitude_min = 3000, speed = 230.0 },
                { name = "JUROR", transition = "", type = "K2" },
                { name = "PUMPE", transition = "", type = "K2", altitude_min = 1700 },
                { name = "RW24", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "JUROR", transition = "", type = "K2", altitude_min = 3000 },
                { name = "JUROR", transition = "", type = "K2", altitude_max = 4000, speed = 230.0 },
            }
        },
        ["T24-Y"] = {
            name = "T24-Y",
            type = "A",
            runway = "T24-Y",
            waypoints = {
                { name = "MZB", transition = "MZB", type = "K2", altitude_min = 4000 },
                { name = "PYRAS", transition = "MZB", type = "K2", altitude_min = 4000 },
                { name = "SHOTS", transition = "MZB", type = "K2", altitude_min = 3000 },
                { name = "OCN", transition = "OCN", type = "K2", altitude_min = 4000 },
                { name = "PYRAS", transition = "OCN", type = "K2", altitude_min = 4000 },
                { name = "SHOTS", transition = "OCN", type = "K2", altitude_min = 3000 },
                { name = "SLI", transition = "SLI", type = "K2", altitude_min = 4000 },
                { name = "PYRAS", transition = "SLI", type = "K2", altitude_min = 4000 },
                { name = "SHOTS", transition = "SLI", type = "K2", altitude_min = 3000 },
                { name = "SHOTS", transition = "", type = "K2", altitude_min = 3000 },
                { name = "WEBUK", transition = "", type = "K2", altitude_min = 1700 },
                { name = "FARNA", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "", transition = "", type = "" },
                { name = "HETIT", transition = "", type = "K2", altitude_min = 4000 },
                { name = "PYRAS", transition = "", type = "K2" },
                { name = "PYRAS", transition = "", type = "K2", speed = 230.0 },
            }
        },
        ["T24-Z"] = {
            name = "T24-Z",
            type = "A",
            runway = "T24-Z",
            waypoints = {
                { name = "HEC", transition = "HEC", type = "K2" },
                { name = "PDZ", transition = "HEC", type = "K2", altitude_min = 15000 },
                { name = "BIREE", transition = "HEC", type = "K2" },
                { name = "ZUPET", transition = "HEC", type = "K2", altitude_min = 7000 },
                { name = "SHOTS", transition = "HEC", type = "K2", altitude_min = 3000 },
                { name = "IPL", transition = "IPL", type = "K2" },
                { name = "MZB", transition = "IPL", type = "K2", altitude_min = 15000 },
                { name = "BIREE", transition = "IPL", type = "K2" },
                { name = "ZUPET", transition = "IPL", type = "K2", altitude_min = 7000 },
                { name = "SHOTS", transition = "IPL", type = "K2", altitude_min = 3000 },
                { name = "LAX", transition = "LAX", type = "K2", altitude_min = 15000 },
                { name = "BIREE", transition = "LAX", type = "K2" },
                { name = "ZUPET", transition = "LAX", type = "K2", altitude_min = 7000 },
                { name = "SHOTS", transition = "LAX", type = "K2", altitude_min = 3000 },
                { name = "MZB", transition = "MZB", type = "K2", altitude_min = 15000 },
                { name = "BIREE", transition = "MZB", type = "K2" },
                { name = "ZUPET", transition = "MZB", type = "K2", altitude_min = 7000 },
                { name = "SHOTS", transition = "MZB", type = "K2", altitude_min = 3000 },
                { name = "OCN", transition = "OCN", type = "K2", altitude_min = 15000 },
                { name = "BIREE", transition = "OCN", type = "K2" },
                { name = "ZUPET", transition = "OCN", type = "K2", altitude_min = 7000 },
                { name = "SHOTS", transition = "OCN", type = "K2", altitude_min = 3000 },
                { name = "PDZ", transition = "PDZ", type = "K2", altitude_min = 15000 },
                { name = "BIREE", transition = "PDZ", type = "K2" },
                { name = "ZUPET", transition = "PDZ", type = "K2", altitude_min = 7000 },
                { name = "SHOTS", transition = "PDZ", type = "K2", altitude_min = 3000 },
                { name = "PMD", transition = "PMD", type = "K2" },
                { name = "PDZ", transition = "PMD", type = "K2", altitude_min = 15000 },
                { name = "BIREE", transition = "PMD", type = "K2" },
                { name = "ZUPET", transition = "PMD", type = "K2", altitude_min = 7000 },
                { name = "SHOTS", transition = "PMD", type = "K2", altitude_min = 3000 },
                { name = "RZS", transition = "RZS", type = "K2" },
                { name = "LAX", transition = "RZS", type = "K2", altitude_min = 15000 },
                { name = "BIREE", transition = "RZS", type = "K2" },
                { name = "ZUPET", transition = "RZS", type = "K2", altitude_min = 7000 },
                { name = "SHOTS", transition = "RZS", type = "K2", altitude_min = 3000 },
                { name = "SHOTS", transition = "", type = "K2", altitude_min = 3000 },
                { name = "WEBUK", transition = "", type = "K2", altitude_min = 1700 },
                { name = "FARNA", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "", transition = "", type = "" },
                { name = "HETIT", transition = "", type = "K2", altitude_min = 4000 },
                { name = "PYRAS", transition = "", type = "K2" },
                { name = "PYRAS", transition = "", type = "K2", speed = 230.0 },
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
