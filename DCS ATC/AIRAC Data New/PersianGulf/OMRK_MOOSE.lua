local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OMRK",
        Name = "OMRK Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["KANUD"] = { lat = 25.865305556, lon = 55.916, type = "OMRK" },
        ["RK461"] = { lat = 25.678138889, lon = 55.919361111, type = "OMRK" },
        ["PUVAL"] = { lat = 25.599444444, lon = 55.716111111, type = "ENRT" },
        ["RK333"] = { lat = 25.522694444, lon = 56.061555556, type = "OMRK" },
        ["RK671"] = { lat = 25.732166667, lon = 55.903083333, type = "OMRK" },
        ["GENUK"] = { lat = 25.467861111, lon = 55.747, type = "OMRK" },
        ["RW16"] = { lat = 22.160641667, lon = 113.587261111, type = "VMMC" },
        ["RK162"] = { lat = 25.670083333, lon = 55.921777778, type = "OMRK" },
        ["BOSEG"] = { lat = 25.410972222, lon = 55.999527778, type = "OMRK" },
        ["BOTUT"] = { lat = 25.776138889, lon = 55.794111111, type = "OMRK" },
        ["DARTO"] = { lat = 25.501277778, lon = 55.972472222, type = "OMRK" },
        ["RK462"] = { lat = 25.143333333, lon = 47.189722222, type = "OERK" },
        ["LAGLI"] = { lat = 25.390277778, lon = 56.240833333, type = "ENRT" },
        ["RK332"] = { lat = 25.641916667, lon = 56.025833333, type = "OMRK" },
        ["EGMAP"] = { lat = 25.798166667, lon = 55.883194444, type = "OMRK" },
        ["NADNI"] = { lat = 25.320888889, lon = 55.949694444, type = "ENRT" },
        ["ASNEK"] = { lat = 25.941861111, lon = 55.817972222, type = "ENRT" },
        ["EGPEP"] = { lat = 25.963, lon = 55.972916667, type = "ENRT" },
        ["EMOPI"] = { lat = 25.438888889, lon = 56.15, type = "ENRT" },
        ["NOMDI"] = { lat = 25.715916667, lon = 55.908, type = "OMRK" },
        ["16VOR"] = { lat = 45.004919444, lon = 39.133980556, type = "URKK" },
        ["DARIV"] = { lat = 25.820166667, lon = 55.972305556, type = "OMRK" },
        ["46VOR"] = { lat = 7.218711111, lon = -7.612022222, type = "DIMN" },
        ["ITIKO"] = { lat = 25.510388889, lon = 55.87425, type = "OMRK" },
        ["EGLOP"] = { lat = 25.389, lon = 55.910722222, type = "OMRK" },
        ["D300M"] = { lat = 0.583313889, lon = 9.211669444, type = "FOOL" },
        ["ALSIL"] = { lat = 25.486416667, lon = 55.777611111, type = "ENRT" },
        ["RK331"] = { lat = 25.548611111, lon = 55.958277778, type = "OMRK" },
        ["RK342"] = { lat = 25.564722222, lon = 55.953444444, type = "OMRK" },
        ["RW34"] = { lat = 46.210363889, lon = -97.639358333, type = "KGWR" },
        ["RK661"] = { lat = 24.762222222, lon = 45.894722222, type = "OERK" },
        ["GEVAM"] = { lat = 25.432888889, lon = 56.088388889, type = "OMRK" },
        ["D174K"] = { lat = 43.67765, lon = 4.424969444, type = "LFTW" },
        ["ASKUM"] = { lat = 25.599444444, lon = 55.847444444, type = "OMRK" },
    },

    -- Данные ВПП
    Runways = {
        ["RW16"] = {
            heading = 160,
            length = 240.0,
            width = 0,
            threshold = { lat = 25.62974722222222, lon = 55.93391111111111 },
            end = { lat = 25.592630406065098, lon = 55.9488948015835 }
        },
        ["RW34"] = {
            heading = 340,
            length = -240.0,
            width = 0,
            threshold = { lat = 25.596999999999998, lon = 55.943752777777775 },
            end = { lat = 25.559883183842874, lon = 55.95873236323007 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ASNE1E"] = {
            name = "ASNE1E",
            runway = "RW16",
            waypoints = {
                { name = "DARTO", type = "P", altitude_min = 1900, speed = 210.0 },
                { name = "RK332", type = "P" },
                { name = "DARIV", type = "P" },
                { name = "ASNEK", type = "E" },
            }
        },
        ["ASNE1N"] = {
            name = "ASNE1N",
            runway = "RW34",
            waypoints = {
                { name = "NOMDI", type = "P", altitude_min = 1700 },
                { name = "EGMAP", type = "P" },
                { name = "ASNEK", type = "E" },
            }
        },
        ["ASNE1W"] = {
            name = "ASNE1W",
            runway = "RW16",
            waypoints = {
                { name = "RK331", type = "P", altitude_min = 1000, speed = 210.0 },
                { name = "ASKUM", type = "P" },
                { name = "BOTUT", type = "P" },
                { name = "ASNEK", type = "E" },
            }
        },
        ["EMOP2E"] = {
            name = "EMOP2E",
            runway = "RW34",
            waypoints = {
                { name = "RK462", type = "P", altitude_min = 2500, speed = 210.0 },
                { name = "RK332", type = "P" },
                { name = "RK333", type = "P" },
                { name = "EMOPI", type = "E", altitude_min = 6000 },
            }
        },
        ["EMOP2S"] = {
            name = "EMOP2S",
            runway = "RW16",
            waypoints = {
                { name = "DARTO", type = "P", altitude_min = 1900, speed = 210.0 },
                { name = "EMOPI", type = "E", altitude_min = 6000 },
            }
        },
        ["EMOP2W"] = {
            name = "EMOP2W",
            runway = "RW34",
            waypoints = {
                { name = "RK461", type = "P", altitude_min = 900, speed = 210.0 },
                { name = "ASKUM", type = "P" },
                { name = "EMOPI", type = "E", altitude_min = 6000 },
            }
        },
        ["PUVA1N"] = {
            name = "PUVA1N",
            runway = "RW34",
            waypoints = {
                { name = "RK461", type = "P", altitude_min = 900, speed = 210.0 },
                { name = "PUVAL", type = "E", altitude_max = 4000 },
            }
        },
        ["PUVA1S"] = {
            name = "PUVA1S",
            runway = "RW16",
            waypoints = {
                { name = "RK331", type = "P", altitude_min = 1000, speed = 210.0 },
                { name = "PUVAL", type = "E", altitude_max = 4000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ALSI1N"] = {
            name = "ALSI1N",
            runway = "RW16",
            waypoints = {
                { name = "ALSIL", type = "OM", altitude_min = 5000 },
                { name = "ASKUM", type = "OM" },
                { name = "BOTUT", type = "OM", altitude_min = 3000, speed = 210.0 },
                { name = "EGMAP", type = "OM", altitude_min = 2000 },
            }
        },
        ["ALSI1S"] = {
            name = "ALSI1S",
            runway = "RW34",
            waypoints = {
                { name = "ALSIL", type = "OM", altitude_min = 5000 },
                { name = "EGLOP", type = "OM", altitude_min = 3000, speed = 210.0 },
                { name = "BOSEG", type = "OM", altitude_min = 2600 },
            }
        },
        ["EGPE1E"] = {
            name = "EGPE1E",
            runway = "RW34",
            waypoints = {
                { name = "EGPEP", type = "OM", altitude_max = 7000 },
                { name = "DARIV", type = "OM" },
                { name = "RK332", type = "OM" },
                { name = "RK333", type = "OM" },
                { name = "GEVAM", type = "OM", altitude_min = 3500, speed = 200.0 },
                { name = "BOSEG", type = "OM", altitude_min = 2600 },
            }
        },
        ["EGPE2N"] = {
            name = "EGPE2N",
            runway = "RW16",
            waypoints = {
                { name = "EGPEP", type = "OM", altitude_max = 7000 },
                { name = "EGMAP", type = "OM", altitude_min = 2000, speed = 210.0 },
            }
        },
        ["EGPE2W"] = {
            name = "EGPE2W",
            runway = "RW34",
            waypoints = {
                { name = "EGPEP", type = "OM", altitude_max = 7000 },
                { name = "ASKUM", type = "OM" },
                { name = "ITIKO", type = "OM" },
                { name = "EGLOP", type = "OM", altitude_min = 3000, speed = 210.0 },
                { name = "BOSEG", type = "OM", altitude_min = 2600 },
            }
        },
        ["LAGL1S"] = {
            name = "LAGL1S",
            runway = "RW34",
            waypoints = {
                { name = "LAGLI", type = "OM", altitude_min = 6000 },
                { name = "EMOPI", type = "OM", altitude_min = 3700 },
                { name = "GEVAM", type = "OM", altitude_min = 3500, speed = 200.0 },
                { name = "BOSEG", type = "OM", altitude_min = 2600 },
            }
        },
        ["LAGL2E"] = {
            name = "LAGL2E",
            runway = "RW16",
            waypoints = {
                { name = "LAGLI", type = "OM", altitude_min = 7000 },
                { name = "EMOPI", type = "OM", altitude_min = 3700 },
                { name = "RK333", type = "OM" },
                { name = "RK332", type = "OM" },
                { name = "DARIV", type = "OM", altitude_min = 3000, speed = 210.0 },
                { name = "EGMAP", type = "OM", altitude_min = 2000 },
            }
        },
        ["LAGL2W"] = {
            name = "LAGL2W",
            runway = "RW16",
            waypoints = {
                { name = "LAGLI", type = "OM", altitude_min = 7000 },
                { name = "EMOPI", type = "OM", altitude_min = 3700 },
                { name = "ASKUM", type = "OM" },
                { name = "BOTUT", type = "OM", altitude_min = 3000, speed = 210.0 },
                { name = "EGMAP", type = "OM", altitude_min = 2000 },
            }
        },
        ["NADN2E"] = {
            name = "NADN2E",
            runway = "RW16",
            waypoints = {
                { name = "NADNI", type = "OM" },
                { name = "BOSEG", type = "OM" },
                { name = "RK333", type = "OM" },
                { name = "RK332", type = "OM" },
                { name = "DARIV", type = "OM", altitude_min = 3000, speed = 210.0 },
                { name = "EGMAP", type = "OM", altitude_min = 2000 },
            }
        },
        ["NADN2S"] = {
            name = "NADN2S",
            runway = "RW34",
            waypoints = {
                { name = "NADNI", type = "OM", altitude_min = 4000, altitude_max = 6000, speed = 210.0 },
                { name = "BOSEG", type = "OM", altitude_min = 2600 },
            }
        },
        ["NADN2W"] = {
            name = "NADN2W",
            runway = "RW16",
            waypoints = {
                { name = "NADNI", type = "OM" },
                { name = "ITIKO", type = "OM" },
                { name = "ASKUM", type = "OM" },
                { name = "BOTUT", type = "OM", altitude_min = 3000, speed = 210.0 },
                { name = "EGMAP", type = "OM", altitude_min = 2000 },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D16-Y"] = {
            name = "D16-Y",
            type = "A",
            runway = "D16-Y",
            waypoints = {
                { name = "GENUK", transition = "GENUK", type = "OM" },
                { name = "D300M", transition = "GENUK", type = "OM", altitude_min = 2200 },
                { name = "EGMAP", transition = "GENUK", type = "OM", altitude_min = 2000 },
                { name = "KANUD", transition = "KANUD", type = "OM" },
                { name = "", transition = "KANUD", type = "" },
                { name = "EGMAP", transition = "KANUD", type = "OM", altitude_min = 2000 },
                { name = "RAV", transition = "RAV", type = "OM", altitude_min = 3000 },
                { name = "RAV", transition = "RAV", type = "OM" },
                { name = "EGMAP", transition = "RAV", type = "OM", altitude_min = 2000 },
                { name = "EGMAP", transition = "", type = "OM", altitude_min = 2000 },
                { name = "NOMDI", transition = "", type = "OM", altitude_min = 1800 },
                { name = "46VOR", transition = "", type = "OM", altitude_min = 750 },
                { name = "RW16", transition = "", type = "OM" },
                { name = "DARTO", transition = "", type = "OM" },
                { name = "RAV", transition = "", type = "OM" },
                { name = "RAV", transition = "", type = "OM", altitude_min = 3000 },
            }
        },
        ["D16-Z"] = {
            name = "D16-Z",
            type = "A",
            runway = "D16-Z",
            waypoints = {
                { name = "GENUK", transition = "GENUK", type = "OM" },
                { name = "D300M", transition = "GENUK", type = "OM", altitude_min = 2200 },
                { name = "EGMAP", transition = "GENUK", type = "OM", altitude_min = 2000 },
                { name = "KANUD", transition = "KANUD", type = "OM" },
                { name = "", transition = "KANUD", type = "" },
                { name = "EGMAP", transition = "KANUD", type = "OM", altitude_min = 2000 },
                { name = "RAV", transition = "RAV", type = "OM", altitude_min = 4000 },
                { name = "RAV", transition = "RAV", type = "OM", speed = 230.0 },
                { name = "EGMAP", transition = "RAV", type = "OM", altitude_min = 2000 },
                { name = "EGMAP", transition = "", type = "OM", altitude_min = 2000 },
                { name = "NOMDI", transition = "", type = "OM", altitude_min = 1800 },
                { name = "46VOR", transition = "", type = "OM", altitude_min = 750 },
                { name = "RW16", transition = "", type = "OM" },
                { name = "DARTO", transition = "", type = "OM" },
                { name = "RAV", transition = "", type = "OM", speed = 230.0 },
                { name = "RAV", transition = "", type = "OM", altitude_min = 4000, speed = 230.0 },
            }
        },
        ["D34-Y"] = {
            name = "D34-Y",
            type = "A",
            runway = "D34-Y",
            waypoints = {
                { name = "ALSIL", transition = "ALSIL", type = "OM" },
                { name = "BOSEG", transition = "ALSIL", type = "OM", altitude_min = 2500 },
                { name = "NADNI", transition = "NADNI", type = "OM" },
                { name = "BOSEG", transition = "NADNI", type = "OM", altitude_min = 2500 },
                { name = "RAV", transition = "RAV", type = "OM", altitude_min = 3000 },
                { name = "RAV", transition = "RAV", type = "OM", altitude_min = 2500 },
                { name = "BOSEG", transition = "RAV", type = "OM", altitude_min = 2500 },
                { name = "BOSEG", transition = "", type = "OM", altitude_min = 2500 },
                { name = "DARTO", transition = "", type = "OM", altitude_min = 2000 },
                { name = "16VOR", transition = "", type = "OM", altitude_min = 780 },
                { name = "RAV", transition = "", type = "OM" },
                { name = "EGMAP", transition = "", type = "OM" },
                { name = "EGMAP", transition = "", type = "OM" },
            }
        },
        ["D34-Z"] = {
            name = "D34-Z",
            type = "A",
            runway = "D34-Z",
            waypoints = {
                { name = "ALSIL", transition = "ALSIL", type = "OM" },
                { name = "BOSEG", transition = "ALSIL", type = "OM", altitude_min = 2500 },
                { name = "NADNI", transition = "NADNI", type = "OM" },
                { name = "BOSEG", transition = "NADNI", type = "OM", altitude_min = 2500 },
                { name = "RAV", transition = "RAV", type = "OM", altitude_min = 4000, speed = 230.0 },
                { name = "RAV", transition = "RAV", type = "OM", altitude_min = 2500 },
                { name = "BOSEG", transition = "RAV", type = "OM", altitude_min = 2500 },
                { name = "BOSEG", transition = "", type = "OM", altitude_min = 2500 },
                { name = "DARTO", transition = "", type = "OM", altitude_min = 2000 },
                { name = "16VOR", transition = "", type = "OM", altitude_min = 780 },
                { name = "RAV", transition = "", type = "OM" },
                { name = "EGMAP", transition = "", type = "OM" },
                { name = "EGMAP", transition = "", type = "OM", speed = 210.0 },
            }
        },
        ["I34-Y"] = {
            name = "I34-Y",
            type = "A",
            runway = "I34-Y",
            waypoints = {
                { name = "ALSIL", transition = "ALSIL", type = "OM" },
                { name = "D174K", transition = "ALSIL", type = "OM", altitude_min = 2500 },
                { name = "", transition = "ALSIL", type = "" },
                { name = "NADNI", transition = "NADNI", type = "OM" },
                { name = "BOSEG", transition = "NADNI", type = "OM", altitude_min = 2500 },
                { name = "RAV", transition = "RAV", type = "OM", altitude_min = 3000 },
                { name = "RAV", transition = "RAV", type = "OM", altitude_min = 2500 },
                { name = "BOSEG", transition = "RAV", type = "OM", altitude_min = 2500 },
                { name = "BOSEG", transition = "", type = "OM" },
                { name = "DARTO", transition = "", type = "OM" },
                { name = "RW34", transition = "", type = "OM" },
                { name = "EGMAP", transition = "", type = "OM" },
                { name = "EGMAP", transition = "", type = "OM" },
            }
        },
        ["I34-Z"] = {
            name = "I34-Z",
            type = "A",
            runway = "I34-Z",
            waypoints = {
                { name = "ALSIL", transition = "ALSIL", type = "OM" },
                { name = "D174K", transition = "ALSIL", type = "OM", altitude_min = 2500 },
                { name = "", transition = "ALSIL", type = "" },
                { name = "NADNI", transition = "NADNI", type = "OM" },
                { name = "BOSEG", transition = "NADNI", type = "OM", altitude_min = 2500 },
                { name = "RAV", transition = "RAV", type = "OM", altitude_min = 4000, speed = 230.0 },
                { name = "RAV", transition = "RAV", type = "OM", altitude_min = 2500 },
                { name = "BOSEG", transition = "RAV", type = "OM", altitude_min = 2500 },
                { name = "BOSEG", transition = "", type = "OM" },
                { name = "DARTO", transition = "", type = "OM" },
                { name = "RW34", transition = "", type = "OM" },
                { name = "EGMAP", transition = "", type = "OM" },
                { name = "EGMAP", transition = "", type = "OM", speed = 210.0 },
            }
        },
        ["R16"] = {
            name = "R16",
            type = "A",
            runway = "R16",
            waypoints = {
                { name = "BOTUT", transition = "BOTUT", type = "OM", altitude_min = 3000, speed = 210.0 },
                { name = "EGMAP", transition = "BOTUT", type = "OM", altitude_min = 2000 },
                { name = "DARIV", transition = "DARIV", type = "OM", altitude_min = 3000, speed = 210.0 },
                { name = "EGMAP", transition = "DARIV", type = "OM", altitude_min = 2000 },
                { name = "EGMAP", transition = "", type = "OM", altitude_min = 2000 },
                { name = "RK671", transition = "", type = "OM", speed = 210.0 },
                { name = "RK162", transition = "", type = "OM", altitude_min = 860 },
                { name = "RW16", transition = "", type = "OM" },
                { name = "RK661", transition = "", type = "OM" },
                { name = "ASKUM", transition = "", type = "OM" },
                { name = "ASKUM", transition = "", type = "OM", altitude_min = 3000, speed = 210.0 },
            }
        },
        ["R34"] = {
            name = "R34",
            type = "A",
            runway = "R34",
            waypoints = {
                { name = "EGLOP", transition = "EGLOP", type = "OM", altitude_min = 3000, speed = 210.0 },
                { name = "BOSEG", transition = "EGLOP", type = "OM", altitude_min = 2600, speed = 200.0 },
                { name = "GEVAM", transition = "GEVAM", type = "OM", altitude_min = 3500, speed = 200.0 },
                { name = "BOSEG", transition = "GEVAM", type = "OM", altitude_min = 2600, speed = 200.0 },
                { name = "BOSEG", transition = "", type = "OM", altitude_min = 2600, speed = 200.0 },
                { name = "RK661", transition = "", type = "OM" },
                { name = "RK342", transition = "", type = "OM", altitude_min = 740 },
                { name = "RW34", transition = "", type = "OM" },
                { name = "EGMAP", transition = "", type = "OM" },
                { name = "EGMAP", transition = "", type = "OM", speed = 210.0 },
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
