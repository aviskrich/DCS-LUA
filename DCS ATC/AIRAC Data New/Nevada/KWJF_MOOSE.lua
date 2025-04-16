local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KWJF",
        Name = "KWJF Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["SISOY"] = { lat = 34.758547222, lon = -118.153061111, type = "KWJF" },
        ["TRINL"] = { lat = 34.747480556, lon = -118.126444444, type = "KWJF" },
        ["CASTA"] = { lat = 34.532797222, lon = -118.726591667, type = "ENRT" },
        ["EFALO"] = { lat = 34.855511111, lon = -118.377161111, type = "KWJF" },
        ["ETHER"] = { lat = 34.664136111, lon = -117.763519444, type = "ENRT" },
        ["RW06"] = { lat = 22.978633333, lon = -82.424944444, type = "MUHA" },
        ["URGED"] = { lat = 34.774702778, lon = -118.263861111, type = "KWJF" },
        ["DUCUK"] = { lat = 34.745191667, lon = -118.222577778, type = "KWJF" },
        ["HURIM"] = { lat = 34.710191667, lon = -118.3339, type = "KWJF" },
        ["CERUT"] = { lat = 34.729036111, lon = -117.945811111, type = "KWJF" },
        ["HONUL"] = { lat = 34.670897222, lon = -118.479955556, type = "KWJF" },
        ["CAGSI"] = { lat = 34.794666667, lon = -118.447758333, type = "KWJF" },
        ["JILMU"] = { lat = 34.656844444, lon = -118.532002778, type = "KWJF" },
        ["GUVDE"] = { lat = 34.688983333, lon = -118.412825, type = "KWJF" },
        ["PURPS"] = { lat = 34.502236111, lon = -117.781175, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW06"] = {
            heading = 60,
            length = 0,
            width = 0,
            threshold = { lat = 34.73800277777778, lon = -118.23003888888888 },
            end = { lat = 34.73800277777778, lon = -118.23003888888888 }
        },
        ["RW24"] = {
            heading = 240,
            length = 0,
            width = 0,
            threshold = { lat = 34.74409444444444, lon = -118.20724166666668 },
            end = { lat = 34.74409444444444, lon = -118.20724166666668 }
        },
    },

    -- Процедуры SID
    SID = {
        ["PMD1"] = {
            name = "PMD1",
            runway = "RW06",
            waypoints = {
                { name = "", type = "", altitude_min = 2760 },
                { name = "PMD", type = "D" },
                { name = "", type = "", altitude_min = 2760 },
                { name = "PMD", type = "D" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["R06"] = {
            name = "R06",
            type = "A",
            runway = "R06",
            waypoints = {
                { name = "CASTA", transition = "CASTA", type = "K2" },
                { name = "JILMU", transition = "CASTA", type = "K2", altitude_min = 7000 },
                { name = "HONUL", transition = "CASTA", type = "K2", altitude_min = 6400 },
                { name = "HONUL", transition = "", type = "K2", altitude_min = 6400 },
                { name = "GUVDE", transition = "", type = "K2", altitude_min = 5500 },
                { name = "HURIM", transition = "", type = "K2", altitude_min = 4100 },
                { name = "RW06", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2751 },
                { name = "SISOY", transition = "", type = "K2" },
                { name = "ETHER", transition = "", type = "K2", altitude_min = 6000 },
                { name = "ETHER", transition = "", type = "K2" },
            }
        },
        ["R24"] = {
            name = "R24",
            type = "A",
            runway = "R24",
            waypoints = {
                { name = "PURPS", transition = "PURPS", type = "K2" },
                { name = "ETHER", transition = "PURPS", type = "K2", altitude_min = 6000 },
                { name = "CERUT", transition = "PURPS", type = "K2", altitude_min = 6000 },
                { name = "CERUT", transition = "", type = "K2", altitude_min = 6000 },
                { name = "TRINL", transition = "", type = "K2", altitude_min = 3700 },
                { name = "RW24", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2751 },
                { name = "PMD", transition = "", type = "K2", altitude_min = 7200, speed = 210.0 },
                { name = "PMD", transition = "", type = "K2", altitude_min = 7200 },
            }
        },
        ["VORB"] = {
            name = "VORB",
            type = "A",
            runway = "VORB",
            waypoints = {
                { name = "LHS", transition = "LHS", type = "K2" },
                { name = "CAGSI", transition = "LHS", type = "K2", altitude_min = 7300 },
                { name = "EFALO", transition = "LHS", type = "K2", altitude_min = 4800 },
                { name = "URGED", transition = "LHS", type = "K2", altitude_min = 4400 },
                { name = "PMD", transition = "PMD", type = "K2" },
                { name = "URGED", transition = "PMD", type = "K2", altitude_min = 5000 },
                { name = "URGED", transition = "PMD", type = "K2", altitude_min = 4500 },
                { name = "URGED", transition = "", type = "K2", altitude_min = 4400 },
                { name = "DUCUK", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 3320 },
                { name = "PMD", transition = "", type = "K2", altitude_min = 4500 },
                { name = "PMD", transition = "", type = "K2" },
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
