local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "URMG",
        Name = "URMG Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["MG308"] = { lat = 43.410833333, lon = 45.620138889, type = "URMG" },
        ["MG087"] = { lat = 43.373111111, lon = 45.339555556, type = "URMG" },
        ["MG108"] = { lat = 43.539972222, lon = 45.916083333, type = "URMG" },
        ["FN08W"] = { lat = 43.381386111, lon = 45.523044444, type = "URMG" },
        ["MG267"] = { lat = 43.506361111, lon = 45.513305556, type = "URMG" },
        ["FN08V"] = { lat = 43.381111111, lon = 45.531111111, type = "URMG" },
        ["MG208"] = { lat = 43.511972222, lon = 45.602833333, type = "URMG" },
        ["MG085"] = { lat = 43.489694444, lon = 45.721333333, type = "URMG" },
        ["MG090"] = { lat = 43.382138889, lon = 45.556277778, type = "URMG" },
        ["WK"] = { lat = -3.5834, lon = 143.67605, type = "ENRT" },
        ["FI26V"] = { lat = 43.394044444, lon = 45.843872222, type = "URMG" },
        ["NEGUB"] = { lat = 43.736388889, lon = 45.425277778, type = "ENRT" },
        ["D260F"] = { lat = 48.896666667, lon = 139.928333333, type = "UHKM" },
        ["21THR"] = { lat = 9.332755556, lon = 13.319227778, type = "FKKR" },
        ["MG089"] = { lat = 43.382194444, lon = 45.557361111, type = "URMG" },
        ["PINTA"] = { lat = 43.616388889, lon = 46.215277778, type = "ENRT" },
        ["MG084"] = { lat = 43.483611111, lon = 45.569138889, type = "URMG" },
        ["REMKA"] = { lat = 43.269722222, lon = 46.116944444, type = "ENRT" },
        ["MG083"] = { lat = 43.478527778, lon = 45.445694444, type = "URMG" },
        ["MG265"] = { lat = 43.380166667, lon = 45.728916667, type = "URMG" },
        ["CI26V"] = { lat = 43.397794444, lon = 45.938372222, type = "URMG" },
        ["D080E"] = { lat = 43.393002778, lon = 45.826166667, type = "URMG" },
        ["MG263"] = { lat = 43.498194444, lon = 45.938888889, type = "URMG" },
        ["AMLUG"] = { lat = 43.476111111, lon = 45.215277778, type = "ENRT" },
        ["FN26W"] = { lat = 43.394986111, lon = 45.876622222, type = "URMG" },
        ["MG268"] = { lat = 43.554611111, lon = 45.817361111, type = "URMG" },
        ["MG270"] = { lat = 43.394027778, lon = 45.84325, type = "URMG" },
        ["MG126"] = { lat = 43.377694444, lon = 45.453638889, type = "URMG" },
        ["DER26"] = { lat = 43.387541667, lon = 45.684416667, type = "URMG" },
        ["MG088"] = { lat = 43.398138889, lon = 45.94625, type = "URMG" },
        ["MG269"] = { lat = 43.394, lon = 45.842333333, type = "URMG" },
        ["FN26V"] = { lat = 43.393888889, lon = 45.842222222, type = "URMG" },
        ["MG086"] = { lat = 43.366638889, lon = 45.943333333, type = "URMG" },
    },

    -- Данные ВПП
    Runways = {
        ["RW08"] = {
            heading = 80,
            length = 0,
            width = 0,
            threshold = { lat = 43.387541666666664, lon = 45.684416666666664 },
            end = { lat = 43.387541666666664, lon = 45.684416666666664 }
        },
        ["RW26"] = {
            heading = 260,
            length = 0,
            width = 0,
            threshold = { lat = 43.388819444444444, lon = 45.71523611111111 },
            end = { lat = 43.388819444444444, lon = 45.71523611111111 }
        },
    },

    -- Процедуры SID
    SID = {
        ["AMLU1S"] = {
            name = "AMLU1S",
            runway = "RW26",
            waypoints = {
                { name = "MG126", type = "P", altitude_min = 2180, speed = 230.0 },
                { name = "MG087", type = "P", speed = 245.0 },
                { name = "AMLUG", type = "E", altitude_min = 10000 },
            }
        },
        ["AMLU1T"] = {
            name = "AMLU1T",
            runway = "RW08",
            waypoints = {
                { name = "MG088", type = "P", altitude_min = 2180, speed = 245.0 },
                { name = "MG108", type = "P", speed = 245.0 },
                { name = "MG208", type = "P", speed = 245.0 },
                { name = "AMLUG", type = "E", altitude_min = 10000 },
            }
        },
        ["AMLU1U"] = {
            name = "AMLU1U",
            runway = "RW08",
            waypoints = {
                { name = "", type = "", altitude_min = 1850 },
                { name = "", type = "" },
                { name = "AMLUG", type = "E", altitude_min = 10000 },
            }
        },
        ["AMLU1W"] = {
            name = "AMLU1W",
            runway = "RW26",
            waypoints = {
                { name = "DER26", type = "P" },
                { name = "", type = "", altitude_min = 1860 },
                { name = "", type = "" },
                { name = "AMLUG", type = "E", altitude_min = 10000 },
            }
        },
        ["NEGU1S"] = {
            name = "NEGU1S",
            runway = "RW26",
            waypoints = {
                { name = "MG126", type = "P", altitude_min = 2180, speed = 230.0 },
                { name = "NEGUB", type = "E", altitude_min = 8000, speed = 245.0 },
            }
        },
        ["NEGU1T"] = {
            name = "NEGU1T",
            runway = "RW08",
            waypoints = {
                { name = "MG088", type = "P", altitude_min = 2180, speed = 245.0 },
                { name = "MG108", type = "P", speed = 245.0 },
                { name = "NEGUB", type = "E", altitude_min = 8000, speed = 245.0 },
            }
        },
        ["NEGU1U"] = {
            name = "NEGU1U",
            runway = "RW08",
            waypoints = {
                { name = "", type = "", altitude_min = 1850 },
                { name = "", type = "" },
                { name = "NEGUB", type = "E", altitude_min = 8000 },
            }
        },
        ["NEGU1W"] = {
            name = "NEGU1W",
            runway = "RW26",
            waypoints = {
                { name = "DER26", type = "P" },
                { name = "", type = "", altitude_min = 1860 },
                { name = "", type = "" },
                { name = "NEGUB", type = "E", altitude_min = 8000 },
            }
        },
        ["PINT1S"] = {
            name = "PINT1S",
            runway = "RW26",
            waypoints = {
                { name = "MG126", type = "P", altitude_min = 2180, speed = 230.0 },
                { name = "MG267", type = "P", speed = 245.0 },
                { name = "MG268", type = "P", speed = 245.0 },
                { name = "PINTA", type = "E", altitude_min = 9000, speed = 245.0 },
            }
        },
        ["PINT1T"] = {
            name = "PINT1T",
            runway = "RW08",
            waypoints = {
                { name = "MG088", type = "P", altitude_min = 2180, speed = 245.0 },
                { name = "PINTA", type = "E", altitude_min = 9000, speed = 245.0 },
            }
        },
        ["PINT1U"] = {
            name = "PINT1U",
            runway = "RW08",
            waypoints = {
                { name = "", type = "", altitude_min = 1850 },
                { name = "", type = "" },
                { name = "PINTA", type = "E", altitude_min = 9000 },
            }
        },
        ["PINT1W"] = {
            name = "PINT1W",
            runway = "RW26",
            waypoints = {
                { name = "DER26", type = "P" },
                { name = "", type = "", altitude_min = 1860 },
                { name = "WK", type = "P" },
                { name = "PINTA", type = "E", altitude_min = 9000 },
            }
        },
        ["PINT1Y"] = {
            name = "PINT1Y",
            runway = "RW08",
            waypoints = {
                { name = "", type = "", altitude_min = 3490 },
                { name = "D080E", type = "P" },
                { name = "WK", type = "P", altitude_min = 8000 },
                { name = "WK", type = "P", altitude_min = 9000 },
                { name = "", type = "" },
                { name = "PINTA", type = "E", altitude_min = 9000 },
            }
        },
        ["PINT1Z"] = {
            name = "PINT1Z",
            runway = "RW26",
            waypoints = {
                { name = "", type = "", altitude_min = 3500 },
                { name = "D260F", type = "P" },
                { name = "WK", type = "P", altitude_min = 8000 },
                { name = "WK", type = "P", altitude_min = 9000 },
                { name = "PINTA", type = "E", altitude_min = 9000 },
            }
        },
        ["REMK1S"] = {
            name = "REMK1S",
            runway = "RW26",
            waypoints = {
                { name = "MG126", type = "P", altitude_min = 2180, speed = 230.0 },
                { name = "MG267", type = "P", speed = 245.0 },
                { name = "MG268", type = "P", speed = 245.0 },
                { name = "MG263", type = "P", speed = 245.0 },
                { name = "REMKA", type = "E", altitude_min = 13000 },
            }
        },
        ["REMK1T"] = {
            name = "REMK1T",
            runway = "RW08",
            waypoints = {
                { name = "MG088", type = "P", altitude_min = 2180, speed = 245.0 },
                { name = "MG108", type = "P", speed = 245.0 },
                { name = "MG208", type = "P", speed = 245.0 },
                { name = "MG308", type = "P", speed = 245.0 },
                { name = "REMKA", type = "E", altitude_min = 13000 },
            }
        },
        ["REMK1U"] = {
            name = "REMK1U",
            runway = "RW08",
            waypoints = {
                { name = "", type = "", altitude_min = 3490 },
                { name = "D080E", type = "P" },
                { name = "WK", type = "P", altitude_min = 8000 },
                { name = "WK", type = "P", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "REMKA", type = "E", altitude_min = 13000 },
            }
        },
        ["REMK1W"] = {
            name = "REMK1W",
            runway = "RW26",
            waypoints = {
                { name = "", type = "", altitude_min = 3500 },
                { name = "D260F", type = "P" },
                { name = "WK", type = "P", altitude_min = 8000 },
                { name = "WK", type = "P", altitude_min = 10000 },
                { name = "REMKA", type = "E", altitude_min = 13000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["AMLU1P"] = {
            name = "AMLU1P",
            runway = "RW08",
            waypoints = {
                { name = "AMLUG", type = "UR", altitude_min = 9000, speed = 245.0 },
                { name = "MG087", type = "UR", altitude_min = 4970, speed = 245.0 },
                { name = "MG126", type = "UR", altitude_min = 2670, speed = 225.0 },
            }
        },
        ["AMLU1R"] = {
            name = "AMLU1R",
            runway = "RW26",
            waypoints = {
                { name = "AMLUG", type = "UR", altitude_min = 9000, speed = 245.0 },
                { name = "MG085", type = "UR", speed = 245.0 },
                { name = "MG263", type = "UR", altitude_min = 3010, speed = 245.0 },
                { name = "MG088", type = "UR", altitude_min = 2510, speed = 225.0 },
            }
        },
        ["AMLU1X"] = {
            name = "AMLU1X",
            runway = "ALL",
            waypoints = {
                { name = "AMLUG", type = "UR", altitude_min = 9000 },
                { name = "WK", type = "UR", altitude_min = 4150, altitude_max = 6120 },
            }
        },
        ["NEGU1P"] = {
            name = "NEGU1P",
            runway = "RW08",
            waypoints = {
                { name = "NEGUB", type = "UR", altitude_min = 9000, speed = 245.0 },
                { name = "MG083", type = "UR", altitude_min = 3000, speed = 245.0 },
                { name = "MG126", type = "UR", altitude_min = 2670, speed = 225.0 },
            }
        },
        ["NEGU1R"] = {
            name = "NEGU1R",
            runway = "RW26",
            waypoints = {
                { name = "NEGUB", type = "UR", altitude_min = 9000, speed = 245.0 },
                { name = "MG263", type = "UR", altitude_min = 3010, speed = 245.0 },
                { name = "MG088", type = "UR", altitude_min = 2510, speed = 225.0 },
            }
        },
        ["NEGU1X"] = {
            name = "NEGU1X",
            runway = "ALL",
            waypoints = {
                { name = "NEGUB", type = "UR", altitude_min = 9000 },
                { name = "WK", type = "UR", altitude_min = 4150, altitude_max = 6120 },
            }
        },
        ["PINT1P"] = {
            name = "PINT1P",
            runway = "RW08",
            waypoints = {
                { name = "PINTA", type = "UR", altitude_min = 8000, speed = 245.0 },
                { name = "MG085", type = "UR", speed = 245.0 },
                { name = "MG084", type = "UR", speed = 245.0 },
                { name = "MG083", type = "UR", altitude_min = 3000, speed = 245.0 },
                { name = "MG126", type = "UR", altitude_min = 2670, speed = 225.0 },
            }
        },
        ["PINT1R"] = {
            name = "PINT1R",
            runway = "RW26",
            waypoints = {
                { name = "PINTA", type = "UR", altitude_min = 8000, speed = 245.0 },
                { name = "MG088", type = "UR", altitude_min = 2510, speed = 225.0 },
            }
        },
        ["PINT1X"] = {
            name = "PINT1X",
            runway = "ALL",
            waypoints = {
                { name = "PINTA", type = "UR", altitude_min = 8000 },
                { name = "WK", type = "UR", altitude_min = 4150, altitude_max = 6120 },
            }
        },
        ["REMK1P"] = {
            name = "REMK1P",
            runway = "RW08",
            waypoints = {
                { name = "REMKA", type = "UR", altitude_min = 12000 },
                { name = "MG086", type = "UR", speed = 245.0 },
                { name = "MG085", type = "UR", altitude_min = 7590, speed = 245.0 },
                { name = "MG084", type = "UR", speed = 245.0 },
                { name = "MG083", type = "UR", altitude_min = 3000, speed = 245.0 },
                { name = "MG126", type = "UR", altitude_min = 2670, speed = 225.0 },
            }
        },
        ["REMK1R"] = {
            name = "REMK1R",
            runway = "RW26",
            waypoints = {
                { name = "REMKA", type = "UR", altitude_min = 12000 },
                { name = "MG265", type = "UR", speed = 245.0 },
                { name = "MG085", type = "UR", altitude_min = 7600, speed = 245.0 },
                { name = "MG263", type = "UR", altitude_min = 3010, speed = 245.0 },
                { name = "MG088", type = "UR", altitude_min = 2510, speed = 225.0 },
            }
        },
        ["REMK1X"] = {
            name = "REMK1X",
            runway = "ALL",
            waypoints = {
                { name = "REMKA", type = "UR", altitude_min = 12000 },
                { name = "WK", type = "UR", altitude_min = 4150, altitude_max = 6120 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I26-V"] = {
            name = "I26-V",
            type = "A",
            runway = "I26-V",
            waypoints = {
                { name = "WK", transition = "WK1", type = "UR", altitude_min = 4150, altitude_max = 6120, speed = 220.0 },
                { name = "WK", transition = "WK1", type = "UR" },
                { name = "CI26V", transition = "WK1", type = "UR" },
                { name = "WK", transition = "WK2", type = "UR", altitude_min = 4150, altitude_max = 6120, speed = 220.0 },
                { name = "WK", transition = "WK2", type = "UR" },
                { name = "CI26V", transition = "WK2", type = "UR" },
                { name = "CI26V", transition = "", type = "UR" },
                { name = "FI26V", transition = "", type = "UR" },
                { name = "RW26", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2180 },
                { name = "WK", transition = "", type = "UR", altitude_min = 2840, speed = 220.0 },
            }
        },
        ["I26-W"] = {
            name = "I26-W",
            type = "I",
            runway = "I26-W",
            waypoints = {
                { name = "MG088", transition = "", type = "UR", speed = 225.0 },
                { name = "MG270", transition = "", type = "UR" },
                { name = "RW26", transition = "", type = "UR" },
                { name = "MG126", transition = "", type = "UR", altitude_min = 2510, speed = 240.0 },
                { name = "MG267", transition = "", type = "UR", speed = 240.0 },
                { name = "MG268", transition = "", type = "UR", altitude_min = 3010, speed = 240.0 },
                { name = "MG263", transition = "", type = "UR" },
                { name = "MG088", transition = "", type = "UR", speed = 225.0 },
            }
        },
        ["J08"] = {
            name = "J08",
            type = "J",
            runway = "J08",
            waypoints = {
                { name = "MG126", transition = "", type = "UR", speed = 225.0 },
                { name = "MG090", transition = "", type = "UR" },
                { name = "RW08", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2510, speed = 240.0 },
                { name = "MG088", transition = "", type = "UR", altitude_min = 2510, speed = 240.0 },
                { name = "MG108", transition = "", type = "UR", altitude_min = 3000, speed = 240.0 },
                { name = "MG083", transition = "", type = "UR", altitude_min = 3000, speed = 240.0 },
                { name = "MG126", transition = "", type = "UR", speed = 225.0 },
            }
        },
        ["J26"] = {
            name = "J26",
            type = "J",
            runway = "J26",
            waypoints = {
                { name = "MG088", transition = "", type = "UR", speed = 225.0 },
                { name = "MG270", transition = "", type = "UR" },
                { name = "RW26", transition = "", type = "UR" },
                { name = "MG126", transition = "", type = "UR", altitude_min = 2510, speed = 240.0 },
                { name = "MG267", transition = "", type = "UR", speed = 240.0 },
                { name = "MG268", transition = "", type = "UR", altitude_min = 3010, speed = 240.0 },
                { name = "MG263", transition = "", type = "UR" },
                { name = "MG088", transition = "", type = "UR", speed = 225.0 },
            }
        },
        ["N08-V"] = {
            name = "N08-V",
            type = "A",
            runway = "N08-V",
            waypoints = {
                { name = "WK", transition = "WK1", type = "UR", altitude_min = 4150, altitude_max = 6120, speed = 245.0 },
                { name = "WK", transition = "WK1", type = "UR" },
                { name = "FN08V", transition = "WK1", type = "UR" },
                { name = "WK", transition = "WK2", type = "UR", altitude_min = 4150, altitude_max = 6120, speed = 245.0 },
                { name = "WK", transition = "WK2", type = "UR" },
                { name = "FN08V", transition = "WK2", type = "UR" },
                { name = "FN08V", transition = "", type = "UR" },
                { name = "RW08", transition = "", type = "UR" },
                { name = "WK", transition = "", type = "UR" },
                { name = "WK", transition = "", type = "UR", altitude_min = 2180, speed = 245.0 },
                { name = "WK", transition = "", type = "UR", altitude_min = 2840, speed = 245.0 },
            }
        },
        ["N08-W"] = {
            name = "N08-W",
            type = "A",
            runway = "N08-W",
            waypoints = {
                { name = "WK", transition = "WK1", type = "UR", speed = 245.0 },
                { name = "WK", transition = "WK1", type = "UR", altitude_min = 2840 },
                { name = "FN08W", transition = "WK1", type = "UR" },
                { name = "WK", transition = "WK2", type = "UR", speed = 245.0 },
                { name = "WK", transition = "WK2", type = "UR", altitude_min = 2840 },
                { name = "FN08W", transition = "WK2", type = "UR" },
                { name = "FN08W", transition = "", type = "UR" },
                { name = "RW08", transition = "", type = "UR" },
                { name = "WK", transition = "", type = "UR" },
                { name = "WK", transition = "", type = "UR", altitude_min = 2670, speed = 245.0 },
                { name = "WK", transition = "", type = "UR", altitude_min = 2840, speed = 245.0 },
            }
        },
        ["N26-V"] = {
            name = "N26-V",
            type = "A",
            runway = "N26-V",
            waypoints = {
                { name = "WK", transition = "WK1", type = "UR", altitude_min = 4150, altitude_max = 6120, speed = 220.0 },
                { name = "WK", transition = "WK1", type = "UR" },
                { name = "FN26V", transition = "WK1", type = "UR" },
                { name = "WK", transition = "WK2", type = "UR", altitude_min = 4150, altitude_max = 6120, speed = 220.0 },
                { name = "WK", transition = "WK2", type = "UR" },
                { name = "FN26V", transition = "WK2", type = "UR" },
                { name = "FN26V", transition = "", type = "UR" },
                { name = "WK", transition = "", type = "UR" },
                { name = "WK", transition = "", type = "UR", altitude_min = 2180, speed = 220.0 },
                { name = "WK", transition = "", type = "UR", altitude_min = 2840, speed = 220.0 },
            }
        },
        ["N26-W"] = {
            name = "N26-W",
            type = "A",
            runway = "N26-W",
            waypoints = {
                { name = "WK", transition = "WK1", type = "UR", speed = 220.0 },
                { name = "WK", transition = "WK1", type = "UR", altitude_min = 2840 },
                { name = "FN26W", transition = "WK1", type = "UR" },
                { name = "WK", transition = "WK2", type = "UR", speed = 220.0 },
                { name = "WK", transition = "WK2", type = "UR", altitude_min = 2840 },
                { name = "FN26W", transition = "WK2", type = "UR" },
                { name = "FN26W", transition = "", type = "UR" },
                { name = "WK", transition = "", type = "UR" },
                { name = "WK", transition = "", type = "UR", altitude_min = 2180, speed = 220.0 },
                { name = "WK", transition = "", type = "UR", altitude_min = 2840, speed = 220.0 },
            }
        },
        ["R08"] = {
            name = "R08",
            type = "R",
            runway = "R08",
            waypoints = {
                { name = "MG126", transition = "", type = "UR", altitude_min = 2670, speed = 225.0 },
                { name = "MG089", transition = "", type = "UR" },
                { name = "RW08", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2510 },
                { name = "MG088", transition = "", type = "UR", altitude_min = 2510, speed = 240.0 },
                { name = "MG108", transition = "", type = "UR", altitude_min = 3000, speed = 240.0 },
                { name = "MG083", transition = "", type = "UR", altitude_min = 3000, speed = 240.0 },
                { name = "MG126", transition = "", type = "UR", speed = 225.0 },
            }
        },
        ["R26"] = {
            name = "R26",
            type = "R",
            runway = "R26",
            waypoints = {
                { name = "MG088", transition = "", type = "UR", altitude_min = 2510, speed = 225.0 },
                { name = "MG269", transition = "", type = "UR" },
                { name = "21THR", transition = "", type = "UR", altitude_min = 1200 },
                { name = "RW26", transition = "", type = "UR" },
                { name = "MG126", transition = "", type = "UR", altitude_min = 2510, speed = 240.0 },
                { name = "MG267", transition = "", type = "UR", speed = 240.0 },
                { name = "MG268", transition = "", type = "UR", altitude_min = 3010, speed = 240.0 },
                { name = "MG263", transition = "", type = "UR" },
                { name = "MG088", transition = "", type = "UR", speed = 225.0 },
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
