local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LCRA",
        Name = "LCRA Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["IREFA"] = { lat = 34.4175, lon = 33.418888889, type = "ENRT" },
        ["MEZUS"] = { lat = 34.4175, lon = 32.058888889, type = "ENRT" },
        ["D189L"] = { lat = 44.381666667, lon = 37.936666667, type = "URKG" },
        ["D113N"] = { lat = 34.476333333, lon = 33.256397222, type = "LCRA" },
        ["FF28"] = { lat = 51.996388889, lon = 19.241666667, type = "EPLY" },
        ["D115K"] = { lat = 28.419033333, lon = -16.147288889, type = "GCXO" },
        ["DER28"] = { lat = 53.114791667, lon = 45.007330556, type = "UWPP" },
        ["CF28"] = { lat = 32.84265, lon = 13.500358333, type = "HLLM" },
        ["CT28"] = { lat = 51.502083333, lon = 19.489111111, type = "EPLK" },
        ["ANANE"] = { lat = 34.298611111, lon = 32.728055556, type = "ENRT" },
        ["FT28"] = { lat = 51.526305556, lon = 19.332416667, type = "EPLK" },
        ["DER10"] = { lat = 53.103711111, lon = 45.044866667, type = "UWPP" },
        ["D131K"] = { lat = 38.026911111, lon = 21.590666667, type = "LGRX" },
        ["RW28"] = { lat = 26.191502778, lon = 85.930916667, type = "VEDH" },
        ["D189N"] = { lat = 40.32375, lon = 109.976788889, type = "ZBOW" },
    },

    -- Данные ВПП
    Runways = {
        ["RW10"] = {
            heading = 100,
            length = 30.0,
            width = 0,
            threshold = { lat = 34.594125000000005, lon = 32.97351388888889 },
            end = { lat = 34.59326763620041, lon = 32.97942057461007 }
        },
        ["RW28"] = {
            heading = 280,
            length = -30.0,
            width = 0,
            threshold = { lat = 34.586619444444445, lon = 33.00203333333334 },
            end = { lat = 34.58576208064485, lon = 33.00793948549192 }
        },
    },

    -- Процедуры SID
    SID = {
        ["EAST3"] = {
            name = "EAST3",
            runway = "RW10",
            waypoints = {
                { name = "DER10", type = "P" },
                { name = "", type = "", altitude_min = 1880 },
                { name = "IREFA", type = "E" },
                { name = "DER28", type = "P" },
                { name = "", type = "", altitude_min = 580 },
                { name = "IREFA", type = "E" },
            }
        },
        ["WEST1"] = {
            name = "WEST1",
            runway = "RW10",
            waypoints = {
                { name = "DER10", type = "P" },
                { name = "", type = "", altitude_min = 1880 },
                { name = "MEZUS", type = "E" },
                { name = "DER28", type = "P" },
                { name = "", type = "", altitude_min = 580 },
                { name = "MEZUS", type = "E" },
            }
        },
        ["WEST2"] = {
            name = "WEST2",
            runway = "RW10",
            waypoints = {
                { name = "DER10", type = "P" },
                { name = "", type = "", altitude_min = 1880 },
                { name = "ANANE", type = "E" },
                { name = "DER28", type = "P" },
                { name = "", type = "", altitude_min = 580 },
                { name = "ANANE", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ANANEA"] = {
            name = "ANANEA",
            runway = "ALL",
            waypoints = {
                { name = "ANANE", type = "LC" },
                { name = "", type = "" },
                { name = "D113N", type = "LC" },
                { name = "CT28", type = "LC" },
            }
        },
        ["ANANEB"] = {
            name = "ANANEB",
            runway = "ALL",
            waypoints = {
                { name = "ANANE", type = "LC" },
                { name = "", type = "" },
                { name = "D131K", type = "LC" },
            }
        },
        ["IREFAA"] = {
            name = "IREFAA",
            runway = "ALL",
            waypoints = {
                { name = "IREFA", type = "LC" },
                { name = "", type = "" },
                { name = "CT28", type = "LC" },
            }
        },
        ["IREFAB"] = {
            name = "IREFAB",
            runway = "ALL",
            waypoints = {
                { name = "IREFA", type = "LC" },
                { name = "", type = "" },
                { name = "CF28", type = "LC" },
            }
        },
        ["MEZUSA"] = {
            name = "MEZUSA",
            runway = "ALL",
            waypoints = {
                { name = "MEZUS", type = "LC" },
                { name = "", type = "" },
                { name = "D113N", type = "LC" },
                { name = "CT28", type = "LC" },
            }
        },
        ["MEZUSB"] = {
            name = "MEZUSB",
            runway = "ALL",
            waypoints = {
                { name = "MEZUS", type = "LC" },
                { name = "", type = "" },
                { name = "D131K", type = "LC" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I28"] = {
            name = "I28",
            type = "A",
            runway = "I28",
            waypoints = {
                { name = "D131K", transition = "D131K", type = "LC", altitude_min = 2080 },
                { name = "D115K", transition = "D131K", type = "LC", altitude_min = 2080 },
                { name = "CF28", transition = "D131K", type = "LC", altitude_min = 2080 },
                { name = "CF28", transition = "", type = "LC" },
                { name = "FF28", transition = "", type = "LC" },
                { name = "RW28", transition = "", type = "LC" },
                { name = "RW28", transition = "", type = "LC", altitude_min = 2080 },
                { name = "", transition = "", type = "" },
            }
        },
        ["T28"] = {
            name = "T28",
            type = "A",
            runway = "T28",
            waypoints = {
                { name = "D189L", transition = "D189L", type = "LC", altitude_min = 10000 },
                { name = "D189N", transition = "D189L", type = "LC", altitude_min = 10000 },
                { name = "D113N", transition = "D189L", type = "LC", altitude_min = 2080 },
                { name = "CT28", transition = "D189L", type = "LC", altitude_min = 2080 },
                { name = "CT28", transition = "", type = "LC", altitude_min = 2080 },
                { name = "FT28", transition = "", type = "LC", altitude_min = 2080 },
                { name = "AKR", transition = "", type = "LC" },
                { name = "AKR", transition = "", type = "LC", altitude_min = 2080 },
                { name = "", transition = "", type = "" },
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
