local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LCPH",
        Name = "LCPH Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["PH960"] = { lat = 34.691858333, lon = 32.571152778, type = "LCPH" },
        ["RIMEX"] = { lat = 34.678947222, lon = 33.374319444, type = "ENRT" },
        ["PH966"] = { lat = 34.69015, lon = 32.411069444, type = "LCPH" },
        ["D118I"] = { lat = 54.503, lon = 18.7079, type = "EPOK" },
        ["PH702"] = { lat = 34.780805556, lon = 32.278258333, type = "LCPH" },
        ["PH710"] = { lat = 34.705752778, lon = 32.525766667, type = "LCPH" },
        ["D198I"] = { lat = 34.573447222, lon = 32.434855556, type = "LCPH" },
        ["GENOS"] = { lat = 34.678888889, lon = 31.901111111, type = "ENRT" },
        ["PH800"] = { lat = 34.734847222, lon = 32.429933333, type = "LCPH" },
        ["PH968"] = { lat = 34.569852778, lon = 32.526702778, type = "LCPH" },
        ["35VOR"] = { lat = 9.565338889, lon = -7.526580556, type = "DIOD" },
        ["PH904"] = { lat = 34.665733333, lon = 32.656683333, type = "LCPH" },
        ["DIPOS"] = { lat = 34.756666667, lon = 32.803333333, type = "ENRT" },
        ["PH401"] = { lat = 34.632777778, lon = 32.389444444, type = "LCPH" },
        ["FD29"] = { lat = 6.170194444, lon = 6.769363889, type = "DNAS" },
        ["GIPRO"] = { lat = 34.688080556, lon = 33.148463889, type = "ENRT" },
        ["RW29"] = { lat = -34.005188889, lon = 22.389325, type = "FAGG" },
        ["PH930"] = { lat = 34.585505556, lon = 32.660138889, type = "LCPH" },
        ["PH962"] = { lat = 34.660413889, lon = 32.594125, type = "LCPH" },
        ["CD29"] = { lat = 36.773597222, lon = 10.437925, type = "DTTA" },
        ["CD11"] = { lat = 35.562533333, lon = 7.860733333, type = "DABS" },
        ["CI29"] = { lat = 36.780425, lon = 10.440847222, type = "DTTA" },
        ["FI29"] = { lat = 36.802141667, lon = 10.373861111, type = "DTTA" },
        ["PH931"] = { lat = 34.564797222, lon = 32.605005556, type = "LCPH" },
        ["PH901"] = { lat = 34.677319444, lon = 32.618780556, type = "LCPH" },
        ["PH963"] = { lat = 34.603177778, lon = 32.580680556, type = "LCPH" },
        ["IVETI"] = { lat = 34.741944444, lon = 32.704722222, type = "ENRT" },
        ["PH910"] = { lat = 34.591844444, lon = 32.604602778, type = "LCPH" },
        ["PH940"] = { lat = 34.805277778, lon = 32.338333333, type = "LCPH" },
        ["ESERI"] = { lat = 34.481988889, lon = 32.385461111, type = "ENRT" },
        ["ENIAS"] = { lat = 34.674013889, lon = 32.486516667, type = "LCPH" },
        ["PH400"] = { lat = 34.700277778, lon = 32.543888889, type = "LCPH" },
        ["PH952"] = { lat = 34.74735, lon = 32.951252778, type = "LCPH" },
        ["FD11"] = { lat = 35.500763889, lon = 7.982069444, type = "DABS" },
        ["PH950"] = { lat = 34.671911111, lon = 32.7427, type = "LCPH" },
        ["PH965"] = { lat = 34.607147222, lon = 32.512175, type = "LCPH" },
        ["NIMSI"] = { lat = 34.660277778, lon = 32.168055556, type = "ENRT" },
        ["TOBAL"] = { lat = 34.925, lon = 32.123333333, type = "ENRT" },
        ["DER29"] = { lat = 67.469686111, lon = 33.562738889, type = "ULMK" },
        ["PH953"] = { lat = 34.675527778, lon = 32.823411111, type = "LCPH" },
        ["30VOR"] = { lat = 35.37105, lon = 4.246863889, type = "DAAD" },
        ["PH701"] = { lat = 34.751483333, lon = 32.375119444, type = "LCPH" },
        ["KURSA"] = { lat = 40.8, lon = 73.05, type = "UCFO" },
        ["ADUNI"] = { lat = 34.718097222, lon = 32.250441667, type = "ENRT" },
        ["PH951"] = { lat = 34.698744444, lon = 32.816725, type = "LCPH" },
        ["NORDI"] = { lat = 34.796666667, lon = 33.088333333, type = "ENRT" },
    },

    -- Данные ВПП
    Runways = {
        ["RW11"] = {
            heading = 110,
            length = 0,
            width = 0,
            threshold = { lat = 34.72235833333333, lon = 32.47100277777778 },
            end = { lat = 34.72235833333333, lon = 32.47100277777778 }
        },
        ["RW29"] = {
            heading = 290,
            length = 100.0,
            width = 0,
            threshold = { lat = 34.71393888888889, lon = 32.498675 },
            end = { lat = 34.71956781233553, lon = 32.479860844086076 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ESER1C"] = {
            name = "ESER1C",
            runway = "RW11",
            waypoints = {
                { name = "PH400", type = "P", altitude_min = 500 },
                { name = "", type = "", speed = 210.0 },
                { name = "ESERI", type = "E", altitude_min = 4000 },
            }
        },
        ["ESER1D"] = {
            name = "ESER1D",
            runway = "RW29",
            waypoints = {
                { name = "PH800", type = "P", altitude_min = 500 },
                { name = "", type = "", speed = 210.0 },
                { name = "ESERI", type = "E", altitude_min = 4000 },
            }
        },
        ["ESER1R"] = {
            name = "ESER1R",
            runway = "RW11",
            waypoints = {
                { name = "PH400", type = "P", altitude_min = 550 },
                { name = "ESERI", type = "E", altitude_min = 4000 },
            }
        },
        ["ESER1W"] = {
            name = "ESER1W",
            runway = "RW29",
            waypoints = {
                { name = "DER29", type = "P" },
                { name = "", type = "", altitude_min = 500 },
                { name = "ESERI", type = "E", altitude_min = 4000 },
            }
        },
        ["GENO1C"] = {
            name = "GENO1C",
            runway = "RW11",
            waypoints = {
                { name = "PH400", type = "P", altitude_min = 500 },
                { name = "", type = "", speed = 210.0 },
                { name = "GENOS", type = "E", altitude_min = 4000 },
            }
        },
        ["GENO1D"] = {
            name = "GENO1D",
            runway = "RW29",
            waypoints = {
                { name = "PH800", type = "P", altitude_min = 500 },
                { name = "GENOS", type = "E", altitude_min = 4000 },
            }
        },
        ["GENO1R"] = {
            name = "GENO1R",
            runway = "RW11",
            waypoints = {
                { name = "PH400", type = "P", altitude_min = 550 },
                { name = "PH401", type = "P", speed = 230.0 },
                { name = "NIMSI", type = "E" },
                { name = "GENOS", type = "E", altitude_min = 4000 },
            }
        },
        ["GENO1W"] = {
            name = "GENO1W",
            runway = "RW29",
            waypoints = {
                { name = "DER29", type = "P" },
                { name = "", type = "", altitude_min = 500 },
                { name = "NIMSI", type = "E" },
                { name = "GENOS", type = "E", altitude_min = 4000 },
            }
        },
        ["GIPR1C"] = {
            name = "GIPR1C",
            runway = "RW11",
            waypoints = {
                { name = "PH400", type = "P", altitude_min = 500 },
                { name = "PHA", type = "D", altitude_min = 4000, speed = 210.0 },
                { name = "KURSA", type = "E", altitude_min = 5000 },
                { name = "GIPRO", type = "E", altitude_min = 5000 },
            }
        },
        ["GIPR1D"] = {
            name = "GIPR1D",
            runway = "RW29",
            waypoints = {
                { name = "PH800", type = "P", altitude_min = 500 },
                { name = "PHA", type = "D", altitude_min = 4000, speed = 210.0 },
                { name = "KURSA", type = "E", altitude_min = 5000 },
                { name = "GIPRO", type = "E", altitude_min = 5000 },
            }
        },
        ["NORD1C"] = {
            name = "NORD1C",
            runway = "RW11",
            waypoints = {
                { name = "PH400", type = "P", altitude_min = 500 },
                { name = "PHA", type = "D", altitude_min = 4000, speed = 210.0 },
                { name = "IVETI", type = "E", altitude_min = 6000 },
                { name = "DIPOS", type = "E", altitude_min = 7000 },
                { name = "NORDI", type = "E", altitude_min = 8000 },
            }
        },
        ["NORD1D"] = {
            name = "NORD1D",
            runway = "RW29",
            waypoints = {
                { name = "PH800", type = "P", altitude_min = 500 },
                { name = "PHA", type = "D", altitude_min = 4000, speed = 210.0 },
                { name = "IVETI", type = "E", altitude_min = 6000 },
                { name = "DIPOS", type = "E", altitude_min = 7000 },
                { name = "NORDI", type = "E", altitude_min = 8000 },
            }
        },
        ["NORD1R"] = {
            name = "NORD1R",
            runway = "RW11",
            waypoints = {
                { name = "PH901", type = "P", altitude_min = 1800 },
                { name = "PH950", type = "P", altitude_min = 3600, speed = 210.0 },
                { name = "PH951", type = "P", altitude_min = 5000 },
                { name = "NORDI", type = "E", altitude_min = 7000 },
            }
        },
        ["NORD1W"] = {
            name = "NORD1W",
            runway = "RW29",
            waypoints = {
                { name = "DER29", type = "P" },
                { name = "", type = "", altitude_min = 500 },
                { name = "PH965", type = "P", altitude_min = 3000 },
                { name = "PH951", type = "P", altitude_min = 5000 },
                { name = "NORDI", type = "E", altitude_min = 7000 },
            }
        },
        ["RIME1R"] = {
            name = "RIME1R",
            runway = "RW11",
            waypoints = {
                { name = "PH901", type = "P", altitude_min = 1800 },
                { name = "PH950", type = "P", altitude_min = 3600, speed = 210.0 },
                { name = "PH953", type = "P", altitude_min = 5000 },
                { name = "GIPRO", type = "E", altitude_min = 5000 },
                { name = "RIMEX", type = "E", altitude_min = 5000 },
            }
        },
        ["RIME1W"] = {
            name = "RIME1W",
            runway = "RW29",
            waypoints = {
                { name = "DER29", type = "P" },
                { name = "", type = "", altitude_min = 500 },
                { name = "PH965", type = "P", altitude_min = 3000 },
                { name = "PH953", type = "P", altitude_min = 5000 },
                { name = "GIPRO", type = "E", altitude_min = 5000 },
                { name = "RIMEX", type = "E", altitude_min = 5000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["GIPR1A"] = {
            name = "GIPR1A",
            runway = "ALL",
            waypoints = {
                { name = "GIPRO", type = "LC", altitude_min = 5000 },
                { name = "KURSA", type = "LC", altitude_min = 5000 },
                { name = "PHA", type = "LC", altitude_min = 4000 },
            }
        },
        ["NORD1A"] = {
            name = "NORD1A",
            runway = "ALL",
            waypoints = {
                { name = "NORDI", type = "LC", altitude_min = 7000 },
                { name = "DIPOS", type = "LC", altitude_min = 6000 },
                { name = "IVETI", type = "LC", altitude_min = 5000 },
                { name = "PHA", type = "LC", altitude_min = 4000 },
            }
        },
        ["NORD1T"] = {
            name = "NORD1T",
            runway = "ALL",
            waypoints = {
                { name = "NORDI", type = "LC", altitude_min = 7000 },
                { name = "DIPOS", type = "LC", altitude_min = 6000 },
                { name = "IVETI", type = "LC", altitude_min = 5000 },
                { name = "PHA", type = "LC", altitude_min = 4000 },
            }
        },
        ["TOBA1T"] = {
            name = "TOBA1T",
            runway = "ALL",
            waypoints = {
                { name = "TOBAL", type = "LC", altitude_min = 6000 },
                { name = "PH940", type = "LC", altitude_min = 5000 },
                { name = "PHA", type = "LC", altitude_min = 4000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D11-S"] = {
            name = "D11-S",
            type = "A",
            runway = "D11-S",
            waypoints = {
                { name = "TOBAL", transition = "TOBAL", type = "LC", altitude_min = 4000 },
                { name = "CD11", transition = "TOBAL", type = "LC", altitude_min = 1700 },
                { name = "CD11", transition = "", type = "LC", altitude_min = 1700 },
                { name = "FD11", transition = "", type = "LC" },
                { name = "35VOR", transition = "", type = "LC" },
                { name = "RW11", transition = "", type = "LC" },
                { name = "PHA", transition = "", type = "LC" },
                { name = "", transition = "", type = "" },
                { name = "ESERI", transition = "", type = "LC", altitude_min = 2000, speed = 210.0 },
            }
        },
        ["D11-X"] = {
            name = "D11-X",
            type = "A",
            runway = "D11-X",
            waypoints = {
                { name = "PHA", transition = "PHA1", type = "LC", altitude_min = 4000 },
                { name = "PHA", transition = "PHA1", type = "LC", altitude_min = 1700 },
                { name = "CD11", transition = "PHA1", type = "LC", altitude_min = 1700 },
                { name = "PHA", transition = "PHA2", type = "LC", altitude_min = 4000 },
                { name = "PHA", transition = "PHA2", type = "LC", altitude_min = 1700 },
                { name = "CD11", transition = "PHA2", type = "LC", altitude_min = 1700 },
                { name = "CD11", transition = "", type = "LC", altitude_min = 1700 },
                { name = "FD11", transition = "", type = "LC" },
                { name = "35VOR", transition = "", type = "LC" },
                { name = "RW11", transition = "", type = "LC" },
                { name = "PHA", transition = "", type = "LC" },
                { name = "", transition = "", type = "" },
                { name = "ESERI", transition = "", type = "LC", altitude_min = 2000, speed = 210.0 },
            }
        },
        ["D11-Z"] = {
            name = "D11-Z",
            type = "A",
            runway = "D11-Z",
            waypoints = {
                { name = "ESERI", transition = "ESERI", type = "LC", altitude_min = 4000 },
                { name = "", transition = "ESERI", type = "" },
                { name = "CD11", transition = "ESERI", type = "LC", altitude_min = 1700 },
                { name = "CD11", transition = "", type = "LC", altitude_min = 1700 },
                { name = "FD11", transition = "", type = "LC" },
                { name = "35VOR", transition = "", type = "LC" },
                { name = "RW11", transition = "", type = "LC" },
                { name = "PHA", transition = "", type = "LC" },
                { name = "", transition = "", type = "" },
                { name = "ESERI", transition = "", type = "LC", altitude_min = 2000, speed = 210.0 },
            }
        },
        ["D29-X"] = {
            name = "D29-X",
            type = "A",
            runway = "D29-X",
            waypoints = {
                { name = "PHA", transition = "PHA1", type = "LC", altitude_min = 4000, speed = 210.0 },
                { name = "PHA", transition = "PHA1", type = "LC", altitude_min = 2500 },
                { name = "CD29", transition = "PHA1", type = "LC", altitude_min = 2500 },
                { name = "PHA", transition = "PHA2", type = "LC", altitude_min = 4000 },
                { name = "PHA", transition = "PHA2", type = "LC", altitude_min = 2500 },
                { name = "CD29", transition = "PHA2", type = "LC", altitude_min = 2500 },
                { name = "CD29", transition = "", type = "LC", altitude_min = 2500 },
                { name = "FD29", transition = "", type = "LC" },
                { name = "30VOR", transition = "", type = "LC" },
                { name = "RW29", transition = "", type = "LC" },
                { name = "RW29", transition = "", type = "LC" },
                { name = "", transition = "", type = "" },
                { name = "ESERI", transition = "", type = "LC", altitude_min = 2000, speed = 210.0 },
            }
        },
        ["D29-Y"] = {
            name = "D29-Y",
            type = "A",
            runway = "D29-Y",
            waypoints = {
                { name = "ESERI", transition = "ESERI", type = "LC", altitude_min = 4000 },
                { name = "D198I", transition = "ESERI", type = "LC", altitude_min = 3000 },
                { name = "CD29", transition = "ESERI", type = "LC", altitude_min = 2100 },
                { name = "CD29", transition = "", type = "LC", altitude_min = 2100 },
                { name = "FD29", transition = "", type = "LC" },
                { name = "30VOR", transition = "", type = "LC" },
                { name = "RW29", transition = "", type = "LC" },
                { name = "RW29", transition = "", type = "LC" },
                { name = "", transition = "", type = "" },
                { name = "ESERI", transition = "", type = "LC", altitude_min = 2000, speed = 210.0 },
            }
        },
        ["I29-P"] = {
            name = "I29-P",
            type = "A",
            runway = "I29-P",
            waypoints = {
                { name = "ESERI", transition = "ESERI", type = "LC", altitude_min = 4000 },
                { name = "PH931", transition = "ESERI", type = "LC", altitude_min = 3000 },
                { name = "PH930", transition = "ESERI", type = "LC", altitude_min = 3000, speed = 220.0 },
                { name = "PH904", transition = "ESERI", type = "LC", altitude_min = 2100 },
                { name = "GIPRO", transition = "GIPRO", type = "LC", altitude_min = 5000 },
                { name = "PH953", transition = "GIPRO", type = "LC", altitude_min = 4000 },
                { name = "PH950", transition = "GIPRO", type = "LC", altitude_min = 3000 },
                { name = "PH904", transition = "GIPRO", type = "LC", altitude_min = 2100 },
                { name = "NORDI", transition = "NORDI", type = "LC", altitude_min = 7000 },
                { name = "PH952", transition = "NORDI", type = "LC", altitude_min = 5500 },
                { name = "PH951", transition = "NORDI", type = "LC", altitude_min = 4000 },
                { name = "PH950", transition = "NORDI", type = "LC", altitude_min = 3000 },
                { name = "PH904", transition = "NORDI", type = "LC", altitude_min = 2100 },
                { name = "TOBAL", transition = "TOBAL", type = "LC", altitude_min = 4000 },
                { name = "ENIAS", transition = "TOBAL", type = "LC", altitude_min = 4000 },
                { name = "PH910", transition = "TOBAL", type = "LC", altitude_min = 3000, speed = 220.0 },
                { name = "PH904", transition = "TOBAL", type = "LC", altitude_min = 2100 },
                { name = "PH904", transition = "", type = "LC" },
                { name = "PH901", transition = "", type = "LC" },
                { name = "RW29", transition = "", type = "LC" },
                { name = "PH800", transition = "", type = "LC", speed = 210.0 },
                { name = "ESERI", transition = "", type = "LC", speed = 210.0 },
            }
        },
        ["I29-X"] = {
            name = "I29-X",
            type = "A",
            runway = "I29-X",
            waypoints = {
                { name = "PHA", transition = "PHA1", type = "LC", altitude_min = 4000, speed = 210.0 },
                { name = "PHA", transition = "PHA1", type = "LC", altitude_min = 2500 },
                { name = "CI29", transition = "PHA1", type = "LC", altitude_min = 2500 },
                { name = "PHA", transition = "PHA2", type = "LC", altitude_min = 4000 },
                { name = "PHA", transition = "PHA2", type = "LC", altitude_min = 2500 },
                { name = "CI29", transition = "PHA2", type = "LC", altitude_min = 2500 },
                { name = "CI29", transition = "", type = "LC" },
                { name = "FI29", transition = "", type = "LC" },
                { name = "RW29", transition = "", type = "LC" },
                { name = "RW29", transition = "", type = "LC" },
                { name = "", transition = "", type = "" },
                { name = "ESERI", transition = "", type = "LC", altitude_min = 2000, speed = 210.0 },
            }
        },
        ["I29-Y"] = {
            name = "I29-Y",
            type = "A",
            runway = "I29-Y",
            waypoints = {
                { name = "ESERI", transition = "ESERI", type = "LC", altitude_min = 4000 },
                { name = "D198I", transition = "ESERI", type = "LC", altitude_min = 3000 },
                { name = "D118I", transition = "ESERI", type = "LC", altitude_min = 2100 },
                { name = "", transition = "ESERI", type = "" },
                { name = "CI29", transition = "", type = "LC" },
                { name = "FI29", transition = "", type = "LC" },
                { name = "RW29", transition = "", type = "LC" },
                { name = "RW29", transition = "", type = "LC" },
                { name = "", transition = "", type = "" },
                { name = "ESERI", transition = "", type = "LC", altitude_min = 2000, speed = 210.0 },
            }
        },
        ["R11"] = {
            name = "R11",
            type = "A",
            runway = "R11",
            waypoints = {
                { name = "ESERI", transition = "ESERI", type = "LC", altitude_min = 4000 },
                { name = "ADUNI", transition = "ESERI", type = "LC", altitude_min = 3000 },
                { name = "PH702", transition = "ESERI", type = "LC", altitude_min = 1700 },
                { name = "TOBAL", transition = "TOBAL", type = "LC", altitude_min = 4000 },
                { name = "PH702", transition = "TOBAL", type = "LC", altitude_min = 1700 },
                { name = "PH702", transition = "", type = "LC", altitude_min = 1700 },
                { name = "PH701", transition = "", type = "LC" },
                { name = "RW11", transition = "", type = "LC" },
                { name = "PH710", transition = "", type = "LC", speed = 210.0 },
                { name = "ESERI", transition = "", type = "LC", speed = 210.0 },
            }
        },
        ["R29"] = {
            name = "R29",
            type = "A",
            runway = "R29",
            waypoints = {
                { name = "ESERI", transition = "ESERI", type = "LC", altitude_min = 4000 },
                { name = "PH930", transition = "ESERI", type = "LC", altitude_min = 3000, speed = 210.0 },
                { name = "PH904", transition = "ESERI", type = "LC", altitude_min = 2100 },
                { name = "GIPRO", transition = "GIPRO", type = "LC", altitude_min = 5000 },
                { name = "PH953", transition = "GIPRO", type = "LC", altitude_min = 4000 },
                { name = "PH950", transition = "GIPRO", type = "LC", altitude_min = 3000 },
                { name = "PH904", transition = "GIPRO", type = "LC", altitude_min = 2100 },
                { name = "NORDI", transition = "NORDI", type = "LC", altitude_min = 7000 },
                { name = "PH952", transition = "NORDI", type = "LC", altitude_min = 5500 },
                { name = "PH951", transition = "NORDI", type = "LC", altitude_min = 4000 },
                { name = "PH950", transition = "NORDI", type = "LC", altitude_min = 3000 },
                { name = "PH904", transition = "NORDI", type = "LC", altitude_min = 2100 },
                { name = "TOBAL", transition = "TOBAL", type = "LC", altitude_min = 4000 },
                { name = "ENIAS", transition = "TOBAL", type = "LC", altitude_min = 4000 },
                { name = "PH910", transition = "TOBAL", type = "LC", altitude_min = 3000, speed = 210.0 },
                { name = "PH904", transition = "TOBAL", type = "LC", altitude_min = 2100 },
                { name = "PH904", transition = "", type = "LC", altitude_min = 2100 },
                { name = "PH901", transition = "", type = "LC" },
                { name = "RW29", transition = "", type = "LC" },
                { name = "PH800", transition = "", type = "LC", speed = 210.0 },
                { name = "ESERI", transition = "", type = "LC", speed = 210.0 },
            }
        },
        ["R29-V"] = {
            name = "R29-V",
            type = "A",
            runway = "R29-V",
            waypoints = {
                { name = "ESERI", transition = "ESERI", type = "LC", altitude_min = 4000 },
                { name = "PH968", transition = "ESERI", type = "LC", altitude_min = 3000 },
                { name = "PH963", transition = "ESERI", type = "LC", altitude_min = 2000, speed = 210.0 },
                { name = "PH962", transition = "ESERI", type = "LC", speed = 185.0 },
                { name = "PH960", transition = "ESERI", type = "LC" },
                { name = "TOBAL", transition = "TOBAL", type = "LC", altitude_min = 4000 },
                { name = "PH966", transition = "TOBAL", type = "LC", altitude_min = 4000 },
                { name = "PH965", transition = "TOBAL", type = "LC", altitude_min = 3000, speed = 210.0 },
                { name = "PH962", transition = "TOBAL", type = "LC", speed = 185.0 },
                { name = "PH960", transition = "TOBAL", type = "LC" },
                { name = "PH960", transition = "", type = "LC" },
                { name = "RW29", transition = "", type = "LC" },
                { name = "PH800", transition = "", type = "LC", speed = 210.0 },
                { name = "ESERI", transition = "", type = "LC", speed = 210.0 },
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
