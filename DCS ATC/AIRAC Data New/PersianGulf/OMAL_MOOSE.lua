local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OMAL",
        Name = "OMAL Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["D186L"] = { lat = -26.348486111, lon = 28.275994444, type = "FAOR" },
        ["ITRAX"] = { lat = 24.213333333, lon = 55.796944444, type = "ENRT" },
        ["AL010"] = { lat = 24.329166667, lon = 55.729166667, type = "OMAL" },
        ["D274L"] = { lat = 48.745705556, lon = 1.523244444, type = "ENRT" },
        ["AL006"] = { lat = 46.184747222, lon = 80.895672222, type = "UAAL" },
        ["LABRI"] = { lat = 24.062222222, lon = 55.645, type = "ENRT" },
        ["MURGU"] = { lat = 24.536888889, lon = 56.055527778, type = "ENRT" },
        ["KANIP"] = { lat = 24.177777778, lon = 55.345, type = "ENRT" },
        ["D274J"] = { lat = 55.050555556, lon = 82.361111111, type = "UNNT" },
        ["GIDIS"] = { lat = 24.6, lon = 55.933333333, type = "ENRT" },
        ["RW19"] = { lat = 56.701191667, lon = 12.822197222, type = "ESMT" },
        ["AL005"] = { lat = 46.193933333, lon = 80.795786111, type = "UAAL" },
        ["CD19"] = { lat = 37.033141667, lon = 10.262975, type = "DTTA" },
        ["AL008"] = { lat = 62.596127778, lon = 6.347436111, type = "ENAL" },
        ["AL003"] = { lat = 46.219511111, lon = 80.512288889, type = "UAAL" },
        ["D274H"] = { lat = 40.677213889, lon = 17.778408333, type = "LIBR" },
        ["D178F"] = { lat = 24.181675, lon = 55.614805556, type = "OMAL" },
        ["AL009"] = { lat = 62.6179, lon = 6.20885, type = "ENAL" },
        ["PEDOG"] = { lat = 24.373722222, lon = 55.892694444, type = "ENRT" },
        ["D326J"] = { lat = 37.084683333, lon = 35.105377778, type = "LTAF" },
        ["AL011"] = { lat = 24.369444444, lon = 55.624472222, type = "OMAL" },
        ["D228L"] = { lat = 14.782908333, lon = -23.611963889, type = "GVNP" },
        ["FD01"] = { lat = 32.978241667, lon = 6.056547222, type = "DAUK" },
        ["21VOR"] = { lat = 56.503722222, lon = 21.023666667, type = "EVLA" },
        ["VAVIM"] = { lat = 24.25975, lon = 55.606361111, type = "ENRT" },
        ["50VOR"] = { lat = 35.396983333, lon = 4.272536111, type = "DAAD" },
        ["AL012"] = { lat = 24.520027778, lon = 55.645972222, type = "OMAL" },
        ["RETAS"] = { lat = 23.965, lon = 55.573055556, type = "ENRT" },
        ["ASVAD"] = { lat = 24.0975, lon = 55.585833333, type = "OMAL" },
        ["AL004"] = { lat = 46.206577778, lon = 80.656655556, type = "UAAL" },
        ["AL007"] = { lat = 46.297205556, lon = 80.769041667, type = "UAAL" },
        ["D008D"] = { lat = 24.339630556, lon = 55.625894444, type = "OMAL" },
        ["AL013"] = { lat = 24.155388889, lon = 55.594, type = "OMAL" },
        ["AL016"] = { lat = 24.06175, lon = 55.582916667, type = "OMAL" },
        ["RW01"] = { lat = 56.681002778, lon = 12.818208333, type = "ESMT" },
        ["FD19"] = { lat = 36.950513889, lon = 10.248472222, type = "DTTA" },
        ["FI01"] = { lat = 32.973705556, lon = 6.071855556, type = "DAUK" },
        ["D198L"] = { lat = 28.236186111, lon = -13.919277778, type = "GCFV" },
        ["AL002"] = { lat = 46.083461111, lon = 80.487238889, type = "UAAL" },
        ["ROVOS"] = { lat = 24.306944444, lon = 55.361944444, type = "ENRT" },
        ["AL001"] = { lat = 46.318666667, lon = 80.530627778, type = "UAAL" },
        ["CD01"] = { lat = -34.134094444, lon = 18.639916667, type = "FACT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW01"] = {
            heading = 10,
            length = 0,
            width = 0,
            threshold = { lat = 24.24376666666667, lon = 55.60658055555556 },
            end = { lat = 24.24376666666667, lon = 55.60658055555556 }
        },
        ["RW19"] = {
            heading = 190,
            length = 0,
            width = 0,
            threshold = { lat = 24.279627777777776, lon = 55.61168611111111 },
            end = { lat = 24.279627777777776, lon = 55.61168611111111 }
        },
    },

    -- Процедуры SID
    SID = {
        ["GIDI1H"] = {
            name = "GIDI1H",
            runway = "RW01",
            waypoints = {
                { name = "AL001", type = "P", altitude_min = 2500, speed = 240.0 },
                { name = "AL002", type = "P", altitude_min = 3500, speed = 240.0 },
                { name = "AL005", type = "P", altitude_min = 6000 },
                { name = "AL003", type = "P", speed = 255.0 },
                { name = "AL016", type = "P" },
                { name = "PEDOG", type = "E" },
                { name = "GIDIS", type = "E" },
            }
        },
        ["GIDI1J"] = {
            name = "GIDI1J",
            runway = "RW19",
            waypoints = {
                { name = "AL004", type = "P", altitude_min = 2500, speed = 240.0 },
                { name = "AL005", type = "P", altitude_min = 4900, speed = 240.0 },
                { name = "AL003", type = "P", speed = 255.0 },
                { name = "AL016", type = "P" },
                { name = "PEDOG", type = "E" },
                { name = "GIDIS", type = "E" },
            }
        },
        ["LABR2H"] = {
            name = "LABR2H",
            runway = "RW01",
            waypoints = {
                { name = "AL001", type = "P", altitude_min = 2500, speed = 240.0 },
                { name = "AL002", type = "P", altitude_min = 3500, speed = 240.0 },
                { name = "AL005", type = "P", altitude_min = 6000 },
                { name = "AL003", type = "P", speed = 255.0 },
                { name = "AL016", type = "P" },
                { name = "LABRI", type = "E", altitude_min = 7500 },
            }
        },
        ["LABR2J"] = {
            name = "LABR2J",
            runway = "RW19",
            waypoints = {
                { name = "AL004", type = "P", altitude_min = 2500, speed = 240.0 },
                { name = "AL005", type = "P", altitude_min = 4900, speed = 240.0 },
                { name = "AL003", type = "P", speed = 255.0 },
                { name = "AL016", type = "P" },
                { name = "LABRI", type = "E", altitude_min = 7500 },
            }
        },
        ["MURG1H"] = {
            name = "MURG1H",
            runway = "RW01",
            waypoints = {
                { name = "AL001", type = "P", altitude_min = 2500, speed = 240.0 },
                { name = "AL002", type = "P", altitude_min = 3500, speed = 240.0 },
                { name = "AL005", type = "P", altitude_min = 6000 },
                { name = "AL003", type = "P", speed = 255.0 },
                { name = "AL016", type = "P" },
                { name = "PEDOG", type = "E" },
                { name = "MURGU", type = "E" },
            }
        },
        ["MURG1J"] = {
            name = "MURG1J",
            runway = "RW19",
            waypoints = {
                { name = "AL004", type = "P", altitude_min = 2500, speed = 240.0 },
                { name = "AL005", type = "P", altitude_min = 4900, speed = 240.0 },
                { name = "AL003", type = "P", speed = 255.0 },
                { name = "AL016", type = "P" },
                { name = "PEDOG", type = "E" },
                { name = "MURGU", type = "E" },
            }
        },
        ["RETA2H"] = {
            name = "RETA2H",
            runway = "RW01",
            waypoints = {
                { name = "AL001", type = "P", altitude_min = 2500, speed = 240.0 },
                { name = "AL002", type = "P", altitude_min = 3500, speed = 240.0 },
                { name = "AL005", type = "P", altitude_min = 6000 },
                { name = "AL003", type = "P", speed = 255.0 },
                { name = "RETAS", type = "E", altitude_min = 7500 },
            }
        },
        ["RETA2J"] = {
            name = "RETA2J",
            runway = "RW19",
            waypoints = {
                { name = "AL004", type = "P", altitude_min = 2500, speed = 240.0 },
                { name = "AL005", type = "P", altitude_min = 4900, speed = 240.0 },
                { name = "AL003", type = "P", speed = 255.0 },
                { name = "RETAS", type = "E", altitude_min = 7500 },
            }
        },
        ["ROVO1H"] = {
            name = "ROVO1H",
            runway = "RW01",
            waypoints = {
                { name = "AL001", type = "P", altitude_min = 2500, speed = 240.0 },
                { name = "AL002", type = "P", altitude_min = 3500 },
                { name = "ROVOS", type = "E", altitude_min = 5500 },
            }
        },
        ["ROVO1J"] = {
            name = "ROVO1J",
            runway = "RW19",
            waypoints = {
                { name = "AL004", type = "P", altitude_min = 2500, speed = 240.0 },
                { name = "AL005", type = "P", altitude_min = 4900 },
                { name = "ROVOS", type = "E", altitude_min = 7000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["GIDI2K"] = {
            name = "GIDI2K",
            runway = "RW01",
            waypoints = {
                { name = "GIDIS", type = "OM", altitude_min = 8000 },
                { name = "VAVIM", type = "OM" },
                { name = "AL005", type = "OM", altitude_max = 5000 },
                { name = "AL003", type = "OM", altitude_min = 3500 },
                { name = "AL006", type = "OM" },
                { name = "ASVAD", type = "OM", altitude_min = 2500 },
            }
        },
        ["GIDI2L"] = {
            name = "GIDI2L",
            runway = "RW19",
            waypoints = {
                { name = "GIDIS", type = "OM", altitude_min = 8000 },
                { name = "AL009", type = "OM", altitude_min = 3500 },
                { name = "AL008", type = "OM", altitude_min = 2500, speed = 230.0 },
            }
        },
        ["ITRA1K"] = {
            name = "ITRA1K",
            runway = "RW01",
            waypoints = {
                { name = "ITRAX", type = "OO", altitude_min = 8000 },
                { name = "AL005", type = "OM", altitude_max = 5000 },
                { name = "AL003", type = "OM", altitude_min = 3500 },
                { name = "AL006", type = "OM" },
                { name = "ASVAD", type = "OM", altitude_min = 2500 },
            }
        },
        ["ITRA2L"] = {
            name = "ITRA2L",
            runway = "RW19",
            waypoints = {
                { name = "ITRAX", type = "OO", altitude_min = 8000 },
                { name = "AL002", type = "OM", altitude_min = 4500 },
                { name = "AL007", type = "OM", altitude_min = 3500 },
                { name = "AL008", type = "OM", altitude_min = 2500, speed = 230.0 },
            }
        },
        ["ITRA2M"] = {
            name = "ITRA2M",
            runway = "RW19",
            waypoints = {
                { name = "ITRAX", type = "OO", altitude_min = 8000 },
                { name = "AL010", type = "OM", altitude_min = 4500 },
                { name = "AL009", type = "OM", altitude_min = 3500 },
                { name = "AL008", type = "OM", altitude_min = 2500, speed = 230.0 },
            }
        },
        ["KANI1K"] = {
            name = "KANI1K",
            runway = "RW01",
            waypoints = {
                { name = "KANIP", type = "OM", altitude_min = 5000, altitude_max = 9000 },
                { name = "AL005", type = "OM", altitude_max = 5000 },
                { name = "AL003", type = "OM", altitude_min = 3500 },
                { name = "AL006", type = "OM" },
                { name = "ASVAD", type = "OM", altitude_min = 2500 },
            }
        },
        ["KANI2L"] = {
            name = "KANI2L",
            runway = "RW19",
            waypoints = {
                { name = "KANIP", type = "OM", altitude_min = 5000, altitude_max = 9000 },
                { name = "AL002", type = "OM", altitude_min = 4500 },
                { name = "AL007", type = "OM", altitude_min = 3500 },
                { name = "AL008", type = "OM", altitude_min = 2500, speed = 230.0 },
            }
        },
        ["ROVO2K"] = {
            name = "ROVO2K",
            runway = "RW01",
            waypoints = {
                { name = "ROVOS", type = "OM", altitude_min = 5000, altitude_max = 9000 },
                { name = "AL005", type = "OM", altitude_max = 5000 },
                { name = "AL003", type = "OM", altitude_min = 3500 },
                { name = "AL006", type = "OM" },
                { name = "ASVAD", type = "OM", altitude_min = 2500 },
            }
        },
        ["ROVO3L"] = {
            name = "ROVO3L",
            runway = "RW19",
            waypoints = {
                { name = "ROVOS", type = "OM", altitude_min = 5000, altitude_max = 9000 },
                { name = "AL002", type = "OM", altitude_min = 4500 },
                { name = "AL007", type = "OM", altitude_min = 3500 },
                { name = "AL008", type = "OM", altitude_min = 2500, speed = 230.0 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D01-Y"] = {
            name = "D01-Y",
            type = "A",
            runway = "D01-Y",
            waypoints = {
                { name = "ALA", transition = "ALA", type = "OM" },
                { name = "D274J", transition = "ALA", type = "OM" },
                { name = "D274L", transition = "ALA", type = "OM" },
                { name = "D228L", transition = "ALA", type = "OM", altitude_min = 6000 },
                { name = "D198L", transition = "ALA", type = "OM", altitude_min = 2500 },
                { name = "CD01", transition = "ALA", type = "OM", altitude_min = 2500 },
                { name = "ROVOS", transition = "ROVOS", type = "OM" },
                { name = "", transition = "ROVOS", type = "" },
                { name = "D228L", transition = "ROVOS", type = "OM", altitude_min = 6000 },
                { name = "D198L", transition = "ROVOS", type = "OM", altitude_min = 2500 },
                { name = "CD01", transition = "ROVOS", type = "OM", altitude_min = 2500 },
                { name = "CD01", transition = "", type = "OM", altitude_min = 2500 },
                { name = "FD01", transition = "", type = "OM", altitude_min = 2500 },
                { name = "50VOR", transition = "", type = "OM", altitude_min = 1770 },
                { name = "RW01", transition = "", type = "OM" },
                { name = "ALA", transition = "", type = "OM" },
                { name = "D008D", transition = "", type = "OM" },
                { name = "", transition = "", type = "", speed = 230.0 },
                { name = "ROVOS", transition = "", type = "OM" },
                { name = "ROVOS", transition = "", type = "OM", altitude_min = 6000, speed = 230.0 },
            }
        },
        ["D01-Z"] = {
            name = "D01-Z",
            type = "A",
            runway = "D01-Z",
            waypoints = {
                { name = "ALA", transition = "ALA1", type = "OM", altitude_min = 5000, speed = 200.0 },
                { name = "ALA", transition = "ALA1", type = "OM", altitude_min = 2500 },
                { name = "CD01", transition = "ALA1", type = "OM", altitude_min = 2500 },
                { name = "ALA", transition = "ALA2", type = "OM", altitude_min = 5000 },
                { name = "ALA", transition = "ALA2", type = "OM", altitude_min = 2500 },
                { name = "CD01", transition = "ALA2", type = "OM", altitude_min = 2500 },
                { name = "CD01", transition = "", type = "OM", altitude_min = 2500 },
                { name = "FD01", transition = "", type = "OM", altitude_min = 2500 },
                { name = "50VOR", transition = "", type = "OM", altitude_min = 1770 },
                { name = "RW01", transition = "", type = "OM" },
                { name = "ALA", transition = "", type = "OM" },
                { name = "D008D", transition = "", type = "OM" },
                { name = "ALA", transition = "", type = "OM", speed = 230.0 },
                { name = "ALA", transition = "", type = "OM", altitude_min = 5000 },
            }
        },
        ["D19-Y"] = {
            name = "D19-Y",
            type = "A",
            runway = "D19-Y",
            waypoints = {
                { name = "ALA", transition = "ALA", type = "OM" },
                { name = "D274H", transition = "ALA", type = "OM" },
                { name = "D274J", transition = "ALA", type = "OM" },
                { name = "D326J", transition = "ALA", type = "OM", altitude_min = 5000 },
                { name = "CD19", transition = "ALA", type = "OM", altitude_min = 2500 },
                { name = "ROVOS", transition = "ROVOS", type = "OM" },
                { name = "D274L", transition = "ROVOS", type = "OM" },
                { name = "D274J", transition = "ROVOS", type = "OM" },
                { name = "D326J", transition = "ROVOS", type = "OM", altitude_min = 5000 },
                { name = "CD19", transition = "ROVOS", type = "OM", altitude_min = 2500 },
                { name = "CD19", transition = "", type = "OM", altitude_min = 2500 },
                { name = "FD19", transition = "", type = "OM", altitude_min = 2500 },
                { name = "21VOR", transition = "", type = "OM", altitude_min = 1600 },
                { name = "ALA", transition = "", type = "OM" },
                { name = "D178F", transition = "", type = "OM" },
                { name = "", transition = "", type = "", speed = 230.0 },
                { name = "ROVOS", transition = "", type = "OM" },
                { name = "ROVOS", transition = "", type = "OM", altitude_min = 6000, speed = 230.0 },
            }
        },
        ["D19-Z"] = {
            name = "D19-Z",
            type = "A",
            runway = "D19-Z",
            waypoints = {
                { name = "ALA", transition = "ALA1", type = "OM", altitude_min = 5000, speed = 220.0 },
                { name = "ALA", transition = "ALA1", type = "OM", altitude_min = 2500 },
                { name = "CD19", transition = "ALA1", type = "OM", altitude_min = 2500 },
                { name = "ALA", transition = "ALA2", type = "OM", altitude_min = 5000 },
                { name = "ALA", transition = "ALA2", type = "OM", altitude_min = 2500 },
                { name = "CD19", transition = "ALA2", type = "OM", altitude_min = 2500 },
                { name = "CD19", transition = "", type = "OM", altitude_min = 2500 },
                { name = "FD19", transition = "", type = "OM", altitude_min = 2500 },
                { name = "21VOR", transition = "", type = "OM", altitude_min = 1600 },
                { name = "ALA", transition = "", type = "OM" },
                { name = "D178F", transition = "", type = "OM" },
                { name = "ALA", transition = "", type = "OM", speed = 230.0 },
                { name = "ALA", transition = "", type = "OM", altitude_min = 5000, speed = 230.0 },
            }
        },
        ["I01-Y"] = {
            name = "I01-Y",
            type = "A",
            runway = "I01-Y",
            waypoints = {
                { name = "ALA", transition = "ALA", type = "OM", altitude_min = 6000 },
                { name = "ALA", transition = "ALA", type = "OM" },
                { name = "D274L", transition = "ALA", type = "OM" },
                { name = "D228L", transition = "ALA", type = "OM", altitude_min = 6000 },
                { name = "D186L", transition = "ALA", type = "OM", altitude_min = 2500 },
                { name = "ASVAD", transition = "ALA", type = "OM", altitude_min = 2500 },
                { name = "ROVOS", transition = "ROVOS", type = "OM" },
                { name = "", transition = "ROVOS", type = "" },
                { name = "D228L", transition = "ROVOS", type = "OM", altitude_min = 6000 },
                { name = "D186L", transition = "ROVOS", type = "OM", altitude_min = 2500 },
                { name = "ASVAD", transition = "ROVOS", type = "OM", altitude_min = 2500 },
                { name = "ASVAD", transition = "", type = "OM" },
                { name = "FI01", transition = "", type = "OM" },
                { name = "RW01", transition = "", type = "OM" },
                { name = "RW01", transition = "", type = "OM" },
                { name = "", transition = "", type = "", speed = 230.0 },
                { name = "ROVOS", transition = "", type = "OM" },
                { name = "ROVOS", transition = "", type = "OM", altitude_min = 6000, speed = 230.0 },
            }
        },
        ["I01-Z"] = {
            name = "I01-Z",
            type = "A",
            runway = "I01-Z",
            waypoints = {
                { name = "ALA", transition = "ALA1", type = "OM", altitude_min = 5000, speed = 200.0 },
                { name = "ALA", transition = "ALA1", type = "OM", altitude_min = 2500 },
                { name = "ASVAD", transition = "ALA1", type = "OM", altitude_min = 2500 },
                { name = "ALA", transition = "ALA2", type = "OM", altitude_min = 5000 },
                { name = "ALA", transition = "ALA2", type = "OM", altitude_min = 2500 },
                { name = "ASVAD", transition = "ALA2", type = "OM", altitude_min = 2500 },
                { name = "ASVAD", transition = "", type = "OM" },
                { name = "FI01", transition = "", type = "OM" },
                { name = "RW01", transition = "", type = "OM" },
                { name = "RW01", transition = "", type = "OM" },
                { name = "ALA", transition = "", type = "OM", speed = 230.0 },
                { name = "ALA", transition = "", type = "OM", altitude_min = 5000 },
            }
        },
        ["R01"] = {
            name = "R01",
            type = "A",
            runway = "R01",
            waypoints = {
                { name = "ASVAD", transition = "ASVAD", type = "OM", altitude_min = 2500 },
                { name = "AL013", transition = "ASVAD", type = "OM" },
                { name = "AL013", transition = "", type = "OM" },
                { name = "RW01", transition = "", type = "OM" },
                { name = "AL001", transition = "", type = "OM" },
                { name = "AL002", transition = "", type = "OM", altitude_min = 2500, speed = 230.0 },
                { name = "ROVOS", transition = "", type = "OM", altitude_min = 4000 },
                { name = "ROVOS", transition = "", type = "OM", altitude_min = 4000, speed = 230.0 },
            }
        },
        ["R19"] = {
            name = "R19",
            type = "A",
            runway = "R19",
            waypoints = {
                { name = "AL007", transition = "AL007", type = "OM", altitude_min = 3500 },
                { name = "AL008", transition = "AL007", type = "OM", altitude_min = 2500, speed = 230.0 },
                { name = "AL009", transition = "AL009", type = "OM", altitude_min = 3500 },
                { name = "AL008", transition = "AL009", type = "OM", altitude_min = 2500, speed = 230.0 },
                { name = "AL012", transition = "AL012", type = "OM", altitude_min = 5500 },
                { name = "AL008", transition = "AL012", type = "OM", altitude_min = 2500, speed = 230.0 },
                { name = "AL008", transition = "", type = "OM", altitude_min = 2500 },
                { name = "AL011", transition = "", type = "OM" },
                { name = "RW19", transition = "", type = "OM" },
                { name = "AL004", transition = "", type = "OM" },
                { name = "AL005", transition = "", type = "OM", altitude_min = 2500, speed = 240.0 },
                { name = "ROVOS", transition = "", type = "OM", altitude_min = 4000 },
                { name = "ROVOS", transition = "", type = "OM", altitude_min = 4000, speed = 230.0 },
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
