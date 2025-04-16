local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OIIE",
        Name = "OIIE Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["EGVEL"] = { lat = 34.716111111, lon = 50.501388889, type = "ENRT" },
        ["BOXAM"] = { lat = 34.630277778, lon = 51.863055556, type = "ENRT" },
        ["IE404"] = { lat = 35.425338889, lon = 51.122197222, type = "OIIE" },
        ["RW29R"] = { lat = 20.518, lon = -103.295666667, type = "MMGL" },
        ["MD29R"] = { lat = 20.515255556, lon = -103.292144444, type = "MMGL" },
        ["FD29R"] = { lat = 37.939444444, lon = 58.483611111, type = "UTAA" },
        ["D140O"] = { lat = 42.740794444, lon = -8.198372222, type = "LEST" },
        ["ITKOB"] = { lat = 35.351841667, lon = 51.460441667, type = "OIIE" },
        ["IE405"] = { lat = 35.284125, lon = 51.076977778, type = "OIIE" },
        ["OBRIX"] = { lat = 34.761111111, lon = 52.144444444, type = "ENRT" },
        ["TRN28"] = { lat = 35.736502778, lon = 50.71045, type = "ENRT" },
        ["D140J"] = { lat = 27.041833333, lon = 33.905194444, type = "HEGN" },
        ["D116K"] = { lat = 55.029197222, lon = 82.832605556, type = "UNNT" },
        ["PAROT"] = { lat = 36.191111111, lon = 49.978055556, type = "ENRT" },
        ["NABAX"] = { lat = 36.165277778, lon = 50.804444444, type = "ENRT" },
        ["IE403"] = { lat = 35.386186111, lon = 51.262466667, type = "OIIE" },
        ["IE402"] = { lat = 35.35915, lon = 51.358913889, type = "OIIE" },
        ["MUXOR"] = { lat = 35.491666667, lon = 52.696388889, type = "ENRT" },
        ["NAGMO"] = { lat = 36.037222222, lon = 51.348611111, type = "ENRT" },
        ["PAXID"] = { lat = 36.284166667, lon = 50.339166667, type = "ENRT" },
        ["FD11R"] = { lat = 35.453044444, lon = 51.024155556, type = "OIIE" },
        ["CD11L"] = { lat = 38.059722222, lon = 58.191944444, type = "UTAA" },
        ["MIVAK"] = { lat = 35.9875, lon = 49.89, type = "ENRT" },
        ["CD11R"] = { lat = 35.480055556, lon = 50.927627778, type = "OIIE" },
        ["OXAVA"] = { lat = 35.284147222, lon = 51.403683333, type = "OIIE" },
        ["CD29R"] = { lat = 37.919722222, lon = 58.529444444, type = "UTAA" },
        ["D140K"] = { lat = 40.652744444, lon = 17.042833333, type = "LIBV" },
        ["RADAL"] = { lat = 34.906388889, lon = 52.339722222, type = "ENRT" },
        ["FD11L"] = { lat = 38.041111111, lon = 58.238888889, type = "UTAA" },
        ["FF29R"] = { lat = 37.938055556, lon = 58.483055556, type = "UTAA" },
        ["IE410"] = { lat = 36.142783333, lon = 50.444697222, type = "OIIE" },
        ["PAVET"] = { lat = 35.444166667, lon = 49.883611111, type = "ENRT" },
        ["CF29R"] = { lat = 50.229166667, lon = -105.265333333, type = "CYMJ" },
        ["TRN40"] = { lat = 35.078105556, lon = 51.589880556, type = "ENRT" },
        ["RW11R"] = { lat = 20.528777778, lon = -103.327694444, type = "MMGL" },
    },

    -- Данные ВПП
    Runways = {
        ["RW11L"] = {
            heading = 110,
            length = 360.0,
            width = 0,
            threshold = { lat = 35.42533888888889, lon = 51.12219722222222 },
            end = { lat = 35.405074764481, lon = 51.190521150770685 }
        },
        ["RW11R"] = {
            heading = 110,
            length = 360.0,
            width = 0,
            threshold = { lat = 35.42368611111111, lon = 51.12151111111111 },
            end = { lat = 35.40342198670322, lon = 51.18983363775857 }
        },
        ["RW29L"] = {
            heading = 290,
            length = 360.0,
            width = 0,
            threshold = { lat = 35.413091666666666, lon = 51.15953611111111 },
            end = { lat = 35.433355791074554, lon = 51.0912225680509 }
        },
        ["RW29R"] = {
            heading = 290,
            length = 360.0,
            width = 0,
            threshold = { lat = 35.41314722222222, lon = 51.165952777777775 },
            end = { lat = 35.43341134663011, lon = 51.09763918762135 }
        },
    },

    -- Процедуры SID
    SID = {
        ["DHN1E"] = {
            name = "DHN1E",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "", type = "" },
                { name = "IKA", type = "D" },
                { name = "DHN", type = "D" },
            }
        },
        ["DHN1F"] = {
            name = "DHN1F",
            runway = "RW11B",
            waypoints = {
                { name = "IKA", type = "D", altitude_min = 3710 },
                { name = "DHN", type = "D" },
            }
        },
        ["EGVE4G"] = {
            name = "EGVE4G",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "" },
                { name = "IKA", type = "D" },
                { name = "", type = "" },
                { name = "RUS", type = "D" },
                { name = "EGVEL", type = "E" },
            }
        },
        ["EGVE4L"] = {
            name = "EGVE4L",
            runway = "RW11B",
            waypoints = {
                { name = "IKA", type = "D" },
                { name = "IKA", type = "D" },
                { name = "IKA", type = "D" },
                { name = "RUS", type = "D" },
                { name = "EGVEL", type = "E" },
            }
        },
        ["IKA1A"] = {
            name = "IKA1A",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 7000 },
                { name = "", type = "" },
            }
        },
        ["IKA1B"] = {
            name = "IKA1B",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 6000 },
                { name = "", type = "" },
            }
        },
        ["KAZ1D"] = {
            name = "KAZ1D",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "KAZ", type = "D" },
            }
        },
        ["KAZ2C"] = {
            name = "KAZ2C",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "KAZ", type = "D" },
            }
        },
        ["NABA1G"] = {
            name = "NABA1G",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "IKA", type = "D" },
                { name = "", type = "" },
                { name = "NABAX", type = "E" },
            }
        },
        ["NABA1L"] = {
            name = "NABA1L",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "", type = "" },
                { name = "IKA", type = "D" },
                { name = "", type = "" },
                { name = "NABAX", type = "E" },
            }
        },
        ["OBRI2G"] = {
            name = "OBRI2G",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "", type = "" },
                { name = "IKA", type = "D" },
                { name = "", type = "" },
                { name = "OBRIX", type = "E" },
            }
        },
        ["OBRI2L"] = {
            name = "OBRI2L",
            runway = "RW11B",
            waypoints = {
                { name = "IKA", type = "D", altitude_min = 3710 },
                { name = "OBRIX", type = "E" },
            }
        },
        ["PARO3G"] = {
            name = "PARO3G",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "IKA", type = "D" },
                { name = "PAROT", type = "E" },
            }
        },
        ["PARO3H"] = {
            name = "PARO3H",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "", type = "" },
                { name = "IKA", type = "D" },
                { name = "PAROT", type = "E" },
            }
        },
        ["PARO3L"] = {
            name = "PARO3L",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "", type = "" },
                { name = "IKA", type = "D" },
                { name = "PAROT", type = "E" },
            }
        },
        ["PAVE1G"] = {
            name = "PAVE1G",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "IKA", type = "D" },
                { name = "PAVET", type = "E" },
            }
        },
        ["PAVE1L"] = {
            name = "PAVE1L",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "PAVET", type = "E" },
            }
        },
        ["PAXI2G"] = {
            name = "PAXI2G",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "", type = "" },
                { name = "IKA", type = "D" },
                { name = "PAXID", type = "E" },
            }
        },
        ["PAXI2L"] = {
            name = "PAXI2L",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "", type = "" },
                { name = "IKA", type = "D" },
                { name = "PAXID", type = "E" },
            }
        },
        ["RUS4C"] = {
            name = "RUS4C",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "" },
                { name = "IKA", type = "D" },
                { name = "", type = "" },
                { name = "RUS", type = "D" },
            }
        },
        ["RUS4D"] = {
            name = "RUS4D",
            runway = "RW11B",
            waypoints = {
                { name = "IKA", type = "D" },
                { name = "IKA", type = "D" },
                { name = "IKA", type = "D" },
                { name = "RUS", type = "D" },
            }
        },
        ["SAV1G"] = {
            name = "SAV1G",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "", type = "" },
                { name = "SAV", type = "D" },
            }
        },
        ["SAV1H"] = {
            name = "SAV1H",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "IKA", type = "D" },
                { name = "SAV", type = "D" },
            }
        },
        ["SAV1L"] = {
            name = "SAV1L",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "SAV", type = "D" },
            }
        },
        ["VR2C"] = {
            name = "VR2C",
            runway = "RW29B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "", type = "" },
                { name = "VR", type = "D" },
            }
        },
        ["VR2D"] = {
            name = "VR2D",
            runway = "RW11B",
            waypoints = {
                { name = "", type = "", altitude_min = 3710 },
                { name = "VR", type = "D" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["BOXA1Q"] = {
            name = "BOXA1Q",
            runway = "ALL",
            waypoints = {
                { name = "BOXAM", type = "OI" },
                { name = "D140O", type = "OI" },
            }
        },
        ["BOXA1R"] = {
            name = "BOXA1R",
            runway = "ALL",
            waypoints = {
                { name = "BOXAM", type = "OI" },
                { name = "TRN40", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["BOXA1Z"] = {
            name = "BOXA1Z",
            runway = "ALL",
            waypoints = {
                { name = "BOXAM", type = "OI" },
                { name = "TRN40", type = "OI" },
                { name = "KAZ", type = "OI" },
            }
        },
        ["BOXA2V"] = {
            name = "BOXA2V",
            runway = "ALL",
            waypoints = {
                { name = "BOXAM", type = "OI" },
                { name = "VR", type = "OI" },
            }
        },
        ["BOXA2X"] = {
            name = "BOXA2X",
            runway = "RW29R",
            waypoints = {
                { name = "BOXAM", type = "OI" },
                { name = "OXAVA", type = "OI" },
            }
        },
        ["MIVA2X"] = {
            name = "MIVA2X",
            runway = "RW29R",
            waypoints = {
                { name = "MIVAK", type = "OI" },
                { name = "IE405", type = "OI" },
                { name = "OXAVA", type = "OI" },
            }
        },
        ["MIVA3R"] = {
            name = "MIVA3R",
            runway = "ALL",
            waypoints = {
                { name = "MIVAK", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["MUXO1V"] = {
            name = "MUXO1V",
            runway = "ALL",
            waypoints = {
                { name = "MUXOR", type = "OI" },
                { name = "", type = "" },
                { name = "VR", type = "OI" },
            }
        },
        ["NAGM1V"] = {
            name = "NAGM1V",
            runway = "ALL",
            waypoints = {
                { name = "NAGMO", type = "OI" },
                { name = "TRN", type = "OI" },
                { name = "VR", type = "OI" },
            }
        },
        ["NAGM2R"] = {
            name = "NAGM2R",
            runway = "ALL",
            waypoints = {
                { name = "NAGMO", type = "OI" },
                { name = "TRN", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["PAVE2R"] = {
            name = "PAVE2R",
            runway = "ALL",
            waypoints = {
                { name = "PAVET", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["PAXI2R"] = {
            name = "PAXI2R",
            runway = "ALL",
            waypoints = {
                { name = "PAXID", type = "OI" },
                { name = "TRN28", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["PAXI2X"] = {
            name = "PAXI2X",
            runway = "RW29R",
            waypoints = {
                { name = "PAXID", type = "OI" },
                { name = "IE410", type = "OI" },
                { name = "IE405", type = "OI" },
                { name = "OXAVA", type = "OI" },
            }
        },
        ["RADA2Q"] = {
            name = "RADA2Q",
            runway = "ALL",
            waypoints = {
                { name = "RADAL", type = "OI" },
                { name = "D140O", type = "OI" },
            }
        },
        ["RADA2R"] = {
            name = "RADA2R",
            runway = "ALL",
            waypoints = {
                { name = "RADAL", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["RADA2V"] = {
            name = "RADA2V",
            runway = "ALL",
            waypoints = {
                { name = "RADAL", type = "OI" },
                { name = "VR", type = "OI" },
            }
        },
        ["RADA3X"] = {
            name = "RADA3X",
            runway = "RW29R",
            waypoints = {
                { name = "RADAL", type = "OI" },
                { name = "OXAVA", type = "OI" },
            }
        },
        ["RUS1V"] = {
            name = "RUS1V",
            runway = "ALL",
            waypoints = {
                { name = "RUS", type = "OI" },
                { name = "VR", type = "OI" },
            }
        },
        ["SAV1R"] = {
            name = "SAV1R",
            runway = "ALL",
            waypoints = {
                { name = "SAV", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
        ["SAV2X"] = {
            name = "SAV2X",
            runway = "RW29R",
            waypoints = {
                { name = "SAV", type = "OI" },
                { name = "IE405", type = "OI" },
                { name = "OXAVA", type = "OI" },
            }
        },
        ["VR1R"] = {
            name = "VR1R",
            runway = "ALL",
            waypoints = {
                { name = "VR", type = "OI" },
                { name = "RUS", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D11L"] = {
            name = "D11L",
            type = "A",
            runway = "D11L",
            waypoints = {
                { name = "RUS", transition = "RUS", type = "OI" },
                { name = "CD11L", transition = "RUS", type = "OI", altitude_min = 6100 },
                { name = "CD11L", transition = "", type = "OI", altitude_min = 6100 },
                { name = "FD11L", transition = "", type = "OI", altitude_min = 5100 },
                { name = "RW11L", transition = "", type = "OI" },
                { name = "IKA", transition = "", type = "OI" },
                { name = "RUS", transition = "", type = "OI" },
                { name = "RUS", transition = "", type = "OI", altitude_min = 7000, speed = 220.0 },
            }
        },
        ["D11R"] = {
            name = "D11R",
            type = "A",
            runway = "D11R",
            waypoints = {
                { name = "RUS", transition = "RUS", type = "OI" },
                { name = "CD11R", transition = "RUS", type = "OI", altitude_min = 6100 },
                { name = "CD11R", transition = "", type = "OI", altitude_min = 6100 },
                { name = "FD11R", transition = "", type = "OI", altitude_min = 5100 },
                { name = "RW11R", transition = "", type = "OI" },
                { name = "IKA", transition = "", type = "OI" },
                { name = "RUS", transition = "", type = "OI" },
                { name = "RUS", transition = "", type = "OI", altitude_min = 7000, speed = 220.0 },
            }
        },
        ["D29R"] = {
            name = "D29R",
            type = "A",
            runway = "D29R",
            waypoints = {
                { name = "D140O", transition = "D140O", type = "OI", speed = 220.0 },
                { name = "", transition = "D140O", type = "" },
                { name = "CD29R", transition = "D140O", type = "OI", altitude_min = 6000 },
                { name = "VR", transition = "VR", type = "OI", speed = 220.0 },
                { name = "CD29R", transition = "VR", type = "OI", altitude_min = 6000 },
                { name = "CD29R", transition = "", type = "OI", altitude_min = 6000 },
                { name = "FD29R", transition = "", type = "OI", altitude_min = 5100 },
                { name = "MD29R", transition = "", type = "OI" },
                { name = "IKA", transition = "", type = "OI" },
                { name = "", transition = "", type = "" },
                { name = "D140J", transition = "", type = "OI" },
                { name = "D140O", transition = "", type = "OI" },
                { name = "D140O", transition = "", type = "OI", altitude_min = 8000, speed = 220.0 },
            }
        },
        ["I29R"] = {
            name = "I29R",
            type = "A",
            runway = "I29R",
            waypoints = {
                { name = "D140O", transition = "D140O", type = "OI", speed = 220.0 },
                { name = "D140K", transition = "D140O", type = "OI", altitude_min = 6000 },
                { name = "D116K", transition = "D140O", type = "OI", altitude_min = 6000 },
                { name = "", transition = "D140O", type = "" },
                { name = "RUS", transition = "RUS", type = "OI" },
                { name = "", transition = "RUS", type = "", altitude_min = 8000 },
                { name = "D140K", transition = "RUS", type = "OI", altitude_min = 6000 },
                { name = "D116K", transition = "RUS", type = "OI", altitude_min = 6000 },
                { name = "", transition = "RUS", type = "" },
                { name = "VR", transition = "VR", type = "OI", speed = 220.0 },
                { name = "VR", transition = "VR", type = "OI" },
                { name = "CF29R", transition = "VR", type = "OI", altitude_min = 6000 },
                { name = "CF29R", transition = "", type = "OI" },
                { name = "FF29R", transition = "", type = "OI" },
                { name = "RW29R", transition = "", type = "OI" },
                { name = "RW29R", transition = "", type = "OI", altitude_min = 4600 },
                { name = "", transition = "", type = "" },
                { name = "D140O", transition = "", type = "OI" },
                { name = "D140O", transition = "", type = "OI", speed = 220.0 },
            }
        },
        ["R29R"] = {
            name = "R29R",
            type = "A",
            runway = "R29R",
            waypoints = {
                { name = "ITKOB", transition = "ITKOB", type = "OI", altitude_min = 7000 },
                { name = "IE402", transition = "ITKOB", type = "OI", altitude_min = 5500 },
                { name = "OXAVA", transition = "OXAVA", type = "OI", altitude_min = 7000 },
                { name = "IE402", transition = "OXAVA", type = "OI", altitude_min = 5500 },
                { name = "IE402", transition = "", type = "OI", altitude_min = 5500 },
                { name = "IE403", transition = "", type = "OI" },
                { name = "RW29R", transition = "", type = "OI" },
                { name = "IE404", transition = "", type = "OI", altitude_min = 3710 },
                { name = "IE405", transition = "", type = "OI" },
                { name = "OXAVA", transition = "", type = "OI" },
                { name = "OXAVA", transition = "", type = "OI", altitude_min = 7000, speed = 230.0 },
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
