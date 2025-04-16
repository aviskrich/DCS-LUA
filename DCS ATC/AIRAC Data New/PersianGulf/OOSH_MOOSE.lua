local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OOSH",
        Name = "OOSH Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["SO503"] = { lat = 11.629163889, lon = -5.709211111, type = "GASO" },
        ["SO430"] = { lat = 24.366666667, lon = 56.534722222, type = "OOSH" },
        ["GIVLA"] = { lat = 24.172222222, lon = 57.008888889, type = "ENRT" },
        ["KATAD"] = { lat = 24.568194444, lon = 56.389972222, type = "OOSH" },
        ["SO06N"] = { lat = 24.490222222, lon = 56.572194444, type = "OOSH" },
        ["SO13S"] = { lat = 24.180555556, lon = 56.730861111, type = "OOSH" },
        ["SO601"] = { lat = 43.34325, lon = -2.075305556, type = "LESO" },
        ["KUNRA"] = { lat = 24.120833333, lon = 56.591944444, type = "ENRT" },
        ["SO500"] = { lat = 59.787080556, lon = 5.347633333, type = "ENSO" },
        ["ELIVA"] = { lat = 23.893055556, lon = 57.109444444, type = "ENRT" },
        ["SO11N"] = { lat = 24.565888889, lon = 56.533305556, type = "OOSH" },
        ["SO704"] = { lat = 24.415833333, lon = 56.809722222, type = "OOSH" },
        ["SO702"] = { lat = 24.599166667, lon = 56.718333333, type = "OOSH" },
        ["SO700"] = { lat = 24.56, lon = 56.627222222, type = "OOSH" },
        ["RW33"] = { lat = -23.016363889, lon = -47.121994444, type = "SBKP" },
        ["NOSMI"] = { lat = 24.299166667, lon = 56.500555556, type = "ENRT" },
        ["SO520"] = { lat = 24.569611111, lon = 56.29675, type = "OOSH" },
        ["SO06S"] = { lat = 24.279083333, lon = 56.680444444, type = "OOSH" },
        ["TARDI"] = { lat = 24.571666667, lon = 56.154166667, type = "ENRT" },
        ["LADBI"] = { lat = 24.54, lon = 56.688055556, type = "ENRT" },
        ["SO800"] = { lat = 12.889180556, lon = 5.091788889, type = "DNSO" },
        ["SO725"] = { lat = 24.486861111, lon = 56.573916667, type = "OOSH" },
        ["BOTAM"] = { lat = 24.040833333, lon = 56.888888889, type = "ENRT" },
        ["SO706"] = { lat = 24.275277778, lon = 56.840833333, type = "OOSH" },
        ["SO651"] = { lat = 24.350083333, lon = 56.845638889, type = "OOSH" },
        ["VAXAS"] = { lat = 24.718888889, lon = 56.301944444, type = "ENRT" },
        ["SO420"] = { lat = 24.128444444, lon = 56.757444444, type = "OOSH" },
        ["ITKAK"] = { lat = 24.640416667, lon = 56.394111111, type = "OOSH" },
        ["SO432"] = { lat = 24.525277778, lon = 56.453333333, type = "OOSH" },
        ["LOREM"] = { lat = 24.216055556, lon = 56.813361111, type = "OOSH" },
    },

    -- Данные ВПП
    Runways = {
        ["RW15"] = {
            heading = 150,
            length = 300.0,
            width = 0,
            threshold = { lat = 24.402455555555555, lon = 56.61723333333333 },
            end = { lat = 24.35969675205343, lon = 56.64434185382601 }
        },
        ["RW33"] = {
            heading = 330,
            length = -300.0,
            width = 0,
            threshold = { lat = 24.369755555555557, lon = 56.634 },
            end = { lat = 24.326996752053432, lon = 56.66110150776345 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ELIV1A"] = {
            name = "ELIV1A",
            runway = "RW15",
            waypoints = {
                { name = "SO420", type = "P" },
                { name = "BOTAM", type = "E" },
                { name = "ELIVA", type = "E" },
            }
        },
        ["ELIV1B"] = {
            name = "ELIV1B",
            runway = "RW33",
            waypoints = {
                { name = "", type = "", altitude_min = 1600, speed = 230.0 },
                { name = "SO700", type = "P", speed = 250.0 },
                { name = "SO702", type = "P", speed = 250.0 },
                { name = "SO704", type = "P", altitude_min = 8000 },
                { name = "SO706", type = "P", altitude_min = 9500 },
                { name = "BOTAM", type = "E", altitude_min = 11000 },
                { name = "ELIVA", type = "E" },
            }
        },
        ["VAXA1A"] = {
            name = "VAXA1A",
            runway = "RW15",
            waypoints = {
                { name = "", type = "", altitude_min = 1600 },
                { name = "SO430", type = "P", speed = 230.0 },
                { name = "SO432", type = "P", altitude_min = 7000 },
                { name = "ITKAK", type = "P" },
                { name = "VAXAS", type = "E" },
            }
        },
        ["VAXA1B"] = {
            name = "VAXA1B",
            runway = "RW33",
            waypoints = {
                { name = "SO725", type = "P", speed = 230.0 },
                { name = "ITKAK", type = "P" },
                { name = "VAXAS", type = "E", altitude_min = 6000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["GIVL1A"] = {
            name = "GIVL1A",
            runway = "RW15",
            waypoints = {
                { name = "GIVLA", type = "OO", altitude_max = 14000 },
                { name = "SO500", type = "OO" },
                { name = "LADBI", type = "OO", altitude_min = 4500 },
            }
        },
        ["GIVL1B"] = {
            name = "GIVL1B",
            runway = "RW33",
            waypoints = {
                { name = "GIVLA", type = "OO", altitude_max = 10000 },
                { name = "SO800", type = "OO", altitude_max = 7500 },
                { name = "LOREM", type = "OO", altitude_min = 5000, altitude_max = 6000 },
            }
        },
        ["TARD1A"] = {
            name = "TARD1A",
            runway = "RW15",
            waypoints = {
                { name = "TARDI", type = "OO", altitude_min = 6500, altitude_max = 8000 },
                { name = "SO520", type = "OO", altitude_min = 6500 },
                { name = "KATAD", type = "OO", altitude_min = 4000, altitude_max = 5000 },
            }
        },
        ["TARD1B"] = {
            name = "TARD1B",
            runway = "RW33",
            waypoints = {
                { name = "TARDI", type = "OO", altitude_min = 8000, altitude_max = 15000 },
                { name = "NOSMI", type = "OO", altitude_min = 8000 },
                { name = "KUNRA", type = "OO", altitude_min = 4000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["R15"] = {
            name = "R15",
            type = "A",
            runway = "R15",
            waypoints = {
                { name = "KATAD", transition = "KATAD", type = "OO", altitude_min = 4000, altitude_max = 5000 },
                { name = "SO11N", transition = "KATAD", type = "OO", altitude_min = 2500 },
                { name = "LADBI", transition = "LADBI", type = "OO", altitude_min = 4500 },
                { name = "SO503", transition = "LADBI", type = "OO" },
                { name = "SO11N", transition = "LADBI", type = "OO", altitude_min = 2500 },
                { name = "SO11N", transition = "", type = "OO", altitude_min = 2500 },
                { name = "SO06N", transition = "", type = "OO", altitude_min = 2000 },
                { name = "RW15", transition = "", type = "OO" },
                { name = "", transition = "", type = "", altitude_min = 600, speed = 200.0 },
                { name = "SO601", transition = "", type = "OO", speed = 220.0 },
                { name = "LADBI", transition = "", type = "OO", altitude_min = 2500 },
                { name = "LADBI", transition = "", type = "OO", altitude_min = 2500 },
            }
        },
        ["R33"] = {
            name = "R33",
            type = "A",
            runway = "R33",
            waypoints = {
                { name = "KUNRA", transition = "KUNRA", type = "OO", altitude_min = 4000 },
                { name = "SO13S", transition = "KUNRA", type = "OO", altitude_min = 2700 },
                { name = "LOREM", transition = "LOREM", type = "OO", altitude_min = 5000, altitude_max = 6000 },
                { name = "SO13S", transition = "LOREM", type = "OO", altitude_min = 2700 },
                { name = "SO13S", transition = "", type = "OO", altitude_min = 2700 },
                { name = "SO06S", transition = "", type = "OO", altitude_min = 2100 },
                { name = "RW33", transition = "", type = "OO" },
                { name = "", transition = "", type = "", altitude_min = 600, speed = 230.0 },
                { name = "SO651", transition = "", type = "OO" },
                { name = "SO800", transition = "", type = "OO" },
                { name = "LOREM", transition = "", type = "OO", altitude_min = 3000 },
                { name = "LOREM", transition = "", type = "OO", altitude_min = 3000 },
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
