local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIBK",
        Name = "OIBK Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["RW27R"] = { lat = 52.466947222, lon = 9.699727778, type = "EDDV" },
        ["D088P"] = { lat = 43.184166667, lon = 44.930277778, type = "URMO" },
        ["CD09L"] = { lat = 26.582227778, lon = 53.787716667, type = "OIBK" },
        ["MIVUN"] = { lat = 26.530833333, lon = 54.331388889, type = "ENRT" },
        ["ALNOL"] = { lat = 26.681944444, lon = 53.6325, type = "ENRT" },
        ["D270G"] = { lat = 51.173727778, lon = 5.285933333, type = "EBBL" },
        ["FS09L"] = { lat = 26.548016667, lon = 53.892555556, type = "OIBK" },
        ["F09L3"] = { lat = 26.570833333, lon = 53.822669444, type = "OIBK" },
        ["F27R1"] = { lat = 26.525088889, lon = 54.111069444, type = "OIBK" },
        ["ORSAR"] = { lat = 26.075, lon = 53.958333333, type = "ENRT" },
        ["D106G"] = { lat = 61.278888889, lon = 73.715555556, type = "USRR" },
        ["FS27R"] = { lat = 26.525122222, lon = 54.073586111, type = "OIBK" },
        ["IBNUX"] = { lat = 26.271388889, lon = 54.202222222, type = "ENRT" },
        ["D288O"] = { lat = 58.053888889, lon = 55.649444444, type = "USPP" },
        ["MD09L"] = { lat = 26.530880556, lon = 53.944952778, type = "OIBK" },
        ["MD27R"] = { lat = 26.525155556, lon = 54.014444444, type = "OIBK" },
        ["F27R2"] = { lat = 26.525105556, lon = 54.092488889, type = "OIBK" },
        ["FN09L"] = { lat = 26.548225, lon = 53.8821, type = "OIBK" },
        ["PURNA"] = { lat = 26.843055556, lon = 53.852777778, type = "ENRT" },
        ["CD27R"] = { lat = 26.524991667, lon = 54.185397222, type = "OIBK" },
        ["F09L4"] = { lat = 26.553725, lon = 53.875088889, type = "OIBK" },
        ["FN27R"] = { lat = 26.523738889, lon = 54.073530556, type = "OIBK" },
        ["EP09L"] = { lat = 26.525566667, lon = 53.961188889, type = "OIBK" },
    },

    -- Данные ВПП
    Runways = {
        ["RW09L"] = {
            heading = 90,
            length = 40.0,
            width = 0,
            threshold = { lat = 26.529541666666667, lon = 53.96279722222223 },
            end = { lat = 26.529541666666667, lon = 53.9701551273031 }
        },
        ["RW27R"] = {
            heading = 270,
            length = 40.0,
            width = 0,
            threshold = { lat = 26.52675, lon = 53.99928055555556 },
            end = { lat = 26.52675, lon = 53.991922829436405 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ALNO1A"] = {
            name = "ALNO1A",
            runway = "RW27R",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "ALNOL", type = "E", altitude_min = 6000 },
            }
        },
        ["ALNO1B"] = {
            name = "ALNO1B",
            runway = "RW09L",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "", type = "" },
                { name = "ALNOL", type = "E", altitude_min = 6000 },
            }
        },
        ["ALNO1C"] = {
            name = "ALNO1C",
            runway = "RW27R",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "ALNOL", type = "E", altitude_min = 6000 },
            }
        },
        ["ALNO1D"] = {
            name = "ALNO1D",
            runway = "RW09L",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "", type = "" },
                { name = "ALNOL", type = "E", altitude_min = 6000 },
            }
        },
        ["IBNU1A"] = {
            name = "IBNU1A",
            runway = "RW27R",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "", type = "" },
                { name = "IBNUX", type = "E" },
            }
        },
        ["IBNU1B"] = {
            name = "IBNU1B",
            runway = "RW09L",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "", type = "" },
                { name = "IBNUX", type = "E" },
            }
        },
        ["IBNU1C"] = {
            name = "IBNU1C",
            runway = "RW27R",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "", type = "" },
                { name = "IBNUX", type = "E" },
            }
        },
        ["IBNU1D"] = {
            name = "IBNU1D",
            runway = "RW09L",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "", type = "" },
                { name = "IBNUX", type = "E" },
            }
        },
        ["MIVU1A"] = {
            name = "MIVU1A",
            runway = "RW27R",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "", type = "" },
                { name = "MIVUN", type = "E", altitude_min = 5000 },
            }
        },
        ["MIVU1B"] = {
            name = "MIVU1B",
            runway = "RW09L",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "MIVUN", type = "E", altitude_min = 5000 },
            }
        },
        ["MIVU1C"] = {
            name = "MIVU1C",
            runway = "RW27R",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "", type = "" },
                { name = "MIVUN", type = "E", altitude_min = 5000 },
            }
        },
        ["MIVU1D"] = {
            name = "MIVU1D",
            runway = "RW09L",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "MIVUN", type = "E", altitude_min = 5000 },
            }
        },
        ["ORSA1A"] = {
            name = "ORSA1A",
            runway = "RW27R",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "", type = "" },
                { name = "ORSAR", type = "E" },
            }
        },
        ["ORSA1B"] = {
            name = "ORSA1B",
            runway = "RW09L",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "", type = "" },
                { name = "ORSAR", type = "E" },
            }
        },
        ["ORSA1C"] = {
            name = "ORSA1C",
            runway = "RW27R",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "", type = "" },
                { name = "ORSAR", type = "E" },
            }
        },
        ["ORSA1D"] = {
            name = "ORSA1D",
            runway = "RW09L",
            waypoints = {
                { name = "", type = "", altitude_min = 510 },
                { name = "", type = "" },
                { name = "ORSAR", type = "E" },
            }
        },
        ["PURN1A"] = {
            name = "PURN1A",
            runway = "RW27R",
            waypoints = {
                { name = "", type = "", altitude_min = 500 },
                { name = "", type = "" },
                { name = "PURNA", type = "E", altitude_min = 8000 },
            }
        },
        ["PURN1B"] = {
            name = "PURN1B",
            runway = "RW09L",
            waypoints = {
                { name = "", type = "", altitude_min = 500 },
                { name = "", type = "" },
                { name = "PURNA", type = "E", altitude_min = 8000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ALNO1N"] = {
            name = "ALNO1N",
            runway = "ALL",
            waypoints = {
                { name = "ALNOL", type = "OI" },
                { name = "KIH", type = "OI" },
            }
        },
        ["ALNO1R"] = {
            name = "ALNO1R",
            runway = "RW27R",
            waypoints = {
                { name = "ALNOL", type = "OI" },
                { name = "KIS", type = "OI" },
                { name = "D088P", type = "OI" },
            }
        },
        ["ALNO1S"] = {
            name = "ALNO1S",
            runway = "RW09L",
            waypoints = {
                { name = "ALNOL", type = "OI" },
                { name = "D288O", type = "OI" },
            }
        },
        ["ALNO1V"] = {
            name = "ALNO1V",
            runway = "ALL",
            waypoints = {
                { name = "ALNOL", type = "OI" },
                { name = "KIS", type = "OI" },
            }
        },
        ["IBNU1N"] = {
            name = "IBNU1N",
            runway = "ALL",
            waypoints = {
                { name = "IBNUX", type = "OI" },
                { name = "KIH", type = "OI" },
            }
        },
        ["IBNU1R"] = {
            name = "IBNU1R",
            runway = "RW27R",
            waypoints = {
                { name = "IBNUX", type = "OI" },
                { name = "D088P", type = "OI" },
            }
        },
        ["IBNU1S"] = {
            name = "IBNU1S",
            runway = "RW09L",
            waypoints = {
                { name = "IBNUX", type = "OI" },
                { name = "KIS", type = "OI" },
                { name = "D288O", type = "OI" },
            }
        },
        ["IBNU1V"] = {
            name = "IBNU1V",
            runway = "ALL",
            waypoints = {
                { name = "IBNUX", type = "OI" },
                { name = "KIS", type = "OI" },
            }
        },
        ["MIVU1N"] = {
            name = "MIVU1N",
            runway = "ALL",
            waypoints = {
                { name = "MIVUN", type = "OI" },
                { name = "KIH", type = "OI" },
            }
        },
        ["MIVU1R"] = {
            name = "MIVU1R",
            runway = "RW27R",
            waypoints = {
                { name = "MIVUN", type = "OI" },
                { name = "D088P", type = "OI" },
            }
        },
        ["MIVU1S"] = {
            name = "MIVU1S",
            runway = "RW09L",
            waypoints = {
                { name = "MIVUN", type = "OI" },
                { name = "KIS", type = "OI" },
                { name = "D288O", type = "OI" },
            }
        },
        ["MIVU1V"] = {
            name = "MIVU1V",
            runway = "ALL",
            waypoints = {
                { name = "MIVUN", type = "OI" },
                { name = "KIS", type = "OI" },
            }
        },
        ["ORSA1N"] = {
            name = "ORSA1N",
            runway = "ALL",
            waypoints = {
                { name = "ORSAR", type = "OI" },
                { name = "KIH", type = "OI" },
            }
        },
        ["ORSA1R"] = {
            name = "ORSA1R",
            runway = "RW27R",
            waypoints = {
                { name = "ORSAR", type = "OI" },
                { name = "D088P", type = "OI" },
            }
        },
        ["ORSA1S"] = {
            name = "ORSA1S",
            runway = "RW09L",
            waypoints = {
                { name = "ORSAR", type = "OI" },
                { name = "D288O", type = "OI" },
            }
        },
        ["ORSA1V"] = {
            name = "ORSA1V",
            runway = "ALL",
            waypoints = {
                { name = "ORSAR", type = "OI" },
                { name = "KIS", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D09L3"] = {
            name = "D09L3",
            type = "A",
            runway = "D09L3",
            waypoints = {
                { name = "KIS", transition = "KIS1", type = "OI", altitude_min = 3000 },
                { name = "KIS", transition = "KIS1", type = "OI", altitude_min = 1300, speed = 185.0 },
                { name = "F09L3", transition = "KIS1", type = "OI", altitude_min = 1300 },
                { name = "KIS", transition = "KIS2", type = "OI", altitude_min = 3000 },
                { name = "KIS", transition = "KIS2", type = "OI", altitude_min = 1300 },
                { name = "F09L3", transition = "KIS2", type = "OI", altitude_min = 1300 },
                { name = "F09L3", transition = "", type = "OI", altitude_min = 1300 },
                { name = "MD09L", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI", altitude_min = 1700 },
                { name = "KIS", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["D09L4"] = {
            name = "D09L4",
            type = "A",
            runway = "D09L4",
            waypoints = {
                { name = "D288O", transition = "D288O", type = "OI", altitude_min = 3000 },
                { name = "CD09L", transition = "D288O", type = "OI", altitude_min = 1600 },
                { name = "CD09L", transition = "", type = "OI", altitude_min = 1600 },
                { name = "F09L4", transition = "", type = "OI", altitude_min = 1600 },
                { name = "MD09L", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI", altitude_min = 500 },
                { name = "D288O", transition = "", type = "OI" },
                { name = "D288O", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["D27R1"] = {
            name = "D27R1",
            type = "A",
            runway = "D27R1",
            waypoints = {
                { name = "KIS", transition = "KIS1", type = "OI", altitude_min = 3000 },
                { name = "KIS", transition = "KIS1", type = "OI", altitude_min = 1100, speed = 185.0 },
                { name = "F27R1", transition = "KIS1", type = "OI", altitude_min = 1100 },
                { name = "KIS", transition = "KIS2", type = "OI", altitude_min = 3000 },
                { name = "KIS", transition = "KIS2", type = "OI", altitude_min = 1100 },
                { name = "F27R1", transition = "KIS2", type = "OI", altitude_min = 1100 },
                { name = "F27R1", transition = "", type = "OI", altitude_min = 1100 },
                { name = "MD27R", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI", altitude_min = 1700 },
                { name = "KIS", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["D27R2"] = {
            name = "D27R2",
            type = "A",
            runway = "D27R2",
            waypoints = {
                { name = "D088P", transition = "D088P", type = "OI", altitude_min = 3000 },
                { name = "CD27R", transition = "D088P", type = "OI", altitude_min = 1600 },
                { name = "CD27R", transition = "", type = "OI", altitude_min = 1600 },
                { name = "F27R2", transition = "", type = "OI", altitude_min = 1600 },
                { name = "MD27R", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI", altitude_min = 500 },
                { name = "D088P", transition = "", type = "OI" },
                { name = "D088P", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["N09L"] = {
            name = "N09L",
            type = "A",
            runway = "N09L",
            waypoints = {
                { name = "KIH", transition = "KIH", type = "OI", altitude_min = 3000 },
                { name = "D106G", transition = "KIH", type = "OI" },
                { name = "D106G", transition = "KIH", type = "OI" },
                { name = "FN09L", transition = "KIH", type = "OI" },
                { name = "FN09L", transition = "", type = "OI" },
                { name = "KIH", transition = "", type = "OI" },
                { name = "KIH", transition = "", type = "OI", altitude_min = 2000 },
                { name = "KIH", transition = "", type = "OI" },
                { name = "KIH", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["N27R"] = {
            name = "N27R",
            type = "A",
            runway = "N27R",
            waypoints = {
                { name = "KIH", transition = "KIH", type = "OI", altitude_min = 3000 },
                { name = "D270G", transition = "KIH", type = "OI" },
                { name = "D270G", transition = "KIH", type = "OI" },
                { name = "FN27R", transition = "KIH", type = "OI" },
                { name = "FN27R", transition = "", type = "OI" },
                { name = "RW27R", transition = "", type = "OI" },
                { name = "KIH", transition = "", type = "OI" },
                { name = "KIH", transition = "", type = "OI", altitude_min = 2000 },
                { name = "KIH", transition = "", type = "OI" },
                { name = "KIH", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["S09L"] = {
            name = "S09L",
            type = "A",
            runway = "S09L",
            waypoints = {
                { name = "KIS", transition = "KIS1", type = "OI", altitude_min = 3000 },
                { name = "KIS", transition = "KIS1", type = "OI", altitude_min = 1300, speed = 185.0 },
                { name = "FS09L", transition = "KIS1", type = "OI", altitude_min = 1300 },
                { name = "KIS", transition = "KIS2", type = "OI", altitude_min = 3000 },
                { name = "KIS", transition = "KIS2", type = "OI", altitude_min = 1300 },
                { name = "FS09L", transition = "KIS2", type = "OI", altitude_min = 1300 },
                { name = "FS09L", transition = "", type = "OI", altitude_min = 1300 },
                { name = "EP09L", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI", altitude_min = 500 },
                { name = "KIS", transition = "", type = "OI", altitude_min = 1700 },
                { name = "KIS", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
            }
        },
        ["S27R"] = {
            name = "S27R",
            type = "A",
            runway = "S27R",
            waypoints = {
                { name = "KIS", transition = "KIS1", type = "OI", altitude_min = 3000 },
                { name = "KIS", transition = "KIS1", type = "OI", altitude_min = 1100, speed = 185.0 },
                { name = "FS27R", transition = "KIS1", type = "OI", altitude_min = 1100 },
                { name = "KIS", transition = "KIS2", type = "OI", altitude_min = 3000 },
                { name = "KIS", transition = "KIS2", type = "OI", altitude_min = 1100 },
                { name = "FS27R", transition = "KIS2", type = "OI", altitude_min = 1100 },
                { name = "FS27R", transition = "", type = "OI", altitude_min = 1100 },
                { name = "RW27R", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI", altitude_min = 1700 },
                { name = "KIS", transition = "", type = "OI" },
                { name = "KIS", transition = "", type = "OI", altitude_min = 3000, speed = 230.0 },
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
