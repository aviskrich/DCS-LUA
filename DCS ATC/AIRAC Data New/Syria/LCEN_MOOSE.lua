local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LCEN",
        Name = "LCEN Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["MA11L"] = { lat = 38.769455556, lon = 41.602344444, type = "LTCK" },
        ["DME08"] = { lat = 35.240291667, lon = 33.600844444, type = "LCGK" },
        ["26DME"] = { lat = 53.148538889, lon = 140.759833333, type = "UHNN" },
        ["EN106"] = { lat = 35.359672222, lon = 33.624288889, type = "LCEN" },
        ["RW29R"] = { lat = 20.518, lon = -103.295666667, type = "MMGL" },
        ["D094G"] = { lat = 45.255325, lon = 148.150172222, type = "UHSI" },
        ["D040J"] = { lat = 31.628269444, lon = 120.538036111, type = "ZSWX" },
        ["EN101"] = { lat = 35.374227778, lon = 33.300619444, type = "LCEN" },
        ["D098J"] = { lat = 45.1825, lon = 14.350991667, type = "LDRI" },
        ["EN103"] = { lat = 35.232761111, lon = 33.412413889, type = "LCEN" },
        ["DME05"] = { lat = 35.127977778, lon = 33.586683333, type = "LCEN" },
        ["DME10"] = { lat = 33.276444444, lon = -7.560963889, type = "GMMN" },
        ["D085J"] = { lat = 58.950822222, lon = -158.241433333, type = "PADL" },
        ["EN202"] = { lat = 35.119769444, lon = 33.752938889, type = "LCEN" },
        ["GIRNE"] = { lat = 35.639722222, lon = 33.361666667, type = "ENRT" },
        ["EN104"] = { lat = 35.186763889, lon = 33.436605556, type = "LCEN" },
        ["D345L"] = { lat = 4.397636111, lon = 73.465736111, type = "VRMM" },
        ["DME07"] = { lat = 35.239675, lon = 33.621191667, type = "LCGK" },
        ["33DME"] = { lat = 71.228272222, lon = 72.134444444, type = "USDA" },
        ["RW11R"] = { lat = 20.528777778, lon = -103.327694444, type = "MMGL" },
        ["D345J"] = { lat = 53.537836111, lon = 83.540616667, type = "UNBB" },
        ["D066J"] = { lat = 47.720777778, lon = 26.596888889, type = "LRSV" },
        ["EN107"] = { lat = 35.306936111, lon = 33.285155556, type = "LCEN" },
        ["D107J"] = { lat = 40.692477778, lon = 112.114952778, type = "ZBHH" },
        ["D098H"] = { lat = 35.137725, lon = 33.652436111, type = "LCEN" },
        ["EN200"] = { lat = 35.09635, lon = 33.680927778, type = "LCEN" },
        ["EN204"] = { lat = 35.370788889, lon = 33.581822222, type = "LCEN" },
        ["D345E"] = { lat = 35.237186111, lon = 33.464391667, type = "LCEN" },
        ["D345T"] = { lat = 39.707375, lon = 8.875863889, type = "LIED" },
        ["EN105"] = { lat = 35.152675, lon = 33.594383333, type = "LCEN" },
        ["D093J"] = { lat = 48.857297222, lon = 24.945777778, type = "UKLI" },
        ["D310L"] = { lat = 30.557547222, lon = 115.073802778, type = "ZHHH" },
        ["EN205"] = { lat = 35.450283333, lon = 33.412897222, type = "LCEN" },
        ["FS29"] = { lat = 0.347033333, lon = 6.790566667, type = "FPST" },
        ["D090T"] = { lat = 33.928708333, lon = 8.500733333, type = "DTTZ" },
        ["EN102"] = { lat = 35.242938889, lon = 33.270475, type = "LCEN" },
        ["EN201"] = { lat = 35.113127778, lon = 33.62345, type = "LCEN" },
        ["EN203"] = { lat = 35.2075, lon = 33.737863889, type = "LCEN" },
        ["MA11R"] = { lat = 21.230755556, lon = 105.764280556, type = "VVNB" },
        ["DME06"] = { lat = 35.121952778, lon = 33.605644444, type = "LCEN" },
    },

    -- Данные ВПП
    Runways = {
        ["RW11L"] = {
            heading = 110,
            length = -299.0,
            width = 0,
            threshold = { lat = 35.15972222222222, lon = 33.487500000000004 },
            end = { lat = 35.17655270332766, lon = 33.43093909056586 }
        },
        ["RW11R"] = {
            heading = 110,
            length = -589.0,
            width = 0,
            threshold = { lat = 35.15448055555555, lon = 33.49755833333334 },
            end = { lat = 35.18763491465623, lon = 33.38614619555808 }
        },
        ["RW29L"] = {
            heading = 290,
            length = 589.0,
            width = 0,
            threshold = { lat = 35.144441666666665, lon = 33.528124999999996 },
            end = { lat = 35.17759602576734, lon = 33.41672660594942 }
        },
        ["RW29R"] = {
            heading = 290,
            length = 299.0,
            width = 0,
            threshold = { lat = 35.150555555555556, lon = 33.51555555555556 },
            end = { lat = 35.16738603666099, lon = 33.45900101859228 }
        },
    },

    -- Процедуры SID
    SID = {
        ["GIRN1A"] = {
            name = "GIRN1A",
            runway = "RW11L",
            waypoints = {
                { name = "", type = "", altitude_min = 802 },
                { name = "", type = "" },
                { name = "ECN", type = "D", altitude_min = 3500 },
                { name = "", type = "" },
                { name = "GIRNE", type = "E" },
            }
        },
        ["GIRN1B"] = {
            name = "GIRN1B",
            runway = "RW29R",
            waypoints = {
                { name = "", type = "", altitude_min = 802 },
                { name = "", type = "" },
                { name = "ECN", type = "D", altitude_min = 3500 },
                { name = "", type = "" },
                { name = "GIRNE", type = "E" },
            }
        },
        ["GIRN1C"] = {
            name = "GIRN1C",
            runway = "RW11L",
            waypoints = {
                { name = "", type = "", altitude_min = 1000 },
                { name = "GKE", type = "D" },
                { name = "GIRNE", type = "E" },
            }
        },
        ["GIRN1H"] = {
            name = "GIRN1H",
            runway = "RW11L",
            waypoints = {
                { name = "", type = "", altitude_min = 802 },
                { name = "D090T", type = "P" },
                { name = "D345T", type = "P" },
                { name = "GIRNE", type = "E" },
            }
        },
        ["GIRN1S"] = {
            name = "GIRN1S",
            runway = "RW29R",
            waypoints = {
                { name = "", type = "", altitude_min = 802 },
                { name = "D310L", type = "P", altitude_min = 4500 },
                { name = "D345L", type = "P" },
                { name = "GIRNE", type = "E" },
            }
        },
        ["GIRN2D"] = {
            name = "GIRN2D",
            runway = "RW11R",
            waypoints = {
                { name = "", type = "", altitude_min = 1000 },
                { name = "GKE", type = "D" },
                { name = "GIRNE", type = "E" },
            }
        },
        ["GIRN2E"] = {
            name = "GIRN2E",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 802 },
                { name = "D310L", type = "P", altitude_min = 4500 },
                { name = "D345L", type = "P" },
                { name = "GIRNE", type = "E" },
            }
        },
        ["GIRN2F"] = {
            name = "GIRN2F",
            runway = "RW11R",
            waypoints = {
                { name = "", type = "", altitude_min = 802 },
                { name = "D090T", type = "P" },
                { name = "D345T", type = "P" },
                { name = "GIRNE", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["GIRN1K"] = {
            name = "GIRN1K",
            runway = "ALL",
            waypoints = {
                { name = "GIRNE", type = "LC", altitude_min = 6000 },
                { name = "D345L", type = "LC", altitude_min = 6000 },
                { name = "D345E", type = "LC", altitude_min = 6000 },
                { name = "ECN", type = "LC", altitude_min = 4100 },
            }
        },
        ["GKE1L"] = {
            name = "GKE1L",
            runway = "ALL",
            waypoints = {
                { name = "GKE", type = "LC", altitude_min = 6000 },
                { name = "ECN", type = "LC", altitude_min = 6000 },
            }
        },
        ["GIRN2C"] = {
            name = "GIRN2C",
            runway = "RW29R",
            waypoints = {
                { name = "GIRNE", type = "LC", altitude_min = 6000 },
                { name = "EN205", type = "LC", altitude_min = 6000 },
                { name = "EN204", type = "LC", altitude_min = 6000 },
                { name = "EN203", type = "LC", altitude_min = 4490 },
                { name = "EN202", type = "LC", altitude_min = 3200 },
                { name = "EN200", type = "LC" },
            }
        },
        ["GIRN2G"] = {
            name = "GIRN2G",
            runway = "RW29L",
            waypoints = {
                { name = "GIRNE", type = "LC", altitude_min = 6000 },
                { name = "EN205", type = "LC", altitude_min = 6000 },
                { name = "EN204", type = "LC", altitude_min = 6000 },
                { name = "EN203", type = "LC", altitude_min = 4490 },
                { name = "EN202", type = "LC", altitude_min = 3200 },
                { name = "EN201", type = "LC" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D29L1"] = {
            name = "D29L1",
            type = "A",
            runway = "D29L1",
            waypoints = {
                { name = "ECN", transition = "R089", type = "LC", altitude_min = 4100 },
                { name = "ECN", transition = "R089", type = "LC", altitude_min = 1980 },
                { name = "DME08", transition = "R089", type = "LC", speed = 185.0 },
                { name = "ECN", transition = "R097", type = "LC", altitude_min = 4100 },
                { name = "ECN", transition = "R097", type = "LC", altitude_min = 1980 },
                { name = "DME08", transition = "R097", type = "LC", speed = 185.0 },
                { name = "DME08", transition = "", type = "LC" },
                { name = "DME07", transition = "", type = "LC" },
                { name = "33DME", transition = "", type = "LC" },
                { name = "ECN", transition = "", type = "LC" },
                { name = "", transition = "", type = "" },
                { name = "GKE", transition = "", type = "LC", altitude_min = 5000, speed = 185.0 },
                { name = "GKE", transition = "", type = "LC" },
            }
        },
        ["D29R1"] = {
            name = "D29R1",
            type = "A",
            runway = "D29R1",
            waypoints = {
                { name = "ECN", transition = "R085", type = "LC", altitude_min = 4100 },
                { name = "ECN", transition = "R085", type = "LC", altitude_min = 1900 },
                { name = "DME07", transition = "R085", type = "LC", altitude_min = 1900, speed = 185.0 },
                { name = "ECN", transition = "R094", type = "LC", altitude_min = 4100 },
                { name = "D094G", transition = "R094", type = "LC", altitude_min = 1900 },
                { name = "D098H", transition = "R094", type = "LC", altitude_min = 1900 },
                { name = "DME07", transition = "R094", type = "LC", altitude_min = 1900 },
                { name = "DME07", transition = "", type = "LC" },
                { name = "DME06", transition = "", type = "LC" },
                { name = "26DME", transition = "", type = "LC" },
                { name = "ECN", transition = "", type = "LC" },
                { name = "", transition = "", type = "" },
                { name = "GKE", transition = "", type = "LC", altitude_min = 5000, speed = 185.0 },
                { name = "GKE", transition = "", type = "LC" },
            }
        },
        ["D29R2"] = {
            name = "D29R2",
            type = "A",
            runway = "D29R2",
            waypoints = {
                { name = "D345L", transition = "R345", type = "LC", altitude_min = 6000 },
                { name = "D345J", transition = "R345", type = "LC" },
                { name = "D040J", transition = "R345", type = "LC" },
                { name = "D085J", transition = "R345", type = "LC" },
                { name = "D107J", transition = "R345", type = "LC" },
                { name = "DME08", transition = "R345", type = "LC" },
                { name = "DME08", transition = "", type = "LC" },
                { name = "DME05", transition = "", type = "LC" },
                { name = "26DME", transition = "", type = "LC" },
                { name = "ECN", transition = "", type = "LC" },
                { name = "", transition = "", type = "" },
                { name = "GKE", transition = "", type = "LC", altitude_min = 5000 },
                { name = "GKE", transition = "", type = "LC", altitude_min = 5000 },
            }
        },
        ["D29R3"] = {
            name = "D29R3",
            type = "A",
            runway = "D29R3",
            waypoints = {
                { name = "GKE", transition = "R066", type = "LC", altitude_min = 5000 },
                { name = "D066J", transition = "R066", type = "LC", altitude_min = 3500 },
                { name = "D085J", transition = "R066", type = "LC" },
                { name = "D107J", transition = "R066", type = "LC", altitude_min = 3000 },
                { name = "DME08", transition = "R066", type = "LC" },
                { name = "DME08", transition = "", type = "LC" },
                { name = "DME05", transition = "", type = "LC" },
                { name = "26DME", transition = "", type = "LC" },
                { name = "ECN", transition = "", type = "LC" },
                { name = "", transition = "", type = "" },
                { name = "GKE", transition = "", type = "LC", altitude_min = 5000, speed = 185.0 },
                { name = "GKE", transition = "", type = "LC", altitude_min = 5000 },
            }
        },
        ["I29R"] = {
            name = "I29R",
            type = "A",
            runway = "I29R",
            waypoints = {
                { name = "ECN", transition = "R093", type = "LC", altitude_min = 5000 },
                { name = "D093J", transition = "R093", type = "LC", altitude_min = 2500 },
                { name = "DME10", transition = "R093", type = "LC", speed = 185.0 },
                { name = "DME08", transition = "R093", type = "LC" },
                { name = "ECN", transition = "R098", type = "LC", altitude_min = 5000 },
                { name = "D098J", transition = "R098", type = "LC", altitude_min = 2500 },
                { name = "DME10", transition = "R098", type = "LC", speed = 185.0 },
                { name = "DME08", transition = "R098", type = "LC" },
                { name = "DME08", transition = "", type = "LC" },
                { name = "RW29R", transition = "", type = "LC" },
                { name = "ECN", transition = "", type = "LC" },
                { name = "", transition = "", type = "" },
                { name = "GKE", transition = "", type = "LC", altitude_min = 5000, speed = 185.0 },
                { name = "GKE", transition = "", type = "LC" },
            }
        },
        ["R11L"] = {
            name = "R11L",
            type = "R",
            runway = "R11L",
            waypoints = {
                { name = "GIRNE", transition = "", type = "LC", speed = 250.0 },
                { name = "EN101", transition = "", type = "LC", altitude_min = 6000 },
                { name = "EN107", transition = "", type = "LC", altitude_min = 5000 },
                { name = "EN102", transition = "", type = "LC", altitude_min = 4000, speed = 210.0 },
                { name = "EN103", transition = "", type = "LC", altitude_min = 2100, speed = 185.0 },
                { name = "EN104", transition = "", type = "LC", speed = 185.0 },
                { name = "MA11L", transition = "", type = "LC", speed = 200.0 },
                { name = "RW11L", transition = "", type = "LC" },
                { name = "EN105", transition = "", type = "LC", speed = 220.0 },
                { name = "EN106", transition = "", type = "LC", speed = 220.0 },
                { name = "EN101", transition = "", type = "LC", altitude_min = 6000 },
                { name = "EN101", transition = "", type = "LC", altitude_min = 6000 },
            }
        },
        ["R11R"] = {
            name = "R11R",
            type = "R",
            runway = "R11R",
            waypoints = {
                { name = "GIRNE", transition = "", type = "LC", speed = 250.0 },
                { name = "EN101", transition = "", type = "LC", altitude_min = 6000 },
                { name = "EN107", transition = "", type = "LC", altitude_min = 5000 },
                { name = "EN102", transition = "", type = "LC", altitude_min = 4000, speed = 210.0 },
                { name = "EN103", transition = "", type = "LC", altitude_min = 2100, speed = 185.0 },
                { name = "EN104", transition = "", type = "LC", speed = 185.0 },
                { name = "MA11R", transition = "", type = "LC", speed = 200.0 },
                { name = "RW11R", transition = "", type = "LC" },
                { name = "EN105", transition = "", type = "LC", speed = 220.0 },
                { name = "EN106", transition = "", type = "LC", speed = 220.0 },
                { name = "EN101", transition = "", type = "LC", altitude_min = 6000 },
                { name = "EN101", transition = "", type = "LC", altitude_min = 6000 },
            }
        },
        ["S29R"] = {
            name = "S29R",
            type = "A",
            runway = "S29R",
            waypoints = {
                { name = "ECN", transition = "ECN", type = "LC", altitude_min = 4100 },
                { name = "ECN", transition = "ECN", type = "LC", altitude_min = 1900 },
                { name = "FS29", transition = "ECN", type = "LC", altitude_min = 1900, speed = 185.0 },
                { name = "FS29", transition = "", type = "LC" },
                { name = "RW29R", transition = "", type = "LC" },
                { name = "ECN", transition = "", type = "LC", altitude_min = 802 },
                { name = "", transition = "", type = "" },
                { name = "GKE", transition = "", type = "LC", altitude_min = 5000, speed = 185.0 },
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
