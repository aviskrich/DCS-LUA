local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIKK",
        Name = "OIKK Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["CD16R"] = { lat = 27.354666667, lon = 33.712111111, type = "HEGN" },
        ["D257L"] = { lat = 50.6832, lon = -3.733088889, type = "EGTE" },
        ["FD16R"] = { lat = 27.276222222, lon = 33.749527778, type = "HEGN" },
        ["ALMEK"] = { lat = 29.788333333, lon = 56.847777778, type = "ENRT" },
        ["FF34L"] = { lat = 30.175958333, lon = 56.99705, type = "OIKK" },
        ["MD16R"] = { lat = 39.158447222, lon = 117.324644444, type = "ZBTJ" },
        ["CD34L"] = { lat = 26.978472222, lon = 33.822472222, type = "HEGN" },
        ["ALMOB"] = { lat = 30.576111111, lon = 56.473333333, type = "ENRT" },
        ["GETIS"] = { lat = 30.195833333, lon = 56.373888889, type = "ENRT" },
        ["D359T"] = { lat = 30.616777778, lon = 56.953708333, type = "OIKK" },
        ["ALKUL"] = { lat = 29.864444444, lon = 57.259722222, type = "ENRT" },
        ["ALKES"] = { lat = 30.179166667, lon = 57.506944444, type = "ENRT" },
        ["D099P"] = { lat = 30.906991667, lon = -6.596897222, type = "GMMZ" },
        ["D303P"] = { lat = 12.037111111, lon = -15.889861111, type = "GGOV" },
        ["D359P"] = { lat = 43.122275, lon = 132.197369444, type = "UHWW" },
        ["D303T"] = { lat = 30.478527778, lon = 56.629972222, type = "OIKK" },
        ["MD34L"] = { lat = 53.135152778, lon = 158.477030556, type = "UHPP" },
        ["D195L"] = { lat = 56.732655556, lon = 23.826908333, type = "EVRA" },
        ["D144P"] = { lat = 30.059791667, lon = 57.111913889, type = "OIKK" },
        ["FD34L"] = { lat = 27.0625, lon = 33.811472222, type = "HEGN" },
        ["ALGUV"] = { lat = 30.783888889, lon = 56.959444444, type = "ENRT" },
        ["D339T"] = { lat = 15.107663889, lon = -92.490877778, type = "MMTP" },
    },

    -- Данные ВПП
    Runways = {
        ["RW16L"] = {
            heading = 160,
            length = 80.0,
            width = 0,
            threshold = { lat = 30.28941388888889, lon = 56.94410833333333 },
            end = { lat = 30.277041616836517, lon = 56.94932338533982 }
        },
        ["RW16R"] = {
            heading = 160,
            length = 70.0,
            width = 0,
            threshold = { lat = 30.28870277777778, lon = 56.94208333333333 },
            end = { lat = 30.27787703973195, lon = 56.94664647075907 }
        },
        ["RW34L"] = {
            heading = 340,
            length = 0,
            width = 0,
            threshold = { lat = 30.257269444444443, lon = 56.956469444444444 },
            end = { lat = 30.257269444444443, lon = 56.956469444444444 }
        },
        ["RW34R"] = {
            heading = 340,
            length = 0,
            width = 0,
            threshold = { lat = 30.257130555555555, lon = 56.95888333333333 },
            end = { lat = 30.257130555555555, lon = 56.95888333333333 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ALGU1D"] = {
            name = "ALGU1D",
            runway = "RW34L",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "KER", type = "D", altitude_min = 8500 },
                { name = "", type = "" },
                { name = "ALGUV", type = "E" },
            }
        },
        ["ALGU1E"] = {
            name = "ALGU1E",
            runway = "RW16R",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "KER", type = "D", altitude_min = 7400 },
                { name = "KER", type = "D" },
                { name = "ALGUV", type = "E" },
            }
        },
        ["ALGU1G"] = {
            name = "ALGU1G",
            runway = "RW16R",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "KER", type = "D", speed = 200.0 },
                { name = "ALGUV", type = "E" },
            }
        },
        ["ALGU2F"] = {
            name = "ALGU2F",
            runway = "RW34L",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "", type = "", altitude_min = 8500 },
                { name = "KER", type = "D", altitude_min = 12000 },
                { name = "", type = "" },
                { name = "ALGUV", type = "E" },
            }
        },
        ["ALKE1D"] = {
            name = "ALKE1D",
            runway = "RW16R",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "KER", type = "D", altitude_min = 7400 },
                { name = "KER", type = "D", altitude_min = 9000 },
                { name = "", type = "" },
                { name = "ALKES", type = "E" },
            }
        },
        ["ALKE2C"] = {
            name = "ALKE2C",
            runway = "RW34L",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "", type = "", altitude_min = 8500 },
                { name = "KER", type = "D", altitude_min = 12000 },
                { name = "ALKES", type = "E" },
            }
        },
        ["ALKU1E"] = {
            name = "ALKU1E",
            runway = "RW16R",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "KER", type = "D", altitude_min = 7400 },
                { name = "KER", type = "D", altitude_min = 9000 },
                { name = "", type = "" },
                { name = "ALKUL", type = "E" },
            }
        },
        ["ALKU2D"] = {
            name = "ALKU2D",
            runway = "RW34L",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "", type = "", altitude_min = 8500 },
                { name = "KER", type = "D", altitude_min = 12000 },
                { name = "ALKUL", type = "E" },
            }
        },
        ["ALME1F"] = {
            name = "ALME1F",
            runway = "RW16R",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "KER", type = "D", altitude_min = 7400 },
                { name = "KER", type = "D" },
                { name = "", type = "" },
                { name = "ALMEK", type = "E" },
            }
        },
        ["ALME2C"] = {
            name = "ALME2C",
            runway = "RW34L",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "", type = "", altitude_min = 8500 },
                { name = "KER", type = "D", altitude_min = 12000 },
                { name = "ALMEK", type = "E" },
            }
        },
        ["ALMO1D"] = {
            name = "ALMO1D",
            runway = "RW34L",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "KER", type = "D", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "ALMOB", type = "E" },
            }
        },
        ["ALMO1E"] = {
            name = "ALMO1E",
            runway = "RW16R",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "KER", type = "D", altitude_min = 7400 },
                { name = "KER", type = "D", altitude_min = 9000 },
                { name = "ALMOB", type = "E" },
            }
        },
        ["ALMO2F"] = {
            name = "ALMO2F",
            runway = "RW34L",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "", type = "", altitude_min = 8500 },
                { name = "KER", type = "D", altitude_min = 12000 },
                { name = "ALMOB", type = "E" },
            }
        },
        ["GETI1E"] = {
            name = "GETI1E",
            runway = "RW16R",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "KER", type = "D", altitude_min = 7400 },
                { name = "KER", type = "D", altitude_min = 9000 },
                { name = "GETIS", type = "E" },
            }
        },
        ["GETI2C"] = {
            name = "GETI2C",
            runway = "RW34L",
            waypoints = {
                { name = "", type = "", altitude_min = 6140 },
                { name = "", type = "", altitude_min = 8500 },
                { name = "KER", type = "D", altitude_min = 12000 },
                { name = "GETIS", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ALGU1M"] = {
            name = "ALGU1M",
            runway = "RW16R",
            waypoints = {
                { name = "ALGUV", type = "OI" },
                { name = "D359P", type = "OI" },
                { name = "KER", type = "OI" },
                { name = "ALGUV", type = "OI" },
                { name = "D359P", type = "OI" },
                { name = "KER", type = "OI" },
            }
        },
        ["ALGU1R"] = {
            name = "ALGU1R",
            runway = "RW16R",
            waypoints = {
                { name = "ALGUV", type = "OI" },
                { name = "D359P", type = "OI" },
                { name = "KER", type = "OI" },
                { name = "D195L", type = "OI" },
                { name = "ALGUV", type = "OI" },
                { name = "D359P", type = "OI" },
                { name = "KER", type = "OI" },
                { name = "D195L", type = "OI" },
            }
        },
        ["ALGU1S"] = {
            name = "ALGU1S",
            runway = "RW16R",
            waypoints = {
                { name = "ALGUV", type = "OI" },
                { name = "D339T", type = "OI" },
                { name = "ALGUV", type = "OI" },
                { name = "D339T", type = "OI" },
            }
        },
        ["ALGU1U"] = {
            name = "ALGU1U",
            runway = "RW16R",
            waypoints = {
                { name = "ALGUV", type = "OI" },
                { name = "D359T", type = "OI" },
                { name = "D339T", type = "OI" },
                { name = "ALGUV", type = "OI" },
                { name = "D359T", type = "OI" },
                { name = "D339T", type = "OI" },
            }
        },
        ["ALKE1M"] = {
            name = "ALKE1M",
            runway = "RW16R",
            waypoints = {
                { name = "ALKES", type = "OI" },
                { name = "D099P", type = "OI" },
                { name = "KER", type = "OI" },
                { name = "ALKES", type = "OI" },
                { name = "D099P", type = "OI" },
                { name = "KER", type = "OI" },
            }
        },
        ["ALKU1M"] = {
            name = "ALKU1M",
            runway = "RW16R",
            waypoints = {
                { name = "ALKUL", type = "OI" },
                { name = "D144P", type = "OI" },
                { name = "KER", type = "OI" },
                { name = "ALKUL", type = "OI" },
                { name = "D144P", type = "OI" },
                { name = "KER", type = "OI" },
            }
        },
        ["ALME1M"] = {
            name = "ALME1M",
            runway = "RW16R",
            waypoints = {
                { name = "ALMEK", type = "OI" },
                { name = "KER", type = "OI" },
                { name = "ALMEK", type = "OI" },
                { name = "KER", type = "OI" },
            }
        },
        ["ALME1R"] = {
            name = "ALME1R",
            runway = "RW16R",
            waypoints = {
                { name = "ALMEK", type = "OI" },
                { name = "D195L", type = "OI" },
                { name = "ALMEK", type = "OI" },
                { name = "D195L", type = "OI" },
            }
        },
        ["ALMO1M"] = {
            name = "ALMO1M",
            runway = "RW16R",
            waypoints = {
                { name = "ALMOB", type = "OI" },
                { name = "D303P", type = "OI" },
                { name = "KER", type = "OI" },
                { name = "ALMOB", type = "OI" },
                { name = "D303P", type = "OI" },
                { name = "KER", type = "OI" },
            }
        },
        ["ALMO1R"] = {
            name = "ALMO1R",
            runway = "RW16R",
            waypoints = {
                { name = "ALMOB", type = "OI" },
                { name = "D303P", type = "OI" },
                { name = "KER", type = "OI" },
                { name = "D195L", type = "OI" },
                { name = "ALMOB", type = "OI" },
                { name = "D303P", type = "OI" },
                { name = "KER", type = "OI" },
                { name = "D195L", type = "OI" },
            }
        },
        ["ALMO1S"] = {
            name = "ALMO1S",
            runway = "RW16R",
            waypoints = {
                { name = "ALMOB", type = "OI" },
                { name = "D339T", type = "OI" },
                { name = "ALMOB", type = "OI" },
                { name = "D339T", type = "OI" },
            }
        },
        ["ALMO1U"] = {
            name = "ALMO1U",
            runway = "RW16R",
            waypoints = {
                { name = "ALMOB", type = "OI" },
                { name = "D303T", type = "OI" },
                { name = "D339T", type = "OI" },
                { name = "ALMOB", type = "OI" },
                { name = "D303T", type = "OI" },
                { name = "D339T", type = "OI" },
            }
        },
        ["GETI1M"] = {
            name = "GETI1M",
            runway = "RW16R",
            waypoints = {
                { name = "GETIS", type = "OI" },
                { name = "D257L", type = "OI" },
                { name = "KER", type = "OI" },
                { name = "GETIS", type = "OI" },
                { name = "D257L", type = "OI" },
                { name = "KER", type = "OI" },
            }
        },
        ["GETI1R"] = {
            name = "GETI1R",
            runway = "RW16R",
            waypoints = {
                { name = "GETIS", type = "OI" },
                { name = "D257L", type = "OI" },
                { name = "D195L", type = "OI" },
                { name = "GETIS", type = "OI" },
                { name = "D257L", type = "OI" },
                { name = "D195L", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D16RY"] = {
            name = "D16RY",
            type = "A",
            runway = "D16RY",
            waypoints = {
                { name = "KER", transition = "KER1", type = "OI", altitude_min = 12000 },
                { name = "KER", transition = "KER1", type = "OI" },
                { name = "CD16R", transition = "KER1", type = "OI" },
                { name = "KER", transition = "KER2", type = "OI", altitude_min = 12000 },
                { name = "KER", transition = "KER2", type = "OI" },
                { name = "CD16R", transition = "KER2", type = "OI" },
                { name = "CD16R", transition = "", type = "OI" },
                { name = "FD16R", transition = "", type = "OI", altitude_min = 7900 },
                { name = "MD16R", transition = "", type = "OI" },
                { name = "KER", transition = "", type = "OI" },
                { name = "KER", transition = "", type = "OI", altitude_min = 7400 },
                { name = "KER", transition = "", type = "OI" },
                { name = "D339T", transition = "", type = "OI", altitude_min = 13000 },
                { name = "D339T", transition = "", type = "OI", altitude_min = 13000, speed = 210.0 },
            }
        },
        ["D16RZ"] = {
            name = "D16RZ",
            type = "A",
            runway = "D16RZ",
            waypoints = {
                { name = "D339T", transition = "D339T", type = "OI", altitude_min = 13000 },
                { name = "CD16R", transition = "D339T", type = "OI", altitude_min = 9800 },
                { name = "CD16R", transition = "", type = "OI", altitude_min = 9800 },
                { name = "FD16R", transition = "", type = "OI", altitude_min = 7900 },
                { name = "MD16R", transition = "", type = "OI" },
                { name = "KER", transition = "", type = "OI" },
                { name = "KER", transition = "", type = "OI", altitude_min = 7400 },
                { name = "KER", transition = "", type = "OI" },
                { name = "D339T", transition = "", type = "OI", altitude_min = 13000 },
                { name = "D339T", transition = "", type = "OI", altitude_min = 13000, speed = 210.0 },
            }
        },
        ["D34LY"] = {
            name = "D34LY",
            type = "A",
            runway = "D34LY",
            waypoints = {
                { name = "KER", transition = "KER1", type = "OI", altitude_min = 12000 },
                { name = "KER", transition = "KER1", type = "OI", altitude_min = 8300 },
                { name = "FD34L", transition = "KER1", type = "OI", altitude_min = 8300 },
                { name = "KER", transition = "KER2", type = "OI", altitude_min = 12000 },
                { name = "KER", transition = "KER2", type = "OI", altitude_min = 8300 },
                { name = "FD34L", transition = "KER2", type = "OI", altitude_min = 8300 },
                { name = "FD34L", transition = "", type = "OI", altitude_min = 8300 },
                { name = "MD34L", transition = "", type = "OI" },
                { name = "KER", transition = "", type = "OI" },
                { name = "KER", transition = "", type = "OI", altitude_min = 7900 },
                { name = "KER", transition = "", type = "OI", altitude_min = 9400 },
                { name = "D195L", transition = "", type = "OI", altitude_min = 11000, speed = 185.0 },
                { name = "D195L", transition = "", type = "OI", altitude_max = 14000, speed = 230.0 },
            }
        },
        ["D34LZ"] = {
            name = "D34LZ",
            type = "A",
            runway = "D34LZ",
            waypoints = {
                { name = "D195L", transition = "D195L", type = "OI" },
                { name = "CD34L", transition = "D195L", type = "OI", altitude_min = 8400 },
                { name = "CD34L", transition = "", type = "OI", altitude_min = 8400 },
                { name = "FF34L", transition = "", type = "OI", altitude_min = 7500 },
                { name = "MD34L", transition = "", type = "OI" },
                { name = "KER", transition = "", type = "OI" },
                { name = "KER", transition = "", type = "OI", altitude_min = 7900 },
                { name = "KER", transition = "", type = "OI", altitude_min = 9400 },
                { name = "D195L", transition = "", type = "OI", altitude_min = 11000, speed = 185.0 },
                { name = "D195L", transition = "", type = "OI", altitude_max = 14000, speed = 230.0 },
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
