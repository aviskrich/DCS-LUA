local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OLBA",
        Name = "OLBA Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["FD17"] = { lat = 10.582136111, lon = 9.726055556, type = "DNBC" },
        ["CF03"] = { lat = 9.645591667, lon = 1.039133333, type = "DXNG" },
        ["ZALKA"] = { lat = 34.067861111, lon = 35.415361111, type = "OLBA" },
        ["D315T"] = { lat = 32.993755556, lon = 51.573169444, type = "OIFM" },
        ["BA412"] = { lat = 34.093333333, lon = 35.319722222, type = "OLBA" },
        ["DER34"] = { lat = 62.121833333, lon = 65.614833333, type = "USHN" },
        ["FD16"] = { lat = -12.691661111, lon = 45.218933333, type = "FMCZ" },
        ["MD17"] = { lat = 9.275527778, lon = 12.427291667, type = "DNYO" },
        ["MF03"] = { lat = 33.776497222, lon = 35.464088889, type = "OLBA" },
        ["MF16"] = { lat = 33.856916667, lon = 35.474205556, type = "OLBA" },
        ["FF03"] = { lat = 9.676416667, lon = 1.052327778, type = "DXNG" },
        ["FD03"] = { lat = 7.635186111, lon = -5.109291667, type = "DIBK" },
        ["BA402"] = { lat = 33.600972222, lon = 35.217083333, type = "OLBA" },
        ["CD03"] = { lat = 14.745194444, lon = -23.583638889, type = "GVNP" },
        ["BALMA"] = { lat = 34.482305556, lon = 35.050638889, type = "ENRT" },
        ["BA421"] = { lat = 33.8475, lon = 35.486111111, type = "OLBA" },
        ["BA415"] = { lat = 34.254972222, lon = 35.592388889, type = "OLBA" },
        ["BA420"] = { lat = 34.162, lon = 35.327111111, type = "OLBA" },
        ["BA417"] = { lat = 34.059916667, lon = 35.544111111, type = "OLBA" },
        ["BA404"] = { lat = 19.238861111, lon = 110.225777778, type = "ZJQH" },
        ["BYBLO"] = { lat = 34.140972222, lon = 35.467472222, type = "OLBA" },
        ["MN17"] = { lat = 66.429483333, lon = 112.008872222, type = "UERP" },
        ["CF17"] = { lat = 0.268472222, lon = 32.406388889, type = "HUEN" },
        ["BA416"] = { lat = 34.083916667, lon = 35.442444444, type = "OLBA" },
        ["MD03"] = { lat = 4.999219444, lon = 6.941038889, type = "DNPO" },
        ["FF16"] = { lat = 0.561125, lon = 9.362586111, type = "FOOL" },
        ["KUKLA"] = { lat = 34.243983333, lon = 34.746333333, type = "ENRT" },
        ["LATEB"] = { lat = 34.031666667, lon = 36.401, type = "ENRT" },
        ["BA401"] = { lat = 33.919638889, lon = 35.157138889, type = "OLBA" },
        ["BA414"] = { lat = 33.856916667, lon = 35.474169444, type = "OLBA" },
        ["FF17"] = { lat = 36.959647222, lon = 5.825116667, type = "DAAV" },
        ["LEBOR"] = { lat = 34.26565, lon = 36.58305, type = "ENRT" },
        ["BA403"] = { lat = 19.307861111, lon = 110.352472222, type = "ZJQH" },
        ["CEDAR"] = { lat = 52.518611111, lon = -1.82, type = "ENRT" },
        ["D329P"] = { lat = 40.270055556, lon = 113.287377778, type = "ZBDT" },
        ["D302P"] = { lat = 40.307713889, lon = 94.552158333, type = "ZLDH" },
        ["BA418"] = { lat = 33.92425, lon = 35.558083333, type = "OLBA" },
        ["BA413"] = { lat = 33.938244444, lon = 35.451447222, type = "OLBA" },
        ["BA419"] = { lat = 33.847388889, lon = 35.518972222, type = "OLBA" },
        ["D220N"] = { lat = 22.347083333, lon = 113.406697222, type = "VMMC" },
        ["MD16"] = { lat = -12.796083333, lon = 45.273116667, type = "FMCZ" },
        ["D268P"] = { lat = 36.804127778, lon = 26.759686111, type = "LGKO" },
        ["CD16"] = { lat = -12.646905556, lon = 45.195725, type = "FMCZ" },
        ["MA17"] = { lat = 74.727333333, lon = -94.974352778, type = "CYRB" },
        ["BA406"] = { lat = 19.251805556, lon = 110.189166667, type = "ZJQH" },
        ["DER35"] = { lat = 58.484377778, lon = 92.108880556, type = "UNII" },
        ["BA411"] = { lat = 34.167222222, lon = 35.386111111, type = "OLBA" },
        ["BA405"] = { lat = 33.77925, lon = 35.464494444, type = "OLBA" },
        ["D268T"] = { lat = 39.386111111, lon = 8.535794444, type = "LIED" },
        ["D218P"] = { lat = 53.535094444, lon = -2.381505556, type = "EGCC" },
        ["D250P"] = { lat = 33.737883333, lon = 35.177105556, type = "OLBA" },
        ["CF16"] = { lat = 62.269702778, lon = -163.281613889, type = "PASM" },
        ["ELIKA"] = { lat = 33.831944444, lon = 34.583333333, type = "ENRT" },
        ["RAMLA"] = { lat = 33.582225, lon = 35.314294444, type = "OLBA" },
        ["D302T"] = { lat = 34.001086111, lon = 35.159725, type = "OLBA" },
        ["D336P"] = { lat = 34.059805556, lon = 35.381547222, type = "OLBA" },
    },

    -- Данные ВПП
    Runways = {
        ["RW03"] = {
            heading = 30,
            length = 0,
            width = 0,
            threshold = { lat = 33.80231666666666, lon = 35.48405833333334 },
            end = { lat = 33.80231666666666, lon = 35.48405833333334 }
        },
        ["RW16"] = {
            heading = 160,
            length = 0,
            width = 0,
            threshold = { lat = 33.83847777777778, lon = 35.47933888888889 },
            end = { lat = 33.83847777777778, lon = 35.47933888888889 }
        },
        ["RW17"] = {
            heading = 170,
            length = 0,
            width = 0,
            threshold = { lat = 33.83836388888889, lon = 35.48697777777778 },
            end = { lat = 33.83836388888889, lon = 35.48697777777778 }
        },
        ["RW21"] = {
            heading = 210,
            length = 0,
            width = 0,
            threshold = { lat = 33.81936944444445, lon = 35.497255555555554 },
            end = { lat = 33.81936944444445, lon = 35.497255555555554 }
        },
        ["RW34"] = {
            heading = 340,
            length = 0,
            width = 0,
            threshold = { lat = 33.81053333333333, lon = 35.4871 },
            end = { lat = 33.81053333333333, lon = 35.4871 }
        },
        ["RW35"] = {
            heading = 350,
            length = 0,
            width = 0,
            threshold = { lat = 33.816652777777776, lon = 35.488375 },
            end = { lat = 33.816652777777776, lon = 35.488375 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BOD1"] = {
            name = "BOD1",
            runway = "RW17",
            waypoints = {
                { name = "", type = "", altitude_min = 490 },
                { name = "", type = "", altitude_min = 4000 },
                { name = "", type = "" },
                { name = "BOD", type = "D", altitude_min = 8000 },
                { name = "", type = "", altitude_min = 490 },
                { name = "", type = "", altitude_min = 4000 },
                { name = "", type = "" },
                { name = "BOD", type = "D", altitude_min = 8000 },
                { name = "BOD", type = "D", altitude_min = 8000 },
                { name = "", type = "" },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LATEB", type = "E", altitude_min = 29000 },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LEBOR", type = "E", altitude_min = 24000 },
            }
        },
        ["BOD2"] = {
            name = "BOD2",
            runway = "RW34",
            waypoints = {
                { name = "", type = "", altitude_min = 490 },
                { name = "", type = "" },
                { name = "BOD", type = "D", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "", type = "", altitude_min = 490 },
                { name = "BOD", type = "D" },
                { name = "BOD", type = "D", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LATEB", type = "E", altitude_min = 29000 },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LEBOR", type = "E", altitude_min = 24000 },
            }
        },
        ["KAD1E"] = {
            name = "KAD1E",
            runway = "RW03",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "KAD", type = "D" },
            }
        },
        ["KAD2D"] = {
            name = "KAD2D",
            runway = "RW17",
            waypoints = {
                { name = "", type = "", altitude_min = 400 },
                { name = "D220N", type = "P" },
                { name = "", type = "" },
                { name = "D268P", type = "P" },
                { name = "", type = "" },
                { name = "KAD", type = "D" },
                { name = "", type = "", altitude_min = 400 },
                { name = "D220N", type = "P", altitude_min = 5000 },
                { name = "", type = "" },
                { name = "D268P", type = "P" },
                { name = "", type = "" },
                { name = "KAD", type = "D" },
            }
        },
        ["KAD2F"] = {
            name = "KAD2F",
            runway = "RW34",
            waypoints = {
                { name = "DER34", type = "P" },
                { name = "", type = "" },
                { name = "KAD", type = "D" },
                { name = "DER35", type = "P" },
                { name = "", type = "" },
                { name = "KAD", type = "D" },
            }
        },
        ["LATE1D"] = {
            name = "LATE1D",
            runway = "RW17",
            waypoints = {
                { name = "", type = "", altitude_min = 400 },
                { name = "KAD", type = "D", altitude_min = 5000 },
                { name = "", type = "" },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LATEB", type = "E", altitude_min = 29000 },
                { name = "", type = "", altitude_min = 400 },
                { name = "KAD", type = "D", altitude_min = 5000 },
                { name = "", type = "" },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LATEB", type = "E", altitude_min = 29000 },
            }
        },
        ["LATE1E"] = {
            name = "LATE1E",
            runway = "RW03",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "KAD", type = "D", altitude_min = 8000 },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LATEB", type = "E", altitude_min = 29000 },
            }
        },
        ["LATE2F"] = {
            name = "LATE2F",
            runway = "RW34",
            waypoints = {
                { name = "DER34", type = "P" },
                { name = "", type = "" },
                { name = "KAD", type = "D", altitude_min = 8000 },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LATEB", type = "E", altitude_min = 29000 },
                { name = "DER35", type = "P" },
                { name = "", type = "" },
                { name = "KAD", type = "D", altitude_min = 8000 },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LATEB", type = "E", altitude_min = 29000 },
            }
        },
        ["LEBO1D"] = {
            name = "LEBO1D",
            runway = "RW17",
            waypoints = {
                { name = "", type = "", altitude_min = 400 },
                { name = "KAD", type = "D", altitude_min = 5000 },
                { name = "", type = "" },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LEBOR", type = "E", altitude_min = 24000 },
                { name = "", type = "", altitude_min = 400 },
                { name = "KAD", type = "D", altitude_min = 5000 },
                { name = "", type = "" },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LEBOR", type = "E", altitude_min = 24000 },
            }
        },
        ["LEBO1E"] = {
            name = "LEBO1E",
            runway = "RW03",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "" },
                { name = "KAD", type = "D", altitude_min = 8000 },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LEBOR", type = "E", altitude_min = 24000 },
            }
        },
        ["LEBO2F"] = {
            name = "LEBO2F",
            runway = "RW34",
            waypoints = {
                { name = "DER34", type = "P" },
                { name = "", type = "" },
                { name = "KAD", type = "D", altitude_min = 8000 },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LEBOR", type = "E", altitude_min = 24000 },
                { name = "DER35", type = "P" },
                { name = "", type = "" },
                { name = "KAD", type = "D", altitude_min = 8000 },
                { name = "CAK", type = "D", altitude_min = 13000 },
                { name = "LEBOR", type = "E", altitude_min = 24000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BALM1A"] = {
            name = "BALM1A",
            runway = "RW17",
            waypoints = {
                { name = "BALMA", type = "OL" },
                { name = "", type = "" },
                { name = "BYBLO", type = "OL" },
            }
        },
        ["BALM1N"] = {
            name = "BALM1N",
            runway = "RW03",
            waypoints = {
                { name = "BALMA", type = "OL" },
                { name = "D329P", type = "OL" },
                { name = "D218P", type = "OL" },
                { name = "RAMLA", type = "OL" },
            }
        },
        ["BALM1R"] = {
            name = "BALM1R",
            runway = "RW21",
            waypoints = {
                { name = "BALMA", type = "OL" },
                { name = "BA417", type = "OL", altitude_min = 4000 },
            }
        },
        ["BALM1X"] = {
            name = "BALM1X",
            runway = "RW16",
            waypoints = {
                { name = "BALMA", type = "OL" },
                { name = "BA411", type = "OL", altitude_min = 4000 },
                { name = "ZALKA", type = "OL", altitude_min = 4000 },
            }
        },
        ["BALM2A"] = {
            name = "BALM2A",
            runway = "RW17",
            waypoints = {
                { name = "BALMA", type = "OL" },
                { name = "BYBLO", type = "OL", altitude_min = 5000 },
            }
        },
        ["BALM2F"] = {
            name = "BALM2F",
            runway = "RW16",
            waypoints = {
                { name = "BALMA", type = "OL" },
                { name = "", type = "" },
                { name = "ZALKA", type = "OL" },
            }
        },
        ["BALM2N"] = {
            name = "BALM2N",
            runway = "RW03",
            waypoints = {
                { name = "BALMA", type = "OL" },
                { name = "BA402", type = "OL", altitude_min = 4000 },
                { name = "RAMLA", type = "OL", altitude_min = 4000 },
            }
        },
        ["BYBL1A"] = {
            name = "BYBL1A",
            runway = "RW17",
            waypoints = {
                { name = "LEBOR", type = "OL", altitude_min = 24000 },
                { name = "CEDAR", type = "OL", altitude_min = 13000 },
                { name = "CAK", type = "OL", altitude_min = 10000 },
                { name = "BYBLO", type = "OL", altitude_min = 5000 },
            }
        },
        ["CAK1N"] = {
            name = "CAK1N",
            runway = "RW03",
            waypoints = {
                { name = "LEBOR", type = "OL", altitude_min = 24000 },
                { name = "CEDAR", type = "OL", altitude_min = 13000 },
                { name = "CAK", type = "OL", altitude_min = 10000 },
                { name = "D329P", type = "OL" },
                { name = "D218P", type = "OL" },
                { name = "RAMLA", type = "OL", altitude_min = 5000 },
            }
        },
        ["CAK2F"] = {
            name = "CAK2F",
            runway = "RW16",
            waypoints = {
                { name = "LEBOR", type = "OL", altitude_min = 24000 },
                { name = "CEDAR", type = "OL", altitude_min = 13000 },
                { name = "CAK", type = "OL", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "ZALKA", type = "OL", altitude_min = 5000 },
            }
        },
        ["ELIK1A"] = {
            name = "ELIK1A",
            runway = "RW17",
            waypoints = {
                { name = "ELIKA", type = "LC" },
                { name = "D268T", type = "OL" },
                { name = "BYBLO", type = "OL" },
            }
        },
        ["ELIK1N"] = {
            name = "ELIK1N",
            runway = "RW03",
            waypoints = {
                { name = "ELIKA", type = "LC" },
                { name = "D268P", type = "OL" },
                { name = "D218P", type = "OL" },
                { name = "RAMLA", type = "OL" },
            }
        },
        ["ELIK1R"] = {
            name = "ELIK1R",
            runway = "RW21",
            waypoints = {
                { name = "ELIKA", type = "LC" },
                { name = "BA416", type = "OL", altitude_min = 4000 },
                { name = "BA417", type = "OL", altitude_min = 4000 },
            }
        },
        ["ELIK1X"] = {
            name = "ELIK1X",
            runway = "RW16",
            waypoints = {
                { name = "ELIKA", type = "LC" },
                { name = "BA412", type = "OL", altitude_min = 4000 },
                { name = "ZALKA", type = "OL", altitude_min = 4000 },
            }
        },
        ["ELIK2A"] = {
            name = "ELIK2A",
            runway = "RW17",
            waypoints = {
                { name = "ELIKA", type = "LC" },
                { name = "BA420", type = "OL", altitude_min = 5000 },
                { name = "BYBLO", type = "OL", altitude_min = 5000 },
            }
        },
        ["ELIK2F"] = {
            name = "ELIK2F",
            runway = "RW16",
            waypoints = {
                { name = "ELIKA", type = "LC" },
                { name = "D268P", type = "OL" },
                { name = "D336P", type = "OL" },
                { name = "ZALKA", type = "OL" },
            }
        },
        ["ELIK2N"] = {
            name = "ELIK2N",
            runway = "RW03",
            waypoints = {
                { name = "ELIKA", type = "LC" },
                { name = "BA402", type = "OL", altitude_min = 4000 },
                { name = "RAMLA", type = "OL", altitude_min = 4000 },
            }
        },
        ["KAD1A"] = {
            name = "KAD1A",
            runway = "RW17",
            waypoints = {
                { name = "KAD", type = "OL" },
                { name = "D315T", type = "OL" },
                { name = "BYBLO", type = "OL" },
            }
        },
        ["KAD1N"] = {
            name = "KAD1N",
            runway = "RW03",
            waypoints = {
                { name = "KAD", type = "OL" },
                { name = "D250P", type = "OL" },
                { name = "D218P", type = "OL" },
                { name = "RAMLA", type = "OL" },
            }
        },
        ["KAD2F"] = {
            name = "KAD2F",
            runway = "RW16",
            waypoints = {
                { name = "KAD", type = "OL" },
                { name = "D302P", type = "OL" },
                { name = "D336P", type = "OL" },
                { name = "ZALKA", type = "OL" },
            }
        },
        ["KUKL1A"] = {
            name = "KUKL1A",
            runway = "RW17",
            waypoints = {
                { name = "KUKLA", type = "OL" },
                { name = "D302T", type = "OL" },
                { name = "BYBLO", type = "OL" },
            }
        },
        ["KUKL1N"] = {
            name = "KUKL1N",
            runway = "RW03",
            waypoints = {
                { name = "KUKLA", type = "OL" },
                { name = "D302P", type = "OL" },
                { name = "D218P", type = "OL" },
                { name = "RAMLA", type = "OL" },
            }
        },
        ["KUKL1R"] = {
            name = "KUKL1R",
            runway = "RW21",
            waypoints = {
                { name = "KUKLA", type = "OL" },
                { name = "BA417", type = "OL", altitude_min = 4000 },
            }
        },
        ["KUKL1X"] = {
            name = "KUKL1X",
            runway = "RW16",
            waypoints = {
                { name = "KUKLA", type = "OL" },
                { name = "BA412", type = "OL", altitude_min = 4000 },
                { name = "ZALKA", type = "OL", altitude_min = 4000 },
            }
        },
        ["KUKL2A"] = {
            name = "KUKL2A",
            runway = "RW17",
            waypoints = {
                { name = "KUKLA", type = "OL" },
                { name = "BYBLO", type = "OL", altitude_min = 5000 },
            }
        },
        ["KUKL2F"] = {
            name = "KUKL2F",
            runway = "RW16",
            waypoints = {
                { name = "KUKLA", type = "OL" },
                { name = "D302P", type = "OL" },
                { name = "D336P", type = "OL" },
                { name = "ZALKA", type = "OL" },
            }
        },
        ["KUKL2N"] = {
            name = "KUKL2N",
            runway = "RW03",
            waypoints = {
                { name = "KUKLA", type = "OL" },
                { name = "BA402", type = "OL", altitude_min = 4000 },
                { name = "RAMLA", type = "OL", altitude_min = 4000 },
            }
        },
        ["LEBO1R"] = {
            name = "LEBO1R",
            runway = "RW21",
            waypoints = {
                { name = "LEBOR", type = "OL", altitude_min = 24000 },
                { name = "CEDAR", type = "OL", altitude_min = 13000 },
                { name = "CAK", type = "OL", altitude_min = 10000 },
                { name = "BA415", type = "OL", altitude_min = 4000 },
                { name = "BA417", type = "OL", altitude_min = 4000 },
            }
        },
        ["LEBO1X"] = {
            name = "LEBO1X",
            runway = "RW16",
            waypoints = {
                { name = "LEBOR", type = "OL", altitude_min = 24000 },
                { name = "CEDAR", type = "OL", altitude_min = 13000 },
                { name = "CAK", type = "OL", altitude_min = 10000 },
                { name = "BA411", type = "OL", altitude_min = 4000 },
                { name = "ZALKA", type = "OL", altitude_min = 4000 },
            }
        },
        ["LEBO2A"] = {
            name = "LEBO2A",
            runway = "RW17",
            waypoints = {
                { name = "LEBOR", type = "OL", altitude_min = 24000 },
                { name = "CEDAR", type = "OL", altitude_min = 13000 },
                { name = "CAK", type = "OL", altitude_min = 10000 },
                { name = "BYBLO", type = "OL", altitude_min = 5000 },
            }
        },
        ["LEBO2N"] = {
            name = "LEBO2N",
            runway = "RW03",
            waypoints = {
                { name = "LEBOR", type = "OL", altitude_min = 24000 },
                { name = "CEDAR", type = "OL", altitude_min = 13000 },
                { name = "CAK", type = "OL", altitude_min = 10000 },
                { name = "BA401", type = "OL", altitude_min = 4000 },
                { name = "BA402", type = "OL", altitude_min = 4000 },
                { name = "RAMLA", type = "OL", altitude_min = 4000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D03"] = {
            name = "D03",
            type = "A",
            runway = "D03",
            waypoints = {
                { name = "RAMLA", transition = "RAMLA", type = "OL", altitude_min = 3000 },
                { name = "CD03", transition = "RAMLA", type = "OL", altitude_min = 2000 },
                { name = "CD03", transition = "", type = "OL", altitude_min = 2000 },
                { name = "FD03", transition = "", type = "OL", altitude_min = 2000 },
                { name = "MD03", transition = "", type = "OL" },
                { name = "", transition = "", type = "" },
                { name = "KAD", transition = "", type = "OL", speed = 230.0 },
            }
        },
        ["D16"] = {
            name = "D16",
            type = "A",
            runway = "D16",
            waypoints = {
                { name = "ZALKA", transition = "ZALKA", type = "OL", altitude_min = 3000 },
                { name = "CD16", transition = "ZALKA", type = "OL", altitude_min = 2000 },
                { name = "CD16", transition = "", type = "OL", altitude_min = 2000 },
                { name = "FD16", transition = "", type = "OL", altitude_min = 2000 },
                { name = "MD16", transition = "", type = "OL" },
                { name = "", transition = "", type = "", altitude_min = 490 },
                { name = "", transition = "", type = "" },
                { name = "KAD", transition = "", type = "OL" },
            }
        },
        ["D17"] = {
            name = "D17",
            type = "A",
            runway = "D17",
            waypoints = {
                { name = "BYBLO", transition = "BYBLO", type = "OL", altitude_min = 5000 },
                { name = "FD17", transition = "BYBLO", type = "OL", altitude_min = 1400 },
                { name = "FD17", transition = "", type = "OL", altitude_min = 1400 },
                { name = "MD17", transition = "", type = "OL" },
                { name = "", transition = "", type = "", altitude_min = 490 },
                { name = "", transition = "", type = "" },
            }
        },
        ["L03"] = {
            name = "L03",
            type = "A",
            runway = "L03",
            waypoints = {
                { name = "RAMLA", transition = "RAMLA", type = "OL", altitude_min = 3000 },
                { name = "CF03", transition = "RAMLA", type = "OL", altitude_min = 2000 },
                { name = "CF03", transition = "", type = "OL", altitude_min = 2000 },
                { name = "FF03", transition = "", type = "OL", altitude_min = 2000 },
                { name = "MF03", transition = "", type = "OL" },
                { name = "", transition = "", type = "" },
                { name = "KAD", transition = "", type = "OL", speed = 230.0 },
            }
        },
        ["L16"] = {
            name = "L16",
            type = "A",
            runway = "L16",
            waypoints = {
                { name = "ZALKA", transition = "ZALKA", type = "OL", altitude_min = 3000 },
                { name = "CF16", transition = "ZALKA", type = "OL", altitude_min = 2000 },
                { name = "CF16", transition = "", type = "OL", altitude_min = 2000 },
                { name = "FF16", transition = "", type = "OL", altitude_min = 2000 },
                { name = "MF16", transition = "", type = "OL" },
                { name = "", transition = "", type = "", altitude_min = 490 },
                { name = "", transition = "", type = "" },
                { name = "KAD", transition = "", type = "OL" },
            }
        },
        ["L17"] = {
            name = "L17",
            type = "A",
            runway = "L17",
            waypoints = {
                { name = "BYBLO", transition = "BYBLO", type = "OL", altitude_min = 5000 },
                { name = "BYBLO", transition = "BYBLO", type = "OL", altitude_min = 1400 },
                { name = "CF17", transition = "BYBLO", type = "OL", altitude_min = 1400 },
                { name = "CF17", transition = "", type = "OL", altitude_min = 1400 },
                { name = "FF17", transition = "", type = "OL", altitude_min = 1400 },
                { name = "MA17", transition = "", type = "OL" },
                { name = "", transition = "", type = "", altitude_min = 490 },
                { name = "", transition = "", type = "" },
            }
        },
        ["N17"] = {
            name = "N17",
            type = "A",
            runway = "N17",
            waypoints = {
                { name = "BOD", transition = "BOD1", type = "OL", altitude_min = 3000 },
                { name = "BOD", transition = "BOD1", type = "OL", altitude_min = 1400, speed = 230.0 },
                { name = "BOD", transition = "BOD2", type = "OL", altitude_min = 3000 },
                { name = "BOD", transition = "BOD2", type = "OL", altitude_min = 1400, speed = 230.0 },
                { name = "BOD", transition = "", type = "OL", altitude_min = 1400 },
                { name = "MN17", transition = "", type = "OL" },
                { name = "", transition = "", type = "", altitude_min = 490 },
                { name = "", transition = "", type = "" },
            }
        },
        ["R03"] = {
            name = "R03",
            type = "A",
            runway = "R03",
            waypoints = {
                { name = "RAMLA", transition = "RAMLA", type = "OL", altitude_min = 3000 },
                { name = "BA403", transition = "RAMLA", type = "OL", altitude_min = 2000 },
                { name = "BA403", transition = "", type = "OL", altitude_min = 2000 },
                { name = "BA404", transition = "", type = "OL", altitude_min = 2000 },
                { name = "BA405", transition = "", type = "OL" },
                { name = "", transition = "", type = "", altitude_min = 635 },
                { name = "", transition = "", type = "" },
            }
        },
        ["R16"] = {
            name = "R16",
            type = "A",
            runway = "R16",
            waypoints = {
                { name = "ZALKA", transition = "ZALKA", type = "OL", altitude_min = 3000 },
                { name = "BA406", transition = "ZALKA", type = "OL", altitude_min = 2000 },
                { name = "BA406", transition = "", type = "OL", altitude_min = 2000 },
                { name = "BA413", transition = "", type = "OL", altitude_min = 2000 },
                { name = "BA414", transition = "", type = "OL" },
                { name = "", transition = "", type = "", altitude_min = 490 },
                { name = "", transition = "", type = "" },
            }
        },
        ["R17"] = {
            name = "R17",
            type = "A",
            runway = "R17",
            waypoints = {
                { name = "BYBLO", transition = "BYBLO", type = "OL", altitude_min = 4000 },
                { name = "BOD", transition = "BYBLO", type = "OL", altitude_min = 1400 },
                { name = "BOD", transition = "", type = "OL", altitude_min = 1400 },
                { name = "BA421", transition = "", type = "OL" },
                { name = "", transition = "", type = "", altitude_min = 490 },
                { name = "", transition = "", type = "" },
            }
        },
        ["R21"] = {
            name = "R21",
            type = "A",
            runway = "R21",
            waypoints = {
                { name = "BA417", transition = "BA417", type = "OL", altitude_min = 4000 },
                { name = "BA418", transition = "BA417", type = "OL", altitude_min = 2100 },
                { name = "BA418", transition = "", type = "OL", altitude_min = 2100 },
                { name = "BA419", transition = "", type = "OL" },
                { name = "", transition = "", type = "", altitude_min = 731 },
                { name = "", transition = "", type = "" },
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
