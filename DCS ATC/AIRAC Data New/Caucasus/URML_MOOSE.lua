local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "URML",
        Name = "URML Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["ML049"] = { lat = 43.000111111, lon = 47.849305556, type = "URML" },
        ["BUIKS"] = { lat = 42.821388889, lon = 47.126944444, type = "URML" },
        ["ML021"] = { lat = 42.931388889, lon = 48.065333333, type = "URML" },
        ["ML005"] = { lat = 42.919777778, lon = 47.564805556, type = "URML" },
        ["D289Y"] = { lat = 42.652130556, lon = 48.141075, type = "URML" },
        ["ML033"] = { lat = 43.120166667, lon = 47.640888889, type = "URML" },
        ["ML017"] = { lat = 42.913277778, lon = 48.04875, type = "URML" },
        ["ML003"] = { lat = 42.611416667, lon = 47.826444444, type = "URML" },
        ["ML044"] = { lat = 43.196583333, lon = 47.261305556, type = "URML" },
        ["D139Y"] = { lat = 17.997833333, lon = -15.629055556, type = "GQNO" },
        ["ML015"] = { lat = 43.049083333, lon = 47.831277778, type = "URML" },
        ["ML028"] = { lat = 42.395555556, lon = 47.836361111, type = "URML" },
        ["ML037"] = { lat = 42.443916667, lon = 48.0295, type = "URML" },
        ["H"] = { lat = 48.428055556, lon = 17.824444444, type = "ENRT" },
        ["ML029"] = { lat = 42.411027778, lon = 47.935388889, type = "URML" },
        ["ML007"] = { lat = 43.119305556, lon = 47.518166667, type = "URML" },
        ["D303Z"] = { lat = 42.532244444, lon = 48.096244444, type = "URML" },
        ["ML045"] = { lat = 43.24, lon = 47.35525, type = "URML" },
        ["D040P"] = { lat = 42.650527778, lon = 47.370211111, type = "URML" },
        ["ML047"] = { lat = 43.246055556, lon = 47.574055556, type = "URML" },
        ["ML032"] = { lat = 42.580805556, lon = 48.115833333, type = "URML" },
        ["DUBKI"] = { lat = 43.059166667, lon = 46.848055556, type = "ENRT" },
        ["D106Z"] = { lat = 42.959097222, lon = 47.149755556, type = "URML" },
        ["CF14"] = { lat = 64.106766667, lon = -160.971561111, type = "PAUN" },
        ["ML018"] = { lat = 42.621138889, lon = 47.709777778, type = "URML" },
        ["D240Y"] = { lat = 42.959, lon = 48.186647222, type = "URML" },
        ["CF32"] = { lat = 42.621727778, lon = 47.817586111, type = "URML" },
        ["ML016"] = { lat = 43.239805556, lon = 47.409722222, type = "URML" },
        ["ML034"] = { lat = 42.657611111, lon = 48.124666667, type = "URML" },
        ["ML048"] = { lat = 42.800916667, lon = 48.134833333, type = "URML" },
        ["ML031"] = { lat = 42.509555556, lon = 48.084083333, type = "URML" },
        ["ML035"] = { lat = 42.5795, lon = 48.127861111, type = "URML" },
        ["ML004"] = { lat = 42.703, lon = 47.749, type = "URML" },
        ["ML009"] = { lat = 43.023333333, lon = 47.476027778, type = "URML" },
        ["D248P"] = { lat = 42.749705556, lon = 47.294416667, type = "URML" },
        ["DER32"] = { lat = 42.826869444, lon = 47.643844444, type = "URML" },
        ["ML020"] = { lat = 42.741111111, lon = 48.043972222, type = "URML" },
        ["DER14"] = { lat = 47.169861111, lon = 27.630138889, type = "LRIA" },
        ["ML006"] = { lat = 42.738972222, lon = 48.072555556, type = "URML" },
        ["D288Y"] = { lat = 42.622663889, lon = 48.175930556, type = "URML" },
        ["FF32"] = { lat = 51.247675, lon = -80.527147222, type = "CYMO" },
        ["FN32X"] = { lat = 42.595952778, lon = 47.839205556, type = "URML" },
        ["ML001"] = { lat = 42.597222222, lon = 47.961527778, type = "URML" },
        ["AGNET"] = { lat = 42.23, lon = 48.211666667, type = "ENRT" },
        ["ML053"] = { lat = 43.20325, lon = 47.253027778, type = "URML" },
        ["AMKOL"] = { lat = 43.618333333, lon = 47.5, type = "ENRT" },
        ["FN14X"] = { lat = 43.046419444, lon = 47.456669444, type = "URML" },
        ["D240X"] = { lat = 42.995686111, lon = 48.157880556, type = "URML" },
        ["ML013"] = { lat = 42.884333333, lon = 47.594888889, type = "URML" },
        ["D047P"] = { lat = 42.619636111, lon = 47.391819444, type = "URML" },
        ["GUDEN"] = { lat = 59.232897222, lon = -130.0, type = "ENRT" },
        ["ML040"] = { lat = 42.397444444, lon = 47.732388889, type = "URML" },
        ["ML025"] = { lat = 42.563277778, lon = 47.313611111, type = "URML" },
        ["LARKA"] = { lat = 42.441666667, lon = 47.063333333, type = "ENRT" },
        ["D222P"] = { lat = 42.644008333, lon = 47.372230556, type = "URML" },
        ["D038P"] = { lat = 42.664597222, lon = 47.361894444, type = "URML" },
        ["FF14"] = { lat = 53.109625, lon = -112.864025, type = "CEQ3" },
        ["ML008"] = { lat = 43.037, lon = 47.339888889, type = "URML" },
        ["D165X"] = { lat = 43.208497222, lon = 47.5896, type = "URML" },
        ["CF32Y"] = { lat = 42.63135, lon = 47.809466667, type = "URML" },
        ["RIRAN"] = { lat = 43.135, lon = 48.656666667, type = "ENRT" },
        ["ML026"] = { lat = 42.441194444, lon = 47.646694444, type = "URML" },
        ["ML038"] = { lat = 42.402694444, lon = 47.939916667, type = "URML" },
        ["ML022"] = { lat = 43.11025, lon = 47.653972222, type = "URML" },
        ["ML036"] = { lat = 42.505305556, lon = 48.094805556, type = "URML" },
        ["D318Z"] = { lat = 9.303333333, lon = 38.51, type = "HAAB" },
        ["MD32"] = { lat = -20.443563889, lon = 57.711408333, type = "FIMP" },
        ["BALIP"] = { lat = 42.493611111, lon = 48.57, type = "ENRT" },
        ["ML014"] = { lat = 43.093972222, lon = 47.60625, type = "URML" },
        ["D165Y"] = { lat = 43.245269444, lon = 47.558275, type = "URML" },
        ["FQ14W"] = { lat = 42.899983333, lon = 47.581583333, type = "URML" },
        ["FD14"] = { lat = -20.820805556, lon = 55.357027778, type = "FMEE" },
        ["ML056"] = { lat = 42.811027778, lon = 47.171472222, type = "URML" },
        ["ML019"] = { lat = 42.737722222, lon = 47.719583333, type = "URML" },
        ["D073P"] = { lat = 42.730502778, lon = 47.325916667, type = "URML" },
        ["FD32"] = { lat = -20.473397222, lon = 57.768966667, type = "FIMP" },
        ["ML042"] = { lat = 42.998305556, lon = 47.309055556, type = "URML" },
        ["ML024"] = { lat = 42.433805556, lon = 47.907833333, type = "URML" },
        ["ML051"] = { lat = 43.266194444, lon = 47.463444444, type = "URML" },
        ["INGUT"] = { lat = 43.586666667, lon = 46.936666667, type = "ENRT" },
        ["S"] = { lat = 11.381138889, lon = 43.326916667, type = "HDAM" },
        ["ML039"] = { lat = 42.386555556, lon = 47.836777778, type = "URML" },
        ["36DME"] = { lat = 52.134444444, lon = 23.800833333, type = "UMBB" },
        ["ML050"] = { lat = 42.898055556, lon = 47.97025, type = "URML" },
        ["ML011"] = { lat = 42.685611111, lon = 47.764, type = "URML" },
        ["ML054"] = { lat = 43.136444444, lon = 47.182583333, type = "URML" },
        ["ML012"] = { lat = 43.195777778, lon = 47.59125, type = "URML" },
        ["ML010"] = { lat = 42.931111111, lon = 47.554972222, type = "URML" },
        ["ML043"] = { lat = 43.13225, lon = 47.193472222, type = "URML" },
        ["ML055"] = { lat = 43.055972222, lon = 47.147694444, type = "URML" },
        ["D066P"] = { lat = 70.229880556, lon = -147.637347222, type = "PASC" },
        ["ML046"] = { lat = 43.257194444, lon = 47.463916667, type = "URML" },
        ["D063P"] = { lat = 42.764066667, lon = 47.275491667, type = "URML" },
        ["D303Y"] = { lat = 42.567572222, lon = 48.066513889, type = "URML" },
        ["D042P"] = { lat = 18.497805556, lon = -15.787916667, type = "GQNO" },
        ["ML030"] = { lat = 42.450611111, lon = 48.021416667, type = "URML" },
        ["D318Y"] = { lat = 42.495525, lon = 47.957669444, type = "URML" },
        ["RW14"] = { lat = 47.852847222, lon = 106.753533333, type = "ZMUB" },
        ["ML023"] = { lat = 42.577138889, lon = 48.032666667, type = "URML" },
        ["RW32"] = { lat = 56.285166667, lon = 12.865880556, type = "ESTA" },
        ["ALUBA"] = { lat = 42.684444444, lon = 46.979166667, type = "ENRT" },
        ["ML027"] = { lat = 42.406027778, lon = 47.736138889, type = "URML" },
        ["D139X"] = { lat = 43.14155, lon = 47.352061111, type = "URML" },
        ["ML002"] = { lat = 42.515583333, lon = 47.784222222, type = "URML" },
        ["AGATO"] = { lat = 42.266388889, lon = 48.538611111, type = "ENRT" },
        ["D068P"] = { lat = 54.960088889, lon = 21.038061111, type = "UMKK" },
        ["ML041"] = { lat = 42.792388889, lon = 47.217583333, type = "URML" },
        ["ML052"] = { lat = 43.248333333, lon = 47.350583333, type = "URML" },
    },

    -- Данные ВПП
    Runways = {
        ["RW14"] = {
            heading = 140,
            length = 0,
            width = 0,
            threshold = { lat = 42.82686944444445, lon = 47.64384444444445 },
            end = { lat = 42.82686944444445, lon = 47.64384444444445 }
        },
        ["RW32"] = {
            heading = 320,
            length = 0,
            width = 0,
            threshold = { lat = 42.80673055555555, lon = 47.660975 },
            end = { lat = 42.80673055555555, lon = 47.660975 }
        },
    },

    -- Процедуры SID
    SID = {
        ["AGAT1A"] = {
            name = "AGAT1A",
            runway = "RW14",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "AGATO", type = "E", altitude_min = 17000 },
            }
        },
        ["AGAT1B"] = {
            name = "AGAT1B",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", speed = 240.0 },
                { name = "MKL", type = "D", speed = 240.0 },
                { name = "AGATO", type = "E", altitude_min = 17000 },
            }
        },
        ["AGAT1K"] = {
            name = "AGAT1K",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "", type = "" },
                { name = "AGATO", type = "E", altitude_min = 17000 },
            }
        },
        ["AGAT1M"] = {
            name = "AGAT1M",
            runway = "RW32",
            waypoints = {
                { name = "DER32", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "SM", type = "P", speed = 240.0 },
                { name = "AGATO", type = "E", altitude_min = 17000 },
            }
        },
        ["AGAT1N"] = {
            name = "AGAT1N",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 401 },
                { name = "ML019", type = "P" },
                { name = "ML023", type = "P", altitude_max = 10000 },
                { name = "AGATO", type = "E", altitude_min = 17000 },
            }
        },
        ["AGAT1P"] = {
            name = "AGAT1P",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", altitude_min = 414 },
                { name = "ML013", type = "P" },
                { name = "ML015", type = "P", altitude_max = 10000, speed = 205.0 },
                { name = "ML017", type = "P", speed = 205.0 },
                { name = "AGATO", type = "E", altitude_min = 17000 },
            }
        },
        ["AGNE1A"] = {
            name = "AGNE1A",
            runway = "RW14",
            waypoints = {
                { name = "", type = "" },
                { name = "AGNET", type = "E", altitude_min = 13000 },
            }
        },
        ["AGNE1B"] = {
            name = "AGNE1B",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", speed = 240.0 },
                { name = "MKL", type = "D", speed = 240.0 },
                { name = "AGNET", type = "E", altitude_min = 13000 },
            }
        },
        ["AGNE1K"] = {
            name = "AGNE1K",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "AGNET", type = "E", altitude_min = 13000 },
            }
        },
        ["AGNE1M"] = {
            name = "AGNE1M",
            runway = "RW32",
            waypoints = {
                { name = "DER32", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "SM", type = "P", speed = 240.0 },
                { name = "AGNET", type = "E", altitude_min = 13000 },
            }
        },
        ["AGNE1N"] = {
            name = "AGNE1N",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 401 },
                { name = "ML019", type = "P" },
                { name = "ML023", type = "P", altitude_max = 10000 },
                { name = "AGNET", type = "E", altitude_min = 13000 },
            }
        },
        ["AGNE1P"] = {
            name = "AGNE1P",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", altitude_min = 414 },
                { name = "ML013", type = "P" },
                { name = "ML015", type = "P", altitude_max = 10000, speed = 205.0 },
                { name = "ML017", type = "P", speed = 205.0 },
                { name = "AGNET", type = "E", altitude_min = 13000 },
            }
        },
        ["ALUB1A"] = {
            name = "ALUB1A",
            runway = "RW14",
            waypoints = {
                { name = "", type = "" },
                { name = "MKL", type = "D" },
                { name = "ALUBA", type = "E", altitude_min = 18000 },
            }
        },
        ["ALUB1B"] = {
            name = "ALUB1B",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", speed = 240.0 },
                { name = "MKL", type = "D", speed = 240.0 },
                { name = "ALUBA", type = "E", altitude_min = 18000 },
            }
        },
        ["ALUB1K"] = {
            name = "ALUB1K",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "HC", type = "D" },
                { name = "ALUBA", type = "E", altitude_min = 18000 },
            }
        },
        ["ALUB1L"] = {
            name = "ALUB1L",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 1200, speed = 240.0 },
                { name = "H", type = "P", speed = 240.0 },
                { name = "ALUBA", type = "E", altitude_min = 18000 },
            }
        },
        ["ALUB1M"] = {
            name = "ALUB1M",
            runway = "RW32",
            waypoints = {
                { name = "DER32", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "SM", type = "P", speed = 240.0 },
                { name = "ALUBA", type = "E", altitude_min = 18000 },
            }
        },
        ["ALUB1N"] = {
            name = "ALUB1N",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 401 },
                { name = "ML019", type = "P" },
                { name = "ML023", type = "P", altitude_max = 10000 },
                { name = "ML024", type = "P" },
                { name = "ALUBA", type = "E", altitude_min = 18000 },
            }
        },
        ["ALUB1P"] = {
            name = "ALUB1P",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", altitude_min = 414 },
                { name = "ML013", type = "P" },
                { name = "ML015", type = "P", altitude_max = 10000, speed = 205.0 },
                { name = "ML017", type = "P", speed = 205.0 },
                { name = "ML018", type = "P" },
                { name = "ALUBA", type = "E", altitude_min = 18000 },
            }
        },
        ["AMKO1A"] = {
            name = "AMKO1A",
            runway = "RW14",
            waypoints = {
                { name = "", type = "" },
                { name = "MKL", type = "D", speed = 250.0 },
                { name = "AMKOL", type = "E", altitude_min = 13000 },
            }
        },
        ["AMKO1B"] = {
            name = "AMKO1B",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", speed = 240.0 },
                { name = "", type = "" },
                { name = "AMKOL", type = "E", altitude_min = 13000 },
            }
        },
        ["AMKO1K"] = {
            name = "AMKO1K",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "HC", type = "D" },
                { name = "AMKOL", type = "E", altitude_min = 13000 },
            }
        },
        ["AMKO1M"] = {
            name = "AMKO1M",
            runway = "RW32",
            waypoints = {
                { name = "DER32", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "", type = "" },
                { name = "AMKOL", type = "E", altitude_min = 13000 },
            }
        },
        ["AMKO1N"] = {
            name = "AMKO1N",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 401 },
                { name = "ML019", type = "P" },
                { name = "ML020", type = "P", altitude_max = 10000, speed = 240.0 },
                { name = "ML021", type = "P", speed = 240.0 },
                { name = "ML022", type = "P" },
                { name = "AMKOL", type = "E", altitude_min = 13000 },
            }
        },
        ["AMKO1P"] = {
            name = "AMKO1P",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", altitude_min = 414 },
                { name = "ML013", type = "P" },
                { name = "ML014", type = "P", speed = 205.0 },
                { name = "AMKOL", type = "E", altitude_min = 13000 },
            }
        },
        ["BALI1A"] = {
            name = "BALI1A",
            runway = "RW14",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "BALIP", type = "E", altitude_min = 15000 },
            }
        },
        ["BALI1B"] = {
            name = "BALI1B",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", speed = 240.0 },
                { name = "MKL", type = "D", speed = 240.0 },
                { name = "BALIP", type = "E", altitude_min = 15000 },
            }
        },
        ["BALI1K"] = {
            name = "BALI1K",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "", type = "" },
                { name = "BALIP", type = "E", altitude_min = 15000 },
            }
        },
        ["BALI1M"] = {
            name = "BALI1M",
            runway = "RW32",
            waypoints = {
                { name = "DER32", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "SM", type = "P", speed = 240.0 },
                { name = "BALIP", type = "E", altitude_min = 15000 },
            }
        },
        ["BALI1N"] = {
            name = "BALI1N",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 401 },
                { name = "ML019", type = "P" },
                { name = "ML023", type = "P", altitude_max = 10000 },
                { name = "BALIP", type = "E", altitude_min = 15000 },
            }
        },
        ["BALI1P"] = {
            name = "BALI1P",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", altitude_min = 414 },
                { name = "ML013", type = "P" },
                { name = "ML015", type = "P", altitude_max = 10000, speed = 205.0 },
                { name = "ML017", type = "P", speed = 205.0 },
                { name = "BALIP", type = "E", altitude_min = 15000 },
            }
        },
        ["DUBK1A"] = {
            name = "DUBK1A",
            runway = "RW14",
            waypoints = {
                { name = "", type = "" },
                { name = "MKL", type = "D" },
                { name = "DUBKI", type = "E", altitude_min = 12000 },
            }
        },
        ["DUBK1B"] = {
            name = "DUBK1B",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", speed = 240.0 },
                { name = "MKL", type = "D", speed = 240.0 },
                { name = "DUBKI", type = "E", altitude_min = 12000 },
            }
        },
        ["DUBK1K"] = {
            name = "DUBK1K",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "HC", type = "D" },
                { name = "DUBKI", type = "E", altitude_min = 12000 },
            }
        },
        ["DUBK1L"] = {
            name = "DUBK1L",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 1200, speed = 240.0 },
                { name = "H", type = "P", speed = 240.0 },
                { name = "DUBKI", type = "E", altitude_min = 12000 },
            }
        },
        ["DUBK1M"] = {
            name = "DUBK1M",
            runway = "RW32",
            waypoints = {
                { name = "DER32", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "SM", type = "P", speed = 240.0 },
                { name = "DUBKI", type = "E", altitude_min = 12000 },
            }
        },
        ["DUBK1N"] = {
            name = "DUBK1N",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 401 },
                { name = "ML019", type = "P" },
                { name = "ML020", type = "P", altitude_max = 10000, speed = 240.0 },
                { name = "ML021", type = "P", speed = 240.0 },
                { name = "ML022", type = "P" },
                { name = "DUBKI", type = "E", altitude_min = 12000 },
            }
        },
        ["DUBK1P"] = {
            name = "DUBK1P",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", altitude_min = 414 },
                { name = "ML013", type = "P" },
                { name = "ML014", type = "P", speed = 205.0 },
                { name = "ML016", type = "P" },
                { name = "DUBKI", type = "E", altitude_min = 12000 },
            }
        },
        ["H1A"] = {
            name = "H1A",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 2200 },
                { name = "H", type = "P", altitude_min = 4400 },
            }
        },
        ["INGU1A"] = {
            name = "INGU1A",
            runway = "RW14",
            waypoints = {
                { name = "", type = "" },
                { name = "MKL", type = "D", speed = 205.0 },
                { name = "INGUT", type = "E", altitude_min = 12000 },
            }
        },
        ["INGU1B"] = {
            name = "INGU1B",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", speed = 240.0 },
                { name = "INGUT", type = "E", altitude_min = 12000 },
            }
        },
        ["INGU1K"] = {
            name = "INGU1K",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "HC", type = "D" },
                { name = "INGUT", type = "E", altitude_min = 12000 },
            }
        },
        ["INGU1M"] = {
            name = "INGU1M",
            runway = "RW32",
            waypoints = {
                { name = "DER32", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "INGUT", type = "E", altitude_min = 12000 },
            }
        },
        ["INGU1N"] = {
            name = "INGU1N",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 401 },
                { name = "ML019", type = "P" },
                { name = "ML020", type = "P", altitude_max = 10000, speed = 240.0 },
                { name = "ML021", type = "P", speed = 240.0 },
                { name = "ML022", type = "P" },
                { name = "INGUT", type = "E", altitude_min = 12000 },
            }
        },
        ["INGU1P"] = {
            name = "INGU1P",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", altitude_min = 414 },
                { name = "ML013", type = "P" },
                { name = "ML014", type = "P", speed = 205.0 },
                { name = "ML016", type = "P" },
                { name = "INGUT", type = "E", altitude_min = 12000 },
            }
        },
        ["LARK1A"] = {
            name = "LARK1A",
            runway = "RW14",
            waypoints = {
                { name = "", type = "" },
                { name = "MKL", type = "D" },
                { name = "LARKA", type = "E", altitude_min = 16000 },
            }
        },
        ["LARK1B"] = {
            name = "LARK1B",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", speed = 240.0 },
                { name = "MKL", type = "D", speed = 240.0 },
                { name = "LARKA", type = "E", altitude_min = 16000 },
            }
        },
        ["LARK1K"] = {
            name = "LARK1K",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 1200 },
                { name = "HC", type = "D" },
                { name = "LARKA", type = "E", altitude_min = 16000 },
            }
        },
        ["LARK1L"] = {
            name = "LARK1L",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 1200, speed = 240.0 },
                { name = "H", type = "P", speed = 240.0 },
                { name = "LARKA", type = "E", altitude_min = 16000 },
            }
        },
        ["LARK1M"] = {
            name = "LARK1M",
            runway = "RW32",
            waypoints = {
                { name = "DER32", type = "P" },
                { name = "", type = "", altitude_min = 1000, speed = 240.0 },
                { name = "SM", type = "P", speed = 240.0 },
                { name = "LARKA", type = "E", altitude_min = 16000 },
            }
        },
        ["LARK1N"] = {
            name = "LARK1N",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 401 },
                { name = "ML019", type = "P" },
                { name = "ML023", type = "P", altitude_max = 10000 },
                { name = "ML024", type = "P" },
                { name = "LARKA", type = "E", altitude_min = 16000 },
            }
        },
        ["LARK1P"] = {
            name = "LARK1P",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", altitude_min = 414 },
                { name = "ML013", type = "P" },
                { name = "ML015", type = "P", altitude_max = 10000, speed = 205.0 },
                { name = "ML017", type = "P", speed = 205.0 },
                { name = "ML018", type = "P" },
                { name = "LARKA", type = "E", altitude_min = 16000 },
            }
        },
        ["RIRA1A"] = {
            name = "RIRA1A",
            runway = "RW14",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "RIRAN", type = "E", altitude_min = 13000 },
            }
        },
        ["RIRA1B"] = {
            name = "RIRA1B",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", speed = 240.0 },
                { name = "", type = "" },
                { name = "RIRAN", type = "E", altitude_min = 13000 },
            }
        },
        ["RIRA1K"] = {
            name = "RIRA1K",
            runway = "RW14",
            waypoints = {
                { name = "DER14", type = "P" },
                { name = "", type = "", altitude_min = 1000 },
                { name = "", type = "" },
                { name = "RIRAN", type = "E", altitude_min = 13000 },
            }
        },
        ["RIRA1M"] = {
            name = "RIRA1M",
            runway = "RW32",
            waypoints = {
                { name = "DER32", type = "P" },
                { name = "", type = "", altitude_min = 800, speed = 240.0 },
                { name = "", type = "" },
                { name = "RIRAN", type = "E", altitude_min = 13000 },
            }
        },
        ["RIRA1N"] = {
            name = "RIRA1N",
            runway = "RW14",
            waypoints = {
                { name = "", type = "", altitude_min = 401 },
                { name = "ML019", type = "P" },
                { name = "ML023", type = "P", altitude_max = 10000 },
                { name = "RIRAN", type = "E", altitude_min = 13000 },
            }
        },
        ["RIRA1P"] = {
            name = "RIRA1P",
            runway = "RW32",
            waypoints = {
                { name = "", type = "", altitude_min = 414 },
                { name = "ML013", type = "P" },
                { name = "ML015", type = "P", altitude_max = 10000, speed = 205.0 },
                { name = "RIRAN", type = "E", altitude_min = 13000 },
            }
        },
        ["TA1A"] = {
            name = "TA1A",
            runway = "RW32",
            waypoints = {
                { name = "TA", type = "D" },
                { name = "S", type = "P", altitude_min = 3700 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["AGAT1C"] = {
            name = "AGAT1C",
            runway = "ALL",
            waypoints = {
                { name = "AGATO", type = "UR", altitude_min = 16000 },
                { name = "MKL", type = "UR", altitude_min = 6800, altitude_max = 9000 },
            }
        },
        ["AGAT1D"] = {
            name = "AGAT1D",
            runway = "RW14",
            waypoints = {
                { name = "AGATO", type = "UR", altitude_min = 16000 },
                { name = "HC", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["AGAT1E"] = {
            name = "AGAT1E",
            runway = "RW14",
            waypoints = {
                { name = "AGATO", type = "UR", altitude_min = 16000 },
                { name = "D303Y", type = "UR" },
                { name = "H", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["AGAT1F"] = {
            name = "AGAT1F",
            runway = "RW32",
            waypoints = {
                { name = "AGATO", type = "UR", altitude_min = 16000 },
                { name = "SM", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["AGAT1G"] = {
            name = "AGAT1G",
            runway = "RW32",
            waypoints = {
                { name = "AGATO", type = "UR", altitude_min = 16000 },
                { name = "D303Z", type = "UR" },
                { name = "S", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["AGAT1H"] = {
            name = "AGAT1H",
            runway = "RW14",
            waypoints = {
                { name = "AGATO", type = "UR", altitude_min = 16000 },
                { name = "ML048", type = "UR" },
                { name = "ML049", type = "UR", speed = 215.0 },
                { name = "ML051", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML052", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML053", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML054", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML055", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML008", type = "UR", altitude_min = 5500 },
            }
        },
        ["AGAT1J"] = {
            name = "AGAT1J",
            runway = "RW32",
            waypoints = {
                { name = "AGATO", type = "UR", altitude_min = 16000 },
                { name = "ML037", type = "UR", speed = 215.0 },
                { name = "ML038", type = "UR", speed = 215.0 },
                { name = "ML039", type = "UR", speed = 215.0 },
                { name = "ML040", type = "UR", speed = 215.0 },
                { name = "ML002", type = "UR", altitude_min = 5500 },
            }
        },
        ["AGNE1C"] = {
            name = "AGNE1C",
            runway = "ALL",
            waypoints = {
                { name = "AGNET", type = "UR", altitude_min = 14000 },
                { name = "MKL", type = "UR", altitude_min = 6800, altitude_max = 9000 },
            }
        },
        ["AGNE1D"] = {
            name = "AGNE1D",
            runway = "RW14",
            waypoints = {
                { name = "AGNET", type = "UR", altitude_min = 14000 },
                { name = "HC", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["AGNE1E"] = {
            name = "AGNE1E",
            runway = "RW14",
            waypoints = {
                { name = "AGNET", type = "UR", altitude_min = 14000 },
                { name = "D318Y", type = "UR" },
                { name = "H", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["AGNE1F"] = {
            name = "AGNE1F",
            runway = "RW32",
            waypoints = {
                { name = "AGNET", type = "UR", altitude_min = 14000 },
                { name = "SM", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["AGNE1G"] = {
            name = "AGNE1G",
            runway = "RW32",
            waypoints = {
                { name = "AGNET", type = "UR", altitude_min = 14000 },
                { name = "D318Z", type = "UR" },
                { name = "S", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["AGNE1H"] = {
            name = "AGNE1H",
            runway = "RW14",
            waypoints = {
                { name = "AGNET", type = "UR", altitude_min = 14000 },
                { name = "ML048", type = "UR" },
                { name = "ML049", type = "UR", speed = 215.0 },
                { name = "ML051", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML052", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML053", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML054", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML055", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML008", type = "UR", altitude_min = 5500 },
            }
        },
        ["AGNE1J"] = {
            name = "AGNE1J",
            runway = "RW32",
            waypoints = {
                { name = "AGNET", type = "UR", altitude_min = 14000 },
                { name = "ML030", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML031", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML032", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML001", type = "UR", altitude_min = 5500 },
            }
        },
        ["ALUB1C"] = {
            name = "ALUB1C",
            runway = "ALL",
            waypoints = {
                { name = "ALUBA", type = "UR", altitude_min = 17000 },
                { name = "D248P", type = "UR", altitude_min = 14000 },
                { name = "MKL", type = "UR", altitude_min = 6800, altitude_max = 9000 },
            }
        },
        ["ALUB1D"] = {
            name = "ALUB1D",
            runway = "RW14",
            waypoints = {
                { name = "ALUBA", type = "UR", altitude_min = 17000 },
                { name = "D063P", type = "UR", altitude_min = 14000 },
                { name = "HC", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["ALUB1E"] = {
            name = "ALUB1E",
            runway = "RW14",
            waypoints = {
                { name = "ALUBA", type = "UR", altitude_min = 17000 },
                { name = "D066P", type = "UR", altitude_min = 14000 },
                { name = "H", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["ALUB1F"] = {
            name = "ALUB1F",
            runway = "RW32",
            waypoints = {
                { name = "ALUBA", type = "UR", altitude_min = 17000 },
                { name = "D073P", type = "UR", altitude_min = 14000 },
                { name = "SM", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["ALUB1G"] = {
            name = "ALUB1G",
            runway = "RW32",
            waypoints = {
                { name = "ALUBA", type = "UR", altitude_min = 17000 },
                { name = "D068P", type = "UR", altitude_min = 14000 },
                { name = "S", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["ALUB1H"] = {
            name = "ALUB1H",
            runway = "RW14",
            waypoints = {
                { name = "ALUBA", type = "UR", altitude_min = 17000 },
                { name = "ML041", type = "UR", altitude_min = 10000 },
                { name = "ML042", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML043", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML044", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML045", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML046", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML047", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML007", type = "UR", altitude_min = 5500 },
            }
        },
        ["ALUB1J"] = {
            name = "ALUB1J",
            runway = "RW32",
            waypoints = {
                { name = "ALUBA", type = "UR", altitude_min = 17000 },
                { name = "ML025", type = "UR", altitude_min = 10000 },
                { name = "ML026", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "ML027", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML028", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML029", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML030", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML031", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML032", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML001", type = "UR", altitude_min = 5500 },
            }
        },
        ["AMKO1C"] = {
            name = "AMKO1C",
            runway = "ALL",
            waypoints = {
                { name = "AMKOL", type = "UR", altitude_min = 13000 },
                { name = "MKL", type = "UR", altitude_min = 6800, altitude_max = 9000 },
            }
        },
        ["AMKO1D"] = {
            name = "AMKO1D",
            runway = "RW14",
            waypoints = {
                { name = "AMKOL", type = "UR", altitude_min = 13000 },
                { name = "HC", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["AMKO1E"] = {
            name = "AMKO1E",
            runway = "RW14",
            waypoints = {
                { name = "AMKOL", type = "UR", altitude_min = 13000 },
                { name = "D165Y", type = "UR" },
                { name = "H", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["AMKO1F"] = {
            name = "AMKO1F",
            runway = "RW32",
            waypoints = {
                { name = "AMKOL", type = "UR", altitude_min = 13000 },
                { name = "SM", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["AMKO1G"] = {
            name = "AMKO1G",
            runway = "RW32",
            waypoints = {
                { name = "AMKOL", type = "UR", altitude_min = 13000 },
                { name = "D165X", type = "UR" },
                { name = "S", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["AMKO1H"] = {
            name = "AMKO1H",
            runway = "RW14",
            waypoints = {
                { name = "AMKOL", type = "UR", altitude_min = 13000 },
                { name = "ML051", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML052", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML053", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML054", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML055", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML008", type = "UR", altitude_min = 5500 },
            }
        },
        ["AMKO1J"] = {
            name = "AMKO1J",
            runway = "RW32",
            waypoints = {
                { name = "AMKOL", type = "UR", altitude_min = 13000 },
                { name = "ML033", type = "UR" },
                { name = "ML050", type = "UR" },
                { name = "ML034", type = "UR", speed = 215.0 },
                { name = "ML035", type = "UR", speed = 215.0 },
                { name = "ML036", type = "UR", speed = 215.0 },
                { name = "ML037", type = "UR", speed = 215.0 },
                { name = "ML038", type = "UR", speed = 215.0 },
                { name = "ML039", type = "UR", speed = 215.0 },
                { name = "ML040", type = "UR", speed = 215.0 },
                { name = "ML002", type = "UR", altitude_min = 5500 },
            }
        },
        ["BALI1C"] = {
            name = "BALI1C",
            runway = "ALL",
            waypoints = {
                { name = "BALIP", type = "UR", altitude_min = 14000 },
                { name = "MKL", type = "UR", altitude_min = 6800, altitude_max = 9000 },
            }
        },
        ["BALI1D"] = {
            name = "BALI1D",
            runway = "RW14",
            waypoints = {
                { name = "BALIP", type = "UR", altitude_min = 14000 },
                { name = "HC", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["BALI1E"] = {
            name = "BALI1E",
            runway = "RW14",
            waypoints = {
                { name = "BALIP", type = "UR", altitude_min = 14000 },
                { name = "D289Y", type = "UR" },
                { name = "H", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["BALI1F"] = {
            name = "BALI1F",
            runway = "RW32",
            waypoints = {
                { name = "BALIP", type = "UR", altitude_min = 14000 },
                { name = "SM", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["BALI1G"] = {
            name = "BALI1G",
            runway = "RW32",
            waypoints = {
                { name = "BALIP", type = "UR", altitude_min = 14000 },
                { name = "D288Y", type = "UR" },
                { name = "S", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["BALI1H"] = {
            name = "BALI1H",
            runway = "RW14",
            waypoints = {
                { name = "BALIP", type = "UR", altitude_min = 14000 },
                { name = "ML048", type = "UR" },
                { name = "ML049", type = "UR", speed = 215.0 },
                { name = "ML051", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML052", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML053", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML054", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML055", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML008", type = "UR", altitude_min = 5500 },
            }
        },
        ["BALI1J"] = {
            name = "BALI1J",
            runway = "RW32",
            waypoints = {
                { name = "BALIP", type = "UR", altitude_min = 14000 },
                { name = "ML036", type = "UR", speed = 215.0 },
                { name = "ML037", type = "UR", speed = 215.0 },
                { name = "ML038", type = "UR", speed = 215.0 },
                { name = "ML039", type = "UR", speed = 215.0 },
                { name = "ML040", type = "UR", speed = 215.0 },
                { name = "ML002", type = "UR", altitude_min = 5500 },
            }
        },
        ["BUIK1E"] = {
            name = "BUIK1E",
            runway = "RW14",
            waypoints = {
                { name = "BUIKS", type = "UR" },
                { name = "H", type = "UR", altitude_min = 6700 },
            }
        },
        ["BUIK1G"] = {
            name = "BUIK1G",
            runway = "RW32",
            waypoints = {
                { name = "BUIKS", type = "UR" },
                { name = "S", type = "UR", altitude_min = 6700 },
            }
        },
        ["DUBK1C"] = {
            name = "DUBK1C",
            runway = "ALL",
            waypoints = {
                { name = "DUBKI", type = "UR", altitude_min = 13000 },
                { name = "MKL", type = "UR", altitude_min = 6800, altitude_max = 9000 },
            }
        },
        ["DUBK1D"] = {
            name = "DUBK1D",
            runway = "RW14",
            waypoints = {
                { name = "DUBKI", type = "UR", altitude_min = 13000 },
                { name = "HC", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["DUBK1E"] = {
            name = "DUBK1E",
            runway = "RW14",
            waypoints = {
                { name = "DUBKI", type = "UR", altitude_min = 13000 },
                { name = "H", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["DUBK1F"] = {
            name = "DUBK1F",
            runway = "RW32",
            waypoints = {
                { name = "DUBKI", type = "UR", altitude_min = 13000 },
                { name = "SM", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["DUBK1G"] = {
            name = "DUBK1G",
            runway = "RW32",
            waypoints = {
                { name = "DUBKI", type = "UR", altitude_min = 13000 },
                { name = "D106Z", type = "UR" },
                { name = "S", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["DUBK1H"] = {
            name = "DUBK1H",
            runway = "RW14",
            waypoints = {
                { name = "DUBKI", type = "UR", altitude_min = 13000 },
                { name = "ML044", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML045", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML046", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML047", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML007", type = "UR", altitude_min = 5500 },
            }
        },
        ["DUBK1J"] = {
            name = "DUBK1J",
            runway = "RW32",
            waypoints = {
                { name = "DUBKI", type = "UR", altitude_min = 20000 },
                { name = "ML056", type = "UR", altitude_min = 20000 },
                { name = "ML026", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "ML027", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML028", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML029", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML030", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML031", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML032", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML001", type = "UR", altitude_min = 5500 },
            }
        },
        ["GUDE1E"] = {
            name = "GUDE1E",
            runway = "RW14",
            waypoints = {
                { name = "GUDEN", type = "UR" },
                { name = "H", type = "UR", altitude_min = 6700 },
            }
        },
        ["GUDE1G"] = {
            name = "GUDE1G",
            runway = "RW32",
            waypoints = {
                { name = "GUDEN", type = "UR" },
                { name = "S", type = "UR", altitude_min = 6700 },
            }
        },
        ["INGU1C"] = {
            name = "INGU1C",
            runway = "ALL",
            waypoints = {
                { name = "INGUT", type = "UR", altitude_min = 13000 },
                { name = "MKL", type = "UR", altitude_min = 6800, altitude_max = 9000 },
            }
        },
        ["INGU1D"] = {
            name = "INGU1D",
            runway = "RW14",
            waypoints = {
                { name = "INGUT", type = "UR", altitude_min = 13000 },
                { name = "HC", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["INGU1E"] = {
            name = "INGU1E",
            runway = "RW14",
            waypoints = {
                { name = "INGUT", type = "UR", altitude_min = 13000 },
                { name = "D139Y", type = "UR" },
                { name = "H", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["INGU1F"] = {
            name = "INGU1F",
            runway = "RW32",
            waypoints = {
                { name = "INGUT", type = "UR", altitude_min = 13000 },
                { name = "SM", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["INGU1G"] = {
            name = "INGU1G",
            runway = "RW32",
            waypoints = {
                { name = "INGUT", type = "UR", altitude_min = 13000 },
                { name = "D139X", type = "UR" },
                { name = "S", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["INGU1H"] = {
            name = "INGU1H",
            runway = "RW14",
            waypoints = {
                { name = "INGUT", type = "UR", altitude_min = 13000 },
                { name = "ML045", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML046", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML047", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML007", type = "UR", altitude_min = 5500 },
            }
        },
        ["INGU1J"] = {
            name = "INGU1J",
            runway = "RW32",
            waypoints = {
                { name = "INGUT", type = "UR", altitude_min = 13000 },
                { name = "ML033", type = "UR" },
                { name = "ML050", type = "UR" },
                { name = "ML034", type = "UR", speed = 215.0 },
                { name = "ML035", type = "UR", speed = 215.0 },
                { name = "ML036", type = "UR", speed = 215.0 },
                { name = "ML037", type = "UR", speed = 215.0 },
                { name = "ML038", type = "UR", speed = 215.0 },
                { name = "ML039", type = "UR", speed = 215.0 },
                { name = "ML040", type = "UR", speed = 215.0 },
                { name = "ML002", type = "UR", altitude_min = 5500 },
            }
        },
        ["LARK1C"] = {
            name = "LARK1C",
            runway = "ALL",
            waypoints = {
                { name = "LARKA", type = "UR", altitude_min = 17000 },
                { name = "D222P", type = "UR", altitude_min = 14000 },
                { name = "MKL", type = "UR", altitude_min = 6800, altitude_max = 9000 },
            }
        },
        ["LARK1D"] = {
            name = "LARK1D",
            runway = "RW14",
            waypoints = {
                { name = "LARKA", type = "UR", altitude_min = 17000 },
                { name = "D038P", type = "UR", altitude_min = 14000 },
                { name = "HC", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["LARK1E"] = {
            name = "LARK1E",
            runway = "RW14",
            waypoints = {
                { name = "LARKA", type = "UR", altitude_min = 17000 },
                { name = "D040P", type = "UR", altitude_min = 14000 },
                { name = "H", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["LARK1F"] = {
            name = "LARK1F",
            runway = "RW32",
            waypoints = {
                { name = "LARKA", type = "UR", altitude_min = 17000 },
                { name = "D047P", type = "UR", altitude_min = 14000 },
                { name = "SM", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["LARK1G"] = {
            name = "LARK1G",
            runway = "RW32",
            waypoints = {
                { name = "LARKA", type = "UR", altitude_min = 17000 },
                { name = "D042P", type = "UR", altitude_min = 14000 },
                { name = "S", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["LARK1H"] = {
            name = "LARK1H",
            runway = "RW14",
            waypoints = {
                { name = "LARKA", type = "UR", altitude_min = 17000 },
                { name = "ML041", type = "UR", altitude_min = 10000 },
                { name = "ML042", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML043", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML044", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML045", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML046", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML047", type = "UR", altitude_min = 7500, speed = 215.0 },
                { name = "ML007", type = "UR", altitude_min = 5500 },
            }
        },
        ["LARK1J"] = {
            name = "LARK1J",
            runway = "RW32",
            waypoints = {
                { name = "LARKA", type = "UR", altitude_min = 17000 },
                { name = "ML025", type = "UR", altitude_min = 10000 },
                { name = "ML026", type = "UR", altitude_min = 8000, speed = 215.0 },
                { name = "ML027", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML028", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML029", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML030", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML031", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML032", type = "UR", altitude_min = 7000, speed = 215.0 },
                { name = "ML001", type = "UR", altitude_min = 5500 },
            }
        },
        ["RIRA1C"] = {
            name = "RIRA1C",
            runway = "ALL",
            waypoints = {
                { name = "RIRAN", type = "UR", altitude_min = 14000 },
                { name = "MKL", type = "UR", altitude_min = 6800, altitude_max = 9000 },
            }
        },
        ["RIRA1D"] = {
            name = "RIRA1D",
            runway = "RW14",
            waypoints = {
                { name = "RIRAN", type = "UR", altitude_min = 14000 },
                { name = "HC", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["RIRA1E"] = {
            name = "RIRA1E",
            runway = "RW14",
            waypoints = {
                { name = "RIRAN", type = "UR", altitude_min = 14000 },
                { name = "D240X", type = "UR" },
                { name = "H", type = "UR", altitude_min = 7500, altitude_max = 11000 },
            }
        },
        ["RIRA1F"] = {
            name = "RIRA1F",
            runway = "RW32",
            waypoints = {
                { name = "RIRAN", type = "UR", altitude_min = 14000 },
                { name = "SM", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["RIRA1G"] = {
            name = "RIRA1G",
            runway = "RW32",
            waypoints = {
                { name = "RIRAN", type = "UR", altitude_min = 14000 },
                { name = "D240Y", type = "UR" },
                { name = "S", type = "UR", altitude_min = 7500, altitude_max = 10000 },
            }
        },
        ["RIRA1H"] = {
            name = "RIRA1H",
            runway = "RW14",
            waypoints = {
                { name = "RIRAN", type = "UR", altitude_min = 14000 },
                { name = "ML049", type = "UR", speed = 215.0 },
                { name = "ML051", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML052", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML053", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML054", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML055", type = "UR", altitude_min = 5500, altitude_max = 6500, speed = 215.0 },
                { name = "ML008", type = "UR", altitude_min = 5500 },
            }
        },
        ["RIRA1J"] = {
            name = "RIRA1J",
            runway = "RW32",
            waypoints = {
                { name = "RIRAN", type = "UR", altitude_min = 14000 },
                { name = "ML034", type = "UR", speed = 215.0 },
                { name = "ML035", type = "UR", speed = 215.0 },
                { name = "ML036", type = "UR", speed = 215.0 },
                { name = "ML037", type = "UR", speed = 215.0 },
                { name = "ML038", type = "UR", speed = 215.0 },
                { name = "ML039", type = "UR", speed = 215.0 },
                { name = "ML040", type = "UR", speed = 215.0 },
                { name = "ML002", type = "UR", altitude_min = 5500 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D14"] = {
            name = "D14",
            type = "A",
            runway = "D14",
            waypoints = {
                { name = "MKL", transition = "MKL1", type = "UR", altitude_min = 6800, altitude_max = 9000 },
                { name = "MKL", transition = "MKL1", type = "UR", altitude_min = 3200 },
                { name = "FD14", transition = "MKL1", type = "UR" },
                { name = "MKL", transition = "MKL2", type = "UR", altitude_min = 6800, altitude_max = 9000 },
                { name = "MKL", transition = "MKL2", type = "UR", altitude_min = 3200 },
                { name = "FD14", transition = "MKL2", type = "UR" },
                { name = "FD14", transition = "", type = "UR" },
                { name = "RW14", transition = "", type = "UR" },
                { name = "MKL", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "MKL", transition = "", type = "UR", altitude_min = 6800 },
            }
        },
        ["D32"] = {
            name = "D32",
            type = "A",
            runway = "D32",
            waypoints = {
                { name = "MKL", transition = "MKL1", type = "UR", altitude_min = 6800, altitude_max = 9000, speed = 215.0 },
                { name = "MKL", transition = "MKL1", type = "UR", altitude_min = 3000 },
                { name = "FD32", transition = "MKL1", type = "UR" },
                { name = "MKL", transition = "MKL2", type = "UR", altitude_min = 6800, altitude_max = 9000, speed = 215.0 },
                { name = "MKL", transition = "MKL2", type = "UR", altitude_min = 3000 },
                { name = "FD32", transition = "MKL2", type = "UR" },
                { name = "FD32", transition = "", type = "UR" },
                { name = "MD32", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500, speed = 215.0 },
                { name = "MKL", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["I14-W"] = {
            name = "I14-W",
            type = "A",
            runway = "I14-W",
            waypoints = {
                { name = "HC", transition = "HC1", type = "UR", altitude_min = 7500, altitude_max = 11000 },
                { name = "HC", transition = "HC1", type = "UR", altitude_min = 5000 },
                { name = "CF14", transition = "HC1", type = "UR", altitude_min = 2400 },
                { name = "HC", transition = "HC2", type = "UR", altitude_min = 7500, altitude_max = 11000 },
                { name = "HC", transition = "HC2", type = "UR", altitude_min = 5000 },
                { name = "CF14", transition = "HC2", type = "UR", altitude_min = 2400 },
                { name = "CF14", transition = "", type = "UR" },
                { name = "FF14", transition = "", type = "UR" },
                { name = "RW14", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "HC", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["I14-X"] = {
            name = "I14-X",
            type = "A",
            runway = "I14-X",
            waypoints = {
                { name = "H", transition = "H1", type = "UR", altitude_min = 7500, altitude_max = 11000 },
                { name = "H", transition = "H1", type = "UR", altitude_min = 5000 },
                { name = "CF14", transition = "H1", type = "UR", altitude_min = 2400 },
                { name = "H", transition = "H2", type = "UR", altitude_min = 7500, altitude_max = 11000 },
                { name = "H", transition = "H2", type = "UR", altitude_min = 5000 },
                { name = "CF14", transition = "H2", type = "UR", altitude_min = 2400 },
                { name = "CF14", transition = "", type = "UR" },
                { name = "FF14", transition = "", type = "UR" },
                { name = "RW14", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "H", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["I14-Y"] = {
            name = "I14-Y",
            type = "A",
            runway = "I14-Y",
            waypoints = {
                { name = "MKL", transition = "MKL1", type = "UR", altitude_min = 6800, altitude_max = 9000 },
                { name = "MKL", transition = "MKL1", type = "UR", altitude_min = 3200 },
                { name = "CF14", transition = "MKL1", type = "UR", altitude_min = 2400 },
                { name = "MKL", transition = "MKL2", type = "UR", altitude_min = 6800, altitude_max = 9000 },
                { name = "MKL", transition = "MKL2", type = "UR", altitude_min = 3200 },
                { name = "CF14", transition = "MKL2", type = "UR", altitude_min = 2400 },
                { name = "CF14", transition = "", type = "UR" },
                { name = "FF14", transition = "", type = "UR" },
                { name = "RW14", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "MKL", transition = "", type = "UR", altitude_min = 6800 },
            }
        },
        ["I14-Z"] = {
            name = "I14-Z",
            type = "A",
            runway = "I14-Z",
            waypoints = {
                { name = "ML007", transition = "ML007", type = "UR", altitude_min = 5500 },
                { name = "ML009", transition = "ML007", type = "UR", altitude_min = 3900 },
                { name = "ML008", transition = "ML008", type = "UR", altitude_min = 5500 },
                { name = "ML009", transition = "ML008", type = "UR", altitude_min = 3900 },
                { name = "ML009", transition = "", type = "UR" },
                { name = "FF14", transition = "", type = "UR" },
                { name = "RW14", transition = "", type = "UR" },
                { name = "ML011", transition = "", type = "UR", speed = 215.0 },
                { name = "ML012", transition = "", type = "UR", speed = 215.0 },
                { name = "ML051", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML052", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML053", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML054", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML055", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML008", transition = "", type = "UR", altitude_min = 5500 },
            }
        },
        ["I32-W"] = {
            name = "I32-W",
            type = "A",
            runway = "I32-W",
            waypoints = {
                { name = "SM", transition = "SM1", type = "UR", altitude_min = 7500, altitude_max = 10000, speed = 190.0 },
                { name = "SM", transition = "SM1", type = "UR", altitude_min = 4200 },
                { name = "CF32", transition = "SM1", type = "UR", altitude_min = 3700 },
                { name = "SM", transition = "SM2", type = "UR", altitude_min = 7500, altitude_max = 10000, speed = 190.0 },
                { name = "SM", transition = "SM2", type = "UR", altitude_min = 4200 },
                { name = "CF32", transition = "SM2", type = "UR", altitude_min = 3700 },
                { name = "CF32", transition = "", type = "UR" },
                { name = "FF32", transition = "", type = "UR" },
                { name = "RW32", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500, speed = 215.0 },
                { name = "SM", transition = "", type = "UR", altitude_min = 4200 },
            }
        },
        ["I32-X"] = {
            name = "I32-X",
            type = "A",
            runway = "I32-X",
            waypoints = {
                { name = "S", transition = "S1", type = "UR", altitude_min = 7500, altitude_max = 10000, speed = 190.0 },
                { name = "S", transition = "S1", type = "UR", altitude_min = 4800 },
                { name = "CF32", transition = "S1", type = "UR", altitude_min = 3700 },
                { name = "S", transition = "S2", type = "UR", altitude_min = 7500, altitude_max = 10000, speed = 190.0 },
                { name = "S", transition = "S2", type = "UR", altitude_min = 4800 },
                { name = "CF32", transition = "S2", type = "UR", altitude_min = 3700 },
                { name = "CF32", transition = "", type = "UR" },
                { name = "FF32", transition = "", type = "UR" },
                { name = "RW32", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500, speed = 215.0 },
                { name = "S", transition = "", type = "UR", altitude_min = 4800 },
            }
        },
        ["I32-Y"] = {
            name = "I32-Y",
            type = "A",
            runway = "I32-Y",
            waypoints = {
                { name = "MKL", transition = "MKL1", type = "UR", altitude_min = 6800, altitude_max = 9000, speed = 215.0 },
                { name = "MKL", transition = "MKL1", type = "UR", altitude_min = 3000 },
                { name = "CF32Y", transition = "MKL1", type = "UR", altitude_min = 3000 },
                { name = "MKL", transition = "MKL2", type = "UR", altitude_min = 6800, altitude_max = 9000, speed = 215.0 },
                { name = "MKL", transition = "MKL2", type = "UR", altitude_min = 3000 },
                { name = "CF32Y", transition = "MKL2", type = "UR", altitude_min = 3000 },
                { name = "CF32Y", transition = "", type = "UR" },
                { name = "FF32", transition = "", type = "UR" },
                { name = "RW32", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500, speed = 215.0 },
                { name = "MKL", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["I32-Z"] = {
            name = "I32-Z",
            type = "A",
            runway = "I32-Z",
            waypoints = {
                { name = "ML001", transition = "ML001", type = "UR", altitude_min = 5500 },
                { name = "ML003", transition = "ML001", type = "UR", altitude_min = 3900 },
                { name = "ML002", transition = "ML002", type = "UR", altitude_min = 5500 },
                { name = "ML003", transition = "ML002", type = "UR", altitude_min = 3900 },
                { name = "ML003", transition = "", type = "UR" },
                { name = "FF32", transition = "", type = "UR" },
                { name = "RW32", transition = "", type = "UR" },
                { name = "ML005", transition = "", type = "UR", speed = 215.0 },
                { name = "ML006", transition = "", type = "UR", speed = 215.0 },
                { name = "ML034", transition = "", type = "UR", speed = 215.0 },
            }
        },
        ["J14"] = {
            name = "J14",
            type = "A",
            runway = "J14",
            waypoints = {
                { name = "ML007", transition = "ML007", type = "UR", altitude_min = 5500 },
                { name = "ML009", transition = "ML007", type = "UR", altitude_min = 3900 },
                { name = "ML008", transition = "ML008", type = "UR", altitude_min = 5500 },
                { name = "ML009", transition = "ML008", type = "UR", altitude_min = 3900 },
                { name = "ML009", transition = "", type = "UR" },
                { name = "ML010", transition = "", type = "UR" },
                { name = "RW14", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 410 },
                { name = "ML011", transition = "", type = "UR", speed = 215.0 },
                { name = "ML012", transition = "", type = "UR", speed = 215.0 },
                { name = "ML051", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML052", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML053", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML054", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML055", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML008", transition = "", type = "UR", altitude_min = 5500 },
            }
        },
        ["J32"] = {
            name = "J32",
            type = "A",
            runway = "J32",
            waypoints = {
                { name = "ML001", transition = "ML001", type = "UR", altitude_min = 5500 },
                { name = "ML003", transition = "ML001", type = "UR", altitude_min = 3900 },
                { name = "ML002", transition = "ML002", type = "UR", altitude_min = 5500 },
                { name = "ML003", transition = "ML002", type = "UR", altitude_min = 3900 },
                { name = "ML003", transition = "", type = "UR" },
                { name = "ML004", transition = "", type = "UR" },
                { name = "RW32", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 420, speed = 215.0 },
                { name = "ML005", transition = "", type = "UR", speed = 215.0 },
                { name = "ML006", transition = "", type = "UR", speed = 215.0 },
                { name = "ML034", transition = "", type = "UR", speed = 215.0 },
            }
        },
        ["N14-X"] = {
            name = "N14-X",
            type = "A",
            runway = "N14-X",
            waypoints = {
                { name = "H", transition = "H1", type = "UR", altitude_min = 7500, altitude_max = 11000 },
                { name = "H", transition = "H1", type = "UR", altitude_min = 5000 },
                { name = "FN14X", transition = "H1", type = "UR", altitude_min = 5000 },
                { name = "H", transition = "H2", type = "UR", altitude_min = 7500, altitude_max = 11000 },
                { name = "H", transition = "H2", type = "UR", altitude_min = 5000 },
                { name = "FN14X", transition = "H2", type = "UR", altitude_min = 5000 },
                { name = "FN14X", transition = "", type = "UR", altitude_min = 5000 },
                { name = "H", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "H", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["N32-X"] = {
            name = "N32-X",
            type = "A",
            runway = "N32-X",
            waypoints = {
                { name = "S", transition = "S1", type = "UR", altitude_min = 7500, altitude_max = 10000, speed = 185.0 },
                { name = "S", transition = "S1", type = "UR", altitude_min = 4800 },
                { name = "FN32X", transition = "S1", type = "UR", altitude_min = 4800 },
                { name = "S", transition = "S2", type = "UR", altitude_min = 7500, altitude_max = 10000, speed = 185.0 },
                { name = "S", transition = "S2", type = "UR", altitude_min = 4800 },
                { name = "FN32X", transition = "S2", type = "UR", altitude_min = 4800 },
                { name = "FN32X", transition = "", type = "UR", altitude_min = 4800 },
                { name = "S", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500, speed = 215.0 },
                { name = "S", transition = "", type = "UR", altitude_min = 4800 },
            }
        },
        ["N32-Y"] = {
            name = "N32-Y",
            type = "A",
            runway = "N32-Y",
            waypoints = {
                { name = "SM", transition = "SM1", type = "UR", altitude_min = 7500, altitude_max = 10000, speed = 190.0 },
                { name = "SM", transition = "SM1", type = "UR", altitude_min = 4200 },
                { name = "FF32", transition = "SM1", type = "UR" },
                { name = "SM", transition = "SM2", type = "UR", altitude_min = 7500, altitude_max = 10000, speed = 190.0 },
                { name = "SM", transition = "SM2", type = "UR", altitude_min = 4200 },
                { name = "FF32", transition = "SM2", type = "UR" },
                { name = "FF32", transition = "", type = "UR" },
                { name = "S", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500, speed = 215.0 },
                { name = "SM", transition = "", type = "UR", altitude_min = 4200 },
            }
        },
        ["N32-Z"] = {
            name = "N32-Z",
            type = "A",
            runway = "N32-Z",
            waypoints = {
                { name = "S", transition = "S1", type = "UR", altitude_min = 7500, altitude_max = 10000, speed = 190.0 },
                { name = "S", transition = "S1", type = "UR", altitude_min = 4800 },
                { name = "FF32", transition = "S1", type = "UR" },
                { name = "S", transition = "S2", type = "UR", altitude_min = 7500, altitude_max = 10000, speed = 190.0 },
                { name = "S", transition = "S2", type = "UR", altitude_min = 4800 },
                { name = "FF32", transition = "S2", type = "UR" },
                { name = "FF32", transition = "", type = "UR" },
                { name = "S", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500, speed = 215.0 },
                { name = "S", transition = "", type = "UR", altitude_min = 4800 },
            }
        },
        ["Q14-W"] = {
            name = "Q14-W",
            type = "A",
            runway = "Q14-W",
            waypoints = {
                { name = "INGUT", transition = "INGUT", type = "UR", altitude_min = 13000 },
                { name = "TA", transition = "INGUT", type = "UR" },
                { name = "TA", transition = "", type = "UR" },
                { name = "FQ14W", transition = "", type = "UR" },
                { name = "H", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "HC", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["Q14-Y"] = {
            name = "Q14-Y",
            type = "A",
            runway = "Q14-Y",
            waypoints = {
                { name = "HC", transition = "HC1", type = "UR", altitude_min = 7500, altitude_max = 11000 },
                { name = "HC", transition = "HC1", type = "UR", altitude_min = 5000 },
                { name = "FF14", transition = "HC1", type = "UR", altitude_min = 2400 },
                { name = "HC", transition = "HC2", type = "UR", altitude_min = 7500, altitude_max = 11000 },
                { name = "HC", transition = "HC2", type = "UR", altitude_min = 5000 },
                { name = "FF14", transition = "HC2", type = "UR", altitude_min = 2400 },
                { name = "FF14", transition = "", type = "UR" },
                { name = "H", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "HC", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["Q14-Z"] = {
            name = "Q14-Z",
            type = "A",
            runway = "Q14-Z",
            waypoints = {
                { name = "H", transition = "H1", type = "UR", altitude_min = 7500, altitude_max = 11000 },
                { name = "H", transition = "H1", type = "UR", altitude_min = 5000 },
                { name = "FF14", transition = "H1", type = "UR", altitude_min = 2400 },
                { name = "H", transition = "H2", type = "UR", altitude_min = 7500, altitude_max = 11000 },
                { name = "H", transition = "H2", type = "UR", altitude_min = 5000 },
                { name = "FF14", transition = "H2", type = "UR", altitude_min = 2400 },
                { name = "FF14", transition = "", type = "UR" },
                { name = "36DME", transition = "", type = "UR" },
                { name = "H", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "H", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["R14"] = {
            name = "R14",
            type = "A",
            runway = "R14",
            waypoints = {
                { name = "ML007", transition = "ML007", type = "UR", altitude_min = 5500 },
                { name = "ML009", transition = "ML007", type = "UR", altitude_min = 3900 },
                { name = "ML008", transition = "ML008", type = "UR", altitude_min = 5500 },
                { name = "ML009", transition = "ML008", type = "UR", altitude_min = 3900 },
                { name = "ML009", transition = "", type = "UR", altitude_min = 3900 },
                { name = "ML010", transition = "", type = "UR" },
                { name = "RW14", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 410 },
                { name = "ML011", transition = "", type = "UR", speed = 215.0 },
                { name = "ML012", transition = "", type = "UR", speed = 215.0 },
                { name = "ML051", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML052", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML053", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML054", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML055", transition = "", type = "UR", altitude_min = 5500, speed = 215.0 },
                { name = "ML008", transition = "", type = "UR", altitude_min = 5500 },
            }
        },
        ["R32"] = {
            name = "R32",
            type = "A",
            runway = "R32",
            waypoints = {
                { name = "ML001", transition = "ML001", type = "UR", altitude_min = 5500 },
                { name = "ML003", transition = "ML001", type = "UR", altitude_min = 3900 },
                { name = "ML002", transition = "ML002", type = "UR", altitude_min = 5500 },
                { name = "ML003", transition = "ML002", type = "UR", altitude_min = 3900 },
                { name = "ML003", transition = "", type = "UR", altitude_min = 3900 },
                { name = "ML004", transition = "", type = "UR" },
                { name = "RW32", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 420 },
                { name = "ML005", transition = "", type = "UR", speed = 215.0 },
                { name = "ML006", transition = "", type = "UR", speed = 215.0 },
                { name = "ML034", transition = "", type = "UR", speed = 215.0 },
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
