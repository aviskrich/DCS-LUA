local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OOSA",
        Name = "OOSA Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["SA420"] = { lat = 59.840413889, lon = 17.921994444, type = "ENRT" },
        ["SA400"] = { lat = 17.022027778, lon = 54.032944444, type = "OOSA" },
        ["D070W"] = { lat = 17.174777778, lon = 54.494402778, type = "OOSA" },
        ["SA05W"] = { lat = 17.007305556, lon = 53.989111111, type = "OOSA" },
        ["CF25"] = { lat = 62.590358333, lon = 114.218994444, type = "UERR" },
        ["SA416"] = { lat = 59.712055556, lon = 18.411222222, type = "ESSA" },
        ["SA404"] = { lat = 59.66995, lon = 17.966547222, type = "ENRT" },
        ["SA412"] = { lat = 59.6705, lon = 18.031222222, type = "ESSA" },
        ["MD07"] = { lat = 35.610688889, lon = -0.660633333, type = "DAOO" },
        ["SLL53"] = { lat = 17.569747222, lon = 54.863852778, type = "OOSA" },
        ["72VOR"] = { lat = 43.641875, lon = 3.834569444, type = "LFMT" },
        ["D242W"] = { lat = 16.874769444, lon = 53.759638889, type = "OOSA" },
        ["FD25"] = { lat = 35.073477778, lon = -1.293394444, type = "DAON" },
        ["SL45C"] = { lat = 17.599847222, lon = 54.651313889, type = "OOSA" },
        ["D250U"] = { lat = 16.933972222, lon = 53.771072222, type = "OOSA" },
        ["SA407"] = { lat = 16.834444444, lon = 54.105972222, type = "OOSA" },
        ["KAPOP"] = { lat = 17.762222222, lon = 55.158333333, type = "ENRT" },
        ["SA403"] = { lat = 59.848416667, lon = 17.962083333, type = "ESSA" },
        ["PUTRA"] = { lat = 16.908888889, lon = 52.941944444, type = "ENRT" },
        ["SA500"] = { lat = 59.807388889, lon = 18.304083333, type = "ESSA" },
        ["D114H"] = { lat = 50.366147222, lon = 127.643461111, type = "UHBB" },
        ["SLL63"] = { lat = 17.819444444, lon = 54.866411111, type = "OOSA" },
        ["D250S"] = { lat = 38.233686111, lon = 48.049741667, type = "OITL" },
        ["SL45B"] = { lat = 16.718488889, lon = 53.413427778, type = "OOSA" },
        ["SL45E"] = { lat = 16.995791667, lon = 54.89655, type = "OOSA" },
        ["D262W"] = { lat = 17.002525, lon = 53.718780556, type = "OOSA" },
        ["SL45A"] = { lat = 16.956563889, lon = 53.339186111, type = "OOSA" },
        ["D250P"] = { lat = 33.737883333, lon = 35.177105556, type = "OLBA" },
        ["PAVEM"] = { lat = 16.7175, lon = 54.234527778, type = "OOSA" },
        ["KAPET"] = { lat = 16.556111111, lon = 53.103888889, type = "ENRT" },
        ["D110M"] = { lat = 41.0643, lon = 1.428616667, type = "LERS" },
        ["SA602"] = { lat = 59.623555556, lon = 18.236722222, type = "ENRT" },
        ["CD07"] = { lat = 35.570188889, lon = -0.777227778, type = "DAOO" },
        ["D085H"] = { lat = 17.059111111, lon = 54.254666667, type = "OOSA" },
        ["SILTA"] = { lat = 16.537472222, lon = 54.298666667, type = "OOSA" },
        ["D053W"] = { lat = 17.275794444, lon = 54.439922222, type = "OOSA" },
        ["SA402"] = { lat = 59.752833333, lon = 18.1495, type = "ESSA" },
        ["ML07"] = { lat = 35.751527778, lon = 10.72775, type = "DTMB" },
        ["ASTUN"] = { lat = 18.142222222, lon = 55.177777778, type = "ENRT" },
        ["SA09E"] = { lat = 17.098361111, lon = 54.260888889, type = "OOSA" },
        ["RW25"] = { lat = 13.445891667, lon = -89.041872222, type = "MSLP" },
        ["SA501"] = { lat = 59.808833333, lon = 17.936055556, type = "ESSA" },
        ["D095W"] = { lat = 17.0092, lon = 54.513672222, type = "OOSA" },
        ["D125U"] = { lat = 16.843041667, lon = 54.411061111, type = "OOSA" },
        ["D244U"] = { lat = 16.901030556, lon = 53.784980556, type = "OOSA" },
        ["D175H"] = { lat = 16.916269444, lon = 54.125525, type = "OOSA" },
        ["42LOC"] = { lat = 24.330930556, lon = 9.39295, type = "DAAJ" },
        ["SA415"] = { lat = 59.767472222, lon = 18.037166667, type = "ESSA" },
        ["SL27A"] = { lat = 17.158616667, lon = 54.57185, type = "OOSA" },
        ["FF07"] = { lat = 28.008666667, lon = -16.675277778, type = "GCTS" },
        ["SA421"] = { lat = 59.674166667, lon = 17.926583333, type = "ENRT" },
        ["40VO2"] = { lat = 36.898375, lon = 7.827583333, type = "DABB" },
        ["SA10W"] = { lat = 16.979777778, lon = 53.907166667, type = "OOSA" },
        ["D243K"] = { lat = 33.325425, lon = 120.018358333, type = "ZSYN" },
        ["D075Q"] = { lat = 40.231372222, lon = 95.203958333, type = "ZLDH" },
        ["D070U"] = { lat = 53.605494444, lon = 50.730913889, type = "UWWW" },
        ["D070R"] = { lat = 35.295869444, lon = 26.460763889, type = "LGST" },
        ["FI25"] = { lat = 35.050741667, lon = -1.332297222, type = "DAON" },
        ["D111M"] = { lat = -2.050116667, lon = 30.348216667, type = "HRYR" },
        ["D042W"] = { lat = 17.331127778, lon = 54.389119444, type = "OOSA" },
        ["SLL"] = { lat = -34.228333333, lon = 150.988333333, type = "ENRT" },
        ["SL43C"] = { lat = 17.246886111, lon = 54.835663889, type = "OOSA" },
        ["D126H"] = { lat = 29.021325, lon = 110.533180556, type = "ZGDY" },
        ["DAXAM"] = { lat = 17.27, lon = 54.7875, type = "ENRT" },
        ["SA603"] = { lat = 16.793861111, lon = 53.956166667, type = "OOSA" },
        ["SA601"] = { lat = 17.179805556, lon = 54.508055556, type = "OOSA" },
        ["KIVEL"] = { lat = 16.885, lon = 55.609166667, type = "ENRT" },
        ["SLL70"] = { lat = 16.923772222, lon = 55.326125, type = "OOSA" },
        ["SA18E"] = { lat = 17.145083333, lon = 54.400833333, type = "OOSA" },
        ["SL45D"] = { lat = 17.49145, lon = 54.750672222, type = "OOSA" },
        ["RW07"] = { lat = 13.435988889, lon = -89.069633333, type = "MSLP" },
        ["D081U"] = { lat = 17.098408333, lon = 54.477694444, type = "OOSA" },
        ["D070A"] = { lat = 17.057447222, lon = 54.138852778, type = "OOSA" },
        ["40LO2"] = { lat = 15.511969444, lon = 32.553905556, type = "HSSK" },
        ["D070J"] = { lat = 54.481388889, lon = 30.607222222, type = "UMIO" },
        ["MUTVA"] = { lat = 16.890277778, lon = 54.533611111, type = "ENRT" },
        ["SA417"] = { lat = 60.027722222, lon = 18.097, type = "ESSA" },
        ["SA401"] = { lat = 59.734888889, lon = 17.948611111, type = "ESSA" },
        ["D250F"] = { lat = 17.017108333, lon = 54.017147222, type = "OOSA" },
        ["D243N"] = { lat = 36.613141667, lon = 66.952083333, type = "OAMS" },
        ["FD07"] = { lat = 35.579997222, lon = -0.749030556, type = "DAOO" },
        ["D235O"] = { lat = 36.273688889, lon = 27.797327778, type = "LGRP" },
        ["SA502"] = { lat = 59.796583333, lon = 18.148833333, type = "ESSA" },
        ["D152O"] = { lat = -26.329325, lon = 28.433125, type = "FAOR" },
        ["SA405"] = { lat = 59.704638889, lon = 18.158844444, type = "ENRT" },
        ["SA14W"] = { lat = 16.957111111, lon = 53.839888889, type = "OOSA" },
        ["SA408"] = { lat = 59.800722222, lon = 18.014638889, type = "ESSA" },
        ["FF25"] = { lat = 28.084472222, lon = -16.457444444, type = "GCTS" },
        ["SL43A"] = { lat = 16.767491667, lon = 53.428255556, type = "OOSA" },
        ["SL43B"] = { lat = 17.318188889, lon = 54.810411111, type = "OOSA" },
        ["SA422"] = { lat = 59.751805556, lon = 18.434111111, type = "ESSA" },
        ["LADAR"] = { lat = 16.89, lon = 53.781944444, type = "ENRT" },
        ["SA600"] = { lat = 16.981361111, lon = 54.459305556, type = "OOSA" },
        ["D099Y"] = { lat = 57.657433333, lon = -2.557602778, type = "EGQS" },
        ["SA406"] = { lat = 59.724155556, lon = 18.417025, type = "ENRT" },
        ["SA411"] = { lat = 59.681619444, lon = 18.428883333, type = "ENRT" },
        ["CF07"] = { lat = 42.519730556, lon = 76.387911111, type = "UCFL" },
    },

    -- Данные ВПП
    Runways = {
        ["RW07"] = {
            heading = 70,
            length = 120.0,
            width = 0,
            threshold = { lat = 17.034366666666667, lon = 54.06973611111111 },
            end = { lat = 17.04112137480263, lon = 54.08914604835309 }
        },
        ["RW25"] = {
            heading = 250,
            length = -120.0,
            width = 0,
            threshold = { lat = 17.046258333333334, lon = 54.10518888888889 },
            end = { lat = 17.053013041469296, lon = 54.124600060908634 }
        },
    },

    -- Процедуры SID
    SID = {
        ["DAXA1P"] = {
            name = "DAXA1P",
            runway = "RW07",
            waypoints = {
                { name = "D070A", type = "P" },
                { name = "D070J", type = "P", altitude_min = 3200 },
                { name = "DAXAM", type = "E" },
            }
        },
        ["DAXA1Q"] = {
            name = "DAXA1Q",
            runway = "RW07",
            waypoints = {
                { name = "SA404", type = "P", altitude_min = 3200 },
                { name = "DAXAM", type = "E" },
            }
        },
        ["DAXA1R"] = {
            name = "DAXA1R",
            runway = "RW25",
            waypoints = {
                { name = "D250F", type = "P", speed = 220.0 },
                { name = "", type = "" },
                { name = "D085H", type = "P" },
                { name = "DAXAM", type = "E" },
            }
        },
        ["DAXA1S"] = {
            name = "DAXA1S",
            runway = "RW25",
            waypoints = {
                { name = "SA400", type = "P", speed = 220.0 },
                { name = "SA401", type = "P" },
                { name = "SA402", type = "P", altitude_min = 11000 },
                { name = "DAXAM", type = "E", altitude_min = 15000 },
            }
        },
        ["DAXA1T"] = {
            name = "DAXA1T",
            runway = "RW07",
            waypoints = {
                { name = "D070A", type = "P", speed = 210.0 },
                { name = "D099Y", type = "P" },
                { name = "", type = "" },
                { name = "SL27A", type = "P" },
                { name = "DAXAM", type = "E" },
            }
        },
        ["DAXA1U"] = {
            name = "DAXA1U",
            runway = "RW07",
            waypoints = {
                { name = "SA403", type = "P", speed = 210.0 },
                { name = "SA405", type = "P" },
                { name = "DAXAM", type = "E" },
            }
        },
        ["DAXA1V"] = {
            name = "DAXA1V",
            runway = "RW25",
            waypoints = {
                { name = "D250F", type = "P", speed = 220.0 },
                { name = "", type = "" },
                { name = "D114H", type = "P" },
                { name = "D099Y", type = "P" },
                { name = "", type = "" },
                { name = "SL27A", type = "P" },
                { name = "DAXAM", type = "E" },
            }
        },
        ["LADA1P"] = {
            name = "LADA1P",
            runway = "RW07",
            waypoints = {
                { name = "D070A", type = "P", speed = 210.0 },
                { name = "D111M", type = "P" },
                { name = "", type = "" },
                { name = "D235O", type = "P" },
                { name = "LADAR", type = "E" },
            }
        },
        ["LADA1Q"] = {
            name = "LADA1Q",
            runway = "RW07",
            waypoints = {
                { name = "SA403", type = "P", speed = 210.0 },
                { name = "SA406", type = "P", speed = 230.0 },
                { name = "SA407", type = "P" },
                { name = "SA408", type = "P", altitude_min = 9000 },
                { name = "LADAR", type = "E" },
            }
        },
        ["LADA1R"] = {
            name = "LADA1R",
            runway = "RW25",
            waypoints = {
                { name = "D250F", type = "P", speed = 220.0 },
                { name = "D243K", type = "P", altitude_min = 3000 },
                { name = "D243N", type = "P", altitude_min = 4500 },
                { name = "LADAR", type = "E" },
            }
        },
        ["LADA1S"] = {
            name = "LADA1S",
            runway = "RW25",
            waypoints = {
                { name = "SA400", type = "P", speed = 220.0 },
                { name = "SA411", type = "P", altitude_min = 3000 },
                { name = "SA412", type = "P", altitude_min = 4500 },
                { name = "LADAR", type = "E" },
            }
        },
        ["MUTV1P"] = {
            name = "MUTV1P",
            runway = "RW07",
            waypoints = {
                { name = "D070A", type = "P", speed = 210.0 },
                { name = "MUTVA", type = "E" },
            }
        },
        ["MUTV1Q"] = {
            name = "MUTV1Q",
            runway = "RW07",
            waypoints = {
                { name = "SA403", type = "P", speed = 210.0 },
                { name = "MUTVA", type = "E" },
            }
        },
        ["MUTV1R"] = {
            name = "MUTV1R",
            runway = "RW25",
            waypoints = {
                { name = "D250F", type = "P", speed = 220.0 },
                { name = "", type = "" },
                { name = "D126H", type = "P" },
                { name = "MUTVA", type = "E" },
            }
        },
        ["MUTV1S"] = {
            name = "MUTV1S",
            runway = "RW25",
            waypoints = {
                { name = "SA400", type = "P", speed = 220.0 },
                { name = "SA401", type = "P" },
                { name = "MUTVA", type = "E" },
            }
        },
        ["SILT1P"] = {
            name = "SILT1P",
            runway = "RW07",
            waypoints = {
                { name = "D070A", type = "P", speed = 210.0 },
                { name = "D111M", type = "P" },
                { name = "", type = "" },
                { name = "D152O", type = "P" },
                { name = "SILTA", type = "P" },
            }
        },
        ["SILT1Q"] = {
            name = "SILT1Q",
            runway = "RW07",
            waypoints = {
                { name = "SA403", type = "P", speed = 210.0 },
                { name = "SA406", type = "P" },
                { name = "SILTA", type = "P" },
            }
        },
        ["SILT1R"] = {
            name = "SILT1R",
            runway = "RW25",
            waypoints = {
                { name = "D250F", type = "P", speed = 220.0 },
                { name = "", type = "" },
                { name = "D175H", type = "P" },
                { name = "SILTA", type = "P" },
            }
        },
        ["SILT1S"] = {
            name = "SILT1S",
            runway = "RW25",
            waypoints = {
                { name = "SA400", type = "P", speed = 220.0 },
                { name = "SA401", type = "P" },
                { name = "SILTA", type = "P" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ASTU1E"] = {
            name = "ASTU1E",
            runway = "RW07",
            waypoints = {
                { name = "ASTUN", type = "OO" },
                { name = "SLL63", type = "OO" },
                { name = "D042W", type = "OO" },
                { name = "", type = "" },
                { name = "D125U", type = "OO" },
                { name = "PAVEM", type = "OO" },
            }
        },
        ["ASTU1F"] = {
            name = "ASTU1F",
            runway = "RW07",
            waypoints = {
                { name = "ASTUN", type = "OO" },
                { name = "DAXAM", type = "OO", altitude_min = 13000 },
                { name = "SA415", type = "OO", altitude_min = 13000 },
                { name = "SA417", type = "OO", altitude_min = 13000 },
                { name = "PAVEM", type = "OO", altitude_min = 11000 },
            }
        },
        ["ASTU1G"] = {
            name = "ASTU1G",
            runway = "RW25",
            waypoints = {
                { name = "ASTUN", type = "OO" },
                { name = "SLL63", type = "OO" },
                { name = "SL45C", type = "OO" },
                { name = "", type = "" },
                { name = "SL43B", type = "OO" },
                { name = "DAXAM", type = "OO" },
            }
        },
        ["ASTU1H"] = {
            name = "ASTU1H",
            runway = "RW25",
            waypoints = {
                { name = "ASTUN", type = "OO" },
                { name = "SA420", type = "OO", altitude_max = 14000 },
                { name = "DAXAM", type = "OO", altitude_min = 8000 },
            }
        },
        ["DAXA1E"] = {
            name = "DAXA1E",
            runway = "RW07",
            waypoints = {
                { name = "DAXAM", type = "OO" },
                { name = "D070W", type = "OO" },
                { name = "", type = "" },
                { name = "D125U", type = "OO" },
                { name = "PAVEM", type = "OO" },
            }
        },
        ["DAXA1F"] = {
            name = "DAXA1F",
            runway = "RW07",
            waypoints = {
                { name = "DAXAM", type = "OO" },
                { name = "SA415", type = "OO", altitude_min = 13000 },
                { name = "SA417", type = "OO", altitude_min = 13000 },
                { name = "PAVEM", type = "OO", altitude_min = 11000 },
            }
        },
        ["KAPE1E"] = {
            name = "KAPE1E",
            runway = "RW07",
            waypoints = {
                { name = "KAPET", type = "OO" },
                { name = "SL45B", type = "OO" },
                { name = "LADAR", type = "OO" },
            }
        },
        ["KAPE1F"] = {
            name = "KAPE1F",
            runway = "RW07",
            waypoints = {
                { name = "KAPET", type = "OO" },
                { name = "LADAR", type = "OO", altitude_min = 5000 },
            }
        },
        ["KAPE1G"] = {
            name = "KAPE1G",
            runway = "RW25",
            waypoints = {
                { name = "KAPET", type = "OO" },
                { name = "D242W", type = "OO" },
                { name = "", type = "" },
                { name = "PAVEM", type = "OO" },
            }
        },
        ["KAPE1H"] = {
            name = "KAPE1H",
            runway = "RW25",
            waypoints = {
                { name = "KAPET", type = "OO" },
                { name = "LADAR", type = "OO", altitude_min = 11000 },
                { name = "PAVEM", type = "OO", altitude_min = 11000 },
            }
        },
        ["KAPO1E"] = {
            name = "KAPO1E",
            runway = "RW07",
            waypoints = {
                { name = "KAPOP", type = "OO" },
                { name = "SLL53", type = "OO" },
                { name = "D053W", type = "OO" },
                { name = "", type = "" },
                { name = "D125U", type = "OO" },
                { name = "PAVEM", type = "OO" },
            }
        },
        ["KAPO1F"] = {
            name = "KAPO1F",
            runway = "RW07",
            waypoints = {
                { name = "KAPOP", type = "OO" },
                { name = "DAXAM", type = "OO", altitude_min = 13000 },
                { name = "SA415", type = "OO", altitude_min = 13000 },
                { name = "SA417", type = "OO", altitude_min = 13000 },
                { name = "PAVEM", type = "OO", altitude_min = 11000 },
            }
        },
        ["KAPO1G"] = {
            name = "KAPO1G",
            runway = "RW25",
            waypoints = {
                { name = "KAPOP", type = "OO" },
                { name = "SLL53", type = "OO" },
                { name = "SL45D", type = "OO" },
                { name = "", type = "" },
                { name = "SL43B", type = "OO" },
                { name = "DAXAM", type = "OO" },
            }
        },
        ["KAPO1H"] = {
            name = "KAPO1H",
            runway = "RW25",
            waypoints = {
                { name = "KAPOP", type = "OO" },
                { name = "SA421", type = "OO", altitude_max = 14000 },
                { name = "DAXAM", type = "OO", altitude_min = 8000 },
            }
        },
        ["KIVE1E"] = {
            name = "KIVE1E",
            runway = "RW07",
            waypoints = {
                { name = "KIVEL", type = "OO" },
                { name = "D095W", type = "OO" },
                { name = "", type = "" },
                { name = "D125U", type = "OO" },
                { name = "PAVEM", type = "OO" },
            }
        },
        ["KIVE1F"] = {
            name = "KIVE1F",
            runway = "RW07",
            waypoints = {
                { name = "KIVEL", type = "OO" },
                { name = "SA415", type = "OO", altitude_min = 13000 },
                { name = "SA417", type = "OO", altitude_min = 13000 },
                { name = "PAVEM", type = "OO", altitude_min = 11000 },
            }
        },
        ["KIVE1G"] = {
            name = "KIVE1G",
            runway = "RW25",
            waypoints = {
                { name = "KIVEL", type = "OO" },
                { name = "SLL70", type = "OO" },
                { name = "SL45E", type = "OO" },
                { name = "", type = "" },
                { name = "SL43C", type = "OO" },
                { name = "DAXAM", type = "OO" },
            }
        },
        ["KIVE1H"] = {
            name = "KIVE1H",
            runway = "RW25",
            waypoints = {
                { name = "KIVEL", type = "OO" },
                { name = "SA422", type = "OO", altitude_max = 14000 },
                { name = "DAXAM", type = "OO", altitude_min = 8000 },
            }
        },
        ["PUTR1E"] = {
            name = "PUTR1E",
            runway = "RW07",
            waypoints = {
                { name = "PUTRA", type = "OO", altitude_min = 11000 },
                { name = "SL45A", type = "OO" },
                { name = "", type = "" },
                { name = "SL43A", type = "OO" },
                { name = "LADAR", type = "OO" },
            }
        },
        ["PUTR1F"] = {
            name = "PUTR1F",
            runway = "RW07",
            waypoints = {
                { name = "PUTRA", type = "OO" },
                { name = "SA416", type = "OO", altitude_min = 8000 },
                { name = "LADAR", type = "OO", altitude_min = 5000 },
            }
        },
        ["PUTR1G"] = {
            name = "PUTR1G",
            runway = "RW25",
            waypoints = {
                { name = "PUTRA", type = "OO" },
                { name = "D262W", type = "OO" },
                { name = "", type = "" },
                { name = "PAVEM", type = "OO" },
            }
        },
        ["PUTR1H"] = {
            name = "PUTR1H",
            runway = "RW25",
            waypoints = {
                { name = "PUTRA", type = "OO" },
                { name = "LADAR", type = "OO", altitude_min = 11000 },
                { name = "PAVEM", type = "OO", altitude_min = 11000 },
            }
        },
        ["SILT1E"] = {
            name = "SILT1E",
            runway = "RW07",
            waypoints = {
                { name = "SILTA", type = "OO" },
                { name = "PAVEM", type = "OO" },
            }
        },
        ["SILT1F"] = {
            name = "SILT1F",
            runway = "RW07",
            waypoints = {
                { name = "SILTA", type = "OO" },
                { name = "PAVEM", type = "OO", altitude_min = 11000 },
            }
        },
        ["SILT1G"] = {
            name = "SILT1G",
            runway = "RW25",
            waypoints = {
                { name = "SILTA", type = "OO" },
                { name = "PAVEM", type = "OO" },
            }
        },
        ["SILT1H"] = {
            name = "SILT1H",
            runway = "RW25",
            waypoints = {
                { name = "SILTA", type = "OO" },
                { name = "PAVEM", type = "OO", altitude_min = 11000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D07"] = {
            name = "D07",
            type = "A",
            runway = "D07",
            waypoints = {
                { name = "LADAR", transition = "LADAR", type = "OO", altitude_min = 5000, altitude_max = 6000 },
                { name = "D250S", transition = "LADAR", type = "OO", altitude_min = 4700 },
                { name = "CD07", transition = "LADAR", type = "OO", altitude_min = 4400 },
                { name = "PAVEM", transition = "PAVEM", type = "OO", altitude_min = 11000, altitude_max = 13000 },
                { name = "D244U", transition = "PAVEM", type = "OO" },
                { name = "D250S", transition = "PAVEM", type = "OO", altitude_min = 4700 },
                { name = "CD07", transition = "PAVEM", type = "OO", altitude_min = 4400 },
                { name = "SLL", transition = "SLL", type = "OO", altitude_min = 6000, speed = 210.0 },
                { name = "SLL", transition = "SLL", type = "OO" },
                { name = "D250S", transition = "SLL", type = "OO", altitude_min = 4700 },
                { name = "CD07", transition = "SLL", type = "OO", altitude_min = 4400 },
                { name = "CD07", transition = "", type = "OO", altitude_min = 4400 },
                { name = "FD07", transition = "", type = "OO", altitude_min = 3700 },
                { name = "72VOR", transition = "", type = "OO", altitude_min = 1700 },
                { name = "MD07", transition = "", type = "OO" },
                { name = "SLL", transition = "", type = "OO", altitude_min = 487 },
                { name = "", transition = "", type = "" },
                { name = "", transition = "", type = "", speed = 210.0 },
                { name = "SLL", transition = "", type = "OO" },
                { name = "", transition = "", type = "" },
                { name = "D152O", transition = "", type = "OO" },
                { name = "SLL", transition = "", type = "OO", altitude_min = 6000 },
                { name = "SLL", transition = "", type = "OO" },
            }
        },
        ["D25"] = {
            name = "D25",
            type = "A",
            runway = "D25",
            waypoints = {
                { name = "DAXAM", transition = "DAXAM", type = "OO", altitude_min = 8000, altitude_max = 10000 },
                { name = "", transition = "DAXAM", type = "", altitude_min = 6500 },
                { name = "", transition = "DAXAM", type = "" },
                { name = "D075Q", transition = "DAXAM", type = "OO", altitude_min = 4800 },
                { name = "FD25", transition = "DAXAM", type = "OO", altitude_min = 3200 },
                { name = "PAVEM", transition = "PAVEM", type = "OO", altitude_min = 11000, altitude_max = 13000 },
                { name = "D081U", transition = "PAVEM", type = "OO" },
                { name = "D075Q", transition = "PAVEM", type = "OO", altitude_min = 4800 },
                { name = "FD25", transition = "PAVEM", type = "OO", altitude_min = 3200 },
                { name = "SLL", transition = "SLL", type = "OO", altitude_min = 6000, speed = 230.0 },
                { name = "SLL", transition = "SLL", type = "OO", altitude_min = 3600 },
                { name = "FD25", transition = "SLL", type = "OO", altitude_min = 3200 },
                { name = "FD25", transition = "", type = "OO", altitude_min = 3200 },
                { name = "40VO2", transition = "", type = "OO", altitude_min = 1730 },
                { name = "SLL", transition = "", type = "OO" },
                { name = "", transition = "", type = "", altitude_min = 480 },
                { name = "", transition = "", type = "", speed = 220.0 },
                { name = "SLL", transition = "", type = "OO", altitude_min = 3000 },
                { name = "SLL", transition = "", type = "OO", altitude_min = 6000 },
                { name = "SLL", transition = "", type = "OO" },
            }
        },
        ["I07"] = {
            name = "I07",
            type = "A",
            runway = "I07",
            waypoints = {
                { name = "LADAR", transition = "LADAR", type = "OO", altitude_min = 5000, altitude_max = 6000 },
                { name = "D250P", transition = "LADAR", type = "OO", altitude_min = 4700 },
                { name = "CF07", transition = "LADAR", type = "OO", altitude_min = 4100 },
                { name = "PAVEM", transition = "PAVEM", type = "OO", altitude_min = 11000, altitude_max = 13000 },
                { name = "D250U", transition = "PAVEM", type = "OO" },
                { name = "D250P", transition = "PAVEM", type = "OO", altitude_min = 4700 },
                { name = "CF07", transition = "PAVEM", type = "OO", altitude_min = 4100 },
                { name = "SLL", transition = "SLL", type = "OO", altitude_min = 6000 },
                { name = "SLL", transition = "SLL", type = "OO", speed = 210.0 },
                { name = "D250P", transition = "SLL", type = "OO", altitude_min = 4700 },
                { name = "CF07", transition = "SLL", type = "OO", altitude_min = 4100 },
                { name = "CF07", transition = "", type = "OO" },
                { name = "FF07", transition = "", type = "OO" },
                { name = "RW07", transition = "", type = "OO" },
                { name = "SLL", transition = "", type = "OO" },
                { name = "SLL", transition = "", type = "OO" },
                { name = "", transition = "", type = "", speed = 210.0 },
                { name = "D110M", transition = "", type = "OO" },
                { name = "", transition = "", type = "" },
                { name = "D152O", transition = "", type = "OO" },
                { name = "SLL", transition = "", type = "OO", altitude_min = 6000 },
                { name = "SLL", transition = "", type = "OO", altitude_min = 6000 },
            }
        },
        ["I25"] = {
            name = "I25",
            type = "A",
            runway = "I25",
            waypoints = {
                { name = "DAXAM", transition = "DAXAM", type = "OO", altitude_min = 8000, altitude_max = 10000 },
                { name = "", transition = "DAXAM", type = "", altitude_min = 6500 },
                { name = "D070R", transition = "DAXAM", type = "OO", altitude_min = 4800 },
                { name = "CF25", transition = "DAXAM", type = "OO", altitude_min = 3200 },
                { name = "PAVEM", transition = "PAVEM", type = "OO", altitude_min = 11000, altitude_max = 13000 },
                { name = "D070U", transition = "PAVEM", type = "OO" },
                { name = "D070R", transition = "PAVEM", type = "OO", altitude_min = 4800 },
                { name = "CF25", transition = "PAVEM", type = "OO", altitude_min = 3200 },
                { name = "SLL", transition = "SLL", type = "OO", altitude_min = 6000, speed = 230.0 },
                { name = "SLL", transition = "SLL", type = "OO", altitude_min = 3600 },
                { name = "CF25", transition = "SLL", type = "OO", altitude_min = 3200 },
                { name = "CF25", transition = "", type = "OO" },
                { name = "FI25", transition = "", type = "OO" },
                { name = "RW25", transition = "", type = "OO" },
                { name = "", transition = "", type = "" },
                { name = "", transition = "", type = "", speed = 220.0 },
                { name = "SLL", transition = "", type = "OO", altitude_min = 3000 },
                { name = "SLL", transition = "", type = "OO", altitude_min = 6000 },
                { name = "SLL", transition = "", type = "OO", altitude_min = 6000 },
            }
        },
        ["L07"] = {
            name = "L07",
            type = "A",
            runway = "L07",
            waypoints = {
                { name = "LADAR", transition = "LADAR", type = "OO", altitude_min = 5000, altitude_max = 6000 },
                { name = "D250P", transition = "LADAR", type = "OO", altitude_min = 4700 },
                { name = "CF07", transition = "LADAR", type = "OO", altitude_min = 4100 },
                { name = "PAVEM", transition = "PAVEM", type = "OO", altitude_min = 11000, altitude_max = 13000 },
                { name = "D250U", transition = "PAVEM", type = "OO" },
                { name = "D250P", transition = "PAVEM", type = "OO", altitude_min = 4700 },
                { name = "CF07", transition = "PAVEM", type = "OO", altitude_min = 4100 },
                { name = "SLL", transition = "SLL", type = "OO", altitude_min = 6000, speed = 210.0 },
                { name = "SLL", transition = "SLL", type = "OO" },
                { name = "D250P", transition = "SLL", type = "OO", altitude_min = 4700 },
                { name = "CF07", transition = "SLL", type = "OO", altitude_min = 4100 },
                { name = "CF07", transition = "", type = "OO", altitude_min = 4100 },
                { name = "FF07", transition = "", type = "OO", altitude_min = 3400 },
                { name = "42LOC", transition = "", type = "OO", altitude_min = 1450 },
                { name = "ML07", transition = "", type = "OO" },
                { name = "SLL", transition = "", type = "OO" },
                { name = "SLL", transition = "", type = "OO" },
                { name = "", transition = "", type = "", speed = 210.0 },
                { name = "D110M", transition = "", type = "OO" },
                { name = "", transition = "", type = "" },
                { name = "D152O", transition = "", type = "OO" },
                { name = "SLL", transition = "", type = "OO", altitude_min = 6000 },
                { name = "SLL", transition = "", type = "OO", altitude_min = 6000 },
            }
        },
        ["L25"] = {
            name = "L25",
            type = "A",
            runway = "L25",
            waypoints = {
                { name = "DAXAM", transition = "DAXAM", type = "OO", altitude_min = 8000, altitude_max = 10000 },
                { name = "", transition = "DAXAM", type = "", altitude_min = 6500 },
                { name = "D070R", transition = "DAXAM", type = "OO", altitude_min = 4800 },
                { name = "CF25", transition = "DAXAM", type = "OO", altitude_min = 3200 },
                { name = "PAVEM", transition = "PAVEM", type = "OO", altitude_min = 11000, altitude_max = 13000 },
                { name = "D070U", transition = "PAVEM", type = "OO" },
                { name = "D070R", transition = "PAVEM", type = "OO", altitude_min = 4800 },
                { name = "CF25", transition = "PAVEM", type = "OO", altitude_min = 3200 },
                { name = "SLL", transition = "SLL", type = "OO", altitude_min = 6000, speed = 230.0 },
                { name = "SLL", transition = "SLL", type = "OO", altitude_min = 3600 },
                { name = "CF25", transition = "SLL", type = "OO", altitude_min = 3200 },
                { name = "CF25", transition = "", type = "OO", altitude_min = 3200 },
                { name = "FF25", transition = "", type = "OO", altitude_min = 3200 },
                { name = "40LO2", transition = "", type = "OO", altitude_min = 1370 },
                { name = "SLL", transition = "", type = "OO" },
                { name = "", transition = "", type = "" },
                { name = "", transition = "", type = "", speed = 220.0 },
                { name = "SLL", transition = "", type = "OO", altitude_min = 3000 },
                { name = "SLL", transition = "", type = "OO", altitude_min = 6000 },
                { name = "SLL", transition = "", type = "OO", altitude_min = 6000 },
            }
        },
        ["R07"] = {
            name = "R07",
            type = "A",
            runway = "R07",
            waypoints = {
                { name = "LADAR", transition = "LADAR", type = "OO", altitude_min = 5000, altitude_max = 6000 },
                { name = "SA14W", transition = "LADAR", type = "OO", altitude_min = 4000 },
                { name = "PAVEM", transition = "PAVEM", type = "OO", altitude_min = 11000, altitude_max = 13000 },
                { name = "SA500", transition = "PAVEM", type = "OO" },
                { name = "SA14W", transition = "PAVEM", type = "OO", altitude_min = 4000 },
                { name = "SA14W", transition = "", type = "OO", altitude_min = 4000 },
                { name = "SA10W", transition = "", type = "OO", altitude_min = 2800 },
                { name = "SA05W", transition = "", type = "OO", altitude_min = 1700 },
                { name = "RW07", transition = "", type = "OO" },
                { name = "SA501", transition = "", type = "OO", altitude_min = 480 },
                { name = "SA502", transition = "", type = "OO", speed = 210.0 },
                { name = "PAVEM", transition = "", type = "OO", altitude_min = 5000 },
                { name = "PAVEM", transition = "", type = "OO", altitude_min = 5000 },
            }
        },
        ["R25"] = {
            name = "R25",
            type = "A",
            runway = "R25",
            waypoints = {
                { name = "DAXAM", transition = "DAXAM", type = "OO", altitude_min = 8000, altitude_max = 10000 },
                { name = "SA601", transition = "DAXAM", type = "OO", altitude_min = 6500 },
                { name = "SA18E", transition = "DAXAM", type = "OO", altitude_min = 4500 },
                { name = "PAVEM", transition = "PAVEM", type = "OO", altitude_min = 11000, altitude_max = 13000 },
                { name = "SA600", transition = "PAVEM", type = "OO" },
                { name = "SA18E", transition = "PAVEM", type = "OO", altitude_min = 4500 },
                { name = "SA18E", transition = "", type = "OO", altitude_min = 4500 },
                { name = "SA09E", transition = "", type = "OO", altitude_min = 3100 },
                { name = "RW25", transition = "", type = "OO" },
                { name = "SA602", transition = "", type = "OO" },
                { name = "SA603", transition = "", type = "OO", speed = 220.0 },
                { name = "PAVEM", transition = "", type = "OO", altitude_min = 5000 },
                { name = "PAVEM", transition = "", type = "OO", altitude_min = 5000 },
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
