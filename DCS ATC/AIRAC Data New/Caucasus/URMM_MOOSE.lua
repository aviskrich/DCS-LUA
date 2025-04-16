local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "URMM",
        Name = "URMM Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["D304L"] = { lat = 44.377922222, lon = 42.839063889, type = "URMM" },
        ["MM031"] = { lat = 59.760361111, lon = 150.534111111, type = "UHMM" },
        ["OKARU"] = { lat = 43.846666667, lon = 43.811944444, type = "ENRT" },
        ["MM002"] = { lat = 59.926277778, lon = 150.090833333, type = "UHMM" },
        ["FF29"] = { lat = 36.784105556, lon = 10.427880556, type = "DTTA" },
        ["URILU"] = { lat = 44.167777778, lon = 43.710277778, type = "ENRT" },
        ["D090O"] = { lat = 44.202222222, lon = 43.400277778, type = "URMM" },
        ["MM008"] = { lat = 59.901361111, lon = 151.0625, type = "UHMM" },
        ["RW29"] = { lat = -34.005188889, lon = 22.389325, type = "FAGG" },
        ["CI29"] = { lat = 36.780425, lon = 10.440847222, type = "DTTA" },
        ["UGBES"] = { lat = 44.751111111, lon = 43.523333333, type = "ENRT" },
        ["MM001"] = { lat = 59.812333333, lon = 150.28075, type = "UHMM" },
        ["LARIN"] = { lat = 44.599722222, lon = 43.018611111, type = "ENRT" },
        ["D122O"] = { lat = 44.077305556, lon = 43.321352778, type = "URMM" },
        ["D294C"] = { lat = 44.263805556, lon = 43.000763889, type = "URMM" },
        ["CF11"] = { lat = 48.334977778, lon = -71.295286111, type = "CYBG" },
        ["D284L"] = { lat = 44.316844444, lon = 42.786222222, type = "URMM" },
        ["D114E"] = { lat = 44.196644444, lon = 43.149038889, type = "URMM" },
        ["MM009"] = { lat = 59.896341667, lon = 151.230191667, type = "UHMM" },
        ["MM017"] = { lat = 59.871530556, lon = 150.286236111, type = "UHMM" },
        ["SULOD"] = { lat = 44.591388889, lon = 42.665277778, type = "ENRT" },
        ["ABELA"] = { lat = 44.191388889, lon = 42.600277778, type = "ENRT" },
        ["MM032"] = { lat = 59.742194444, lon = 150.209638889, type = "UHMM" },
        ["MM030"] = { lat = 59.680055556, lon = 151.347722222, type = "UHMM" },
        ["MM021"] = { lat = 59.852222222, lon = 149.806277778, type = "UHMM" },
        ["MM005"] = { lat = 59.917694444, lon = 150.458777778, type = "UHMM" },
        ["MM024"] = { lat = 60.035083333, lon = 151.576694444, type = "UHMM" },
        ["MM004"] = { lat = 59.921744444, lon = 150.290902778, type = "UHMM" },
        ["D117V"] = { lat = 44.032377778, lon = 43.462336111, type = "URMM" },
        ["CI11"] = { lat = 6.246402778, lon = 6.537169444, type = "DNAS" },
        ["D219S"] = { lat = 44.024302778, lon = 42.734325, type = "URMM" },
        ["D294G"] = { lat = -19.747658333, lon = 63.237377778, type = "FIMR" },
        ["FD11Z"] = { lat = 44.289194444, lon = 42.942963889, type = "URMM" },
        ["MM022"] = { lat = 59.97225, lon = 149.831861111, type = "UHMM" },
        ["MM015"] = { lat = 59.943394444, lon = 151.270955556, type = "UHMM" },
        ["MM006"] = { lat = 59.906675, lon = 150.889913889, type = "UHMM" },
        ["D325L"] = { lat = 44.424166667, lon = 42.923055556, type = "URMM" },
        ["MM036"] = { lat = 60.257722222, lon = 151.182472222, type = "UHMM" },
        ["D254L"] = { lat = 44.210444444, lon = 42.768547222, type = "URMM" },
        ["OGEMO"] = { lat = 44.467777778, lon = 43.614444444, type = "ENRT" },
        ["MM011"] = { lat = 60.031916667, lon = 151.344055556, type = "UHMM" },
        ["MM014"] = { lat = 59.800986111, lon = 151.050855556, type = "UHMM" },
        ["CD11Z"] = { lat = 44.349044444, lon = 42.808905556, type = "URMM" },
        ["MM007"] = { lat = 59.806422222, lon = 150.523463889, type = "UHMM" },
        ["MM018"] = { lat = 59.901444444, lon = 151.060083333, type = "UHMM" },
        ["MM013"] = { lat = 59.795972222, lon = 151.218055556, type = "UHMM" },
        ["D314L"] = { lat = 67.606388889, lon = 86.368055556, type = "UOII" },
        ["31THR"] = { lat = 30.968575, lon = -6.977105556, type = "GMMZ" },
        ["DEPSO"] = { lat = 44.52, lon = 43.379166667, type = "ENRT" },
        ["25VOR"] = { lat = 5.321355556, lon = -3.900655556, type = "DIAP" },
        ["CF29"] = { lat = 48.349947222, lon = -70.697352778, type = "CYBG" },
        ["MM037"] = { lat = 59.902527778, lon = 151.023, type = "UHMM" },
        ["MM035"] = { lat = 60.235472222, lon = 150.674194444, type = "UHMM" },
        ["MM027"] = { lat = 60.231888889, lon = 150.147027778, type = "UHMM" },
        ["MM029"] = { lat = 60.027833333, lon = 150.724138889, type = "UHMM" },
        ["57VOR"] = { lat = 36.181841667, lon = 5.405783333, type = "DAAS" },
        ["MM016"] = { lat = 59.904416667, lon = 150.975916667, type = "UHMM" },
        ["MOZAT"] = { lat = 43.728888889, lon = 43.143611111, type = "ENRT" },
        ["MM034"] = { lat = 59.951361111, lon = 149.814166667, type = "UHMM" },
        ["FD11Y"] = { lat = 44.352311111, lon = 42.801572222, type = "URMM" },
        ["FF11"] = { lat = 6.235394444, lon = 6.568830556, type = "DNAS" },
        ["DER11"] = { lat = 67.455822222, lon = 33.608530556, type = "ULMK" },
        ["FF282"] = { lat = 44.198163889, lon = 43.245322222, type = "URMM" },
        ["MM033"] = { lat = 59.778638889, lon = 150.876305556, type = "UHMM" },
        ["MM023"] = { lat = 59.729055556, lon = 150.496638889, type = "UHMM" },
        ["MM019"] = { lat = 59.919, lon = 150.435555556, type = "UHMM" },
        ["MM028"] = { lat = 60.158722222, lon = 150.200722222, type = "UHMM" },
        ["MM012"] = { lat = 59.890083333, lon = 151.429944444, type = "UHMM" },
        ["D106O"] = { lat = 44.136658333, lon = 43.373236111, type = "URMM" },
        ["D114P"] = { lat = 44.099636111, lon = 43.363469444, type = "URMM" },
        ["D138O"] = { lat = 44.030555556, lon = 43.249166667, type = "URMM" },
        ["RESLO"] = { lat = 43.95, lon = 42.625, type = "ENRT" },
        ["FN114"] = { lat = 44.300544444, lon = 42.919194444, type = "URMM" },
        ["D090H"] = { lat = 44.221036111, lon = 43.226869444, type = "URMM" },
        ["MM003"] = { lat = 60.022166667, lon = 150.300277778, type = "UHMM" },
        ["MM020"] = { lat = 44.272694444, lon = 42.981388889, type = "URMM" },
        ["D263L"] = { lat = 13.453077778, lon = 2.003630556, type = "DRRN" },
        ["MM026"] = { lat = 60.222277778, lon = 150.608777778, type = "UHMM" },
        ["MM025"] = { lat = 60.157416667, lon = 150.770333333, type = "UHMM" },
        ["DER29"] = { lat = 67.469686111, lon = 33.562738889, type = "ULMK" },
        ["FD29Y"] = { lat = 51.047305556, lon = 17.066388889, type = "EPWR" },
        ["MM010"] = { lat = 59.915808333, lon = 150.552883333, type = "UHMM" },
        ["FF114"] = { lat = 44.328213889, lon = 42.857316667, type = "URMM" },
        ["D169O"] = { lat = 43.987961111, lon = 43.071822222, type = "URMM" },
    },

    -- Данные ВПП
    Runways = {
        ["RW11"] = {
            heading = 110,
            length = 0,
            width = 0,
            threshold = { lat = 44.236155555555555, lon = 43.06236388888889 },
            end = { lat = 44.236155555555555, lon = 43.06236388888889 }
        },
        ["RW29"] = {
            heading = 290,
            length = 0,
            width = 0,
            threshold = { lat = 44.21745555555556, lon = 43.103675 },
            end = { lat = 44.21745555555556, lon = 43.103675 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ABEL5G"] = {
            name = "ABEL5G",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "MD", type = "P" },
                { name = "ABELA", type = "E", altitude_min = 10000 },
            }
        },
        ["ABEL5H"] = {
            name = "ABEL5H",
            runway = "RW29",
            waypoints = {
                { name = "MD", type = "P" },
                { name = "ABELA", type = "E", altitude_min = 10000 },
            }
        },
        ["ABEL5J"] = {
            name = "ABEL5J",
            runway = "RW11",
            waypoints = {
                { name = "", type = "" },
                { name = "MNW", type = "D" },
                { name = "ABELA", type = "E", altitude_min = 10000 },
            }
        },
        ["ABEL5K"] = {
            name = "ABEL5K",
            runway = "RW29",
            waypoints = {
                { name = "DER29", type = "P" },
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "ABELA", type = "E", altitude_min = 10000 },
            }
        },
        ["ABEL5L"] = {
            name = "ABEL5L",
            runway = "RW11",
            waypoints = {
                { name = "MM018", type = "P", speed = 245.0 },
                { name = "MM019", type = "P" },
                { name = "MM020", type = "P", altitude_min = 8000 },
                { name = "ABELA", type = "E", altitude_min = 10000 },
            }
        },
        ["ABEL5M"] = {
            name = "ABEL5M",
            runway = "RW29",
            waypoints = {
                { name = "MM029", type = "P", speed = 245.0 },
                { name = "MM030", type = "P" },
                { name = "ABELA", type = "E", altitude_min = 10000, altitude_max = 14000 },
            }
        },
        ["LARI5G"] = {
            name = "LARI5G",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "MD", type = "P" },
                { name = "", type = "" },
                { name = "LARIN", type = "E", altitude_min = 10000 },
            }
        },
        ["LARI5H"] = {
            name = "LARI5H",
            runway = "RW29",
            waypoints = {
                { name = "MD", type = "P" },
                { name = "LARIN", type = "E", altitude_min = 10000 },
            }
        },
        ["LARI5J"] = {
            name = "LARI5J",
            runway = "RW11",
            waypoints = {
                { name = "", type = "" },
                { name = "MNW", type = "D" },
                { name = "LARIN", type = "E", altitude_min = 10000 },
            }
        },
        ["LARI5K"] = {
            name = "LARI5K",
            runway = "RW29",
            waypoints = {
                { name = "DER29", type = "P" },
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "LARIN", type = "E", altitude_min = 10000 },
            }
        },
        ["LARI5L"] = {
            name = "LARI5L",
            runway = "RW11",
            waypoints = {
                { name = "MM018", type = "P", speed = 245.0 },
                { name = "MM019", type = "P" },
                { name = "MM021", type = "P", altitude_min = 12000 },
                { name = "LARIN", type = "E", altitude_min = 12000 },
            }
        },
        ["LARI5M"] = {
            name = "LARI5M",
            runway = "RW29",
            waypoints = {
                { name = "MM026", type = "P", speed = 245.0 },
                { name = "LARIN", type = "E", altitude_min = 10000 },
            }
        },
        ["LARI5U"] = {
            name = "LARI5U",
            runway = "RW11",
            waypoints = {
                { name = "", type = "" },
                { name = "MNW", type = "D" },
                { name = "LARIN", type = "E", altitude_min = 10000 },
            }
        },
        ["MOZA5G"] = {
            name = "MOZA5G",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "MD", type = "P" },
                { name = "", type = "" },
                { name = "MOZAT", type = "E", altitude_min = 11000 },
            }
        },
        ["MOZA5H"] = {
            name = "MOZA5H",
            runway = "RW29",
            waypoints = {
                { name = "MD", type = "P" },
                { name = "", type = "" },
                { name = "MOZAT", type = "E", altitude_min = 11000 },
            }
        },
        ["MOZA5J"] = {
            name = "MOZA5J",
            runway = "RW11",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "MOZAT", type = "E", altitude_min = 11000 },
            }
        },
        ["MOZA5K"] = {
            name = "MOZA5K",
            runway = "RW29",
            waypoints = {
                { name = "DER29", type = "P" },
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "MOZAT", type = "E", altitude_min = 11000 },
            }
        },
        ["MOZA5L"] = {
            name = "MOZA5L",
            runway = "RW11",
            waypoints = {
                { name = "MM025", type = "P" },
                { name = "MOZAT", type = "E", altitude_min = 11000 },
            }
        },
        ["MOZA5M"] = {
            name = "MOZA5M",
            runway = "RW29",
            waypoints = {
                { name = "MM029", type = "P", speed = 245.0 },
                { name = "MM030", type = "P" },
                { name = "MM031", type = "P", altitude_min = 12000, altitude_max = 14000 },
                { name = "MOZAT", type = "E", altitude_min = 13000 },
            }
        },
        ["MOZA5V"] = {
            name = "MOZA5V",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 2500 },
                { name = "", type = "" },
                { name = "MOZAT", type = "E", altitude_min = 11000 },
            }
        },
        ["OGEM5G"] = {
            name = "OGEM5G",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "OGEMO", type = "E", altitude_min = 11000 },
            }
        },
        ["OGEM5H"] = {
            name = "OGEM5H",
            runway = "RW29",
            waypoints = {
                { name = "MD", type = "P" },
                { name = "", type = "" },
                { name = "OGEMO", type = "E", altitude_min = 11000 },
            }
        },
        ["OGEM5J"] = {
            name = "OGEM5J",
            runway = "RW11",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "OGEMO", type = "E", altitude_min = 11000 },
            }
        },
        ["OGEM5K"] = {
            name = "OGEM5K",
            runway = "RW29",
            waypoints = {
                { name = "DER29", type = "P" },
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "OGEMO", type = "E", altitude_min = 11000 },
            }
        },
        ["OGEM5L"] = {
            name = "OGEM5L",
            runway = "RW11",
            waypoints = {
                { name = "MM018", type = "P", speed = 245.0 },
                { name = "MM023", type = "P", altitude_max = 9000 },
                { name = "OGEMO", type = "E", altitude_min = 11000 },
            }
        },
        ["OGEM5M"] = {
            name = "OGEM5M",
            runway = "RW29",
            waypoints = {
                { name = "MM026", type = "P", speed = 245.0 },
                { name = "MM027", type = "P", altitude_min = 12000 },
                { name = "OGEMO", type = "E", altitude_min = 13000 },
            }
        },
        ["OKAR5G"] = {
            name = "OKAR5G",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 2500 },
                { name = "OKARU", type = "E", altitude_min = 11000 },
            }
        },
        ["OKAR5H"] = {
            name = "OKAR5H",
            runway = "RW29",
            waypoints = {
                { name = "MD", type = "P" },
                { name = "", type = "" },
                { name = "OKARU", type = "E", altitude_min = 11000 },
            }
        },
        ["OKAR5J"] = {
            name = "OKAR5J",
            runway = "RW11",
            waypoints = {
                { name = "", type = "" },
                { name = "OKARU", type = "E", altitude_min = 11000 },
            }
        },
        ["OKAR5K"] = {
            name = "OKAR5K",
            runway = "RW29",
            waypoints = {
                { name = "", type = "" },
                { name = "MNW", type = "D" },
                { name = "OKARU", type = "E", altitude_min = 11000 },
            }
        },
        ["OKAR5L"] = {
            name = "OKAR5L",
            runway = "RW11",
            waypoints = {
                { name = "MM025", type = "P" },
                { name = "OKARU", type = "E", altitude_min = 11000 },
            }
        },
        ["OKAR5M"] = {
            name = "OKAR5M",
            runway = "RW29",
            waypoints = {
                { name = "MM026", type = "P", speed = 245.0 },
                { name = "MM027", type = "P", altitude_min = 12000 },
                { name = "OKARU", type = "E", altitude_min = 13000 },
            }
        },
        ["RESL5G"] = {
            name = "RESL5G",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "MD", type = "P" },
                { name = "RESLO", type = "E", altitude_min = 12000 },
            }
        },
        ["RESL5H"] = {
            name = "RESL5H",
            runway = "RW29",
            waypoints = {
                { name = "MD", type = "P" },
                { name = "RESLO", type = "E", altitude_min = 12000 },
            }
        },
        ["RESL5J"] = {
            name = "RESL5J",
            runway = "RW11",
            waypoints = {
                { name = "", type = "" },
                { name = "MNW", type = "D" },
                { name = "RESLO", type = "E", altitude_min = 12000 },
            }
        },
        ["RESL5K"] = {
            name = "RESL5K",
            runway = "RW29",
            waypoints = {
                { name = "DER29", type = "P" },
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "RESLO", type = "E", altitude_min = 12000 },
            }
        },
        ["RESL5L"] = {
            name = "RESL5L",
            runway = "RW11",
            waypoints = {
                { name = "MM018", type = "P", speed = 245.0 },
                { name = "MM019", type = "P" },
                { name = "MM020", type = "P", altitude_min = 8000 },
                { name = "RESLO", type = "E", altitude_min = 12000 },
            }
        },
        ["RESL5M"] = {
            name = "RESL5M",
            runway = "RW29",
            waypoints = {
                { name = "MM029", type = "P", speed = 245.0 },
                { name = "MM030", type = "P" },
                { name = "RESLO", type = "E", altitude_min = 12000, altitude_max = 14000 },
            }
        },
        ["SULO5G"] = {
            name = "SULO5G",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "MD", type = "P" },
                { name = "SULOD", type = "E", altitude_min = 10000 },
            }
        },
        ["SULO5H"] = {
            name = "SULO5H",
            runway = "RW29",
            waypoints = {
                { name = "MD", type = "P" },
                { name = "SULOD", type = "E", altitude_min = 10000 },
            }
        },
        ["SULO5J"] = {
            name = "SULO5J",
            runway = "RW11",
            waypoints = {
                { name = "", type = "" },
                { name = "MNW", type = "D" },
                { name = "SULOD", type = "E", altitude_min = 10000 },
            }
        },
        ["SULO5K"] = {
            name = "SULO5K",
            runway = "RW29",
            waypoints = {
                { name = "DER29", type = "P" },
                { name = "", type = "" },
                { name = "SULOD", type = "E", altitude_min = 10000 },
            }
        },
        ["SULO5L"] = {
            name = "SULO5L",
            runway = "RW11",
            waypoints = {
                { name = "MM018", type = "P", speed = 245.0 },
                { name = "MM019", type = "P" },
                { name = "MM021", type = "P", altitude_min = 12000 },
                { name = "MM022", type = "P" },
                { name = "SULOD", type = "E", altitude_min = 12000 },
            }
        },
        ["SULO5M"] = {
            name = "SULO5M",
            runway = "RW29",
            waypoints = {
                { name = "MM029", type = "P", speed = 245.0 },
                { name = "SULOD", type = "E", altitude_min = 10000 },
            }
        },
        ["UGBE5G"] = {
            name = "UGBE5G",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "MD", type = "P" },
                { name = "", type = "" },
                { name = "UGBES", type = "E", altitude_min = 10000 },
            }
        },
        ["UGBE5H"] = {
            name = "UGBE5H",
            runway = "RW29",
            waypoints = {
                { name = "MD", type = "P" },
                { name = "", type = "" },
                { name = "UGBES", type = "E", altitude_min = 10000 },
            }
        },
        ["UGBE5J"] = {
            name = "UGBE5J",
            runway = "RW11",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "UGBES", type = "E", altitude_min = 10000 },
            }
        },
        ["UGBE5K"] = {
            name = "UGBE5K",
            runway = "RW29",
            waypoints = {
                { name = "DER29", type = "P" },
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "UGBES", type = "E", altitude_min = 10000 },
            }
        },
        ["UGBE5L"] = {
            name = "UGBE5L",
            runway = "RW11",
            waypoints = {
                { name = "MM018", type = "P", speed = 245.0 },
                { name = "MM024", type = "P", altitude_max = 9000 },
                { name = "UGBES", type = "E", altitude_min = 10000 },
            }
        },
        ["UGBE5M"] = {
            name = "UGBE5M",
            runway = "RW29",
            waypoints = {
                { name = "MM026", type = "P", speed = 245.0 },
                { name = "MM028", type = "P", altitude_max = 9000 },
                { name = "UGBES", type = "E", altitude_min = 10000 },
            }
        },
        ["URIL5G"] = {
            name = "URIL5G",
            runway = "RW11",
            waypoints = {
                { name = "DER11", type = "P" },
                { name = "", type = "", altitude_min = 2000 },
                { name = "", type = "" },
                { name = "URILU", type = "E", altitude_min = 11000 },
            }
        },
        ["URIL5H"] = {
            name = "URIL5H",
            runway = "RW29",
            waypoints = {
                { name = "MD", type = "P" },
                { name = "", type = "" },
                { name = "URILU", type = "E", altitude_min = 11000 },
            }
        },
        ["URIL5J"] = {
            name = "URIL5J",
            runway = "RW11",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "URILU", type = "E", altitude_min = 11000 },
            }
        },
        ["URIL5K"] = {
            name = "URIL5K",
            runway = "RW29",
            waypoints = {
                { name = "DER29", type = "P" },
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "URILU", type = "E", altitude_min = 11000 },
            }
        },
        ["URIL5L"] = {
            name = "URIL5L",
            runway = "RW11",
            waypoints = {
                { name = "MM025", type = "P" },
                { name = "URILU", type = "E", altitude_min = 11000, altitude_max = 13000 },
            }
        },
        ["URIL5M"] = {
            name = "URIL5M",
            runway = "RW29",
            waypoints = {
                { name = "MM026", type = "P", speed = 245.0 },
                { name = "MM027", type = "P", altitude_min = 12000 },
                { name = "URILU", type = "E", altitude_min = 13000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ABEL5A"] = {
            name = "ABEL5A",
            runway = "RW11",
            waypoints = {
                { name = "ABELA", type = "UR", altitude_min = 10000 },
                { name = "MM001", type = "UR", altitude_min = 6500 },
            }
        },
        ["ABEL5B"] = {
            name = "ABEL5B",
            runway = "RW29",
            waypoints = {
                { name = "ABELA", type = "UR", altitude_min = 15000 },
                { name = "MM032", type = "UR" },
                { name = "MM033", type = "UR", altitude_min = 15000 },
                { name = "MM034", type = "UR" },
                { name = "MM035", type = "UR", altitude_min = 10000, altitude_max = 11000 },
                { name = "MM036", type = "UR" },
                { name = "MM011", type = "UR", altitude_min = 4500 },
            }
        },
        ["ABEL5E"] = {
            name = "ABEL5E",
            runway = "ALL",
            waypoints = {
                { name = "ABELA", type = "UR", altitude_min = 10000 },
                { name = "MNW", type = "UR", altitude_min = 7000 },
            }
        },
        ["ABEL5F"] = {
            name = "ABEL5F",
            runway = "ALL",
            waypoints = {
                { name = "ABELA", type = "UR", altitude_min = 10000 },
                { name = "MD", type = "UR", altitude_min = 7000 },
            }
        },
        ["ABEL5W"] = {
            name = "ABEL5W",
            runway = "RW29",
            waypoints = {
                { name = "ABELA", type = "UR", altitude_min = 10000 },
                { name = "MNW", type = "UR", altitude_min = 7000 },
                { name = "D090H", type = "UR", altitude_min = 6000 },
                { name = "D090O", type = "UR", altitude_min = 4500 },
            }
        },
        ["DEPS5A"] = {
            name = "DEPS5A",
            runway = "RW11",
            waypoints = {
                { name = "DEPSO", type = "UR", altitude_min = 10000 },
                { name = "MM015", type = "UR" },
                { name = "MM008", type = "UR" },
                { name = "MM003", type = "UR", altitude_min = 5000 },
            }
        },
        ["DEPS5B"] = {
            name = "DEPS5B",
            runway = "RW29",
            waypoints = {
                { name = "DEPSO", type = "UR", altitude_min = 10000 },
                { name = "MM036", type = "UR" },
                { name = "MM011", type = "UR", altitude_min = 4500 },
            }
        },
        ["DEPS5C"] = {
            name = "DEPS5C",
            runway = "RW11",
            waypoints = {
                { name = "DEPSO", type = "UR", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "D325L", type = "UR", altitude_min = 5000 },
            }
        },
        ["DEPS5D"] = {
            name = "DEPS5D",
            runway = "RW29",
            waypoints = {
                { name = "DEPSO", type = "UR", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "D090O", type = "UR", altitude_min = 4500 },
            }
        },
        ["DEPS5E"] = {
            name = "DEPS5E",
            runway = "ALL",
            waypoints = {
                { name = "DEPSO", type = "UR", altitude_min = 10000 },
                { name = "MNW", type = "UR", altitude_min = 7000 },
            }
        },
        ["DEPS5F"] = {
            name = "DEPS5F",
            runway = "ALL",
            waypoints = {
                { name = "DEPSO", type = "UR", altitude_min = 10000 },
                { name = "MD", type = "UR", altitude_min = 7000 },
            }
        },
        ["LARI5A"] = {
            name = "LARI5A",
            runway = "RW11",
            waypoints = {
                { name = "LARIN", type = "UR", altitude_min = 10000 },
                { name = "MM008", type = "UR" },
                { name = "MM003", type = "UR", altitude_min = 5000 },
            }
        },
        ["LARI5B"] = {
            name = "LARI5B",
            runway = "RW29",
            waypoints = {
                { name = "LARIN", type = "UR", altitude_min = 10000 },
                { name = "MM034", type = "UR" },
                { name = "MM035", type = "UR", altitude_min = 10000, altitude_max = 11000 },
                { name = "MM036", type = "UR" },
                { name = "MM011", type = "UR", altitude_min = 4500 },
            }
        },
        ["LARI5C"] = {
            name = "LARI5C",
            runway = "RW11",
            waypoints = {
                { name = "LARIN", type = "UR", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "D325L", type = "UR", altitude_min = 5000 },
            }
        },
        ["LARI5D"] = {
            name = "LARI5D",
            runway = "RW29",
            waypoints = {
                { name = "LARIN", type = "UR", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "D090O", type = "UR", altitude_min = 4500 },
            }
        },
        ["LARI5E"] = {
            name = "LARI5E",
            runway = "ALL",
            waypoints = {
                { name = "LARIN", type = "UR", altitude_min = 10000 },
                { name = "MNW", type = "UR", altitude_min = 7000 },
            }
        },
        ["LARI5F"] = {
            name = "LARI5F",
            runway = "ALL",
            waypoints = {
                { name = "LARIN", type = "UR", altitude_min = 10000 },
                { name = "MD", type = "UR", altitude_min = 7000 },
            }
        },
        ["OGEM5A"] = {
            name = "OGEM5A",
            runway = "RW11",
            waypoints = {
                { name = "OGEMO", type = "UR", altitude_min = 10000 },
                { name = "MM015", type = "UR" },
                { name = "MM008", type = "UR" },
                { name = "MM003", type = "UR", altitude_min = 5000 },
            }
        },
        ["OGEM5B"] = {
            name = "OGEM5B",
            runway = "RW29",
            waypoints = {
                { name = "OGEMO", type = "UR", altitude_min = 10000, altitude_max = 11000 },
                { name = "MM036", type = "UR" },
                { name = "MM011", type = "UR", altitude_min = 4500 },
            }
        },
        ["OGEM5C"] = {
            name = "OGEM5C",
            runway = "RW11",
            waypoints = {
                { name = "OGEMO", type = "UR", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "D325L", type = "UR", altitude_min = 5000 },
            }
        },
        ["OGEM5D"] = {
            name = "OGEM5D",
            runway = "RW29",
            waypoints = {
                { name = "OGEMO", type = "UR", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "D090O", type = "UR", altitude_min = 4500 },
            }
        },
        ["OGEM5E"] = {
            name = "OGEM5E",
            runway = "ALL",
            waypoints = {
                { name = "OGEMO", type = "UR", altitude_min = 10000 },
                { name = "MNW", type = "UR", altitude_min = 7000 },
            }
        },
        ["OGEM5F"] = {
            name = "OGEM5F",
            runway = "ALL",
            waypoints = {
                { name = "OGEMO", type = "UR", altitude_min = 10000 },
                { name = "MD", type = "UR", altitude_min = 7000 },
            }
        },
        ["OKAR5A"] = {
            name = "OKAR5A",
            runway = "RW11",
            waypoints = {
                { name = "OKARU", type = "UR", altitude_min = 14000 },
                { name = "MM017", type = "UR", altitude_min = 14000 },
                { name = "MM016", type = "UR", altitude_min = 10000, altitude_max = 11000 },
                { name = "MM008", type = "UR" },
                { name = "MM003", type = "UR", altitude_min = 5000 },
            }
        },
        ["OKAR5B"] = {
            name = "OKAR5B",
            runway = "RW29",
            waypoints = {
                { name = "OKARU", type = "UR", altitude_min = 10000 },
                { name = "MM010", type = "UR", altitude_min = 4000 },
            }
        },
        ["OKAR5C"] = {
            name = "OKAR5C",
            runway = "RW11",
            waypoints = {
                { name = "OKARU", type = "UR", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "D325L", type = "UR", altitude_min = 5000 },
            }
        },
        ["OKAR5D"] = {
            name = "OKAR5D",
            runway = "RW29",
            waypoints = {
                { name = "OKARU", type = "UR", altitude_min = 10000 },
                { name = "D117V", type = "UR", altitude_min = 5000 },
            }
        },
        ["OKAR5E"] = {
            name = "OKAR5E",
            runway = "ALL",
            waypoints = {
                { name = "OKARU", type = "UR", altitude_min = 10000 },
                { name = "MNW", type = "UR", altitude_min = 7000 },
            }
        },
        ["OKAR5F"] = {
            name = "OKAR5F",
            runway = "ALL",
            waypoints = {
                { name = "OKARU", type = "UR", altitude_min = 10000 },
                { name = "MD", type = "UR", altitude_min = 7000 },
            }
        },
        ["OKAR5X"] = {
            name = "OKAR5X",
            runway = "RW11",
            waypoints = {
                { name = "OKARU", type = "UR", altitude_min = 10000 },
                { name = "MNW", type = "UR", altitude_min = 5500 },
                { name = "D325L", type = "UR", altitude_min = 5000 },
            }
        },
        ["RESL5A"] = {
            name = "RESL5A",
            runway = "RW11",
            waypoints = {
                { name = "RESLO", type = "UR", altitude_min = 11000 },
                { name = "MM001", type = "UR", altitude_min = 6500 },
            }
        },
        ["RESL5B"] = {
            name = "RESL5B",
            runway = "RW29",
            waypoints = {
                { name = "RESLO", type = "UR", altitude_min = 15000 },
                { name = "MM032", type = "UR" },
                { name = "MM033", type = "UR", altitude_min = 15000 },
                { name = "MM034", type = "UR" },
                { name = "MM035", type = "UR", altitude_min = 10000, altitude_max = 11000 },
                { name = "MM036", type = "UR" },
                { name = "MM011", type = "UR", altitude_min = 4500 },
            }
        },
        ["RESL5C"] = {
            name = "RESL5C",
            runway = "RW11",
            waypoints = {
                { name = "RESLO", type = "UR", altitude_min = 11000 },
                { name = "D219S", type = "UR", altitude_min = 7000 },
                { name = "", type = "" },
                { name = "D263L", type = "UR", altitude_min = 5000 },
            }
        },
        ["RESL5D"] = {
            name = "RESL5D",
            runway = "RW29",
            waypoints = {
                { name = "RESLO", type = "UR", altitude_min = 11000 },
                { name = "", type = "" },
                { name = "D169O", type = "UR", altitude_min = 7000 },
                { name = "D138O", type = "UR", altitude_min = 5000 },
            }
        },
        ["RESL5E"] = {
            name = "RESL5E",
            runway = "ALL",
            waypoints = {
                { name = "RESLO", type = "UR", altitude_min = 11000 },
                { name = "MNW", type = "UR", altitude_min = 7000 },
            }
        },
        ["RESL5F"] = {
            name = "RESL5F",
            runway = "ALL",
            waypoints = {
                { name = "RESLO", type = "UR", altitude_min = 11000 },
                { name = "MD", type = "UR", altitude_min = 7000 },
            }
        },
        ["RESL5W"] = {
            name = "RESL5W",
            runway = "RW29",
            waypoints = {
                { name = "RESLO", type = "UR", altitude_min = 11000 },
                { name = "MNW", type = "UR", altitude_min = 7000 },
                { name = "D090H", type = "UR", altitude_min = 6000 },
                { name = "D090O", type = "UR", altitude_min = 4500 },
            }
        },
        ["RESL5Z"] = {
            name = "RESL5Z",
            runway = "RW29",
            waypoints = {
                { name = "RESLO", type = "UR", altitude_min = 15000 },
                { name = "MM037", type = "UR", altitude_max = 11000 },
                { name = "MM013", type = "UR", altitude_min = 6500 },
            }
        },
        ["SULO5A"] = {
            name = "SULO5A",
            runway = "RW11",
            waypoints = {
                { name = "SULOD", type = "UR", altitude_min = 10000 },
                { name = "MM002", type = "UR", altitude_min = 5000 },
            }
        },
        ["SULO5B"] = {
            name = "SULO5B",
            runway = "RW29",
            waypoints = {
                { name = "SULOD", type = "UR", altitude_min = 11000 },
                { name = "MM034", type = "UR" },
                { name = "MM035", type = "UR", altitude_min = 10000, altitude_max = 11000 },
                { name = "MM036", type = "UR" },
                { name = "MM011", type = "UR", altitude_min = 4500 },
            }
        },
        ["SULO5C"] = {
            name = "SULO5C",
            runway = "RW11",
            waypoints = {
                { name = "SULOD", type = "UR", altitude_min = 10000 },
                { name = "D314L", type = "UR", altitude_min = 5000 },
            }
        },
        ["SULO5D"] = {
            name = "SULO5D",
            runway = "RW29",
            waypoints = {
                { name = "SULOD", type = "UR", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "D090O", type = "UR", altitude_min = 4500 },
            }
        },
        ["SULO5E"] = {
            name = "SULO5E",
            runway = "ALL",
            waypoints = {
                { name = "SULOD", type = "UR", altitude_min = 10000 },
                { name = "MNW", type = "UR", altitude_min = 7000 },
            }
        },
        ["SULO5F"] = {
            name = "SULO5F",
            runway = "ALL",
            waypoints = {
                { name = "SULOD", type = "UR", altitude_min = 10000 },
                { name = "MD", type = "UR", altitude_min = 7000 },
            }
        },
        ["SULO5W"] = {
            name = "SULO5W",
            runway = "RW29",
            waypoints = {
                { name = "SULOD", type = "UR", altitude_min = 10000 },
                { name = "MNW", type = "UR", altitude_min = 7000 },
                { name = "D090H", type = "UR", altitude_min = 6000 },
                { name = "D090O", type = "UR", altitude_min = 4500 },
            }
        },
        ["URIL5A"] = {
            name = "URIL5A",
            runway = "RW11",
            waypoints = {
                { name = "URILU", type = "UR", altitude_min = 14000 },
                { name = "MM017", type = "UR", altitude_min = 14000 },
                { name = "MM016", type = "UR", altitude_min = 10000, altitude_max = 11000 },
                { name = "MM008", type = "UR" },
                { name = "MM003", type = "UR", altitude_min = 5000 },
            }
        },
        ["URIL5B"] = {
            name = "URIL5B",
            runway = "RW29",
            waypoints = {
                { name = "URILU", type = "UR", altitude_min = 10000, altitude_max = 11000 },
                { name = "MM010", type = "UR", altitude_min = 4000 },
            }
        },
        ["URIL5C"] = {
            name = "URIL5C",
            runway = "RW11",
            waypoints = {
                { name = "URILU", type = "UR", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "D325L", type = "UR", altitude_min = 5000 },
            }
        },
        ["URIL5D"] = {
            name = "URIL5D",
            runway = "RW29",
            waypoints = {
                { name = "URILU", type = "UR", altitude_min = 10000 },
                { name = "D090O", type = "UR", altitude_min = 4500 },
            }
        },
        ["URIL5E"] = {
            name = "URIL5E",
            runway = "ALL",
            waypoints = {
                { name = "URILU", type = "UR", altitude_min = 10000 },
                { name = "MNW", type = "UR", altitude_min = 7000 },
            }
        },
        ["URIL5F"] = {
            name = "URIL5F",
            runway = "ALL",
            waypoints = {
                { name = "URILU", type = "UR", altitude_min = 10000 },
                { name = "MD", type = "UR", altitude_min = 7000 },
            }
        },
        ["URIL5X"] = {
            name = "URIL5X",
            runway = "RW11",
            waypoints = {
                { name = "URILU", type = "UR", altitude_min = 10000 },
                { name = "MNW", type = "UR", altitude_min = 5500 },
                { name = "D325L", type = "UR", altitude_min = 5000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D11-Z"] = {
            name = "D11-Z",
            type = "A",
            runway = "D11-Z",
            waypoints = {
                { name = "ABELA", transition = "ABELA", type = "UR", altitude_min = 10000 },
                { name = "D254L", transition = "ABELA", type = "UR" },
                { name = "D263L", transition = "ABELA", type = "UR", altitude_min = 5000 },
                { name = "CD11Z", transition = "ABELA", type = "UR", altitude_min = 4000 },
                { name = "D263L", transition = "D263L", type = "UR", altitude_min = 5000 },
                { name = "CD11Z", transition = "D263L", type = "UR", altitude_min = 4000 },
                { name = "D314L", transition = "D314L", type = "UR", altitude_min = 5000 },
                { name = "CD11Z", transition = "D314L", type = "UR", altitude_min = 4000 },
                { name = "D325L", transition = "D325L", type = "UR", altitude_min = 5000 },
                { name = "CD11Z", transition = "D325L", type = "UR", altitude_min = 4000 },
                { name = "CD11Z", transition = "", type = "UR", altitude_min = 4000 },
                { name = "FD11Z", transition = "", type = "UR", altitude_min = 3000 },
                { name = "25VOR", transition = "", type = "UR" },
                { name = "MNW", transition = "", type = "UR" },
                { name = "D114E", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "", transition = "", type = "" },
                { name = "D325L", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["D29-Z"] = {
            name = "D29-Z",
            type = "A",
            runway = "D29-Z",
            waypoints = {
                { name = "D090O", transition = "D090O", type = "UR", altitude_min = 4500 },
                { name = "CF29", transition = "D090O", type = "UR", altitude_min = 4000 },
                { name = "D117V", transition = "D117V", type = "UR", altitude_min = 5000 },
                { name = "", transition = "D117V", type = "" },
                { name = "CF29", transition = "D117V", type = "UR", altitude_min = 4000 },
                { name = "D138O", transition = "D138O", type = "UR", altitude_min = 5000 },
                { name = "CF29", transition = "D138O", type = "UR", altitude_min = 4000 },
                { name = "CF29", transition = "", type = "UR", altitude_min = 4000 },
                { name = "FF29", transition = "", type = "UR", altitude_min = 3000 },
                { name = "57VOR", transition = "", type = "UR" },
                { name = "RW29", transition = "", type = "UR" },
                { name = "MNW", transition = "", type = "UR" },
                { name = "D294C", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2800 },
                { name = "", transition = "", type = "" },
                { name = "D090O", transition = "", type = "UR", altitude_min = 4500 },
            }
        },
        ["I11-X"] = {
            name = "I11-X",
            type = "I",
            runway = "I11-X",
            waypoints = {
                { name = "CI11", transition = "", type = "UR" },
                { name = "FF11", transition = "", type = "UR" },
                { name = "RW11", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "MD", transition = "", type = "UR", altitude_min = 5300 },
            }
        },
        ["I11-Y"] = {
            name = "I11-Y",
            type = "A",
            runway = "I11-Y",
            waypoints = {
                { name = "ABELA", transition = "ABELA", type = "UR", altitude_min = 10000 },
                { name = "D254L", transition = "ABELA", type = "UR" },
                { name = "D263L", transition = "ABELA", type = "UR", altitude_min = 5000 },
                { name = "D284L", transition = "ABELA", type = "UR", altitude_min = 4000 },
                { name = "", transition = "ABELA", type = "" },
                { name = "D263L", transition = "D263L", type = "UR", altitude_min = 5000 },
                { name = "D284L", transition = "D263L", type = "UR", altitude_min = 4000 },
                { name = "", transition = "D263L", type = "" },
                { name = "D314L", transition = "D314L", type = "UR", altitude_min = 5000 },
                { name = "D304L", transition = "D314L", type = "UR", altitude_min = 4000 },
                { name = "", transition = "D314L", type = "" },
                { name = "D325L", transition = "D325L", type = "UR", altitude_min = 5000 },
                { name = "D304L", transition = "D325L", type = "UR", altitude_min = 4000 },
                { name = "", transition = "D325L", type = "" },
                { name = "CF11", transition = "", type = "UR" },
                { name = "FF11", transition = "", type = "UR" },
                { name = "RW11", transition = "", type = "UR" },
                { name = "D114E", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "", transition = "", type = "" },
                { name = "D325L", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["I11-Z"] = {
            name = "I11-Z",
            type = "A",
            runway = "I11-Z",
            waypoints = {
                { name = "MM001", transition = "MM001", type = "UR", altitude_min = 6500 },
                { name = "MM004", transition = "MM001", type = "UR", altitude_min = 4000 },
                { name = "MM002", transition = "MM002", type = "UR", altitude_min = 5000 },
                { name = "MM004", transition = "MM002", type = "UR", altitude_min = 4000 },
                { name = "MM003", transition = "MM003", type = "UR", altitude_min = 5000 },
                { name = "MM004", transition = "MM003", type = "UR", altitude_min = 4000 },
                { name = "MM004", transition = "", type = "UR" },
                { name = "FF11", transition = "", type = "UR" },
                { name = "RW11", transition = "", type = "UR" },
                { name = "MM006", transition = "", type = "UR" },
                { name = "MM007", transition = "", type = "UR" },
                { name = "MM003", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["I29-X"] = {
            name = "I29-X",
            type = "A",
            runway = "I29-X",
            waypoints = {
                { name = "MD", transition = "MD1", type = "UR", altitude_min = 7000 },
                { name = "MD", transition = "MD1", type = "UR", altitude_min = 5200, speed = 205.0 },
                { name = "CI29", transition = "MD1", type = "UR", altitude_min = 3000 },
                { name = "MD", transition = "MD2", type = "UR", altitude_min = 7000 },
                { name = "MD", transition = "MD2", type = "UR", altitude_min = 5200, speed = 205.0 },
                { name = "CI29", transition = "MD2", type = "UR", altitude_min = 3000 },
                { name = "CI29", transition = "", type = "UR" },
                { name = "FF29", transition = "", type = "UR" },
                { name = "RW29", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3600 },
                { name = "MD", transition = "", type = "UR", altitude_min = 5400 },
            }
        },
        ["I29-Y"] = {
            name = "I29-Y",
            type = "A",
            runway = "I29-Y",
            waypoints = {
                { name = "D090O", transition = "D090O", type = "UR", altitude_min = 4500 },
                { name = "D106O", transition = "D090O", type = "UR", altitude_min = 4000 },
                { name = "", transition = "D090O", type = "" },
                { name = "D117V", transition = "D117V", type = "UR", altitude_min = 5000 },
                { name = "", transition = "D117V", type = "" },
                { name = "CF29", transition = "D117V", type = "UR", altitude_min = 4000 },
                { name = "D138O", transition = "D138O", type = "UR", altitude_min = 5000 },
                { name = "D122O", transition = "D138O", type = "UR", altitude_min = 4000 },
                { name = "", transition = "D138O", type = "" },
                { name = "CF29", transition = "", type = "UR" },
                { name = "FF29", transition = "", type = "UR" },
                { name = "RW29", transition = "", type = "UR" },
                { name = "D294C", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 2800 },
                { name = "", transition = "", type = "" },
                { name = "D090O", transition = "", type = "UR", altitude_min = 4500 },
            }
        },
        ["I29-Z"] = {
            name = "I29-Z",
            type = "A",
            runway = "I29-Z",
            waypoints = {
                { name = "MM011", transition = "MM011", type = "UR", altitude_min = 4500 },
                { name = "MM010", transition = "MM011", type = "UR", altitude_min = 4000 },
                { name = "MM013", transition = "MM013", type = "UR", altitude_min = 6500 },
                { name = "MM010", transition = "MM013", type = "UR", altitude_min = 4000 },
                { name = "MM010", transition = "", type = "UR" },
                { name = "FF29", transition = "", type = "UR" },
                { name = "RW29", transition = "", type = "UR" },
                { name = "MM012", transition = "", type = "UR" },
                { name = "MM014", transition = "", type = "UR" },
                { name = "MM011", transition = "", type = "UR", altitude_min = 4500 },
            }
        },
        ["J11"] = {
            name = "J11",
            type = "A",
            runway = "J11",
            waypoints = {
                { name = "MM001", transition = "MM001", type = "UR", altitude_min = 6500 },
                { name = "MM004", transition = "MM001", type = "UR", altitude_min = 4000 },
                { name = "MM002", transition = "MM002", type = "UR", altitude_min = 5000 },
                { name = "MM004", transition = "MM002", type = "UR", altitude_min = 4000 },
                { name = "MM003", transition = "MM003", type = "UR", altitude_min = 5000 },
                { name = "MM004", transition = "MM003", type = "UR", altitude_min = 4000 },
                { name = "MM004", transition = "", type = "UR" },
                { name = "MM005", transition = "", type = "UR" },
                { name = "RW11", transition = "", type = "UR" },
                { name = "MM006", transition = "", type = "UR" },
                { name = "MM007", transition = "", type = "UR" },
                { name = "MM003", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["J29"] = {
            name = "J29",
            type = "A",
            runway = "J29",
            waypoints = {
                { name = "MM011", transition = "MM011", type = "UR", altitude_min = 4500 },
                { name = "MM010", transition = "MM011", type = "UR", altitude_min = 4000 },
                { name = "MM013", transition = "MM013", type = "UR", altitude_min = 6500 },
                { name = "MM010", transition = "MM013", type = "UR", altitude_min = 4000 },
                { name = "MM010", transition = "", type = "UR" },
                { name = "MM009", transition = "", type = "UR" },
                { name = "RW29", transition = "", type = "UR" },
                { name = "MM012", transition = "", type = "UR" },
                { name = "MM014", transition = "", type = "UR" },
                { name = "MM011", transition = "", type = "UR", altitude_min = 4500 },
            }
        },
        ["NDBA"] = {
            name = "NDBA",
            type = "N",
            runway = "NDBA",
            waypoints = {
                { name = "FF114", transition = "", type = "UR", altitude_min = 4700 },
                { name = "MD", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3600 },
                { name = "MD", transition = "", type = "UR", altitude_min = 5300 },
            }
        },
        ["NDBB"] = {
            name = "NDBB",
            type = "A",
            runway = "NDBB",
            waypoints = {
                { name = "MD", transition = "MD1", type = "UR", altitude_min = 7000 },
                { name = "MD", transition = "MD1", type = "UR", altitude_min = 3900 },
                { name = "D294G", transition = "MD1", type = "UR", altitude_min = 3900 },
                { name = "FN114", transition = "MD1", type = "UR", altitude_min = 3700 },
                { name = "MD", transition = "MD2", type = "UR", altitude_min = 7000 },
                { name = "MD", transition = "MD2", type = "UR", altitude_min = 3700 },
                { name = "D294G", transition = "MD2", type = "UR", altitude_min = 3700 },
                { name = "FN114", transition = "MD2", type = "UR", altitude_min = 3700 },
                { name = "FN114", transition = "", type = "UR", altitude_min = 3700 },
                { name = "MD", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3600 },
                { name = "MD", transition = "", type = "UR", altitude_min = 5400 },
            }
        },
        ["NDMC"] = {
            name = "NDMC",
            type = "A",
            runway = "NDMC",
            waypoints = {
                { name = "MD", transition = "MD1", type = "UR", altitude_min = 7000 },
                { name = "MD", transition = "MD1", type = "UR", altitude_min = 4200 },
                { name = "FF282", transition = "MD1", type = "UR", altitude_min = 3000 },
                { name = "MD", transition = "MD2", type = "UR", altitude_min = 7000 },
                { name = "MD", transition = "MD2", type = "UR", altitude_min = 4200 },
                { name = "FF282", transition = "MD2", type = "UR", altitude_min = 3000 },
                { name = "FF282", transition = "", type = "UR", altitude_min = 3000 },
                { name = "MD", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3600 },
                { name = "MD", transition = "", type = "UR", altitude_min = 5400 },
            }
        },
        ["Q11-Y"] = {
            name = "Q11-Y",
            type = "A",
            runway = "Q11-Y",
            waypoints = {
                { name = "MD", transition = "MD1", type = "UR", altitude_min = 7000 },
                { name = "MD", transition = "MD1", type = "UR", altitude_min = 3900 },
                { name = "D294G", transition = "MD1", type = "UR", altitude_min = 3900 },
                { name = "FF11", transition = "MD1", type = "UR", altitude_min = 3000 },
                { name = "MD", transition = "MD2", type = "UR", altitude_min = 7000 },
                { name = "MD", transition = "MD2", type = "UR", altitude_min = 3700 },
                { name = "D294G", transition = "MD2", type = "UR", altitude_min = 3700 },
                { name = "FF11", transition = "MD2", type = "UR", altitude_min = 3000 },
                { name = "FF11", transition = "", type = "UR", altitude_min = 3000 },
                { name = "MD", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "MD", transition = "", type = "UR", altitude_min = 5400 },
            }
        },
        ["Q11-Z"] = {
            name = "Q11-Z",
            type = "Q",
            runway = "Q11-Z",
            waypoints = {
                { name = "FF11", transition = "", type = "UR", altitude_min = 3000 },
                { name = "MD", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 3500 },
                { name = "MD", transition = "", type = "UR", altitude_min = 5300 },
            }
        },
        ["R11"] = {
            name = "R11",
            type = "A",
            runway = "R11",
            waypoints = {
                { name = "MM001", transition = "MM001", type = "UR", altitude_min = 6500 },
                { name = "MM004", transition = "MM001", type = "UR", altitude_min = 4000 },
                { name = "MM002", transition = "MM002", type = "UR", altitude_min = 5000 },
                { name = "MM004", transition = "MM002", type = "UR", altitude_min = 4000 },
                { name = "MM003", transition = "MM003", type = "UR", altitude_min = 5000 },
                { name = "MM004", transition = "MM003", type = "UR", altitude_min = 4000 },
                { name = "MM004", transition = "", type = "UR", altitude_min = 4000 },
                { name = "MM005", transition = "", type = "UR", altitude_min = 3000 },
                { name = "RW11", transition = "", type = "UR" },
                { name = "MM006", transition = "", type = "UR" },
                { name = "MM007", transition = "", type = "UR" },
                { name = "MM003", transition = "", type = "UR", altitude_min = 5000 },
            }
        },
        ["R29"] = {
            name = "R29",
            type = "A",
            runway = "R29",
            waypoints = {
                { name = "MM011", transition = "MM011", type = "UR", altitude_min = 4500 },
                { name = "MM010", transition = "MM011", type = "UR", altitude_min = 4000 },
                { name = "MM013", transition = "MM013", type = "UR", altitude_min = 6500 },
                { name = "MM010", transition = "MM013", type = "UR", altitude_min = 4000 },
                { name = "MM010", transition = "", type = "UR", altitude_min = 4000 },
                { name = "MM009", transition = "", type = "UR", altitude_min = 3000 },
                { name = "31THR", transition = "", type = "UR" },
                { name = "RW29", transition = "", type = "UR" },
                { name = "MM012", transition = "", type = "UR" },
                { name = "MM014", transition = "", type = "UR" },
                { name = "MM011", transition = "", type = "UR", altitude_min = 4500 },
            }
        },
        ["S11-Y"] = {
            name = "S11-Y",
            type = "S",
            runway = "S11-Y",
            waypoints = {
                { name = "FD11Y", transition = "", type = "UR", altitude_min = 5300 },
                { name = "MNW", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 4200 },
                { name = "MNW", transition = "", type = "UR", altitude_min = 5300 },
            }
        },
        ["S29-Y"] = {
            name = "S29-Y",
            type = "A",
            runway = "S29-Y",
            waypoints = {
                { name = "MNW", transition = "MNW1", type = "UR", altitude_min = 7000 },
                { name = "MNW", transition = "MNW1", type = "UR", altitude_min = 4700 },
                { name = "D114P", transition = "MNW1", type = "UR", altitude_min = 4700 },
                { name = "FD29Y", transition = "MNW1", type = "UR", altitude_min = 4700 },
                { name = "MNW", transition = "MNW2", type = "UR", altitude_min = 7000 },
                { name = "MNW", transition = "MNW2", type = "UR", altitude_min = 5200 },
                { name = "D114P", transition = "MNW2", type = "UR", altitude_min = 5200 },
                { name = "FD29Y", transition = "MNW2", type = "UR", altitude_min = 4700 },
                { name = "FD29Y", transition = "", type = "UR", altitude_min = 4700 },
                { name = "RW29", transition = "", type = "UR" },
                { name = "MNW", transition = "", type = "UR" },
                { name = "", transition = "", type = "", altitude_min = 4200 },
                { name = "MNW", transition = "", type = "UR", altitude_min = 6600 },
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
