local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KSEE",
        Name = "KSEE Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["OROSZ"] = { lat = 34.426716667, lon = -118.674169444, type = "ENRT" },
        ["CARIF"] = { lat = 33.038597222, lon = -117.332705556, type = "ENRT" },
        ["RW27R"] = { lat = 52.466947222, lon = 9.699727778, type = "EDDV" },
        ["ZIRLU"] = { lat = 32.789433333, lon = -116.760591667, type = "KSEE" },
        ["GYWNN"] = { lat = 33.063455556, lon = -117.729230556, type = "ENRT" },
        ["WOPOS"] = { lat = 32.763630556, lon = -116.619558333, type = "KSEE" },
        ["HFMNN"] = { lat = 33.575872222, lon = -118.236144444, type = "ENRT" },
        ["CHKNN"] = { lat = 33.758383333, lon = -118.336747222, type = "ENRT" },
        ["BARET"] = { lat = 32.774108333, lon = -116.677463889, type = "ENRT" },
        ["LANDO"] = { lat = 35.012427778, lon = -118.616372222, type = "ENRT" },
        ["MADOW"] = { lat = 33.623602778, lon = -117.9964, type = "ENRT" },
        ["ISOKE"] = { lat = 32.831208333, lon = -116.990922222, type = "KSEE" },
        ["JUGAL"] = { lat = 32.931875, lon = -117.014502778, type = "KSEE" },
        ["TOMTY"] = { lat = 32.886619444, lon = -116.994572222, type = "KSEE" },
        ["DEBEY"] = { lat = 32.815944444, lon = -116.906544444, type = "KSEE" },
        ["TOCOD"] = { lat = 32.866111111, lon = -117.228888889, type = "KSEE" },
        ["TILRE"] = { lat = 32.845808333, lon = -117.072336111, type = "KSEE" },
        ["PADRZ"] = { lat = 33.193888889, lon = -117.861944444, type = "ENRT" },
        ["CWARD"] = { lat = 33.384013889, lon = -117.909272222, type = "ENRT" },
        ["IKAYE"] = { lat = 34.143055556, lon = -119.010277778, type = "ENRT" },
        ["ROBNN"] = { lat = 33.203477778, lon = -117.103494444, type = "ENRT" },
        ["RIDDL"] = { lat = 34.002027778, lon = -118.4598, type = "ENRT" },
        ["SAMOS"] = { lat = 32.799925, lon = -116.818580556, type = "KSEE" },
        ["HIRAK"] = { lat = 32.83675, lon = -116.972744444, type = "KSEE" },
        ["ASIXY"] = { lat = 33.069283333, lon = -117.101716667, type = "KSEE" },
        ["TWINE"] = { lat = 34.309694444, lon = -118.616477778, type = "ENRT" },
        ["PGY10"] = { lat = 32.778216667, lon = -116.972158333, type = "KSEE" },
    },

    -- Данные ВПП
    Runways = {
        ["RW09L"] = {
            heading = 90,
            length = 0,
            width = 0,
            threshold = { lat = 32.829458333333335, lon = -116.98125 },
            end = { lat = 32.829458333333335, lon = -116.98125 }
        },
        ["RW09R"] = {
            heading = 90,
            length = 0,
            width = 0,
            threshold = { lat = 32.82738055555556, lon = -116.9762361111111 },
            end = { lat = 32.82738055555556, lon = -116.9762361111111 }
        },
        ["RW17"] = {
            heading = 170,
            length = 0,
            width = 0,
            threshold = { lat = 32.828275000000005, lon = -116.972475 },
            end = { lat = 32.828275000000005, lon = -116.972475 }
        },
        ["RW27L"] = {
            heading = 270,
            length = 0,
            width = 0,
            threshold = { lat = 32.82580555555556, lon = -116.96752222222223 },
            end = { lat = 32.82580555555556, lon = -116.96752222222223 }
        },
        ["RW27R"] = {
            heading = 270,
            length = 0,
            width = 0,
            threshold = { lat = 32.82679166666667, lon = -116.96649444444445 },
            end = { lat = 32.82679166666667, lon = -116.96649444444445 }
        },
        ["RW35"] = {
            heading = 350,
            length = 0,
            width = 0,
            threshold = { lat = 32.82000555555556, lon = -116.97240833333333 },
            end = { lat = 32.82000555555556, lon = -116.97240833333333 }
        },
    },

    -- Процедуры SID
    SID = {
        ["CWARD2"] = {
            name = "CWARD2",
            runway = "RW09B",
            waypoints = {
                { name = "", type = "", altitude_min = 790 },
                { name = "", type = "", altitude_min = 3000 },
                { name = "", type = "" },
                { name = "MZB", type = "D" },
                { name = "", type = "" },
                { name = "GYWNN", type = "E", altitude_min = 6000 },
                { name = "", type = "", altitude_min = 2800 },
                { name = "", type = "" },
                { name = "MZB", type = "D" },
                { name = "", type = "" },
                { name = "GYWNN", type = "E", altitude_min = 6000 },
                { name = "", type = "", altitude_min = 790 },
                { name = "", type = "", altitude_min = 3000 },
                { name = "", type = "" },
                { name = "GYWNN", type = "E", altitude_min = 6000 },
                { name = "", type = "", altitude_min = 790 },
                { name = "", type = "", altitude_min = 3000 },
                { name = "", type = "" },
                { name = "GYWNN", type = "E", altitude_min = 6000 },
                { name = "GYWNN", type = "E", altitude_min = 6000 },
                { name = "PADRZ", type = "E" },
                { name = "CWARD", type = "E", altitude_max = 12000 },
                { name = "CWARD", type = "E", altitude_max = 12000 },
                { name = "LAX", type = "D" },
                { name = "CWARD", type = "E", altitude_max = 12000 },
                { name = "MADOW", type = "E" },
                { name = "SLI", type = "D" },
            }
        },
        ["MZB2"] = {
            name = "MZB2",
            runway = "RW09B",
            waypoints = {
                { name = "", type = "", altitude_min = 790 },
                { name = "", type = "" },
                { name = "MZB", type = "D" },
                { name = "", type = "" },
                { name = "MZB", type = "D" },
                { name = "", type = "", altitude_min = 790 },
                { name = "", type = "" },
                { name = "PGY10", type = "P" },
                { name = "MZB", type = "D" },
                { name = "", type = "", altitude_min = 790 },
                { name = "", type = "" },
                { name = "MZB", type = "D" },
            }
        },
        ["PADRZ2"] = {
            name = "PADRZ2",
            runway = "RW09B",
            waypoints = {
                { name = "", type = "", altitude_min = 790 },
                { name = "", type = "" },
                { name = "MZB", type = "D" },
                { name = "", type = "" },
                { name = "GYWNN", type = "E", altitude_min = 8000 },
                { name = "PADRZ", type = "E" },
                { name = "", type = "" },
                { name = "MZB", type = "D" },
                { name = "", type = "" },
                { name = "GYWNN", type = "E", altitude_min = 8000 },
                { name = "PADRZ", type = "E" },
                { name = "", type = "", altitude_min = 790 },
                { name = "", type = "", altitude_min = 3000 },
                { name = "", type = "" },
                { name = "GYWNN", type = "E", altitude_min = 8000 },
                { name = "PADRZ", type = "E" },
                { name = "", type = "", altitude_min = 790 },
                { name = "", type = "", altitude_min = 3000 },
                { name = "", type = "" },
                { name = "GYWNN", type = "E", altitude_min = 8000 },
                { name = "PADRZ", type = "E" },
                { name = "PADRZ", type = "E" },
                { name = "HFMNN", type = "E" },
                { name = "CHKNN", type = "E" },
                { name = "PADRZ", type = "E" },
                { name = "HFMNN", type = "E" },
                { name = "CHKNN", type = "E" },
                { name = "RIDDL", type = "E" },
                { name = "LANDO", type = "E" },
                { name = "EHF", type = "D" },
                { name = "PADRZ", type = "E" },
                { name = "IKAYE", type = "E" },
                { name = "PADRZ", type = "E" },
                { name = "HFMNN", type = "E" },
                { name = "CHKNN", type = "E" },
                { name = "RIDDL", type = "E" },
                { name = "TWINE", type = "E" },
                { name = "OROSZ", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["LOCD"] = {
            name = "LOCD",
            type = "A",
            runway = "LOCD",
            waypoints = {
                { name = "MZB", transition = "MZB", type = "K2" },
                { name = "BARET", transition = "MZB", type = "K2", altitude_min = 7300 },
                { name = "BARET", transition = "MZB", type = "K2", altitude_min = 7300 },
                { name = "WOPOS", transition = "MZB", type = "K2", altitude_min = 6800 },
                { name = "BARET", transition = "MZB", type = "K2", altitude_min = 5900 },
                { name = "ZIRLU", transition = "MZB", type = "K2", altitude_min = 4900 },
                { name = "ZIRLU", transition = "", type = "K2", altitude_min = 4900 },
                { name = "SAMOS", transition = "", type = "K2", altitude_min = 4000 },
                { name = "DEBEY", transition = "", type = "K2", altitude_min = 2700 },
                { name = "RW27R", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 790 },
                { name = "MZB", transition = "", type = "K2", altitude_min = 3000 },
                { name = "MZB", transition = "", type = "K2" },
            }
        },
        ["R09L"] = {
            name = "R09L",
            type = "A",
            runway = "R09L",
            waypoints = {
                { name = "CARIF", transition = "CARIF", type = "K2" },
                { name = "TOCOD", transition = "CARIF", type = "K2", altitude_min = 2400 },
                { name = "TOCOD", transition = "", type = "K2", altitude_min = 2400 },
                { name = "TILRE", transition = "", type = "K2", altitude_min = 2400 },
                { name = "ISOKE", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1900 },
                { name = "MZB", transition = "", type = "K2", altitude_min = 2700 },
                { name = "MZB", transition = "", type = "K2" },
            }
        },
        ["R17"] = {
            name = "R17",
            type = "A",
            runway = "R17",
            waypoints = {
                { name = "ROBNN", transition = "ROBNN", type = "K2" },
                { name = "ASIXY", transition = "ROBNN", type = "K2", altitude_min = 5000 },
                { name = "ASIXY", transition = "", type = "K2", altitude_min = 5000 },
                { name = "JUGAL", transition = "", type = "K2", altitude_min = 2500 },
                { name = "TOMTY", transition = "", type = "K2", altitude_min = 1580 },
                { name = "HIRAK", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "TOCOD", transition = "", type = "K2", altitude_min = 3000 },
                { name = "TOCOD", transition = "", type = "K2" },
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
