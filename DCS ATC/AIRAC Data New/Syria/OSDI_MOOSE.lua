local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OSDI",
        Name = "OSDI Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["ADRA"] = { lat = 33.613333333, lon = 36.5, type = "ENRT" },
        ["FD23L"] = { lat = 30.164547222, lon = 31.532372222, type = "HECA" },
        ["SOFIA"] = { lat = 33.385130556, lon = 36.827786111, type = "ENRT" },
        ["MALLA"] = { lat = 33.853333333, lon = 36.531666667, type = "ENRT" },
        ["RAFIF"] = { lat = 33.213055556, lon = 38.321944444, type = "ENRT" },
        ["D225G"] = { lat = 39.404472222, lon = -0.591327778, type = "LEVC" },
        ["BASEM"] = { lat = 33.560277778, lon = 37.651944444, type = "ENRT" },
        ["FQ23L"] = { lat = 33.454738889, lon = 36.586586111, type = "OSDI" },
        ["CI05R"] = { lat = 29.982416667, lon = 31.266555556, type = "HECA" },
        ["D225C"] = { lat = 37.730719444, lon = -0.869702778, type = "LELC" },
        ["DE05R"] = { lat = 43.363477778, lon = 77.062344444, type = "UAAA" },
        ["OM23R"] = { lat = 48.566416667, lon = 135.237972222, type = "UHHH" },
        ["D045L"] = { lat = -26.518616667, lon = 28.37975, type = "FAOR" },
        ["CD23L"] = { lat = 48.676786111, lon = 135.416586111, type = "UHHH" },
        ["D083P"] = { lat = 40.525352778, lon = 23.319375, type = "LGTS" },
        ["SD523"] = { lat = 33.458041667, lon = 36.763963889, type = "OSDI" },
        ["SWIDA"] = { lat = 32.716666667, lon = 36.566666667, type = "ENRT" },
        ["16DAM"] = { lat = 33.555013889, lon = 36.692555556, type = "OSDI" },
        ["TAN"] = { lat = 28.428416667, lon = -11.173055556, type = "VOR", frequency = 112.3, elevation = 689.0, name = "TAN", range = 130.0 },
        ["FD23R"] = { lat = 48.616580556, lon = 135.326094444, type = "UHHH" },
        ["D050P"] = { lat = 70.301522222, lon = -147.691358333, type = "PASC" },
        ["SOKAN"] = { lat = 33.135833333, lon = 38.368611111, type = "ENRT" },
        ["SD524"] = { lat = 33.535958333, lon = 36.666994444, type = "OSDI" },
        ["MD23L"] = { lat = 30.128888889, lon = 31.461455556, type = "HECA" },
        ["DAM"] = { lat = 33.511472222, lon = 126.487611111, type = "VOR", frequency = 109.0, elevation = 98.0, name = "YONG", range = 130.0 },
        ["SD525"] = { lat = 33.491705556, lon = 36.607269444, type = "OSDI" },
        ["CD23R"] = { lat = 48.670977778, lon = 135.414491667, type = "UHHH" },
        ["D225B"] = { lat = 45.671613889, lon = 15.953341667, type = "LDZA" },
        ["MD23R"] = { lat = 45.640144444, lon = 126.273961111, type = "ZYHB" },
        ["FF23L"] = { lat = 48.625, lon = 135.323333333, type = "UHHH" },
        ["MS05L"] = { lat = 33.397166667, lon = 36.484961111, type = "OSDI" },
        ["KTN"] = { lat = -37.246666667, lon = 144.458333333, type = "ENRT" },
        ["LEBOR"] = { lat = 34.26565, lon = 36.58305, type = "ENRT" },
        ["D065P"] = { lat = 23.723272222, lon = 116.656861111, type = "ZGOW" },
        ["MN05R"] = { lat = 33.363377778, lon = 36.465375, type = "OSDI" },
        ["DE05L"] = { lat = 43.3716, lon = 77.074169444, type = "UAAA" },
        ["BUSRA"] = { lat = 32.333333333, lon = 36.616666667, type = "ENRT" },
        ["D045J"] = { lat = 46.176097222, lon = 4.18, type = "LFLN" },
        ["RDIMA"] = { lat = 33.033333333, lon = 36.533333333, type = "ENRT" },
        ["MA23L"] = { lat = 37.791916667, lon = -0.790166667, type = "LELC" },
        ["FI05R"] = { lat = 30.022861111, lon = 31.32025, type = "HECA" },
        ["FD05R"] = { lat = 43.28425, lon = 76.902472222, type = "UAAA" },
        ["SD526"] = { lat = 33.364880556, lon = 36.468619444, type = "OSDI" },
        ["D045K"] = { lat = 37.807480556, lon = 45.258927778, type = "OITR" },
        ["MQ23L"] = { lat = 33.421266667, lon = 36.542130556, type = "OSDI" },
        ["MD05R"] = { lat = 43.331919444, lon = 76.998188889, type = "UAAA" },
        ["CI23R"] = { lat = 48.638266667, lon = 135.336419444, type = "UHHH" },
        ["SULAF"] = { lat = 33.455, lon = 38.174166667, type = "ENRT" },
        ["ABBAS"] = { lat = 33.433333333, lon = 37.725, type = "ENRT" },
        ["70DME"] = { lat = 18.521430556, lon = 31.878241667, type = "HSMN" },
    },

    -- Данные ВПП
    Runways = {
        ["RW05L"] = {
            heading = 50,
            length = 0,
            width = 0,
            threshold = { lat = 33.41481666666667, lon = 36.50385277777778 },
            end = { lat = 33.41481666666667, lon = 36.50385277777778 }
        },
        ["RW05R"] = {
            heading = 50,
            length = 0,
            width = 0,
            threshold = { lat = 33.384825, lon = 36.49588888888889 },
            end = { lat = 33.384825, lon = 36.49588888888889 }
        },
        ["RW23L"] = {
            heading = 230,
            length = 0,
            width = 0,
            threshold = { lat = 33.40634166666666, lon = 36.52486111111111 },
            end = { lat = 33.40634166666666, lon = 36.52486111111111 }
        },
        ["RW23R"] = {
            heading = 230,
            length = 0,
            width = 0,
            threshold = { lat = 33.43633888888888, lon = 36.53283333333333 },
            end = { lat = 33.43633888888888, lon = 36.53283333333333 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ABS1"] = {
            name = "ABS1",
            runway = "RW23B",
            waypoints = {
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D" },
                { name = "DAM", type = "D", altitude_min = 8000 },
                { name = "SOFIA", type = "E" },
                { name = "ABBAS", type = "E", altitude_min = 24000 },
            }
        },
        ["ABS2"] = {
            name = "ABS2",
            runway = "RW23B",
            waypoints = {
                { name = "", type = "", altitude_min = 2420 },
                { name = "SOFIA", type = "E" },
                { name = "ABBAS", type = "E", altitude_min = 24000 },
            }
        },
        ["ABS21"] = {
            name = "ABS21",
            runway = "RW05L",
            waypoints = {
                { name = "DE05L", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D" },
                { name = "DAM", type = "D", altitude_min = 8000 },
                { name = "SOFIA", type = "E" },
                { name = "ABBAS", type = "E", altitude_min = 24000 },
                { name = "DE05R", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D" },
                { name = "DAM", type = "D", altitude_min = 8000 },
                { name = "SOFIA", type = "E" },
                { name = "ABBAS", type = "E", altitude_min = 24000 },
            }
        },
        ["ABS22"] = {
            name = "ABS22",
            runway = "RW05L",
            waypoints = {
                { name = "DE05L", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "", type = "" },
                { name = "SOFIA", type = "E" },
                { name = "ABBAS", type = "E" },
                { name = "DE05R", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "", type = "" },
                { name = "SOFIA", type = "E" },
                { name = "ABBAS", type = "E" },
            }
        },
        ["BUS1"] = {
            name = "BUS1",
            runway = "RW23B",
            waypoints = {
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D" },
                { name = "DAM", type = "D", altitude_min = 5000 },
                { name = "RDIMA", type = "E", altitude_min = 10000 },
                { name = "SWIDA", type = "E", altitude_min = 16000 },
                { name = "BUSRA", type = "E" },
            }
        },
        ["BUS2"] = {
            name = "BUS2",
            runway = "RW05L",
            waypoints = {
                { name = "DE05L", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D", altitude_min = 5000 },
                { name = "RDIMA", type = "E", altitude_min = 10000 },
                { name = "SWIDA", type = "E", altitude_min = 16000 },
                { name = "BUSRA", type = "E" },
                { name = "DE05R", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D", altitude_min = 5000 },
                { name = "RDIMA", type = "E", altitude_min = 10000 },
                { name = "SWIDA", type = "E", altitude_min = 16000 },
                { name = "BUSRA", type = "E" },
            }
        },
        ["LEB1"] = {
            name = "LEB1",
            runway = "RW23B",
            waypoints = {
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D" },
                { name = "DAM", type = "D", altitude_min = 5000 },
                { name = "ADRA", type = "E", altitude_min = 10000 },
                { name = "MALLA", type = "E", altitude_min = 16000 },
                { name = "LEBOR", type = "E", altitude_min = 24000 },
            }
        },
        ["LEB2"] = {
            name = "LEB2",
            runway = "RW05L",
            waypoints = {
                { name = "DE05L", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAL", type = "D", altitude_min = 5000 },
                { name = "ADRA", type = "E", altitude_min = 10000 },
                { name = "MALLA", type = "E", altitude_min = 16000 },
                { name = "LEBOR", type = "E", altitude_min = 24000 },
                { name = "DE05R", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAL", type = "D", altitude_min = 5000 },
                { name = "ADRA", type = "E", altitude_min = 10000 },
                { name = "MALLA", type = "E", altitude_min = 16000 },
                { name = "LEBOR", type = "E", altitude_min = 24000 },
            }
        },
        ["SLF1"] = {
            name = "SLF1",
            runway = "RW23B",
            waypoints = {
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D" },
                { name = "DAM", type = "D", altitude_min = 5000 },
                { name = "SOFIA", type = "E" },
                { name = "SULAF", type = "E", altitude_min = 24000 },
            }
        },
        ["SLF2"] = {
            name = "SLF2",
            runway = "RW23B",
            waypoints = {
                { name = "", type = "", altitude_min = 2420 },
                { name = "SOFIA", type = "E" },
                { name = "SULAF", type = "E", altitude_min = 24000 },
            }
        },
        ["SLF21"] = {
            name = "SLF21",
            runway = "RW05L",
            waypoints = {
                { name = "DE05L", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D" },
                { name = "DAM", type = "D", altitude_min = 5000 },
                { name = "SOFIA", type = "E" },
                { name = "SULAF", type = "E", altitude_min = 24000 },
                { name = "DE05R", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D" },
                { name = "DAM", type = "D", altitude_min = 5000 },
                { name = "SOFIA", type = "E" },
                { name = "SULAF", type = "E", altitude_min = 24000 },
            }
        },
        ["SLF22"] = {
            name = "SLF22",
            runway = "RW05L",
            waypoints = {
                { name = "DE05L", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "", type = "" },
                { name = "SOFIA", type = "E" },
                { name = "SULAF", type = "E", altitude_min = 24000 },
                { name = "DE05R", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "", type = "" },
                { name = "SOFIA", type = "E" },
                { name = "SULAF", type = "E", altitude_min = 24000 },
            }
        },
        ["TAN1"] = {
            name = "TAN1",
            runway = "RW23B",
            waypoints = {
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D" },
                { name = "DAM", type = "D", altitude_min = 8000 },
                { name = "SOFIA", type = "E" },
                { name = "ABBAS", type = "E" },
                { name = "TAN", type = "D" },
            }
        },
        ["TAN2"] = {
            name = "TAN2",
            runway = "RW23B",
            waypoints = {
                { name = "", type = "", altitude_min = 2420 },
                { name = "SOFIA", type = "E" },
                { name = "ABBAS", type = "E" },
                { name = "TAN", type = "D" },
            }
        },
        ["TAN21"] = {
            name = "TAN21",
            runway = "RW05L",
            waypoints = {
                { name = "DE05L", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D" },
                { name = "DAM", type = "D", altitude_min = 8000 },
                { name = "SOFIA", type = "E" },
                { name = "ABBAS", type = "E" },
                { name = "TAN", type = "D" },
                { name = "DE05R", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "DAM", type = "D" },
                { name = "DAM", type = "D", altitude_min = 8000 },
                { name = "SOFIA", type = "E" },
                { name = "ABBAS", type = "E" },
                { name = "TAN", type = "D" },
            }
        },
        ["TAN22"] = {
            name = "TAN22",
            runway = "RW05L",
            waypoints = {
                { name = "DE05L", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "", type = "" },
                { name = "SOFIA", type = "E" },
                { name = "ABBAS", type = "E" },
                { name = "TAN", type = "D" },
                { name = "DE05R", type = "P" },
                { name = "", type = "", altitude_min = 2420 },
                { name = "", type = "" },
                { name = "SOFIA", type = "E" },
                { name = "ABBAS", type = "E" },
                { name = "TAN", type = "D" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BRAV1C"] = {
            name = "BRAV1C",
            runway = "ALL",
            waypoints = {
                { name = "BUSRA", type = "OJ", altitude_min = 15000 },
                { name = "SWIDA", type = "OS", altitude_min = 16000 },
                { name = "RDIMA", type = "OS", altitude_min = 14000 },
                { name = "DAM", type = "OS", altitude_min = 5000 },
            }
        },
        ["KILO1C"] = {
            name = "KILO1C",
            runway = "ALL",
            waypoints = {
                { name = "KTN", type = "OS" },
                { name = "BASEM", type = "OS" },
                { name = "ABBAS", type = "OS", altitude_min = 24000 },
                { name = "SOFIA", type = "OS", altitude_min = 10000 },
            }
        },
        ["LIMA1C"] = {
            name = "LIMA1C",
            runway = "ALL",
            waypoints = {
                { name = "LEBOR", type = "OL", altitude_min = 24000 },
                { name = "MALLA", type = "OS", altitude_min = 16000 },
                { name = "ADRA", type = "OS", altitude_min = 10000 },
                { name = "DAM", type = "OS", altitude_min = 5000 },
            }
        },
        ["SEIR1C"] = {
            name = "SEIR1C",
            runway = "ALL",
            waypoints = {
                { name = "SOKAN", type = "OJ" },
                { name = "RAFIF", type = "OS" },
                { name = "SULAF", type = "OS", altitude_min = 24000 },
                { name = "ABBAS", type = "OS" },
                { name = "SOFIA", type = "OS", altitude_min = 10000 },
            }
        },
        ["TANG1C"] = {
            name = "TANG1C",
            runway = "ALL",
            waypoints = {
                { name = "TAN", type = "OS" },
                { name = "SULAF", type = "OS" },
                { name = "ABBAS", type = "OS" },
                { name = "SOFIA", type = "OS", altitude_min = 10000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D05R"] = {
            name = "D05R",
            type = "A",
            runway = "D05R",
            waypoints = {
                { name = "DAM", transition = "DAM", type = "OS", altitude_min = 5000 },
                { name = "D225C", transition = "DAM", type = "OS", altitude_min = 5000 },
                { name = "D225G", transition = "DAM", type = "OS" },
                { name = "D225G", transition = "DAM", type = "OS" },
                { name = "D225G", transition = "DAM", type = "OS", altitude_min = 4600 },
                { name = "FD05R", transition = "DAM", type = "OS", altitude_min = 3800 },
                { name = "FD05R", transition = "", type = "OS", altitude_min = 3800 },
                { name = "DAM", transition = "", type = "OS", altitude_min = 2600 },
                { name = "MD05R", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2420 },
                { name = "DAM", transition = "", type = "OS" },
            }
        },
        ["D23L"] = {
            name = "D23L",
            type = "A",
            runway = "D23L",
            waypoints = {
                { name = "DAM", transition = "DAM", type = "OS", altitude_min = 5000 },
                { name = "FD23L", transition = "DAM", type = "OS" },
                { name = "FD23L", transition = "DAM", type = "OS", altitude_min = 3400 },
                { name = "CD23L", transition = "DAM", type = "OS", altitude_min = 3400 },
                { name = "CD23L", transition = "", type = "OS", altitude_min = 3400 },
                { name = "FD23L", transition = "", type = "OS", altitude_min = 2900 },
                { name = "MD23L", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2447 },
                { name = "DAM", transition = "", type = "OS" },
            }
        },
        ["D23R"] = {
            name = "D23R",
            type = "A",
            runway = "D23R",
            waypoints = {
                { name = "DAM", transition = "DAM", type = "OS", altitude_min = 5000, speed = 264.0 },
                { name = "DAM", transition = "DAM", type = "OS", altitude_min = 3400 },
                { name = "CD23R", transition = "DAM", type = "OS", altitude_min = 3400 },
                { name = "CD23R", transition = "", type = "OS", altitude_min = 3400 },
                { name = "FD23R", transition = "", type = "OS", altitude_min = 3000 },
                { name = "MD23R", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2420 },
                { name = "DAM", transition = "", type = "OS", speed = 264.0 },
            }
        },
        ["I05R"] = {
            name = "I05R",
            type = "A",
            runway = "I05R",
            waypoints = {
                { name = "DAM", transition = "DAM1", type = "OS", altitude_min = 5000 },
                { name = "ABD", transition = "DAM1", type = "OS", altitude_min = 5000 },
                { name = "ABD", transition = "DAM1", type = "OS" },
                { name = "CI05R", transition = "DAM1", type = "OS", altitude_min = 4610 },
                { name = "DAM", transition = "DAM2", type = "OS", altitude_min = 5000 },
                { name = "ABD", transition = "DAM2", type = "OS", altitude_min = 5000 },
                { name = "ABD", transition = "DAM2", type = "OS" },
                { name = "CI05R", transition = "DAM2", type = "OS", altitude_min = 4610 },
                { name = "CI05R", transition = "", type = "OS" },
                { name = "FI05R", transition = "", type = "OS" },
                { name = "RW05R", transition = "", type = "OS" },
                { name = "RW05R", transition = "", type = "OS", altitude_min = 2420 },
                { name = "DAM", transition = "", type = "OS" },
            }
        },
        ["I23R"] = {
            name = "I23R",
            type = "A",
            runway = "I23R",
            waypoints = {
                { name = "DAM", transition = "DAM1", type = "OS", altitude_min = 5000 },
                { name = "DAL", transition = "DAM1", type = "OS", altitude_min = 5000 },
                { name = "DAL", transition = "DAM1", type = "OS" },
                { name = "CI23R", transition = "DAM1", type = "OS", altitude_min = 4000 },
                { name = "DAM", transition = "DAM2", type = "OS", altitude_min = 5000 },
                { name = "DAL", transition = "DAM2", type = "OS", altitude_min = 5000 },
                { name = "DAL", transition = "DAM2", type = "OS" },
                { name = "CI23R", transition = "DAM2", type = "OS", altitude_min = 4000 },
                { name = "CI23R", transition = "", type = "OS" },
                { name = "OM23R", transition = "", type = "OS" },
                { name = "RW23R", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2420 },
                { name = "DAM", transition = "", type = "OS" },
            }
        },
        ["I23R2"] = {
            name = "I23R2",
            type = "A",
            runway = "I23R2",
            waypoints = {
                { name = "SOFIA", transition = "SOFIA", type = "OS" },
                { name = "DAL", transition = "SOFIA", type = "OS", altitude_min = 5000 },
                { name = "DAL", transition = "SOFIA", type = "OS" },
                { name = "CI23R", transition = "SOFIA", type = "OS", altitude_min = 4000 },
                { name = "CI23R", transition = "", type = "OS" },
                { name = "OM23R", transition = "", type = "OS" },
                { name = "RW23R", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2420 },
                { name = "DAM", transition = "", type = "OS" },
            }
        },
        ["I23R3"] = {
            name = "I23R3",
            type = "A",
            runway = "I23R3",
            waypoints = {
                { name = "ADRA", transition = "ADR1", type = "OS" },
                { name = "DAL", transition = "ADR1", type = "OS", altitude_min = 5000 },
                { name = "DAL", transition = "ADR1", type = "OS" },
                { name = "CI23R", transition = "ADR1", type = "OS", altitude_min = 4000 },
                { name = "ADRA", transition = "ADR2", type = "OS" },
                { name = "DAL", transition = "ADR2", type = "OS", altitude_min = 5000 },
                { name = "DAL", transition = "ADR2", type = "OS" },
                { name = "CI23R", transition = "ADR2", type = "OS", altitude_min = 4000 },
                { name = "CI23R", transition = "", type = "OS" },
                { name = "OM23R", transition = "", type = "OS" },
                { name = "RW23R", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2420 },
                { name = "DAM", transition = "", type = "OS" },
            }
        },
        ["I23R4"] = {
            name = "I23R4",
            type = "A",
            runway = "I23R4",
            waypoints = {
                { name = "RDIMA", transition = "RDIM1", type = "OS" },
                { name = "ABD", transition = "RDIM1", type = "OS", altitude_min = 5000 },
                { name = "DAL", transition = "RDIM1", type = "OS", altitude_min = 5000 },
                { name = "DAL", transition = "RDIM1", type = "OS" },
                { name = "CI23R", transition = "RDIM1", type = "OS", altitude_min = 4000 },
                { name = "RDIMA", transition = "RDIM2", type = "OS" },
                { name = "ABD", transition = "RDIM2", type = "OS", altitude_min = 5000 },
                { name = "DAL", transition = "RDIM2", type = "OS", altitude_min = 5000 },
                { name = "DAL", transition = "RDIM2", type = "OS" },
                { name = "CI23R", transition = "RDIM2", type = "OS", altitude_min = 4000 },
                { name = "CI23R", transition = "", type = "OS" },
                { name = "OM23R", transition = "", type = "OS" },
                { name = "RW23R", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2420 },
                { name = "ABD", transition = "", type = "OS" },
            }
        },
        ["N05R"] = {
            name = "N05R",
            type = "A",
            runway = "N05R",
            waypoints = {
                { name = "ABD", transition = "ABD", type = "OS", altitude_min = 5000 },
                { name = "D225B", transition = "ABD", type = "OS" },
                { name = "D225B", transition = "ABD", type = "OS" },
                { name = "D225B", transition = "ABD", type = "OS", altitude_min = 4600 },
                { name = "ABD", transition = "ABD", type = "OS", altitude_min = 3600 },
                { name = "ABD", transition = "", type = "OS", altitude_min = 3600 },
                { name = "MN05R", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2748 },
                { name = "ABD", transition = "", type = "OS" },
            }
        },
        ["N23L"] = {
            name = "N23L",
            type = "A",
            runway = "N23L",
            waypoints = {
                { name = "ABD", transition = "ABD1", type = "OS", altitude_min = 5000 },
                { name = "D045K", transition = "ABD1", type = "OS" },
                { name = "D045K", transition = "ABD1", type = "OS" },
                { name = "FF23L", transition = "ABD1", type = "OS", altitude_min = 3200 },
                { name = "ABD", transition = "ABD2", type = "OS", altitude_min = 5000 },
                { name = "D045L", transition = "ABD2", type = "OS" },
                { name = "D045L", transition = "ABD2", type = "OS" },
                { name = "FF23L", transition = "ABD2", type = "OS", altitude_min = 3200 },
                { name = "FF23L", transition = "", type = "OS", altitude_min = 3200 },
                { name = "MA23L", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2702 },
                { name = "ABD", transition = "", type = "OS" },
            }
        },
        ["Q23L"] = {
            name = "Q23L",
            type = "A",
            runway = "Q23L",
            waypoints = {
                { name = "ABD", transition = "ABD", type = "OS", altitude_min = 5000 },
                { name = "D045J", transition = "ABD", type = "OS" },
                { name = "D045J", transition = "ABD", type = "OS", altitude_min = 3400 },
                { name = "FQ23L", transition = "ABD", type = "OS", altitude_min = 3400 },
                { name = "FQ23L", transition = "", type = "OS", altitude_min = 3400 },
                { name = "70DME", transition = "", type = "OS", altitude_min = 2900 },
                { name = "MQ23L", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2449 },
                { name = "ABD", transition = "", type = "OS" },
            }
        },
        ["R23R"] = {
            name = "R23R",
            type = "A",
            runway = "R23R",
            waypoints = {
                { name = "SOFIA", transition = "SOFIA", type = "OS", altitude_min = 8000, altitude_max = 10000 },
                { name = "SD523", transition = "SOFIA", type = "OS" },
                { name = "SD524", transition = "SOFIA", type = "OS" },
                { name = "SD525", transition = "SOFIA", type = "OS" },
                { name = "SD525", transition = "", type = "OS" },
                { name = "RW23R", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2420 },
                { name = "SD526", transition = "", type = "OS" },
                { name = "SD526", transition = "", type = "OS" },
            }
        },
        ["R23RV"] = {
            name = "R23RV",
            type = "A",
            runway = "R23RV",
            waypoints = {
                { name = "SOFIA", transition = "SOFIA", type = "OS", altitude_min = 8000, altitude_max = 10000 },
                { name = "D083P", transition = "SOFIA", type = "OS" },
                { name = "D065P", transition = "SOFIA", type = "OS", altitude_min = 5000 },
                { name = "D050P", transition = "SOFIA", type = "OS", altitude_min = 5000 },
                { name = "16DAM", transition = "SOFIA", type = "OS", altitude_min = 4000 },
                { name = "DAL", transition = "SOFIA", type = "OS", altitude_min = 3500 },
                { name = "DAL", transition = "", type = "OS", altitude_min = 3500 },
                { name = "RW23R", transition = "", type = "OS" },
                { name = "", transition = "", type = "" },
                { name = "DAM", transition = "", type = "OS" },
            }
        },
        ["S05L"] = {
            name = "S05L",
            type = "A",
            runway = "S05L",
            waypoints = {
                { name = "DAM", transition = "DAM", type = "OS", altitude_min = 5000 },
                { name = "DAM", transition = "DAM", type = "OS", altitude_min = 4300 },
                { name = "DAM", transition = "", type = "OS", altitude_min = 3000 },
                { name = "MS05L", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2496 },
                { name = "DAM", transition = "", type = "OS" },
            }
        },
        ["S23L"] = {
            name = "S23L",
            type = "A",
            runway = "S23L",
            waypoints = {
                { name = "DAM", transition = "DAM1", type = "OS", altitude_min = 5000 },
                { name = "FD23L", transition = "DAM1", type = "OS" },
                { name = "FD23L", transition = "DAM1", type = "OS" },
                { name = "FF23L", transition = "DAM1", type = "OS", altitude_min = 3200 },
                { name = "DAM", transition = "DAM2", type = "OS", altitude_min = 5000 },
                { name = "CD23L", transition = "DAM2", type = "OS" },
                { name = "CD23L", transition = "DAM2", type = "OS" },
                { name = "FF23L", transition = "DAM2", type = "OS", altitude_min = 3200 },
                { name = "FF23L", transition = "", type = "OS", altitude_min = 3200 },
                { name = "MA23L", transition = "", type = "OS" },
                { name = "", transition = "", type = "", altitude_min = 2702 },
                { name = "DAM", transition = "", type = "OS" },
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
