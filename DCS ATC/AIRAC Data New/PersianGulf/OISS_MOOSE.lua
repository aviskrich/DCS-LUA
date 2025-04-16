local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OISS",
        Name = "OISS Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["D112M"] = { lat = 36.759419444, lon = 10.475483333, type = "DTTA" },
        ["MD29L"] = { lat = 34.332927778, lon = 47.187522222, type = "OICC" },
        ["MD29R"] = { lat = 20.515255556, lon = -103.292144444, type = "MMGL" },
        ["FD29R"] = { lat = 37.939444444, lon = 58.483611111, type = "UTAA" },
        ["SY30D"] = { lat = 29.967613889, lon = 52.888763889, type = "OISS" },
        ["PASOR"] = { lat = 29.419797222, lon = 52.882816667, type = "OISS" },
        ["KATUR"] = { lat = 28.944166667, lon = 51.441388889, type = "ENRT" },
        ["SY30B"] = { lat = 29.644783333, lon = 53.149655556, type = "OISS" },
        ["D308T"] = { lat = 39.599502778, lon = 8.640197222, type = "LIED" },
        ["KUPTO"] = { lat = 28.405, lon = 52.908888889, type = "ENRT" },
        ["D164Q"] = { lat = 52.95305, lon = 158.604763889, type = "UHPP" },
        ["D130Q"] = { lat = 38.707675, lon = 16.526588889, type = "LICA" },
        ["CI29L"] = { lat = 37.906666667, lon = 58.525, type = "UTAA" },
        ["KAVOT"] = { lat = 30.686388889, lon = 52.322777778, type = "ENRT" },
        ["KISED"] = { lat = 30.305555556, lon = 51.574444444, type = "ENRT" },
        ["KAVIL"] = { lat = 29.805555556, lon = 51.284444444, type = "ENRT" },
        ["IVERA"] = { lat = 29.384166667, lon = 51.261111111, type = "ENRT" },
        ["HAFEZ"] = { lat = 29.291388889, lon = 52.745277778, type = "OISS" },
        ["SY40H"] = { lat = 29.45285, lon = 51.831363889, type = "OISS" },
        ["FN285"] = { lat = 29.465327778, lon = 52.822586111, type = "OISS" },
        ["MS107"] = { lat = 29.551588889, lon = 52.552863889, type = "OISS" },
        ["SADIA"] = { lat = 29.598333333, lon = 52.906944444, type = "OISS" },
        ["D339Q"] = { lat = 29.809708333, lon = 52.486216667, type = "OISS" },
        ["D339T"] = { lat = 15.107663889, lon = -92.490877778, type = "MMTP" },
        ["D308Q"] = { lat = 29.726852778, lon = 52.343747222, type = "OISS" },
        ["FD29L"] = { lat = 34.298927778, lon = 47.279408333, type = "OICC" },
        ["SY30C"] = { lat = 30.015769444, lon = 52.407416667, type = "OISS" },
        ["D211Q"] = { lat = 37.493138889, lon = 112.464266667, type = "ZBYN" },
        ["D247Q"] = { lat = 30.099769444, lon = 120.168002778, type = "ZSHC" },
        ["D120Q"] = { lat = -0.094777778, lon = 32.679861111, type = "HUEN" },
        ["KASOL"] = { lat = 11.88, lon = 43.596111111, type = "ENRT" },
        ["D112T"] = { lat = 29.401133333, lon = 52.936038889, type = "OISS" },
        ["D280Q"] = { lat = 37.783205556, lon = 112.265383333, type = "ZBYN" },
        ["D029Q"] = { lat = 4.0219, lon = 8.848963889, type = "FGSL" },
        ["RW29L"] = { lat = 20.514083333, lon = -103.292666667, type = "MMGL" },
        ["LAGSA"] = { lat = 28.551666667, lon = 52.348888889, type = "ENRT" },
        ["D290E"] = { lat = 29.559955556, lon = 52.515855556, type = "OISS" },
        ["D190Q"] = { lat = 45.164322222, lon = 10.173777778, type = "LIPL" },
        ["SY40D"] = { lat = 29.307052778, lon = 51.873302778, type = "OISS" },
        ["SY40F"] = { lat = 29.693388889, lon = 51.844283333, type = "OISS" },
        ["ASNIT"] = { lat = 30.648333333, lon = 52.163333333, type = "ENRT" },
        ["KINOT"] = { lat = 30.535277778, lon = 53.291944444, type = "ENRT" },
        ["KUGVU"] = { lat = 29.129722222, lon = 51.338888889, type = "ENRT" },
        ["D180T"] = { lat = 35.906172222, lon = 59.62615, type = "OIMM" },
        ["70VOR"] = { lat = -4.338572222, lon = 15.516494444, type = "FZAA" },
        ["D259T"] = { lat = 37.661261111, lon = 112.214508333, type = "ZBYN" },
        ["D247T"] = { lat = 12.392027778, lon = -8.232972222, type = "GABS" },
        ["D090Q"] = { lat = 36.962791667, lon = 9.236636111, type = "DTKA" },
        ["FI29L"] = { lat = 37.927222222, lon = 58.478333333, type = "UTAA" },
        ["SYZ30"] = { lat = 30.031558333, lon = 52.475511111, type = "OISS" },
        ["D101Q"] = { lat = 40.159286111, lon = 0.450675, type = "LECH" },
        ["SY30F"] = { lat = 29.475083333, lon = 52.020594444, type = "OISS" },
        ["CD29R"] = { lat = 37.919722222, lon = 58.529444444, type = "UTAA" },
        ["D346T"] = { lat = 23.478777778, lon = -109.759436111, type = "MMSD" },
        ["CS294"] = { lat = 29.441369444, lon = 52.809880556, type = "OISS" },
        ["KATAG"] = { lat = 28.396111111, lon = 52.311388889, type = "ENRT" },
        ["DEPSU"] = { lat = 28.569166667, lon = 51.846388889, type = "ENRT" },
        ["SY30E"] = { lat = 29.430727778, lon = 53.147863889, type = "OISS" },
        ["D346Q"] = { lat = 44.47245, lon = 11.996522222, type = "LIPK" },
        ["SY40G"] = { lat = 29.9787, lon = 52.010791667, type = "OISS" },
        ["D180U"] = { lat = 29.189616667, lon = 52.571333333, type = "OISS" },
        ["CD29L"] = { lat = 34.264855556, lon = 47.371216667, type = "OICC" },
        ["VAVAS"] = { lat = 29.280555556, lon = 53.894444444, type = "ENRT" },
        ["D287T"] = { lat = 52.529522222, lon = 13.621038889, type = "EDDB" },
        ["NALBI"] = { lat = 29.780555556, lon = 53.899166667, type = "ENRT" },
        ["D280D"] = { lat = -15.321866667, lon = 28.348786111, type = "FLKK" },
        ["SY30G"] = { lat = 29.655475, lon = 52.030616667, type = "OISS" },
        ["D236Q"] = { lat = 50.090822222, lon = 4.280133333, type = "EBFS" },
        ["TAGTA"] = { lat = 28.719722222, lon = 53.538055556, type = "ENRT" },
        ["DASDO"] = { lat = 28.900277778, lon = 52.0975, type = "ENRT" },
        ["CS107"] = { lat = 29.631286111, lon = 52.301241667, type = "OISS" },
        ["SITEN"] = { lat = 29.035277778, lon = 52.925555556, type = "ENRT" },
        ["FS107"] = { lat = 29.602877778, lon = 52.39115, type = "OISS" },
    },

    -- Данные ВПП
    Runways = {
        ["RW11L"] = {
            heading = 110,
            length = 0,
            width = 0,
            threshold = { lat = 29.54913888888889, lon = 52.57044722222223 },
            end = { lat = 29.54913888888889, lon = 52.57044722222223 }
        },
        ["RW11R"] = {
            heading = 110,
            length = 0,
            width = 0,
            threshold = { lat = 29.545147222222223, lon = 52.56908888888889 },
            end = { lat = 29.545147222222223, lon = 52.56908888888889 }
        },
        ["RW29L"] = {
            heading = 290,
            length = 400.0,
            width = 0,
            threshold = { lat = 29.529191666666666, lon = 52.60918888888889 },
            end = { lat = 29.551707360453204, lon = 52.53809243300162 }
        },
        ["RW29R"] = {
            heading = 290,
            length = 300.0,
            width = 0,
            threshold = { lat = 29.532947222222223, lon = 52.61114444444445 },
            end = { lat = 29.549833992562128, lon = 52.55782012255177 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ASNI1A"] = {
            name = "ASNI1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "", type = "" },
                { name = "ASNIT", type = "E" },
            }
        },
        ["ASNI1B"] = {
            name = "ASNI1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 11500 },
                { name = "SYZ", type = "D" },
                { name = "D339T", type = "P" },
                { name = "ASNIT", type = "E" },
            }
        },
        ["ASNI1E"] = {
            name = "ASNI1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "ASNIT", type = "E" },
            }
        },
        ["ASNI1F"] = {
            name = "ASNI1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 11500 },
                { name = "D112T", type = "P" },
                { name = "D339T", type = "P" },
                { name = "ASNIT", type = "E" },
            }
        },
        ["DEPS1A"] = {
            name = "DEPS1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "DEPSU", type = "E" },
            }
        },
        ["DEPS1B"] = {
            name = "DEPS1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "", type = "" },
                { name = "DEPSU", type = "E" },
            }
        },
        ["DEPS1C"] = {
            name = "DEPS1C",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "DEPSU", type = "E" },
            }
        },
        ["DEPS1D"] = {
            name = "DEPS1D",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "DEPSU", type = "E" },
            }
        },
        ["DEPS1E"] = {
            name = "DEPS1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "DEPSU", type = "E" },
            }
        },
        ["DEPS1F"] = {
            name = "DEPS1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "", type = "" },
                { name = "DEPSU", type = "E" },
            }
        },
        ["DEPS1G"] = {
            name = "DEPS1G",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "DEPSU", type = "E" },
            }
        },
        ["DEPS1H"] = {
            name = "DEPS1H",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "", type = "" },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "DEPSU", type = "E" },
            }
        },
        ["IVER1A"] = {
            name = "IVER1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "", type = "" },
                { name = "IVERA", type = "E" },
            }
        },
        ["IVER1B"] = {
            name = "IVER1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D" },
                { name = "IVERA", type = "E" },
            }
        },
        ["IVER1C"] = {
            name = "IVER1C",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "IVERA", type = "E" },
            }
        },
        ["IVER1D"] = {
            name = "IVER1D",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "IVERA", type = "E" },
            }
        },
        ["KASO1A"] = {
            name = "KASO1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "SITEN", type = "E" },
                { name = "KASOL", type = "E" },
            }
        },
        ["KASO1B"] = {
            name = "KASO1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "", type = "" },
                { name = "SITEN", type = "E" },
                { name = "KASOL", type = "E" },
            }
        },
        ["KASO1E"] = {
            name = "KASO1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "KASOL", type = "E" },
            }
        },
        ["KASO1F"] = {
            name = "KASO1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "", type = "" },
                { name = "KASOL", type = "E" },
            }
        },
        ["KATA1A"] = {
            name = "KATA1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "KATAG", type = "E" },
            }
        },
        ["KATA1B"] = {
            name = "KATA1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "", type = "" },
                { name = "KATAG", type = "E" },
            }
        },
        ["KATA1E"] = {
            name = "KATA1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "KATAG", type = "E" },
            }
        },
        ["KATA1F"] = {
            name = "KATA1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "", type = "" },
                { name = "KATAG", type = "E" },
            }
        },
        ["KATU1A"] = {
            name = "KATU1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "KATUR", type = "E" },
            }
        },
        ["KATU1B"] = {
            name = "KATU1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "", type = "" },
                { name = "KATUR", type = "E" },
            }
        },
        ["KATU1C"] = {
            name = "KATU1C",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "KATUR", type = "E" },
            }
        },
        ["KATU1D"] = {
            name = "KATU1D",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "KATUR", type = "E" },
            }
        },
        ["KATU1E"] = {
            name = "KATU1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "KATUR", type = "E" },
            }
        },
        ["KATU1F"] = {
            name = "KATU1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "", type = "" },
                { name = "KATUR", type = "E" },
            }
        },
        ["KATU1G"] = {
            name = "KATU1G",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "KATUR", type = "E" },
            }
        },
        ["KATU1H"] = {
            name = "KATU1H",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "", type = "" },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "KATUR", type = "E" },
            }
        },
        ["KAVI1A"] = {
            name = "KAVI1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "", type = "" },
                { name = "KAVIL", type = "E" },
            }
        },
        ["KAVI1B"] = {
            name = "KAVI1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D" },
                { name = "KAVIL", type = "E" },
            }
        },
        ["KAVI1E"] = {
            name = "KAVI1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "", type = "" },
                { name = "KAVIL", type = "E" },
            }
        },
        ["KAVI1F"] = {
            name = "KAVI1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D" },
                { name = "KAVIL", type = "E" },
            }
        },
        ["KAVO1A"] = {
            name = "KAVO1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "", type = "" },
                { name = "KAVOT", type = "E" },
            }
        },
        ["KAVO1B"] = {
            name = "KAVO1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 11500 },
                { name = "SYZ", type = "D" },
                { name = "D346T", type = "P" },
                { name = "KAVOT", type = "E" },
            }
        },
        ["KAVO1C"] = {
            name = "KAVO1C",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "", type = "" },
                { name = "KAVOT", type = "E" },
            }
        },
        ["KAVO1E"] = {
            name = "KAVO1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "KAVOT", type = "E" },
            }
        },
        ["KAVO1F"] = {
            name = "KAVO1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 11500 },
                { name = "D112T", type = "P" },
                { name = "D346T", type = "P" },
                { name = "KAVOT", type = "E" },
            }
        },
        ["KINO1A"] = {
            name = "KINO1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "KINOT", type = "E" },
            }
        },
        ["KINO1B"] = {
            name = "KINO1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "", type = "" },
                { name = "KINOT", type = "E" },
            }
        },
        ["KINO1E"] = {
            name = "KINO1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "KINOT", type = "E" },
            }
        },
        ["KINO1F"] = {
            name = "KINO1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "", type = "" },
                { name = "KINOT", type = "E" },
            }
        },
        ["KISE1A"] = {
            name = "KISE1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "", type = "" },
                { name = "KISED", type = "E" },
            }
        },
        ["KISE1B"] = {
            name = "KISE1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D" },
                { name = "KISED", type = "E" },
            }
        },
        ["KISE1E"] = {
            name = "KISE1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "", type = "" },
                { name = "KISED", type = "E" },
            }
        },
        ["KISE1F"] = {
            name = "KISE1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D" },
                { name = "KISED", type = "E" },
            }
        },
        ["KUGV1A"] = {
            name = "KUGV1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "KUGVU", type = "E" },
            }
        },
        ["KUGV1B"] = {
            name = "KUGV1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "", type = "" },
                { name = "KUGVU", type = "E" },
            }
        },
        ["KUGV1C"] = {
            name = "KUGV1C",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "KUGVU", type = "E" },
            }
        },
        ["KUGV1D"] = {
            name = "KUGV1D",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "D180U", type = "P" },
                { name = "", type = "" },
                { name = "KUGVU", type = "E" },
            }
        },
        ["KUGV1E"] = {
            name = "KUGV1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "KUGVU", type = "E" },
            }
        },
        ["KUGV1F"] = {
            name = "KUGV1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "", type = "" },
                { name = "KUGVU", type = "E" },
            }
        },
        ["KUGV1G"] = {
            name = "KUGV1G",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "KUGVU", type = "E" },
            }
        },
        ["KUGV1H"] = {
            name = "KUGV1H",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "", type = "" },
                { name = "D180T", type = "P" },
                { name = "", type = "" },
                { name = "KUGVU", type = "E" },
            }
        },
        ["KUPT1A"] = {
            name = "KUPT1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "KUPTO", type = "E" },
            }
        },
        ["KUPT1B"] = {
            name = "KUPT1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "", type = "" },
                { name = "KUPTO", type = "E" },
            }
        },
        ["KUPT1E"] = {
            name = "KUPT1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "KUPTO", type = "E" },
            }
        },
        ["KUPT1F"] = {
            name = "KUPT1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "", type = "" },
                { name = "KUPTO", type = "E" },
            }
        },
        ["NALB1A"] = {
            name = "NALB1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "NALBI", type = "E" },
            }
        },
        ["NALB1B"] = {
            name = "NALB1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "", type = "" },
                { name = "NALBI", type = "E" },
            }
        },
        ["NALB1E"] = {
            name = "NALB1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "NALBI", type = "E" },
            }
        },
        ["NALB1F"] = {
            name = "NALB1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "", type = "" },
                { name = "NALBI", type = "E" },
            }
        },
        ["TAGT1A"] = {
            name = "TAGT1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SYZ", type = "D" },
                { name = "SYZ", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "SITEN", type = "E" },
                { name = "TAGTA", type = "E" },
            }
        },
        ["TAGT1B"] = {
            name = "TAGT1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SYZ", type = "D" },
                { name = "", type = "" },
                { name = "SITEN", type = "E" },
                { name = "TAGTA", type = "E" },
            }
        },
        ["TAGT1E"] = {
            name = "TAGT1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 5330 },
                { name = "", type = "", altitude_min = 6300 },
                { name = "SR", type = "D" },
                { name = "SR", type = "D", altitude_min = 9000, speed = 230.0 },
                { name = "SITEN", type = "E" },
                { name = "TAGTA", type = "E" },
            }
        },
        ["TAGT1F"] = {
            name = "TAGT1F",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 10000 },
                { name = "SR", type = "D" },
                { name = "", type = "" },
                { name = "SITEN", type = "E" },
                { name = "TAGTA", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ASNI1P"] = {
            name = "ASNI1P",
            runway = "RW29B",
            waypoints = {
                { name = "ASNIT", type = "OI" },
                { name = "SY30C", type = "OI" },
                { name = "D339Q", type = "OI" },
                { name = "SADIA", type = "OI" },
            }
        },
        ["ASNI1X"] = {
            name = "ASNI1X",
            runway = "RW11B",
            waypoints = {
                { name = "ASNIT", type = "OI" },
                { name = "D339T", type = "OI" },
                { name = "D287T", type = "OI" },
            }
        },
        ["DASD2R"] = {
            name = "DASD2R",
            runway = "RW29B",
            waypoints = {
                { name = "DASDO", type = "OI" },
                { name = "D211Q", type = "OI" },
                { name = "HAFEZ", type = "OI" },
            }
        },
        ["IVER1T"] = {
            name = "IVER1T",
            runway = "RW29B",
            waypoints = {
                { name = "IVERA", type = "OI" },
                { name = "SY40H", type = "OI" },
                { name = "D259T", type = "OI" },
                { name = "D308T", type = "OI" },
                { name = "SYZ", type = "OI" },
            }
        },
        ["IVER1X"] = {
            name = "IVER1X",
            runway = "RW11B",
            waypoints = {
                { name = "IVERA", type = "OI" },
                { name = "SY30F", type = "OI" },
                { name = "D259T", type = "OI" },
                { name = "D287T", type = "OI" },
            }
        },
        ["KASO1R"] = {
            name = "KASO1R",
            runway = "RW29B",
            waypoints = {
                { name = "KASOL", type = "OI" },
                { name = "HAFEZ", type = "OI" },
            }
        },
        ["KATU1R"] = {
            name = "KATU1R",
            runway = "RW29B",
            waypoints = {
                { name = "KATUR", type = "OI" },
                { name = "D236Q", type = "OI" },
                { name = "HAFEZ", type = "OI" },
            }
        },
        ["KAVI1S"] = {
            name = "KAVI1S",
            runway = "RW29B",
            waypoints = {
                { name = "KAVIL", type = "OI" },
                { name = "SY40F", type = "OI" },
                { name = "D280Q", type = "OI" },
                { name = "SYZ", type = "OI" },
            }
        },
        ["KAVI1X"] = {
            name = "KAVI1X",
            runway = "RW11B",
            waypoints = {
                { name = "KAVIL", type = "OI" },
                { name = "SY30G", type = "OI" },
                { name = "", type = "" },
                { name = "D287T", type = "OI" },
            }
        },
        ["KAVO1P"] = {
            name = "KAVO1P",
            runway = "RW29B",
            waypoints = {
                { name = "KAVOT", type = "OI" },
                { name = "SYZ30", type = "OI" },
                { name = "D346Q", type = "OI" },
                { name = "SADIA", type = "OI" },
            }
        },
        ["KINO1P"] = {
            name = "KINO1P",
            runway = "RW29B",
            waypoints = {
                { name = "KINOT", type = "OI" },
                { name = "SY30D", type = "OI" },
                { name = "D029Q", type = "OI" },
                { name = "SADIA", type = "OI" },
            }
        },
        ["KISE1S"] = {
            name = "KISE1S",
            runway = "RW29B",
            waypoints = {
                { name = "KISED", type = "OI" },
                { name = "SY40G", type = "OI" },
                { name = "D308Q", type = "OI" },
                { name = "SYZ", type = "OI" },
            }
        },
        ["KISE2X"] = {
            name = "KISE2X",
            runway = "RW11B",
            waypoints = {
                { name = "KISED", type = "OI" },
                { name = "SY40G", type = "OI" },
                { name = "D308T", type = "OI" },
                { name = "D287T", type = "OI" },
            }
        },
        ["KUGV1R"] = {
            name = "KUGV1R",
            runway = "RW29B",
            waypoints = {
                { name = "KUGVU", type = "OI" },
                { name = "SY40D", type = "OI" },
                { name = "D247Q", type = "OI" },
                { name = "HAFEZ", type = "OI" },
            }
        },
        ["KUGV1X"] = {
            name = "KUGV1X",
            runway = "RW11B",
            waypoints = {
                { name = "KUGVU", type = "OI" },
                { name = "SY40D", type = "OI" },
                { name = "D247T", type = "OI" },
                { name = "D287T", type = "OI" },
            }
        },
        ["KUPT1R"] = {
            name = "KUPT1R",
            runway = "RW29B",
            waypoints = {
                { name = "KUPTO", type = "OI" },
                { name = "D164Q", type = "OI" },
                { name = "HAFEZ", type = "OI" },
            }
        },
        ["LAGS2R"] = {
            name = "LAGS2R",
            runway = "RW29B",
            waypoints = {
                { name = "LAGSA", type = "OI" },
                { name = "D190Q", type = "OI" },
                { name = "HAFEZ", type = "OI" },
            }
        },
        ["NALB1P"] = {
            name = "NALB1P",
            runway = "RW29B",
            waypoints = {
                { name = "NALBI", type = "OI" },
                { name = "SY30B", type = "OI" },
                { name = "SADIA", type = "OI" },
            }
        },
        ["TAGT1R"] = {
            name = "TAGT1R",
            runway = "RW29B",
            waypoints = {
                { name = "TAGTA", type = "OI" },
                { name = "SITEN", type = "OI" },
                { name = "HAFEZ", type = "OI" },
            }
        },
        ["VAVA1S"] = {
            name = "VAVA1S",
            runway = "RW29B",
            waypoints = {
                { name = "VAVAS", type = "OI" },
                { name = "SY30E", type = "OI" },
                { name = "D101Q", type = "OI" },
                { name = "SYZ", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D29L"] = {
            name = "D29L",
            type = "A",
            runway = "D29L",
            waypoints = {
                { name = "HAFEZ", transition = "HAFEZ", type = "OI" },
                { name = "D130Q", transition = "HAFEZ", type = "OI", altitude_min = 10000 },
                { name = "CD29L", transition = "HAFEZ", type = "OI", altitude_min = 8400 },
                { name = "SADIA", transition = "SADIA", type = "OI" },
                { name = "D090Q", transition = "SADIA", type = "OI", altitude_min = 9500 },
                { name = "CD29L", transition = "SADIA", type = "OI", altitude_min = 8400 },
                { name = "CD29L", transition = "", type = "OI", altitude_min = 8400 },
                { name = "FD29L", transition = "", type = "OI", altitude_min = 7200 },
                { name = "MD29L", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI", altitude_min = 9000 },
                { name = "HAFEZ", transition = "", type = "OI", speed = 185.0 },
                { name = "HAFEZ", transition = "", type = "OI", speed = 230.0 },
            }
        },
        ["D29R"] = {
            name = "D29R",
            type = "A",
            runway = "D29R",
            waypoints = {
                { name = "HAFEZ", transition = "HAFEZ", type = "OI" },
                { name = "D130Q", transition = "HAFEZ", type = "OI", altitude_min = 10000 },
                { name = "CD29R", transition = "HAFEZ", type = "OI", altitude_min = 8400 },
                { name = "SADIA", transition = "SADIA", type = "OI" },
                { name = "D090Q", transition = "SADIA", type = "OI", altitude_min = 9500 },
                { name = "CD29R", transition = "SADIA", type = "OI", altitude_min = 8400 },
                { name = "CD29R", transition = "", type = "OI", altitude_min = 8400 },
                { name = "FD29R", transition = "", type = "OI", altitude_min = 7200 },
                { name = "MD29R", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI", altitude_min = 9000 },
                { name = "HAFEZ", transition = "", type = "OI", speed = 185.0 },
                { name = "HAFEZ", transition = "", type = "OI", speed = 230.0 },
            }
        },
        ["I29LX"] = {
            name = "I29LX",
            type = "A",
            runway = "I29LX",
            waypoints = {
                { name = "SR", transition = "SR1", type = "OI", altitude_min = 11500 },
                { name = "SR", transition = "SR1", type = "OI", altitude_min = 9000, speed = 200.0 },
                { name = "D112M", transition = "SR1", type = "OI", altitude_min = 8400 },
                { name = "CI29L", transition = "SR1", type = "OI", altitude_min = 8360 },
                { name = "SR", transition = "SR2", type = "OI", altitude_min = 11500 },
                { name = "SR", transition = "SR2", type = "OI", altitude_min = 9000 },
                { name = "D112M", transition = "SR2", type = "OI", altitude_min = 8400 },
                { name = "CI29L", transition = "SR2", type = "OI", altitude_min = 8360 },
                { name = "CI29L", transition = "", type = "OI" },
                { name = "FI29L", transition = "", type = "OI" },
                { name = "RW29L", transition = "", type = "OI" },
                { name = "SR", transition = "", type = "OI" },
                { name = "D290E", transition = "", type = "OI" },
                { name = "SR", transition = "", type = "OI", altitude_min = 9000 },
                { name = "SR", transition = "", type = "OI", altitude_min = 10000 },
                { name = "SR", transition = "", type = "OI", speed = 185.0 },
                { name = "SR", transition = "", type = "OI", altitude_min = 11500, speed = 230.0 },
            }
        },
        ["I29LY"] = {
            name = "I29LY",
            type = "A",
            runway = "I29LY",
            waypoints = {
                { name = "SYZ", transition = "SYZ", type = "OI", altitude_min = 11500 },
                { name = "SYZ", transition = "SYZ", type = "OI", altitude_min = 9300, speed = 200.0 },
                { name = "CI29L", transition = "SYZ", type = "OI", altitude_min = 8360 },
                { name = "CI29L", transition = "", type = "OI" },
                { name = "FI29L", transition = "", type = "OI" },
                { name = "RW29L", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI" },
                { name = "D280D", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI", altitude_min = 9000 },
                { name = "SYZ", transition = "", type = "OI", altitude_min = 10000 },
                { name = "SYZ", transition = "", type = "OI", speed = 185.0 },
                { name = "SYZ", transition = "", type = "OI", altitude_min = 11500, speed = 230.0 },
            }
        },
        ["I29LZ"] = {
            name = "I29LZ",
            type = "A",
            runway = "I29LZ",
            waypoints = {
                { name = "HAFEZ", transition = "HAFEZ", type = "OI" },
                { name = "D120Q", transition = "HAFEZ", type = "OI", altitude_min = 10000 },
                { name = "PASOR", transition = "HAFEZ", type = "OI", altitude_min = 9000 },
                { name = "D112M", transition = "HAFEZ", type = "OI", altitude_min = 9000 },
                { name = "CI29L", transition = "HAFEZ", type = "OI", altitude_min = 8360 },
                { name = "SADIA", transition = "SADIA", type = "OI" },
                { name = "D090Q", transition = "SADIA", type = "OI", altitude_min = 9500 },
                { name = "PASOR", transition = "SADIA", type = "OI", altitude_min = 9000 },
                { name = "D112M", transition = "SADIA", type = "OI", altitude_min = 9000 },
                { name = "CI29L", transition = "SADIA", type = "OI", altitude_min = 8360 },
                { name = "SYZ", transition = "SYZ1", type = "OI", altitude_min = 11500 },
                { name = "SYZ", transition = "SYZ1", type = "OI", altitude_min = 9000, speed = 200.0 },
                { name = "D112M", transition = "SYZ1", type = "OI", altitude_min = 9000 },
                { name = "CI29L", transition = "SYZ1", type = "OI", altitude_min = 8360 },
                { name = "SYZ", transition = "SYZ2", type = "OI", altitude_min = 11500 },
                { name = "SYZ", transition = "SYZ2", type = "OI", altitude_min = 9000 },
                { name = "D112M", transition = "SYZ2", type = "OI", altitude_min = 9000 },
                { name = "CI29L", transition = "SYZ2", type = "OI", altitude_min = 8360 },
                { name = "CI29L", transition = "", type = "OI" },
                { name = "FI29L", transition = "", type = "OI" },
                { name = "RW29L", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI" },
                { name = "D280D", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI", altitude_min = 9000 },
                { name = "HAFEZ", transition = "", type = "OI", speed = 185.0 },
                { name = "HAFEZ", transition = "", type = "OI", altitude_min = 13000, speed = 230.0 },
            }
        },
        ["NDBA"] = {
            name = "NDBA",
            type = "A",
            runway = "NDBA",
            waypoints = {
                { name = "SR", transition = "SR", type = "OI", altitude_min = 11500 },
                { name = "SR", transition = "SR", type = "OI", altitude_min = 9300, speed = 185.0 },
                { name = "FN285", transition = "SR", type = "OI", altitude_min = 9300 },
                { name = "FN285", transition = "", type = "OI", altitude_min = 9300 },
                { name = "SR", transition = "", type = "OI" },
                { name = "SR", transition = "", type = "OI", altitude_min = 7000 },
                { name = "SR", transition = "", type = "OI", altitude_min = 9000 },
                { name = "SR", transition = "", type = "OI", altitude_min = 10000 },
                { name = "SR", transition = "", type = "OI", speed = 185.0 },
                { name = "SR", transition = "", type = "OI", speed = 230.0 },
            }
        },
        ["VORA"] = {
            name = "VORA",
            type = "A",
            runway = "VORA",
            waypoints = {
                { name = "SYZ", transition = "SYZ1", type = "OI", altitude_min = 11500 },
                { name = "SYZ", transition = "SYZ1", type = "OI", altitude_min = 9200, speed = 185.0 },
                { name = "CS294", transition = "SYZ1", type = "OI", altitude_min = 9200 },
                { name = "SYZ", transition = "SYZ2", type = "OI", altitude_min = 11500 },
                { name = "SYZ", transition = "SYZ2", type = "OI", altitude_min = 9200 },
                { name = "CS294", transition = "SYZ2", type = "OI", altitude_min = 9200 },
                { name = "CS294", transition = "", type = "OI", altitude_min = 9200 },
                { name = "FD29L", transition = "", type = "OI", altitude_min = 7200 },
                { name = "MD29L", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI", altitude_min = 9000 },
                { name = "SYZ", transition = "", type = "OI", altitude_min = 10000 },
                { name = "SYZ", transition = "", type = "OI", speed = 185.0 },
                { name = "SYZ", transition = "", type = "OI", altitude_min = 11500, speed = 230.0 },
            }
        },
        ["VORB"] = {
            name = "VORB",
            type = "A",
            runway = "VORB",
            waypoints = {
                { name = "D287T", transition = "D287T", type = "OI", altitude_min = 12500 },
                { name = "CS107", transition = "D287T", type = "OI", altitude_min = 10500 },
                { name = "CS107", transition = "", type = "OI", altitude_min = 10500 },
                { name = "FS107", transition = "", type = "OI", altitude_min = 9000 },
                { name = "70VOR", transition = "", type = "OI", altitude_min = 7800 },
                { name = "MS107", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI" },
                { name = "SYZ", transition = "", type = "OI", altitude_min = 9000 },
                { name = "SYZ", transition = "", type = "OI", altitude_min = 10000 },
                { name = "D287T", transition = "", type = "OI" },
                { name = "D287T", transition = "", type = "OI", altitude_min = 12500, speed = 230.0 },
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
