local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OMFJ",
        Name = "OMFJ Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["FJ933"] = { lat = 25.117055556, lon = 56.305388889, type = "OMFJ" },
        ["IMPED"] = { lat = 24.973472222, lon = 56.068388889, type = "ENRT" },
        ["SERSA"] = { lat = 25.329166667, lon = 55.521666667, type = "ENRT" },
        ["FJ929"] = { lat = 25.080916667, lon = 56.407194444, type = "OMFJ" },
        ["GIDIS"] = { lat = 24.6, lon = 55.933333333, type = "ENRT" },
        ["NOLSU"] = { lat = 25.213333333, lon = 56.127166667, type = "ENRT" },
        ["TONVO"] = { lat = 25.083333333, lon = 56.533333333, type = "ENRT" },
        ["KARER"] = { lat = 24.894444444, lon = 56.569444444, type = "OMFJ" },
        ["ASREN"] = { lat = 25.107611111, lon = 56.576388889, type = "OMFJ" },
        ["TUDOP"] = { lat = 25.466666667, lon = 55.75, type = "OMFJ" },
        ["D100K"] = { lat = 25.062344444, lon = 56.552052778, type = "OMFJ" },
        ["NAGEX"] = { lat = 25.175833333, lon = 56.207777778, type = "ENRT" },
        ["BORUL"] = { lat = 24.991944444, lon = 56.642777778, type = "OMFJ" },
        ["GABKO"] = { lat = 26.067777778, lon = 55.798611111, type = "ENRT" },
        ["MEPTI"] = { lat = 25.158888889, lon = 56.237222222, type = "ENRT" },
        ["FJ363"] = { lat = 25.064777778, lon = 56.450027778, type = "OMFJ" },
        ["RW29"] = { lat = -34.005188889, lon = 22.389325, type = "FAGG" },
        ["FJ364"] = { lat = 25.119861111, lon = 56.303638889, type = "OMFJ" },
        ["FJ365"] = { lat = 25.194416667, lon = 56.212583333, type = "OMFJ" },
        ["FJ932"] = { lat = 25.199, lon = 56.21, type = "OMFJ" },
        ["RW29L"] = { lat = 20.514083333, lon = -103.292666667, type = "MMGL" },
        ["EMOPI"] = { lat = 25.438888889, lon = 56.15, type = "ENRT" },
        ["DANIG"] = { lat = 25.030277778, lon = 56.541111111, type = "OMFJ" },
        ["FJ931"] = { lat = 25.308666667, lon = 56.259833333, type = "OMFJ" },
        ["FJ801"] = { lat = 24.97325, lon = 56.320611111, type = "OMFJ" },
        ["RUDAT"] = { lat = 24.768083333, lon = 56.28725, type = "ENRT" },
        ["FJ804"] = { lat = 25.171944444, lon = 56.219166667, type = "OMFJ" },
        ["FJ935"] = { lat = 25.065694444, lon = 56.441888889, type = "OMFJ" },
        ["VAVIM"] = { lat = 24.25975, lon = 55.606361111, type = "ENRT" },
        ["FJ802"] = { lat = 25.129833333, lon = 56.271361111, type = "OMFJ" },
        ["DESPA"] = { lat = 25.215833333, lon = 56.512222222, type = "OMFJ" },
        ["IMKIR"] = { lat = 25.066861111, lon = 56.4445, type = "OMFJ" },
        ["KUSEN"] = { lat = 25.307777778, lon = 56.394444444, type = "ENRT" },
        ["FJ930"] = { lat = 25.097444444, lon = 56.357555556, type = "OMFJ" },
        ["MA29"] = { lat = 56.347144444, lon = -62.049108333, type = "CVB2" },
        ["IMVAT"] = { lat = 24.953111111, lon = 56.506055556, type = "OMFJ" },
        ["KULKU"] = { lat = 25.028527778, lon = 56.540361111, type = "OMFJ" },
        ["UMAMI"] = { lat = 24.853805556, lon = 56.039805556, type = "ENRT" },
        ["FJ800"] = { lat = 25.170111111, lon = 56.40075, type = "OMFJ" },
        ["FJ928"] = { lat = 25.0865, lon = 56.392333333, type = "OMFJ" },
        ["FJ366"] = { lat = 25.311583333, lon = 56.251888889, type = "OMFJ" },
        ["FJ924"] = { lat = 25.093694444, lon = 56.37325, type = "OMFJ" },
        ["FJ811"] = { lat = 24.985194444, lon = 56.163333333, type = "OMFJ" },
        ["FJ803"] = { lat = 25.163055556, lon = 56.23, type = "OMFJ" },
        ["ALNUM"] = { lat = 24.85, lon = 56.266666667, type = "OMFJ" },
        ["FJ810"] = { lat = 25.298555556, lon = 56.237305556, type = "OMFJ" },
        ["FJ805"] = { lat = 25.093611111, lon = 56.161666667, type = "OMFJ" },
        ["FJ934"] = { lat = 25.062944444, lon = 56.449138889, type = "OMFJ" },
        ["FJ812"] = { lat = 25.304166667, lon = 56.333888889, type = "OMFJ" },
    },

    -- Данные ВПП
    Runways = {
        ["RW11"] = {
            heading = 110,
            length = 0,
            width = 0,
            threshold = { lat = 25.116172222222225, lon = 56.313449999999996 },
            end = { lat = 25.116172222222225, lon = 56.313449999999996 }
        },
        ["RW11R"] = {
            heading = 110,
            length = 0,
            width = 0,
            threshold = { lat = 25.11433611111111, lon = 56.31261666666666 },
            end = { lat = 25.11433611111111, lon = 56.31261666666666 }
        },
        ["RW29"] = {
            heading = 290,
            length = 0,
            width = 0,
            threshold = { lat = 25.10566388888889, lon = 56.34140277777778 },
            end = { lat = 25.10566388888889, lon = 56.34140277777778 }
        },
        ["RW29L"] = {
            heading = 290,
            length = 0,
            width = 0,
            threshold = { lat = 25.103825, lon = 56.34057777777778 },
            end = { lat = 25.103825, lon = 56.34057777777778 }
        },
    },

    -- Процедуры SID
    SID = {
        ["GABK1R"] = {
            name = "GABK1R",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "FJ802", type = "P", altitude_min = 1500, speed = 210.0 },
                { name = "FJ803", type = "P", speed = 230.0 },
                { name = "FJ810", type = "P" },
                { name = "EMOPI", type = "E", altitude_min = 6000 },
                { name = "GABKO", type = "E" },
            }
        },
        ["GABK3N"] = {
            name = "GABK3N",
            runway = "RW29",
            waypoints = {
                { name = "MEPTI", type = "E", speed = 230.0 },
                { name = "FJ810", type = "P" },
                { name = "EMOPI", type = "E", altitude_min = 6000 },
                { name = "GABKO", type = "E" },
            }
        },
        ["GABK4F"] = {
            name = "GABK4F",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ800", type = "P" },
                { name = "FJ810", type = "P", altitude_min = 6000 },
                { name = "EMOPI", type = "E" },
                { name = "GABKO", type = "E" },
            }
        },
        ["IMPE1R"] = {
            name = "IMPE1R",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "FJ802", type = "P", altitude_min = 1500, speed = 210.0 },
                { name = "FJ803", type = "P", speed = 230.0 },
                { name = "FJ810", type = "P", speed = 230.0 },
                { name = "FJ812", type = "P", altitude_min = 6000 },
                { name = "IMKIR", type = "P" },
                { name = "FJ811", type = "P" },
                { name = "IMPED", type = "E" },
            }
        },
        ["IMPE1S"] = {
            name = "IMPE1S",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "FJ802", type = "P", altitude_min = 1500, speed = 210.0 },
                { name = "FJ804", type = "P", speed = 230.0 },
                { name = "FJ805", type = "P" },
                { name = "FJ811", type = "P", speed = 230.0 },
                { name = "IMPED", type = "E" },
            }
        },
        ["IMPE2N"] = {
            name = "IMPE2N",
            runway = "RW29",
            waypoints = {
                { name = "MEPTI", type = "E", speed = 230.0 },
                { name = "FJ810", type = "P", speed = 230.0 },
                { name = "KUSEN", type = "E", altitude_min = 6000 },
                { name = "IMKIR", type = "P", altitude_min = 6000 },
                { name = "FJ811", type = "P" },
                { name = "IMPED", type = "E" },
            }
        },
        ["IMPE2P"] = {
            name = "IMPE2P",
            runway = "RW29",
            waypoints = {
                { name = "NAGEX", type = "E", speed = 210.0 },
                { name = "FJ811", type = "P", speed = 230.0 },
                { name = "IMPED", type = "E" },
            }
        },
        ["IMPE3F"] = {
            name = "IMPE3F",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ801", type = "P" },
                { name = "IMPED", type = "E", altitude_min = 6000 },
            }
        },
        ["NOLS1R"] = {
            name = "NOLS1R",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "FJ802", type = "P", altitude_min = 1500, speed = 210.0 },
                { name = "FJ804", type = "P", speed = 230.0 },
                { name = "NOLSU", type = "E", altitude_min = 6000 },
            }
        },
        ["NOLS2N"] = {
            name = "NOLS2N",
            runway = "RW29",
            waypoints = {
                { name = "MEPTI", type = "E", speed = 230.0 },
                { name = "NOLSU", type = "E", altitude_min = 6000 },
            }
        },
        ["NOLS3F"] = {
            name = "NOLS3F",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ800", type = "P" },
                { name = "NOLSU", type = "E", altitude_min = 6000 },
            }
        },
        ["RAV1F"] = {
            name = "RAV1F",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ800", type = "P" },
                { name = "FJ810", type = "P", altitude_min = 6000 },
                { name = "EMOPI", type = "E" },
                { name = "RAV", type = "D" },
            }
        },
        ["RAV1N"] = {
            name = "RAV1N",
            runway = "RW29",
            waypoints = {
                { name = "MEPTI", type = "E", speed = 230.0 },
                { name = "FJ810", type = "P" },
                { name = "EMOPI", type = "E", altitude_min = 6000 },
                { name = "RAV", type = "D" },
            }
        },
        ["RAV1R"] = {
            name = "RAV1R",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "FJ802", type = "P", altitude_min = 1500, speed = 210.0 },
                { name = "FJ803", type = "P", speed = 230.0 },
                { name = "FJ810", type = "P" },
                { name = "EMOPI", type = "E", altitude_min = 6000 },
                { name = "RAV", type = "D" },
            }
        },
        ["SERS1R"] = {
            name = "SERS1R",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "FJ802", type = "P", altitude_min = 1500, speed = 210.0 },
                { name = "FJ803", type = "P", speed = 230.0 },
                { name = "FJ810", type = "P" },
                { name = "EMOPI", type = "E", altitude_min = 6000 },
                { name = "TUDOP", type = "P" },
                { name = "SERSA", type = "E" },
            }
        },
        ["SERS3N"] = {
            name = "SERS3N",
            runway = "RW29",
            waypoints = {
                { name = "MEPTI", type = "E", speed = 230.0 },
                { name = "FJ810", type = "P" },
                { name = "EMOPI", type = "E", altitude_min = 6000 },
                { name = "TUDOP", type = "P" },
                { name = "SERSA", type = "E" },
            }
        },
        ["SERS4F"] = {
            name = "SERS4F",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ800", type = "P" },
                { name = "FJ810", type = "P", altitude_min = 6000 },
                { name = "EMOPI", type = "E" },
                { name = "TUDOP", type = "P" },
                { name = "SERSA", type = "E" },
            }
        },
        ["TONV1R"] = {
            name = "TONV1R",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "FJ802", type = "P", altitude_min = 1500, speed = 210.0 },
                { name = "FJ803", type = "P", speed = 230.0 },
                { name = "FJ810", type = "P", speed = 230.0 },
                { name = "FJ812", type = "P", altitude_min = 6000 },
                { name = "IMKIR", type = "P" },
                { name = "TONVO", type = "E" },
            }
        },
        ["TONV4F"] = {
            name = "TONV4F",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "TONVO", type = "E" },
            }
        },
        ["UMAM1R"] = {
            name = "UMAM1R",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "FJ802", type = "P", altitude_min = 1500, speed = 210.0 },
                { name = "FJ803", type = "P", speed = 230.0 },
                { name = "FJ810", type = "P", speed = 230.0 },
                { name = "FJ812", type = "P", altitude_min = 6000 },
                { name = "IMKIR", type = "P" },
                { name = "FJ811", type = "P" },
                { name = "UMAMI", type = "E" },
            }
        },
        ["UMAM1S"] = {
            name = "UMAM1S",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "FJ802", type = "P", altitude_min = 1500, speed = 210.0 },
                { name = "FJ804", type = "P", speed = 230.0 },
                { name = "FJ805", type = "P" },
                { name = "FJ811", type = "P", speed = 230.0 },
                { name = "UMAMI", type = "E" },
            }
        },
        ["UMAM2N"] = {
            name = "UMAM2N",
            runway = "RW29",
            waypoints = {
                { name = "MEPTI", type = "E", speed = 230.0 },
                { name = "FJ810", type = "P", speed = 230.0 },
                { name = "KUSEN", type = "E", altitude_min = 6000 },
                { name = "IMKIR", type = "P", altitude_min = 6000 },
                { name = "FJ811", type = "P" },
                { name = "UMAMI", type = "E" },
            }
        },
        ["UMAM2P"] = {
            name = "UMAM2P",
            runway = "RW29",
            waypoints = {
                { name = "NAGEX", type = "E", speed = 210.0 },
                { name = "FJ811", type = "P", speed = 230.0 },
                { name = "UMAMI", type = "E" },
            }
        },
        ["UMAM3F"] = {
            name = "UMAM3F",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ801", type = "P" },
                { name = "UMAMI", type = "E", altitude_min = 6000 },
            }
        },
        ["VAVI1N"] = {
            name = "VAVI1N",
            runway = "RW29",
            waypoints = {
                { name = "MEPTI", type = "E", speed = 230.0 },
                { name = "FJ810", type = "P", speed = 230.0 },
                { name = "KUSEN", type = "E", altitude_min = 6000 },
                { name = "IMKIR", type = "P", altitude_min = 6000 },
                { name = "ALNUM", type = "P" },
                { name = "GIDIS", type = "E" },
                { name = "VAVIM", type = "E" },
            }
        },
        ["VAVI1P"] = {
            name = "VAVI1P",
            runway = "RW29",
            waypoints = {
                { name = "NAGEX", type = "E", speed = 210.0 },
                { name = "FJ811", type = "P", altitude_min = 7000 },
                { name = "GIDIS", type = "E" },
                { name = "VAVIM", type = "E" },
            }
        },
        ["VAVI1R"] = {
            name = "VAVI1R",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "FJ802", type = "P", altitude_min = 1500, speed = 210.0 },
                { name = "FJ803", type = "P", speed = 230.0 },
                { name = "FJ810", type = "P", speed = 230.0 },
                { name = "FJ812", type = "P", altitude_min = 6000 },
                { name = "IMKIR", type = "P" },
                { name = "ALNUM", type = "P" },
                { name = "GIDIS", type = "E" },
                { name = "VAVIM", type = "E" },
            }
        },
        ["VAVI1S"] = {
            name = "VAVI1S",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 800 },
                { name = "FJ802", type = "P", altitude_min = 1500, speed = 210.0 },
                { name = "FJ804", type = "P", speed = 230.0 },
                { name = "FJ805", type = "P" },
                { name = "FJ811", type = "P", altitude_min = 7000 },
                { name = "GIDIS", type = "E" },
                { name = "VAVIM", type = "E" },
            }
        },
        ["VAVI2F"] = {
            name = "VAVI2F",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "", type = "", altitude_min = 500 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ929", type = "P", speed = 220.0 },
                { name = "FJ801", type = "P" },
                { name = "GIDIS", type = "E", altitude_min = 7000 },
                { name = "VAVIM", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["KUSE3A"] = {
            name = "KUSE3A",
            runway = "",
            waypoints = {
                { name = "KUSEN", type = "OM", altitude_min = 8000 },
                { name = "KUSEN", type = "OM", altitude_min = 8000 },
                { name = "ASREN", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "KUSEN", type = "OM", altitude_min = 8000 },
                { name = "ASREN", type = "OO", altitude_min = 3000, speed = 210.0 },
            }
        },
        ["RUDA3A"] = {
            name = "RUDA3A",
            runway = "",
            waypoints = {
                { name = "RUDAT", type = "OM", altitude_min = 8000 },
                { name = "RUDAT", type = "OM", altitude_min = 8000 },
                { name = "IMVAT", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "RUDAT", type = "OM", altitude_min = 8000 },
                { name = "IMVAT", type = "OO", altitude_min = 3000, speed = 210.0 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D29-W"] = {
            name = "D29-W",
            type = "A",
            runway = "D29-W",
            waypoints = {
                { name = "BORUL", transition = "BORUL", type = "OO", altitude_min = 3000 },
                { name = "DANIG", transition = "BORUL", type = "OO", altitude_min = 2000 },
                { name = "DANIG", transition = "DANIG", type = "OO", altitude_min = 3000 },
                { name = "DANIG", transition = "DANIG", type = "OO", altitude_min = 2000, speed = 210.0 },
                { name = "DESPA", transition = "DESPA", type = "OO", altitude_min = 3000 },
                { name = "DANIG", transition = "DESPA", type = "OO", altitude_min = 2000 },
                { name = "FJV", transition = "FJV", type = "OM", altitude_min = 5000, speed = 210.0 },
                { name = "FJV", transition = "FJV", type = "OM" },
                { name = "DANIG", transition = "FJV", type = "OO", altitude_min = 2000 },
                { name = "DANIG", transition = "", type = "OO", altitude_min = 2000 },
                { name = "IMKIR", transition = "", type = "OM", altitude_min = 2000 },
                { name = "FJ929", transition = "", type = "OM", altitude_min = 1300 },
                { name = "MA29", transition = "", type = "OO" },
                { name = "", transition = "", type = "", speed = 185.0 },
                { name = "KARER", transition = "", type = "OO" },
                { name = "KARER", transition = "", type = "OO", altitude_min = 3000, speed = 210.0 },
            }
        },
        ["D29-X"] = {
            name = "D29-X",
            type = "A",
            runway = "D29-X",
            waypoints = {
                { name = "BORUL", transition = "BORUL", type = "OO", altitude_min = 3000 },
                { name = "DANIG", transition = "BORUL", type = "OO", altitude_min = 2000 },
                { name = "DANIG", transition = "DANIG", type = "OO", altitude_min = 3000 },
                { name = "DANIG", transition = "DANIG", type = "OO", altitude_min = 2000, speed = 210.0 },
                { name = "DESPA", transition = "DESPA", type = "OO", altitude_min = 3000 },
                { name = "DANIG", transition = "DESPA", type = "OO", altitude_min = 2000 },
                { name = "FJV", transition = "FJV", type = "OM", altitude_min = 5000 },
                { name = "FJV", transition = "FJV", type = "OM" },
                { name = "DANIG", transition = "FJV", type = "OO", altitude_min = 2000 },
                { name = "DANIG", transition = "", type = "OO", altitude_min = 2000 },
                { name = "IMKIR", transition = "", type = "OM", altitude_min = 2000 },
                { name = "FJ929", transition = "", type = "OM", altitude_min = 1300 },
                { name = "MA29", transition = "", type = "OO" },
                { name = "", transition = "", type = "" },
                { name = "KARER", transition = "", type = "OO" },
                { name = "KARER", transition = "", type = "OO", altitude_min = 3000, speed = 210.0 },
            }
        },
        ["L29-W"] = {
            name = "L29-W",
            type = "A",
            runway = "L29-W",
            waypoints = {
                { name = "BORUL", transition = "BORUL", type = "OO", altitude_min = 3000 },
                { name = "DANIG", transition = "BORUL", type = "OO", altitude_min = 2000 },
                { name = "DANIG", transition = "DANIG", type = "OO", altitude_min = 3000 },
                { name = "DANIG", transition = "DANIG", type = "OO", altitude_min = 2000, speed = 210.0 },
                { name = "DESPA", transition = "DESPA", type = "OO", altitude_min = 3000 },
                { name = "D100K", transition = "DESPA", type = "OO", altitude_min = 2000 },
                { name = "", transition = "DESPA", type = "" },
                { name = "FJV", transition = "FJV", type = "OM", altitude_min = 5000, speed = 210.0 },
                { name = "FJV", transition = "FJV", type = "OM" },
                { name = "DANIG", transition = "FJV", type = "OO", altitude_min = 2000 },
                { name = "DANIG", transition = "", type = "OO", altitude_min = 2000 },
                { name = "IMKIR", transition = "", type = "OM", altitude_min = 2000 },
                { name = "FJ929", transition = "", type = "OM", altitude_min = 1300 },
                { name = "MA29", transition = "", type = "OO" },
                { name = "", transition = "", type = "", speed = 185.0 },
                { name = "KARER", transition = "", type = "OO" },
                { name = "KARER", transition = "", type = "OO", altitude_min = 3000, speed = 210.0 },
            }
        },
        ["L29-X"] = {
            name = "L29-X",
            type = "A",
            runway = "L29-X",
            waypoints = {
                { name = "BORUL", transition = "BORUL", type = "OO", altitude_min = 3000 },
                { name = "DANIG", transition = "BORUL", type = "OO", altitude_min = 2000 },
                { name = "DANIG", transition = "DANIG", type = "OO", altitude_min = 3000 },
                { name = "DANIG", transition = "DANIG", type = "OO", altitude_min = 2000, speed = 210.0 },
                { name = "DESPA", transition = "DESPA", type = "OO", altitude_min = 3000 },
                { name = "D100K", transition = "DESPA", type = "OO", altitude_min = 2000 },
                { name = "", transition = "DESPA", type = "" },
                { name = "FJV", transition = "FJV", type = "OM", altitude_min = 5000 },
                { name = "FJV", transition = "FJV", type = "OM" },
                { name = "DANIG", transition = "FJV", type = "OO", altitude_min = 2000 },
                { name = "DANIG", transition = "", type = "OO", altitude_min = 2000 },
                { name = "IMKIR", transition = "", type = "OM", altitude_min = 2000 },
                { name = "FJ929", transition = "", type = "OM", altitude_min = 1300 },
                { name = "MA29", transition = "", type = "OO" },
                { name = "", transition = "", type = "" },
                { name = "KARER", transition = "", type = "OO" },
                { name = "KARER", transition = "", type = "OO", altitude_min = 3000, speed = 210.0 },
            }
        },
        ["R29-Y"] = {
            name = "R29-Y",
            type = "A",
            runway = "R29-Y",
            waypoints = {
                { name = "ASREN", transition = "ASREN", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "DANIG", transition = "ASREN", type = "OO", altitude_min = 2000 },
                { name = "BORUL", transition = "BORUL", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "DANIG", transition = "BORUL", type = "OO", altitude_min = 2000 },
                { name = "DANIG", transition = "DANIG", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "IMVAT", transition = "IMVAT", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "DANIG", transition = "IMVAT", type = "OO", altitude_min = 2000 },
                { name = "DANIG", transition = "", type = "OO", altitude_min = 2000 },
                { name = "IMKIR", transition = "", type = "OM", altitude_min = 2000 },
                { name = "FJ929", transition = "", type = "OM", altitude_min = 1370 },
                { name = "FJ924", transition = "", type = "OM" },
                { name = "KARER", transition = "", type = "OO", altitude_min = 3000, speed = 185.0 },
                { name = "KARER", transition = "", type = "OO", altitude_min = 3000, speed = 210.0 },
            }
        },
        ["R29-Z"] = {
            name = "R29-Z",
            type = "A",
            runway = "R29-Z",
            waypoints = {
                { name = "ASREN", transition = "ASREN", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "DANIG", transition = "ASREN", type = "OO", altitude_min = 2000 },
                { name = "BORUL", transition = "BORUL", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "DANIG", transition = "BORUL", type = "OO", altitude_min = 2000 },
                { name = "DANIG", transition = "DANIG", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "IMVAT", transition = "IMVAT", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "DANIG", transition = "IMVAT", type = "OO", altitude_min = 2000 },
                { name = "DANIG", transition = "", type = "OO", altitude_min = 2000 },
                { name = "FJ363", transition = "", type = "OM", altitude_min = 2000 },
                { name = "FJ928", transition = "", type = "OM", altitude_min = 990 },
                { name = "RW29", transition = "", type = "OM" },
                { name = "FJ364", transition = "", type = "OM", altitude_min = 1200 },
                { name = "FJ365", transition = "", type = "OM", altitude_min = 3300, speed = 210.0 },
                { name = "FJ366", transition = "", type = "OO", speed = 210.0 },
                { name = "DESPA", transition = "", type = "OO", altitude_min = 4000, speed = 210.0 },
                { name = "DESPA", transition = "", type = "OO", altitude_min = 4000, speed = 210.0 },
            }
        },
        ["R29LY"] = {
            name = "R29LY",
            type = "A",
            runway = "R29LY",
            waypoints = {
                { name = "ASREN", transition = "ASREN", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "KULKU", transition = "ASREN", type = "OO", altitude_min = 2000 },
                { name = "BORUL", transition = "BORUL", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "KULKU", transition = "BORUL", type = "OO", altitude_min = 2000 },
                { name = "DESPA", transition = "DESPA", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "ASREN", transition = "DESPA", type = "OO", altitude_min = 3000 },
                { name = "KULKU", transition = "DESPA", type = "OO", altitude_min = 2000 },
                { name = "IMVAT", transition = "IMVAT", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "KULKU", transition = "IMVAT", type = "OO", altitude_min = 2000 },
                { name = "KULKU", transition = "", type = "OO", altitude_min = 2000 },
                { name = "FJ935", transition = "", type = "OO" },
                { name = "FJ930", transition = "", type = "OM" },
                { name = "KARER", transition = "", type = "OO", altitude_min = 3000, speed = 160.0 },
                { name = "KARER", transition = "", type = "OO", altitude_min = 3000, speed = 210.0 },
            }
        },
        ["R29LZ"] = {
            name = "R29LZ",
            type = "A",
            runway = "R29LZ",
            waypoints = {
                { name = "ASREN", transition = "ASREN", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "KULKU", transition = "ASREN", type = "OO", altitude_min = 2000 },
                { name = "BORUL", transition = "BORUL", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "KULKU", transition = "BORUL", type = "OO", altitude_min = 2000 },
                { name = "DESPA", transition = "DESPA", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "ASREN", transition = "DESPA", type = "OO", altitude_min = 3000 },
                { name = "KULKU", transition = "DESPA", type = "OO", altitude_min = 2000 },
                { name = "IMVAT", transition = "IMVAT", type = "OO", altitude_min = 3000, speed = 210.0 },
                { name = "KULKU", transition = "IMVAT", type = "OO", altitude_min = 2000 },
                { name = "KULKU", transition = "", type = "OO", altitude_min = 2000 },
                { name = "FJ934", transition = "", type = "OO" },
                { name = "RW29L", transition = "", type = "OM" },
                { name = "FJ933", transition = "", type = "OM", speed = 185.0 },
                { name = "FJ932", transition = "", type = "OM", altitude_min = 2700, speed = 210.0 },
                { name = "FJ931", transition = "", type = "OM", speed = 210.0 },
                { name = "DESPA", transition = "", type = "OO", altitude_min = 4000, speed = 210.0 },
                { name = "DESPA", transition = "", type = "OO", speed = 210.0 },
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
