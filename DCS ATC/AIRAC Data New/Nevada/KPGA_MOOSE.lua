local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KPGA",
        Name = "KPGA Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["IYOGY"] = { lat = 37.108680556, lon = -111.487880556, type = "KPGA" },
        ["FF147"] = { lat = -22.150383333, lon = -54.990552778, type = "SBDO" },
        ["AROGE"] = { lat = 36.766744444, lon = -111.411030556, type = "ENRT" },
        ["CABER"] = { lat = 37.392111111, lon = -111.662475, type = "ENRT" },
        ["PAGSY"] = { lat = 37.049502778, lon = -111.474972222, type = "KPGA" },
        ["FAPOV"] = { lat = 36.899938889, lon = -111.442419444, type = "KPGA" },
        ["RASCO"] = { lat = 37.171180556, lon = -111.50155, type = "ENRT" },
        ["RW33"] = { lat = -23.016363889, lon = -47.121994444, type = "SBKP" },
        ["CADRI"] = { lat = 36.788686111, lon = -111.418280556, type = "KPGA" },
        ["JATKA"] = { lat = 36.842744444, lon = -111.43, type = "KPGA" },
        ["EKAME"] = { lat = 36.637227778, lon = -111.385538889, type = "KPGA" },
        ["DIBEY"] = { lat = 36.721080556, lon = -111.40365, type = "KPGA" },
        ["BIGNE"] = { lat = 36.949605556, lon = -111.453213889, type = "KPGA" },
        ["CELAY"] = { lat = 36.571930556, lon = -111.368044444, type = "ENRT" },
        ["ACOSI"] = { lat = 37.118708333, lon = -111.534608333, type = "ENRT" },
        ["AYAVA"] = { lat = 36.86905, lon = -111.435708333, type = "KPGA" },
        ["KLIFF"] = { lat = 36.652066667, lon = -111.650291667, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW07"] = {
            heading = 70,
            length = 0,
            width = 0,
            threshold = { lat = 36.929383333333334, lon = -111.45153055555556 },
            end = { lat = 36.929383333333334, lon = -111.45153055555556 }
        },
        ["RW15"] = {
            heading = 150,
            length = 0,
            width = 0,
            threshold = { lat = 36.93281944444444, lon = -111.44956388888889 },
            end = { lat = 36.93281944444444, lon = -111.44956388888889 }
        },
        ["RW25"] = {
            heading = 250,
            length = 0,
            width = 0,
            threshold = { lat = 36.92999444444444, lon = -111.44606666666667 },
            end = { lat = 36.92999444444444, lon = -111.44606666666667 }
        },
        ["RW33"] = {
            heading = 330,
            length = 0,
            width = 0,
            threshold = { lat = 36.916725, lon = -111.44606944444445 },
            end = { lat = 36.916725, lon = -111.44606944444445 }
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
        ["R15"] = {
            name = "R15",
            type = "A",
            runway = "R15",
            waypoints = {
                { name = "CABER", transition = "CABER", type = "K2" },
                { name = "RASCO", transition = "CABER", type = "K2", altitude_min = 8000 },
                { name = "IYOGY", transition = "CABER", type = "K2", altitude_min = 7200 },
                { name = "PGA", transition = "PGA", type = "K2" },
                { name = "RASCO", transition = "PGA", type = "K2", altitude_min = 8000 },
                { name = "RASCO", transition = "PGA", type = "K2", altitude_min = 8000 },
                { name = "IYOGY", transition = "PGA", type = "K2", altitude_min = 7200 },
                { name = "IYOGY", transition = "", type = "K2", altitude_min = 7200 },
                { name = "PAGSY", transition = "", type = "K2", altitude_min = 6600 },
                { name = "RW15", transition = "", type = "K2" },
                { name = "FAPOV", transition = "", type = "K2" },
                { name = "AROGE", transition = "", type = "K2", altitude_min = 9000 },
                { name = "AROGE", transition = "", type = "K2" },
            }
        },
        ["R33"] = {
            name = "R33",
            type = "A",
            runway = "R33",
            waypoints = {
                { name = "CELAY", transition = "CELAY", type = "K2" },
                { name = "EKAME", transition = "CELAY", type = "K2", altitude_min = 8200 },
                { name = "DIBEY", transition = "CELAY", type = "K2", altitude_min = 7500 },
                { name = "KLIFF", transition = "KLIFF", type = "K2" },
                { name = "EKAME", transition = "KLIFF", type = "K2", altitude_min = 8200 },
                { name = "DIBEY", transition = "KLIFF", type = "K2", altitude_min = 7500 },
                { name = "DIBEY", transition = "", type = "K2", altitude_min = 7500 },
                { name = "CADRI", transition = "", type = "K2", altitude_min = 6900 },
                { name = "JATKA", transition = "", type = "K2", altitude_min = 5800 },
                { name = "AYAVA", transition = "", type = "K2", altitude_min = 5280 },
                { name = "RW33", transition = "", type = "K2" },
                { name = "BIGNE", transition = "", type = "K2" },
                { name = "ACOSI", transition = "", type = "K2", altitude_min = 8500 },
                { name = "ACOSI", transition = "", type = "K2" },
            }
        },
        ["VORB"] = {
            name = "VORB",
            type = "A",
            runway = "VORB",
            waypoints = {
                { name = "PGA", transition = "PGA", type = "K2", altitude_min = 6700 },
                { name = "FF147", transition = "PGA", type = "K2", altitude_min = 6700 },
                { name = "FF147", transition = "", type = "K2", altitude_min = 6700 },
                { name = "PGA", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 5360 },
                { name = "PGA", transition = "", type = "K2", altitude_min = 6000 },
                { name = "PGA", transition = "", type = "K2", altitude_min = 7000 },
                { name = "PGA", transition = "", type = "K2" },
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
