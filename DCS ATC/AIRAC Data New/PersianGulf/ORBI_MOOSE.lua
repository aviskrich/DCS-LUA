local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "ORBI",
        Name = "ORBI Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["VINNU"] = { lat = 33.166366667, lon = 44.312194444, type = "ORBI" },
        ["HIBUT"] = { lat = 33.241433333, lon = 44.260275, type = "ORBI" },
        ["FIDIX"] = { lat = 33.46295, lon = 44.100794444, type = "ORBI" },
        ["CR15R"] = { lat = 33.381375, lon = 44.139297222, type = "ORBI" },
        ["KUPDU"] = { lat = 33.385833333, lon = 44.021111111, type = "ORBI" },
        ["CR33L"] = { lat = 33.129927778, lon = 44.311886111, type = "ORBI" },
        ["MEKBU"] = { lat = 33.011388889, lon = 44.393055556, type = "ORBI" },
        ["LONOR"] = { lat = 32.644166667, lon = 45.082777778, type = "ENRT" },
        ["DEBNI"] = { lat = 33.17045, lon = 44.28415, type = "ENRT" },
        ["JILTU"] = { lat = 33.050491667, lon = 43.89605, type = "ORBI" },
        ["BOVAB"] = { lat = 33.5, lon = 44.0575, type = "ORBI" },
        ["DATUK"] = { lat = 33.083611111, lon = 44.343611111, type = "ORBI" },
        ["NORSU"] = { lat = 33.4275, lon = 44.1075, type = "ORBI" },
        ["PARAP"] = { lat = 33.449166667, lon = 44.011111111, type = "ORBI" },
        ["PAPKE"] = { lat = 33.369502778, lon = 44.172191667, type = "ORBI" },
        ["GEBSE"] = { lat = 33.166388889, lon = 44.311666667, type = "ORBI" },
        ["TOKPI"] = { lat = 33.041944444, lon = 44.257777778, type = "ORBI" },
        ["SEBIE"] = { lat = 33.075, lon = 44.374166667, type = "ORBI" },
        ["DATIX"] = { lat = 33.003055556, lon = 44.317777778, type = "ORBI" },
        ["KISPE"] = { lat = 33.368913889, lon = 44.169319444, type = "ORBI" },
        ["RECOY"] = { lat = 33.465555556, lon = 44.106111111, type = "ORBI" },
        ["GIDOM"] = { lat = 33.340833333, lon = 44.167222222, type = "ORBI" },
    },

    -- Данные ВПП
    Runways = {
        ["RW15L"] = {
            heading = 150,
            length = -20.0,
            width = 0,
            threshold = { lat = 33.28382222222222, lon = 44.231175 },
            end = { lat = 33.286672809122365, lon = 44.22920626645744 }
        },
        ["RW15R"] = {
            heading = 150,
            length = 0,
            width = 0,
            threshold = { lat = 33.26857222222222, lon = 44.216861111111115 },
            end = { lat = 33.26857222222222, lon = 44.216861111111115 }
        },
        ["RW33L"] = {
            heading = 330,
            length = 0,
            width = 0,
            threshold = { lat = 33.24278888888889, lon = 44.23455833333333 },
            end = { lat = 33.24278888888889, lon = 44.23455833333333 }
        },
        ["RW33R"] = {
            heading = 330,
            length = 20.0,
            width = 0,
            threshold = { lat = 33.252575, lon = 44.25261388888889 },
            end = { lat = 33.255425586900145, lon = 44.25064585964491 }
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
        ["D15L"] = {
            name = "D15L",
            type = "A",
            runway = "D15L",
            waypoints = {
                { name = "FIDIX", transition = "FIDIX", type = "OR", altitude_min = 3600 },
                { name = "FIDIX", transition = "", type = "OR", altitude_min = 3600 },
                { name = "KISPE", transition = "", type = "OR", altitude_min = 2100 },
                { name = "BGD", transition = "", type = "OR" },
                { name = "", transition = "", type = "", altitude_min = 520 },
                { name = "", transition = "", type = "" },
                { name = "JILTU", transition = "", type = "OR" },
                { name = "JILTU", transition = "", type = "OR" },
            }
        },
        ["D33R"] = {
            name = "D33R",
            type = "A",
            runway = "D33R",
            waypoints = {
                { name = "SEBIE", transition = "SEBIE", type = "OR", altitude_min = 3600 },
                { name = "SEBIE", transition = "", type = "OR", altitude_min = 3600 },
                { name = "VINNU", transition = "", type = "OR", altitude_min = 2100 },
                { name = "HIBUT", transition = "", type = "OR" },
                { name = "", transition = "", type = "", altitude_min = 520 },
                { name = "JILTU", transition = "", type = "OR" },
                { name = "JILTU", transition = "", type = "OR" },
            }
        },
        ["I15L"] = {
            name = "I15L",
            type = "A",
            runway = "I15L",
            waypoints = {
                { name = "RECOY", transition = "RECOY", type = "OR", altitude_min = 3600 },
                { name = "RECOY", transition = "", type = "OR" },
                { name = "PAPKE", transition = "", type = "OR" },
                { name = "RW15L", transition = "", type = "OR" },
                { name = "", transition = "", type = "", altitude_min = 620 },
                { name = "", transition = "", type = "" },
                { name = "JILTU", transition = "", type = "OR" },
                { name = "JILTU", transition = "", type = "OR" },
            }
        },
        ["I33R"] = {
            name = "I33R",
            type = "A",
            runway = "I33R",
            waypoints = {
                { name = "SEBIE", transition = "SEBIE", type = "OR", altitude_min = 3600 },
                { name = "SEBIE", transition = "", type = "OR" },
                { name = "GEBSE", transition = "", type = "OR" },
                { name = "RW33R", transition = "", type = "OR" },
                { name = "", transition = "", type = "", altitude_min = 600 },
                { name = "JILTU", transition = "", type = "OR" },
                { name = "JILTU", transition = "", type = "OR" },
            }
        },
        ["R15R"] = {
            name = "R15R",
            type = "A",
            runway = "R15R",
            waypoints = {
                { name = "BOVAB", transition = "BOVAB", type = "OR" },
                { name = "NORSU", transition = "BOVAB", type = "OR", altitude_min = 2700 },
                { name = "CR15R", transition = "BOVAB", type = "OR", altitude_min = 2700 },
                { name = "LONOR", transition = "LONOR", type = "OR", altitude_min = 28000 },
                { name = "TOKPI", transition = "LONOR", type = "OR" },
                { name = "KUPDU", transition = "LONOR", type = "OR" },
                { name = "NORSU", transition = "LONOR", type = "OR", altitude_min = 2700 },
                { name = "CR15R", transition = "LONOR", type = "OR", altitude_min = 2700 },
                { name = "PARAP", transition = "PARAP", type = "OR" },
                { name = "NORSU", transition = "PARAP", type = "OR", altitude_min = 2700 },
                { name = "CR15R", transition = "PARAP", type = "OR", altitude_min = 2700 },
                { name = "CR15R", transition = "", type = "OR", altitude_min = 2700 },
                { name = "GIDOM", transition = "", type = "OR", altitude_min = 1800 },
                { name = "RW15R", transition = "", type = "OR" },
                { name = "DATUK", transition = "", type = "OR" },
            }
        },
        ["R33L"] = {
            name = "R33L",
            type = "A",
            runway = "R33L",
            waypoints = {
                { name = "DATIX", transition = "DATIX", type = "OR" },
                { name = "DATUK", transition = "DATIX", type = "OR", altitude_min = 2700 },
                { name = "CR33L", transition = "DATIX", type = "OR", altitude_min = 2700 },
                { name = "LONOR", transition = "LONOR", type = "OR", altitude_min = 18400 },
                { name = "MEKBU", transition = "LONOR", type = "OR" },
                { name = "DATUK", transition = "LONOR", type = "OR", altitude_min = 2700 },
                { name = "CR33L", transition = "LONOR", type = "OR", altitude_min = 2700 },
                { name = "TOKPI", transition = "TOKPI", type = "OR" },
                { name = "DATUK", transition = "TOKPI", type = "OR", altitude_min = 2700 },
                { name = "CR33L", transition = "TOKPI", type = "OR", altitude_min = 2700 },
                { name = "CR33L", transition = "", type = "OR", altitude_min = 2700 },
                { name = "DEBNI", transition = "", type = "OR", altitude_min = 1800 },
                { name = "RW33L", transition = "", type = "OR" },
                { name = "NORSU", transition = "", type = "OR" },
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
