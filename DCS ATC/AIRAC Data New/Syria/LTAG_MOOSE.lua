local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LTAG",
        Name = "LTAG Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["TOSIE"] = { lat = 37.166413889, lon = 35.697594444, type = "LTAG" },
        ["EMLET"] = { lat = 67.75, lon = 21.698333333, type = "ENRT" },
        ["WUNSO"] = { lat = 37.032661111, lon = 35.476477778, type = "LTAG" },
        ["RW05"] = { lat = 6.273472222, lon = 81.11275, type = "VCRI" },
        ["GURLE"] = { lat = 37.136116667, lon = 35.647805556, type = "LTAG" },
        ["D220O"] = { lat = 53.251111111, lon = 58.424188889, type = "USCM" },
        ["CUROS"] = { lat = 36.985377778, lon = 35.398447222, type = "LTAG" },
        ["GOMSE"] = { lat = 36.929083333, lon = 35.306033333, type = "LTAG" },
        ["HABIM"] = { lat = 37.045338889, lon = 35.497427778, type = "LTAG" },
        ["OSLUP"] = { lat = 36.765897222, lon = 35.426491667, type = "LTAG" },
        ["JAKUP"] = { lat = 36.864494444, lon = 35.199583333, type = "LTAG" },
        ["JAYBY"] = { lat = 37.072911111, lon = 35.543038889, type = "LTAG" },
        ["OGBON"] = { lat = 37.265316667, lon = 35.470041667, type = "LTAG" },
    },

    -- Данные ВПП
    Runways = {
        ["RW05"] = {
            heading = 50,
            length = 600.0,
            width = 0,
            threshold = { lat = 36.993772222222226, lon = 35.41231666666666 },
            end = { lat = 37.05724571613148, lon = 35.5070264166248 }
        },
        ["RW23"] = {
            heading = 230,
            length = -600.0,
            width = 0,
            threshold = { lat = 37.00786111111111, lon = 35.43552777777777 },
            end = { lat = 37.07133460502037, lon = 35.5302550793205 }
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
        ["I05"] = {
            name = "I05",
            type = "A",
            runway = "I05",
            waypoints = {
                { name = "JAKUP", transition = "JAKUP", type = "LT", altitude_min = 3500, speed = 250.0 },
                { name = "OSLUP", transition = "OSLUP", type = "LT", altitude_min = 8000, altitude_max = 14000 },
                { name = "D220O", transition = "OSLUP", type = "LT", altitude_min = 3500 },
                { name = "", transition = "OSLUP", type = "" },
                { name = "JAKUP", transition = "", type = "LT" },
                { name = "GOMSE", transition = "", type = "LT" },
                { name = "RW05", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 640 },
                { name = "TOSIE", transition = "", type = "LT", altitude_min = 5000 },
                { name = "TOSIE", transition = "", type = "LT", altitude_max = 9000, speed = 250.0 },
            }
        },
        ["I23"] = {
            name = "I23",
            type = "A",
            runway = "I23",
            waypoints = {
                { name = "OGBON", transition = "OGBON", type = "LT", altitude_min = 9000 },
                { name = "TOSIE", transition = "OGBON", type = "LT", altitude_min = 4700 },
                { name = "GURLE", transition = "OGBON", type = "LT", altitude_min = 3800 },
                { name = "TOSIE", transition = "TOSIE", type = "LT", altitude_min = 5000, speed = 250.0 },
                { name = "GURLE", transition = "TOSIE", type = "LT", altitude_min = 3800 },
                { name = "GURLE", transition = "", type = "LT" },
                { name = "JAYBY", transition = "", type = "LT" },
                { name = "RW23", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 640 },
                { name = "JAKUP", transition = "", type = "LT", altitude_min = 3500 },
                { name = "JAKUP", transition = "", type = "LT", altitude_max = 9000, speed = 250.0 },
            }
        },
        ["R05"] = {
            name = "R05",
            type = "A",
            runway = "R05",
            waypoints = {
                { name = "JAKUP", transition = "JAKUP", type = "LT", altitude_min = 3500, speed = 250.0 },
                { name = "JAKUP", transition = "", type = "LT", altitude_min = 3500 },
                { name = "GOMSE", transition = "", type = "LT", altitude_min = 2300 },
                { name = "RW05", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 620 },
                { name = "TOSIE", transition = "", type = "LT", altitude_min = 5000 },
                { name = "TOSIE", transition = "", type = "LT", altitude_max = 9000, speed = 250.0 },
            }
        },
        ["R23"] = {
            name = "R23",
            type = "A",
            runway = "R23",
            waypoints = {
                { name = "TOSIE", transition = "TOSIE", type = "LT", altitude_min = 5000 },
                { name = "TOSIE", transition = "", type = "LT", altitude_min = 5000 },
                { name = "JAYBY", transition = "", type = "LT", altitude_min = 2300 },
                { name = "HABIM", transition = "", type = "LT", altitude_min = 1400 },
                { name = "WUNSO", transition = "", type = "LT", altitude_min = 1100 },
                { name = "RW23", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 632 },
                { name = "JAKUP", transition = "", type = "LT", altitude_min = 3500 },
                { name = "JAKUP", transition = "", type = "LT", altitude_max = 9000 },
            }
        },
        ["T05"] = {
            name = "T05",
            type = "A",
            runway = "T05",
            waypoints = {
                { name = "JAKUP", transition = "JAKUP", type = "LT", altitude_min = 3500, speed = 250.0 },
                { name = "OSLUP", transition = "OSLUP", type = "LT", altitude_min = 8000 },
                { name = "JAKUP", transition = "OSLUP", type = "LT", altitude_min = 3500 },
                { name = "JAKUP", transition = "", type = "LT", altitude_min = 3500 },
                { name = "GOMSE", transition = "", type = "LT", altitude_min = 2300 },
                { name = "CUROS", transition = "", type = "LT" },
                { name = "DAN", transition = "", type = "LT" },
                { name = "TOSIE", transition = "", type = "LT", altitude_min = 5000 },
                { name = "TOSIE", transition = "", type = "LT", altitude_max = 9000, speed = 250.0 },
            }
        },
        ["T23"] = {
            name = "T23",
            type = "A",
            runway = "T23",
            waypoints = {
                { name = "OGBON", transition = "OGBON", type = "LT", altitude_min = 9000 },
                { name = "TOSIE", transition = "OGBON", type = "LT", altitude_min = 4700 },
                { name = "TOSIE", transition = "TOSIE", type = "LT", altitude_min = 5000, speed = 250.0 },
                { name = "TOSIE", transition = "", type = "LT", altitude_min = 4700 },
                { name = "JAYBY", transition = "", type = "LT", altitude_min = 2400 },
                { name = "HABIM", transition = "", type = "LT", altitude_min = 1480 },
                { name = "WUNSO", transition = "", type = "LT", altitude_min = 1070 },
                { name = "EMLET", transition = "", type = "LT" },
                { name = "DAN", transition = "", type = "LT" },
                { name = "JAKUP", transition = "", type = "LT", altitude_min = 3500 },
                { name = "JAKUP", transition = "", type = "LT", altitude_max = 9000, speed = 250.0 },
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
