local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LCGK",
        Name = "LCGK Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["D315F"] = { lat = 29.921816667, lon = 106.760269444, type = "ZUCK" },
        ["DM07A"] = { lat = 35.226625, lon = 33.905719444, type = "LCGK" },
        ["DME08"] = { lat = 35.240291667, lon = 33.600844444, type = "LCGK" },
        ["DME07"] = { lat = 35.239675, lon = 33.621191667, type = "LCGK" },
        ["FN27"] = { lat = 36.977919444, lon = 9.075383333, type = "DTKA" },
        ["D108G"] = { lat = 36.015372222, lon = -79.837458333, type = "KGSO" },
        ["GIRNE"] = { lat = 35.639722222, lon = 33.361666667, type = "ENRT" },
        ["43DME"] = { lat = 57.869391667, lon = 55.933925, type = "USPP" },
    },

    -- Данные ВПП
    Runways = {
        ["RW09"] = {
            heading = 90,
            length = 0,
            width = 0,
            threshold = { lat = 35.236111111111114, lon = 33.70416666666667 },
            end = { lat = 35.236111111111114, lon = 33.70416666666667 }
        },
        ["RW27"] = {
            heading = 270,
            length = 0,
            width = 0,
            threshold = { lat = 35.23583333333333, lon = 33.73555555555556 },
            end = { lat = 35.23583333333333, lon = 33.73555555555556 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ERCA1S"] = {
            name = "ERCA1S",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 543 },
                { name = "ECN", type = "D", altitude_min = 4500 },
                { name = "GIRNE", type = "E" },
            }
        },
        ["GIRN1C"] = {
            name = "GIRN1C",
            runway = "RW09",
            waypoints = {
                { name = "", type = "", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "D315F", type = "P", altitude_min = 3500 },
                { name = "GIRNE", type = "E" },
            }
        },
        ["GIRN1D"] = {
            name = "GIRN1D",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 543 },
                { name = "GKE", type = "D", altitude_min = 3500 },
                { name = "D315F", type = "P" },
                { name = "GIRNE", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ERCA1M"] = {
            name = "ERCA1M",
            runway = "ALL",
            waypoints = {
                { name = "ECN", type = "LC" },
                { name = "GKE", type = "LC", altitude_min = 5000 },
            }
        },
        ["GIRN1M"] = {
            name = "GIRN1M",
            runway = "ALL",
            waypoints = {
                { name = "GIRNE", type = "LC" },
                { name = "D315F", type = "LC", altitude_min = 6000 },
                { name = "GKE", type = "LC", altitude_min = 5000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D09"] = {
            name = "D09",
            type = "A",
            runway = "D09",
            waypoints = {
                { name = "GKE", transition = "GKE", type = "LC", altitude_min = 5000 },
                { name = "DME07", transition = "GKE", type = "LC", altitude_min = 1600 },
                { name = "DME07", transition = "GKE", type = "LC", altitude_min = 1600 },
                { name = "", transition = "GKE", type = "" },
                { name = "DME08", transition = "GKE", type = "LC", altitude_min = 1600 },
                { name = "DME08", transition = "", type = "LC" },
                { name = "DME07", transition = "", type = "LC" },
                { name = "43DME", transition = "", type = "LC" },
                { name = "GKE", transition = "", type = "LC", altitude_min = 673 },
                { name = "GKE", transition = "", type = "LC", altitude_min = 2000 },
                { name = "GKE", transition = "", type = "LC" },
                { name = "GKE", transition = "", type = "LC", altitude_min = 5000 },
            }
        },
        ["D27"] = {
            name = "D27",
            type = "A",
            runway = "D27",
            waypoints = {
                { name = "GKE", transition = "GKE", type = "LC", altitude_min = 5000 },
                { name = "D108G", transition = "GKE", type = "LC", altitude_min = 2100 },
                { name = "DM07A", transition = "GKE", type = "LC", altitude_min = 2100 },
                { name = "DM07A", transition = "", type = "LC" },
                { name = "GKE", transition = "", type = "LC" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "GKE", transition = "", type = "LC", altitude_min = 5000 },
                { name = "GKE", transition = "", type = "LC" },
            }
        },
        ["N27"] = {
            name = "N27",
            type = "A",
            runway = "N27",
            waypoints = {
                { name = "GKE", transition = "R086", type = "LC", altitude_min = 5000 },
                { name = "GKE", transition = "R086", type = "LC", altitude_min = 2600 },
                { name = "FN27", transition = "R086", type = "LC", altitude_min = 2600 },
                { name = "GKE", transition = "R088", type = "LC", altitude_min = 5000 },
                { name = "GKE", transition = "R088", type = "LC", altitude_min = 2600 },
                { name = "FN27", transition = "R088", type = "LC", altitude_min = 2600 },
                { name = "FN27", transition = "", type = "LC" },
                { name = "GKE", transition = "", type = "LC" },
                { name = "", transition = "", type = "", altitude_min = 1000 },
                { name = "GKE", transition = "", type = "LC", altitude_min = 1600 },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "GKE", transition = "", type = "LC" },
                { name = "GKE", transition = "", type = "LC", altitude_min = 5000 },
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
