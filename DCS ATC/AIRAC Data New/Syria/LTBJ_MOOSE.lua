local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LTBJ",
        Name = "LTBJ Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["D328J"] = { lat = 43.723622222, lon = 3.862122222, type = "LFMT" },
        ["REDRA"] = { lat = 37.982222222, lon = 26.524444444, type = "ENRT" },
        ["C34R2"] = { lat = 38.116008333, lon = 27.210186111, type = "LTBJ" },
        ["MEN"] = { lat = 24.425722222, lon = 118.348833333, type = "VOR", frequency = 109.2, elevation = 30.0, name = "CHIN", range = 130.0 },
        ["FD16L"] = { lat = 27.29225, lon = 33.780666667, type = "HEGN" },
        ["VEXOL"] = { lat = 38.348888889, lon = 26.205, type = "ENRT" },
        ["MD16L"] = { lat = 27.208277778, lon = 33.792194444, type = "HEGN" },
        ["MQ34R"] = { lat = 38.245802778, lon = 27.170622222, type = "LTBJ" },
        ["D029H"] = { lat = 51.5615, lon = 4.454, type = "EHWO" },
        ["RIKSO"] = { lat = 38.833333333, lon = 26.433333333, type = "ENRT" },
        ["SISVO"] = { lat = 37.895444444, lon = 27.776416667, type = "ENRT" },
        ["OKESA"] = { lat = 37.629166667, lon = 27.386388889, type = "ENRT" },
        ["BAPSI"] = { lat = 38.002333333, lon = 27.904305556, type = "ENRT" },
        ["SITRU"] = { lat = 38.107222222, lon = 26.299444444, type = "ENRT" },
        ["MN34L"] = { lat = 38.269083333, lon = 27.161827778, type = "LTBJ" },
        ["EN"] = { lat = -20.281611111, lon = 57.371722222, type = "NDB", frequency = 2.58, elevation = 0.0, name = "FLIC", range = 75.0 },
        ["CN34R"] = { lat = 38.136547222, lon = 27.204366667, type = "LTBJ" },
        ["CN34L"] = { lat = 38.136813889, lon = 27.205711111, type = "LTBJ" },
        ["D340Q"] = { lat = 38.558633333, lon = 27.057863889, type = "LTBJ" },
        ["60VO2"] = { lat = 36.931338889, lon = 7.834094444, type = "DABB" },
        ["D056H"] = { lat = 50.854083333, lon = -1.663197222, type = "EGHH" },
        ["CI34R"] = { lat = 27.021741667, lon = 33.847144444, type = "HEGN" },
        ["MD34R"] = { lat = 27.160277778, lon = 33.803361111, type = "HEGN" },
        ["CQ34R"] = { lat = 38.099908333, lon = 27.215658333, type = "LTBJ" },
        ["D110O"] = { lat = 41.947313889, lon = 25.179944444, type = "LBPD" },
        ["D355E"] = { lat = 42.844172222, lon = 11.072533333, type = "LIRS" },
        ["FI16L"] = { lat = 39.232263889, lon = 117.306736111, type = "ZBTJ" },
        ["D164H"] = { lat = 20.068397222, lon = 110.441102778, type = "ZJHK" },
        ["BERGO"] = { lat = 38.998888889, lon = 27.132777778, type = "ENRT" },
        ["D321I"] = { lat = 38.416888889, lon = 27.047236111, type = "LTBJ" },
        ["D167K"] = { lat = 44.385222222, lon = 38.039588889, type = "URKG" },
        ["AYDIN"] = { lat = 38.071111111, lon = 27.149444444, type = "ENRT" },
        ["70VOR"] = { lat = -4.338572222, lon = 15.516494444, type = "FZAA" },
        ["MENGU"] = { lat = 38.323888889, lon = 26.699444444, type = "ENRT" },
        ["OM34R"] = { lat = 38.197611111, lon = 27.185611111, type = "LTBJ" },
        ["CI16L"] = { lat = 31.332197222, lon = 121.751119444, type = "ZSPD" },
        ["D121N"] = { lat = 38.184391667, lon = 27.253447222, type = "LTBJ" },
        ["60VOR"] = { lat = 36.694425, lon = 3.091211111, type = "DAAG" },
        ["D340F"] = { lat = 38.390961111, lon = 27.122197222, type = "LTBJ" },
        ["D168K"] = { lat = 31.193566667, lon = 121.912716667, type = "ZSPD" },
        ["MD34L"] = { lat = 53.135152778, lon = 158.477030556, type = "UHPP" },
        ["D289J"] = { lat = 51.714816667, lon = 5.456805556, type = "EHVK" },
        ["D271T"] = { lat = 53.9505, lon = 11.724833333, type = "ETNL" },
        ["D340H"] = { lat = 55.994702778, lon = -4.530808333, type = "EGPF" },
        ["VAKUM"] = { lat = 38.502222222, lon = 28.258055556, type = "ENRT" },
        ["KULAR"] = { lat = 38.582222222, lon = 28.632777778, type = "ENRT" },
        ["FS347"] = { lat = 38.179872222, lon = 27.183538889, type = "LTBJ" },
        ["FD34L"] = { lat = 27.0625, lon = 33.811472222, type = "HEGN" },
        ["D275J"] = { lat = 50.925933333, lon = -2.391608333, type = "EGHG" },
        ["FD34R"] = { lat = 27.054916667, lon = 33.845333333, type = "HEGN" },
        ["D340J"] = { lat = 49.144797222, lon = 6.637780556, type = "LFJL" },
    },

    -- Данные ВПП
    Runways = {
        ["RW16L"] = {
            heading = 160,
            length = 430.0,
            width = 0,
            threshold = { lat = 38.306599999999996, lon = 27.15268888888889 },
            end = { lat = 38.24009903771849, lon = 27.183534074897715 }
        },
        ["RW16R"] = {
            heading = 160,
            length = 430.0,
            width = 0,
            threshold = { lat = 38.306216666666664, lon = 27.150641666666665 },
            end = { lat = 38.239715704385155, lon = 27.18148668965919 }
        },
        ["RW34L"] = {
            heading = 340,
            length = 430.0,
            width = 0,
            threshold = { lat = 38.277816666666666, lon = 27.159188888888888 },
            end = { lat = 38.344317628948176, lon = 27.128355934649054 }
        },
        ["RW34R"] = {
            heading = 340,
            length = 430.0,
            width = 0,
            threshold = { lat = 38.2782, lon = 27.16123888888889 },
            end = { lat = 38.34470096228151, lon = 27.13040577186253 }
        },
    },

    -- Процедуры SID
    SID = {
        ["BAPS1E"] = {
            name = "BAPS1E",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000, speed = 185.0 },
                { name = "MEN", type = "D", altitude_min = 6500 },
                { name = "BAPSI", type = "E" },
            }
        },
        ["BAPS1F"] = {
            name = "BAPS1F",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000 },
                { name = "D340H", type = "P", altitude_min = 2800 },
                { name = "D029H", type = "P", altitude_min = 5000 },
                { name = "D110O", type = "P", altitude_min = 6500 },
                { name = "BAPSI", type = "E" },
            }
        },
        ["BAPS1G"] = {
            name = "BAPS1G",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000 },
                { name = "D340H", type = "P", altitude_min = 2800 },
                { name = "D340J", type = "P", altitude_min = 3200 },
                { name = "IMR", type = "D", altitude_min = 5500 },
                { name = "BAPSI", type = "E" },
            }
        },
        ["BAPS1K"] = {
            name = "BAPS1K",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "IMR", type = "D", altitude_min = 6000 },
                { name = "BAPSI", type = "E" },
            }
        },
        ["BAPS1S"] = {
            name = "BAPS1S",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "MEN", type = "D", altitude_min = 7700 },
                { name = "", type = "" },
                { name = "BAPSI", type = "E" },
            }
        },
        ["BERG1E"] = {
            name = "BERG1E",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000, speed = 185.0 },
                { name = "MEN", type = "D", altitude_min = 6500 },
                { name = "D355E", type = "P", altitude_min = 8000 },
                { name = "BERGO", type = "E" },
            }
        },
        ["BERG1G"] = {
            name = "BERG1G",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000 },
                { name = "D340F", type = "P", altitude_min = 2800 },
                { name = "D340J", type = "P", altitude_min = 3200 },
                { name = "D340J", type = "P", altitude_min = 4500 },
                { name = "D340Q", type = "P", altitude_min = 5000 },
                { name = "BERGO", type = "E" },
            }
        },
        ["BERG1S"] = {
            name = "BERG1S",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "MEN", type = "D", altitude_min = 7700 },
                { name = "BERGO", type = "E" },
            }
        },
        ["OKES1E"] = {
            name = "OKES1E",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000, speed = 185.0 },
                { name = "MEN", type = "D", altitude_min = 6500 },
                { name = "OKESA", type = "E", altitude_min = 8000 },
            }
        },
        ["OKES1G"] = {
            name = "OKES1G",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000 },
                { name = "D340F", type = "P", altitude_min = 2800 },
                { name = "D340J", type = "P", altitude_min = 3200 },
                { name = "IMR", type = "D", altitude_min = 5500 },
                { name = "OKESA", type = "E" },
            }
        },
        ["OKES1K"] = {
            name = "OKES1K",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "OKESA", type = "E", altitude_min = 8000 },
            }
        },
        ["OKES1S"] = {
            name = "OKES1S",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 6000 },
                { name = "", type = "" },
                { name = "OKESA", type = "E", altitude_min = 8000 },
            }
        },
        ["REDR1E"] = {
            name = "REDR1E",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000, speed = 185.0 },
                { name = "MEN", type = "D", altitude_min = 6500 },
                { name = "REDRA", type = "E" },
            }
        },
        ["REDR1G"] = {
            name = "REDR1G",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000 },
                { name = "D340F", type = "P", altitude_min = 2800 },
                { name = "D340J", type = "P", altitude_min = 3200 },
                { name = "IMR", type = "D", altitude_min = 5500 },
                { name = "REDRA", type = "E" },
            }
        },
        ["REDR1K"] = {
            name = "REDR1K",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "IMR", type = "D", altitude_min = 6000 },
                { name = "REDRA", type = "E" },
            }
        },
        ["REDR1S"] = {
            name = "REDR1S",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "MEN", type = "D", altitude_min = 7700 },
                { name = "REDRA", type = "E" },
            }
        },
        ["RIKS1E"] = {
            name = "RIKS1E",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000, speed = 185.0 },
                { name = "MEN", type = "D", altitude_min = 6500 },
                { name = "RIKSO", type = "E" },
            }
        },
        ["RIKS1G"] = {
            name = "RIKS1G",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000 },
                { name = "D340H", type = "P", altitude_min = 2800 },
                { name = "D340J", type = "P", altitude_min = 3200 },
                { name = "D289J", type = "P" },
                { name = "RIKSO", type = "E" },
            }
        },
        ["RIKS1K"] = {
            name = "RIKS1K",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "IMR", type = "D", altitude_min = 6000 },
                { name = "RIKSO", type = "E" },
            }
        },
        ["RIKS1S"] = {
            name = "RIKS1S",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "MEN", type = "D", altitude_min = 7700 },
                { name = "RIKSO", type = "E" },
            }
        },
        ["SISV1E"] = {
            name = "SISV1E",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000, speed = 185.0 },
                { name = "MEN", type = "D", altitude_min = 6500 },
                { name = "SISVO", type = "E" },
            }
        },
        ["SISV1F"] = {
            name = "SISV1F",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000 },
                { name = "D340H", type = "P", altitude_min = 2800 },
                { name = "D029H", type = "P", altitude_min = 5000 },
                { name = "D121N", type = "P", altitude_min = 6500 },
                { name = "SISVO", type = "E" },
            }
        },
        ["SISV1G"] = {
            name = "SISV1G",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000 },
                { name = "D340H", type = "P", altitude_min = 2800 },
                { name = "D340J", type = "P", altitude_min = 3200 },
                { name = "IMR", type = "D", altitude_min = 5500 },
                { name = "SISVO", type = "E" },
            }
        },
        ["SISV1K"] = {
            name = "SISV1K",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "IMR", type = "D", altitude_min = 6000 },
                { name = "SISVO", type = "E" },
            }
        },
        ["SISV1S"] = {
            name = "SISV1S",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "MEN", type = "D", altitude_min = 7700 },
                { name = "", type = "" },
                { name = "SISVO", type = "E" },
            }
        },
        ["SITR1E"] = {
            name = "SITR1E",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000, speed = 185.0 },
                { name = "MEN", type = "D", altitude_min = 6500 },
                { name = "SITRU", type = "E" },
            }
        },
        ["SITR1G"] = {
            name = "SITR1G",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000 },
                { name = "D340F", type = "P", altitude_min = 2800 },
                { name = "D340J", type = "P", altitude_min = 3200 },
                { name = "IMR", type = "D", altitude_min = 5500 },
                { name = "SITRU", type = "E" },
            }
        },
        ["SITR1K"] = {
            name = "SITR1K",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "IMR", type = "D", altitude_min = 6000 },
                { name = "SITRU", type = "E" },
            }
        },
        ["SITR1S"] = {
            name = "SITR1S",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "MEN", type = "D", altitude_min = 7700 },
                { name = "SITRU", type = "E" },
            }
        },
        ["VAKU1E"] = {
            name = "VAKU1E",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000, speed = 185.0 },
                { name = "MEN", type = "D", altitude_min = 6500 },
                { name = "VAKUM", type = "E" },
            }
        },
        ["VAKU1G"] = {
            name = "VAKU1G",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000 },
                { name = "D340H", type = "P", altitude_min = 2800 },
                { name = "D029H", type = "P", altitude_min = 5000 },
                { name = "D056H", type = "P", altitude_min = 6500 },
                { name = "VAKUM", type = "E" },
            }
        },
        ["VAKU1S"] = {
            name = "VAKU1S",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "MEN", type = "D", altitude_min = 7700 },
                { name = "VAKUM", type = "E" },
            }
        },
        ["VEXO1E"] = {
            name = "VEXO1E",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000, speed = 185.0 },
                { name = "MEN", type = "D", altitude_min = 6500 },
                { name = "D271T", type = "P", altitude_min = 12000 },
                { name = "VEXOL", type = "E" },
            }
        },
        ["VEXO1G"] = {
            name = "VEXO1G",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 810 },
                { name = "MEN", type = "D", altitude_min = 1000 },
                { name = "D340F", type = "P", altitude_min = 2000 },
                { name = "D340F", type = "P", altitude_min = 2800 },
                { name = "D340J", type = "P", altitude_min = 3200 },
                { name = "D275J", type = "P", altitude_min = 7000 },
                { name = "VEXOL", type = "E" },
            }
        },
        ["VEXO1K"] = {
            name = "VEXO1K",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "IMR", type = "D", altitude_min = 6000 },
                { name = "VEXOL", type = "E" },
            }
        },
        ["VEXO1S"] = {
            name = "VEXO1S",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "MEN", type = "D", altitude_min = 7700 },
                { name = "VEXOL", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BAPS1C"] = {
            name = "BAPS1C",
            runway = "ALL",
            waypoints = {
                { name = "BAPSI", type = "LT" },
                { name = "IMR", type = "LT" },
            }
        },
        ["BERG1C"] = {
            name = "BERG1C",
            runway = "ALL",
            waypoints = {
                { name = "BERGO", type = "LT" },
                { name = "IMR", type = "LT" },
            }
        },
        ["OKES1C"] = {
            name = "OKES1C",
            runway = "ALL",
            waypoints = {
                { name = "OKESA", type = "LT" },
                { name = "AYDIN", type = "LT" },
                { name = "IMR", type = "LT" },
            }
        },
        ["REDR1C"] = {
            name = "REDR1C",
            runway = "ALL",
            waypoints = {
                { name = "REDRA", type = "LT" },
                { name = "IMR", type = "LT" },
            }
        },
        ["RIKS1C"] = {
            name = "RIKS1C",
            runway = "ALL",
            waypoints = {
                { name = "RIKSO", type = "LT" },
                { name = "IMR", type = "LT" },
            }
        },
        ["SISV1C"] = {
            name = "SISV1C",
            runway = "ALL",
            waypoints = {
                { name = "SISVO", type = "LT" },
                { name = "IMR", type = "LT" },
            }
        },
        ["SITR1C"] = {
            name = "SITR1C",
            runway = "ALL",
            waypoints = {
                { name = "SITRU", type = "LT" },
                { name = "IMR", type = "LT" },
            }
        },
        ["VAKU1C"] = {
            name = "VAKU1C",
            runway = "ALL",
            waypoints = {
                { name = "KULAR", type = "LT" },
                { name = "VAKUM", type = "LT" },
                { name = "IMR", type = "LT" },
            }
        },
        ["VEXO1C"] = {
            name = "VEXO1C",
            runway = "ALL",
            waypoints = {
                { name = "VEXOL", type = "LG" },
                { name = "MENGU", type = "LT" },
                { name = "IMR", type = "LT" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["CVOR"] = {
            name = "CVOR",
            type = "A",
            runway = "CVOR",
            waypoints = {
                { name = "IMR", transition = "IMR", type = "LT" },
                { name = "MEN", transition = "IMR", type = "LT", altitude_min = 4500 },
                { name = "FS347", transition = "IMR", type = "LT", altitude_min = 3600 },
                { name = "FS347", transition = "IMR", type = "LT" },
                { name = "FS347", transition = "IMR", type = "LT", altitude_min = 3600 },
                { name = "MEN", transition = "MEN", type = "LT", altitude_min = 4500 },
                { name = "FS347", transition = "MEN", type = "LT", altitude_min = 3600 },
                { name = "FS347", transition = "MEN", type = "LT" },
                { name = "FS347", transition = "MEN", type = "LT", altitude_min = 3600 },
                { name = "FS347", transition = "", type = "LT", altitude_min = 3600 },
                { name = "MEN", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 2000 },
                { name = "MEN", transition = "", type = "LT", speed = 180.0 },
                { name = "MEN", transition = "", type = "LT", altitude_min = 4500 },
            }
        },
        ["D16L"] = {
            name = "D16L",
            type = "A",
            runway = "D16L",
            waypoints = {
                { name = "IMR", transition = "IMR", type = "LT" },
                { name = "MEN", transition = "IMR", type = "LT", altitude_min = 4500 },
                { name = "MEN", transition = "IMR", type = "LT", altitude_min = 4500 },
                { name = "MEN", transition = "IMR", type = "LT", altitude_min = 4300, speed = 185.0 },
                { name = "D321I", transition = "IMR", type = "LT", altitude_min = 3500 },
                { name = "FD16L", transition = "IMR", type = "LT", altitude_min = 3500 },
                { name = "MEN", transition = "MEN", type = "LT", altitude_min = 4500 },
                { name = "MEN", transition = "MEN", type = "LT", altitude_min = 4300, speed = 185.0 },
                { name = "D321I", transition = "MEN", type = "LT", altitude_min = 3500 },
                { name = "FD16L", transition = "MEN", type = "LT", altitude_min = 3500 },
                { name = "FD16L", transition = "", type = "LT", altitude_min = 3500 },
                { name = "70VOR", transition = "", type = "LT", altitude_min = 2720 },
                { name = "MD16L", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT", altitude_min = 2360, speed = 180.0 },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT", altitude_min = 4500 },
            }
        },
        ["D34L"] = {
            name = "D34L",
            type = "A",
            runway = "D34L",
            waypoints = {
                { name = "IMR", transition = "IMR", type = "LT" },
                { name = "MEN", transition = "IMR", type = "LT", altitude_min = 4500 },
                { name = "FD34L", transition = "IMR", type = "LT", altitude_min = 3600 },
                { name = "FD34L", transition = "IMR", type = "LT" },
                { name = "D168K", transition = "IMR", type = "LT", altitude_min = 3600 },
                { name = "FD34L", transition = "IMR", type = "LT", altitude_min = 3000 },
                { name = "MEN", transition = "MEN", type = "LT", altitude_min = 4500 },
                { name = "FD34L", transition = "MEN", type = "LT", altitude_min = 3600 },
                { name = "FD34L", transition = "MEN", type = "LT" },
                { name = "D168K", transition = "MEN", type = "LT", altitude_min = 3600 },
                { name = "FD34L", transition = "MEN", type = "LT", altitude_min = 3000 },
                { name = "FD34L", transition = "", type = "LT", altitude_min = 3000 },
                { name = "60VO2", transition = "", type = "LT", altitude_min = 1980 },
                { name = "MD34L", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT", altitude_min = 2000, speed = 180.0 },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT", altitude_min = 4500 },
            }
        },
        ["D34R"] = {
            name = "D34R",
            type = "A",
            runway = "D34R",
            waypoints = {
                { name = "IMR", transition = "IMR", type = "LT" },
                { name = "MEN", transition = "IMR", type = "LT", altitude_min = 4500 },
                { name = "FD34R", transition = "IMR", type = "LT", altitude_min = 3600 },
                { name = "FD34R", transition = "IMR", type = "LT" },
                { name = "D167K", transition = "IMR", type = "LT", altitude_min = 3600 },
                { name = "FD34R", transition = "IMR", type = "LT", altitude_min = 3000 },
                { name = "MEN", transition = "MEN", type = "LT", altitude_min = 4500 },
                { name = "FD34R", transition = "MEN", type = "LT", altitude_min = 3600 },
                { name = "FD34R", transition = "MEN", type = "LT" },
                { name = "D167K", transition = "MEN", type = "LT", altitude_min = 3600 },
                { name = "FD34R", transition = "MEN", type = "LT", altitude_min = 3000 },
                { name = "FD34R", transition = "", type = "LT", altitude_min = 3000 },
                { name = "60VOR", transition = "", type = "LT", altitude_min = 2080 },
                { name = "MD34R", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT", altitude_min = 2000, speed = 180.0 },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT", altitude_min = 4500 },
            }
        },
        ["I16L"] = {
            name = "I16L",
            type = "A",
            runway = "I16L",
            waypoints = {
                { name = "IMR", transition = "IMR", type = "LT" },
                { name = "MEN", transition = "IMR", type = "LT", altitude_min = 4500 },
                { name = "MEN", transition = "IMR", type = "LT", altitude_min = 4500 },
                { name = "MEN", transition = "IMR", type = "LT", altitude_min = 3450 },
                { name = "D328J", transition = "IMR", type = "LT", altitude_min = 3000 },
                { name = "CI16L", transition = "IMR", type = "LT", altitude_min = 3000, speed = 185.0 },
                { name = "MEN", transition = "MEN", type = "LT", altitude_min = 4500 },
                { name = "MEN", transition = "MEN", type = "LT", altitude_min = 3450 },
                { name = "D328J", transition = "MEN", type = "LT", altitude_min = 3000 },
                { name = "CI16L", transition = "MEN", type = "LT", altitude_min = 3000, speed = 185.0 },
                { name = "CI16L", transition = "", type = "LT" },
                { name = "FI16L", transition = "", type = "LT" },
                { name = "RW16L", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT", altitude_min = 4500 },
            }
        },
        ["I34RV"] = {
            name = "I34RV",
            type = "A",
            runway = "I34RV",
            waypoints = {
                { name = "ME", transition = "ME1", type = "LT", altitude_min = 4000 },
                { name = "ME", transition = "ME1", type = "LT", altitude_min = 3900 },
                { name = "ME", transition = "ME2", type = "LT", altitude_min = 4000 },
                { name = "ME", transition = "ME2", type = "LT", altitude_min = 3900 },
                { name = "CI34R", transition = "", type = "LT" },
                { name = "ME", transition = "", type = "LT" },
                { name = "RW34R", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 810 },
                { name = "MEN", transition = "", type = "LT", altitude_min = 3200 },
                { name = "MEN", transition = "", type = "LT", speed = 180.0 },
                { name = "ME", transition = "", type = "LT" },
                { name = "ME", transition = "", type = "LT" },
            }
        },
        ["I34RW"] = {
            name = "I34RW",
            type = "A",
            runway = "I34RW",
            waypoints = {
                { name = "IMR", transition = "IMR1", type = "LT" },
                { name = "ME", transition = "IMR1", type = "LT", altitude_min = 5000 },
                { name = "ME", transition = "IMR1", type = "LT", altitude_min = 3900 },
                { name = "IMR", transition = "IMR2", type = "LT" },
                { name = "ME", transition = "IMR2", type = "LT", altitude_min = 5000 },
                { name = "ME", transition = "IMR2", type = "LT", altitude_min = 3900 },
                { name = "ME", transition = "ME1", type = "LT", altitude_min = 4000 },
                { name = "ME", transition = "ME1", type = "LT", altitude_min = 3900 },
                { name = "ME", transition = "ME2", type = "LT", altitude_min = 4000 },
                { name = "ME", transition = "ME2", type = "LT", altitude_min = 3900 },
                { name = "CI34R", transition = "", type = "LT" },
                { name = "OM34R", transition = "", type = "LT" },
                { name = "RW34R", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 810 },
                { name = "MEN", transition = "", type = "LT", altitude_min = 2000, speed = 180.0 },
                { name = "MEN", transition = "", type = "LT" },
                { name = "ME", transition = "", type = "LT" },
                { name = "ME", transition = "", type = "LT", altitude_min = 4000 },
            }
        },
        ["I34RX"] = {
            name = "I34RX",
            type = "A",
            runway = "I34RX",
            waypoints = {
                { name = "IMR", transition = "IMR", type = "LT" },
                { name = "MEN", transition = "IMR", type = "LT", altitude_min = 4500 },
                { name = "D164H", transition = "IMR", type = "LT", altitude_min = 3600 },
                { name = "D164H", transition = "IMR", type = "LT", altitude_min = 3600 },
                { name = "C34R2", transition = "IMR", type = "LT", altitude_min = 3600 },
                { name = "MEN", transition = "MEN", type = "LT", altitude_min = 4500 },
                { name = "D164H", transition = "MEN", type = "LT", altitude_min = 3600 },
                { name = "D164H", transition = "MEN", type = "LT", altitude_min = 3600 },
                { name = "C34R2", transition = "MEN", type = "LT", altitude_min = 3600 },
                { name = "C34R2", transition = "", type = "LT" },
                { name = "OM34R", transition = "", type = "LT" },
                { name = "RW34R", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 810 },
                { name = "MEN", transition = "", type = "LT", altitude_min = 2000, speed = 180.0 },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT", altitude_min = 4500 },
            }
        },
        ["I34RY"] = {
            name = "I34RY",
            type = "A",
            runway = "I34RY",
            waypoints = {
                { name = "IMR", transition = "IMR", type = "LT" },
                { name = "MEN", transition = "IMR", type = "LT", altitude_min = 4500 },
                { name = "D164H", transition = "IMR", type = "LT", altitude_min = 3600 },
                { name = "D164H", transition = "IMR", type = "LT", altitude_min = 3600 },
                { name = "C34R2", transition = "IMR", type = "LT", altitude_min = 3600 },
                { name = "MEN", transition = "MEN", type = "LT", altitude_min = 4500 },
                { name = "D164H", transition = "MEN", type = "LT", altitude_min = 3600 },
                { name = "D164H", transition = "MEN", type = "LT", altitude_min = 3600 },
                { name = "C34R2", transition = "MEN", type = "LT", altitude_min = 3600 },
                { name = "C34R2", transition = "", type = "LT" },
                { name = "OM34R", transition = "", type = "LT" },
                { name = "RW34R", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT", altitude_min = 2000, speed = 180.0 },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT", altitude_min = 4500 },
            }
        },
        ["I34RZ"] = {
            name = "I34RZ",
            type = "A",
            runway = "I34RZ",
            waypoints = {
                { name = "IMR", transition = "IMR", type = "LT" },
                { name = "ME", transition = "IMR", type = "LT", altitude_min = 5000 },
                { name = "ME", transition = "IMR", type = "LT", altitude_min = 3900 },
                { name = "ME", transition = "ME", type = "LT", altitude_min = 4000 },
                { name = "ME", transition = "ME", type = "LT", altitude_min = 3900 },
                { name = "CI34R", transition = "", type = "LT" },
                { name = "OM34R", transition = "", type = "LT" },
                { name = "RW34R", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT" },
                { name = "MEN", transition = "", type = "LT", altitude_min = 2000, speed = 180.0 },
                { name = "MEN", transition = "", type = "LT" },
                { name = "ME", transition = "", type = "LT" },
                { name = "ME", transition = "", type = "LT", altitude_min = 4000 },
            }
        },
        ["N34L"] = {
            name = "N34L",
            type = "A",
            runway = "N34L",
            waypoints = {
                { name = "IMR", transition = "IMR", type = "LT" },
                { name = "ME", transition = "IMR", type = "LT", altitude_min = 5000 },
                { name = "ME", transition = "IMR", type = "LT", altitude_min = 3900 },
                { name = "ME", transition = "ME1", type = "LT", altitude_min = 4000 },
                { name = "ME", transition = "ME1", type = "LT", altitude_min = 3900 },
                { name = "ME", transition = "ME2", type = "LT", altitude_min = 4000 },
                { name = "ME", transition = "ME2", type = "LT", altitude_min = 3900 },
                { name = "CN34L", transition = "", type = "LT", altitude_min = 3900 },
                { name = "ME", transition = "", type = "LT", altitude_min = 2400 },
                { name = "MN34L", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 2200 },
                { name = "EN", transition = "", type = "LT", speed = 180.0 },
                { name = "ME", transition = "", type = "LT" },
                { name = "ME", transition = "", type = "LT", altitude_min = 4000 },
            }
        },
        ["N34R"] = {
            name = "N34R",
            type = "A",
            runway = "N34R",
            waypoints = {
                { name = "IMR", transition = "IMR", type = "LT" },
                { name = "ME", transition = "IMR", type = "LT", altitude_min = 5000 },
                { name = "ME", transition = "IMR", type = "LT", altitude_min = 3900 },
                { name = "ME", transition = "ME", type = "LT", altitude_min = 4000 },
                { name = "ME", transition = "ME", type = "LT", altitude_min = 3900 },
                { name = "CN34R", transition = "", type = "LT", altitude_min = 3900 },
                { name = "ME", transition = "", type = "LT", altitude_min = 2400 },
                { name = "EN", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 2200 },
                { name = "EN", transition = "", type = "LT", speed = 180.0 },
                { name = "ME", transition = "", type = "LT" },
                { name = "ME", transition = "", type = "LT", altitude_min = 4000 },
            }
        },
        ["Q34R"] = {
            name = "Q34R",
            type = "A",
            runway = "Q34R",
            waypoints = {
                { name = "IMR", transition = "IMR", type = "LT" },
                { name = "ME", transition = "IMR", type = "LT", altitude_min = 5000 },
                { name = "ME", transition = "IMR", type = "LT", altitude_min = 3900 },
                { name = "ME", transition = "ME", type = "LT", altitude_min = 4000 },
                { name = "ME", transition = "ME", type = "LT", altitude_min = 3900 },
                { name = "CQ34R", transition = "", type = "LT", altitude_min = 3900 },
                { name = "ME", transition = "", type = "LT", altitude_min = 2100 },
                { name = "MQ34R", transition = "", type = "LT" },
                { name = "EN", transition = "", type = "LT" },
                { name = "EN", transition = "", type = "LT", altitude_min = 2200, speed = 180.0 },
                { name = "EN", transition = "", type = "LT" },
                { name = "ME", transition = "", type = "LT" },
                { name = "ME", transition = "", type = "LT", altitude_min = 4000 },
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
