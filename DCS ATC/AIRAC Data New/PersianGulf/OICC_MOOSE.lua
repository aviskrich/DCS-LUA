local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "OICC",
        Name = "OICC Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "PersianGulf"
    },

    -- Путевые точки
    Waypoints = {
        ["CI2LZ"] = { lat = 52.336063889, lon = 18.074183333, type = "EPPW" },
        ["MD29L"] = { lat = 34.332927778, lon = 47.187522222, type = "OICC" },
        ["FQ29L"] = { lat = 34.283891667, lon = 47.292872222, type = "OICC" },
        ["FQ098"] = { lat = 34.378372222, lon = 47.014972222, type = "OICC" },
        ["FN098"] = { lat = 34.388061111, lon = 46.959577778, type = "OICC" },
        ["D075K"] = { lat = 48.913497222, lon = 24.975708333, type = "UKLI" },
        ["FI2LZ"] = { lat = 48.495611111, lon = -4.205888889, type = "LFRB" },
        ["FD114"] = { lat = 34.394525, lon = 47.044658333, type = "OICC" },
        ["D296L"] = { lat = 62.049872222, lon = 28.627133333, type = "EFSA" },
        ["D100U"] = { lat = 34.269097222, lon = 47.558788889, type = "OICC" },
        ["D330V"] = { lat = 49.098941667, lon = 3.889338889, type = "LFOK" },
        ["ASRIL"] = { lat = 34.470277778, lon = 47.753611111, type = "ENRT" },
        ["FD29L"] = { lat = 34.298927778, lon = 47.279408333, type = "OICC" },
        ["D112Q"] = { lat = 44.801852778, lon = 10.084369444, type = "LIMS" },
        ["BOPEL"] = { lat = 34.834722222, lon = 47.080833333, type = "ENRT" },
        ["BUBAV"] = { lat = 33.992777778, lon = 47.603333333, type = "ENRT" },
        ["RW29L"] = { lat = 20.514083333, lon = -103.292666667, type = "MMGL" },
        ["D294R"] = { lat = 35.668261111, lon = 23.852919444, type = "LGSA" },
        ["D098S"] = { lat = 53.879288889, lon = -8.287080556, type = "EIKN" },
        ["MD114"] = { lat = 34.363222222, lon = 47.115808333, type = "OICC" },
        ["50VOR"] = { lat = 35.396983333, lon = 4.272536111, type = "DAAD" },
        ["MOKAB"] = { lat = 34.020277778, lon = 46.850833333, type = "ENRT" },
        ["FN296"] = { lat = 34.278172222, lon = 47.304763889, type = "OICC" },
        ["D110Q"] = { lat = 44.636111111, lon = 14.131944444, type = "LDPL" },
        ["MQ29L"] = { lat = 34.334186111, lon = 47.188125, type = "OICC" },
        ["50DME"] = { lat = 51.806830556, lon = -121.423522222, type = "CZML" },
        ["CD114"] = { lat = 34.433591667, lon = 46.955644444, type = "OICC" },
        ["D098M"] = { lat = 56.35, lon = 102.06, type = "UIBB" },
        ["30DME"] = { lat = 1.752830556, lon = 11.020625, type = "FGMY" },
        ["CI2LY"] = { lat = 52.288555556, lon = 18.317388889, type = "EPPW" },
        ["30VOR"] = { lat = 35.37105, lon = 4.246863889, type = "DAAD" },
        ["D296R"] = { lat = 34.432344444, lon = 113.751391667, type = "ZHCC" },
        ["D085L"] = { lat = 60.138161111, lon = 20.314355556, type = "EFMA" },
        ["CD29L"] = { lat = 34.264855556, lon = 47.371216667, type = "OICC" },
        ["FI2LY"] = { lat = 48.478916667, lon = -4.280444444, type = "LFRB" },
        ["D330T"] = { lat = 23.456202778, lon = -109.857338889, type = "MMSD" },
        ["MQ098"] = { lat = 34.357302778, lon = 47.134911111, type = "OICC" },
    },

    -- Данные ВПП
    Runways = {
        ["RW11L"] = {
            heading = 110,
            length = 0,
            width = 0,
            threshold = { lat = 34.351797222222224, lon = 47.148019444444444 },
            end = { lat = 34.351797222222224, lon = 47.148019444444444 }
        },
        ["RW11R"] = {
            heading = 110,
            length = 0,
            width = 0,
            threshold = { lat = 34.351841666666665, lon = 47.14338055555555 },
            end = { lat = 34.351841666666665, lon = 47.14338055555555 }
        },
        ["RW29L"] = {
            heading = 290,
            length = 0,
            width = 0,
            threshold = { lat = 34.33909722222222, lon = 47.17483055555555 },
            end = { lat = 34.33909722222222, lon = 47.17483055555555 }
        },
        ["RW29R"] = {
            heading = 290,
            length = 0,
            width = 0,
            threshold = { lat = 34.34107222222222, lon = 47.17454722222222 },
            end = { lat = 34.34107222222222, lon = 47.17454722222222 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ASRI1A"] = {
            name = "ASRI1A",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 8000 },
                { name = "KMS", type = "D", altitude_min = 12000 },
                { name = "ASRIL", type = "E" },
            }
        },
        ["ASRI1B"] = {
            name = "ASRI1B",
            runway = "RW11R",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "ASRIL", type = "E" },
            }
        },
        ["ASRI1E"] = {
            name = "ASRI1E",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 8000 },
                { name = "KMS", type = "D", altitude_min = 12000 },
                { name = "ASRIL", type = "E" },
            }
        },
        ["ASRI1G"] = {
            name = "ASRI1G",
            runway = "RW11R",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "ASRIL", type = "E" },
            }
        },
        ["BOPE1A"] = {
            name = "BOPE1A",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "BOPEL", type = "E" },
            }
        },
        ["BOPE1B"] = {
            name = "BOPE1B",
            runway = "RW11R",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 11000 },
                { name = "KMS", type = "D" },
                { name = "BOPEL", type = "E" },
            }
        },
        ["BOPE1E"] = {
            name = "BOPE1E",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "BOPEL", type = "E" },
            }
        },
        ["BOPE1G"] = {
            name = "BOPE1G",
            runway = "RW11R",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 11000 },
                { name = "KMS", type = "D", altitude_min = 12000 },
                { name = "BOPEL", type = "E" },
            }
        },
        ["BUBA1A"] = {
            name = "BUBA1A",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 8000 },
                { name = "KMS", type = "D", altitude_min = 12000 },
                { name = "BUBAV", type = "E" },
            }
        },
        ["BUBA1B"] = {
            name = "BUBA1B",
            runway = "RW11R",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "BUBAV", type = "E" },
            }
        },
        ["BUBA1E"] = {
            name = "BUBA1E",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 8000 },
                { name = "KMS", type = "D", altitude_min = 12000 },
                { name = "BUBAV", type = "E" },
            }
        },
        ["BUBA1G"] = {
            name = "BUBA1G",
            runway = "RW11R",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 10000 },
                { name = "", type = "" },
                { name = "BUBAV", type = "E" },
            }
        },
        ["MOKA1A"] = {
            name = "MOKA1A",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 8000 },
                { name = "", type = "" },
                { name = "MOKAB", type = "E" },
            }
        },
        ["MOKA1B"] = {
            name = "MOKA1B",
            runway = "RW11R",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 8200 },
                { name = "", type = "" },
                { name = "MOKAB", type = "E" },
            }
        },
        ["MOKA1E"] = {
            name = "MOKA1E",
            runway = "RW29L",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 8000 },
                { name = "", type = "" },
                { name = "MOKAB", type = "E" },
            }
        },
        ["MOKA1G"] = {
            name = "MOKA1G",
            runway = "RW11R",
            waypoints = {
                { name = "", type = "", altitude_min = 4710 },
                { name = "KMS", type = "D", altitude_min = 8200 },
                { name = "", type = "" },
                { name = "MOKAB", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ASRI1U"] = {
            name = "ASRI1U",
            runway = "ALL",
            waypoints = {
                { name = "ASRIL", type = "OI" },
                { name = "D100U", type = "OI" },
                { name = "D296R", type = "OI" },
            }
        },
        ["ASRI1V"] = {
            name = "ASRI1V",
            runway = "ALL",
            waypoints = {
                { name = "ASRIL", type = "OI" },
                { name = "KMS", type = "OI" },
                { name = "D098S", type = "OI" },
            }
        },
        ["ASRI1W"] = {
            name = "ASRI1W",
            runway = "ALL",
            waypoints = {
                { name = "ASRIL", type = "OI" },
                { name = "KMS", type = "OI" },
            }
        },
        ["ASRI1Y"] = {
            name = "ASRI1Y",
            runway = "ALL",
            waypoints = {
                { name = "ASRIL", type = "OI" },
                { name = "KMS", type = "OI" },
                { name = "D294R", type = "OI" },
            }
        },
        ["ASRI1Z"] = {
            name = "ASRI1Z",
            runway = "ALL",
            waypoints = {
                { name = "ASRIL", type = "OI" },
                { name = "D110Q", type = "OI" },
            }
        },
        ["BOPE1U"] = {
            name = "BOPE1U",
            runway = "ALL",
            waypoints = {
                { name = "BOPEL", type = "OI" },
                { name = "D085L", type = "OI" },
                { name = "D296R", type = "OI" },
            }
        },
        ["BOPE1V"] = {
            name = "BOPE1V",
            runway = "ALL",
            waypoints = {
                { name = "BOPEL", type = "OI" },
                { name = "D330T", type = "OI" },
                { name = "D098S", type = "OI" },
            }
        },
        ["BOPE1W"] = {
            name = "BOPE1W",
            runway = "ALL",
            waypoints = {
                { name = "BOPEL", type = "OI" },
                { name = "KMS", type = "OI" },
            }
        },
        ["BOPE1Y"] = {
            name = "BOPE1Y",
            runway = "ALL",
            waypoints = {
                { name = "BOPEL", type = "OI" },
                { name = "D330V", type = "OI" },
                { name = "D294R", type = "OI" },
            }
        },
        ["BOPE1Z"] = {
            name = "BOPE1Z",
            runway = "ALL",
            waypoints = {
                { name = "BOPEL", type = "OI" },
                { name = "D075K", type = "OI" },
                { name = "D110Q", type = "OI" },
            }
        },
        ["BUBA1U"] = {
            name = "BUBA1U",
            runway = "ALL",
            waypoints = {
                { name = "BUBAV", type = "OI" },
                { name = "D296R", type = "OI" },
            }
        },
        ["BUBA1V"] = {
            name = "BUBA1V",
            runway = "ALL",
            waypoints = {
                { name = "BUBAV", type = "OI" },
                { name = "KMS", type = "OI" },
                { name = "D098S", type = "OI" },
            }
        },
        ["BUBA1W"] = {
            name = "BUBA1W",
            runway = "ALL",
            waypoints = {
                { name = "BUBAV", type = "OI" },
                { name = "KMS", type = "OI" },
            }
        },
        ["BUBA1Y"] = {
            name = "BUBA1Y",
            runway = "ALL",
            waypoints = {
                { name = "BUBAV", type = "OI" },
                { name = "KMS", type = "OI" },
                { name = "D294R", type = "OI" },
            }
        },
        ["BUBA1Z"] = {
            name = "BUBA1Z",
            runway = "ALL",
            waypoints = {
                { name = "BUBAV", type = "OI" },
                { name = "D110Q", type = "OI" },
            }
        },
        ["MOKA1U"] = {
            name = "MOKA1U",
            runway = "ALL",
            waypoints = {
                { name = "MOKAB", type = "OI" },
                { name = "D296R", type = "OI" },
            }
        },
        ["MOKA1V"] = {
            name = "MOKA1V",
            runway = "ALL",
            waypoints = {
                { name = "MOKAB", type = "OI" },
                { name = "D098S", type = "OI" },
            }
        },
        ["MOKA1W"] = {
            name = "MOKA1W",
            runway = "ALL",
            waypoints = {
                { name = "MOKAB", type = "OI" },
                { name = "KMS", type = "OI" },
            }
        },
        ["MOKA1Y"] = {
            name = "MOKA1Y",
            runway = "ALL",
            waypoints = {
                { name = "MOKAB", type = "OI" },
                { name = "D294R", type = "OI" },
            }
        },
        ["MOKA1Z"] = {
            name = "MOKA1Z",
            runway = "ALL",
            waypoints = {
                { name = "MOKAB", type = "OI" },
                { name = "D110Q", type = "OI" },
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
                { name = "D110Q", transition = "D110Q", type = "OI", altitude_min = 10500 },
                { name = "CD29L", transition = "D110Q", type = "OI", altitude_min = 8000 },
                { name = "CD29L", transition = "", type = "OI", altitude_min = 8000 },
                { name = "FD29L", transition = "", type = "OI", altitude_min = 6500 },
                { name = "30VOR", transition = "", type = "OI", altitude_min = 5400 },
                { name = "MD29L", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI", altitude_min = 7000 },
                { name = "KMS", transition = "", type = "OI", speed = 185.0 },
                { name = "D110Q", transition = "", type = "OI" },
                { name = "D110Q", transition = "", type = "OI", altitude_min = 10500, speed = 230.0 },
            }
        },
        ["I29LY"] = {
            name = "I29LY",
            type = "A",
            runway = "I29LY",
            waypoints = {
                { name = "D296R", transition = "D296R", type = "OI", altitude_min = 10500 },
                { name = "D296L", transition = "D296R", type = "OI", altitude_min = 8000 },
                { name = "CI2LY", transition = "D296R", type = "OI", altitude_min = 6530 },
                { name = "CI2LY", transition = "", type = "OI" },
                { name = "FI2LY", transition = "", type = "OI" },
                { name = "RW29L", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI", altitude_min = 7000 },
                { name = "KMS", transition = "", type = "OI" },
                { name = "D296R", transition = "", type = "OI" },
                { name = "D296R", transition = "", type = "OI", altitude_min = 10500, speed = 230.0 },
            }
        },
        ["I29LZ"] = {
            name = "I29LZ",
            type = "A",
            runway = "I29LZ",
            waypoints = {
                { name = "D112Q", transition = "D112Q", type = "OI", altitude_min = 10500 },
                { name = "CI2LZ", transition = "D112Q", type = "OI", altitude_min = 7800, speed = 220.0 },
                { name = "CI2LZ", transition = "", type = "OI" },
                { name = "FI2LZ", transition = "", type = "OI" },
                { name = "RW29L", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI", altitude_min = 7000 },
                { name = "KMS", transition = "", type = "OI", speed = 185.0 },
                { name = "D112Q", transition = "", type = "OI" },
                { name = "D112Q", transition = "", type = "OI", altitude_min = 10500, speed = 230.0 },
            }
        },
        ["NDBB"] = {
            name = "NDBB",
            type = "A",
            runway = "NDBB",
            waypoints = {
                { name = "KMS", transition = "KMS", type = "OI", altitude_min = 12800 },
                { name = "KMS", transition = "KMS", type = "OI", speed = 185.0 },
                { name = "FN296", transition = "KMS", type = "OI", altitude_min = 11000 },
                { name = "FN296", transition = "", type = "OI", altitude_min = 11000 },
                { name = "KMS", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI", altitude_min = 9500 },
                { name = "KMS", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI", altitude_min = 12800, speed = 185.0 },
            }
        },
        ["NDBC"] = {
            name = "NDBC",
            type = "A",
            runway = "NDBC",
            waypoints = {
                { name = "KMS", transition = "KMS", type = "OI", altitude_min = 13000 },
                { name = "FN098", transition = "KMS", type = "OI", speed = 185.0 },
                { name = "FN098", transition = "KMS", type = "OI" },
                { name = "FN098", transition = "KMS", type = "OI", altitude_min = 8000 },
                { name = "FN098", transition = "", type = "OI", altitude_min = 8000 },
                { name = "KMS", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI", altitude_min = 9700 },
                { name = "KMS", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI", altitude_min = 13000, speed = 185.0 },
            }
        },
        ["NDMA"] = {
            name = "NDMA",
            type = "A",
            runway = "NDMA",
            waypoints = {
                { name = "D098S", transition = "D098S", type = "OI", altitude_min = 10500 },
                { name = "D098M", transition = "D098S", type = "OI", altitude_min = 7800 },
                { name = "FQ098", transition = "D098S", type = "OI", altitude_min = 6400 },
                { name = "FQ098", transition = "", type = "OI", altitude_min = 6400 },
                { name = "50DME", transition = "", type = "OI", altitude_min = 5450 },
                { name = "MQ098", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI", altitude_min = 6500 },
                { name = "KMS", transition = "", type = "OI" },
                { name = "D098S", transition = "", type = "OI" },
                { name = "D098S", transition = "", type = "OI", altitude_min = 10500, speed = 230.0 },
            }
        },
        ["Q29L"] = {
            name = "Q29L",
            type = "A",
            runway = "Q29L",
            waypoints = {
                { name = "D296R", transition = "D296R", type = "OI", altitude_min = 10500 },
                { name = "D296L", transition = "D296R", type = "OI", altitude_min = 8000 },
                { name = "FQ29L", transition = "D296R", type = "OI", altitude_min = 6500 },
                { name = "FQ29L", transition = "", type = "OI", altitude_min = 6500 },
                { name = "30DME", transition = "", type = "OI", altitude_min = 5400 },
                { name = "MQ29L", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI", altitude_min = 7000 },
                { name = "KMS", transition = "", type = "OI" },
                { name = "D296R", transition = "", type = "OI" },
                { name = "D296R", transition = "", type = "OI", altitude_min = 10500, speed = 230.0 },
            }
        },
        ["VORA"] = {
            name = "VORA",
            type = "A",
            runway = "VORA",
            waypoints = {
                { name = "D294R", transition = "D294R", type = "OI", altitude_min = 10500 },
                { name = "CD114", transition = "D294R", type = "OI", altitude_min = 7800 },
                { name = "CD114", transition = "", type = "OI", altitude_min = 7800 },
                { name = "FD114", transition = "", type = "OI", altitude_min = 6400 },
                { name = "50VOR", transition = "", type = "OI", altitude_min = 5450 },
                { name = "MD114", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI" },
                { name = "KMS", transition = "", type = "OI", altitude_min = 6500 },
                { name = "D294R", transition = "", type = "OI" },
                { name = "D294R", transition = "", type = "OI", altitude_min = 10500, speed = 230.0 },
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
