local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KPOC",
        Name = "KPOC Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["PETIS"] = { lat = 34.056472222, lon = -117.366113889, type = "ENRT" },
        ["BERDU"] = { lat = 33.905897222, lon = -117.224066667, type = "ENRT" },
        ["LIZZE"] = { lat = 34.078827778, lon = -117.519247222, type = "KPOC" },
        ["BULGY"] = { lat = 34.667825, lon = -116.621944444, type = "ENRT" },
        ["HAWNN"] = { lat = 34.086, lon = -117.66875, type = "KPOC" },
        ["LANDO"] = { lat = 35.012427778, lon = -118.616372222, type = "ENRT" },
        ["10VOR"] = { lat = 3.986311111, lon = 9.758330556, type = "FKKD" },
        ["AHLEX"] = { lat = 33.882313889, lon = -116.689594444, type = "ENRT" },
        ["ARRAN"] = { lat = -35.837555556, lon = 147.639388889, type = "ENRT" },
        ["PSP"] = { lat = -33.816666667, lon = 150.916666667, type = "ENRT" },
        ["BLUUH"] = { lat = 34.792338889, lon = -118.296152778, type = "ENRT" },
        ["ZIGGY"] = { lat = 34.119802778, lon = -117.288302778, type = "ENRT" },
        ["LAHAB"] = { lat = 33.925652778, lon = -117.925894444, type = "ENRT" },
        ["GOLDI"] = { lat = 34.026677778, lon = -117.785975, type = "KPOC" },
        ["HITOP"] = { lat = 34.299638889, lon = -117.34255, type = "ENRT" },
        ["FLAVR"] = { lat = 34.429261111, lon = -117.622591667, type = "ENRT" },
        ["ROTHY"] = { lat = 33.593133333, lon = -116.896019444, type = "ENRT" },
        ["GAREY"] = { lat = 34.166330556, lon = -117.232233333, type = "ENRT" },
        ["PRADO"] = { lat = 40.1475, lon = -2.010333333, type = "ENRT" },
        ["HESPE"] = { lat = 34.341166667, lon = -117.432030556, type = "ENRT" },
        ["SETER"] = { lat = 33.901008333, lon = -117.109125, type = "ENRT" },
        ["DAWNA"] = { lat = 34.264977778, lon = -117.113061111, type = "ENRT" },
        ["MAJEK"] = { lat = 34.388647222, lon = -117.534602778, type = "ENRT" },
        ["NITIY"] = { lat = 34.177208333, lon = -117.305591667, type = "ENRT" },
        ["ZEREK"] = { lat = 34.089111111, lon = -117.734736111, type = "KPOC" },
        ["STAGY"] = { lat = 34.086163889, lon = -117.672119444, type = "KPOC" },
        ["WUDUS"] = { lat = 34.085752778, lon = -117.663544444, type = "KPOC" },
        ["ZARTI"] = { lat = 28.161505556, lon = 9.419744444, type = "DAUZ" },
        ["BANDS"] = { lat = 33.889608333, lon = -116.849480556, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW08L"] = {
            heading = 80,
            length = 0,
            width = 0,
            threshold = { lat = 34.092369444444444, lon = -117.7868111111111 },
            end = { lat = 34.092369444444444, lon = -117.7868111111111 }
        },
        ["RW08R"] = {
            heading = 80,
            length = 0,
            width = 0,
            threshold = { lat = 34.09171388888889, lon = -117.79050555555555 },
            end = { lat = 34.09171388888889, lon = -117.79050555555555 }
        },
        ["RW26L"] = {
            heading = 260,
            length = 0,
            width = 0,
            threshold = { lat = 34.09107777777778, lon = -117.77681666666666 },
            end = { lat = 34.09107777777778, lon = -117.77681666666666 }
        },
        ["RW26R"] = {
            heading = 260,
            length = 0,
            width = 0,
            threshold = { lat = 34.09180555555556, lon = -117.77474166666667 },
            end = { lat = 34.09180555555556, lon = -117.77474166666667 }
        },
    },

    -- Процедуры SID
    SID = {
    },

    -- Процедуры STAR
    STAR = {
        ["SETER5"] = {
            name = "SETER5",
            runway = "JLI",
            waypoints = {
                { name = "JLI", type = "K2" },
                { name = "ROTHY", type = "K2" },
                { name = "SETER", type = "K2" },
                { name = "PSP", type = "K2" },
                { name = "AHLEX", type = "K2" },
                { name = "BANDS", type = "K2" },
                { name = "SETER", type = "K2" },
                { name = "SETER", type = "K2" },
                { name = "BERDU", type = "K2" },
                { name = "PDZ", type = "K2" },
            }
        },
        ["ZIGGY8"] = {
            name = "ZIGGY8",
            runway = "EHF",
            waypoints = {
                { name = "EHF", type = "K2" },
                { name = "ZARTI", type = "K2" },
                { name = "LANDO", type = "K2" },
                { name = "BLUUH", type = "K2" },
                { name = "PMD", type = "K2" },
                { name = "FLAVR", type = "K2", speed = 250.0 },
                { name = "MAJEK", type = "K2", speed = 250.0 },
                { name = "HESPE", type = "K2" },
                { name = "HITOP", type = "K2" },
                { name = "NITIY", type = "K2" },
                { name = "ZIGGY", type = "K2" },
                { name = "HEC", type = "K2" },
                { name = "BULGY", type = "K2", speed = 280.0 },
                { name = "DAWNA", type = "K2", speed = 250.0 },
                { name = "ARRAN", type = "K2" },
                { name = "GAREY", type = "K2" },
                { name = "ZIGGY", type = "K2" },
                { name = "PMD", type = "K2" },
                { name = "FLAVR", type = "K2", speed = 250.0 },
                { name = "MAJEK", type = "K2", speed = 250.0 },
                { name = "HESPE", type = "K2" },
                { name = "HITOP", type = "K2" },
                { name = "NITIY", type = "K2" },
                { name = "ZIGGY", type = "K2" },
                { name = "TTE", type = "K2" },
                { name = "ZARTI", type = "K2" },
                { name = "LANDO", type = "K2" },
                { name = "BLUUH", type = "K2" },
                { name = "PMD", type = "K2" },
                { name = "FLAVR", type = "K2", speed = 250.0 },
                { name = "MAJEK", type = "K2", speed = 250.0 },
                { name = "HESPE", type = "K2" },
                { name = "HITOP", type = "K2" },
                { name = "NITIY", type = "K2" },
                { name = "ZIGGY", type = "K2" },
                { name = "ZIGGY", type = "K2" },
                { name = "PETIS", type = "K2" },
                { name = "PDZ", type = "K2" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I26L"] = {
            name = "I26L",
            type = "A",
            runway = "I26L",
            waypoints = {
                { name = "PDZ", transition = "PDZ", type = "K2" },
                { name = "LIZZE", transition = "PDZ", type = "K2", altitude_min = 4000 },
                { name = "POM", transition = "POM", type = "K2" },
                { name = "LIZZE", transition = "POM", type = "K2", altitude_min = 6000 },
                { name = "LIZZE", transition = "POM", type = "K2", altitude_min = 4000 },
                { name = "LIZZE", transition = "", type = "K2" },
                { name = "STAGY", transition = "", type = "K2" },
                { name = "RW26L", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2100 },
                { name = "", transition = "", type = "" },
                { name = "PRADO", transition = "", type = "K2", altitude_min = 4000 },
            }
        },
        ["L26L"] = {
            name = "L26L",
            type = "A",
            runway = "L26L",
            waypoints = {
                { name = "PDZ", transition = "PDZ", type = "K2" },
                { name = "LIZZE", transition = "PDZ", type = "K2", altitude_min = 4000 },
                { name = "POM", transition = "POM", type = "K2" },
                { name = "LIZZE", transition = "POM", type = "K2", altitude_min = 6000 },
                { name = "LIZZE", transition = "POM", type = "K2", altitude_min = 4000 },
                { name = "LIZZE", transition = "", type = "K2", altitude_min = 4000 },
                { name = "HAWNN", transition = "", type = "K2", altitude_min = 3200 },
                { name = "ZEREK", transition = "", type = "K2", altitude_min = 1700 },
                { name = "RW26L", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2100 },
                { name = "", transition = "", type = "" },
                { name = "PRADO", transition = "", type = "K2", altitude_min = 4000 },
                { name = "PRADO", transition = "", type = "K2" },
            }
        },
        ["R26L"] = {
            name = "R26L",
            type = "A",
            runway = "R26L",
            waypoints = {
                { name = "LIZZE", transition = "LIZZE", type = "K2", altitude_max = 6000 },
                { name = "LIZZE", transition = "LIZZE", type = "K2", altitude_min = 4000 },
                { name = "PDZ", transition = "PDZ", type = "K2" },
                { name = "LIZZE", transition = "PDZ", type = "K2", altitude_min = 4000 },
                { name = "LIZZE", transition = "", type = "K2", altitude_min = 4000 },
                { name = "WUDUS", transition = "", type = "K2", altitude_min = 3200 },
                { name = "ZEREK", transition = "", type = "K2", altitude_min = 1840 },
                { name = "RW26L", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2100 },
                { name = "PRADO", transition = "", type = "K2", altitude_min = 4000 },
                { name = "PRADO", transition = "", type = "K2" },
            }
        },
        ["VORA"] = {
            name = "VORA",
            type = "A",
            runway = "VORA",
            waypoints = {
                { name = "LAHAB", transition = "LAHAB", type = "K2" },
                { name = "PRADO", transition = "LAHAB", type = "K2", altitude_min = 4000 },
                { name = "GOLDI", transition = "LAHAB", type = "K2", altitude_min = 2500 },
                { name = "PDZ", transition = "PDZ", type = "K2" },
                { name = "PRADO", transition = "PDZ", type = "K2", altitude_min = 4000 },
                { name = "GOLDI", transition = "PDZ", type = "K2", altitude_min = 2500 },
                { name = "POM", transition = "POM", type = "K2" },
                { name = "GOLDI", transition = "POM", type = "K2", altitude_min = 4000 },
                { name = "GOLDI", transition = "POM", type = "K2", altitude_min = 4000 },
                { name = "GOLDI", transition = "POM", type = "K2", altitude_min = 2500 },
                { name = "GOLDI", transition = "", type = "K2", altitude_min = 2500 },
                { name = "10VOR", transition = "", type = "K2", altitude_min = 1800 },
                { name = "POM", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1760 },
                { name = "PRADO", transition = "", type = "K2", altitude_min = 4000 },
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
