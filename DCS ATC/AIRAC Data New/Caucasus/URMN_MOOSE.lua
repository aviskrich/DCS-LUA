local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "URMN",
        Name = "URMN Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["MN011"] = { lat = 43.686805556, lon = 43.4625, type = "URMN" },
        ["OKARU"] = { lat = 43.846666667, lon = 43.811944444, type = "ENRT" },
        ["CF24"] = { lat = -4.276872222, lon = 15.613369444, type = "FZAA" },
        ["TAFIK"] = { lat = 43.417222222, lon = 43.946944444, type = "ENRT" },
        ["MN016"] = { lat = 43.703361111, lon = 44.039083333, type = "URMN" },
        ["MEMZA"] = { lat = 43.634166667, lon = 44.132777778, type = "ENRT" },
        ["MN001"] = { lat = 43.667916667, lon = 43.878861111, type = "URMN" },
        ["MN019"] = { lat = 43.563555556, lon = 44.022666667, type = "URMN" },
        ["MN009"] = { lat = 43.700722222, lon = 44.027222222, type = "URMN" },
        ["N"] = { lat = 11.707583333, lon = 43.332972222, type = "HDAM" },
        ["DER24"] = { lat = 55.279305556, lon = 124.767763889, type = "UHBW" },
        ["MN008"] = { lat = 43.767277778, lon = 43.951777778, type = "URMN" },
        ["MN003"] = { lat = 43.559138889, lon = 43.760611111, type = "URMN" },
        ["MN007"] = { lat = 43.775527778, lon = 43.833472222, type = "URMN" },
        ["MN013"] = { lat = 43.724888889, lon = 43.730888889, type = "URMN" },
        ["MN021"] = { lat = 43.77925, lon = 43.929527778, type = "URMN" },
        ["MN012"] = { lat = 43.679611111, lon = 43.631444444, type = "URMN" },
        ["MN006"] = { lat = 43.720666667, lon = 43.741861111, type = "URMN" },
        ["FF24"] = { lat = 11.2236, lon = -4.245213889, type = "DFOO" },
        ["MN002"] = { lat = 43.585388889, lon = 43.831305556, type = "URMN" },
        ["MOZAT"] = { lat = 43.728888889, lon = 43.143611111, type = "ENRT" },
        ["MN020"] = { lat = 43.654111111, lon = 44.017222222, type = "URMN" },
        ["MN022"] = { lat = 43.722222222, lon = 43.7875, type = "URMN" },
        ["MN004"] = { lat = 43.523027778, lon = 43.663666667, type = "URMN" },
        ["MN018"] = { lat = 43.637166667, lon = 43.971277778, type = "URMN" },
        ["D075M"] = { lat = 43.503486111, lon = 43.389691667, type = "URMN" },
        ["MN015"] = { lat = 43.775222222, lon = 43.957611111, type = "URMN" },
        ["ABGAM"] = { lat = 43.763333333, lon = 43.533888889, type = "ENRT" },
        ["MN014"] = { lat = 43.784138889, lon = 43.829833333, type = "URMN" },
        ["DUFLE"] = { lat = 43.463055556, lon = 42.995833333, type = "ENRT" },
        ["NAMOD"] = { lat = 43.389166667, lon = 43.203055556, type = "ENRT" },
        ["MN005"] = { lat = 43.706805556, lon = 43.546777778, type = "URMN" },
        ["FN24Y"] = { lat = 43.583363889, lon = 43.826572222, type = "URMN" },
        ["MN010"] = { lat = 43.615, lon = 44.015638889, type = "URMN" },
        ["MN017"] = { lat = 43.610777778, lon = 44.026583333, type = "URMN" },
    },

    -- Данные ВПП
    Runways = {
        ["RW06"] = {
            heading = 60,
            length = -1180.0,
            width = 0,
            threshold = { lat = 43.508408333333335, lon = 43.62451388888889 },
            end = { lat = 43.41130689359877, lon = 43.39262252233008 }
        },
        ["RW24"] = {
            heading = 240,
            length = 1180.0,
            width = 0,
            threshold = { lat = 43.51744722222222, lon = 43.648719444444446 },
            end = { lat = 43.42034578248766, lon = 43.4167933438084 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ABGA1C"] = {
            name = "ABGA1C",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "ABGAM", type = "E", altitude_min = 9000 },
            }
        },
        ["ABGA1D"] = {
            name = "ABGA1D",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "ABGAM", type = "E", altitude_min = 9000 },
            }
        },
        ["ABGA1E"] = {
            name = "ABGA1E",
            runway = "RW06",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 2000, speed = 265.0 },
                { name = "ABGAM", type = "E", altitude_min = 9000 },
            }
        },
        ["ABGA1G"] = {
            name = "ABGA1G",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P" },
                { name = "", type = "", altitude_min = 4500, speed = 205.0 },
                { name = "", type = "" },
                { name = "ABGAM", type = "E", altitude_min = 9000 },
            }
        },
        ["ABGA1H"] = {
            name = "ABGA1H",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 4000, speed = 205.0 },
                { name = "", type = "" },
                { name = "ABGAM", type = "E", altitude_min = 9000 },
            }
        },
        ["ABGA1J"] = {
            name = "ABGA1J",
            runway = "RW06",
            waypoints = {
                { name = "", type = "", altitude_min = 1870 },
                { name = "MN018", type = "P", speed = 265.0 },
                { name = "MN022", type = "P" },
                { name = "ABGAM", type = "E", altitude_min = 9000 },
            }
        },
        ["DUFL1C"] = {
            name = "DUFL1C",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "DUFLE", type = "E", altitude_min = 22000 },
            }
        },
        ["DUFL1D"] = {
            name = "DUFL1D",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "DUFLE", type = "E", altitude_min = 22000 },
            }
        },
        ["DUFL1E"] = {
            name = "DUFL1E",
            runway = "RW06",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 2000, speed = 265.0 },
                { name = "DUFLE", type = "E", altitude_min = 22000 },
            }
        },
        ["DUFL1G"] = {
            name = "DUFL1G",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P" },
                { name = "", type = "", altitude_min = 4500, speed = 205.0 },
                { name = "NF", type = "P", altitude_min = 7000 },
                { name = "NF", type = "P", altitude_min = 16000, speed = 260.0 },
                { name = "DUFLE", type = "E", altitude_min = 22000 },
            }
        },
        ["DUFL1H"] = {
            name = "DUFL1H",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 4300, speed = 205.0 },
                { name = "N", type = "P", altitude_min = 7000 },
                { name = "N", type = "P", altitude_min = 17000, speed = 260.0 },
                { name = "DUFLE", type = "E", altitude_min = 22000 },
            }
        },
        ["DUFL1J"] = {
            name = "DUFL1J",
            runway = "RW06",
            waypoints = {
                { name = "", type = "", altitude_min = 1870 },
                { name = "MN020", type = "P", speed = 265.0 },
                { name = "MN021", type = "P", altitude_min = 8000 },
                { name = "MN011", type = "P", altitude_min = 14000 },
                { name = "DUFLE", type = "E", altitude_min = 22000 },
            }
        },
        ["MEMZ1C"] = {
            name = "MEMZ1C",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P", altitude_min = 2000 },
                { name = "MEMZA", type = "E", altitude_min = 7000 },
            }
        },
        ["MEMZ1D"] = {
            name = "MEMZ1D",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "MEMZA", type = "E", altitude_min = 7000 },
            }
        },
        ["MEMZ1E"] = {
            name = "MEMZ1E",
            runway = "RW06",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 2000, speed = 265.0 },
                { name = "MEMZA", type = "E", altitude_min = 7000 },
            }
        },
        ["MEMZ1J"] = {
            name = "MEMZ1J",
            runway = "RW06",
            waypoints = {
                { name = "", type = "", altitude_min = 1870 },
                { name = "MN018", type = "P" },
                { name = "MEMZA", type = "E", altitude_min = 7000 },
            }
        },
        ["MOZA1C"] = {
            name = "MOZA1C",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "MOZAT", type = "E", altitude_min = 12000 },
            }
        },
        ["MOZA1D"] = {
            name = "MOZA1D",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "MOZAT", type = "E", altitude_min = 12000 },
            }
        },
        ["MOZA1E"] = {
            name = "MOZA1E",
            runway = "RW06",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 2000, speed = 265.0 },
                { name = "MOZAT", type = "E", altitude_min = 12000 },
            }
        },
        ["MOZA1G"] = {
            name = "MOZA1G",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P" },
                { name = "", type = "", altitude_min = 4500, speed = 205.0 },
                { name = "NF", type = "P", altitude_min = 7000, speed = 225.0 },
                { name = "MOZAT", type = "E", altitude_min = 12000 },
            }
        },
        ["MOZA1H"] = {
            name = "MOZA1H",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 4300, speed = 205.0 },
                { name = "N", type = "P", altitude_min = 7000, speed = 215.0 },
                { name = "MOZAT", type = "E", altitude_min = 12000 },
            }
        },
        ["MOZA1J"] = {
            name = "MOZA1J",
            runway = "RW06",
            waypoints = {
                { name = "", type = "", altitude_min = 1870 },
                { name = "MN018", type = "P", speed = 265.0 },
                { name = "MN022", type = "P" },
                { name = "MOZAT", type = "E", altitude_min = 12000 },
            }
        },
        ["NAMO1C"] = {
            name = "NAMO1C",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "NAMOD", type = "E", altitude_min = 23000 },
            }
        },
        ["NAMO1D"] = {
            name = "NAMO1D",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "NAMOD", type = "E", altitude_min = 23000 },
            }
        },
        ["NAMO1E"] = {
            name = "NAMO1E",
            runway = "RW06",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 2000, speed = 265.0 },
                { name = "NAMOD", type = "E", altitude_min = 23000 },
            }
        },
        ["NAMO1G"] = {
            name = "NAMO1G",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P" },
                { name = "", type = "", altitude_min = 4500, speed = 205.0 },
                { name = "NF", type = "P", altitude_min = 7000 },
                { name = "NF", type = "P", altitude_min = 19000, speed = 260.0 },
                { name = "NAMOD", type = "E", altitude_min = 23000 },
            }
        },
        ["NAMO1H"] = {
            name = "NAMO1H",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 4300, speed = 205.0 },
                { name = "N", type = "P", altitude_min = 7000 },
                { name = "N", type = "P", altitude_min = 19000, speed = 260.0 },
                { name = "NAMOD", type = "E", altitude_min = 23000 },
            }
        },
        ["NAMO1J"] = {
            name = "NAMO1J",
            runway = "RW06",
            waypoints = {
                { name = "", type = "", altitude_min = 1870 },
                { name = "MN020", type = "P", speed = 265.0 },
                { name = "MN021", type = "P", altitude_min = 9000 },
                { name = "MN011", type = "P", altitude_min = 15000 },
                { name = "NAMOD", type = "E", altitude_min = 23000 },
            }
        },
        ["OKAR1C"] = {
            name = "OKAR1C",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P", altitude_min = 2000 },
                { name = "OKARU", type = "E", altitude_min = 8000 },
            }
        },
        ["OKAR1D"] = {
            name = "OKAR1D",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "OKARU", type = "E", altitude_min = 8000 },
            }
        },
        ["OKAR1E"] = {
            name = "OKAR1E",
            runway = "RW06",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 2000, speed = 265.0 },
                { name = "OKARU", type = "E", altitude_min = 8000 },
            }
        },
        ["OKAR1G"] = {
            name = "OKAR1G",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P" },
                { name = "", type = "", altitude_min = 4500, speed = 205.0 },
                { name = "", type = "" },
                { name = "OKARU", type = "E", altitude_min = 8000 },
            }
        },
        ["OKAR1H"] = {
            name = "OKAR1H",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 4000, speed = 205.0 },
                { name = "", type = "" },
                { name = "OKARU", type = "E", altitude_min = 8000 },
            }
        },
        ["OKAR1J"] = {
            name = "OKAR1J",
            runway = "RW06",
            waypoints = {
                { name = "", type = "", altitude_min = 1870 },
                { name = "MN018", type = "P", speed = 220.0 },
                { name = "MN022", type = "P", altitude_min = 7000, speed = 220.0 },
                { name = "OKARU", type = "E", altitude_min = 8000 },
            }
        },
        ["TAFI1C"] = {
            name = "TAFI1C",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P", altitude_min = 2000 },
                { name = "TAFIK", type = "E", altitude_min = 7000 },
            }
        },
        ["TAFI1D"] = {
            name = "TAFI1D",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "TAFIK", type = "E", altitude_min = 7000 },
            }
        },
        ["TAFI1E"] = {
            name = "TAFI1E",
            runway = "RW06",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 2000, speed = 265.0 },
                { name = "TAFIK", type = "E", altitude_min = 7000 },
            }
        },
        ["TAFI1G"] = {
            name = "TAFI1G",
            runway = "RW06",
            waypoints = {
                { name = "NF", type = "P" },
                { name = "", type = "", altitude_min = 4500, speed = 205.0 },
                { name = "NF", type = "P", altitude_min = 7000, speed = 225.0 },
                { name = "TAFIK", type = "E", altitude_min = 7000 },
            }
        },
        ["TAFI1H"] = {
            name = "TAFI1H",
            runway = "RW06",
            waypoints = {
                { name = "N", type = "P" },
                { name = "", type = "", altitude_min = 4300, speed = 205.0 },
                { name = "N", type = "P", altitude_min = 7000, speed = 215.0 },
                { name = "TAFIK", type = "E", altitude_min = 7000 },
            }
        },
        ["TAFI1J"] = {
            name = "TAFI1J",
            runway = "RW06",
            waypoints = {
                { name = "", type = "", altitude_min = 1870 },
                { name = "MN018", type = "P", speed = 220.0 },
                { name = "MN019", type = "P", speed = 220.0 },
                { name = "TAFIK", type = "E", altitude_min = 7000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ABGA1A"] = {
            name = "ABGA1A",
            runway = "RW24",
            waypoints = {
                { name = "ABGAM", type = "UR", altitude_min = 8000 },
                { name = "N", type = "UR", altitude_min = 7000 },
            }
        },
        ["ABGA1B"] = {
            name = "ABGA1B",
            runway = "RW24",
            waypoints = {
                { name = "ABGAM", type = "UR", altitude_min = 8000 },
                { name = "NF", type = "UR", altitude_min = 7000 },
            }
        },
        ["ABGA1F"] = {
            name = "ABGA1F",
            runway = "RW24",
            waypoints = {
                { name = "ABGAM", type = "UR", altitude_min = 8000 },
                { name = "MN006", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN007", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN008", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN009", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN010", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN001", type = "UR", altitude_min = 5000 },
            }
        },
        ["DUFL1A"] = {
            name = "DUFL1A",
            runway = "RW24",
            waypoints = {
                { name = "DUFLE", type = "UR", altitude_min = 23000 },
                { name = "D075M", type = "UR" },
                { name = "N", type = "UR", altitude_min = 7000 },
            }
        },
        ["DUFL1B"] = {
            name = "DUFL1B",
            runway = "RW24",
            waypoints = {
                { name = "DUFLE", type = "UR", altitude_min = 23000 },
                { name = "D075M", type = "UR" },
                { name = "NF", type = "UR", altitude_min = 7000 },
            }
        },
        ["DUFL1F"] = {
            name = "DUFL1F",
            runway = "RW24",
            waypoints = {
                { name = "DUFLE", type = "UR", altitude_min = 23000 },
                { name = "MN012", type = "UR", altitude_min = 10000, speed = 215.0 },
                { name = "MN006", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN007", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN008", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN009", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN010", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN001", type = "UR", altitude_min = 5000 },
            }
        },
        ["MEMZ1A"] = {
            name = "MEMZ1A",
            runway = "RW24",
            waypoints = {
                { name = "MEMZA", type = "UR", altitude_min = 8000 },
                { name = "N", type = "UR", altitude_min = 7000 },
            }
        },
        ["MEMZ1B"] = {
            name = "MEMZ1B",
            runway = "RW24",
            waypoints = {
                { name = "MEMZA", type = "UR", altitude_min = 8000 },
                { name = "NF", type = "UR", altitude_min = 7000 },
            }
        },
        ["MEMZ1F"] = {
            name = "MEMZ1F",
            runway = "RW24",
            waypoints = {
                { name = "MEMZA", type = "UR", altitude_min = 8000 },
                { name = "MN016", type = "UR", altitude_max = 7000, speed = 215.0 },
                { name = "MN015", type = "UR", altitude_max = 7000, speed = 215.0 },
                { name = "MN014", type = "UR", altitude_max = 7000, speed = 215.0 },
                { name = "MN013", type = "UR", altitude_max = 7000, speed = 215.0 },
                { name = "MN001", type = "UR", altitude_min = 5000 },
            }
        },
        ["MOZA1A"] = {
            name = "MOZA1A",
            runway = "RW24",
            waypoints = {
                { name = "MOZAT", type = "UR", altitude_min = 11000 },
                { name = "N", type = "UR", altitude_min = 7000 },
            }
        },
        ["MOZA1B"] = {
            name = "MOZA1B",
            runway = "RW24",
            waypoints = {
                { name = "MOZAT", type = "UR", altitude_min = 11000 },
                { name = "NF", type = "UR", altitude_min = 7000 },
            }
        },
        ["MOZA1F"] = {
            name = "MOZA1F",
            runway = "RW24",
            waypoints = {
                { name = "MOZAT", type = "UR", altitude_min = 11000 },
                { name = "MN012", type = "UR", altitude_min = 10000, speed = 215.0 },
                { name = "MN006", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN007", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN008", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN009", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN010", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN001", type = "UR", altitude_min = 5000 },
            }
        },
        ["OKAR1A"] = {
            name = "OKAR1A",
            runway = "RW24",
            waypoints = {
                { name = "OKARU", type = "UR", altitude_min = 7000 },
                { name = "N", type = "UR", altitude_min = 7000 },
            }
        },
        ["OKAR1B"] = {
            name = "OKAR1B",
            runway = "RW24",
            waypoints = {
                { name = "OKARU", type = "UR", altitude_min = 7000 },
                { name = "NF", type = "UR", altitude_min = 7000 },
            }
        },
        ["OKAR1F"] = {
            name = "OKAR1F",
            runway = "RW24",
            waypoints = {
                { name = "OKARU", type = "UR", altitude_min = 9000 },
                { name = "MN007", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN008", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN009", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN010", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "MN001", type = "UR", altitude_min = 5000 },
            }
        },
        ["TAFI1A"] = {
            name = "TAFI1A",
            runway = "RW24",
            waypoints = {
                { name = "TAFIK", type = "UR", altitude_min = 8000 },
                { name = "N", type = "UR", altitude_min = 7000 },
            }
        },
        ["TAFI1B"] = {
            name = "TAFI1B",
            runway = "RW24",
            waypoints = {
                { name = "TAFIK", type = "UR", altitude_min = 8000 },
                { name = "NF", type = "UR", altitude_min = 7000 },
            }
        },
        ["TAFI1F"] = {
            name = "TAFI1F",
            runway = "RW24",
            waypoints = {
                { name = "TAFIK", type = "UR", altitude_min = 8000 },
                { name = "MN017", type = "UR", altitude_max = 7000, speed = 215.0 },
                { name = "MN016", type = "UR", altitude_max = 7000, speed = 215.0 },
                { name = "MN015", type = "UR", altitude_max = 7000, speed = 215.0 },
                { name = "MN014", type = "UR", altitude_max = 7000, speed = 215.0 },
                { name = "MN013", type = "UR", altitude_max = 7000, speed = 215.0 },
                { name = "MN001", type = "UR", altitude_min = 5000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I24-Y"] = {
            name = "I24-Y",
            type = "I",
            runway = "I24-Y",
            waypoints = {
                { name = "CF24", transition = "", type = "UR" },
                { name = "FF24", transition = "", type = "UR" },
                { name = "RW24", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2000 },
                { name = "", transition = "", type = "", speed = 185.0 },
                { name = "NF", transition = "", type = "UR", altitude_min = 3100 },
                { name = "NF", transition = "", type = "UR", altitude_min = 3800 },
            }
        },
        ["I24-Z"] = {
            name = "I24-Z",
            type = "A",
            runway = "I24-Z",
            waypoints = {
                { name = "MN001", transition = "MN001", type = "UR", altitude_min = 5000 },
                { name = "MN002", transition = "MN001", type = "UR", altitude_min = 3000 },
                { name = "MN002", transition = "", type = "UR" },
                { name = "FF24", transition = "", type = "UR" },
                { name = "RW24", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2000, speed = 190.0 },
                { name = "MN005", transition = "", type = "UR", speed = 215.0 },
                { name = "MN006", transition = "", type = "UR", altitude_min = 5000, speed = 215.0 },
                { name = "MN006", transition = "", type = "UR", altitude_max = 10000, speed = 215.0 },
            }
        },
        ["J24"] = {
            name = "J24",
            type = "A",
            runway = "J24",
            waypoints = {
                { name = "MN001", transition = "MN001", type = "UR", altitude_min = 5000 },
                { name = "MN002", transition = "MN001", type = "UR", altitude_min = 3000 },
                { name = "MN002", transition = "", type = "UR" },
                { name = "MN003", transition = "", type = "UR" },
                { name = "RW24", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2000, speed = 190.0 },
                { name = "MN005", transition = "", type = "UR", speed = 215.0 },
                { name = "MN006", transition = "", type = "UR", altitude_min = 5000, speed = 215.0 },
                { name = "MN006", transition = "", type = "UR", altitude_max = 10000, speed = 215.0 },
            }
        },
        ["N24-X"] = {
            name = "N24-X",
            type = "N",
            runway = "N24-X",
            waypoints = {
                { name = "CF24", transition = "", type = "UR" },
                { name = "FF24", transition = "", type = "UR" },
                { name = "N", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1870 },
                { name = "", transition = "", type = "" },
                { name = "NF", transition = "", type = "UR", altitude_min = 3100 },
                { name = "NF", transition = "", type = "UR", altitude_min = 3800 },
            }
        },
        ["N24-Y"] = {
            name = "N24-Y",
            type = "N",
            runway = "N24-Y",
            waypoints = {
                { name = "FN24Y", transition = "", type = "UR", altitude_min = 4200 },
                { name = "N", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1870 },
                { name = "", transition = "", type = "", speed = 185.0 },
                { name = "N", transition = "", type = "UR", altitude_min = 3100 },
                { name = "N", transition = "", type = "UR", altitude_min = 4200 },
            }
        },
        ["N24-Z"] = {
            name = "N24-Z",
            type = "N",
            runway = "N24-Z",
            waypoints = {
                { name = "CF24", transition = "", type = "UR" },
                { name = "FF24", transition = "", type = "UR" },
                { name = "N", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 1870 },
                { name = "", transition = "", type = "", speed = 185.0 },
                { name = "N", transition = "", type = "UR", altitude_min = 3100 },
                { name = "N", transition = "", type = "UR", altitude_min = 4200 },
            }
        },
        ["R24"] = {
            name = "R24",
            type = "A",
            runway = "R24",
            waypoints = {
                { name = "MN001", transition = "MN001", type = "UR", altitude_min = 5000 },
                { name = "MN002", transition = "MN001", type = "UR", altitude_min = 3000 },
                { name = "MN002", transition = "", type = "UR", altitude_min = 3000 },
                { name = "MN003", transition = "", type = "UR" },
                { name = "MN004", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2000, speed = 190.0 },
                { name = "MN005", transition = "", type = "UR", speed = 215.0 },
                { name = "MN006", transition = "", type = "UR", altitude_min = 5000, speed = 215.0 },
                { name = "MN006", transition = "", type = "UR", altitude_max = 10000, speed = 215.0 },
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
