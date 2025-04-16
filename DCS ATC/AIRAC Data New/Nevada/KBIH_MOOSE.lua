local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KBIH",
        Name = "KBIH Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["FAVEK"] = { lat = 37.669969444, lon = -118.629547222, type = "KBIH" },
        ["GULSE"] = { lat = 37.495527778, lon = -118.457163889, type = "KBIH" },
        ["WALLE"] = { lat = 37.301825, lon = -118.382411111, type = "ENRT" },
        ["CAXOR"] = { lat = 37.531188889, lon = -118.442127778, type = "KBIH" },
        ["BEAVE"] = { lat = 37.343794444, lon = -118.328591667, type = "KBIH" },
        ["JARUT"] = { lat = 37.6589, lon = -118.468211111, type = "KBIH" },
        ["PULIE"] = { lat = 37.13135, lon = -118.177655556, type = "KBIH" },
        ["RBRTS"] = { lat = 37.759016667, lon = -118.905652778, type = "ENRT" },
        ["TEVOC"] = { lat = 37.259986111, lon = -118.05415, type = "KBIH" },
        ["CORUB"] = { lat = 37.688994444, lon = -118.801694444, type = "KBIH" },
        ["JAAKE"] = { lat = 37.493636111, lon = -118.513461111, type = "KBIH" },
        ["CIMOS"] = { lat = 37.439619444, lon = -118.446688889, type = "KBIH" },
        ["KIPSE"] = { lat = 37.691275, lon = -118.485083333, type = "KBIH" },
        ["FOMES"] = { lat = 37.373658333, lon = -118.469763889, type = "KBIH" },
        ["EBOBE"] = { lat = 37.574872222, lon = -118.466961111, type = "KBIH" },
        ["MOTSE"] = { lat = 37.753327778, lon = -118.501061111, type = "KBIH" },
        ["HATAG"] = { lat = 37.714425, lon = -118.546475, type = "KBIH" },
        ["NIKOL"] = { lat = 43.167777778, lon = 132.808888889, type = "ENRT" },
        ["NEBSE"] = { lat = 37.339847222, lon = -118.096630556, type = "KBIH" },
        ["MUBOE"] = { lat = 37.521827778, lon = -118.554855556, type = "KBIH" },
        ["HOSUM"] = { lat = 37.392041667, lon = -118.387997222, type = "KBIH" },
        ["WEBAT"] = { lat = 37.176708333, lon = -118.047705556, type = "KBIH" },
        ["FEDGO"] = { lat = 37.637194444, lon = -118.502430556, type = "KBIH" },
        ["BUTPE"] = { lat = 37.389758333, lon = -118.361994444, type = "KBIH" },
        ["ROCOS"] = { lat = 37.227575, lon = -118.321769444, type = "KBIH" },
        ["PEMKE"] = { lat = 37.537908333, lon = -118.506691667, type = "ENRT" },
        ["NUBIC"] = { lat = 37.820069444, lon = -118.501788889, type = "KBIH" },
        ["HARVU"] = { lat = 37.567058333, lon = -118.450083333, type = "KBIH" },
        ["KUPLE"] = { lat = 37.349552778, lon = -118.335677778, type = "KBIH" },
        ["JABIM"] = { lat = 37.970883333, lon = -118.602194444, type = "ENRT" },
        ["EVERR"] = { lat = 37.714838889, lon = -118.546675, type = "ENRT" },
        ["FOLMA"] = { lat = 37.412263889, lon = -118.412933333, type = "KBIH" },
        ["CASPU"] = { lat = 37.420188889, lon = -118.422708333, type = "KBIH" },
        ["FASBI"] = { lat = 37.942, lon = -118.605238889, type = "KBIH" },
        ["HEGIT"] = { lat = 37.559266667, lon = -118.609925, type = "KBIH" },
    },

    -- Данные ВПП
    Runways = {
        ["RW08"] = {
            heading = 80,
            length = 0,
            width = 0,
            threshold = { lat = 37.37365, lon = -118.3741361111111 },
            end = { lat = 37.37365, lon = -118.3741361111111 }
        },
        ["RW12"] = {
            heading = 120,
            length = 0,
            width = 0,
            threshold = { lat = 37.38014166666667, lon = -118.37333888888888 },
            end = { lat = 37.38014166666667, lon = -118.37333888888888 }
        },
        ["RW26"] = {
            heading = 260,
            length = 0,
            width = 0,
            threshold = { lat = 37.37351666666667, lon = -118.35498055555556 },
            end = { lat = 37.37351666666667, lon = -118.35498055555556 }
        },
        ["RW30"] = {
            heading = 300,
            length = 0,
            width = 0,
            threshold = { lat = 37.365458333333336, lon = -118.35525277777778 },
            end = { lat = 37.365458333333336, lon = -118.35525277777778 }
        },
        ["RW35"] = {
            heading = 350,
            length = 0,
            width = 0,
            threshold = { lat = 37.36535833333333, lon = -118.36180555555555 },
            end = { lat = 37.36535833333333, lon = -118.36180555555555 }
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
        ["R12-Y"] = {
            name = "R12-Y",
            type = "A",
            runway = "R12-Y",
            waypoints = {
                { name = "NIKOL", transition = "NIKOL", type = "K2" },
                { name = "FAVEK", transition = "NIKOL", type = "K2", altitude_min = 12700 },
                { name = "HEGIT", transition = "NIKOL", type = "K2", altitude_min = 9700 },
                { name = "RBRTS", transition = "RBRTS", type = "K2" },
                { name = "CORUB", transition = "RBRTS", type = "K2", altitude_min = 12700 },
                { name = "HEGIT", transition = "RBRTS", type = "K2", altitude_min = 9700 },
                { name = "HEGIT", transition = "", type = "K2", altitude_min = 9700 },
                { name = "MUBOE", transition = "", type = "K2", altitude_min = 8700 },
                { name = "JAAKE", transition = "", type = "K2", altitude_min = 7900 },
                { name = "HOSUM", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 4524 },
                { name = "KUPLE", transition = "", type = "K2" },
                { name = "ROCOS", transition = "", type = "K2" },
                { name = "PULIE", transition = "", type = "K2" },
                { name = "WEBAT", transition = "", type = "K2" },
                { name = "TEVOC", transition = "", type = "K2" },
                { name = "NEBSE", transition = "", type = "K2", speed = 250.0 },
                { name = "BIH", transition = "", type = "K2", altitude_min = 13000 },
                { name = "BIH", transition = "", type = "K2" },
            }
        },
        ["R12-Z"] = {
            name = "R12-Z",
            type = "A",
            runway = "R12-Z",
            waypoints = {
                { name = "NIKOL", transition = "NIKOL", type = "K2" },
                { name = "FAVEK", transition = "NIKOL", type = "K2", altitude_min = 12700 },
                { name = "HEGIT", transition = "NIKOL", type = "K2", altitude_min = 9700 },
                { name = "RBRTS", transition = "RBRTS", type = "K2" },
                { name = "CORUB", transition = "RBRTS", type = "K2", altitude_min = 12700 },
                { name = "HEGIT", transition = "RBRTS", type = "K2", altitude_min = 9700 },
                { name = "HEGIT", transition = "", type = "K2", altitude_min = 9700 },
                { name = "MUBOE", transition = "", type = "K2", altitude_min = 8700 },
                { name = "JAAKE", transition = "", type = "K2", altitude_min = 7900 },
                { name = "CIMOS", transition = "", type = "K2", altitude_min = 6200 },
                { name = "FOLMA", transition = "", type = "K2", altitude_min = 5200 },
                { name = "HOSUM", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 4524 },
                { name = "KUPLE", transition = "", type = "K2" },
                { name = "ROCOS", transition = "", type = "K2" },
                { name = "PULIE", transition = "", type = "K2" },
                { name = "WEBAT", transition = "", type = "K2" },
                { name = "TEVOC", transition = "", type = "K2" },
                { name = "NEBSE", transition = "", type = "K2", speed = 250.0 },
                { name = "BIH", transition = "", type = "K2", altitude_min = 13000 },
                { name = "BIH", transition = "", type = "K2" },
            }
        },
        ["R30"] = {
            name = "R30",
            type = "A",
            runway = "R30",
            waypoints = {
                { name = "EVERR", transition = "EVERR", type = "K2" },
                { name = "PEMKE", transition = "EVERR", type = "K2", altitude_min = 10000 },
                { name = "FOMES", transition = "EVERR", type = "K2", altitude_min = 9000 },
                { name = "FOMES", transition = "", type = "K2", altitude_min = 9000 },
                { name = "WALLE", transition = "", type = "K2", altitude_min = 7000 },
                { name = "BEAVE", transition = "", type = "K2" },
                { name = "RW30", transition = "", type = "K2" },
                { name = "CASPU", transition = "", type = "K2" },
                { name = "GULSE", transition = "", type = "K2" },
                { name = "HARVU", transition = "", type = "K2" },
                { name = "JARUT", transition = "", type = "K2" },
                { name = "KIPSE", transition = "", type = "K2" },
                { name = "MOTSE", transition = "", type = "K2" },
                { name = "NUBIC", transition = "", type = "K2" },
                { name = "FASBI", transition = "", type = "K2" },
                { name = "NIKOL", transition = "", type = "K2", altitude_min = 13000 },
                { name = "NIKOL", transition = "", type = "K2" },
            }
        },
        ["X17"] = {
            name = "X17",
            type = "A",
            runway = "X17",
            waypoints = {
                { name = "NIKOL", transition = "NIKOL", type = "K2" },
                { name = "HATAG", transition = "NIKOL", type = "K2", altitude_min = 12500 },
                { name = "FEDGO", transition = "NIKOL", type = "K2", altitude_min = 10000 },
                { name = "EBOBE", transition = "NIKOL", type = "K2", altitude_min = 8700 },
                { name = "EBOBE", transition = "", type = "K2", altitude_min = 8700 },
                { name = "CAXOR", transition = "", type = "K2", altitude_min = 7800 },
                { name = "BUTPE", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 4524 },
                { name = "", transition = "", type = "" },
                { name = "JABIM", transition = "", type = "K2", altitude_min = 12500 },
                { name = "JABIM", transition = "", type = "K2" },
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
