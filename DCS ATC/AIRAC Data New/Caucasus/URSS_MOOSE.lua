local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "URSS",
        Name = "URSS Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["ABDES"] = { lat = 43.633094444, lon = 39.49105, type = "ENRT" },
        ["SS303"] = { lat = 31.070277778, lon = 121.125833333, type = "ENRT" },
        ["SS309"] = { lat = 43.552083333, lon = 39.757138889, type = "URSS" },
        ["ML02"] = { lat = -11.555061111, lon = 43.268016667, type = "FMCH" },
        ["SS030"] = { lat = 43.204069444, lon = 39.901444444, type = "URSS" },
        ["SS301"] = { lat = 60.762555556, lon = 77.627888889, type = "UNSS" },
        ["SS023"] = { lat = 43.229333333, lon = 39.644111111, type = "URSS" },
        ["SS025"] = { lat = 43.420113889, lon = 39.933897222, type = "URSS" },
        ["SS307"] = { lat = 43.556444444, lon = 39.96425, type = "URSS" },
        ["OSKED"] = { lat = 43.723333333, lon = 39.533333333, type = "URSS" },
        ["RW02"] = { lat = 25.801388889, lon = 71.4775, type = "VIUT" },
        ["SS205"] = { lat = 60.57725, lon = 77.954361111, type = "UNSS" },
        ["D191O"] = { lat = 10.203855556, lon = 14.220627778, type = "FKKL" },
        ["PITOP"] = { lat = 43.038888889, lon = 39.773611111, type = "URSS" },
        ["LAMET"] = { lat = 43.349722222, lon = 39.088611111, type = "ENRT" },
        ["MA06"] = { lat = -1.333008333, lon = 36.90865, type = "HKJK" },
        ["SS322"] = { lat = 43.547194444, lon = 39.654194444, type = "URSS" },
        ["SS320"] = { lat = 31.95, lon = 120.85, type = "ENRT" },
        ["FD06"] = { lat = 29.169983333, lon = 0.163391667, type = "DAUT" },
        ["FF06"] = { lat = 11.093313889, lon = -4.419586111, type = "DFOO" },
        ["DIRUN"] = { lat = 43.086388889, lon = 38.171944444, type = "ENRT" },
        ["FF02"] = { lat = -0.8204, lon = 8.710697222, type = "FOOG" },
        ["SS317"] = { lat = 43.454055556, lon = 39.959416667, type = "URSS" },
        ["SS247"] = { lat = 43.231166667, lon = 39.613444444, type = "URSS" },
        ["SS318"] = { lat = 43.494333333, lon = 39.989722222, type = "URSS" },
        ["DER24"] = { lat = 55.279305556, lon = 124.767763889, type = "UHBW" },
        ["SS026"] = { lat = 43.354638889, lon = 39.205444444, type = "URSS" },
        ["SS020"] = { lat = 43.404777778, lon = 39.922388889, type = "URSS" },
        ["FN02"] = { lat = 6.627288889, lon = -1.605152778, type = "DGSI" },
        ["ADNET"] = { lat = 44.369166667, lon = 39.84, type = "ENRT" },
        ["CD02Y"] = { lat = 43.243575, lon = 39.795647222, type = "URSS" },
        ["GOKIN"] = { lat = 43.148055556, lon = 39.296388889, type = "URSS" },
        ["SS244"] = { lat = 43.527805556, lon = 39.784666667, type = "URSS" },
        ["D223P"] = { lat = 43.288202778, lon = 39.688016667, type = "URSS" },
        ["SS063"] = { lat = 43.309305556, lon = 39.54575, type = "URSS" },
        ["DER20"] = { lat = 64.719758333, lon = 177.732322222, type = "UHMA" },
        ["SS305"] = { lat = 31.279444444, lon = 121.114166667, type = "ENRT" },
        ["SS308"] = { lat = 43.577916667, lon = 39.844, type = "URSS" },
        ["SS066"] = { lat = 43.249527778, lon = 39.710833333, type = "URSS" },
        ["SS201"] = { lat = 60.629305556, lon = 77.709472222, type = "UNSS" },
        ["SS245"] = { lat = 43.538527778, lon = 39.962666667, type = "URSS" },
        ["SS319"] = { lat = 43.562527778, lon = 39.987833333, type = "URSS" },
        ["NIDEP"] = { lat = 43.387605556, lon = 39.625538889, type = "URSS" },
        ["SS242"] = { lat = 43.512361111, lon = 39.557138889, type = "URSS" },
        ["SS067"] = { lat = 43.26325, lon = 39.411944444, type = "URSS" },
        ["SS306"] = { lat = 43.493055556, lon = 39.992083333, type = "URSS" },
        ["MD06"] = { lat = 34.764416667, lon = -1.967380556, type = "GMFO" },
        ["SS062"] = { lat = 43.354994444, lon = 39.679886111, type = "URSS" },
        ["SS071"] = { lat = 43.394438889, lon = 39.794544444, type = "URSS" },
        ["D225P"] = { lat = 43.295286111, lon = 39.680211111, type = "URSS" },
        ["SS022"] = { lat = 43.270361111, lon = 39.82175, type = "URSS" },
        ["IRGID"] = { lat = 43.780555556, lon = 39.913611111, type = "ENRT" },
        ["MOBIT"] = { lat = 43.939722222, lon = 38.735, type = "ENRT" },
        ["SS315"] = { lat = 43.377916667, lon = 39.999444444, type = "URSS" },
        ["SS202"] = { lat = 31.45, lon = 120.790277778, type = "ENRT" },
        ["KOGUL"] = { lat = 43.6, lon = 39.174444444, type = "URSS" },
        ["AD"] = { lat = 58.115277778, lon = -3.085972222, type = "NDB", frequency = 3.23, elevation = 0.0, name = "BEATRICE", range = 50.0 },
        ["SS060"] = { lat = 43.429027778, lon = 39.895333333, type = "URSS" },
        ["ML06"] = { lat = 12.521480556, lon = -7.968619444, type = "GABS" },
        ["SS243"] = { lat = 43.503472222, lon = 39.429277778, type = "URSS" },
        ["CD06Y"] = { lat = 43.340544444, lon = 39.656861111, type = "URSS" },
        ["ABUNI"] = { lat = 43.968916667, lon = 39.649111111, type = "URSS" },
        ["MJ02"] = { lat = 43.392647222, lon = 39.913283333, type = "URSS" },
        ["FD02"] = { lat = 24.199136111, lon = 9.401991667, type = "DAAJ" },
        ["FN06"] = { lat = 16.761141667, lon = -25.145780556, type = "GVSV" },
        ["SS314"] = { lat = 43.342, lon = 39.875333333, type = "URSS" },
        ["CI06Y"] = { lat = 11.073019444, lon = -4.446552778, type = "DFOO" },
        ["BINOL"] = { lat = 43.688258333, lon = 40.108605556, type = "ENRT" },
        ["KARAT"] = { lat = -17.471944444, lon = 55.566388889, type = "ENRT" },
        ["RW06"] = { lat = 22.978633333, lon = -82.424944444, type = "MUHA" },
        ["BANUT"] = { lat = 42.99, lon = 39.983333333, type = "ENRT" },
        ["MD02"] = { lat = 24.243433333, lon = 9.427655556, type = "DAAJ" },
        ["SS068"] = { lat = 43.110666667, lon = 39.460888889, type = "URSS" },
        ["SS246"] = { lat = 43.388666667, lon = 39.802055556, type = "URSS" },
        ["SS028"] = { lat = 43.341916667, lon = 39.875266667, type = "URSS" },
        ["SS069"] = { lat = 43.275305556, lon = 39.880516667, type = "URSS" },
        ["SS024"] = { lat = 43.188722222, lon = 39.469638889, type = "URSS" },
        ["SS203"] = { lat = 60.519472222, lon = 77.563361111, type = "UNSS" },
        ["SS021"] = { lat = 43.341019444, lon = 39.874575, type = "URSS" },
        ["SS061"] = { lat = 43.393930556, lon = 39.792955556, type = "URSS" },
        ["SS065"] = { lat = 43.436388889, lon = 39.916833333, type = "URSS" },
        ["CI02Y"] = { lat = 20.816763889, lon = -17.061652778, type = "GQPP" },
        ["TABAN"] = { lat = 43.078333333, lon = 39.601666667, type = "ENRT" },
        ["ABRIG"] = { lat = 43.586111111, lon = 40.044444444, type = "URSS" },
        ["SS321"] = { lat = 43.560555556, lon = 39.7675, type = "URSS" },
        ["SS241"] = { lat = 43.376027778, lon = 39.457694444, type = "URSS" },
        ["SS310"] = { lat = 43.543777778, lon = 39.656638889, type = "URSS" },
        ["LA"] = { lat = 38.886222222, lon = -6.809916667, type = "DME", frequency = 110.5, elevation = 630.0, name = "TALAVERA", range = 25.0 },
    },

    -- Данные ВПП
    Runways = {
        ["RW02"] = {
            heading = 20,
            length = 0,
            width = 0,
            rw_threshold = { lat = 43.434324999999994, lon = 39.94457222222222 },
            rw_end = { lat = 43.434324999999994, lon = 39.94457222222222 }
        },
        ["RW06"] = {
            heading = 60,
            length = 0,
            width = 0,
            rw_threshold = { lat = 43.43946111111111, lon = 39.925774999999994 },
            rw_end = { lat = 43.43946111111111, lon = 39.925774999999994 }
        },
        ["RW20"] = {
            heading = 200,
            length = 0,
            width = 0,
            rw_threshold = { lat = 43.45406388888889, lon = 39.959408333333336 },
            rw_end = { lat = 43.45406388888889, lon = 39.959408333333336 }
        },
        ["RW24"] = {
            heading = 240,
            length = 0,
            width = 0,
            rw_threshold = { lat = 43.45053333333334, lon = 39.95814722222222 },
            rw_end = { lat = 43.45053333333334, lon = 39.95814722222222 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ADNE1C"] = {
            name = "ADNE1C",
            runway = "RW20",
            waypoints = {
                { name = "DER20", type = "P" },
                { name = "", type = "", altitude_min = 750 },
                { name = "SS201", type = "P", altitude_min = 2000 },
                { name = "SS202", type = "P", altitude_min = 3600, altitude_max = 8000 },
                { name = "NIDEP", type = "P", altitude_min = 6000 },
                { name = "ABDES", type = "E", altitude_min = 11000 },
                { name = "ABUNI", type = "P", altitude_min = 14000 },
                { name = "ADNET", type = "E", altitude_min = 15000 },
            }
        },
        ["ADNE1D"] = {
            name = "ADNE1D",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 600 },
                { name = "NIDEP", type = "P", altitude_min = 2700 },
                { name = "ABDES", type = "E" },
                { name = "ABUNI", type = "P", altitude_min = 14000 },
                { name = "ADNET", type = "E", altitude_min = 15000 },
            }
        },
        ["ADNE1S"] = {
            name = "ADNE1S",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 700 },
                { name = "ABDES", type = "E" },
                { name = "ABUNI", type = "P", altitude_min = 14000 },
                { name = "ADNET", type = "E", altitude_min = 15000 },
            }
        },
        ["ADNE1T"] = {
            name = "ADNE1T",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 600 },
                { name = "NIDEP", type = "P", altitude_min = 2700 },
                { name = "SS241", type = "P", altitude_min = 4000, altitude_max = 8000 },
                { name = "SS243", type = "P" },
                { name = "ABUNI", type = "P", altitude_min = 14000 },
                { name = "ADNET", type = "E", altitude_min = 15000 },
            }
        },
        ["ADNE1X"] = {
            name = "ADNE1X",
            runway = "RW20",
            waypoints = {
                { name = "DER20", type = "P" },
                { name = "", type = "", altitude_min = 750 },
                { name = "ABDES", type = "E", altitude_min = 11000 },
                { name = "ABUNI", type = "P", altitude_min = 14000 },
                { name = "ADNET", type = "E", altitude_min = 15000 },
            }
        },
        ["BINO2C"] = {
            name = "BINO2C",
            runway = "RW20",
            waypoints = {
                { name = "DER20", type = "P" },
                { name = "", type = "", altitude_min = 750 },
                { name = "SS201", type = "P", altitude_min = 2000 },
                { name = "SS202", type = "P", altitude_min = 3600, altitude_max = 8000 },
                { name = "SS203", type = "P", altitude_min = 5000 },
                { name = "SS205", type = "P", altitude_min = 11000, altitude_max = 14000 },
                { name = "BINOL", type = "E", altitude_min = 15000, altitude_max = 17000 },
            }
        },
        ["BINO2D"] = {
            name = "BINO2D",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 600 },
                { name = "NIDEP", type = "P", altitude_min = 2700, altitude_max = 7000, speed = 235.0 },
                { name = "SS242", type = "P", altitude_min = 3600, altitude_max = 10000, speed = 235.0 },
                { name = "SS245", type = "P", altitude_min = 11000, altitude_max = 14000 },
                { name = "BINOL", type = "E", altitude_min = 15000, altitude_max = 17000 },
            }
        },
        ["BINO2T"] = {
            name = "BINO2T",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 600 },
                { name = "NIDEP", type = "P", altitude_min = 2700 },
                { name = "SS241", type = "P", altitude_min = 4000, altitude_max = 9000 },
                { name = "SS243", type = "P", altitude_max = 10000 },
                { name = "SS245", type = "P", altitude_min = 11000, altitude_max = 14000 },
                { name = "BINOL", type = "E", altitude_min = 15000, altitude_max = 17000 },
            }
        },
        ["IRGI1C"] = {
            name = "IRGI1C",
            runway = "RW20",
            waypoints = {
                { name = "DER20", type = "P" },
                { name = "", type = "", altitude_min = 750 },
                { name = "SS201", type = "P", altitude_min = 2000 },
                { name = "SS202", type = "P", altitude_min = 3600, altitude_max = 8000 },
                { name = "NIDEP", type = "P", altitude_min = 6000 },
                { name = "ABDES", type = "E", altitude_min = 11000 },
                { name = "IRGID", type = "E", altitude_min = 15000 },
            }
        },
        ["IRGI1D"] = {
            name = "IRGI1D",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 600 },
                { name = "NIDEP", type = "P", altitude_min = 2700 },
                { name = "ABDES", type = "E" },
                { name = "OSKED", type = "P", altitude_min = 10000 },
                { name = "IRGID", type = "E", altitude_min = 15000 },
            }
        },
        ["IRGI1S"] = {
            name = "IRGI1S",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 700 },
                { name = "ABDES", type = "E" },
                { name = "OSKED", type = "P", altitude_min = 10000 },
                { name = "IRGID", type = "E", altitude_min = 15000 },
            }
        },
        ["IRGI1T"] = {
            name = "IRGI1T",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 600 },
                { name = "NIDEP", type = "P", altitude_min = 2700 },
                { name = "SS241", type = "P", altitude_min = 4000, altitude_max = 8000 },
                { name = "SS243", type = "P" },
                { name = "OSKED", type = "P", altitude_min = 10000 },
                { name = "IRGID", type = "E", altitude_min = 15000 },
            }
        },
        ["IRGI1X"] = {
            name = "IRGI1X",
            runway = "RW20",
            waypoints = {
                { name = "DER20", type = "P" },
                { name = "", type = "", altitude_min = 750 },
                { name = "ABDES", type = "E", altitude_min = 11000, speed = 240.0 },
                { name = "IRGID", type = "E", altitude_min = 15000 },
            }
        },
        ["LA1C"] = {
            name = "LA1C",
            runway = "RW20",
            waypoints = {
                { name = "DER20", type = "P" },
                { name = "", type = "", altitude_min = 750 },
                { name = "SS201", type = "P", altitude_min = 2000 },
                { name = "SS202", type = "P", altitude_min = 3600, altitude_max = 8000 },
                { name = "NIDEP", type = "P", altitude_min = 6000 },
                { name = "LA", type = "D", altitude_min = 9000 },
            }
        },
        ["LA1D"] = {
            name = "LA1D",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 600 },
                { name = "NIDEP", type = "P", altitude_min = 2700 },
                { name = "LA", type = "D", altitude_min = 9000 },
            }
        },
        ["LA1S"] = {
            name = "LA1S",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 700 },
                { name = "ABDES", type = "E" },
                { name = "LA", type = "D", altitude_min = 9000 },
            }
        },
        ["LA1T"] = {
            name = "LA1T",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 600 },
                { name = "NIDEP", type = "P", altitude_min = 2700 },
                { name = "SS241", type = "P", altitude_min = 4000, altitude_max = 8000 },
                { name = "LA", type = "D", altitude_min = 9000 },
            }
        },
        ["LA1X"] = {
            name = "LA1X",
            runway = "RW20",
            waypoints = {
                { name = "DER20", type = "P" },
                { name = "", type = "", altitude_min = 750 },
                { name = "ABDES", type = "E", altitude_min = 6000 },
                { name = "LA", type = "D", altitude_min = 9000 },
            }
        },
        ["LAME1C"] = {
            name = "LAME1C",
            runway = "RW20",
            waypoints = {
                { name = "DER20", type = "P" },
                { name = "", type = "", altitude_min = 750 },
                { name = "SS201", type = "P", altitude_min = 2000 },
                { name = "SS202", type = "P", altitude_min = 3600, altitude_max = 8000 },
                { name = "NIDEP", type = "P", altitude_min = 6000 },
                { name = "LAMET", type = "E", altitude_min = 10000 },
            }
        },
        ["LAME1D"] = {
            name = "LAME1D",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 600 },
                { name = "NIDEP", type = "P", altitude_min = 2700 },
                { name = "LAMET", type = "E", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["LAME1X"] = {
            name = "LAME1X",
            runway = "RW20",
            waypoints = {
                { name = "DER20", type = "P" },
                { name = "", type = "", altitude_min = 750 },
                { name = "NIDEP", type = "P", altitude_min = 6000 },
                { name = "LAMET", type = "E", altitude_min = 10000 },
            }
        },
        ["LAME1Y"] = {
            name = "LAME1Y",
            runway = "RW20",
            waypoints = {
                { name = "DER20", type = "P" },
                { name = "", type = "", altitude_min = 750 },
                { name = "SS201", type = "P", altitude_min = 2000 },
                { name = "SS202", type = "P", altitude_min = 3600, altitude_max = 8000 },
                { name = "LAMET", type = "E", altitude_min = 10000 },
            }
        },
        ["TABA1C"] = {
            name = "TABA1C",
            runway = "RW20",
            waypoints = {
                { name = "DER20", type = "P" },
                { name = "", type = "", altitude_min = 750 },
                { name = "SS201", type = "P", altitude_min = 2000 },
                { name = "TABAN", type = "E", altitude_min = 6000 },
            }
        },
        ["TABA1D"] = {
            name = "TABA1D",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 600 },
                { name = "NIDEP", type = "P", altitude_min = 2700, altitude_max = 7000, speed = 235.0 },
                { name = "SS242", type = "P", altitude_min = 3600, altitude_max = 10000 },
                { name = "SS244", type = "P", altitude_max = 11000, speed = 280.0 },
                { name = "SS246", type = "P" },
                { name = "TABAN", type = "E", altitude_min = 8000 },
            }
        },
        ["TABA1S"] = {
            name = "TABA1S",
            runway = "RW24",
            waypoints = {
                { name = "DER24", type = "P" },
                { name = "", type = "", altitude_min = 600 },
                { name = "NIDEP", type = "P", altitude_min = 2700 },
                { name = "SS247", type = "P", altitude_min = 6000 },
                { name = "TABAN", type = "E", altitude_min = 8000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["AG1G"] = {
            name = "AG1G",
            runway = "ALL",
            waypoints = {
                { name = "AG", type = "UR", altitude_min = 9000, altitude_max = 20000 },
                { name = "KOGUL", type = "UR", altitude_min = 8000, altitude_max = 20000 },
                { name = "ADL", type = "UR" },
            }
        },
        ["AG1H"] = {
            name = "AG1H",
            runway = "RW02",
            waypoints = {
                { name = "AG", type = "UR", altitude_min = 9000, altitude_max = 20000 },
                { name = "KOGUL", type = "UR", altitude_min = 8000, altitude_max = 20000 },
                { name = "AD", type = "UR" },
            }
        },
        ["AG1J"] = {
            name = "AG1J",
            runway = "RW06",
            waypoints = {
                { name = "AG", type = "UR", altitude_min = 9000, altitude_max = 20000 },
                { name = "KOGUL", type = "UR", altitude_min = 8000, altitude_max = 20000 },
                { name = "AD", type = "UR" },
            }
        },
        ["AG1K"] = {
            name = "AG1K",
            runway = "RW02",
            waypoints = {
                { name = "AG", type = "UR", altitude_min = 9000, altitude_max = 20000 },
                { name = "KOGUL", type = "UR", altitude_min = 11000, altitude_max = 20000 },
            }
        },
        ["AG1L"] = {
            name = "AG1L",
            runway = "RW06",
            waypoints = {
                { name = "AG", type = "UR", altitude_min = 9000, altitude_max = 20000 },
                { name = "KOGUL", type = "UR", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["BANU1G"] = {
            name = "BANU1G",
            runway = "ALL",
            waypoints = {
                { name = "BANUT", type = "UR", altitude_min = 12000, altitude_max = 20000 },
                { name = "PITOP", type = "UR" },
                { name = "ADL", type = "UR" },
            }
        },
        ["BANU1H"] = {
            name = "BANU1H",
            runway = "RW02",
            waypoints = {
                { name = "BANUT", type = "UR", altitude_min = 12000, altitude_max = 20000 },
                { name = "PITOP", type = "UR", altitude_min = 6000, altitude_max = 20000 },
                { name = "AD", type = "UR" },
            }
        },
        ["BANU1J"] = {
            name = "BANU1J",
            runway = "RW06",
            waypoints = {
                { name = "BANUT", type = "UR", altitude_min = 12000, altitude_max = 20000 },
                { name = "PITOP", type = "UR", altitude_min = 6000, altitude_max = 20000 },
                { name = "AD", type = "UR" },
            }
        },
        ["BANU1K"] = {
            name = "BANU1K",
            runway = "RW02",
            waypoints = {
                { name = "BANUT", type = "UR", altitude_min = 12000, altitude_max = 20000 },
                { name = "PITOP", type = "UR", altitude_min = 6000, altitude_max = 8000 },
            }
        },
        ["BANU1L"] = {
            name = "BANU1L",
            runway = "RW06",
            waypoints = {
                { name = "BANUT", type = "UR", altitude_min = 12000, altitude_max = 20000 },
                { name = "PITOP", type = "UR", altitude_min = 10000, altitude_max = 17000 },
            }
        },
        ["BINO1G"] = {
            name = "BINO1G",
            runway = "ALL",
            waypoints = {
                { name = "BINOL", type = "UR", altitude_min = 18000, altitude_max = 20000 },
                { name = "ABRIG", type = "UR", altitude_min = 17000, altitude_max = 20000 },
                { name = "ADL", type = "UR" },
                { name = "PITOP", type = "UR" },
                { name = "ADL", type = "UR" },
            }
        },
        ["BINO1H"] = {
            name = "BINO1H",
            runway = "RW02",
            waypoints = {
                { name = "BINOL", type = "UR", altitude_min = 18000, altitude_max = 20000 },
                { name = "AD", type = "UR" },
            }
        },
        ["BINO1J"] = {
            name = "BINO1J",
            runway = "RW06",
            waypoints = {
                { name = "BINOL", type = "UR", altitude_min = 18000, altitude_max = 20000 },
                { name = "AD", type = "UR" },
            }
        },
        ["BINO1K"] = {
            name = "BINO1K",
            runway = "RW02",
            waypoints = {
                { name = "BINOL", type = "UR" },
                { name = "ABRIG", type = "UR", altitude_min = 18000, altitude_max = 20000 },
                { name = "ADL", type = "UR", altitude_min = 16000, altitude_max = 20000 },
                { name = "PITOP", type = "UR", altitude_min = 6000, altitude_max = 8000 },
            }
        },
        ["BINO1L"] = {
            name = "BINO1L",
            runway = "RW06",
            waypoints = {
                { name = "BINOL", type = "UR" },
                { name = "ABRIG", type = "UR", altitude_min = 18000, altitude_max = 20000 },
                { name = "ADL", type = "UR", altitude_min = 16000, altitude_max = 20000 },
                { name = "PITOP", type = "UR", altitude_min = 10000, altitude_max = 17000 },
            }
        },
        ["DIRU1G"] = {
            name = "DIRU1G",
            runway = "ALL",
            waypoints = {
                { name = "DIRUN", type = "UR" },
                { name = "GOKIN", type = "UR", altitude_min = 8000, altitude_max = 17000 },
                { name = "ADL", type = "UR" },
            }
        },
        ["DIRU1H"] = {
            name = "DIRU1H",
            runway = "RW02",
            waypoints = {
                { name = "DIRUN", type = "UR" },
                { name = "GOKIN", type = "UR", altitude_min = 8000, altitude_max = 17000 },
                { name = "AD", type = "UR" },
            }
        },
        ["DIRU1J"] = {
            name = "DIRU1J",
            runway = "RW06",
            waypoints = {
                { name = "DIRUN", type = "UR" },
                { name = "GOKIN", type = "UR", altitude_min = 8000, altitude_max = 17000 },
                { name = "AD", type = "UR" },
            }
        },
        ["DIRU1K"] = {
            name = "DIRU1K",
            runway = "RW02",
            waypoints = {
                { name = "DIRUN", type = "UR" },
                { name = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["DIRU1L"] = {
            name = "DIRU1L",
            runway = "RW06",
            waypoints = {
                { name = "DIRUN", type = "UR" },
                { name = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["KARA1G"] = {
            name = "KARA1G",
            runway = "ALL",
            waypoints = {
                { name = "KARAT", type = "UR", altitude_min = 8000, altitude_max = 20000 },
                { name = "GOKIN", type = "UR", altitude_min = 8000, altitude_max = 17000 },
                { name = "ADL", type = "UR" },
            }
        },
        ["KARA1H"] = {
            name = "KARA1H",
            runway = "RW02",
            waypoints = {
                { name = "KARAT", type = "UR", altitude_min = 8000, altitude_max = 20000 },
                { name = "GOKIN", type = "UR", altitude_min = 8000, altitude_max = 17000 },
                { name = "AD", type = "UR" },
            }
        },
        ["KARA1J"] = {
            name = "KARA1J",
            runway = "RW06",
            waypoints = {
                { name = "KARAT", type = "UR", altitude_min = 8000, altitude_max = 20000 },
                { name = "GOKIN", type = "UR", altitude_min = 8000, altitude_max = 17000 },
                { name = "AD", type = "UR" },
            }
        },
        ["KARA1K"] = {
            name = "KARA1K",
            runway = "RW02",
            waypoints = {
                { name = "KARAT", type = "UR", altitude_min = 6000, altitude_max = 20000 },
                { name = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["KARA1L"] = {
            name = "KARA1L",
            runway = "RW06",
            waypoints = {
                { name = "KARAT", type = "UR", altitude_min = 6000, altitude_max = 20000 },
                { name = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
            }
        },
        ["MOBI1G"] = {
            name = "MOBI1G",
            runway = "ALL",
            waypoints = {
                { name = "MOBIT", type = "UR", altitude_min = 7000, altitude_max = 20000 },
                { name = "KOGUL", type = "UR", altitude_min = 8000, altitude_max = 20000 },
                { name = "ADL", type = "UR" },
            }
        },
        ["MOBI1H"] = {
            name = "MOBI1H",
            runway = "RW02",
            waypoints = {
                { name = "MOBIT", type = "UR", altitude_min = 7000, altitude_max = 20000 },
                { name = "KOGUL", type = "UR", altitude_min = 8000, altitude_max = 20000 },
                { name = "AD", type = "UR" },
            }
        },
        ["MOBI1J"] = {
            name = "MOBI1J",
            runway = "RW06",
            waypoints = {
                { name = "MOBIT", type = "UR", altitude_min = 7000, altitude_max = 20000 },
                { name = "KOGUL", type = "UR", altitude_min = 8000, altitude_max = 20000 },
                { name = "AD", type = "UR" },
            }
        },
        ["MOBI1K"] = {
            name = "MOBI1K",
            runway = "RW02",
            waypoints = {
                { name = "MOBIT", type = "UR", altitude_min = 9000, altitude_max = 20000 },
                { name = "KOGUL", type = "UR", altitude_min = 11000, altitude_max = 20000 },
            }
        },
        ["MOBI1L"] = {
            name = "MOBI1L",
            runway = "RW06",
            waypoints = {
                { name = "MOBIT", type = "UR", altitude_min = 5000, altitude_max = 20000 },
                { name = "KOGUL", type = "UR", altitude_min = 6000, altitude_max = 10000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D02-Y"] = {
            name = "D02-Y",
            type = "A",
            runway = "D02-Y",
            waypoints = {
                { name = "ADL", transition = "ADL", type = "UR" },
                { name = "D191O", transition = "ADL", type = "UR", altitude_min = 3600, speed = 190.0 },
                { name = "CD02Y", transition = "ADL", type = "UR", altitude_min = 3600 },
                { name = "CD02Y", transition = "", type = "UR", altitude_min = 3600 },
                { name = "FD02", transition = "", type = "UR" },
                { name = "MD02", transition = "", type = "UR" },
                { name = "", transition = "", type = "", speed = 190.0 },
                { name = "ADL", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "PITOP", transition = "", type = "UR", altitude_min = 6000, altitude_max = 20000 },
            }
        },
        ["D06-Y"] = {
            name = "D06-Y",
            type = "A",
            runway = "D06-Y",
            waypoints = {
                { name = "ADL", transition = "ADL", type = "UR" },
                { name = "D223P", transition = "ADL", type = "UR", altitude_min = 3600, speed = 200.0 },
                { name = "CD06Y", transition = "ADL", type = "UR", altitude_min = 3600 },
                { name = "CD06Y", transition = "", type = "UR", altitude_min = 3600 },
                { name = "FD06", transition = "", type = "UR" },
                { name = "MD06", transition = "", type = "UR" },
                { name = "", transition = "", type = "", speed = 205.0 },
                { name = "PITOP", transition = "", type = "UR", altitude_min = 6000, altitude_max = 20000 },
            }
        },
        ["J02"] = {
            name = "J02",
            type = "A",
            runway = "J02",
            waypoints = {
                { name = "GOKIN", transition = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS024", transition = "GOKIN", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "GOKIN", type = "UR" },
                { name = "SS022", transition = "GOKIN", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU1", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS026", transition = "KOGU1", type = "UR", altitude_min = 11000 },
                { name = "GOKIN", transition = "KOGU1", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS024", transition = "KOGU1", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "KOGU1", type = "UR" },
                { name = "SS022", transition = "KOGU1", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU2", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS024", transition = "KOGU2", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "KOGU2", type = "UR" },
                { name = "SS022", transition = "KOGU2", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU3", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS023", transition = "KOGU3", type = "UR" },
                { name = "SS022", transition = "KOGU3", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITOP", type = "UR", altitude_min = 6000, altitude_max = 8000 },
                { name = "SS022", transition = "PITOP", type = "UR", altitude_min = 2000 },
                { name = "SS022", transition = "", type = "UR" },
                { name = "SS028", transition = "", type = "UR" },
                { name = "MJ02", transition = "", type = "UR" },
                { name = "SS030", transition = "", type = "UR", speed = 190.0 },
                { name = "PITOP", transition = "", type = "UR", altitude_min = 6000, altitude_max = 20000 },
            }
        },
        ["J06"] = {
            name = "J06",
            type = "A",
            runway = "J06",
            waypoints = {
                { name = "GOKIN", transition = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS067", transition = "GOKIN", type = "UR" },
                { name = "SS063", transition = "GOKIN", type = "UR" },
                { name = "SS062", transition = "GOKIN", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU1", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS067", transition = "KOGU1", type = "UR" },
                { name = "SS063", transition = "KOGU1", type = "UR" },
                { name = "SS062", transition = "KOGU1", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU2", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS063", transition = "KOGU2", type = "UR" },
                { name = "SS062", transition = "KOGU2", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU3", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS062", transition = "KOGU3", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO1", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "TABAN", transition = "PITO1", type = "UR", altitude_min = 10000 },
                { name = "SS068", transition = "PITO1", type = "UR", altitude_min = 9000 },
                { name = "SS067", transition = "PITO1", type = "UR" },
                { name = "SS063", transition = "PITO1", type = "UR" },
                { name = "SS062", transition = "PITO1", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO2", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "TABAN", transition = "PITO2", type = "UR", altitude_min = 10000 },
                { name = "SS063", transition = "PITO2", type = "UR" },
                { name = "SS062", transition = "PITO2", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO3", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "SS066", transition = "PITO3", type = "UR" },
                { name = "SS062", transition = "PITO3", type = "UR", altitude_min = 2000 },
                { name = "SS062", transition = "", type = "UR" },
                { name = "SS071", transition = "", type = "UR" },
                { name = "MA06", transition = "", type = "UR" },
                { name = "SS069", transition = "", type = "UR", speed = 190.0 },
                { name = "PITOP", transition = "", type = "UR", altitude_min = 10000, altitude_max = 17000 },
            }
        },
        ["L02-Y"] = {
            name = "L02-Y",
            type = "A",
            runway = "L02-Y",
            waypoints = {
                { name = "ADL", transition = "ADL", type = "UR" },
                { name = "D191O", transition = "ADL", type = "UR", altitude_min = 3600, speed = 190.0 },
                { name = "CI02Y", transition = "ADL", type = "UR", altitude_min = 3600 },
                { name = "CI02Y", transition = "", type = "UR", altitude_min = 3600 },
                { name = "FF02", transition = "", type = "UR" },
                { name = "ML02", transition = "", type = "UR" },
                { name = "", transition = "", type = "", speed = 190.0 },
                { name = "ADL", transition = "", type = "UR" },
                { name = "", transition = "", type = "" },
                { name = "PITOP", transition = "", type = "UR", altitude_min = 6000, altitude_max = 20000 },
            }
        },
        ["L02-Z"] = {
            name = "L02-Z",
            type = "A",
            runway = "L02-Z",
            waypoints = {
                { name = "GOKIN", transition = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS024", transition = "GOKIN", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "GOKIN", type = "UR" },
                { name = "SS022", transition = "GOKIN", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU1", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS026", transition = "KOGU1", type = "UR", altitude_min = 11000 },
                { name = "GOKIN", transition = "KOGU1", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS024", transition = "KOGU1", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "KOGU1", type = "UR" },
                { name = "SS022", transition = "KOGU1", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU2", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS024", transition = "KOGU2", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "KOGU2", type = "UR" },
                { name = "SS022", transition = "KOGU2", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU3", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS023", transition = "KOGU3", type = "UR" },
                { name = "SS022", transition = "KOGU3", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITOP", type = "UR", altitude_min = 6000, altitude_max = 8000 },
                { name = "SS022", transition = "PITOP", type = "UR", altitude_min = 2000 },
                { name = "SS022", transition = "", type = "UR", altitude_min = 2000 },
                { name = "FF02", transition = "", type = "UR" },
                { name = "ML02", transition = "", type = "UR" },
                { name = "SS030", transition = "", type = "UR", speed = 190.0 },
                { name = "PITOP", transition = "", type = "UR", altitude_min = 6000, altitude_max = 20000 },
            }
        },
        ["L06-Y"] = {
            name = "L06-Y",
            type = "A",
            runway = "L06-Y",
            waypoints = {
                { name = "ADL", transition = "ADL", type = "UR" },
                { name = "D225P", transition = "ADL", type = "UR", altitude_min = 3600, speed = 200.0 },
                { name = "CI06Y", transition = "ADL", type = "UR", altitude_min = 3600 },
                { name = "CI06Y", transition = "", type = "UR", altitude_min = 3600 },
                { name = "FF06", transition = "", type = "UR" },
                { name = "ML06", transition = "", type = "UR" },
                { name = "", transition = "", type = "", speed = 205.0 },
                { name = "PITOP", transition = "", type = "UR", altitude_min = 6000, altitude_max = 20000 },
            }
        },
        ["L06-Z"] = {
            name = "L06-Z",
            type = "A",
            runway = "L06-Z",
            waypoints = {
                { name = "GOKIN", transition = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS067", transition = "GOKIN", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "GOKIN", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "GOKIN", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU1", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS067", transition = "KOGU1", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "KOGU1", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "KOGU1", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU2", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS063", transition = "KOGU2", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "KOGU2", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU3", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS062", transition = "KOGU3", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO1", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "TABAN", transition = "PITO1", type = "UR", altitude_min = 10000 },
                { name = "SS068", transition = "PITO1", type = "UR", altitude_min = 9000 },
                { name = "SS067", transition = "PITO1", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "PITO1", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "PITO1", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO2", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "TABAN", transition = "PITO2", type = "UR", altitude_min = 10000 },
                { name = "SS063", transition = "PITO2", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "PITO2", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO3", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "SS066", transition = "PITO3", type = "UR" },
                { name = "SS062", transition = "PITO3", type = "UR", altitude_min = 2000 },
                { name = "SS062", transition = "", type = "UR", altitude_min = 2000 },
                { name = "FF06", transition = "", type = "UR" },
                { name = "ML06", transition = "", type = "UR" },
                { name = "SS069", transition = "", type = "UR", speed = 190.0 },
                { name = "PITOP", transition = "", type = "UR", altitude_min = 10000, altitude_max = 20000 },
            }
        },
        ["N02"] = {
            name = "N02",
            type = "A",
            runway = "N02",
            waypoints = {
                { name = "AD", transition = "AD1", type = "UR" },
                { name = "AD", transition = "AD1", type = "UR" },
                { name = "FN02", transition = "AD1", type = "UR", altitude_min = 2900 },
                { name = "AD", transition = "AD2", type = "UR" },
                { name = "AD", transition = "AD2", type = "UR" },
                { name = "FN02", transition = "AD2", type = "UR", altitude_min = 2900 },
                { name = "FN02", transition = "", type = "UR", altitude_min = 2900 },
                { name = "RW02", transition = "", type = "UR" },
                { name = "AD", transition = "", type = "UR", altitude_min = 490 },
                { name = "", transition = "", type = "", altitude_min = 3600, speed = 185.0 },
            }
        },
        ["N06-Y"] = {
            name = "N06-Y",
            type = "A",
            runway = "N06-Y",
            waypoints = {
                { name = "AD", transition = "AD1", type = "UR" },
                { name = "AD", transition = "AD1", type = "UR" },
                { name = "FN06", transition = "AD1", type = "UR", altitude_min = 3000 },
                { name = "AD", transition = "AD2", type = "UR" },
                { name = "AD", transition = "AD2", type = "UR" },
                { name = "FN06", transition = "AD2", type = "UR", altitude_min = 3000 },
                { name = "FN06", transition = "", type = "UR", altitude_min = 3000 },
                { name = "RW06", transition = "", type = "UR" },
                { name = "AD", transition = "", type = "UR", altitude_min = 490 },
                { name = "", transition = "", type = "", altitude_min = 3600, speed = 185.0 },
            }
        },
        ["R02-W"] = {
            name = "R02-W",
            type = "A",
            runway = "R02-W",
            waypoints = {
                { name = "GOKIN", transition = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS024", transition = "GOKIN", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "GOKIN", type = "UR" },
                { name = "SS022", transition = "GOKIN", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU1", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS026", transition = "KOGU1", type = "UR", altitude_min = 11000 },
                { name = "GOKIN", transition = "KOGU1", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS024", transition = "KOGU1", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "KOGU1", type = "UR" },
                { name = "SS022", transition = "KOGU1", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU2", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS024", transition = "KOGU2", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "KOGU2", type = "UR" },
                { name = "SS022", transition = "KOGU2", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU3", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS023", transition = "KOGU3", type = "UR" },
                { name = "SS022", transition = "KOGU3", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITOP", type = "UR", altitude_min = 6000, altitude_max = 8000 },
                { name = "SS022", transition = "PITOP", type = "UR", altitude_min = 2000 },
                { name = "SS022", transition = "", type = "UR", altitude_min = 2000 },
                { name = "SS314", transition = "", type = "UR" },
                { name = "RW02", transition = "", type = "UR" },
                { name = "SS317", transition = "", type = "UR" },
                { name = "SS318", transition = "", type = "UR" },
                { name = "SS319", transition = "", type = "UR" },
                { name = "SS320", transition = "", type = "UR", speed = 200.0 },
                { name = "SS321", transition = "", type = "UR" },
                { name = "SS322", transition = "", type = "UR" },
                { name = "KOGUL", transition = "", type = "UR" },
            }
        },
        ["R02-X"] = {
            name = "R02-X",
            type = "A",
            runway = "R02-X",
            waypoints = {
                { name = "GOKIN", transition = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS024", transition = "GOKIN", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "GOKIN", type = "UR" },
                { name = "SS022", transition = "GOKIN", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU1", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS026", transition = "KOGU1", type = "UR", altitude_min = 11000 },
                { name = "GOKIN", transition = "KOGU1", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS024", transition = "KOGU1", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "KOGU1", type = "UR" },
                { name = "SS022", transition = "KOGU1", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU2", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS024", transition = "KOGU2", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "KOGU2", type = "UR" },
                { name = "SS022", transition = "KOGU2", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU3", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS023", transition = "KOGU3", type = "UR" },
                { name = "SS022", transition = "KOGU3", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITOP", type = "UR", altitude_min = 6000, altitude_max = 8000 },
                { name = "SS022", transition = "PITOP", type = "UR", altitude_min = 2000 },
                { name = "SS022", transition = "", type = "UR", altitude_min = 2000 },
                { name = "SS314", transition = "", type = "UR" },
                { name = "SS020", transition = "", type = "UR" },
                { name = "SS315", transition = "", type = "UR" },
                { name = "SS030", transition = "", type = "UR" },
                { name = "PITOP", transition = "", type = "UR" },
            }
        },
        ["R02-Y"] = {
            name = "R02-Y",
            type = "A",
            runway = "R02-Y",
            waypoints = {
                { name = "GOKIN", transition = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS024", transition = "GOKIN", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "GOKIN", type = "UR" },
                { name = "SS022", transition = "GOKIN", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU1", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS026", transition = "KOGU1", type = "UR", altitude_min = 11000 },
                { name = "GOKIN", transition = "KOGU1", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS024", transition = "KOGU1", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "KOGU1", type = "UR" },
                { name = "SS022", transition = "KOGU1", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU2", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS024", transition = "KOGU2", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "KOGU2", type = "UR" },
                { name = "SS022", transition = "KOGU2", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU3", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS023", transition = "KOGU3", type = "UR" },
                { name = "SS022", transition = "KOGU3", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITOP", type = "UR", altitude_min = 6000, altitude_max = 8000 },
                { name = "SS022", transition = "PITOP", type = "UR", altitude_min = 2000 },
                { name = "SS022", transition = "", type = "UR", altitude_min = 2000 },
                { name = "SS021", transition = "", type = "UR" },
                { name = "SS025", transition = "", type = "UR" },
                { name = "SS030", transition = "", type = "UR", speed = 195.0 },
                { name = "PITOP", transition = "", type = "UR", altitude_min = 6000, altitude_max = 20000 },
            }
        },
        ["R02-Z"] = {
            name = "R02-Z",
            type = "A",
            runway = "R02-Z",
            waypoints = {
                { name = "GOKIN", transition = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS024", transition = "GOKIN", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "GOKIN", type = "UR" },
                { name = "SS022", transition = "GOKIN", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU1", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS026", transition = "KOGU1", type = "UR", altitude_min = 11000 },
                { name = "GOKIN", transition = "KOGU1", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS024", transition = "KOGU1", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "KOGU1", type = "UR" },
                { name = "SS022", transition = "KOGU1", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU2", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS024", transition = "KOGU2", type = "UR", altitude_max = 6000 },
                { name = "SS023", transition = "KOGU2", type = "UR" },
                { name = "SS022", transition = "KOGU2", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU3", type = "UR", altitude_min = 11000, altitude_max = 20000 },
                { name = "SS023", transition = "KOGU3", type = "UR" },
                { name = "SS022", transition = "KOGU3", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITOP", type = "UR", altitude_min = 6000, altitude_max = 8000 },
                { name = "SS022", transition = "PITOP", type = "UR", altitude_min = 2000 },
                { name = "SS022", transition = "", type = "UR", altitude_min = 2000 },
                { name = "SS021", transition = "", type = "UR" },
                { name = "SS020", transition = "", type = "UR" },
                { name = "SS030", transition = "", type = "UR", speed = 210.0 },
                { name = "PITOP", transition = "", type = "UR", altitude_min = 6000, altitude_max = 20000 },
            }
        },
        ["R06-W"] = {
            name = "R06-W",
            type = "A",
            runway = "R06-W",
            waypoints = {
                { name = "GOKIN", transition = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS067", transition = "GOKIN", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "GOKIN", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "GOKIN", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU1", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS067", transition = "KOGU1", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "KOGU1", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "KOGU1", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU2", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS063", transition = "KOGU2", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "KOGU2", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU3", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS062", transition = "KOGU3", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO1", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "TABAN", transition = "PITO1", type = "UR", altitude_min = 10000 },
                { name = "SS068", transition = "PITO1", type = "UR", altitude_min = 9000 },
                { name = "SS067", transition = "PITO1", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "PITO1", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "PITO1", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO2", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "TABAN", transition = "PITO2", type = "UR", altitude_min = 10000 },
                { name = "SS063", transition = "PITO2", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "PITO2", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO3", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "SS066", transition = "PITO3", type = "UR" },
                { name = "SS062", transition = "PITO3", type = "UR", altitude_min = 2000 },
                { name = "SS062", transition = "", type = "UR", altitude_min = 2000 },
                { name = "SS301", transition = "", type = "UR" },
                { name = "RW06", transition = "", type = "UR" },
                { name = "SS305", transition = "", type = "UR" },
                { name = "SS306", transition = "", type = "UR" },
                { name = "SS307", transition = "", type = "UR" },
                { name = "SS308", transition = "", type = "UR", speed = 190.0 },
                { name = "SS309", transition = "", type = "UR" },
                { name = "SS310", transition = "", type = "UR" },
                { name = "KOGUL", transition = "", type = "UR" },
            }
        },
        ["R06-X"] = {
            name = "R06-X",
            type = "A",
            runway = "R06-X",
            waypoints = {
                { name = "GOKIN", transition = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS067", transition = "GOKIN", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "GOKIN", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "GOKIN", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU1", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS067", transition = "KOGU1", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "KOGU1", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "KOGU1", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU2", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS063", transition = "KOGU2", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "KOGU2", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU3", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS062", transition = "KOGU3", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO1", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "TABAN", transition = "PITO1", type = "UR", altitude_min = 10000 },
                { name = "SS068", transition = "PITO1", type = "UR", altitude_min = 9000 },
                { name = "SS067", transition = "PITO1", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "PITO1", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "PITO1", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO2", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "TABAN", transition = "PITO2", type = "UR", altitude_min = 10000 },
                { name = "SS063", transition = "PITO2", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "PITO2", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO3", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "SS066", transition = "PITO3", type = "UR" },
                { name = "SS062", transition = "PITO3", type = "UR", altitude_min = 2000 },
                { name = "SS062", transition = "", type = "UR", altitude_min = 2000 },
                { name = "SS301", transition = "", type = "UR" },
                { name = "SS060", transition = "", type = "UR" },
                { name = "SS303", transition = "", type = "UR", speed = 200.0 },
                { name = "SS069", transition = "", type = "UR" },
                { name = "PITOP", transition = "", type = "UR" },
            }
        },
        ["R06-Y"] = {
            name = "R06-Y",
            type = "A",
            runway = "R06-Y",
            waypoints = {
                { name = "GOKIN", transition = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS067", transition = "GOKIN", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "GOKIN", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "GOKIN", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU1", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS067", transition = "KOGU1", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "KOGU1", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "KOGU1", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU2", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS063", transition = "KOGU2", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "KOGU2", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU3", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS062", transition = "KOGU3", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO1", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "TABAN", transition = "PITO1", type = "UR", altitude_min = 10000 },
                { name = "SS068", transition = "PITO1", type = "UR", altitude_min = 9000 },
                { name = "SS067", transition = "PITO1", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "PITO1", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "PITO1", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO2", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "TABAN", transition = "PITO2", type = "UR", altitude_min = 10000 },
                { name = "SS063", transition = "PITO2", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "PITO2", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO3", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "SS066", transition = "PITO3", type = "UR" },
                { name = "SS062", transition = "PITO3", type = "UR", altitude_min = 2000 },
                { name = "SS062", transition = "", type = "UR", altitude_min = 2000 },
                { name = "SS061", transition = "", type = "UR" },
                { name = "SS065", transition = "", type = "UR" },
                { name = "SS069", transition = "", type = "UR", speed = 215.0 },
                { name = "PITOP", transition = "", type = "UR", altitude_min = 10000, altitude_max = 20000 },
            }
        },
        ["R06-Z"] = {
            name = "R06-Z",
            type = "A",
            runway = "R06-Z",
            waypoints = {
                { name = "GOKIN", transition = "GOKIN", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS067", transition = "GOKIN", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "GOKIN", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "GOKIN", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU1", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS067", transition = "KOGU1", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "KOGU1", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "KOGU1", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU2", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS063", transition = "KOGU2", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "KOGU2", type = "UR", altitude_min = 2000 },
                { name = "KOGUL", transition = "KOGU3", type = "UR", altitude_min = 6000, altitude_max = 10000 },
                { name = "SS062", transition = "KOGU3", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO1", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "TABAN", transition = "PITO1", type = "UR", altitude_min = 10000 },
                { name = "SS068", transition = "PITO1", type = "UR", altitude_min = 9000 },
                { name = "SS067", transition = "PITO1", type = "UR", altitude_min = 4000 },
                { name = "SS063", transition = "PITO1", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "PITO1", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO2", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "TABAN", transition = "PITO2", type = "UR", altitude_min = 10000 },
                { name = "SS063", transition = "PITO2", type = "UR", altitude_min = 3000 },
                { name = "SS062", transition = "PITO2", type = "UR", altitude_min = 2000 },
                { name = "PITOP", transition = "PITO3", type = "UR", altitude_min = 10000, altitude_max = 17000 },
                { name = "SS066", transition = "PITO3", type = "UR" },
                { name = "SS062", transition = "PITO3", type = "UR", altitude_min = 2000 },
                { name = "SS062", transition = "", type = "UR", altitude_min = 2000 },
                { name = "SS061", transition = "", type = "UR" },
                { name = "SS060", transition = "", type = "UR" },
                { name = "SS069", transition = "", type = "UR", speed = 215.0 },
                { name = "PITOP", transition = "", type = "UR", altitude_min = 10000, altitude_max = 20000 },
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
