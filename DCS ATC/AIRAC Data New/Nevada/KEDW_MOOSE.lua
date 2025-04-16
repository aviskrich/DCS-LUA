local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KEDW",
        Name = "KEDW Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["SONIQ"] = { lat = 35.140702778, lon = -117.422016667, type = "KEDW" },
        ["KIIRK"] = { lat = 34.974886111, lon = -117.747311111, type = "KEDW" },
        ["TESST"] = { lat = 34.903938889, lon = -118.270316667, type = "KEDW" },
        ["LDFRD"] = { lat = 34.848552778, lon = -117.995036111, type = "KEDW" },
        ["XPLNE"] = { lat = 35.210983333, lon = -117.659361111, type = "KEDW" },
        ["FLYTE"] = { lat = 34.617791667, lon = -118.061966667, type = "KEDW" },
        ["HUBNO"] = { lat = 34.920377778, lon = -117.852922222, type = "KEDW" },
        ["ZIXAP"] = { lat = 35.035394444, lon = -117.629333333, type = "KEDW" },
        ["DAG"] = { lat = -23.72, lon = 149.668333333, type = "ENRT" },
        ["MORRI"] = { lat = 35.114780556, lon = -117.474172222, type = "KEDW" },
        ["PNCHO"] = { lat = 34.691522222, lon = -118.300033333, type = "KEDW" },
        ["GRIES"] = { lat = 34.876030556, lon = -117.938752778, type = "KEDW" },
        ["SABKE"] = { lat = 34.893775, lon = -117.904430556, type = "KEDW" },
        ["ENILE"] = { lat = 35.039680556, lon = -117.332827778, type = "KEDW" },
        ["HAARS"] = { lat = 35.031838889, lon = -117.635063889, type = "KEDW" },
        ["STLTH"] = { lat = 34.928308333, lon = -117.452411111, type = "KEDW" },
        ["D244X"] = { lat = 34.884516667, lon = -118.204386111, type = "KEDW" },
        ["CEPIX"] = { lat = 35.034802778, lon = -117.628886111, type = "KEDW" },
        ["MOTNE"] = { lat = 34.795133333, lon = -118.099241667, type = "KEDW" },
        ["JIPOP"] = { lat = 34.867152778, lon = -117.955905556, type = "KEDW" },
        ["DASHH"] = { lat = 34.974702778, lon = -117.747463889, type = "KEDW" },
        ["MAACH"] = { lat = 35.01405, lon = -117.512797222, type = "KEDW" },
        ["YAYGR"] = { lat = 34.852411111, lon = -117.987480556, type = "KEDW" },
        ["KOBTE"] = { lat = 34.79605, lon = -118.093011111, type = "KEDW" },
        ["MUDTY"] = { lat = 34.849391667, lon = -117.990205556, type = "KEDW" },
        ["COOLS"] = { lat = 35.158819444, lon = -117.387863889, type = "KEDW" },
        ["RW23L"] = { lat = 19.444938889, lon = -99.053891667, type = "MMMX" },
        ["HINDI"] = { lat = 34.946955556, lon = -117.801380556, type = "KEDW" },
    },

    -- Данные ВПП
    Runways = {
        ["RW02"] = {
            heading = 20,
            length = 0,
            width = 0,
            threshold = { lat = 34.807538888888885, lon = -118.10526388888889 },
            end = { lat = 34.807538888888885, lon = -118.10526388888889 }
        },
        ["RW05L"] = {
            heading = 50,
            length = 0,
            width = 0,
            threshold = { lat = 34.902744444444444, lon = -117.90480833333334 },
            end = { lat = 34.902744444444444, lon = -117.90480833333334 }
        },
        ["RW05R"] = {
            heading = 50,
            length = 0,
            width = 0,
            threshold = { lat = 34.89456111111111, lon = -117.90501111111112 },
            end = { lat = 34.89456111111111, lon = -117.90501111111112 }
        },
        ["RW07"] = {
            heading = 70,
            length = 0,
            width = 0,
            threshold = { lat = 34.894666666666666, lon = -117.88206666666666 },
            end = { lat = 34.894666666666666, lon = -117.88206666666666 }
        },
        ["RW20"] = {
            heading = 200,
            length = 0,
            width = 0,
            threshold = { lat = 34.855000000000004, lon = -118.06511388888889 },
            end = { lat = 34.855000000000004, lon = -118.06511388888889 }
        },
        ["RW23L"] = {
            heading = 230,
            length = 0,
            width = 0,
            threshold = { lat = 34.916291666666666, lon = -117.86241944444444 },
            end = { lat = 34.916291666666666, lon = -117.86241944444444 }
        },
        ["RW23R"] = {
            heading = 230,
            length = 0,
            width = 0,
            threshold = { lat = 34.92010277777778, lon = -117.87078888888888 },
            end = { lat = 34.92010277777778, lon = -117.87078888888888 }
        },
        ["RW25"] = {
            heading = 250,
            length = 0,
            width = 0,
            threshold = { lat = 34.89949444444444, lon = -117.85603888888889 },
            end = { lat = 34.89949444444444, lon = -117.85603888888889 }
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
        ["D05R"] = {
            name = "D05R",
            type = "A",
            runway = "D05R",
            waypoints = {
                { name = "MAACH", transition = "MAACH", type = "K2", altitude_min = 7000 },
                { name = "EDW", transition = "MAACH", type = "K2" },
                { name = "D244X", transition = "MAACH", type = "K2", altitude_min = 5700 },
                { name = "KOBTE", transition = "MAACH", type = "K2", altitude_min = 5300 },
                { name = "KOBTE", transition = "", type = "K2", altitude_min = 5300 },
                { name = "MUDTY", transition = "", type = "K2", altitude_min = 3900 },
                { name = "JIPOP", transition = "", type = "K2", altitude_min = 3200 },
                { name = "SABKE", transition = "", type = "K2" },
                { name = "EDW", transition = "", type = "K2" },
                { name = "MAACH", transition = "", type = "K2", altitude_min = 7000 },
                { name = "MAACH", transition = "", type = "K2", altitude_max = 10000, speed = 310.0 },
            }
        },
        ["D23L"] = {
            name = "D23L",
            type = "A",
            runway = "D23L",
            waypoints = {
                { name = "MORRI", transition = "MORRI", type = "K2", altitude_min = 7400 },
                { name = "ZIXAP", transition = "MORRI", type = "K2", altitude_min = 5900 },
                { name = "ZIXAP", transition = "", type = "K2", altitude_min = 5900 },
                { name = "EDW", transition = "", type = "K2", altitude_min = 4500 },
                { name = "HINDI", transition = "", type = "K2", altitude_min = 3300 },
                { name = "HUBNO", transition = "", type = "K2" },
                { name = "GRIES", transition = "", type = "K2" },
                { name = "MORRI", transition = "", type = "K2", altitude_min = 7400 },
                { name = "MORRI", transition = "", type = "K2", altitude_max = 10000, speed = 310.0 },
            }
        },
        ["I23LY"] = {
            name = "I23LY",
            type = "A",
            runway = "I23LY",
            waypoints = {
                { name = "DAG", transition = "DAG", type = "K2", altitude_min = 7400 },
                { name = "MORRI", transition = "DAG", type = "K2", altitude_min = 7400 },
                { name = "CEPIX", transition = "DAG", type = "K2", altitude_min = 5900 },
                { name = "CEPIX", transition = "", type = "K2" },
                { name = "DASHH", transition = "", type = "K2" },
                { name = "RW23L", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2710 },
                { name = "GRIES", transition = "", type = "K2" },
                { name = "MORRI", transition = "", type = "K2", altitude_min = 7400 },
                { name = "MORRI", transition = "", type = "K2", altitude_max = 10000, speed = 310.0 },
            }
        },
        ["I23LZ"] = {
            name = "I23LZ",
            type = "A",
            runway = "I23LZ",
            waypoints = {
                { name = "COOLS", transition = "COOLS", type = "K2", altitude_min = 11000 },
                { name = "CEPIX", transition = "COOLS", type = "K2", altitude_min = 5900 },
                { name = "CEPIX", transition = "", type = "K2" },
                { name = "DASHH", transition = "", type = "K2" },
                { name = "RW23L", transition = "", type = "K2" },
                { name = "GRIES", transition = "", type = "K2" },
                { name = "COOLS", transition = "", type = "K2", altitude_min = 11000 },
                { name = "COOLS", transition = "", type = "K2", altitude_max = 18000, speed = 310.0 },
            }
        },
        ["R05R"] = {
            name = "R05R",
            type = "A",
            runway = "R05R",
            waypoints = {
                { name = "FLYTE", transition = "FLYTE", type = "K2", altitude_min = 8200 },
                { name = "MOTNE", transition = "FLYTE", type = "K2", altitude_min = 5500 },
                { name = "PNCHO", transition = "PNCHO", type = "K2", altitude_min = 8200 },
                { name = "MOTNE", transition = "PNCHO", type = "K2", altitude_min = 5500 },
                { name = "TESST", transition = "TESST", type = "K2", altitude_min = 8200 },
                { name = "MOTNE", transition = "TESST", type = "K2", altitude_min = 5500 },
                { name = "MOTNE", transition = "", type = "K2", altitude_min = 5500 },
                { name = "YAYGR", transition = "", type = "K2", altitude_min = 3900 },
                { name = "RW05R", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2711 },
                { name = "KIIRK", transition = "", type = "K2", altitude_min = 5700 },
                { name = "KIIRK", transition = "", type = "K2", altitude_max = 8200 },
            }
        },
        ["R23L"] = {
            name = "R23L",
            type = "A",
            runway = "R23L",
            waypoints = {
                { name = "SONIQ", transition = "SONIQ", type = "K2", altitude_min = 8500 },
                { name = "HAARS", transition = "SONIQ", type = "K2", altitude_min = 6100 },
                { name = "STLTH", transition = "STLTH", type = "K2", altitude_min = 8500 },
                { name = "HAARS", transition = "STLTH", type = "K2", altitude_min = 6100 },
                { name = "XPLNE", transition = "XPLNE", type = "K2", altitude_min = 8500 },
                { name = "HAARS", transition = "XPLNE", type = "K2", altitude_min = 6100 },
                { name = "HAARS", transition = "", type = "K2", altitude_min = 6100 },
                { name = "KIIRK", transition = "", type = "K2", altitude_min = 4500 },
                { name = "RW23L", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 2660 },
                { name = "LDFRD", transition = "", type = "K2", altitude_min = 5700 },
                { name = "LDFRD", transition = "", type = "K2", altitude_max = 8500 },
            }
        },
        ["T05RY"] = {
            name = "T05RY",
            type = "A",
            runway = "T05RY",
            waypoints = {
                { name = "MAACH", transition = "MAACH", type = "K2", altitude_min = 7000 },
                { name = "EDW", transition = "MAACH", type = "K2" },
                { name = "D244X", transition = "MAACH", type = "K2", altitude_min = 5700 },
                { name = "KOBTE", transition = "MAACH", type = "K2", altitude_min = 5300 },
                { name = "KOBTE", transition = "", type = "K2", altitude_min = 5300 },
                { name = "MUDTY", transition = "", type = "K2", altitude_min = 3900 },
                { name = "JIPOP", transition = "", type = "K2", altitude_min = 3200 },
                { name = "SABKE", transition = "", type = "K2" },
                { name = "EDW", transition = "", type = "K2" },
                { name = "MAACH", transition = "", type = "K2", altitude_min = 7000 },
                { name = "MAACH", transition = "", type = "K2", altitude_max = 10000, speed = 310.0 },
            }
        },
        ["T05RZ"] = {
            name = "T05RZ",
            type = "A",
            runway = "T05RZ",
            waypoints = {
                { name = "ENILE", transition = "ENILE", type = "K2", altitude_min = 15000 },
                { name = "EDW", transition = "ENILE", type = "K2" },
                { name = "EDW", transition = "ENILE", type = "K2", altitude_min = 5700 },
                { name = "KOBTE", transition = "ENILE", type = "K2", altitude_min = 5300 },
                { name = "KOBTE", transition = "", type = "K2", altitude_min = 5300 },
                { name = "MUDTY", transition = "", type = "K2", altitude_min = 3900 },
                { name = "JIPOP", transition = "", type = "K2", altitude_min = 3200 },
                { name = "SABKE", transition = "", type = "K2" },
                { name = "EDW", transition = "", type = "K2" },
                { name = "ENILE", transition = "", type = "K2", altitude_min = 15000 },
                { name = "ENILE", transition = "", type = "K2", altitude_max = 18000, speed = 310.0 },
            }
        },
        ["T23LY"] = {
            name = "T23LY",
            type = "A",
            runway = "T23LY",
            waypoints = {
                { name = "MORRI", transition = "MORRI", type = "K2", altitude_min = 7400 },
                { name = "ZIXAP", transition = "MORRI", type = "K2", altitude_min = 5900 },
                { name = "ZIXAP", transition = "", type = "K2", altitude_min = 5900 },
                { name = "EDW", transition = "", type = "K2", altitude_min = 4500 },
                { name = "HINDI", transition = "", type = "K2", altitude_min = 3300 },
                { name = "HUBNO", transition = "", type = "K2" },
                { name = "GRIES", transition = "", type = "K2" },
                { name = "MORRI", transition = "", type = "K2", altitude_min = 7400 },
                { name = "MORRI", transition = "", type = "K2", altitude_max = 10000, speed = 310.0 },
            }
        },
        ["T23LZ"] = {
            name = "T23LZ",
            type = "A",
            runway = "T23LZ",
            waypoints = {
                { name = "COOLS", transition = "COOLS", type = "K2", altitude_min = 11000 },
                { name = "ZIXAP", transition = "COOLS", type = "K2", altitude_min = 5900 },
                { name = "ZIXAP", transition = "", type = "K2", altitude_min = 5900 },
                { name = "EDW", transition = "", type = "K2", altitude_min = 4500 },
                { name = "HINDI", transition = "", type = "K2", altitude_min = 3300 },
                { name = "HUBNO", transition = "", type = "K2" },
                { name = "GRIES", transition = "", type = "K2" },
                { name = "COOLS", transition = "", type = "K2", altitude_min = 11000 },
                { name = "COOLS", transition = "", type = "K2", altitude_max = 18000, speed = 310.0 },
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
