local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIKQ",
        Name = "OIKQ Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["D052M"] = { lat = -4.261322222, lon = 15.583725, type = "FZAA" },
        ["RW05"] = { lat = 6.273472222, lon = 81.11275, type = "VCRI" },
        ["CF23"] = { lat = 82.579652778, lon = -61.746808333, type = "CYLT" },
        ["ASMUK"] = { lat = 28.164444444, lon = 56.081388889, type = "ENRT" },
        ["FN05Y"] = { lat = 40.798816667, lon = 24.432036111, type = "LGKV" },
        ["FN05X"] = { lat = 26.684652778, lon = 55.823380556, type = "OIKQ" },
        ["D222O"] = { lat = 32.481486111, lon = 12.949408333, type = "HLLT" },
        ["CF05"] = { lat = 10.21615, lon = 10.790186111, type = "DNGO" },
        ["KHM30"] = { lat = 27.188011111, lon = 55.610536111, type = "OIKQ" },
        ["MA05"] = { lat = 28.991827778, lon = -10.091097222, type = "GMAG" },
        ["FN23"] = { lat = 28.099330556, lon = 9.722716667, type = "DAUZ" },
        ["FF23"] = { lat = 10.780902778, lon = 7.412891667, type = "DNKA" },
        ["BND"] = { lat = -30.883333333, lon = 151.15, type = "ENRT" },
        ["FF05"] = { lat = 10.236425, lon = 10.817094444, type = "DNGO" },
        ["D270M"] = { lat = 42.584527778, lon = 27.227161111, type = "LBBG" },
        ["20DME"] = { lat = 50.205880556, lon = 14.457947222, type = "LKVO" },
        ["MA23"] = { lat = 51.893669444, lon = -176.612477778, type = "PADK" },
        ["KHM29"] = { lat = 27.148375, lon = 55.570827778, type = "OIKQ" },
        ["D343L"] = { lat = 45.652644444, lon = 9.207225, type = "LIML" },
        ["D048E"] = { lat = 42.070808333, lon = 35.167766667, type = "LTCM" },
        ["D343T"] = { lat = 40.018938889, lon = 3.31765, type = "LEPA" },
        ["MOBON"] = { lat = 27.737222222, lon = 55.420277778, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW05"] = {
            heading = 50,
            length = 200.0,
            width = 0,
            threshold = { lat = 26.742255555555555, lon = 55.8862 },
            end = { lat = 26.76341338685864, lon = 55.914434936697425 }
        },
        ["RW23"] = {
            heading = 230,
            length = -200.0,
            width = 0,
            threshold = { lat = 26.76702222222222, lon = 55.91850833333333 },
            end = { lat = 26.788180053525306, lon = 55.9467494236815 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BND1G"] = {
            name = "BND1G",
            runway = "RW05",
            waypoints = {
                { name = "", type = "", altitude_min = 450 },
                { name = "BND", type = "D" },
            }
        },
        ["BND1J"] = {
            name = "BND1J",
            runway = "RW23",
            waypoints = {
                { name = "", type = "", altitude_min = 450 },
                { name = "", type = "" },
                { name = "BND", type = "D" },
            }
        },
        ["MOBO1G"] = {
            name = "MOBO1G",
            runway = "RW05",
            waypoints = {
                { name = "D048E", type = "P", altitude_min = 1500 },
                { name = "", type = "" },
                { name = "KHM30", type = "P" },
                { name = "", type = "" },
                { name = "MOBON", type = "E" },
            }
        },
        ["MOBO1J"] = {
            name = "MOBO1J",
            runway = "RW23",
            waypoints = {
                { name = "", type = "", altitude_min = 450 },
                { name = "KHM", type = "D", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "KHM30", type = "P" },
                { name = "", type = "" },
                { name = "MOBON", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ASMU1R"] = {
            name = "ASMU1R",
            runway = "ALL",
            waypoints = {
                { name = "ASMUK", type = "OI" },
                { name = "D343T", type = "OI" },
                { name = "D343L", type = "OI" },
                { name = "BND", type = "OI" },
                { name = "D052M", type = "OI" },
            }
        },
        ["ASMU1W"] = {
            name = "ASMU1W",
            runway = "ALL",
            waypoints = {
                { name = "ASMUK", type = "OI" },
                { name = "D343T", type = "OI" },
                { name = "D343L", type = "OI" },
                { name = "BND", type = "OI" },
                { name = "KHM", type = "OI" },
                { name = "D222O", type = "OI" },
            }
        },
        ["BND1R"] = {
            name = "BND1R",
            runway = "ALL",
            waypoints = {
                { name = "BND", type = "OI" },
                { name = "D052M", type = "OI" },
            }
        },
        ["BND1W"] = {
            name = "BND1W",
            runway = "ALL",
            waypoints = {
                { name = "BND", type = "OI" },
                { name = "KHM", type = "OI" },
                { name = "D222O", type = "OI" },
            }
        },
        ["MOBO1W"] = {
            name = "MOBO1W",
            runway = "ALL",
            waypoints = {
                { name = "MOBON", type = "OI" },
                { name = "KHM29", type = "OI" },
                { name = "D270M", type = "OI" },
                { name = "D222O", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["N05-X"] = {
            name = "N05-X",
            type = "A",
            runway = "N05-X",
            waypoints = {
                { name = "KHM", transition = "KHM", type = "OI", altitude_min = 3000, speed = 220.0 },
                { name = "KHM", transition = "KHM", type = "OI" },
                { name = "FN05X", transition = "KHM", type = "OI" },
                { name = "FN05X", transition = "", type = "OI" },
                { name = "RW05", transition = "", type = "OI" },
                { name = "KHM", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 1800 },
                { name = "KHM", transition = "", type = "OI" },
                { name = "KHM", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["N05-Y"] = {
            name = "N05-Y",
            type = "A",
            runway = "N05-Y",
            waypoints = {
                { name = "KHM", transition = "KHM", type = "OI", altitude_min = 3000 },
                { name = "KHM", transition = "KHM", type = "OI" },
                { name = "FN05Y", transition = "KHM", type = "OI" },
                { name = "FN05Y", transition = "", type = "OI" },
                { name = "RW05", transition = "", type = "OI" },
                { name = "KHM", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 1800 },
                { name = "KHM", transition = "", type = "OI" },
                { name = "KHM", transition = "", type = "OI", altitude_min = 3000 },
            }
        },
        ["N23-X"] = {
            name = "N23-X",
            type = "A",
            runway = "N23-X",
            waypoints = {
                { name = "KHM", transition = "KHM", type = "OI", altitude_min = 3000, speed = 220.0 },
                { name = "KHM", transition = "KHM", type = "OI" },
                { name = "FN23", transition = "KHM", type = "OI" },
                { name = "FN23", transition = "", type = "OI" },
                { name = "RW23", transition = "", type = "OI" },
                { name = "KHM", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 1800 },
                { name = "KHM", transition = "", type = "OI" },
                { name = "KHM", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["N23-Y"] = {
            name = "N23-Y",
            type = "A",
            runway = "N23-Y",
            waypoints = {
                { name = "KHM", transition = "KHM", type = "OI", altitude_min = 3000 },
                { name = "KHM", transition = "KHM", type = "OI" },
                { name = "FN23", transition = "KHM", type = "OI" },
                { name = "FN23", transition = "", type = "OI" },
                { name = "RW23", transition = "", type = "OI" },
                { name = "KHM", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 1800 },
                { name = "KHM", transition = "", type = "OI" },
                { name = "KHM", transition = "", type = "OI", altitude_min = 3000 },
            }
        },
        ["Q05-Z"] = {
            name = "Q05-Z",
            type = "A",
            runway = "Q05-Z",
            waypoints = {
                { name = "D222O", transition = "D222O", type = "OI", altitude_min = 3000 },
                { name = "CF05", transition = "D222O", type = "OI", altitude_min = 2000 },
                { name = "CF05", transition = "", type = "OI", altitude_min = 2000 },
                { name = "FF05", transition = "", type = "OI", altitude_min = 1400 },
                { name = "MA05", transition = "", type = "OI" },
                { name = "KHM", transition = "", type = "OI", altitude_min = 450 },
                { name = "", transition = "", type = "", altitude_min = 1500 },
                { name = "KHM", transition = "", type = "OI" },
                { name = "D222O", transition = "", type = "OI" },
                { name = "D222O", transition = "", type = "OI", altitude_min = 3000 },
            }
        },
        ["Q23-Z"] = {
            name = "Q23-Z",
            type = "A",
            runway = "Q23-Z",
            waypoints = {
                { name = "D052M", transition = "D052M", type = "OI", altitude_min = 3000 },
                { name = "CF23", transition = "D052M", type = "OI", altitude_min = 1800 },
                { name = "CF23", transition = "", type = "OI", altitude_min = 1800 },
                { name = "FF23", transition = "", type = "OI", altitude_min = 1200 },
                { name = "20DME", transition = "", type = "OI", altitude_min = 600 },
                { name = "MA23", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 450 },
                { name = "", transition = "", type = "" },
                { name = "D052M", transition = "", type = "OI" },
                { name = "D052M", transition = "", type = "OI", altitude_min = 3000 },
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
