local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KVBG",
        Name = "KVBG Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["WOMIX"] = { lat = 34.568047222, lon = -120.354580556, type = "KVBG" },
        ["FOGGY"] = { lat = 34.677763889, lon = -120.506794444, type = "KVBG" },
        ["DWORF"] = { lat = 34.809683333, lon = -120.667569444, type = "KVBG" },
        ["DOYEB"] = { lat = 34.758494444, lon = -120.608513889, type = "KVBG" },
        ["TANLE"] = { lat = 34.644869444, lon = -120.461088889, type = "KVBG" },
        ["ATLAF"] = { lat = 34.891602778, lon = -120.762077778, type = "KVBG" },
        ["DAWNY"] = { lat = 34.639419444, lon = -120.472155556, type = "KVBG" },
        ["HOYTS"] = { lat = 34.491561111, lon = -120.303527778, type = "KVBG" },
        ["WARRN"] = { lat = 34.901097222, lon = -120.748827778, type = "KVBG" },
        ["WIMRI"] = { lat = 34.716119444, lon = -120.560163889, type = "KVBG" },
        ["WATKN"] = { lat = 34.513116667, lon = -120.278622222, type = "KVBG" },
        ["KIWEE"] = { lat = 34.816852778, lon = -120.665855556, type = "KVBG" },
        ["ZIRDI"] = { lat = 34.552319444, lon = -120.372691667, type = "KVBG" },
    },

    -- Данные ВПП
    Runways = {
        ["RW12"] = {
            heading = 120,
            length = 0,
            width = 0,
            threshold = { lat = 34.752291666666665, lon = -120.6014861111111 },
            end = { lat = 34.752291666666665, lon = -120.6014861111111 }
        },
        ["RW30"] = {
            heading = 300,
            length = 0,
            width = 0,
            threshold = { lat = 34.72238333333333, lon = -120.56713888888889 },
            end = { lat = 34.72238333333333, lon = -120.56713888888889 }
        },
    },

    -- Процедуры SID
    SID = {
        ["GVO3"] = {
            name = "GVO3",
            runway = "RW12",
            waypoints = {
                { name = "", type = "", altitude_min = 770 },
                { name = "", type = "", altitude_min = 2000 },
                { name = "GVO", type = "D", altitude_min = 6000 },
            }
        },
        ["VBG3"] = {
            name = "VBG3",
            runway = "RW30",
            waypoints = {
                { name = "", type = "", altitude_min = 1300 },
                { name = "MQO", type = "D", altitude_min = 4000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I12"] = {
            name = "I12",
            type = "A",
            runway = "I12",
            waypoints = {
                { name = "ATLAF", transition = "ATLAF", type = "K2", altitude_max = 8000 },
                { name = "ATLAF", transition = "ATLAF", type = "K2", altitude_min = 3000, speed = 310.0 },
                { name = "ATLAF", transition = "", type = "K2" },
                { name = "DWORF", transition = "", type = "K2" },
                { name = "RW12", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 770 },
                { name = "WATKN", transition = "", type = "K2" },
                { name = "WATKN", transition = "", type = "K2", altitude_max = 8000, speed = 310.0 },
            }
        },
        ["I30"] = {
            name = "I30",
            type = "A",
            runway = "I30",
            waypoints = {
                { name = "HOYTS", transition = "HOYTS", type = "K2", altitude_min = 6000 },
                { name = "ZIRDI", transition = "HOYTS", type = "K2", altitude_min = 4800 },
                { name = "ZIRDI", transition = "", type = "K2" },
                { name = "DAWNY", transition = "", type = "K2" },
                { name = "RW30", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 770 },
                { name = "WARRN", transition = "", type = "K2" },
                { name = "WARRN", transition = "", type = "K2", altitude_max = 8000, speed = 310.0 },
            }
        },
        ["T12"] = {
            name = "T12",
            type = "A",
            runway = "T12",
            waypoints = {
                { name = "WARRN", transition = "WARRN", type = "K2", altitude_min = 3000, speed = 310.0 },
                { name = "WARRN", transition = "", type = "K2", altitude_min = 3000 },
                { name = "KIWEE", transition = "", type = "K2", altitude_min = 1900 },
                { name = "DOYEB", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 770 },
                { name = "WATKN", transition = "", type = "K2" },
                { name = "WATKN", transition = "", type = "K2", altitude_max = 8000, speed = 310.0 },
            }
        },
        ["T30"] = {
            name = "T30",
            type = "A",
            runway = "T30",
            waypoints = {
                { name = "WATKN", transition = "WATKN", type = "K2", altitude_min = 6000 },
                { name = "WOMIX", transition = "WATKN", type = "K2", altitude_min = 4600 },
                { name = "WOMIX", transition = "", type = "K2", altitude_min = 4600 },
                { name = "TANLE", transition = "", type = "K2", altitude_min = 2400 },
                { name = "FOGGY", transition = "", type = "K2", altitude_min = 1800 },
                { name = "WIMRI", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 770 },
                { name = "WARRN", transition = "", type = "K2" },
                { name = "WARRN", transition = "", type = "K2", altitude_max = 8000, speed = 310.0 },
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
