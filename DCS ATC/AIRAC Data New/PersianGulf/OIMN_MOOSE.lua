local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIMN",
        Name = "OIMN Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["MD245"] = { lat = 37.500761111, lon = 57.342958333, type = "OIMN" },
        ["D251J"] = { lat = 59.824213889, lon = -1.598691667, type = "EGPB" },
        ["CD245"] = { lat = 37.551961111, lon = 57.520225, type = "OIMN" },
        ["FF246"] = { lat = 37.536947222, lon = 57.470622222, type = "OIMN" },
        ["D224J"] = { lat = 31.372361111, lon = 120.312825, type = "ZSWX" },
        ["50LOC"] = { lat = -20.386552778, lon = 57.592994444, type = "FIMP" },
        ["TULER"] = { lat = 37.218333333, lon = 56.934444444, type = "ENRT" },
        ["D120Y"] = { lat = 37.264847222, lon = 57.758755556, type = "OIMN" },
        ["ML246"] = { lat = 37.513694444, lon = 57.385388889, type = "OIMN" },
        ["EGLUL"] = { lat = 37.401944444, lon = 56.815277778, type = "ENRT" },
        ["CL246"] = { lat = 37.561383333, lon = 57.560508333, type = "OIMN" },
        ["RIBOB"] = { lat = 37.284722222, lon = 56.873888889, type = "ENRT" },
        ["SILPO"] = { lat = 37.135, lon = 58.001666667, type = "ENRT" },
        ["30VOR"] = { lat = 35.37105, lon = 4.246863889, type = "DAAD" },
        ["FD245"] = { lat = 37.52355, lon = 57.421713889, type = "OIMN" },
        ["D236J"] = { lat = 50.153, lon = 4.4335, type = "EBFS" },
        ["FN240"] = { lat = 37.554338889, lon = 57.482411111, type = "OIMN" },
    },

    -- Данные ВПП
    Runways = {
        ["RW07"] = {
            heading = 70,
            length = 0,
            width = 0,
            threshold = { lat = 37.48808611111111, lon = 57.29118611111111 },
            end = { lat = 37.48808611111111, lon = 57.29118611111111 }
        },
        ["RW25"] = {
            heading = 250,
            length = 760.0,
            width = 0,
            threshold = { lat = 37.494905555555555, lon = 57.315105555555554 },
            end = { lat = 37.45212573736113, lon = 57.16696403978766 }
        },
    },

    -- Процедуры SID
    SID = {
        ["EGLU2A"] = {
            name = "EGLU2A",
            runway = "RW25",
            waypoints = {
                { name = "", type = "" },
                { name = "BRD", type = "D", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "EGLUL", type = "E" },
            }
        },
        ["EGLU2B"] = {
            name = "EGLU2B",
            runway = "RW07",
            waypoints = {
                { name = "", type = "", altitude_min = 5500 },
                { name = "BRD", type = "D", altitude_min = 7500 },
                { name = "EGLUL", type = "E" },
            }
        },
        ["RIBO2A"] = {
            name = "RIBO2A",
            runway = "RW25",
            waypoints = {
                { name = "", type = "" },
                { name = "BRD", type = "D", altitude_min = 6000 },
                { name = "BRD", type = "D", altitude_min = 9000 },
                { name = "BRD", type = "D", altitude_min = 11500 },
                { name = "", type = "" },
                { name = "RIBOB", type = "E" },
            }
        },
        ["RIBO2B"] = {
            name = "RIBO2B",
            runway = "RW07",
            waypoints = {
                { name = "", type = "", altitude_min = 7500 },
                { name = "BRD", type = "D", altitude_min = 11500 },
                { name = "RIBOB", type = "E" },
            }
        },
        ["SILP2A"] = {
            name = "SILP2A",
            runway = "RW25",
            waypoints = {
                { name = "", type = "" },
                { name = "BRD", type = "D", altitude_min = 6000 },
                { name = "SILPO", type = "E" },
            }
        },
        ["SILP2B"] = {
            name = "SILP2B",
            runway = "RW07",
            waypoints = {
                { name = "", type = "", altitude_min = 5500 },
                { name = "", type = "" },
                { name = "SILPO", type = "E" },
            }
        },
        ["TULE1A"] = {
            name = "TULE1A",
            runway = "RW25",
            waypoints = {
                { name = "", type = "" },
                { name = "BRD", type = "D", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "TULER", type = "E" },
            }
        },
        ["TULE1B"] = {
            name = "TULE1B",
            runway = "RW07",
            waypoints = {
                { name = "", type = "", altitude_min = 5500 },
                { name = "BRD", type = "D", altitude_min = 7500 },
                { name = "TULER", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["EGLU1N"] = {
            name = "EGLU1N",
            runway = "ALL",
            waypoints = {
                { name = "EGLUL", type = "OI" },
                { name = "D251J", type = "OI" },
                { name = "BRD", type = "OI" },
            }
        },
        ["RIBO1N"] = {
            name = "RIBO1N",
            runway = "ALL",
            waypoints = {
                { name = "RIBOB", type = "OI" },
                { name = "D236J", type = "OI" },
                { name = "BRD", type = "OI" },
            }
        },
        ["SILP1N"] = {
            name = "SILP1N",
            runway = "ALL",
            waypoints = {
                { name = "SILPO", type = "OI" },
                { name = "D120Y", type = "OI" },
                { name = "BRD", type = "OI" },
            }
        },
        ["TULE1N"] = {
            name = "TULE1N",
            runway = "ALL",
            waypoints = {
                { name = "TULER", type = "OI" },
                { name = "D224J", type = "OI" },
                { name = "BRD", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["CLDM"] = {
            name = "CLDM",
            type = "A",
            runway = "CLDM",
            waypoints = {
                { name = "BRD", transition = "BRD1", type = "OI", altitude_min = 11000 },
                { name = "BRD", transition = "BRD1", type = "OI", altitude_min = 7000, speed = 200.0 },
                { name = "CL246", transition = "BRD1", type = "OI", altitude_min = 7000 },
                { name = "BRD", transition = "BRD2", type = "OI", altitude_min = 11000 },
                { name = "BRD", transition = "BRD2", type = "OI", altitude_min = 7000 },
                { name = "CL246", transition = "BRD2", type = "OI", altitude_min = 7000 },
                { name = "CL246", transition = "", type = "OI", altitude_min = 7000 },
                { name = "FF246", transition = "", type = "OI", altitude_min = 6500 },
                { name = "50LOC", transition = "", type = "OI", altitude_min = 5600 },
                { name = "ML246", transition = "", type = "OI" },
                { name = "BRD", transition = "", type = "OI" },
                { name = "BRD", transition = "", type = "OI", altitude_min = 6200 },
                { name = "BRD", transition = "", type = "OI", altitude_min = 7200 },
                { name = "BRD", transition = "", type = "OI", altitude_min = 9200 },
                { name = "BRD", transition = "", type = "OI", speed = 185.0 },
                { name = "BRD", transition = "", type = "OI", altitude_min = 11000, speed = 200.0 },
            }
        },
        ["CNDB"] = {
            name = "CNDB",
            type = "A",
            runway = "CNDB",
            waypoints = {
                { name = "BRD", transition = "BRD", type = "OI", altitude_min = 10500 },
                { name = "BRD", transition = "BRD", type = "OI", speed = 185.0 },
                { name = "FN240", transition = "BRD", type = "OI", altitude_min = 7000 },
                { name = "FN240", transition = "", type = "OI", altitude_min = 7000 },
                { name = "BRD", transition = "", type = "OI" },
                { name = "BRD", transition = "", type = "OI", altitude_min = 8000 },
                { name = "BRD", transition = "", type = "OI" },
                { name = "BRD", transition = "", type = "OI", speed = 230.0 },
            }
        },
        ["CVDM"] = {
            name = "CVDM",
            type = "A",
            runway = "CVDM",
            waypoints = {
                { name = "BRD", transition = "BRD", type = "OI", altitude_min = 10500 },
                { name = "BRD", transition = "BRD", type = "OI", altitude_min = 6900 },
                { name = "CD245", transition = "BRD", type = "OI", altitude_min = 6900 },
                { name = "CD245", transition = "", type = "OI", altitude_min = 6900 },
                { name = "FD245", transition = "", type = "OI", altitude_min = 5800 },
                { name = "30VOR", transition = "", type = "OI", altitude_min = 5600 },
                { name = "MD245", transition = "", type = "OI" },
                { name = "BRD", transition = "", type = "OI", altitude_min = 5330 },
                { name = "BRD", transition = "", type = "OI", altitude_min = 7300 },
                { name = "BRD", transition = "", type = "OI" },
                { name = "BRD", transition = "", type = "OI", speed = 200.0 },
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
