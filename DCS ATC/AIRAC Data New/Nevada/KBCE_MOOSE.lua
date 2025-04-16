local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KBCE",
        Name = "KBCE Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["ZUGOV"] = { lat = 37.860194444, lon = -111.939530556, type = "KBCE" },
        ["IPYAD"] = { lat = 37.595366667, lon = -112.294002778, type = "KBCE" },
        ["CABER"] = { lat = 37.392111111, lon = -111.662475, type = "ENRT" },
        ["BEYAB"] = { lat = 37.958236111, lon = -111.807286111, type = "KBCE" },
        ["CEXAT"] = { lat = 37.523586111, lon = -112.668088889, type = "ENRT" },
        ["ETIKE"] = { lat = 37.827688889, lon = -111.983241667, type = "KBCE" },
        ["OPAWO"] = { lat = 37.665127778, lon = -112.201005556, type = "KBCE" },
        ["WEKPI"] = { lat = 38.111622222, lon = -111.906719444, type = "KBCE" },
        ["CIXOS"] = { lat = 37.525411111, lon = -112.386983333, type = "KBCE" },
        ["AXGEX"] = { lat = 37.655669444, lon = -111.086822222, type = "ENRT" },
        ["OMUCE"] = { lat = 38.393655556, lon = -111.882916667, type = "ENRT" },
        ["HURTU"] = { lat = 38.195405556, lon = -112.563183333, type = "ENRT" },
        ["HIKMU"] = { lat = 37.883008333, lon = -111.908808333, type = "KBCE" },
        ["EXAKY"] = { lat = 37.633119444, lon = -112.243711111, type = "KBCE" },
        ["CUNYA"] = { lat = 37.824813889, lon = -111.987113889, type = "KBCE" },
        ["YAYDO"] = { lat = 37.857352778, lon = -111.943422222, type = "KBCE" },
        ["WOBNO"] = { lat = 37.748841667, lon = -112.089055556, type = "KBCE" },
        ["HEGID"] = { lat = 37.356366667, lon = -112.272947222, type = "ENRT" },
        ["UJACI"] = { lat = 38.015688889, lon = -111.593975, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW03"] = {
            heading = 30,
            length = 0,
            width = 0,
            threshold = { lat = 37.69948888888889, lon = -112.1551 },
            end = { lat = 37.69948888888889, lon = -112.1551 }
        },
        ["RW21"] = {
            heading = 210,
            length = 0,
            width = 0,
            threshold = { lat = 37.71340277777778, lon = -112.13649722222223 },
            end = { lat = 37.71340277777778, lon = -112.13649722222223 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BRYCE2"] = {
            name = "BRYCE2",
            runway = "RW03",
            waypoints = {
                { name = "", type = "", altitude_min = 8100 },
                { name = "YAYDO", type = "P" },
                { name = "BCE", type = "D", altitude_min = 13300 },
                { name = "", type = "" },
                { name = "BCE", type = "D" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["R03"] = {
            name = "R03",
            type = "A",
            runway = "R03",
            waypoints = {
                { name = "BCE", transition = "BCE", type = "K2" },
                { name = "CIXOS", transition = "BCE", type = "K2", altitude_min = 11800 },
                { name = "CIXOS", transition = "BCE", type = "K2", altitude_min = 11100 },
                { name = "CABER", transition = "CABER", type = "K2" },
                { name = "CIXOS", transition = "CABER", type = "K2", altitude_min = 11800 },
                { name = "CIXOS", transition = "CABER", type = "K2", altitude_min = 11100 },
                { name = "CEXAT", transition = "CEXAT", type = "K2" },
                { name = "CIXOS", transition = "CEXAT", type = "K2", altitude_min = 11100 },
                { name = "HEGID", transition = "HEGID", type = "K2" },
                { name = "CIXOS", transition = "HEGID", type = "K2", altitude_min = 11100 },
                { name = "CIXOS", transition = "", type = "K2", altitude_min = 11100 },
                { name = "IPYAD", transition = "", type = "K2", altitude_min = 10600 },
                { name = "EXAKY", transition = "", type = "K2", altitude_min = 9500 },
                { name = "RW03", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 7990 },
                { name = "ETIKE", transition = "", type = "K2" },
                { name = "WEKPI", transition = "", type = "K2" },
                { name = "HURTU", transition = "", type = "K2", altitude_min = 13000 },
                { name = "HURTU", transition = "", type = "K2" },
            }
        },
        ["R21"] = {
            name = "R21",
            type = "A",
            runway = "R21",
            waypoints = {
                { name = "AXGEX", transition = "AXGEX", type = "K2" },
                { name = "BEYAB", transition = "AXGEX", type = "K2", altitude_min = 12800 },
                { name = "BCE", transition = "BCE", type = "K2" },
                { name = "BEYAB", transition = "BCE", type = "K2", altitude_min = 13100 },
                { name = "BEYAB", transition = "BCE", type = "K2", altitude_min = 12800 },
                { name = "OMUCE", transition = "OMUCE", type = "K2" },
                { name = "BEYAB", transition = "OMUCE", type = "K2", altitude_min = 12800 },
                { name = "UJACI", transition = "UJACI", type = "K2" },
                { name = "BEYAB", transition = "UJACI", type = "K2", altitude_min = 12800 },
                { name = "BEYAB", transition = "", type = "K2", altitude_min = 12800 },
                { name = "HIKMU", transition = "", type = "K2", altitude_min = 12000 },
                { name = "ZUGOV", transition = "", type = "K2", altitude_min = 11600 },
                { name = "CUNYA", transition = "", type = "K2", altitude_min = 10700 },
                { name = "WOBNO", transition = "", type = "K2", altitude_min = 8580 },
                { name = "RW21", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 7879 },
                { name = "OPAWO", transition = "", type = "K2" },
                { name = "CEXAT", transition = "", type = "K2", altitude_min = 12300 },
                { name = "CEXAT", transition = "", type = "K2" },
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
