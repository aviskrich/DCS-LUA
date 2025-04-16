local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KCDC",
        Name = "KCDC Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["RW20"] = { lat = 27.705122222, lon = 85.363066667, type = "VNKT" },
        ["SUITE"] = { lat = 37.553247222, lon = -113.225272222, type = "ENRT" },
        ["MATZO"] = { lat = 37.246086111, lon = -113.2693, type = "ENRT" },
        ["XOJPO"] = { lat = 37.744341667, lon = -113.061730556, type = "KCDC" },
        ["RUSBE"] = { lat = 37.953711111, lon = -113.05235, type = "KCDC" },
        ["WULMU"] = { lat = 37.678216667, lon = -113.324291667, type = "KCDC" },
        ["CLEMO"] = { lat = 37.997777778, lon = -112.843263889, type = "KCDC" },
        ["FEDAK"] = { lat = 37.497652778, lon = -113.251105556, type = "ENRT" },
        ["SAYHO"] = { lat = 37.803191667, lon = -113.011155556, type = "KCDC" },
        ["SULKE"] = { lat = 37.446822222, lon = -113.274788889, type = "ENRT" },
        ["RW02"] = { lat = 25.801388889, lon = 71.4775, type = "VIUT" },
        ["NOPAH"] = { lat = 38.237463889, lon = -112.584908333, type = "ENRT" },
        ["VELDE"] = { lat = 37.916966667, lon = -112.913136111, type = "KCDC" },
        ["HINRA"] = { lat = -37.882111111, lon = 175.76, type = "ENRT" },
        ["FEBUX"] = { lat = 37.639888889, lon = -113.15125, type = "ENRT" },
        ["FEDID"] = { lat = 37.52755, lon = -113.549005556, type = "ENRT" },
        ["ZUMAS"] = { lat = 37.620575, lon = -113.167747222, type = "KCDC" },
        ["WISEB"] = { lat = 37.96625, lon = -112.9242, type = "KCDC" },
        ["HISDU"] = { lat = 37.842716667, lon = -112.977155556, type = "KCDC" },
        ["BERYL"] = { lat = 37.900047222, lon = -113.385716667, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW02"] = {
            heading = 20,
            length = 0,
            width = 0,
            threshold = { lat = 37.69061111111111, lon = -113.10781944444444 },
            end = { lat = 37.69061111111111, lon = -113.10781944444444 }
        },
        ["RW08"] = {
            heading = 80,
            length = 0,
            width = 0,
            threshold = { lat = 37.70272777777778, lon = -113.10613055555555 },
            end = { lat = 37.70272777777778, lon = -113.10613055555555 }
        },
        ["RW20"] = {
            heading = 200,
            length = 0,
            width = 0,
            threshold = { lat = 37.71024444444445, lon = -113.0909861111111 },
            end = { lat = 37.71024444444445, lon = -113.0909861111111 }
        },
        ["RW26"] = {
            heading = 260,
            length = 0,
            width = 0,
            threshold = { lat = 37.70115833333334, lon = -113.0895861111111 },
            end = { lat = 37.70115833333334, lon = -113.0895861111111 }
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
        ["I20"] = {
            name = "I20",
            type = "A",
            runway = "I20",
            waypoints = {
                { name = "BCE", transition = "BCE", type = "K2" },
                { name = "EHK", transition = "BCE", type = "K2", altitude_min = 13300 },
                { name = "BERYL", transition = "BCE", type = "K2", altitude_min = 11000 },
                { name = "CLEMO", transition = "BCE", type = "K2", altitude_min = 11000 },
                { name = "HISDU", transition = "BCE", type = "K2", altitude_min = 8700 },
                { name = "CLEMO", transition = "CLEMO", type = "K2", altitude_min = 11000 },
                { name = "HISDU", transition = "CLEMO", type = "K2", altitude_min = 8700 },
                { name = "MLF", transition = "MLF", type = "K2" },
                { name = "CLEMO", transition = "MLF", type = "K2", altitude_min = 11000 },
                { name = "HISDU", transition = "MLF", type = "K2", altitude_min = 8700 },
                { name = "NOPAH", transition = "NOPAH", type = "K2" },
                { name = "CLEMO", transition = "NOPAH", type = "K2", altitude_min = 11000 },
                { name = "HISDU", transition = "NOPAH", type = "K2", altitude_min = 8700 },
                { name = "HISDU", transition = "", type = "K2" },
                { name = "SAYHO", transition = "", type = "K2" },
                { name = "RW20", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 6200 },
                { name = "", transition = "", type = "" },
                { name = "BERYL", transition = "", type = "K2", altitude_min = 10000 },
                { name = "BERYL", transition = "", type = "K2", altitude_min = 10000 },
            }
        },
        ["R02"] = {
            name = "R02",
            type = "A",
            runway = "R02",
            waypoints = {
                { name = "BERYL", transition = "BERYL", type = "K2" },
                { name = "FEDID", transition = "BERYL", type = "K2", altitude_min = 11000 },
                { name = "SULKE", transition = "BERYL", type = "K2", altitude_min = 10900, speed = 190.0 },
                { name = "MATZO", transition = "MATZO", type = "K2" },
                { name = "SULKE", transition = "MATZO", type = "K2", altitude_min = 10900, speed = 190.0 },
                { name = "SULKE", transition = "", type = "K2", altitude_min = 10900, speed = 190.0 },
                { name = "FEDAK", transition = "", type = "K2", altitude_min = 9900 },
                { name = "SUITE", transition = "", type = "K2", altitude_min = 8800 },
                { name = "FEBUX", transition = "", type = "K2", altitude_min = 6800 },
                { name = "RW02", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 6800 },
                { name = "BERYL", transition = "", type = "K2", altitude_min = 9800 },
                { name = "BERYL", transition = "", type = "K2" },
            }
        },
        ["R20"] = {
            name = "R20",
            type = "A",
            runway = "R20",
            waypoints = {
                { name = "BERYL", transition = "BERYL", type = "K2" },
                { name = "HINRA", transition = "BERYL", type = "K2", altitude_min = 9100 },
                { name = "VELDE", transition = "BERYL", type = "K2", altitude_min = 9100 },
                { name = "MLF", transition = "MLF", type = "K2" },
                { name = "WISEB", transition = "MLF", type = "K2", altitude_min = 9500 },
                { name = "VELDE", transition = "MLF", type = "K2", altitude_min = 9100 },
                { name = "VELDE", transition = "", type = "K2", altitude_min = 9100 },
                { name = "SAYHO", transition = "", type = "K2", altitude_min = 7800 },
                { name = "XOJPO", transition = "", type = "K2", altitude_min = 6440 },
                { name = "RW20", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 5825 },
                { name = "ZUMAS", transition = "", type = "K2" },
                { name = "WULMU", transition = "", type = "K2" },
                { name = "BERYL", transition = "", type = "K2", altitude_min = 9800 },
                { name = "BERYL", transition = "", type = "K2" },
            }
        },
        ["S20"] = {
            name = "S20",
            type = "A",
            runway = "S20",
            waypoints = {
                { name = "EHK", transition = "EHK", type = "K2", altitude_min = 10800 },
                { name = "EHK", transition = "EHK", type = "K2", altitude_min = 8700 },
                { name = "EHK", transition = "EHK", type = "K2", altitude_min = 7200 },
                { name = "MLF", transition = "MLF", type = "K2" },
                { name = "RUSBE", transition = "MLF", type = "K2", altitude_min = 10000 },
                { name = "EHK", transition = "MLF", type = "K2", altitude_min = 7200 },
                { name = "EHK", transition = "", type = "K2", altitude_min = 7200 },
                { name = "RW20", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 6030 },
                { name = "", transition = "", type = "" },
                { name = "BERYL", transition = "", type = "K2", altitude_min = 11500 },
                { name = "BERYL", transition = "", type = "K2", altitude_min = 11500 },
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
