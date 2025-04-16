local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "KTNX",
        Name = "KTNX Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Nevada"
    },

    -- Путевые точки
    Waypoints = {
        ["ESSAA"] = { lat = 37.068075, lon = -116.9331, type = "ENRT" },
        ["STOFF"] = { lat = 37.418483333, lon = -116.541811111, type = "ENRT" },
        ["LOZMO"] = { lat = 37.892952778, lon = -116.823819444, type = "KTNX" },
        ["JAYSN"] = { lat = 36.564836111, lon = -116.046461111, type = "ENRT" },
        ["JADPU"] = { lat = 38.0683, lon = -116.923108333, type = "KTNX" },
        ["JANAV"] = { lat = 37.901291667, lon = -116.835041667, type = "KTNX" },
        ["JEPAR"] = { lat = 38.006563889, lon = -116.89105, type = "KTNX" },
        ["FALAK"] = { lat = 37.754444444, lon = -116.757252778, type = "KTNX" },
        ["CF14"] = { lat = 64.106766667, lon = -160.971561111, type = "PAUN" },
        ["JESVO"] = { lat = 37.514461111, lon = -116.630116667, type = "KTNX" },
        ["CF32"] = { lat = 42.621727778, lon = 47.817586111, type = "URML" },
        ["RUDII"] = { lat = 37.722127778, lon = -116.740197222, type = "KTNX" },
        ["CIBMU"] = { lat = 38.090016667, lon = -116.805772222, type = "KTNX" },
        ["RW14"] = { lat = 47.852847222, lon = 106.753533333, type = "ZMUB" },
        ["RW32"] = { lat = 56.285166667, lon = 12.865880556, type = "ESTA" },
        ["DRAKO"] = { lat = 37.679380556, lon = -116.717661111, type = "KTNX" },
        ["COPAR"] = { lat = 38.011244444, lon = -116.875386111, type = "KTNX" },
        ["LEAHI"] = { lat = 37.482777778, lon = -117.249166667, type = "ENRT" },
        ["IRAVE"] = { lat = 37.588013889, lon = -116.632483333, type = "KTNX" },
        ["HUGER"] = { lat = 37.821966667, lon = -116.792961111, type = "KTNX" },
        ["HUBON"] = { lat = 37.53015, lon = -116.590691667, type = "KTNX" },
        ["ITOGE"] = { lat = 37.775963889, lon = -116.768752778, type = "KTNX" },
        ["JIREM"] = { lat = 37.575802778, lon = -116.663161111, type = "KTNX" },
        ["ITAVE"] = { lat = 37.696466667, lon = -116.711016667, type = "KTNX" },
        ["ROCEN"] = { lat = 38.074322222, lon = -116.902955556, type = "KTNX" },
    },

    -- Данные ВПП
    Runways = {
        ["RW14"] = {
            heading = 140,
            length = 0,
            width = 0,
            threshold = { lat = 37.81405833333333, lon = -116.78876944444444 },
            end = { lat = 37.81405833333333, lon = -116.78876944444444 }
        },
        ["RW32"] = {
            heading = 320,
            length = 0,
            width = 0,
            threshold = { lat = 37.783680555555556, lon = -116.77269722222222 },
            end = { lat = 37.783680555555556, lon = -116.77269722222222 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ESSAA1"] = {
            name = "ESSAA1",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 6600 },
                { name = "ESSAA", type = "E", altitude_max = 19000 },
                { name = "", type = "", altitude_min = 6800 },
                { name = "ESSAA", type = "E", altitude_max = 19000 },
            }
        },
        ["JAYSN1"] = {
            name = "JAYSN1",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 6600 },
                { name = "JAYSN", type = "E", altitude_max = 19000 },
                { name = "", type = "", altitude_min = 6800 },
                { name = "JAYSN", type = "E" },
            }
        },
        ["LEAHI1"] = {
            name = "LEAHI1",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 6600 },
                { name = "LEAHI", type = "E", altitude_max = 19000 },
                { name = "", type = "", altitude_min = 6800 },
                { name = "LEAHI", type = "E", altitude_max = 19000 },
            }
        },
        ["RANGE2"] = {
            name = "RANGE2",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 6500 },
                { name = "TPH", type = "D", altitude_min = 10000 },
                { name = "", type = "", altitude_min = 6500 },
                { name = "TPH", type = "D", altitude_min = 10000 },
            }
        },
        ["SILVR1"] = {
            name = "SILVR1",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 5950 },
                { name = "", type = "", altitude_min = 6500 },
                { name = "TPH", type = "D", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "TPH", type = "D", altitude_min = 10000 },
            }
        },
        ["STOFF2"] = {
            name = "STOFF2",
            runway = "RW14",
            waypoints = {
                { name = "", type = "" },
                { name = "STOFF", type = "E", altitude_min = 10000 },
                { name = "", type = "", altitude_min = 5950 },
                { name = "", type = "", speed = 300.0 },
                { name = "STOFF", type = "E", altitude_min = 10000 },
            }
        },
        ["TPH3"] = {
            name = "TPH3",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 6600 },
                { name = "TPH", type = "D", altitude_max = 19000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D14"] = {
            name = "D14",
            type = "A",
            runway = "D14",
            waypoints = {
                { name = "ROCEN", transition = "ROCEN", type = "K2", altitude_min = 11000 },
                { name = "COPAR", transition = "ROCEN", type = "K2", altitude_min = 9300 },
                { name = "TPH", transition = "TPH", type = "K2", altitude_min = 11000 },
                { name = "COPAR", transition = "TPH", type = "K2", altitude_min = 9300 },
                { name = "COPAR", transition = "", type = "K2", altitude_min = 9300 },
                { name = "LOZMO", transition = "", type = "K2", altitude_min = 7000 },
                { name = "HUGER", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 5950 },
                { name = "ROCEN", transition = "", type = "K2", altitude_min = 11000 },
                { name = "ROCEN", transition = "", type = "K2", altitude_max = 14000, speed = 310.0 },
            }
        },
        ["D14-Z"] = {
            name = "D14-Z",
            type = "A",
            runway = "D14-Z",
            waypoints = {
                { name = "LOZMO", transition = "LOZMO", type = "K2", altitude_min = 8800 },
                { name = "CF14", transition = "", type = "K2", altitude_min = 8800 },
                { name = "LOZMO", transition = "", type = "K2", altitude_min = 7300 },
                { name = "HUGER", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 5950 },
                { name = "TPH", transition = "", type = "K2" },
                { name = "TPH", transition = "", type = "K2", speed = 310.0 },
            }
        },
        ["D32"] = {
            name = "D32",
            type = "A",
            runway = "D32",
            waypoints = {
                { name = "HUBON", transition = "HUBON", type = "K2", altitude_min = 10400 },
                { name = "IRAVE", transition = "HUBON", type = "K2", altitude_min = 8700 },
                { name = "IRAVE", transition = "", type = "K2", altitude_min = 8700 },
                { name = "ITAVE", transition = "", type = "K2", altitude_min = 7400 },
                { name = "ITOGE", transition = "", type = "K2" },
                { name = "ROCEN", transition = "", type = "K2", altitude_min = 11000 },
                { name = "ROCEN", transition = "", type = "K2", altitude_max = 14000, speed = 310.0 },
            }
        },
        ["D32-Z"] = {
            name = "D32-Z",
            type = "A",
            runway = "D32-Z",
            waypoints = {
                { name = "TPH", transition = "TPH", type = "K2", altitude_min = 8800 },
                { name = "ITAVE", transition = "TPH", type = "K2", altitude_min = 8800 },
                { name = "ITAVE", transition = "TPH", type = "K2", altitude_min = 8800 },
                { name = "CF32", transition = "", type = "K2", altitude_min = 8800 },
                { name = "ITAVE", transition = "", type = "K2", altitude_min = 7400 },
                { name = "ITOGE", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 5950 },
                { name = "TPH", transition = "", type = "K2" },
                { name = "TPH", transition = "", type = "K2", speed = 310.0 },
            }
        },
        ["I14"] = {
            name = "I14",
            type = "A",
            runway = "I14",
            waypoints = {
                { name = "JADPU", transition = "JADPU", type = "K2", altitude_min = 11000 },
                { name = "JEPAR", transition = "JADPU", type = "K2", altitude_min = 9300 },
                { name = "TPH", transition = "TPH", type = "K2", altitude_min = 11000 },
                { name = "JEPAR", transition = "TPH", type = "K2", altitude_min = 9300 },
                { name = "JEPAR", transition = "", type = "K2" },
                { name = "JANAV", transition = "", type = "K2" },
                { name = "RW14", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 5950 },
                { name = "CIBMU", transition = "", type = "K2" },
                { name = "CIBMU", transition = "", type = "K2", speed = 310.0 },
            }
        },
        ["I32"] = {
            name = "I32",
            type = "A",
            runway = "I32",
            waypoints = {
                { name = "JESVO", transition = "JESVO", type = "K2", altitude_min = 10400 },
                { name = "JIREM", transition = "JESVO", type = "K2", altitude_min = 8700 },
                { name = "JIREM", transition = "", type = "K2" },
                { name = "DRAKO", transition = "", type = "K2" },
                { name = "RW32", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 5950 },
                { name = "ROCEN", transition = "", type = "K2", altitude_min = 11000 },
                { name = "ROCEN", transition = "", type = "K2", altitude_max = 14000, speed = 310.0 },
            }
        },
        ["R14"] = {
            name = "R14",
            type = "A",
            runway = "R14",
            waypoints = {
                { name = "TPH", transition = "TPH", type = "K2" },
                { name = "JEPAR", transition = "TPH", type = "K2", altitude_min = 9100 },
                { name = "JEPAR", transition = "", type = "K2", altitude_min = 9100 },
                { name = "JANAV", transition = "", type = "K2", altitude_min = 7500 },
                { name = "RW14", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 5950 },
                { name = "JADPU", transition = "", type = "K2" },
                { name = "JADPU", transition = "", type = "K2" },
            }
        },
        ["R32"] = {
            name = "R32",
            type = "A",
            runway = "R32",
            waypoints = {
                { name = "JESVO", transition = "JESVO", type = "K2" },
                { name = "JIREM", transition = "JESVO", type = "K2", altitude_min = 8700 },
                { name = "JIREM", transition = "", type = "K2", altitude_min = 8700 },
                { name = "DRAKO", transition = "", type = "K2", altitude_min = 7600 },
                { name = "RUDII", transition = "", type = "K2", altitude_min = 6700 },
                { name = "FALAK", transition = "", type = "K2", altitude_min = 6160 },
                { name = "RW32", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 5950 },
                { name = "ROCEN", transition = "", type = "K2" },
                { name = "ROCEN", transition = "", type = "K2" },
            }
        },
        ["T14"] = {
            name = "T14",
            type = "A",
            runway = "T14",
            waypoints = {
                { name = "ROCEN", transition = "ROCEN", type = "K2", altitude_min = 11000 },
                { name = "COPAR", transition = "ROCEN", type = "K2", altitude_min = 9300 },
                { name = "TPH", transition = "TPH", type = "K2", altitude_min = 11000 },
                { name = "COPAR", transition = "TPH", type = "K2", altitude_min = 9300 },
                { name = "COPAR", transition = "", type = "K2", altitude_min = 9300 },
                { name = "LOZMO", transition = "", type = "K2", altitude_min = 7000 },
                { name = "HUGER", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 5950 },
                { name = "ROCEN", transition = "", type = "K2", altitude_min = 11000 },
                { name = "ROCEN", transition = "", type = "K2", altitude_max = 14000, speed = 310.0 },
            }
        },
        ["T32"] = {
            name = "T32",
            type = "A",
            runway = "T32",
            waypoints = {
                { name = "HUBON", transition = "HUBON", type = "K2", altitude_min = 10400 },
                { name = "IRAVE", transition = "HUBON", type = "K2", altitude_min = 8700 },
                { name = "IRAVE", transition = "", type = "K2", altitude_min = 8700 },
                { name = "ITAVE", transition = "", type = "K2", altitude_min = 7400 },
                { name = "ITOGE", transition = "", type = "K2" },
                { name = "", transition = "", type = "", altitude_min = 5950 },
                { name = "ROCEN", transition = "", type = "K2", altitude_min = 11000 },
                { name = "ROCEN", transition = "", type = "K2", altitude_max = 14000, speed = 310.0 },
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
