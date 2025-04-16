local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "ULMK",
        Name = "ULMK Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Kola"
    },

    -- Путевые точки
    Waypoints = {
        ["MK126"] = { lat = 67.344138889, lon = 33.418805556, type = "ULMK" },
        ["MK118"] = { lat = 67.312444444, lon = 33.658805556, type = "ULMK" },
        ["SOTOR"] = { lat = 67.118888889, lon = 33.997222222, type = "ENRT" },
        ["MK123"] = { lat = 67.522305556, lon = 33.388083333, type = "ULMK" },
        ["MK105"] = { lat = 13.580111111, lon = 39.306083333, type = "HAMK" },
        ["FN11X"] = { lat = 67.553961111, lon = 33.280086111, type = "ULMK" },
        ["RW29"] = { lat = -34.005188889, lon = 22.389325, type = "FAGG" },
        ["ARMAD"] = { lat = 67.148333333, lon = 33.515277778, type = "ENRT" },
        ["MK121"] = { lat = 67.259666667, lon = 33.718166667, type = "ULMK" },
        ["MK101"] = { lat = 13.313, lon = 39.333611111, type = "HAMK" },
        ["PILAN"] = { lat = 67.455, lon = 32.783611111, type = "ENRT" },
        ["FN29X"] = { lat = 67.3668, lon = 33.903372222, type = "ULMK" },
        ["CF11"] = { lat = 48.334977778, lon = -71.295286111, type = "CYBG" },
        ["MK115"] = { lat = 67.408388889, lon = 33.764527778, type = "ULMK" },
        ["FN29"] = { lat = 0.349008333, lon = 6.7912, type = "FPST" },
        ["MK117"] = { lat = 67.391444444, lon = 33.821388889, type = "ULMK" },
        ["MK124"] = { lat = 67.572361111, lon = 33.222277778, type = "ULMK" },
        ["I"] = { lat = 48.54, lon = 17.953611111, type = "ENRT" },
        ["FF11"] = { lat = 6.235394444, lon = 6.568830556, type = "DNAS" },
        ["MK119"] = { lat = 67.37675, lon = 33.447277778, type = "ULMK" },
        ["DER11"] = { lat = 67.455822222, lon = 33.608530556, type = "ULMK" },
        ["MK122"] = { lat = 67.408916667, lon = 33.211861111, type = "ULMK" },
        ["MK125"] = { lat = 67.482583333, lon = 33.039166667, type = "ULMK" },
        ["RATLU"] = { lat = 67.282777778, lon = 34.191388889, type = "ENRT" },
        ["24THR"] = { lat = 5.6435, lon = 5.150530556, type = "DNES" },
        ["MK104"] = { lat = 13.50925, lon = 39.281277778, type = "HAMK" },
        ["MK116"] = { lat = 67.574222222, lon = 33.214305556, type = "ULMK" },
    },

    -- Данные ВПП
    Runways = {
        ["RW11"] = {
            heading = 110,
            length = 0,
            width = 0,
            threshold = { lat = 67.46968611111112, lon = 33.56273888888889 },
            end = { lat = 67.46968611111112, lon = 33.56273888888889 }
        },
        ["RW29"] = {
            heading = 290,
            length = 0,
            width = 0,
            threshold = { lat = 67.45582222222222, lon = 33.608530555555554 },
            end = { lat = 67.45582222222222, lon = 33.608530555555554 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ARMA4C"] = {
            name = "ARMA4C",
            runway = "RW29",
            waypoints = {
                { name = "", type = "", altitude_min = 1500, speed = 250.0 },
                { name = "MK121", type = "P" },
                { name = "ARMAD", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["ARMA4D"] = {
            name = "ARMA4D",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "ARMAD", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["ARMA4F"] = {
            name = "ARMA4F",
            runway = "RW29",
            waypoints = {
                { name = "I", type = "P" },
                { name = "", type = "", altitude_min = 1500, speed = 250.0 },
                { name = "", type = "" },
                { name = "ARMAD", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["ARMA4H"] = {
            name = "ARMA4H",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 1500 },
                { name = "", type = "" },
                { name = "ARMAD", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["ARMA4J"] = {
            name = "ARMA4J",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 1500 },
                { name = "", type = "" },
                { name = "ARMAD", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["ARMA4K"] = {
            name = "ARMA4K",
            runway = "RW29",
            waypoints = {
                { name = "IO", type = "P", altitude_min = 1500, speed = 250.0 },
                { name = "", type = "" },
                { name = "ARMAD", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["PILA4C"] = {
            name = "PILA4C",
            runway = "RW29",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "PILAN", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["PILA4D"] = {
            name = "PILA4D",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 1500, speed = 215.0 },
                { name = "MK122", type = "P" },
                { name = "PILAN", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["PILA4F"] = {
            name = "PILA4F",
            runway = "RW29",
            waypoints = {
                { name = "I", type = "P" },
                { name = "", type = "", altitude_min = 1500 },
                { name = "", type = "" },
                { name = "PILAN", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["PILA4H"] = {
            name = "PILA4H",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 1500, speed = 235.0 },
                { name = "", type = "" },
                { name = "PILAN", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["PILA4J"] = {
            name = "PILA4J",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 1500, speed = 235.0 },
                { name = "IO", type = "P" },
                { name = "PILAN", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["PILA4K"] = {
            name = "PILA4K",
            runway = "RW29",
            waypoints = {
                { name = "IO", type = "P", altitude_min = 1500 },
                { name = "", type = "" },
                { name = "PILAN", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["RATL4C"] = {
            name = "RATL4C",
            runway = "RW29",
            waypoints = {
                { name = "", type = "", altitude_min = 1500, speed = 250.0 },
                { name = "RATLU", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["RATL4D"] = {
            name = "RATL4D",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "RATLU", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["RATL4F"] = {
            name = "RATL4F",
            runway = "RW29",
            waypoints = {
                { name = "I", type = "P" },
                { name = "", type = "", altitude_min = 1500, speed = 250.0 },
                { name = "", type = "" },
                { name = "RATLU", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["RATL4H"] = {
            name = "RATL4H",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 1500 },
                { name = "RATLU", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["RATL4J"] = {
            name = "RATL4J",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 1500 },
                { name = "RATLU", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["RATL4K"] = {
            name = "RATL4K",
            runway = "RW29",
            waypoints = {
                { name = "IO", type = "P", altitude_min = 1500, speed = 250.0 },
                { name = "", type = "" },
                { name = "RATLU", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["SOTO4C"] = {
            name = "SOTO4C",
            runway = "RW29",
            waypoints = {
                { name = "", type = "", altitude_min = 1500, speed = 250.0 },
                { name = "MK121", type = "P" },
                { name = "SOTOR", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["SOTO4D"] = {
            name = "SOTO4D",
            runway = "RW11",
            waypoints = {
                { name = "", type = "", altitude_min = 1500 },
                { name = "SOTOR", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["SOTO4F"] = {
            name = "SOTO4F",
            runway = "RW29",
            waypoints = {
                { name = "I", type = "P" },
                { name = "", type = "", altitude_min = 1500, speed = 250.0 },
                { name = "", type = "" },
                { name = "SOTOR", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["SOTO4H"] = {
            name = "SOTO4H",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 1500 },
                { name = "", type = "" },
                { name = "SOTOR", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["SOTO4J"] = {
            name = "SOTO4J",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 1500 },
                { name = "", type = "" },
                { name = "SOTOR", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
        ["SOTO4K"] = {
            name = "SOTO4K",
            runway = "RW29",
            waypoints = {
                { name = "IO", type = "P", altitude_min = 1500, speed = 250.0 },
                { name = "", type = "" },
                { name = "SOTOR", type = "E", altitude_min = 9000, altitude_max = 10000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ARMA4A"] = {
            name = "ARMA4A",
            runway = "RW29",
            waypoints = {
                { name = "ARMAD", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "MK104", type = "UL", altitude_min = 3100 },
            }
        },
        ["ARMA4B"] = {
            name = "ARMA4B",
            runway = "RW11",
            waypoints = {
                { name = "ARMAD", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "MK119", type = "UL", altitude_min = 3100 },
            }
        },
        ["ARMA4E"] = {
            name = "ARMA4E",
            runway = "RW11",
            waypoints = {
                { name = "ARMAD", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "IO", type = "UL", altitude_min = 3500, altitude_max = 6000 },
            }
        },
        ["ARMA4G"] = {
            name = "ARMA4G",
            runway = "ALL",
            waypoints = {
                { name = "ARMAD", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "I", type = "UL", altitude_min = 3500, altitude_max = 6000 },
            }
        },
        ["PILA4A"] = {
            name = "PILA4A",
            runway = "RW29",
            waypoints = {
                { name = "PILAN", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "MK104", type = "UL", altitude_min = 3100 },
            }
        },
        ["PILA4B"] = {
            name = "PILA4B",
            runway = "RW11",
            waypoints = {
                { name = "PILAN", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "MK101", type = "UL", altitude_min = 3000 },
            }
        },
        ["PILA4E"] = {
            name = "PILA4E",
            runway = "RW11",
            waypoints = {
                { name = "PILAN", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "IO", type = "UL", altitude_min = 3500, altitude_max = 6000 },
            }
        },
        ["PILA4G"] = {
            name = "PILA4G",
            runway = "ALL",
            waypoints = {
                { name = "PILAN", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "I", type = "UL", altitude_min = 3500, altitude_max = 6000 },
            }
        },
        ["RATL4A"] = {
            name = "RATL4A",
            runway = "RW29",
            waypoints = {
                { name = "RATLU", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "MK104", type = "UL", altitude_min = 3100 },
            }
        },
        ["RATL4B"] = {
            name = "RATL4B",
            runway = "RW11",
            waypoints = {
                { name = "RATLU", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "MK119", type = "UL", altitude_min = 3100 },
            }
        },
        ["RATL4E"] = {
            name = "RATL4E",
            runway = "RW11",
            waypoints = {
                { name = "RATLU", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "IO", type = "UL", altitude_min = 3500, altitude_max = 6000 },
            }
        },
        ["RATL4G"] = {
            name = "RATL4G",
            runway = "ALL",
            waypoints = {
                { name = "RATLU", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "I", type = "UL", altitude_min = 3500, altitude_max = 6000 },
            }
        },
        ["SOTO4A"] = {
            name = "SOTO4A",
            runway = "RW29",
            waypoints = {
                { name = "SOTOR", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "MK104", type = "UL", altitude_min = 3100 },
            }
        },
        ["SOTO4B"] = {
            name = "SOTO4B",
            runway = "RW11",
            waypoints = {
                { name = "SOTOR", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "MK119", type = "UL", altitude_min = 3100 },
            }
        },
        ["SOTO4E"] = {
            name = "SOTO4E",
            runway = "RW11",
            waypoints = {
                { name = "SOTOR", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "IO", type = "UL", altitude_min = 3500, altitude_max = 6000 },
            }
        },
        ["SOTO4G"] = {
            name = "SOTO4G",
            runway = "ALL",
            waypoints = {
                { name = "SOTOR", type = "UL", altitude_min = 9000, altitude_max = 10000 },
                { name = "I", type = "UL", altitude_min = 3500, altitude_max = 6000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["I11-Y"] = {
            name = "I11-Y",
            type = "A",
            runway = "I11-Y",
            waypoints = {
                { name = "IO", transition = "IO1", type = "UL", altitude_min = 3500, altitude_max = 6000 },
                { name = "IO", transition = "IO1", type = "UL", altitude_min = 3200, speed = 185.0 },
                { name = "CF11", transition = "IO1", type = "UL", altitude_min = 2200 },
                { name = "IO", transition = "IO2", type = "UL", altitude_min = 3500, altitude_max = 6000 },
                { name = "IO", transition = "IO2", type = "UL", altitude_min = 3200, speed = 115.0 },
                { name = "CF11", transition = "IO2", type = "UL", altitude_min = 2200 },
                { name = "IO", transition = "IO3", type = "UL", altitude_min = 3500, altitude_max = 6000 },
                { name = "IO", transition = "IO3", type = "UL", altitude_min = 3200, speed = 100.0 },
                { name = "CF11", transition = "IO3", type = "UL", altitude_min = 2200 },
                { name = "CF11", transition = "", type = "UL" },
                { name = "FF11", transition = "", type = "UL" },
                { name = "RW11", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 2400 },
                { name = "IO", transition = "", type = "UL", altitude_min = 4200 },
            }
        },
        ["I11-Z"] = {
            name = "I11-Z",
            type = "A",
            runway = "I11-Z",
            waypoints = {
                { name = "MK101", transition = "MK101", type = "UL", altitude_min = 3000 },
                { name = "MK116", transition = "MK101", type = "UL", altitude_min = 2700 },
                { name = "MK119", transition = "MK119", type = "UL", altitude_min = 3100 },
                { name = "MK101", transition = "MK119", type = "UL", altitude_min = 3000 },
                { name = "MK116", transition = "MK119", type = "UL", altitude_min = 2700 },
                { name = "MK116", transition = "", type = "UL" },
                { name = "FF11", transition = "", type = "UL" },
                { name = "RW11", transition = "", type = "UL" },
                { name = "MK117", transition = "", type = "UL", speed = 185.0 },
                { name = "MK118", transition = "", type = "UL", speed = 185.0 },
                { name = "MK119", transition = "", type = "UL", altitude_min = 3100 },
            }
        },
        ["J11"] = {
            name = "J11",
            type = "A",
            runway = "J11",
            waypoints = {
                { name = "MK101", transition = "MK101", type = "UL", altitude_min = 3000 },
                { name = "MK116", transition = "MK101", type = "UL", altitude_min = 2700 },
                { name = "MK119", transition = "MK119", type = "UL", altitude_min = 3100 },
                { name = "MK101", transition = "MK119", type = "UL", altitude_min = 3000 },
                { name = "MK116", transition = "MK119", type = "UL", altitude_min = 2700 },
                { name = "MK116", transition = "", type = "UL" },
                { name = "MK123", transition = "", type = "UL" },
                { name = "RW11", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 930 },
                { name = "MK117", transition = "", type = "UL", speed = 185.0 },
                { name = "MK118", transition = "", type = "UL", speed = 185.0 },
                { name = "MK119", transition = "", type = "UL", altitude_min = 3100 },
            }
        },
        ["J29"] = {
            name = "J29",
            type = "A",
            runway = "J29",
            waypoints = {
                { name = "MK104", transition = "MK104", type = "UL", altitude_min = 3100 },
                { name = "MK105", transition = "MK104", type = "UL", altitude_min = 2700 },
                { name = "MK105", transition = "", type = "UL" },
                { name = "MK115", transition = "", type = "UL" },
                { name = "RW29", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 930 },
                { name = "MK124", transition = "", type = "UL", speed = 215.0 },
                { name = "MK125", transition = "", type = "UL", speed = 215.0 },
                { name = "MK126", transition = "", type = "UL" },
                { name = "MK104", transition = "", type = "UL", altitude_min = 3100 },
            }
        },
        ["N11-X"] = {
            name = "N11-X",
            type = "A",
            runway = "N11-X",
            waypoints = {
                { name = "I", transition = "I1", type = "UL", altitude_min = 3500, altitude_max = 6000 },
                { name = "I", transition = "I1", type = "UL", altitude_min = 3200, speed = 185.0 },
                { name = "FN11X", transition = "I1", type = "UL" },
                { name = "I", transition = "I2", type = "UL", altitude_min = 3500, altitude_max = 6000 },
                { name = "I", transition = "I2", type = "UL", altitude_min = 3200, speed = 185.0 },
                { name = "FN11X", transition = "I2", type = "UL" },
                { name = "I", transition = "I3", type = "UL", altitude_min = 3500, altitude_max = 6000 },
                { name = "I", transition = "I3", type = "UL", altitude_min = 3200, speed = 185.0 },
                { name = "FN11X", transition = "I3", type = "UL" },
                { name = "FN11X", transition = "", type = "UL" },
                { name = "I", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 2400 },
                { name = "I", transition = "", type = "UL", altitude_min = 4100 },
            }
        },
        ["N11-Y"] = {
            name = "N11-Y",
            type = "A",
            runway = "N11-Y",
            waypoints = {
                { name = "IO", transition = "IO1", type = "UL", altitude_min = 3500, altitude_max = 6000 },
                { name = "IO", transition = "IO1", type = "UL", altitude_min = 3200, speed = 185.0 },
                { name = "CF11", transition = "IO1", type = "UL", altitude_min = 2200 },
                { name = "IO", transition = "IO2", type = "UL", altitude_min = 3500, altitude_max = 6000 },
                { name = "IO", transition = "IO2", type = "UL", altitude_min = 3200, speed = 185.0 },
                { name = "CF11", transition = "IO2", type = "UL", altitude_min = 2200 },
                { name = "IO", transition = "IO3", type = "UL", altitude_min = 3500, altitude_max = 6000 },
                { name = "IO", transition = "IO3", type = "UL", altitude_min = 3200, speed = 185.0 },
                { name = "CF11", transition = "IO3", type = "UL", altitude_min = 2200 },
                { name = "CF11", transition = "", type = "UL", altitude_min = 2200 },
                { name = "FF11", transition = "", type = "UL", altitude_min = 2200 },
                { name = "IO", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 2400 },
                { name = "IO", transition = "", type = "UL", altitude_min = 4200 },
            }
        },
        ["N11-Z"] = {
            name = "N11-Z",
            type = "A",
            runway = "N11-Z",
            waypoints = {
                { name = "I", transition = "I1", type = "UL", altitude_min = 3500, altitude_max = 6000 },
                { name = "I", transition = "I1", type = "UL", altitude_min = 3200, speed = 185.0 },
                { name = "CF11", transition = "I1", type = "UL", altitude_min = 2200 },
                { name = "I", transition = "I2", type = "UL", altitude_min = 3500, altitude_max = 6000 },
                { name = "I", transition = "I2", type = "UL", altitude_min = 3200, speed = 185.0 },
                { name = "CF11", transition = "I2", type = "UL", altitude_min = 2200 },
                { name = "I", transition = "I3", type = "UL", altitude_min = 3500, altitude_max = 6000 },
                { name = "I", transition = "I3", type = "UL", altitude_min = 3200, speed = 185.0 },
                { name = "CF11", transition = "I3", type = "UL", altitude_min = 2200 },
                { name = "CF11", transition = "", type = "UL", altitude_min = 2200 },
                { name = "FF11", transition = "", type = "UL", altitude_min = 2200 },
                { name = "IO", transition = "", type = "UL", altitude_min = 1300 },
                { name = "I", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 2400 },
                { name = "I", transition = "", type = "UL", altitude_min = 4100 },
            }
        },
        ["N29-X"] = {
            name = "N29-X",
            type = "N",
            runway = "N29-X",
            waypoints = {
                { name = "FN29X", transition = "", type = "UL", altitude_min = 3300 },
                { name = "RW29", transition = "", type = "UL" },
                { name = "I", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 2400 },
                { name = "I", transition = "", type = "UL", altitude_min = 4100 },
            }
        },
        ["N29-Z"] = {
            name = "N29-Z",
            type = "N",
            runway = "N29-Z",
            waypoints = {
                { name = "FN29", transition = "", type = "UL", altitude_min = 2000 },
                { name = "RW29", transition = "", type = "UL" },
                { name = "I", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 2400, speed = 230.0 },
                { name = "I", transition = "", type = "UL", altitude_min = 4100 },
            }
        },
        ["R11"] = {
            name = "R11",
            type = "A",
            runway = "R11",
            waypoints = {
                { name = "MK101", transition = "MK101", type = "UL", altitude_min = 3000 },
                { name = "MK116", transition = "MK101", type = "UL", altitude_min = 2700 },
                { name = "MK119", transition = "MK119", type = "UL", altitude_min = 3100 },
                { name = "MK101", transition = "MK119", type = "UL", altitude_min = 3000 },
                { name = "MK116", transition = "MK119", type = "UL", altitude_min = 2700 },
                { name = "MK116", transition = "", type = "UL", altitude_min = 2700 },
                { name = "MK123", transition = "", type = "UL", altitude_min = 2200 },
                { name = "24THR", transition = "", type = "UL", altitude_min = 1330 },
                { name = "RW11", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 930 },
                { name = "MK117", transition = "", type = "UL", speed = 185.0 },
                { name = "MK118", transition = "", type = "UL", speed = 185.0 },
                { name = "MK119", transition = "", type = "UL", altitude_min = 3100 },
            }
        },
        ["R29"] = {
            name = "R29",
            type = "A",
            runway = "R29",
            waypoints = {
                { name = "MK104", transition = "MK104", type = "UL", altitude_min = 3100 },
                { name = "MK105", transition = "MK104", type = "UL", altitude_min = 2700 },
                { name = "MK105", transition = "", type = "UL", altitude_min = 2700 },
                { name = "MK115", transition = "", type = "UL", altitude_min = 2000 },
                { name = "RW29", transition = "", type = "UL" },
                { name = "", transition = "", type = "", altitude_min = 930 },
                { name = "MK124", transition = "", type = "UL", speed = 215.0 },
                { name = "MK125", transition = "", type = "UL", speed = 215.0 },
                { name = "MK126", transition = "", type = "UL" },
                { name = "MK104", transition = "", type = "UL", altitude_min = 3100 },
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
