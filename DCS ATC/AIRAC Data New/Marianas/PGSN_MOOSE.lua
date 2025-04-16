local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "PGSN",
        Name = "PGSN Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Marianas"
    },

    -- Путевые точки
    Waypoints = {
        ["HIRCH"] = { lat = 14.789197222, lon = 145.768522222, type = "ENRT" },
        ["AGODY"] = { lat = 15.203205556, lon = 145.942163889, type = "PGSN" },
        ["HOGOS"] = { lat = 15.168113889, lon = 145.853166667, type = "PGSN" },
        ["PIRTY"] = { lat = 15.136477778, lon = 145.7734, type = "PGSN" },
        ["YEYNU"] = { lat = 14.970633333, lon = 146.039494444, type = "PGSN" },
        ["FIHVY"] = { lat = 15.155869444, lon = 145.822447222, type = "PGSN" },
        ["YAMMA"] = { lat = 15.035886111, lon = 145.520111111, type = "PGSN" },
        ["RW25"] = { lat = 13.445891667, lon = -89.041872222, type = "MSLP" },
        ["FN07"] = { lat = 15.251008333, lon = 38.775316667, type = "HHAS" },
        ["KORDY"] = { lat = 15.078022222, lon = 145.62605, type = "PGSN" },
        ["UKUGY"] = { lat = 15.251922222, lon = 146.012244444, type = "PGSN" },
        ["SEQKO"] = { lat = 15.127330556, lon = 145.750344444, type = "PGSN" },
        ["ANEVY"] = { lat = 15.433475, lon = 146.274019444, type = "ENRT" },
        ["ZEKUR"] = { lat = 15.142808333, lon = 145.78935, type = "PGSN" },
        ["OPIHY"] = { lat = 15.205408333, lon = 145.947322222, type = "PGSN" },
        ["LULJY"] = { lat = 14.80415, lon = 145.293972222, type = "ENRT" },
        ["SHAKA"] = { lat = 15.092902778, lon = 145.663602778, type = "PGSN" },
        ["PONOI"] = { lat = 15.014308333, lon = 145.46575, type = "PGSN" },
        ["RW07"] = { lat = 13.435988889, lon = -89.069633333, type = "MSLP" },
        ["KATQO"] = { lat = 14.615936111, lon = 145.633222222, type = "ENRT" },
        ["WILLE"] = { lat = 14.974166667, lon = 145.365086111, type = "ENRT" },
        ["ZILUK"] = { lat = 15.134905556, lon = 145.769494444, type = "PGSN" },
        ["JIDSU"] = { lat = 15.106252778, lon = 145.6972, type = "PGSN" },
    },

    -- Данные ВПП
    Runways = {
        ["RW06"] = {
            heading = 60,
            length = 0,
            width = 0,
            threshold = { lat = 15.118569444444445, lon = 145.72262777777777 },
            end = { lat = 15.118569444444445, lon = 145.72262777777777 }
        },
        ["RW07"] = {
            heading = 70,
            length = 0,
            width = 0,
            threshold = { lat = 15.114474999999999, lon = 145.71793055555557 },
            end = { lat = 15.114474999999999, lon = 145.71793055555557 }
        },
        ["RW24"] = {
            heading = 240,
            length = 0,
            width = 0,
            threshold = { lat = 15.125441666666667, lon = 145.73996944444443 },
            end = { lat = 15.125441666666667, lon = 145.73996944444443 }
        },
        ["RW25"] = {
            heading = 250,
            length = 0,
            width = 0,
            threshold = { lat = 15.123527777777777, lon = 145.74076666666664 },
            end = { lat = 15.123527777777777, lon = 145.74076666666664 }
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
        ["I07"] = {
            name = "I07",
            type = "A",
            runway = "I07",
            waypoints = {
                { name = "HIRCH", transition = "HIRCH", type = "PG" },
                { name = "SN", transition = "HIRCH", type = "PG", altitude_min = 2600 },
                { name = "KORDY", transition = "HIRCH", type = "PG", altitude_min = 2100 },
                { name = "KORDY", transition = "HIRCH", type = "PG", altitude_min = 2100 },
                { name = "WILLE", transition = "WILLE", type = "PG" },
                { name = "PONOI", transition = "WILLE", type = "PG", altitude_min = 2900 },
                { name = "PONOI", transition = "", type = "PG" },
                { name = "KORDY", transition = "", type = "PG" },
                { name = "RW07", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1600 },
                { name = "SN", transition = "", type = "PG", altitude_min = 2800 },
                { name = "SN", transition = "", type = "PG" },
            }
        },
        ["N07-Y"] = {
            name = "N07-Y",
            type = "A",
            runway = "N07-Y",
            waypoints = {
                { name = "HIRCH", transition = "HIRCH", type = "PG" },
                { name = "SN", transition = "HIRCH", type = "PG", altitude_min = 3000 },
                { name = "SN", transition = "HIRCH", type = "PG", altitude_min = 2000 },
                { name = "FN07", transition = "HIRCH", type = "PG", altitude_min = 2000 },
                { name = "WILLE", transition = "WILLE", type = "PG" },
                { name = "SN", transition = "WILLE", type = "PG", altitude_min = 3000 },
                { name = "SN", transition = "WILLE", type = "PG", altitude_min = 2000 },
                { name = "FN07", transition = "WILLE", type = "PG", altitude_min = 2000 },
                { name = "FN07", transition = "", type = "PG", altitude_min = 2000 },
                { name = "SN", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 2400 },
                { name = "SN", transition = "", type = "PG", altitude_min = 3000 },
                { name = "SN", transition = "", type = "PG" },
            }
        },
        ["Q07-Z"] = {
            name = "Q07-Z",
            type = "A",
            runway = "Q07-Z",
            waypoints = {
                { name = "HIRCH", transition = "HIRCH", type = "PG" },
                { name = "SN", transition = "HIRCH", type = "PG", altitude_min = 2600 },
                { name = "SHAKA", transition = "HIRCH", type = "PG", altitude_min = 2600 },
                { name = "SHAKA", transition = "HIRCH", type = "PG", altitude_min = 2000 },
                { name = "WILLE", transition = "WILLE", type = "PG" },
                { name = "YAMMA", transition = "WILLE", type = "PG", altitude_min = 2700 },
                { name = "YAMMA", transition = "", type = "PG", altitude_min = 2700 },
                { name = "SHAKA", transition = "", type = "PG", altitude_min = 1300 },
                { name = "SN", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 1600 },
                { name = "SN", transition = "", type = "PG", altitude_min = 3000 },
                { name = "SHAKA", transition = "", type = "PG" },
                { name = "SHAKA", transition = "", type = "PG" },
            }
        },
        ["Q25"] = {
            name = "Q25",
            type = "A",
            runway = "Q25",
            waypoints = {
                { name = "HIRCH", transition = "HIRCH", type = "PG" },
                { name = "SN", transition = "HIRCH", type = "PG", altitude_min = 3000 },
                { name = "ZEKUR", transition = "HIRCH", type = "PG", altitude_min = 3000 },
                { name = "ZEKUR", transition = "HIRCH", type = "PG", altitude_min = 2600 },
                { name = "WILLE", transition = "WILLE", type = "PG" },
                { name = "SN", transition = "WILLE", type = "PG", altitude_min = 3000 },
                { name = "ZEKUR", transition = "WILLE", type = "PG", altitude_min = 3000 },
                { name = "ZEKUR", transition = "WILLE", type = "PG", altitude_min = 2600 },
                { name = "OPIHY", transition = "", type = "PG", altitude_min = 2600 },
                { name = "HOGOS", transition = "", type = "PG", altitude_min = 1700 },
                { name = "ZEKUR", transition = "", type = "PG", altitude_min = 1300 },
                { name = "PIRTY", transition = "", type = "PG", altitude_min = 980 },
                { name = "SEQKO", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 2000 },
                { name = "SN", transition = "", type = "PG", altitude_min = 2800 },
                { name = "SN", transition = "", type = "PG" },
            }
        },
        ["R07"] = {
            name = "R07",
            type = "A",
            runway = "R07",
            waypoints = {
                { name = "KATQO", transition = "KATQO", type = "PG" },
                { name = "PONOI", transition = "KATQO", type = "PG", altitude_min = 2600 },
                { name = "LULJY", transition = "LULJY", type = "PG" },
                { name = "PONOI", transition = "LULJY", type = "PG", altitude_min = 2600 },
                { name = "SN", transition = "SN", type = "PG" },
                { name = "PONOI", transition = "SN", type = "PG", altitude_min = 2600 },
                { name = "PONOI", transition = "SN", type = "PG", altitude_min = 2600 },
                { name = "PONOI", transition = "", type = "PG", altitude_min = 2600 },
                { name = "KORDY", transition = "", type = "PG", altitude_min = 2100 },
                { name = "JIDSU", transition = "", type = "PG", altitude_min = 660 },
                { name = "RW07", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 520 },
                { name = "AGODY", transition = "", type = "PG", altitude_min = 2600 },
                { name = "AGODY", transition = "", type = "PG" },
            }
        },
        ["R25"] = {
            name = "R25",
            type = "A",
            runway = "R25",
            waypoints = {
                { name = "ANEVY", transition = "ANEVY", type = "PG" },
                { name = "UKUGY", transition = "ANEVY", type = "PG", altitude_min = 2600 },
                { name = "AGODY", transition = "ANEVY", type = "PG", altitude_min = 2600 },
                { name = "KATQO", transition = "KATQO", type = "PG" },
                { name = "YEYNU", transition = "KATQO", type = "PG", altitude_min = 3000 },
                { name = "AGODY", transition = "KATQO", type = "PG", altitude_min = 2600 },
                { name = "LULJY", transition = "LULJY", type = "PG" },
                { name = "AGODY", transition = "LULJY", type = "PG", altitude_min = 3000 },
                { name = "AGODY", transition = "LULJY", type = "PG", altitude_min = 2600 },
                { name = "AGODY", transition = "", type = "PG", altitude_min = 2600 },
                { name = "FIHVY", transition = "", type = "PG", altitude_min = 1900 },
                { name = "ZILUK", transition = "", type = "PG", altitude_min = 840 },
                { name = "RW25", transition = "", type = "PG" },
                { name = "", transition = "", type = "", altitude_min = 600 },
                { name = "PONOI", transition = "", type = "PG", altitude_min = 2600 },
                { name = "PONOI", transition = "", type = "PG" },
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
