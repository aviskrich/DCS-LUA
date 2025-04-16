local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIYY",
        Name = "OIYY Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["D331T"] = { lat = 18.779283333, lon = -78.117769444, type = "MKJS" },
        ["CF31"] = { lat = 54.158733333, lon = -130.329380556, type = "CYPR" },
        ["FS305"] = { lat = 31.818430556, lon = 54.401383333, type = "OIYY" },
        ["D289O"] = { lat = 50.451683333, lon = -105.905441667, type = "CYMJ" },
        ["MD31"] = { lat = 36.269655556, lon = 6.637469444, type = "DABC" },
        ["BOMIT"] = { lat = 32.215833333, lon = 54.737222222, type = "ENRT" },
        ["D209O"] = { lat = 57.749797222, lon = 55.709458333, type = "USPP" },
        ["D029G"] = { lat = 55.388333333, lon = 86.293333333, type = "UNEE" },
        ["D029O"] = { lat = 41.164016667, lon = -5.353427778, type = "LESA" },
        ["CD13"] = { lat = 4.983783333, lon = 31.456969444, type = "HJJJ" },
        ["D109O"] = { lat = 54.131808333, lon = 48.577102778, type = "UWLL" },
        ["D090O"] = { lat = 44.202222222, lon = 43.400277778, type = "URMM" },
        ["BONOL"] = { lat = 32.387222222, lon = 54.158055556, type = "ENRT" },
        ["TOVTA"] = { lat = 32.091111111, lon = 53.739166667, type = "ENRT" },
        ["D047O"] = { lat = 68.723830556, lon = 15.589705556, type = "ENSK" },
        ["FF306"] = { lat = 47.459444444, lon = 4.174166667, type = "ENRT" },
        ["BOMUN"] = { lat = 31.613333333, lon = 54.765277778, type = "ENRT" },
        ["CD31"] = { lat = 36.163333333, lon = 6.768419444, type = "DABC" },
        ["VEDOP"] = { lat = 31.537777778, lon = 54.690555556, type = "ENRT" },
        ["MD13"] = { lat = 10.460502778, lon = 14.252058333, type = "FKKL" },
        ["FS13"] = { lat = 33.577461111, lon = 6.694727778, type = "DAUO" },
        ["BONEG"] = { lat = 31.473888889, lon = 53.970833333, type = "ENRT" },
        ["GADPU"] = { lat = 31.4525, lon = 54.550555556, type = "ENRT" },
        ["FF31"] = { lat = 64.179413889, lon = -76.324816667, type = "CYTE" },
        ["FD13"] = { lat = -21.098266667, lon = 27.359930556, type = "FBPM" },
        ["D303T"] = { lat = 30.478527778, lon = 56.629972222, type = "OIKK" },
        ["FF132"] = { lat = 32.003894444, lon = 54.157958333, type = "OIYY" },
        ["D312O"] = { lat = 54.610058333, lon = -110.549011111, type = "CYOD" },
        ["D209J"] = { lat = 55.164747222, lon = -4.914519444, type = "EGPK" },
        ["D020O"] = { lat = 42.799427778, lon = 27.657983333, type = "LBBG" },
        ["D331G"] = { lat = 28.528861111, lon = -13.936636111, type = "GCFV" },
        ["D125O"] = { lat = 42.704011111, lon = 71.541002778, type = "UADD" },
        ["FD31"] = { lat = 36.186975, lon = 6.73935, type = "DABC" },
        ["D344O"] = { lat = 15.165802778, lon = -23.593130556, type = "GVNP" },
        ["D150O"] = { lat = 38.532338889, lon = 16.512636111, type = "LICA" },
    },

    -- Данные ВПП
    Runways = {
        ["RW13"] = {
            heading = 130,
            length = 500.0,
            width = 0,
            threshold = { lat = 31.91750277777778, lon = 54.26065833333333 },
            end = { lat = 31.864608199520067, lon = 54.33492381951035 }
        },
        ["RW31"] = {
            heading = 310,
            length = -500.0,
            width = 0,
            threshold = { lat = 31.89228888888889, lon = 54.29235277777778 },
            end = { lat = 31.839394310631175, lon = 54.36659792031896 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BOMI1A"] = {
            name = "BOMI1A",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 8000 },
                { name = "YZD", type = "D", altitude_min = 11500 },
                { name = "BOMIT", type = "E" },
            }
        },
        ["BOMI1B"] = {
            name = "BOMI1B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 8000 },
                { name = "YZD", type = "D", altitude_min = 11500 },
                { name = "BOMIT", type = "E" },
            }
        },
        ["BOMU2C"] = {
            name = "BOMU2C",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 6500 },
                { name = "YZD", type = "D", altitude_min = 9000 },
                { name = "BOMUN", type = "E" },
            }
        },
        ["BOMU2D"] = {
            name = "BOMU2D",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "BOMUN", type = "E", altitude_min = 16000 },
            }
        },
        ["BOMU3A"] = {
            name = "BOMU3A",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "", type = "" },
                { name = "BOMUN", type = "E" },
            }
        },
        ["BOMU3B"] = {
            name = "BOMU3B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "BOMUN", type = "E" },
            }
        },
        ["BONE3C"] = {
            name = "BONE3C",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 7500 },
                { name = "YZD", type = "D", altitude_min = 12000 },
                { name = "BONEG", type = "E" },
            }
        },
        ["BONE3D"] = {
            name = "BONE3D",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "", type = "", altitude_min = 7500 },
                { name = "YZD", type = "D", altitude_min = 12000 },
                { name = "BONEG", type = "E" },
            }
        },
        ["BONE5A"] = {
            name = "BONE5A",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 8000 },
                { name = "YZD", type = "D", altitude_min = 12000 },
                { name = "BONEG", type = "E" },
            }
        },
        ["BONE5B"] = {
            name = "BONE5B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 8000 },
                { name = "YZD", type = "D", altitude_min = 12000 },
                { name = "BONEG", type = "E" },
            }
        },
        ["BONO1C"] = {
            name = "BONO1C",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "", type = "" },
                { name = "BONOL", type = "E", altitude_min = 15000 },
            }
        },
        ["BONO1D"] = {
            name = "BONO1D",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "", type = "", altitude_min = 6500 },
                { name = "YZD", type = "D", altitude_min = 9000 },
                { name = "BONOL", type = "E" },
            }
        },
        ["BONO3A"] = {
            name = "BONO3A",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "", type = "" },
                { name = "BONOL", type = "E" },
            }
        },
        ["BONO3B"] = {
            name = "BONO3B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "", type = "" },
                { name = "BONOL", type = "E" },
            }
        },
        ["GADP1D"] = {
            name = "GADP1D",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 5500 },
                { name = "YZD", type = "D", altitude_min = 7000 },
                { name = "GADPU", type = "E", altitude_min = 15000 },
            }
        },
        ["GADP2B"] = {
            name = "GADP2B",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 6500 },
                { name = "YZD", type = "D", altitude_min = 9000 },
                { name = "GADPU", type = "E" },
            }
        },
        ["GADP2C"] = {
            name = "GADP2C",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 5500 },
                { name = "YZD", type = "D", altitude_min = 7000 },
                { name = "GADPU", type = "E", altitude_min = 15000 },
            }
        },
        ["TOVT1C"] = {
            name = "TOVT1C",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "", type = "" },
                { name = "TOVTA", type = "E", altitude_min = 16000 },
            }
        },
        ["TOVT1D"] = {
            name = "TOVT1D",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "", type = "", altitude_min = 6500 },
                { name = "YZD", type = "D", altitude_min = 9000 },
                { name = "TOVTA", type = "E" },
            }
        },
        ["TOVT2A"] = {
            name = "TOVT2A",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "", type = "" },
                { name = "TOVTA", type = "E" },
            }
        },
        ["TOVT2B"] = {
            name = "TOVT2B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 6500 },
                { name = "YZD", type = "D" },
                { name = "TOVTA", type = "E" },
            }
        },
        ["VEDO1C"] = {
            name = "VEDO1C",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "VEDOP", type = "E", altitude_min = 12000 },
            }
        },
        ["VEDO2A"] = {
            name = "VEDO2A",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 6500 },
                { name = "YZD", type = "D", altitude_min = 9000 },
                { name = "VEDOP", type = "E" },
            }
        },
        ["VEDO2B"] = {
            name = "VEDO2B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 4460 },
                { name = "VEDOP", type = "E", altitude_min = 12000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BOMI1N"] = {
            name = "BOMI1N",
            runway = "ALL",
            waypoints = {
                { name = "BOMIT", type = "OI" },
                { name = "D047O", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["BOMI1P"] = {
            name = "BOMI1P",
            runway = "ALL",
            waypoints = {
                { name = "BOMIT", type = "OI" },
                { name = "D047O", type = "OI" },
                { name = "D090O", type = "OI" },
                { name = "D125O", type = "OI" },
            }
        },
        ["BOMI1Q"] = {
            name = "BOMI1Q",
            runway = "ALL",
            waypoints = {
                { name = "BOMIT", type = "OI" },
                { name = "D047O", type = "OI" },
                { name = "D020O", type = "OI" },
                { name = "D312O", type = "OI" },
            }
        },
        ["BOMU1D"] = {
            name = "BOMU1D",
            runway = "ALL",
            waypoints = {
                { name = "BOMUN", type = "OI" },
                { name = "D303T", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["BOMU1N"] = {
            name = "BOMU1N",
            runway = "ALL",
            waypoints = {
                { name = "BOMUN", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["BOMU1P"] = {
            name = "BOMU1P",
            runway = "ALL",
            waypoints = {
                { name = "BOMUN", type = "OI" },
                { name = "D125O", type = "OI" },
            }
        },
        ["BOMU1Q"] = {
            name = "BOMU1Q",
            runway = "ALL",
            waypoints = {
                { name = "BOMUN", type = "OI" },
                { name = "YZD", type = "OI" },
                { name = "D312O", type = "OI" },
            }
        },
        ["BONE1D"] = {
            name = "BONE1D",
            runway = "ALL",
            waypoints = {
                { name = "BONEG", type = "OI" },
                { name = "D029O", type = "OI" },
                { name = "D029G", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["BONE1N"] = {
            name = "BONE1N",
            runway = "ALL",
            waypoints = {
                { name = "BONEG", type = "OI" },
                { name = "D209J", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["BONE1P"] = {
            name = "BONE1P",
            runway = "ALL",
            waypoints = {
                { name = "BONEG", type = "OI" },
                { name = "D209O", type = "OI" },
                { name = "D150O", type = "OI" },
                { name = "D125O", type = "OI" },
            }
        },
        ["BONE1Q"] = {
            name = "BONE1Q",
            runway = "ALL",
            waypoints = {
                { name = "BONEG", type = "OI" },
                { name = "D209J", type = "OI" },
                { name = "YZD", type = "OI" },
                { name = "D312O", type = "OI" },
            }
        },
        ["BONO1D"] = {
            name = "BONO1D",
            runway = "ALL",
            waypoints = {
                { name = "BONOL", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["BONO1N"] = {
            name = "BONO1N",
            runway = "ALL",
            waypoints = {
                { name = "BONOL", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["BONO1P"] = {
            name = "BONO1P",
            runway = "ALL",
            waypoints = {
                { name = "BONOL", type = "OI" },
                { name = "YZD", type = "OI" },
                { name = "D125O", type = "OI" },
            }
        },
        ["BONO1Q"] = {
            name = "BONO1Q",
            runway = "ALL",
            waypoints = {
                { name = "BONOL", type = "OI" },
                { name = "D344O", type = "OI" },
                { name = "D312O", type = "OI" },
            }
        },
        ["GADP1D"] = {
            name = "GADP1D",
            runway = "ALL",
            waypoints = {
                { name = "GADPU", type = "OI" },
                { name = "D331T", type = "OI" },
                { name = "D331G", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["GADP1N"] = {
            name = "GADP1N",
            runway = "ALL",
            waypoints = {
                { name = "GADPU", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["GADP1P"] = {
            name = "GADP1P",
            runway = "ALL",
            waypoints = {
                { name = "GADPU", type = "OI" },
                { name = "D150O", type = "OI" },
                { name = "D125O", type = "OI" },
            }
        },
        ["GADP1Q"] = {
            name = "GADP1Q",
            runway = "ALL",
            waypoints = {
                { name = "GADPU", type = "OI" },
                { name = "D150O", type = "OI" },
                { name = "YZD", type = "OI" },
                { name = "D312O", type = "OI" },
            }
        },
        ["TOVT1D"] = {
            name = "TOVT1D",
            runway = "ALL",
            waypoints = {
                { name = "TOVTA", type = "OI" },
                { name = "D109O", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["TOVT1N"] = {
            name = "TOVT1N",
            runway = "ALL",
            waypoints = {
                { name = "TOVTA", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["TOVT1P"] = {
            name = "TOVT1P",
            runway = "ALL",
            waypoints = {
                { name = "TOVTA", type = "OI" },
                { name = "YZD", type = "OI" },
                { name = "D125O", type = "OI" },
            }
        },
        ["TOVT1Q"] = {
            name = "TOVT1Q",
            runway = "ALL",
            waypoints = {
                { name = "TOVTA", type = "OI" },
                { name = "D289O", type = "OI" },
                { name = "D312O", type = "OI" },
            }
        },
        ["VEDO1D"] = {
            name = "VEDO1D",
            runway = "ALL",
            waypoints = {
                { name = "VEDOP", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["VEDO1N"] = {
            name = "VEDO1N",
            runway = "ALL",
            waypoints = {
                { name = "VEDOP", type = "OI" },
                { name = "YZD", type = "OI" },
            }
        },
        ["VEDO1P"] = {
            name = "VEDO1P",
            runway = "ALL",
            waypoints = {
                { name = "VEDOP", type = "OI" },
                { name = "D125O", type = "OI" },
            }
        },
        ["VEDO1Q"] = {
            name = "VEDO1Q",
            runway = "ALL",
            waypoints = {
                { name = "VEDOP", type = "OI" },
                { name = "YZD", type = "OI" },
                { name = "D312O", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D13-Y"] = {
            name = "D13-Y",
            type = "A",
            runway = "D13-Y",
            waypoints = {
                { name = "YZD", transition = "YZD1", type = "OI", altitude_min = 10000, speed = 185.0 },
                { name = "YZD", transition = "YZD1", type = "OI", altitude_min = 6200 },
                { name = "CD13", transition = "YZD1", type = "OI", altitude_min = 6200 },
                { name = "YZD", transition = "YZD2", type = "OI", altitude_min = 10000 },
                { name = "YZD", transition = "YZD2", type = "OI", altitude_min = 6200 },
                { name = "CD13", transition = "YZD2", type = "OI", altitude_min = 6200 },
                { name = "CD13", transition = "", type = "OI", altitude_min = 6200 },
                { name = "FD13", transition = "", type = "OI", altitude_min = 5100 },
                { name = "MD13", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 7300 },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 10000, speed = 185.0 },
            }
        },
        ["D13-Z"] = {
            name = "D13-Z",
            type = "A",
            runway = "D13-Z",
            waypoints = {
                { name = "D312O", transition = "D312O", type = "OI", altitude_min = 8000 },
                { name = "CD13", transition = "D312O", type = "OI", altitude_min = 6200 },
                { name = "CD13", transition = "", type = "OI", altitude_min = 6200 },
                { name = "FD13", transition = "", type = "OI", altitude_min = 5100 },
                { name = "MD13", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 5500 },
                { name = "YZD", transition = "", type = "OI" },
                { name = "D312O", transition = "", type = "OI" },
                { name = "D312O", transition = "", type = "OI", altitude_min = 8000, speed = 230.0 },
            }
        },
        ["D31-Y"] = {
            name = "D31-Y",
            type = "A",
            runway = "D31-Y",
            waypoints = {
                { name = "YZD", transition = "YZD1", type = "OI", altitude_min = 10000, speed = 210.0 },
                { name = "YZD", transition = "YZD1", type = "OI", altitude_min = 7100 },
                { name = "CD31", transition = "YZD1", type = "OI", altitude_min = 7100 },
                { name = "YZD", transition = "YZD2", type = "OI", altitude_min = 10000 },
                { name = "YZD", transition = "YZD2", type = "OI", altitude_min = 7100 },
                { name = "CD31", transition = "YZD2", type = "OI", altitude_min = 7100 },
                { name = "CD31", transition = "", type = "OI", altitude_min = 7100 },
                { name = "FD31", transition = "", type = "OI", altitude_min = 5500 },
                { name = "MD31", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 6000 },
                { name = "YZD", transition = "", type = "OI" },
                { name = "D125O", transition = "", type = "OI" },
                { name = "D125O", transition = "", type = "OI", altitude_max = 13000, speed = 230.0 },
            }
        },
        ["D31-Z"] = {
            name = "D31-Z",
            type = "A",
            runway = "D31-Z",
            waypoints = {
                { name = "D125O", transition = "D125O", type = "OI", altitude_min = 9500 },
                { name = "CD31", transition = "D125O", type = "OI", altitude_min = 7100 },
                { name = "CD31", transition = "", type = "OI", altitude_min = 7100 },
                { name = "FD31", transition = "", type = "OI", altitude_min = 5500 },
                { name = "MD31", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 6000 },
                { name = "YZD", transition = "", type = "OI" },
                { name = "D125O", transition = "", type = "OI" },
                { name = "D125O", transition = "", type = "OI", altitude_max = 13000, speed = 230.0 },
            }
        },
        ["I31"] = {
            name = "I31",
            type = "A",
            runway = "I31",
            waypoints = {
                { name = "D125O", transition = "D125O", type = "OI", altitude_min = 9500 },
                { name = "CF31", transition = "D125O", type = "OI", altitude_min = 7600 },
                { name = "CF31", transition = "", type = "OI" },
                { name = "FF31", transition = "", type = "OI" },
                { name = "RW31", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 6000 },
                { name = "YZD", transition = "", type = "OI" },
                { name = "D125O", transition = "", type = "OI" },
                { name = "D125O", transition = "", type = "OI", altitude_max = 12000, speed = 200.0 },
            }
        },
        ["NDBA"] = {
            name = "NDBA",
            type = "A",
            runway = "NDBA",
            waypoints = {
                { name = "YZD", transition = "YZD1", type = "OI", altitude_min = 8500, speed = 185.0 },
                { name = "YZD", transition = "YZD1", type = "OI" },
                { name = "FF306", transition = "YZD1", type = "OI" },
                { name = "YZD", transition = "YZD2", type = "OI", altitude_min = 8500 },
                { name = "YZD", transition = "YZD2", type = "OI" },
                { name = "FF306", transition = "YZD2", type = "OI" },
                { name = "FF306", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 6500 },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 8500 },
            }
        },
        ["S13-X"] = {
            name = "S13-X",
            type = "A",
            runway = "S13-X",
            waypoints = {
                { name = "YZD", transition = "YZD", type = "OI", altitude_min = 10000, speed = 185.0 },
                { name = "FS13", transition = "YZD", type = "OI" },
                { name = "FS13", transition = "YZD", type = "OI" },
                { name = "FS13", transition = "YZD", type = "OI" },
                { name = "FS13", transition = "", type = "OI" },
                { name = "RW13", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 7300 },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 10000, speed = 185.0 },
            }
        },
        ["VORA"] = {
            name = "VORA",
            type = "A",
            runway = "VORA",
            waypoints = {
                { name = "YZD", transition = "YZD", type = "OI", altitude_min = 10000 },
                { name = "FF132", transition = "YZD", type = "OI" },
                { name = "FF132", transition = "YZD", type = "OI" },
                { name = "FF132", transition = "YZD", type = "OI" },
                { name = "FF132", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 7300 },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 10000, speed = 185.0 },
            }
        },
        ["VORB"] = {
            name = "VORB",
            type = "A",
            runway = "VORB",
            waypoints = {
                { name = "YZD", transition = "YZD", type = "OI", altitude_min = 10000, speed = 185.0 },
                { name = "YZD", transition = "YZD", type = "OI" },
                { name = "FS305", transition = "YZD", type = "OI" },
                { name = "FS305", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 6500 },
                { name = "YZD", transition = "", type = "OI" },
                { name = "YZD", transition = "", type = "OI", altitude_min = 10000, speed = 230.0 },
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
