local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LGTS",
        Name = "LGTS Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["D141T"] = { lat = 43.222222222, lon = 16.564444444, type = "LDSP" },
        ["D148J"] = { lat = 27.868927778, lon = -16.574738889, type = "GCTS" },
        ["ARECE"] = { lat = 40.590277778, lon = 22.590555556, type = "LGTS" },
        ["CD28"] = { lat = -17.881183333, lon = 26.017088889, type = "FLHN" },
        ["D265U"] = { lat = 51.827233333, lon = 0.584363889, type = "EGSS" },
        ["D265V"] = { lat = 43.428127778, lon = -1.999336111, type = "LESO" },
        ["RW16"] = { lat = 22.160641667, lon = 113.587261111, type = "VMMC" },
        ["D257V"] = { lat = 40.465188889, lon = 22.494338889, type = "LGTS" },
        ["TS626"] = { lat = 40.373116667, lon = 23.017522222, type = "LGTS" },
        ["D298V"] = { lat = 55.043180556, lon = 61.948241667, type = "USCC" },
        ["D153N"] = { lat = 51.7832, lon = 0.224258333, type = "EGSS" },
        ["FD10"] = { lat = -17.830011111, lon = 25.716794444, type = "FLHN" },
        ["RW10"] = { lat = 26.194661111, lon = 85.90615, type = "VEDH" },
        ["D342J"] = { lat = 33.427711111, lon = -7.618730556, type = "GMMN" },
        ["MD28"] = { lat = -17.816608333, lon = 25.831508333, type = "FLHN" },
        ["D345J"] = { lat = 53.537836111, lon = 83.540616667, type = "UNBB" },
        ["ALIKO"] = { lat = 40.771944444, lon = 22.449444444, type = "ENRT" },
        ["D008J"] = { lat = 40.681216667, lon = 23.019077778, type = "LGTS" },
        ["D144X"] = { lat = 40.176088889, lon = 23.240291667, type = "LGTS" },
        ["CD10"] = { lat = -17.847363889, lon = 25.613541667, type = "FLHN" },
        ["EDASI"] = { lat = 40.4575, lon = 22.4275, type = "ENRT" },
        ["YAMPO"] = { lat = 40.211019444, lon = 23.068808333, type = "LGTS" },
        ["D298Q"] = { lat = 36.965944444, lon = -2.571586111, type = "LEAM" },
        ["RW34"] = { lat = 46.210363889, lon = -97.639358333, type = "KGWR" },
        ["OSMOS"] = { lat = 40.147777778, lon = 23.2625, type = "ENRT" },
        ["CF16"] = { lat = 62.269702778, lon = -163.281613889, type = "PASM" },
        ["D171N"] = { lat = 40.285791667, lon = 22.991066667, type = "LGTS" },
        ["FD16"] = { lat = -12.691661111, lon = 45.218933333, type = "FMCZ" },
        ["D322J"] = { lat = -11.475802778, lon = 27.394283333, type = "FZQA" },
        ["D155R"] = { lat = 40.174616667, lon = 23.124916667, type = "LGTS" },
        ["D019T"] = { lat = 13.799083333, lon = 2.314083333, type = "DRRN" },
        ["D083P"] = { lat = 40.525352778, lon = 23.319375, type = "LGTS" },
        ["D350O"] = { lat = 49.022197222, lon = 44.337636111, type = "URWW" },
        ["D241L"] = { lat = -4.351919444, lon = 15.0738, type = "FCBB" },
        ["CD34Y"] = { lat = -12.973494444, lon = 45.401261111, type = "FMCZ" },
        ["D303L"] = { lat = 40.145633333, lon = 113.260947222, type = "ZBDT" },
        ["D303S"] = { lat = 40.650005556, lon = 22.665625, type = "LGTS" },
        ["D333O"] = { lat = 40.750608333, lon = 22.846572222, type = "LGTS" },
        ["LOPOS"] = { lat = 40.290833333, lon = 22.500277778, type = "ENRT" },
        ["FD28"] = { lat = -17.845775, lon = 25.915255556, type = "FLHN" },
        ["D144V"] = { lat = 40.204666667, lon = 23.217855556, type = "LGTS" },
        ["D233Q"] = { lat = 43.362972222, lon = 15.967027778, type = "LDSP" },
        ["D178N"] = { lat = 55.696652778, lon = 14.056547222, type = "ESMK" },
        ["LICUT"] = { lat = 40.437222222, lon = 23.393333333, type = "LGTS" },
        ["40VOR"] = { lat = 22.743305556, lon = 5.426647222, type = "DAAT" },
        ["D123N"] = { lat = 16.645008333, lon = -22.7273, type = "GVAC" },
        ["D329S"] = { lat = 40.741472222, lon = 22.808427778, type = "LGTS" },
        ["D083V"] = { lat = 55.341766667, lon = 60.878663889, type = "USCC" },
        ["D188N"] = { lat = 57.311936111, lon = -4.099188889, type = "EGPE" },
        ["MD10"] = { lat = -17.815505556, lon = 25.802813889, type = "FLHN" },
        ["FI16"] = { lat = 0.561630556, lon = 9.362466667, type = "FOOL" },
        ["FD34Y"] = { lat = 4.297361111, lon = 18.546422222, type = "FEFF" },
        ["MD34Y"] = { lat = 40.505558333, lon = 22.976311111, type = "LGTS" },
        ["ODIKO"] = { lat = 40.971388889, lon = 23.241944444, type = "ENRT" },
        ["D167J"] = { lat = 40.353558333, lon = 23.000138889, type = "LGTS" },
        ["D019V"] = { lat = 63.842911111, lon = 54.324247222, type = "UUYH" },
        ["FICLO"] = { lat = 40.3486, lon = 22.700747222, type = "LGTS" },
        ["D221J"] = { lat = 50.634963889, lon = 4.590213889, type = "EBBE" },
        ["D155X"] = { lat = 40.142386111, lon = 23.148011111, type = "LGTS" },
        ["D074L"] = { lat = -15.168647222, lon = 12.352425, type = "FNMO" },
        ["D161G"] = { lat = 42.639244444, lon = 2.915033333, type = "LFMP" },
        ["D031J"] = { lat = 54.525, lon = 49.017777778, type = "UWLW" },
        ["D233V"] = { lat = 40.322161111, lon = 22.564402778, type = "LGTS" },
        ["D074B"] = { lat = 51.160933333, lon = -0.107158333, type = "EGKK" },
        ["D298T"] = { lat = 40.698547222, lon = 22.601175, type = "LGTS" },
        ["75VOR"] = { lat = 40.488352778, lon = 23.128763889, type = "LGTS" },
        ["ARNAS"] = { lat = 40.528055556, lon = 23.480555556, type = "ENRT" },
        ["CD34Z"] = { lat = 4.200294444, lon = 18.572325, type = "FEFF" },
        ["D245J"] = { lat = 48.904652778, lon = 2.217458333, type = "LFPB" },
        ["BENFE"] = { lat = 40.598611111, lon = 22.545277778, type = "LGTS" },
        ["D111J"] = { lat = 47.595277778, lon = 26.579305556, type = "LRSV" },
        ["D015V"] = { lat = 40.800869444, lon = 23.158347222, type = "LGTS" },
        ["D244J"] = { lat = -15.349566667, lon = 12.023708333, type = "FNMO" },
        ["D143J"] = { lat = 37.966666667, lon = 68.756666667, type = "UTDT" },
        ["D233P"] = { lat = 42.883888889, lon = 5.864466667, type = "LFTH" },
        ["D074V"] = { lat = 40.525558333, lon = 23.463141667, type = "LGTS" },
        ["D299X"] = { lat = 48.928883333, lon = 1.864197222, type = "ENRT" },
        ["D241V"] = { lat = 40.308516667, lon = 22.552161111, type = "LGTS" },
        ["D154T"] = { lat = 40.145038889, lon = 23.145997222, type = "LGTS" },
        ["APZOC"] = { lat = 40.272386111, lon = 22.937386111, type = "LGTS" },
        ["D019Q"] = { lat = 49.182783333, lon = -54.542536111, type = "CYQX" },
        ["D072J"] = { lat = 50.041933333, lon = 16.0061, type = "LKPD" },
        ["NAFNU"] = { lat = 40.311658333, lon = 23.149069444, type = "LGTS" },
        ["D257P"] = { lat = 30.247222222, lon = -9.679166667, type = "GMAD" },
        ["D288X"] = { lat = 48.327880556, lon = -71.594988889, type = "CYBG" },
        ["D015T"] = { lat = 42.251902778, lon = 2.894797222, type = "LEGE" },
        ["D156V"] = { lat = 40.171677778, lon = 23.125527778, type = "LGTS" },
        ["D298P"] = { lat = 47.315088889, lon = 7.569972222, type = "LFSB" },
        ["FD34Z"] = { lat = 4.268241667, lon = 18.554194444, type = "FEFF" },
        ["LEKPO"] = { lat = 40.112777778, lon = 23.161944444, type = "ENRT" },
        ["D257Q"] = { lat = 40.477527778, lon = 22.602330556, type = "LGTS" },
        ["FI10"] = { lat = 59.919805556, lon = 150.372122222, type = "UHMM" },
        ["TSL27"] = { lat = 40.730225, lon = 22.521691667, type = "LGTS" },
        ["CEFEB"] = { lat = 40.292069444, lon = 23.043197222, type = "LGTS" },
        ["TS619"] = { lat = 40.616194444, lon = 22.940097222, type = "LGTS" },
        ["D303U"] = { lat = 52.226844444, lon = 13.113172222, type = "EDDB" },
        ["D176J"] = { lat = 44.401666667, lon = 38.001666667, type = "URKG" },
        ["D335S"] = { lat = 40.752297222, lon = 22.849594444, type = "LGTS" },
        ["D241U"] = { lat = 28.912141667, lon = 110.065391667, type = "ZGDY" },
        ["TS609"] = { lat = 40.557788889, lon = 22.958816667, type = "LGTS" },
        ["D298O"] = { lat = 5.386138889, lon = -4.145416667, type = "DIAP" },
        ["D155V"] = { lat = 40.173758333, lon = 23.133236111, type = "LGTS" },
        ["D009J"] = { lat = 23.187980556, lon = 113.208908333, type = "ZGGG" },
        ["D265L"] = { lat = 65.456313889, lon = 11.734997222, type = "ENBN" },
        ["CI10"] = { lat = -15.314055556, lon = 28.269388889, type = "FLKK" },
    },

    -- Данные ВПП
    Runways = {
        ["RW10"] = {
            heading = 100,
            length = 0,
            width = 0,
            threshold = { lat = 40.524144444444445, lon = 22.947583333333334 },
            end = { lat = 40.524144444444445, lon = 22.947583333333334 }
        },
        ["RW16"] = {
            heading = 160,
            length = 0,
            width = 0,
            threshold = { lat = 40.53039722222222, lon = 22.96754722222222 },
            end = { lat = 40.53039722222222, lon = 22.96754722222222 }
        },
        ["RW28"] = {
            heading = 280,
            length = 0,
            width = 0,
            threshold = { lat = 40.51668333333333, lon = 22.98698611111111 },
            end = { lat = 40.51668333333333, lon = 22.98698611111111 }
        },
        ["RW34"] = {
            heading = 340,
            length = 0,
            width = 0,
            threshold = { lat = 40.509169444444446, lon = 22.974294444444443 },
            end = { lat = 40.509169444444446, lon = 22.974294444444443 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ALIK1A"] = {
            name = "ALIK1A",
            runway = "RW34",
            waypoints = {
                { name = "", type = "", altitude_min = 600 },
                { name = "D322J", type = "P", speed = 250.0 },
                { name = "", type = "" },
                { name = "ALIKO", type = "E", altitude_min = 11000 },
            }
        },
        ["ALIK1B"] = {
            name = "ALIK1B",
            runway = "RW16",
            waypoints = {
                { name = "MKR", type = "D", speed = 250.0 },
                { name = "MKR", type = "D", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "ALIKO", type = "E", altitude_min = 11000 },
            }
        },
        ["ARNA1C"] = {
            name = "ARNA1C",
            runway = "RW10",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", speed = 230.0 },
                { name = "ARNAS", type = "E", altitude_min = 8000 },
            }
        },
        ["ARNA1E"] = {
            name = "ARNA1E",
            runway = "RW28",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "D072J", type = "P" },
                { name = "ARNAS", type = "E", altitude_min = 8000 },
            }
        },
        ["ARNA1G"] = {
            name = "ARNA1G",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 2600 },
                { name = "ARNAS", type = "E", altitude_min = 8000, speed = 210.0 },
            }
        },
        ["ARNA3A"] = {
            name = "ARNA3A",
            runway = "RW34",
            waypoints = {
                { name = "", type = "", altitude_min = 600 },
                { name = "D322J", type = "P", speed = 250.0 },
                { name = "MKR", type = "D", altitude_min = 6000 },
                { name = "ARNAS", type = "E", altitude_min = 8000 },
            }
        },
        ["ARNA3B"] = {
            name = "ARNA3B",
            runway = "RW16",
            waypoints = {
                { name = "MKR", type = "D", speed = 250.0 },
                { name = "MKR", type = "D", altitude_min = 6000 },
                { name = "ARNAS", type = "E", altitude_min = 8000 },
            }
        },
        ["EDAS1A"] = {
            name = "EDAS1A",
            runway = "RW34",
            waypoints = {
                { name = "", type = "", altitude_min = 600 },
                { name = "D322J", type = "P", speed = 250.0 },
                { name = "MKR", type = "D", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "EDASI", type = "E", altitude_min = 12000 },
            }
        },
        ["EDAS1B"] = {
            name = "EDAS1B",
            runway = "RW16",
            waypoints = {
                { name = "MKR", type = "D", speed = 250.0 },
                { name = "MKR", type = "D", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "EDASI", type = "E", altitude_min = 12000 },
            }
        },
        ["EDAS1C"] = {
            name = "EDAS1C",
            runway = "RW10",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", speed = 230.0 },
                { name = "D245J", type = "P" },
                { name = "EDASI", type = "E", altitude_min = 12000 },
            }
        },
        ["EDAS1E"] = {
            name = "EDAS1E",
            runway = "RW28",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "EDASI", type = "E", altitude_min = 12000 },
            }
        },
        ["FSK1C"] = {
            name = "FSK1C",
            runway = "RW10",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", speed = 230.0 },
                { name = "D009J", type = "P" },
                { name = "FSK", type = "D", altitude_min = 11000 },
            }
        },
        ["FSK1E"] = {
            name = "FSK1E",
            runway = "RW28",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "D345J", type = "P" },
                { name = "FSK", type = "D", altitude_min = 11000 },
            }
        },
        ["FSK4A"] = {
            name = "FSK4A",
            runway = "RW34",
            waypoints = {
                { name = "", type = "", altitude_min = 600 },
                { name = "D322J", type = "P", speed = 250.0 },
                { name = "", type = "" },
                { name = "FSK", type = "D", altitude_min = 11000 },
            }
        },
        ["FSK4B"] = {
            name = "FSK4B",
            runway = "RW16",
            waypoints = {
                { name = "MKR", type = "D", speed = 250.0 },
                { name = "MKR", type = "D", altitude_min = 6000 },
                { name = "FSK", type = "D", altitude_min = 11000 },
            }
        },
        ["LEKP1A"] = {
            name = "LEKP1A",
            runway = "RW34",
            waypoints = {
                { name = "", type = "", altitude_min = 600 },
                { name = "D322J", type = "P", speed = 250.0 },
                { name = "MKR", type = "D", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "LEKPO", type = "E", altitude_min = 7000 },
            }
        },
        ["LEKP1B"] = {
            name = "LEKP1B",
            runway = "RW16",
            waypoints = {
                { name = "MKR", type = "D" },
                { name = "LEKPO", type = "E", altitude_min = 7000 },
            }
        },
        ["LEKP1C"] = {
            name = "LEKP1C",
            runway = "RW10",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", speed = 230.0 },
                { name = "D143J", type = "P" },
                { name = "LEKPO", type = "E", altitude_min = 7000 },
            }
        },
        ["LEKP1E"] = {
            name = "LEKP1E",
            runway = "RW28",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "D167J", type = "P" },
                { name = "LEKPO", type = "E", altitude_min = 7000 },
            }
        },
        ["LEKP1G"] = {
            name = "LEKP1G",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 2600 },
                { name = "", type = "", speed = 210.0 },
                { name = "LEKPO", type = "E", altitude_min = 7000 },
            }
        },
        ["LOPO1C"] = {
            name = "LOPO1C",
            runway = "RW10",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", speed = 230.0 },
                { name = "D221J", type = "P" },
                { name = "LOPOS", type = "E", altitude_min = 12000 },
            }
        },
        ["LOPO1E"] = {
            name = "LOPO1E",
            runway = "RW28",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "D244J", type = "P" },
                { name = "LOPOS", type = "E", altitude_min = 12000 },
            }
        },
        ["LOPO3A"] = {
            name = "LOPO3A",
            runway = "RW34",
            waypoints = {
                { name = "", type = "", altitude_min = 600 },
                { name = "D322J", type = "P", speed = 250.0 },
                { name = "MKR", type = "D", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "LOPOS", type = "E", altitude_min = 12000 },
            }
        },
        ["LOPO3B"] = {
            name = "LOPO3B",
            runway = "RW16",
            waypoints = {
                { name = "MKR", type = "D", speed = 250.0 },
                { name = "MKR", type = "D", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "LOPOS", type = "E", altitude_min = 12000 },
            }
        },
        ["MKR1E"] = {
            name = "MKR1E",
            runway = "RW28",
            waypoints = {
                { name = "", type = "" },
                { name = "MKR", type = "D", altitude_min = 6000 },
            }
        },
        ["MKR1F"] = {
            name = "MKR1F",
            runway = "RW28",
            waypoints = {
                { name = "", type = "" },
                { name = "MKR", type = "D", altitude_min = 6000 },
            }
        },
        ["ODIK1A"] = {
            name = "ODIK1A",
            runway = "RW34",
            waypoints = {
                { name = "", type = "", altitude_min = 600 },
                { name = "D322J", type = "P", speed = 250.0 },
                { name = "MKR", type = "D", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "ODIKO", type = "E", altitude_min = 10000 },
            }
        },
        ["ODIK1B"] = {
            name = "ODIK1B",
            runway = "RW16",
            waypoints = {
                { name = "MKR", type = "D", speed = 250.0 },
                { name = "MKR", type = "D", altitude_min = 6000 },
                { name = "ODIKO", type = "E", altitude_min = 10000 },
            }
        },
        ["ODIK1C"] = {
            name = "ODIK1C",
            runway = "RW10",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", speed = 230.0 },
                { name = "D031J", type = "P" },
                { name = "ODIKO", type = "E", altitude_min = 10000 },
            }
        },
        ["ODIK1E"] = {
            name = "ODIK1E",
            runway = "RW28",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "D008J", type = "P" },
                { name = "ODIKO", type = "E", altitude_min = 10000 },
            }
        },
        ["OSMO1A"] = {
            name = "OSMO1A",
            runway = "RW34",
            waypoints = {
                { name = "", type = "", altitude_min = 600 },
                { name = "D322J", type = "P", speed = 250.0 },
                { name = "MKR", type = "D", altitude_min = 6000 },
                { name = "OSMOS", type = "E", altitude_min = 13000 },
            }
        },
        ["TSL1E"] = {
            name = "TSL1E",
            runway = "RW28",
            waypoints = {
                { name = "", type = "" },
                { name = "TSL", type = "D", altitude_min = 6000 },
            }
        },
        ["TSL1F"] = {
            name = "TSL1F",
            runway = "RW28",
            waypoints = {
                { name = "", type = "" },
                { name = "TSL", type = "D", altitude_min = 6000 },
            }
        },
        ["TSL1G"] = {
            name = "TSL1G",
            runway = "RW10",
            waypoints = {
                { name = "", type = "", altitude_min = 2600 },
                { name = "TSL", type = "D", altitude_min = 6000, speed = 210.0 },
            }
        },
        ["TSL3A"] = {
            name = "TSL3A",
            runway = "RW34",
            waypoints = {
                { name = "", type = "", altitude_min = 600 },
                { name = "", type = "" },
                { name = "TSL", type = "D", speed = 250.0 },
                { name = "TSL", type = "D", altitude_min = 6000 },
            }
        },
        ["TSL3B"] = {
            name = "TSL3B",
            runway = "RW16",
            waypoints = {
                { name = "TSL", type = "D" },
                { name = "TSL", type = "D", speed = 250.0 },
                { name = "TSL", type = "D", altitude_min = 6000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ALIK1D"] = {
            name = "ALIK1D",
            runway = "RW10",
            waypoints = {
                { name = "ALIKO", type = "LG" },
                { name = "D298V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "BENFE", type = "LG" },
            }
        },
        ["ALIK1J"] = {
            name = "ALIK1J",
            runway = "RW10",
            waypoints = {
                { name = "ALIKO", type = "LG" },
                { name = "TSL27", type = "LG" },
                { name = "ARECE", type = "LG" },
            }
        },
        ["ALIK1K"] = {
            name = "ALIK1K",
            runway = "RW28",
            waypoints = {
                { name = "ALIKO", type = "LG" },
                { name = "D298V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "LICUT", type = "LG" },
            }
        },
        ["ALIK1L"] = {
            name = "ALIK1L",
            runway = "RW16",
            waypoints = {
                { name = "ALIKO", type = "LG" },
                { name = "D298Q", type = "LG" },
                { name = "", type = "" },
                { name = "D333O", type = "LG" },
                { name = "CF16", type = "LG" },
            }
        },
        ["ALIK1P"] = {
            name = "ALIK1P",
            runway = "RW34",
            waypoints = {
                { name = "ALIKO", type = "LG" },
                { name = "D298T", type = "LG" },
                { name = "D298P", type = "LG" },
                { name = "", type = "" },
                { name = "D171N", type = "LG" },
                { name = "CD34Z", type = "LG" },
            }
        },
        ["ALIK2F"] = {
            name = "ALIK2F",
            runway = "RW16",
            waypoints = {
                { name = "ALIKO", type = "LG" },
                { name = "D303U", type = "LG" },
                { name = "", type = "", speed = 230.0 },
                { name = "D335S", type = "LG" },
                { name = "CF16", type = "LG", speed = 230.0 },
            }
        },
        ["ALIK2H"] = {
            name = "ALIK2H",
            runway = "RW34",
            waypoints = {
                { name = "ALIKO", type = "LG" },
                { name = "D303U", type = "LG" },
                { name = "D303L", type = "LG" },
                { name = "", type = "", speed = 230.0 },
                { name = "D176J", type = "LG" },
                { name = "CD34Y", type = "LG", speed = 230.0 },
            }
        },
        ["ARNA1D"] = {
            name = "ARNA1D",
            runway = "RW10",
            waypoints = {
                { name = "ARNAS", type = "LG" },
                { name = "D083V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "D019T", type = "LG" },
                { name = "BENFE", type = "LG" },
            }
        },
        ["ARNA1J"] = {
            name = "ARNA1J",
            runway = "RW10",
            waypoints = {
                { name = "ARNAS", type = "LG" },
                { name = "D074V", type = "LG" },
                { name = "", type = "" },
                { name = "D015T", type = "LG" },
                { name = "ARECE", type = "LG" },
            }
        },
        ["ARNA1K"] = {
            name = "ARNA1K",
            runway = "RW28",
            waypoints = {
                { name = "ARNAS", type = "LG" },
                { name = "LICUT", type = "LG" },
            }
        },
        ["ARNA1P"] = {
            name = "ARNA1P",
            runway = "RW34",
            waypoints = {
                { name = "ARNAS", type = "LG" },
                { name = "D083P", type = "LG" },
                { name = "", type = "" },
                { name = "D123N", type = "LG" },
                { name = "D153N", type = "LG" },
                { name = "CD34Z", type = "LG" },
            }
        },
        ["ARNA2H"] = {
            name = "ARNA2H",
            runway = "RW34",
            waypoints = {
                { name = "ARNAS", type = "LG" },
                { name = "D074L", type = "LG" },
                { name = "", type = "", speed = 230.0 },
                { name = "D111J", type = "LG" },
                { name = "D148J", type = "LG" },
                { name = "CD34Y", type = "LG" },
            }
        },
        ["ARNA2L"] = {
            name = "ARNA2L",
            runway = "RW16",
            waypoints = {
                { name = "ARNAS", type = "LG" },
                { name = "MKR", type = "LG" },
                { name = "MKR", type = "LG", speed = 230.0 },
                { name = "CF16", type = "LG" },
            }
        },
        ["ARNA3F"] = {
            name = "ARNA3F",
            runway = "RW16",
            waypoints = {
                { name = "ARNAS", type = "LG" },
                { name = "D074B", type = "LG" },
                { name = "TSL", type = "LG", speed = 230.0 },
                { name = "D329S", type = "LG" },
                { name = "CF16", type = "LG", speed = 230.0 },
            }
        },
        ["EDAS1D"] = {
            name = "EDAS1D",
            runway = "RW10",
            waypoints = {
                { name = "EDASI", type = "LG" },
                { name = "D257V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "BENFE", type = "LG" },
            }
        },
        ["EDAS1J"] = {
            name = "EDAS1J",
            runway = "RW10",
            waypoints = {
                { name = "EDASI", type = "LG" },
                { name = "D265V", type = "LG" },
                { name = "", type = "" },
                { name = "ARECE", type = "LG" },
            }
        },
        ["EDAS1K"] = {
            name = "EDAS1K",
            runway = "RW28",
            waypoints = {
                { name = "EDASI", type = "LG" },
                { name = "D257V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "LICUT", type = "LG" },
            }
        },
        ["EDAS1L"] = {
            name = "EDAS1L",
            runway = "RW16",
            waypoints = {
                { name = "EDASI", type = "LG" },
                { name = "D257Q", type = "LG" },
                { name = "", type = "" },
                { name = "D298O", type = "LG" },
                { name = "D333O", type = "LG" },
                { name = "CF16", type = "LG" },
            }
        },
        ["EDAS1P"] = {
            name = "EDAS1P",
            runway = "RW34",
            waypoints = {
                { name = "EDASI", type = "LG" },
                { name = "D257P", type = "LG" },
                { name = "", type = "" },
                { name = "D171N", type = "LG" },
                { name = "CD34Z", type = "LG" },
            }
        },
        ["EDAS2F"] = {
            name = "EDAS2F",
            runway = "RW16",
            waypoints = {
                { name = "EDASI", type = "LG" },
                { name = "D265U", type = "LG" },
                { name = "", type = "", speed = 230.0 },
                { name = "D303S", type = "LG" },
                { name = "D335S", type = "LG" },
                { name = "CF16", type = "LG", speed = 230.0 },
            }
        },
        ["EDAS2H"] = {
            name = "EDAS2H",
            runway = "RW34",
            waypoints = {
                { name = "EDASI", type = "LG" },
                { name = "D265L", type = "LG" },
                { name = "", type = "", speed = 230.0 },
                { name = "D176J", type = "LG" },
                { name = "CD34Y", type = "LG", speed = 230.0 },
            }
        },
        ["FSK1L"] = {
            name = "FSK1L",
            runway = "RW16",
            waypoints = {
                { name = "FSK", type = "LG", altitude_min = 11000 },
                { name = "D188N", type = "LG" },
                { name = "CF16", type = "LG" },
            }
        },
        ["FSK3P"] = {
            name = "FSK3P",
            runway = "RW34",
            waypoints = {
                { name = "FSK", type = "LG", altitude_min = 11000 },
                { name = "MKR", type = "LG" },
                { name = "D178N", type = "LG", speed = 230.0 },
                { name = "CD34Z", type = "LG" },
            }
        },
        ["LEKP1D"] = {
            name = "LEKP1D",
            runway = "RW10",
            waypoints = {
                { name = "LEKPO", type = "LG" },
                { name = "D155V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "BENFE", type = "LG" },
            }
        },
        ["LEKP1J"] = {
            name = "LEKP1J",
            runway = "RW10",
            waypoints = {
                { name = "LEKPO", type = "LG" },
                { name = "D154T", type = "LG" },
                { name = "ARECE", type = "LG" },
            }
        },
        ["LEKP1K"] = {
            name = "LEKP1K",
            runway = "RW28",
            waypoints = {
                { name = "LEKPO", type = "LG" },
                { name = "D155V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "LICUT", type = "LG" },
            }
        },
        ["LEKP1L"] = {
            name = "LEKP1L",
            runway = "RW16",
            waypoints = {
                { name = "LEKPO", type = "LG" },
                { name = "MKR", type = "LG" },
                { name = "MKR", type = "LG", speed = 230.0 },
                { name = "CF16", type = "LG" },
            }
        },
        ["LEKP1P"] = {
            name = "LEKP1P",
            runway = "RW34",
            waypoints = {
                { name = "LEKPO", type = "LG" },
                { name = "D155X", type = "LG" },
                { name = "", type = "" },
                { name = "CD34Z", type = "LG" },
            }
        },
        ["LEKP2F"] = {
            name = "LEKP2F",
            runway = "RW16",
            waypoints = {
                { name = "LEKPO", type = "LG" },
                { name = "TSL", type = "LG" },
                { name = "D329S", type = "LG" },
                { name = "CF16", type = "LG", speed = 230.0 },
            }
        },
        ["LEKP2H"] = {
            name = "LEKP2H",
            runway = "RW34",
            waypoints = {
                { name = "LEKPO", type = "LG" },
                { name = "D154T", type = "LG" },
                { name = "", type = "" },
                { name = "CD34Y", type = "LG" },
            }
        },
        ["LOPO1D"] = {
            name = "LOPO1D",
            runway = "RW10",
            waypoints = {
                { name = "LOPOS", type = "LG" },
                { name = "D233V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "BENFE", type = "LG" },
            }
        },
        ["LOPO1J"] = {
            name = "LOPO1J",
            runway = "RW10",
            waypoints = {
                { name = "LOPOS", type = "LG" },
                { name = "D241V", type = "LG" },
                { name = "", type = "" },
                { name = "ARECE", type = "LG" },
            }
        },
        ["LOPO1K"] = {
            name = "LOPO1K",
            runway = "RW28",
            waypoints = {
                { name = "LOPOS", type = "LG" },
                { name = "D233V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "LICUT", type = "LG" },
            }
        },
        ["LOPO1P"] = {
            name = "LOPO1P",
            runway = "RW34",
            waypoints = {
                { name = "LOPOS", type = "LG" },
                { name = "D233P", type = "LG" },
                { name = "", type = "" },
                { name = "D171N", type = "LG" },
                { name = "CD34Z", type = "LG" },
            }
        },
        ["LOPO2H"] = {
            name = "LOPO2H",
            runway = "RW34",
            waypoints = {
                { name = "LOPOS", type = "LG" },
                { name = "D241L", type = "LG" },
                { name = "", type = "", speed = 230.0 },
                { name = "D176J", type = "LG" },
                { name = "CD34Y", type = "LG", speed = 230.0 },
            }
        },
        ["LOPO2L"] = {
            name = "LOPO2L",
            runway = "RW16",
            waypoints = {
                { name = "LOPOS", type = "LG" },
                { name = "D233Q", type = "LG" },
                { name = "", type = "" },
                { name = "D298O", type = "LG" },
                { name = "D333O", type = "LG" },
                { name = "CF16", type = "LG" },
            }
        },
        ["LOPO3F"] = {
            name = "LOPO3F",
            runway = "RW16",
            waypoints = {
                { name = "LOPOS", type = "LG" },
                { name = "D241U", type = "LG" },
                { name = "", type = "", speed = 230.0 },
                { name = "D303S", type = "LG" },
                { name = "D335S", type = "LG" },
                { name = "CF16", type = "LG", speed = 230.0 },
            }
        },
        ["ODIK1D"] = {
            name = "ODIK1D",
            runway = "RW10",
            waypoints = {
                { name = "ODIKO", type = "LG" },
                { name = "D019V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "BENFE", type = "LG" },
            }
        },
        ["ODIK1J"] = {
            name = "ODIK1J",
            runway = "RW10",
            waypoints = {
                { name = "ODIKO", type = "LG" },
                { name = "D015V", type = "LG" },
                { name = "", type = "" },
                { name = "ARECE", type = "LG" },
            }
        },
        ["ODIK1K"] = {
            name = "ODIK1K",
            runway = "RW28",
            waypoints = {
                { name = "ODIKO", type = "LG" },
                { name = "D019V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "LICUT", type = "LG" },
            }
        },
        ["ODIK1L"] = {
            name = "ODIK1L",
            runway = "RW16",
            waypoints = {
                { name = "ODIKO", type = "LG" },
                { name = "D019Q", type = "LG" },
                { name = "", type = "" },
                { name = "D350O", type = "LG" },
                { name = "CF16", type = "LG" },
            }
        },
        ["ODIK1P"] = {
            name = "ODIK1P",
            runway = "RW34",
            waypoints = {
                { name = "ODIKO", type = "LG" },
                { name = "MKR", type = "LG" },
                { name = "D178N", type = "LG", speed = 230.0 },
                { name = "CD34Z", type = "LG" },
            }
        },
        ["OSMO1D"] = {
            name = "OSMO1D",
            runway = "RW10",
            waypoints = {
                { name = "OSMOS", type = "LG" },
                { name = "D144V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "BENFE", type = "LG" },
            }
        },
        ["OSMO1J"] = {
            name = "OSMO1J",
            runway = "RW10",
            waypoints = {
                { name = "OSMOS", type = "LG" },
                { name = "D141T", type = "LG" },
                { name = "ARECE", type = "LG" },
            }
        },
        ["OSMO1K"] = {
            name = "OSMO1K",
            runway = "RW28",
            waypoints = {
                { name = "OSMOS", type = "LG" },
                { name = "D144V", type = "LG" },
                { name = "", type = "", speed = 250.0 },
                { name = "LICUT", type = "LG" },
            }
        },
        ["OSMO1L"] = {
            name = "OSMO1L",
            runway = "RW16",
            waypoints = {
                { name = "OSMOS", type = "LG" },
                { name = "MKR", type = "LG" },
                { name = "MKR", type = "LG", speed = 230.0 },
                { name = "CF16", type = "LG" },
            }
        },
        ["OSMO1P"] = {
            name = "OSMO1P",
            runway = "RW34",
            waypoints = {
                { name = "OSMOS", type = "LG" },
                { name = "D144X", type = "LG" },
                { name = "", type = "" },
                { name = "D156V", type = "LG" },
                { name = "CD34Z", type = "LG" },
            }
        },
        ["OSMO2F"] = {
            name = "OSMO2F",
            runway = "RW16",
            waypoints = {
                { name = "OSMOS", type = "LG" },
                { name = "TSL", type = "LG" },
                { name = "D329S", type = "LG" },
                { name = "CF16", type = "LG", speed = 230.0 },
            }
        },
        ["OSMO2H"] = {
            name = "OSMO2H",
            runway = "RW34",
            waypoints = {
                { name = "OSMOS", type = "LG" },
                { name = "D141T", type = "LG" },
                { name = "", type = "", speed = 230.0 },
                { name = "D155R", type = "LG" },
                { name = "CD34Y", type = "LG", speed = 230.0 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D10"] = {
            name = "D10",
            type = "A",
            runway = "D10",
            waypoints = {
                { name = "BENFE", transition = "BENFE", type = "LG", altitude_min = 5000 },
                { name = "CD10", transition = "BENFE", type = "LG", altitude_min = 2000 },
                { name = "CD10", transition = "", type = "LG", altitude_min = 2000 },
                { name = "FD10", transition = "", type = "LG", altitude_min = 2000 },
                { name = "MD10", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG", speed = 185.0 },
                { name = "D288X", transition = "", type = "LG", altitude_min = 5000, speed = 230.0 },
                { name = "BENFE", transition = "", type = "LG", altitude_min = 5000 },
                { name = "BENFE", transition = "", type = "LG", altitude_min = 5000, speed = 230.0 },
            }
        },
        ["D16"] = {
            name = "D16",
            type = "A",
            runway = "D16",
            waypoints = {
                { name = "FD16", transition = "FD16", type = "LG", altitude_min = 3500, speed = 230.0 },
                { name = "CF16", transition = "", type = "LG", altitude_min = 3500 },
                { name = "FD16", transition = "", type = "LG", altitude_min = 3000 },
                { name = "RW16", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "FD16", transition = "", type = "LG" },
                { name = "FD16", transition = "", type = "LG", altitude_min = 3500, speed = 230.0 },
            }
        },
        ["D28"] = {
            name = "D28",
            type = "A",
            runway = "D28",
            waypoints = {
                { name = "LICUT", transition = "LICUT", type = "LG", altitude_min = 5500 },
                { name = "CD28", transition = "LICUT", type = "LG", altitude_min = 4800 },
                { name = "CD28", transition = "", type = "LG", altitude_min = 4800 },
                { name = "FD28", transition = "", type = "LG", altitude_min = 4100 },
                { name = "75VOR", transition = "", type = "LG", altitude_min = 2770 },
                { name = "40VOR", transition = "", type = "LG", altitude_min = 1360 },
                { name = "MD28", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG", speed = 185.0 },
                { name = "MKR", transition = "", type = "LG", speed = 185.0 },
                { name = "LICUT", transition = "", type = "LG" },
                { name = "LICUT", transition = "", type = "LG", altitude_min = 5500, speed = 230.0 },
            }
        },
        ["D34-Y"] = {
            name = "D34-Y",
            type = "A",
            runway = "D34-Y",
            waypoints = {
                { name = "FD34Y", transition = "FD34Y", type = "LG", altitude_min = 4000, speed = 230.0 },
                { name = "CD34Y", transition = "", type = "LG", altitude_min = 4000 },
                { name = "FD34Y", transition = "", type = "LG", altitude_min = 3000 },
                { name = "MD34Y", transition = "", type = "LG" },
                { name = "MD34Y", transition = "", type = "LG" },
                { name = "TSL", transition = "", type = "LG" },
                { name = "TSL", transition = "", type = "LG" },
                { name = "FD34Y", transition = "", type = "LG" },
                { name = "FD34Y", transition = "", type = "LG", altitude_min = 4000, speed = 230.0 },
            }
        },
        ["D34-Z"] = {
            name = "D34-Z",
            type = "A",
            runway = "D34-Z",
            waypoints = {
                { name = "FD34Z", transition = "FD34Z", type = "LG", altitude_min = 4000, speed = 230.0 },
                { name = "CD34Z", transition = "", type = "LG", altitude_min = 4000 },
                { name = "FD34Z", transition = "", type = "LG", altitude_min = 3000 },
                { name = "RW34", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "FD34Z", transition = "", type = "LG" },
                { name = "FD34Z", transition = "", type = "LG", altitude_min = 4000, speed = 230.0 },
            }
        },
        ["I10-Y"] = {
            name = "I10-Y",
            type = "A",
            runway = "I10-Y",
            waypoints = {
                { name = "ARECE", transition = "ARECE", type = "LG", altitude_min = 5000 },
                { name = "CI10", transition = "ARECE", type = "LG", altitude_min = 2000 },
                { name = "CI10", transition = "", type = "LG" },
                { name = "FI10", transition = "", type = "LG" },
                { name = "RW10", transition = "", type = "LG" },
                { name = "", transition = "", type = "", altitude_min = 1400 },
                { name = "TSL", transition = "", type = "LG", speed = 185.0 },
                { name = "D299X", transition = "", type = "LG", altitude_min = 5000, speed = 230.0 },
                { name = "ARECE", transition = "", type = "LG", altitude_min = 5000 },
                { name = "ARECE", transition = "", type = "LG", altitude_min = 5000, speed = 230.0 },
            }
        },
        ["I10-Z"] = {
            name = "I10-Z",
            type = "A",
            runway = "I10-Z",
            waypoints = {
                { name = "BENFE", transition = "BENFE", type = "LG", altitude_min = 5000 },
                { name = "CI10", transition = "BENFE", type = "LG", altitude_min = 2000 },
                { name = "CI10", transition = "", type = "LG" },
                { name = "FI10", transition = "", type = "LG" },
                { name = "RW10", transition = "", type = "LG" },
                { name = "RW10", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG", speed = 185.0 },
                { name = "D288X", transition = "", type = "LG", altitude_min = 5000, speed = 230.0 },
                { name = "BENFE", transition = "", type = "LG", altitude_min = 5000 },
                { name = "BENFE", transition = "", type = "LG", altitude_min = 5000, speed = 230.0 },
            }
        },
        ["I16"] = {
            name = "I16",
            type = "A",
            runway = "I16",
            waypoints = {
                { name = "D342J", transition = "D342J", type = "LG", altitude_min = 3500, speed = 230.0 },
                { name = "CF16", transition = "", type = "LG" },
                { name = "FI16", transition = "", type = "LG" },
                { name = "RW16", transition = "", type = "LG" },
                { name = "D161G", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "MKR", transition = "", type = "LG" },
                { name = "D342J", transition = "", type = "LG" },
                { name = "D342J", transition = "", type = "LG", altitude_min = 3500, speed = 230.0 },
            }
        },
        ["R34-Y"] = {
            name = "R34-Y",
            type = "A",
            runway = "R34-Y",
            waypoints = {
                { name = "APZOC", transition = "APZOC", type = "LG", altitude_min = 5000 },
                { name = "CEFEB", transition = "APZOC", type = "LG", altitude_min = 4000, speed = 210.0 },
                { name = "NAFNU", transition = "NAFNU", type = "LG", altitude_min = 5000 },
                { name = "CEFEB", transition = "NAFNU", type = "LG", altitude_min = 4000, speed = 210.0 },
                { name = "YAMPO", transition = "YAMPO", type = "LG", altitude_min = 5000 },
                { name = "CEFEB", transition = "YAMPO", type = "LG", altitude_min = 4000, speed = 210.0 },
                { name = "CEFEB", transition = "", type = "LG", altitude_min = 4000, speed = 210.0 },
                { name = "TS626", transition = "", type = "LG", altitude_min = 3200 },
                { name = "RW34", transition = "", type = "LG" },
                { name = "TS619", transition = "", type = "LG", altitude_min = 2000, speed = 200.0 },
                { name = "MKR", transition = "", type = "LG", altitude_min = 3000, speed = 200.0 },
                { name = "APZOC", transition = "", type = "LG", altitude_min = 4000, speed = 200.0 },
                { name = "TS626", transition = "", type = "LG", altitude_min = 4000, speed = 200.0 },
                { name = "TS626", transition = "", type = "LG", altitude_min = 4000, speed = 200.0 },
            }
        },
        ["R34-Z"] = {
            name = "R34-Z",
            type = "A",
            runway = "R34-Z",
            waypoints = {
                { name = "APZOC", transition = "APZOC", type = "LG", altitude_min = 5000 },
                { name = "CEFEB", transition = "APZOC", type = "LG", altitude_min = 4000, speed = 210.0 },
                { name = "NAFNU", transition = "NAFNU", type = "LG", altitude_min = 5000 },
                { name = "CEFEB", transition = "NAFNU", type = "LG", altitude_min = 4000, speed = 210.0 },
                { name = "YAMPO", transition = "YAMPO", type = "LG", altitude_min = 5000 },
                { name = "CEFEB", transition = "YAMPO", type = "LG", altitude_min = 4000, speed = 210.0 },
                { name = "CEFEB", transition = "", type = "LG", altitude_min = 4000, speed = 210.0 },
                { name = "TS626", transition = "", type = "LG", altitude_min = 3500 },
                { name = "RW34", transition = "", type = "LG" },
                { name = "TS609", transition = "", type = "LG", altitude_min = 1300, speed = 200.0 },
                { name = "", transition = "", type = "" },
                { name = "FICLO", transition = "", type = "LG", altitude_min = 3000, speed = 200.0 },
                { name = "FICLO", transition = "", type = "LG", altitude_min = 3000, speed = 200.0 },
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
