local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OSAP",
        Name = "OSAP Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["NOVMR"] = { lat = 51.075038889, lon = -1.338413889, type = "EGHI" },
        ["KILO"] = { lat = 35.985, lon = 37.213333333, type = "ENRT" },
        ["D225E"] = { lat = 45.638777778, lon = 15.899363889, type = "LDZA" },
        ["D154T"] = { lat = 40.145038889, lon = 23.145997222, type = "LGTS" },
        ["FD27L"] = { lat = 13.500444444, lon = 2.296583333, type = "DRRN" },
        ["CD09R"] = { lat = 36.193230556, lon = 37.072444444, type = "OSAP" },
        ["25VOR"] = { lat = 5.321355556, lon = -3.900655556, type = "DIAP" },
        ["D154E"] = { lat = 36.103511111, lon = 37.251411111, type = "OSAP" },
        ["GOLF"] = { lat = 48.93265, lon = -54.489486111, type = "CYQX" },
        ["CI27L"] = { lat = 36.166702778, lon = 37.370505556, type = "OSAP" },
        ["MD27L"] = { lat = 13.48425, lon = 2.221933333, type = "DRRN" },
        ["TAN"] = { lat = 28.428416667, lon = -11.173055556, type = "VOR", frequency = 112.3, elevation = 689.0, name = "TAN", range = 130.0 },
        ["LIMA"] = { lat = 36.036666667, lon = 37.018333333, type = "ENRT" },
        ["D106J"] = { lat = 6.673716667, lon = -1.426813889, type = "DGSI" },
        ["D225T"] = { lat = 39.227247222, lon = 19.746011111, type = "LGKR" },
        ["LUBAM"] = { lat = 35.666666667, lon = 36.533333333, type = "ENRT" },
        ["D274E"] = { lat = 51.756727778, lon = -1.736911111, type = "EGVN" },
        ["TANGO"] = { lat = 41.343888889, lon = -0.698333333, type = "LEZG" },
        ["NISAP"] = { lat = 36.784444444, lon = 36.641388889, type = "ENRT" },
        ["D012E"] = { lat = 10.065269444, lon = -84.217272222, type = "MROC" },
        ["64VOR"] = { lat = 31.834788889, lon = 5.41885, type = "DAUU" },
        ["D176E"] = { lat = 36.096236111, lon = 37.210947222, type = "OSAP" },
        ["FD09R"] = { lat = 13.481083333, lon = 2.076875, type = "DRRN" },
        ["KTN"] = { lat = -37.246666667, lon = 144.458333333, type = "ENRT" },
        ["AL225"] = { lat = 35.724419444, lon = 36.608752778, type = "OSAP" },
        ["D094E"] = { lat = 36.171880556, lon = 37.311858333, type = "OSAP" },
        ["MD09R"] = { lat = 13.481113889, lon = 2.155558333, type = "DRRN" },
        ["OM27L"] = { lat = 36.173113889, lon = 37.307552778, type = "OSAP" },
        ["D106E"] = { lat = 50.215666667, lon = 4.776666667, type = "EBFS" },
        ["D130J"] = { lat = 31.825258333, lon = 119.935236111, type = "ZSCG" },
        ["DELT1"] = { lat = 36.096666667, lon = 37.498333333, type = "ENRT" },
        ["AL176"] = { lat = 35.5122, lon = 37.228288889, type = "OSAP" },
        ["D058J"] = { lat = 36.260461111, lon = 37.389622222, type = "OSAP" },
        ["AL154"] = { lat = 35.570438889, lon = 37.544938889, type = "OSAP" },
        ["D082J"] = { lat = 24.141005556, lon = -104.334233333, type = "MMDO" },
        ["D176T"] = { lat = 40.940925, lon = -8.646686111, type = "LPPR" },
    },

    -- Данные ВПП
    Runways = {
        ["RW09R"] = {
            heading = 90,
            length = 0,
            width = 0,
            threshold = { lat = 36.182230555555556, lon = 37.20836388888889 },
            end = { lat = 36.182230555555556, lon = 37.20836388888889 }
        },
        ["RW27L"] = {
            heading = 270,
            length = 0,
            width = 0,
            threshold = { lat = 36.17918888888889, lon = 37.24036111111111 },
            end = { lat = 36.17918888888889, lon = 37.24036111111111 }
        },
    },

    -- Процедуры SID
    SID = {
        ["DELT1J"] = {
            name = "DELT1J",
            runway = "RW09R",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "D094E", type = "P", altitude_min = 3000 },
                { name = "DELT1", type = "E" },
            }
        },
        ["DELT1R"] = {
            name = "DELT1R",
            runway = "RW27L",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "D274E", type = "P", altitude_min = 3000 },
                { name = "D106E", type = "P" },
                { name = "DELT1", type = "E" },
            }
        },
        ["GOLF1J"] = {
            name = "GOLF1J",
            runway = "RW09R",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "D094E", type = "P", altitude_min = 3000 },
                { name = "D012E", type = "P" },
                { name = "GOLF", type = "E" },
            }
        },
        ["GOLF1R"] = {
            name = "GOLF1R",
            runway = "RW27L",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "D274E", type = "P", altitude_min = 3000 },
                { name = "D012E", type = "P" },
                { name = "GOLF", type = "E" },
            }
        },
        ["GOLF2J"] = {
            name = "GOLF2J",
            runway = "RW09R",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "D094E", type = "P", altitude_min = 3000 },
                { name = "D012E", type = "P" },
                { name = "GOLF", type = "E", altitude_min = 10000 },
            }
        },
        ["GOLF2R"] = {
            name = "GOLF2R",
            runway = "RW27L",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "D274E", type = "P", altitude_min = 3000 },
                { name = "D012E", type = "P" },
                { name = "GOLF", type = "E", altitude_min = 10000 },
            }
        },
        ["KILO1J"] = {
            name = "KILO1J",
            runway = "RW09R",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "", type = "" },
                { name = "KILO", type = "E" },
            }
        },
        ["KILO1R"] = {
            name = "KILO1R",
            runway = "RW27L",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "", type = "" },
                { name = "KILO", type = "E" },
            }
        },
        ["LIMA1J"] = {
            name = "LIMA1J",
            runway = "RW09R",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "", type = "" },
                { name = "LIMA", type = "E" },
            }
        },
        ["LIMA1R"] = {
            name = "LIMA1R",
            runway = "RW27L",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "LIMA", type = "E" },
            }
        },
        ["NOVM1E"] = {
            name = "NOVM1E",
            runway = "RW09R",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "D094E", type = "P", altitude_min = 3000 },
                { name = "ALE", type = "D", altitude_min = 8000 },
                { name = "NOVMR", type = "E" },
                { name = "NISAP", type = "E", altitude_min = 24000 },
            }
        },
        ["NOVM1W"] = {
            name = "NOVM1W",
            runway = "RW27L",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "D274E", type = "P", altitude_min = 3000 },
                { name = "ALE", type = "D", altitude_min = 8000 },
                { name = "NOVMR", type = "E" },
                { name = "NISAP", type = "E", altitude_min = 24000 },
            }
        },
        ["TANG1J"] = {
            name = "TANG1J",
            runway = "RW09R",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "", type = "" },
                { name = "TANGO", type = "E" },
            }
        },
        ["TANG1R"] = {
            name = "TANG1R",
            runway = "RW27L",
            waypoints = {
                { name = "", type = "", altitude_min = 1680 },
                { name = "", type = "" },
                { name = "TANGO", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["DELT1C"] = {
            name = "DELT1C",
            runway = "ALL",
            waypoints = {
                { name = "DELT1", type = "OS" },
                { name = "D106E", type = "OS", altitude_min = 4000 },
                { name = "ALE", type = "OS", altitude_min = 3500 },
            }
        },
        ["DELT2C"] = {
            name = "DELT2C",
            runway = "ALL",
            waypoints = {
                { name = "DELT1", type = "OS", altitude_min = 16000 },
                { name = "D106E", type = "OS", altitude_min = 4000 },
                { name = "ALE", type = "OS", altitude_min = 3500 },
            }
        },
        ["GOLF1C"] = {
            name = "GOLF1C",
            runway = "ALL",
            waypoints = {
                { name = "GOLF", type = "OS" },
                { name = "D012E", type = "OS", altitude_min = 4000 },
                { name = "ALE", type = "OS", altitude_min = 3500 },
            }
        },
        ["GOLF2C"] = {
            name = "GOLF2C",
            runway = "ALL",
            waypoints = {
                { name = "GOLF", type = "OS", altitude_min = 10000 },
                { name = "D012E", type = "OS", altitude_min = 4000 },
                { name = "ALE", type = "OS", altitude_min = 3500 },
            }
        },
        ["KILO1C"] = {
            name = "KILO1C",
            runway = "ALL",
            waypoints = {
                { name = "KILO", type = "OS" },
                { name = "D176E", type = "OS", altitude_min = 4000 },
                { name = "ALE", type = "OS", altitude_min = 3500 },
            }
        },
        ["KTN2C"] = {
            name = "KTN2C",
            runway = "ALL",
            waypoints = {
                { name = "KTN", type = "OS" },
                { name = "AL176", type = "OS", altitude_min = 24000 },
                { name = "D176T", type = "OS", altitude_min = 16000 },
                { name = "KILO", type = "OS", altitude_min = 8000 },
                { name = "D176E", type = "OS", altitude_min = 4000 },
                { name = "ALE", type = "OS", altitude_min = 3500 },
            }
        },
        ["LIMA1C"] = {
            name = "LIMA1C",
            runway = "ALL",
            waypoints = {
                { name = "LIMA", type = "OS" },
                { name = "D225E", type = "OS", altitude_min = 4000 },
                { name = "ALE", type = "OS", altitude_min = 3500 },
            }
        },
        ["LUBA2C"] = {
            name = "LUBA2C",
            runway = "ALL",
            waypoints = {
                { name = "LUBAM", type = "OS" },
                { name = "AL225", type = "OS", altitude_min = 24000 },
                { name = "D225T", type = "OS", altitude_min = 16000 },
                { name = "LIMA", type = "OS", altitude_min = 8000 },
                { name = "D225E", type = "OS", altitude_min = 4000 },
                { name = "ALE", type = "OS", altitude_min = 3500 },
            }
        },
        ["TAN2C"] = {
            name = "TAN2C",
            runway = "ALL",
            waypoints = {
                { name = "TAN", type = "OS" },
                { name = "AL154", type = "OS", altitude_min = 24000 },
                { name = "D154T", type = "OS", altitude_min = 16000 },
                { name = "TANGO", type = "OS", altitude_min = 8000 },
                { name = "D154E", type = "OS", altitude_min = 4000 },
                { name = "ALE", type = "OS", altitude_min = 3500 },
            }
        },
        ["TANG1C"] = {
            name = "TANG1C",
            runway = "ALL",
            waypoints = {
                { name = "TANGO", type = "OS" },
                { name = "D154E", type = "OS", altitude_min = 4000 },
                { name = "ALE", type = "OS", altitude_min = 3500 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D09R"] = {
            name = "D09R",
            type = "A",
            runway = "D09R",
            waypoints = {
                { name = "ALE", transition = "ALE1", type = "OS", altitude_min = 4000, speed = 185.0 },
                { name = "ALE", transition = "ALE1", type = "OS", altitude_min = 3000 },
                { name = "CD09R", transition = "ALE1", type = "OS", altitude_min = 3000 },
                { name = "ALE", transition = "ALE2", type = "OS", altitude_min = 4000, speed = 150.0 },
                { name = "ALE", transition = "ALE2", type = "OS", altitude_min = 3000 },
                { name = "CD09R", transition = "ALE2", type = "OS", altitude_min = 3000 },
                { name = "CD09R", transition = "", type = "OS", altitude_min = 3000 },
                { name = "FD09R", transition = "", type = "OS", altitude_min = 3000 },
                { name = "25VOR", transition = "", type = "OS", altitude_min = 2160 },
                { name = "MD09R", transition = "", type = "OS" },
                { name = "ALE", transition = "", type = "OS", altitude_min = 1686 },
                { name = "ALE", transition = "", type = "OS" },
            }
        },
        ["D27L"] = {
            name = "D27L",
            type = "A",
            runway = "D27L",
            waypoints = {
                { name = "ALE", transition = "ALE", type = "OS", altitude_min = 3500, speed = 230.0 },
                { name = "ALE", transition = "ALE", type = "OS", altitude_min = 2800 },
                { name = "FD27L", transition = "ALE", type = "OS", altitude_min = 2800 },
                { name = "FD27L", transition = "", type = "OS", altitude_min = 2800 },
                { name = "64VOR", transition = "", type = "OS", altitude_min = 2275 },
                { name = "MD27L", transition = "", type = "OS" },
                { name = "ALE", transition = "", type = "OS", altitude_min = 1680 },
                { name = "ALE", transition = "", type = "OS", speed = 230.0 },
            }
        },
        ["I27L"] = {
            name = "I27L",
            type = "A",
            runway = "I27L",
            waypoints = {
                { name = "ALE", transition = "ALE1", type = "OS", altitude_min = 3500 },
                { name = "ALE", transition = "ALE1", type = "OS" },
                { name = "CI27L", transition = "ALE1", type = "OS" },
                { name = "ALE", transition = "ALE2", type = "OS", altitude_min = 3500 },
                { name = "ALE", transition = "ALE2", type = "OS" },
                { name = "CI27L", transition = "ALE2", type = "OS" },
                { name = "DELT1", transition = "DELT1", type = "OS", altitude_min = 4000 },
                { name = "", transition = "DELT1", type = "" },
                { name = "GOLF", transition = "GOLF", type = "OS", altitude_min = 4000 },
                { name = "", transition = "GOLF", type = "" },
                { name = "D058J", transition = "GOLF", type = "OS", altitude_min = 4000 },
                { name = "D082J", transition = "GOLF", type = "OS" },
                { name = "CI27L", transition = "GOLF", type = "OS" },
                { name = "KILO", transition = "KILO", type = "OS", altitude_min = 4000 },
                { name = "", transition = "KILO", type = "" },
                { name = "D130J", transition = "KILO", type = "OS", altitude_min = 4000 },
                { name = "D106J", transition = "KILO", type = "OS" },
                { name = "CI27L", transition = "KILO", type = "OS" },
                { name = "LIMA", transition = "LIMA", type = "OS", altitude_min = 4000 },
                { name = "", transition = "LIMA", type = "" },
                { name = "D130J", transition = "LIMA", type = "OS", altitude_min = 4000 },
                { name = "D106J", transition = "LIMA", type = "OS" },
                { name = "CI27L", transition = "LIMA", type = "OS" },
                { name = "TANGO", transition = "TANGO", type = "OS", altitude_min = 4000 },
                { name = "", transition = "TANGO", type = "" },
                { name = "D130J", transition = "TANGO", type = "OS", altitude_min = 4000 },
                { name = "D106J", transition = "TANGO", type = "OS" },
                { name = "CI27L", transition = "TANGO", type = "OS" },
                { name = "CI27L", transition = "", type = "OS" },
                { name = "OM27L", transition = "", type = "OS" },
                { name = "RW27L", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 1680 },
                { name = "", transition = "", type = "" },
                { name = "ALE", transition = "", type = "OS", speed = 200.0 },
                { name = "ALE", transition = "", type = "OS" },
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
