local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KTPH",
        Name = "KTPH Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["AYUBE"] = { lat = 37.954716667, lon = -117.054516667, type = "KTPH" },
        ["TOBEY"] = { lat = 38.138425, lon = -117.321802778, type = "KTPH" },
        ["AWNIN"] = { lat = 38.101375, lon = -117.104202778, type = "KTPH" },
        ["WURIL"] = { lat = 38.011561111, lon = -117.560247222, type = "ENRT" },
        ["DOBZU"] = { lat = 38.210138889, lon = -117.18275, type = "KTPH" },
        ["BEUTE"] = { lat = 38.165319444, lon = -117.125930556, type = "KTPH" },
        ["GILVE"] = { lat = 38.235580556, lon = -117.325758333, type = "KTPH" },
        ["DECCA"] = { lat = 38.054944444, lon = -117.077611111, type = "KTPH" },
        ["KINKS"] = { lat = 37.972397222, lon = -116.928022222, type = "KTPH" },
        ["ZOTUX"] = { lat = 37.741683333, lon = -117.544508333, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW11"] = {
            heading = 110,
            length = 0,
            width = 0,
            threshold = { lat = 38.06668888888889, lon = -117.09098333333333 },
            end = { lat = 38.06668888888889, lon = -117.09098333333333 }
        },
        ["RW15"] = {
            heading = 150,
            length = 0,
            width = 0,
            threshold = { lat = 38.06753333333334, lon = -117.09271944444444 },
            end = { lat = 38.06753333333334, lon = -117.09271944444444 }
        },
        ["RW29"] = {
            heading = 290,
            length = 0,
            width = 0,
            threshold = { lat = 38.057788888888886, lon = -117.07488611111111 },
            end = { lat = 38.057788888888886, lon = -117.07488611111111 }
        },
        ["RW33"] = {
            heading = 330,
            length = 0,
            width = 0,
            threshold = { lat = 38.04854722222222, lon = -117.08627777777777 },
            end = { lat = 38.04854722222222, lon = -117.08627777777777 }
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
                { name = "WURIL", transition = "WURIL", type = "K2" },
                { name = "GILVE", transition = "WURIL", type = "K2", altitude_min = 10700 },
                { name = "GILVE", transition = "", type = "K2", altitude_min = 10700 },
                { name = "DOBZU", transition = "", type = "K2", altitude_min = 8500 },
                { name = "BEUTE", transition = "", type = "K2", altitude_min = 7800 },
                { name = "AWNIN", transition = "", type = "K2", altitude_min = 6280 },
                { name = "RW15", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 5760 },
                { name = "AYUBE", transition = "", type = "K2" },
                { name = "ZOTUX", transition = "", type = "K2", altitude_min = 11000 },
                { name = "ZOTUX", transition = "", type = "K2" },
            }
        },
        ["VORA"] = {
            name = "VORA",
            type = "A",
            runway = "VORA",
            waypoints = {
                { name = "TPH", transition = "TPH", type = "K2", altitude_min = 8800 },
                { name = "KINKS", transition = "", type = "K2", altitude_min = 8100 },
                { name = "TPH", transition = "", type = "K2", altitude_min = 7100 },
                { name = "DECCA", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 6800 },
                { name = "", transition = "", type = "" },
                { name = "TOBEY", transition = "", type = "K2", altitude_min = 8700 },
                { name = "TOBEY", transition = "", type = "K2" },
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
