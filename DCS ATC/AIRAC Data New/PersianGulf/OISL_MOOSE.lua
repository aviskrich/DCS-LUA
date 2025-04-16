local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OISL",
        Name = "OISL Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["D086T"] = { lat = 48.903838889, lon = 24.192188889, type = "UKLI" },
        ["MD09"] = { lat = 36.693011111, lon = 3.142991667, type = "DAAG" },
        ["ROTAL"] = { lat = 27.544722222, lon = 53.888888889, type = "ENRT" },
        ["FD27"] = { lat = 36.686708333, lon = 3.364586111, type = "DAAG" },
        ["D088O"] = { lat = -26.069838889, lon = 28.491363889, type = "FAOR" },
        ["35VOR"] = { lat = 9.565338889, lon = -7.526580556, type = "DIOD" },
        ["D279P"] = { lat = 9.380783333, lon = 13.078877778, type = "FKKR" },
        ["FQ266"] = { lat = 27.672844444, lon = 54.564275, type = "OISL" },
        ["D268Q"] = { lat = 27.679783333, lon = 54.096094444, type = "OISL" },
        ["NABEX"] = { lat = 27.199166667, lon = 54.226111111, type = "ENRT" },
        ["FD09"] = { lat = 36.172252778, lon = 5.185822222, type = "DAAS" },
        ["D197L"] = { lat = 28.235372222, lon = -13.915436111, type = "GCFV" },
        ["CD09"] = { lat = 36.698797222, lon = 2.925505556, type = "DAAG" },
        ["50VOR"] = { lat = 35.396983333, lon = 4.272536111, type = "DAAD" },
        ["MQ09"] = { lat = 42.877136111, lon = 129.396636111, type = "ZYYJ" },
        ["D268N"] = { lat = 32.129944444, lon = 19.978913889, type = "HLLB" },
        ["CQ266"] = { lat = 27.674144444, lon = 54.658125, type = "OISL" },
        ["60VOR"] = { lat = 36.694425, lon = 3.091211111, type = "DAAG" },
        ["VOR10"] = { lat = -18.777077778, lon = 47.345166667, type = "FMMI" },
        ["FQ09"] = { lat = 49.166208333, lon = 16.503744444, type = "LKTB" },
        ["D130K"] = { lat = 29.324977778, lon = 106.889744444, type = "ZUCK" },
        ["CQ09"] = { lat = 32.661102778, lon = 12.977444444, type = "HLLT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW09"] = {
            heading = 90,
            length = -180.0,
            width = 0,
            threshold = { lat = 27.674683333333334, lon = 54.37496111111111 },
            end = { lat = 27.674683333333334, lon = 54.341510113243146 }
        },
        ["RW27"] = {
            heading = 270,
            length = 180.0,
            width = 0,
            threshold = { lat = 27.675019444444445, lon = 54.399475 },
            end = { lat = 27.675019444444445, lon = 54.366023899217744 }
        },
    },

    -- Процедуры SID
    SID = {
        ["NABE3C"] = {
            name = "NABE3C",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 3050 },
                { name = "LAR", type = "D", altitude_min = 5500 },
                { name = "LAR", type = "D", altitude_min = 8000 },
                { name = "NABEX", type = "E" },
            }
        },
        ["ROTA3A"] = {
            name = "ROTA3A",
            runway = "RW27",
            waypoints = {
                { name = "", type = "", altitude_min = 3050 },
                { name = "LAR", type = "D", altitude_min = 5500 },
                { name = "LAR", type = "D", altitude_min = 8000 },
                { name = "ROTAL", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["NABE1R"] = {
            name = "NABE1R",
            runway = "ALL",
            waypoints = {
                { name = "NABEX", type = "OI" },
                { name = "D130K", type = "OI" },
                { name = "D088O", type = "OI" },
            }
        },
        ["NABE1T"] = {
            name = "NABE1T",
            runway = "ALL",
            waypoints = {
                { name = "NABEX", type = "OI" },
                { name = "D268Q", type = "OI" },
            }
        },
        ["NABE2S"] = {
            name = "NABE2S",
            runway = "ALL",
            waypoints = {
                { name = "NABEX", type = "OI" },
                { name = "D197L", type = "OI" },
                { name = "LAR", type = "OI" },
            }
        },
        ["ROTA2Q"] = {
            name = "ROTA2Q",
            runway = "ALL",
            waypoints = {
                { name = "ROTAL", type = "OI" },
                { name = "LAR", type = "OI" },
                { name = "D088O", type = "OI" },
            }
        },
        ["ROTA2R"] = {
            name = "ROTA2R",
            runway = "ALL",
            waypoints = {
                { name = "ROTAL", type = "OI" },
                { name = "LAR", type = "OI" },
            }
        },
        ["ROTA2S"] = {
            name = "ROTA2S",
            runway = "ALL",
            waypoints = {
                { name = "ROTAL", type = "OI" },
                { name = "D268Q", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D09"] = {
            name = "D09",
            type = "A",
            runway = "D09",
            waypoints = {
                { name = "D268Q", transition = "D268Q", type = "OI", altitude_min = 8200, speed = 210.0 },
                { name = "D268N", transition = "D268Q", type = "OI", altitude_min = 7100 },
                { name = "CD09", transition = "D268Q", type = "OI", altitude_min = 6100 },
                { name = "CD09", transition = "", type = "OI", altitude_min = 6100 },
                { name = "VOR10", transition = "", type = "OI", altitude_min = 5600 },
                { name = "FD09", transition = "", type = "OI", altitude_min = 4400 },
                { name = "50VOR", transition = "", type = "OI", altitude_min = 3700 },
                { name = "MD09", transition = "", type = "OI" },
                { name = "LAR", transition = "", type = "OI" },
                { name = "D088O", transition = "", type = "OI" },
                { name = "D088O", transition = "", type = "OI", altitude_max = 20000 },
            }
        },
        ["D27-Y"] = {
            name = "D27-Y",
            type = "A",
            runway = "D27-Y",
            waypoints = {
                { name = "LAR", transition = "LAR", type = "OI", altitude_min = 9000, speed = 210.0 },
                { name = "D088O", transition = "LAR", type = "OI" },
                { name = "D088O", transition = "LAR", type = "OI" },
                { name = "D088O", transition = "LAR", type = "OI", altitude_min = 8000 },
                { name = "FD27", transition = "LAR", type = "OI", altitude_min = 6500 },
                { name = "FD27", transition = "", type = "OI", altitude_min = 6500 },
                { name = "60VOR", transition = "", type = "OI", altitude_min = 5100 },
                { name = "35VOR", transition = "", type = "OI", altitude_min = 4200 },
                { name = "LAR", transition = "", type = "OI" },
                { name = "LAR", transition = "", type = "OI", altitude_min = 6000 },
                { name = "LAR", transition = "", type = "OI" },
                { name = "LAR", transition = "", type = "OI", altitude_min = 9000, speed = 220.0 },
            }
        },
        ["D27-Z"] = {
            name = "D27-Z",
            type = "A",
            runway = "D27-Z",
            waypoints = {
                { name = "D088O", transition = "D088O", type = "OI", altitude_min = 8500, speed = 220.0 },
                { name = "FD27", transition = "D088O", type = "OI", altitude_min = 6500 },
                { name = "FD27", transition = "", type = "OI", altitude_min = 6500 },
                { name = "60VOR", transition = "", type = "OI", altitude_min = 5100 },
                { name = "35VOR", transition = "", type = "OI", altitude_min = 4200 },
                { name = "LAR", transition = "", type = "OI" },
                { name = "LAR", transition = "", type = "OI", altitude_min = 5000 },
                { name = "LAR", transition = "", type = "OI" },
                { name = "D088O", transition = "", type = "OI" },
                { name = "D088O", transition = "", type = "OI", altitude_max = 20000 },
            }
        },
        ["NDMA"] = {
            name = "NDMA",
            type = "A",
            runway = "NDMA",
            waypoints = {
                { name = "D086T", transition = "D086T", type = "OI", altitude_min = 8500 },
                { name = "CQ266", transition = "D086T", type = "OI", altitude_min = 7000 },
                { name = "CQ266", transition = "", type = "OI", altitude_min = 7000 },
                { name = "FQ266", transition = "", type = "OI", altitude_min = 6300 },
                { name = "LAR", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 7000 },
                { name = "LAR", transition = "", type = "OI" },
                { name = "D086T", transition = "", type = "OI" },
                { name = "D086T", transition = "", type = "OI", altitude_max = 14000, speed = 220.0 },
            }
        },
        ["Q09"] = {
            name = "Q09",
            type = "A",
            runway = "Q09",
            waypoints = {
                { name = "D279P", transition = "D279P", type = "OI", altitude_min = 8000 },
                { name = "CQ09", transition = "D279P", type = "OI", altitude_min = 5700 },
                { name = "CQ09", transition = "", type = "OI", altitude_min = 5700 },
                { name = "FQ09", transition = "", type = "OI", altitude_min = 4500 },
                { name = "MQ09", transition = "", type = "OI" },
                { name = "LAR", transition = "", type = "OI" },
                { name = "D086T", transition = "", type = "OI" },
                { name = "D086T", transition = "", type = "OI", altitude_max = 14000, speed = 220.0 },
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
