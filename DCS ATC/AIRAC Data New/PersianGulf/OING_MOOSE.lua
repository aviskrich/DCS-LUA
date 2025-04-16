local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OING",
        Name = "OING Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["RUDEX"] = { lat = 36.669166667, lon = 54.115555556, type = "ENRT" },
        ["CI13"] = { lat = -19.973827778, lon = 28.522027778, type = "FVJN" },
        ["D214O"] = { lat = 36.734191667, lon = 54.180472222, type = "OING" },
        ["CD13"] = { lat = 4.983783333, lon = 31.456969444, type = "HJJJ" },
        ["IMPIR"] = { lat = 36.832777778, lon = 53.979444444, type = "ENRT" },
        ["FD133"] = { lat = 29.323966667, lon = 50.250636111, type = "OIBQ" },
        ["MA13"] = { lat = 58.101261111, lon = -68.438313889, type = "CYVP" },
        ["BONUL"] = { lat = 36.709444444, lon = 54.686666667, type = "ENRT" },
        ["FF13"] = { lat = 33.586588889, lon = 6.6771, type = "DAUO" },
        ["CF13"] = { lat = 33.618641667, lon = 6.631097222, type = "DAUO" },
        ["CD133"] = { lat = 29.384013889, lon = 50.184333333, type = "OIBQ" },
        ["ALNIT"] = { lat = 37.006111111, lon = 54.779166667, type = "ENRT" },
        ["FD13"] = { lat = -21.098266667, lon = 27.359930556, type = "FBPM" },
        ["GGN"] = { lat = -26.433333333, lon = 152.328333333, type = "ENRT" },
        ["D249O"] = { lat = 36.856752778, lon = 54.077547222, type = "OING" },
        ["D300O"] = { lat = 43.429025, lon = -3.233011111, type = "LEBB" },
        ["D071O"] = { lat = 38.219505556, lon = 21.737094444, type = "LGAD" },
        ["D127J"] = { lat = 21.698838889, lon = -72.105155556, type = "MBPV" },
    },

    -- Данные ВПП
    Runways = {
        ["RW13"] = {
            heading = 130,
            length = 280.0,
            width = 0,
            threshold = { lat = 36.92285833333333, lon = 54.38394722222222 },
            end = { lat = 36.89323736950901, lon = 54.42810396547791 }
        },
        ["RW31"] = {
            heading = 310,
            length = 0,
            width = 0,
            threshold = { lat = 36.90223888888889, lon = 54.41063055555556 },
            end = { lat = 36.90223888888889, lon = 54.41063055555556 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ALNI1B"] = {
            name = "ALNI1B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 400 },
                { name = "", type = "" },
                { name = "GGN", type = "D" },
                { name = "GGN", type = "D", altitude_min = 9000 },
                { name = "ALNIT", type = "E" },
            }
        },
        ["ALNI1C"] = {
            name = "ALNI1C",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 4500 },
                { name = "GGN", type = "D", altitude_min = 9000 },
                { name = "ALNIT", type = "E" },
            }
        },
        ["BONU1B"] = {
            name = "BONU1B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 400 },
                { name = "", type = "" },
                { name = "GGN", type = "D" },
                { name = "GGN", type = "D", altitude_min = 9000 },
                { name = "BONUL", type = "E" },
            }
        },
        ["BONU1C"] = {
            name = "BONU1C",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 4500 },
                { name = "GGN", type = "D", altitude_min = 9000 },
                { name = "BONUL", type = "E" },
            }
        },
        ["IMPI1B"] = {
            name = "IMPI1B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 400 },
                { name = "", type = "" },
                { name = "GGN", type = "D" },
                { name = "GGN", type = "D", altitude_min = 3000 },
                { name = "IMPIR", type = "E", altitude_min = 7000 },
            }
        },
        ["IMPI1D"] = {
            name = "IMPI1D",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 400 },
                { name = "", type = "" },
                { name = "IMPIR", type = "E" },
            }
        },
        ["IMPI1F"] = {
            name = "IMPI1F",
            runway = "RW31",
            waypoints = {
                { name = "GGN", type = "D" },
                { name = "GGN", type = "D", altitude_min = 1500 },
                { name = "GGN", type = "D", altitude_min = 3000 },
                { name = "IMPIR", type = "E", altitude_min = 7000 },
            }
        },
        ["RUDE1B"] = {
            name = "RUDE1B",
            runway = "RW13",
            waypoints = {
                { name = "", type = "", altitude_min = 400 },
                { name = "", type = "" },
                { name = "GGN", type = "D" },
                { name = "GGN", type = "D", altitude_min = 9000 },
                { name = "RUDEX", type = "E" },
            }
        },
        ["RUDE1C"] = {
            name = "RUDE1C",
            runway = "RW31",
            waypoints = {
                { name = "", type = "", altitude_min = 4500 },
                { name = "GGN", type = "D", altitude_min = 9000 },
                { name = "RUDEX", type = "E", altitude_min = 17000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ALNI1R"] = {
            name = "ALNI1R",
            runway = "RW13",
            waypoints = {
                { name = "ALNIT", type = "OI" },
                { name = "D071O", type = "OI" },
                { name = "CD13", type = "OI" },
            }
        },
        ["ALNI2S"] = {
            name = "ALNI2S",
            runway = "RW13",
            waypoints = {
                { name = "ALNIT", type = "OI" },
                { name = "D071O", type = "OI" },
                { name = "GGN", type = "OI" },
            }
        },
        ["BONU2S"] = {
            name = "BONU2S",
            runway = "RW13",
            waypoints = {
                { name = "BONUL", type = "OI" },
                { name = "D127J", type = "OI" },
                { name = "GGN", type = "OI" },
            }
        },
        ["IMPI1N"] = {
            name = "IMPI1N",
            runway = "RW13",
            waypoints = {
                { name = "IMPIR", type = "OI" },
                { name = "D249O", type = "OI" },
            }
        },
        ["IMPI1S"] = {
            name = "IMPI1S",
            runway = "RW13",
            waypoints = {
                { name = "IMPIR", type = "OI" },
                { name = "D249O", type = "OI" },
                { name = "GGN", type = "OI" },
            }
        },
        ["IMPI2R"] = {
            name = "IMPI2R",
            runway = "RW13",
            waypoints = {
                { name = "IMPIR", type = "OI" },
                { name = "D249O", type = "OI" },
                { name = "CD13", type = "OI" },
            }
        },
        ["RUDE1N"] = {
            name = "RUDE1N",
            runway = "RW13",
            waypoints = {
                { name = "RUDEX", type = "OI" },
                { name = "D214O", type = "OI" },
                { name = "D249O", type = "OI" },
            }
        },
        ["RUDE2R"] = {
            name = "RUDE2R",
            runway = "RW13",
            waypoints = {
                { name = "RUDEX", type = "OI" },
                { name = "D214O", type = "OI" },
                { name = "D249O", type = "OI" },
                { name = "CD13", type = "OI" },
            }
        },
        ["RUDE2S"] = {
            name = "RUDE2S",
            runway = "RW13",
            waypoints = {
                { name = "RUDEX", type = "OI" },
                { name = "D214O", type = "OI" },
                { name = "GGN", type = "OI" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D13-1"] = {
            name = "D13-1",
            type = "A",
            runway = "D13-1",
            waypoints = {
                { name = "CD13", transition = "CD13", type = "OI", altitude_min = 5000 },
                { name = "FD13", transition = "CD13", type = "OI", altitude_min = 2300 },
                { name = "FD13", transition = "", type = "OI", altitude_min = 2300 },
                { name = "GGN", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 380 },
                { name = "CD13", transition = "", type = "OI" },
                { name = "CD13", transition = "", type = "OI", altitude_min = 5000, speed = 210.0 },
            }
        },
        ["D13-2"] = {
            name = "D13-2",
            type = "A",
            runway = "D13-2",
            waypoints = {
                { name = "GGN", transition = "GGN", type = "OI", altitude_min = 10000 },
                { name = "GGN", transition = "GGN", type = "OI", altitude_min = 5000 },
                { name = "CD13", transition = "GGN", type = "OI", altitude_min = 5000 },
                { name = "CD13", transition = "", type = "OI", altitude_min = 5000 },
                { name = "FD13", transition = "", type = "OI", altitude_min = 2300 },
                { name = "GGN", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 380 },
                { name = "CD13", transition = "", type = "OI" },
                { name = "CD13", transition = "", type = "OI", speed = 210.0 },
            }
        },
        ["D13-3"] = {
            name = "D13-3",
            type = "A",
            runway = "D13-3",
            waypoints = {
                { name = "GGN", transition = "GGN", type = "OI", altitude_min = 6000 },
                { name = "GGN", transition = "GGN", type = "OI", altitude_min = 2800 },
                { name = "CD133", transition = "GGN", type = "OI", altitude_min = 2800 },
                { name = "CD133", transition = "", type = "OI", altitude_min = 2800 },
                { name = "FD133", transition = "", type = "OI", altitude_min = 1600 },
                { name = "GGN", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 380 },
                { name = "GGN", transition = "", type = "OI", altitude_min = 3000 },
                { name = "GGN", transition = "", type = "OI" },
                { name = "GGN", transition = "", type = "OI", altitude_min = 6000, speed = 140.0 },
            }
        },
        ["L13-X"] = {
            name = "L13-X",
            type = "A",
            runway = "L13-X",
            waypoints = {
                { name = "GGN", transition = "GGN", type = "OI" },
                { name = "GGN", transition = "GGN", type = "OI", altitude_min = 2800 },
                { name = "CI13", transition = "GGN", type = "OI", altitude_min = 2800 },
                { name = "CI13", transition = "", type = "OI", altitude_min = 2800 },
                { name = "FF13", transition = "", type = "OI", altitude_min = 2300 },
                { name = "MA13", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 380 },
                { name = "", transition = "", type = "" },
                { name = "GGN", transition = "", type = "OI", altitude_min = 3000 },
                { name = "GGN", transition = "", type = "OI" },
                { name = "GGN", transition = "", type = "OI", altitude_min = 6000, speed = 140.0 },
            }
        },
        ["L13-Y"] = {
            name = "L13-Y",
            type = "A",
            runway = "L13-Y",
            waypoints = {
                { name = "GGN", transition = "GGN", type = "OI" },
                { name = "GGN", transition = "GGN", type = "OI", altitude_min = 5000 },
                { name = "CF13", transition = "GGN", type = "OI", altitude_min = 5000 },
                { name = "CF13", transition = "", type = "OI", altitude_min = 5000 },
                { name = "FF13", transition = "", type = "OI", altitude_min = 2300 },
                { name = "MA13", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 380 },
                { name = "", transition = "", type = "" },
                { name = "GGN", transition = "", type = "OI", altitude_min = 3200 },
                { name = "GGN", transition = "", type = "OI", altitude_min = 6500 },
                { name = "D249O", transition = "", type = "OI" },
                { name = "D249O", transition = "", type = "OI", altitude_min = 9000, speed = 185.0 },
            }
        },
        ["L13-Z"] = {
            name = "L13-Z",
            type = "A",
            runway = "L13-Z",
            waypoints = {
                { name = "D249O", transition = "D249O", type = "OI" },
                { name = "D300O", transition = "D249O", type = "OI", altitude_min = 5000 },
                { name = "", transition = "D249O", type = "" },
                { name = "CF13", transition = "", type = "OI", altitude_min = 5000 },
                { name = "FF13", transition = "", type = "OI", altitude_min = 2300 },
                { name = "MA13", transition = "", type = "OI" },
                { name = "", transition = "", type = "", altitude_min = 380 },
                { name = "", transition = "", type = "" },
                { name = "GGN", transition = "", type = "OI", altitude_min = 3200 },
                { name = "GGN", transition = "", type = "OI", altitude_min = 6500 },
                { name = "D249O", transition = "", type = "OI" },
                { name = "D249O", transition = "", type = "OI", altitude_min = 9000, speed = 185.0 },
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
