local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "LTCC",
        Name = "LTCC Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Syria"
    },

    -- Путевые точки
    Waypoints = {
        ["MA34"] = { lat = -12.831313889, lon = 45.2959, type = "FMCZ" },
        ["FI34R"] = { lat = 27.054111111, lon = 33.837666667, type = "HEGN" },
        ["DY30B"] = { lat = 37.583661111, lon = 39.694663889, type = "LTCC" },
        ["D157G"] = { lat = 38.664427778, lon = 35.567413889, type = "LTAU" },
        ["D284J"] = { lat = 11.594619444, lon = 42.930311111, type = "HDAM" },
        ["SUMAP"] = { lat = 38.117194444, lon = 40.606583333, type = "ENRT" },
        ["ATLOM"] = { lat = 37.385805556, lon = 39.34875, type = "ENRT" },
        ["D284G"] = { lat = 12.135730556, lon = -68.368475, type = "TNCB" },
        ["DEMEB"] = { lat = 37.564027778, lon = 39.231694444, type = "ENRT" },
        ["D046G"] = { lat = 51.065555556, lon = 71.581111111, type = "UACC" },
        ["CI34R"] = { lat = 27.021741667, lon = 33.847144444, type = "HEGN" },
        ["D337G"] = { lat = 37.985380556, lon = 40.165213889, type = "LTCC" },
        ["FF3LY"] = { lat = 37.763355556, lon = 40.2456, type = "LTCC" },
        ["D128T"] = { lat = 50.026688889, lon = 5.049233333, type = "EBFS" },
        ["MA1RZ"] = { lat = 37.936797222, lon = 40.180925, type = "LTCC" },
        ["FF1LZ"] = { lat = 55.249963889, lon = 9.082283333, type = "EKSP" },
        ["FF3RY"] = { lat = 37.763605556, lon = 40.245513889, type = "LTCC" },
        ["ZUITA"] = { lat = 38.363222222, lon = 39.633916667, type = "ENRT" },
        ["CF34"] = { lat = 47.162286111, lon = 17.6077, type = "LHPA" },
        ["FF1RZ"] = { lat = 38.031438889, lon = 40.139680556, type = "LTCC" },
        ["LEKRO"] = { lat = 37.277444444, lon = 40.971472222, type = "ENRT" },
        ["FF34"] = { lat = -12.882775, lon = 45.334016667, type = "FMCZ" },
        ["D311Y"] = { lat = 36.946266667, lon = -4.904825, type = "LEMG" },
        ["D229N"] = { lat = 37.738625, lon = 39.968136111, type = "LTCC" },
        ["MOVUL"] = { lat = 38.152916667, lon = 39.232027778, type = "ENRT" },
        ["DYB44"] = { lat = 38.123658333, lon = 39.336027778, type = "ENRT" },
        ["MA1LZ"] = { lat = 37.937516667, lon = 40.183722222, type = "LTCC" },
        ["DY30A"] = { lat = 38.044827778, lon = 39.614230556, type = "LTCC" },
    },

    -- Данные ВПП
    Runways = {
        ["RW16L"] = {
            heading = 160,
            length = -640.0,
            width = 0,
            threshold = { lat = 37.90915277777778, lon = 40.19498333333333 },
            end = { lat = 38.00813095419677, lon = 40.14932331837066 }
        },
        ["RW16R"] = {
            heading = 160,
            length = -720.0,
            width = 0,
            threshold = { lat = 37.90858055555555, lon = 40.19267222222222 },
            end = { lat = 38.01993100402692, lon = 40.14130510488702 }
        },
        ["RW34L"] = {
            heading = 340,
            length = 720.0,
            width = 0,
            threshold = { lat = 37.878077777777776, lon = 40.20475833333334 },
            end = { lat = 37.989428226249146, lon = 40.15341249515658 }
        },
        ["RW34R"] = {
            heading = 340,
            length = 640.0,
            width = 0,
            threshold = { lat = 37.87864444444445, lon = 40.20705 },
            end = { lat = 37.97762262086344, lon = 40.16140890382412 }
        },
    },

    -- Процедуры SID
    SID = {
        ["ATLO1J"] = {
            name = "ATLO1J",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "DYB", type = "P" },
                { name = "ATLOM", type = "E" },
            }
        },
        ["ATLO1W"] = {
            name = "ATLO1W",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 3500 },
                { name = "DYB", type = "D" },
                { name = "ATLOM", type = "E" },
            }
        },
        ["ATLO1X"] = {
            name = "ATLO1X",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 3500 },
                { name = "DYB", type = "P" },
                { name = "ATLOM", type = "E" },
            }
        },
        ["ATLO1Y"] = {
            name = "ATLO1Y",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "DYB", type = "D" },
                { name = "ATLOM", type = "E" },
            }
        },
        ["DEME1J"] = {
            name = "DEME1J",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "DYB", type = "P" },
                { name = "DEMEB", type = "E" },
            }
        },
        ["DEME1W"] = {
            name = "DEME1W",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 3500 },
                { name = "DYB", type = "D" },
                { name = "DEMEB", type = "E" },
            }
        },
        ["DEME1X"] = {
            name = "DEME1X",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 3500 },
                { name = "DYB", type = "P" },
                { name = "DEMEB", type = "E" },
            }
        },
        ["DEME1Y"] = {
            name = "DEME1Y",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "DYB", type = "D" },
                { name = "DEMEB", type = "E" },
            }
        },
        ["LEKR1J"] = {
            name = "LEKR1J",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "DYB", type = "P" },
                { name = "LEKRO", type = "E" },
            }
        },
        ["LEKR1W"] = {
            name = "LEKR1W",
            runway = "RW16B",
            waypoints = {
                { name = "D157G", type = "P" },
                { name = "", type = "" },
                { name = "LEKRO", type = "E" },
            }
        },
        ["LEKR1X"] = {
            name = "LEKR1X",
            runway = "RW16B",
            waypoints = {
                { name = "D157G", type = "P" },
                { name = "", type = "" },
                { name = "LEKRO", type = "E" },
            }
        },
        ["LEKR1Y"] = {
            name = "LEKR1Y",
            runway = "RW34B",
            waypoints = {
                { name = "", type = "", altitude_min = 4000 },
                { name = "DYB", type = "D" },
                { name = "LEKRO", type = "E" },
            }
        },
        ["MOVU1J"] = {
            name = "MOVU1J",
            runway = "RW34B",
            waypoints = {
                { name = "D337G", type = "P" },
                { name = "D284G", type = "P" },
                { name = "MOVUL", type = "E" },
            }
        },
        ["MOVU1W"] = {
            name = "MOVU1W",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 3500 },
                { name = "DYB", type = "D" },
                { name = "MOVUL", type = "E" },
            }
        },
        ["MOVU1X"] = {
            name = "MOVU1X",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 3500 },
                { name = "DYB", type = "P" },
                { name = "MOVUL", type = "E" },
            }
        },
        ["MOVU1Y"] = {
            name = "MOVU1Y",
            runway = "RW34B",
            waypoints = {
                { name = "D337G", type = "P" },
                { name = "D284G", type = "P" },
                { name = "MOVUL", type = "E" },
            }
        },
        ["SUMA1J"] = {
            name = "SUMA1J",
            runway = "RW34B",
            waypoints = {
                { name = "D337G", type = "P" },
                { name = "D046G", type = "P" },
                { name = "SUMAP", type = "E" },
            }
        },
        ["SUMA1W"] = {
            name = "SUMA1W",
            runway = "RW16B",
            waypoints = {
                { name = "D157G", type = "P" },
                { name = "D046G", type = "P" },
                { name = "SUMAP", type = "E" },
            }
        },
        ["SUMA1X"] = {
            name = "SUMA1X",
            runway = "RW16B",
            waypoints = {
                { name = "D157G", type = "P" },
                { name = "D046G", type = "P" },
                { name = "SUMAP", type = "E" },
            }
        },
        ["SUMA1Y"] = {
            name = "SUMA1Y",
            runway = "RW34B",
            waypoints = {
                { name = "D337G", type = "P" },
                { name = "D046G", type = "P" },
                { name = "SUMAP", type = "E" },
            }
        },
        ["ZUIT1J"] = {
            name = "ZUIT1J",
            runway = "RW34B",
            waypoints = {
                { name = "D337G", type = "P" },
                { name = "", type = "" },
                { name = "ZUITA", type = "E" },
            }
        },
        ["ZUIT1W"] = {
            name = "ZUIT1W",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 3500 },
                { name = "DYB", type = "D" },
                { name = "ZUITA", type = "E" },
            }
        },
        ["ZUIT1X"] = {
            name = "ZUIT1X",
            runway = "RW16B",
            waypoints = {
                { name = "", type = "", altitude_min = 3500 },
                { name = "DYB", type = "P" },
                { name = "ZUITA", type = "E" },
            }
        },
        ["ZUIT1Y"] = {
            name = "ZUIT1Y",
            runway = "RW34B",
            waypoints = {
                { name = "D337G", type = "P" },
                { name = "", type = "" },
                { name = "ZUITA", type = "E" },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["ATLO1A"] = {
            name = "ATLO1A",
            runway = "RW34B",
            waypoints = {
                { name = "ATLOM", type = "LT" },
                { name = "DY30B", type = "LT" },
                { name = "D229N", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["ATLO1B"] = {
            name = "ATLO1B",
            runway = "RW16B",
            waypoints = {
                { name = "ATLOM", type = "LT" },
                { name = "DY30B", type = "LT" },
                { name = "D229N", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["ATLO1C"] = {
            name = "ATLO1C",
            runway = "RW34B",
            waypoints = {
                { name = "ATLOM", type = "LT" },
                { name = "DY30B", type = "LT" },
                { name = "D229N", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["ATLO1D"] = {
            name = "ATLO1D",
            runway = "RW16B",
            waypoints = {
                { name = "ATLOM", type = "LT" },
                { name = "DY30B", type = "LT" },
                { name = "D229N", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["DEME1A"] = {
            name = "DEME1A",
            runway = "RW34B",
            waypoints = {
                { name = "DEMEB", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["DEME1D"] = {
            name = "DEME1D",
            runway = "RW16B",
            waypoints = {
                { name = "DEMEB", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["LEKR1A"] = {
            name = "LEKR1A",
            runway = "RW34B",
            waypoints = {
                { name = "LEKRO", type = "LT" },
                { name = "D128T", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["LEKR1B"] = {
            name = "LEKR1B",
            runway = "RW16B",
            waypoints = {
                { name = "LEKRO", type = "LT" },
                { name = "D128T", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["LEKR1C"] = {
            name = "LEKR1C",
            runway = "RW34B",
            waypoints = {
                { name = "LEKRO", type = "LT" },
                { name = "D128T", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["LEKR1D"] = {
            name = "LEKR1D",
            runway = "RW16B",
            waypoints = {
                { name = "LEKRO", type = "LT" },
                { name = "D128T", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["MOVU1A"] = {
            name = "MOVU1A",
            runway = "RW34B",
            waypoints = {
                { name = "MOVUL", type = "LT" },
                { name = "DYB44", type = "LT" },
                { name = "DY30A", type = "LT" },
                { name = "D284J", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["MOVU1B"] = {
            name = "MOVU1B",
            runway = "RW16B",
            waypoints = {
                { name = "MOVUL", type = "LT" },
                { name = "DYB44", type = "LT" },
                { name = "DY30A", type = "LT" },
                { name = "D284J", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["MOVU1C"] = {
            name = "MOVU1C",
            runway = "RW34B",
            waypoints = {
                { name = "MOVUL", type = "LT" },
                { name = "DYB44", type = "LT" },
                { name = "DY30A", type = "LT" },
                { name = "D284J", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["MOVU1D"] = {
            name = "MOVU1D",
            runway = "RW16B",
            waypoints = {
                { name = "MOVUL", type = "LT" },
                { name = "DYB44", type = "LT" },
                { name = "DY30A", type = "LT" },
                { name = "D284J", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["SUMA1A"] = {
            name = "SUMA1A",
            runway = "RW34B",
            waypoints = {
                { name = "SUMAP", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["SUMA1B"] = {
            name = "SUMA1B",
            runway = "RW16B",
            waypoints = {
                { name = "SUMAP", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["SUMA1C"] = {
            name = "SUMA1C",
            runway = "RW34B",
            waypoints = {
                { name = "SUMAP", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["SUMA1D"] = {
            name = "SUMA1D",
            runway = "RW16B",
            waypoints = {
                { name = "SUMAP", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["ZUIT1A"] = {
            name = "ZUIT1A",
            runway = "RW34B",
            waypoints = {
                { name = "ZUITA", type = "LT" },
                { name = "D311Y", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["ZUIT1B"] = {
            name = "ZUIT1B",
            runway = "RW16B",
            waypoints = {
                { name = "ZUITA", type = "LT" },
                { name = "D311Y", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["ZUIT1C"] = {
            name = "ZUIT1C",
            runway = "RW34B",
            waypoints = {
                { name = "ZUITA", type = "LT" },
                { name = "D311Y", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
        ["ZUIT1D"] = {
            name = "ZUIT1D",
            runway = "RW16B",
            waypoints = {
                { name = "ZUITA", type = "LT" },
                { name = "D311Y", type = "LT" },
                { name = "DYB", type = "LT" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D16LZ"] = {
            name = "D16LZ",
            type = "D",
            runway = "D16LZ",
            waypoints = {
                { name = "FF1LZ", transition = "", type = "LT", altitude_min = 5200 },
                { name = "MA1LZ", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4000 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5200, speed = 230.0 },
            }
        },
        ["D16RZ"] = {
            name = "D16RZ",
            type = "D",
            runway = "D16RZ",
            waypoints = {
                { name = "FF1RZ", transition = "", type = "LT", altitude_min = 5200 },
                { name = "MA1RZ", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4000 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5200, speed = 230.0 },
            }
        },
        ["D34LZ"] = {
            name = "D34LZ",
            type = "D",
            runway = "D34LZ",
            waypoints = {
                { name = "CF34", transition = "", type = "LT", altitude_min = 5000 },
                { name = "FF34", transition = "", type = "LT", altitude_min = 4200 },
                { name = "MA34", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5000, speed = 230.0 },
            }
        },
        ["D34RZ"] = {
            name = "D34RZ",
            type = "D",
            runway = "D34RZ",
            waypoints = {
                { name = "CF34", transition = "", type = "LT", altitude_min = 5000 },
                { name = "FF34", transition = "", type = "LT", altitude_min = 4200 },
                { name = "MA34", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5000, speed = 230.0 },
            }
        },
        ["I34RZ"] = {
            name = "I34RZ",
            type = "I",
            runway = "I34RZ",
            waypoints = {
                { name = "CI34R", transition = "", type = "LT" },
                { name = "FI34R", transition = "", type = "LT" },
                { name = "RW34R", transition = "", type = "LT" },
                { name = "", transition = "", type = "", altitude_min = 2660 },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5000, speed = 230.0 },
            }
        },
        ["N34LY"] = {
            name = "N34LY",
            type = "N",
            runway = "N34LY",
            waypoints = {
                { name = "FF3LY", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5000, speed = 230.0 },
            }
        },
        ["N34RY"] = {
            name = "N34RY",
            type = "N",
            runway = "N34RY",
            waypoints = {
                { name = "FF3RY", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5000, speed = 230.0 },
            }
        },
        ["Q16LZ"] = {
            name = "Q16LZ",
            type = "Q",
            runway = "Q16LZ",
            waypoints = {
                { name = "FF1LZ", transition = "", type = "LT", altitude_min = 5200 },
                { name = "MA1LZ", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4000 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5200, speed = 230.0 },
            }
        },
        ["Q16RZ"] = {
            name = "Q16RZ",
            type = "Q",
            runway = "Q16RZ",
            waypoints = {
                { name = "FF1RZ", transition = "", type = "LT", altitude_min = 5200 },
                { name = "MA1RZ", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4000 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5200, speed = 230.0 },
            }
        },
        ["Q34LZ"] = {
            name = "Q34LZ",
            type = "Q",
            runway = "Q34LZ",
            waypoints = {
                { name = "CF34", transition = "", type = "LT", altitude_min = 5000 },
                { name = "FF34", transition = "", type = "LT", altitude_min = 4200 },
                { name = "MA34", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5000, speed = 230.0 },
            }
        },
        ["Q34RZ"] = {
            name = "Q34RZ",
            type = "Q",
            runway = "Q34RZ",
            waypoints = {
                { name = "CF34", transition = "", type = "LT", altitude_min = 5000 },
                { name = "FF34", transition = "", type = "LT", altitude_min = 4200 },
                { name = "MA34", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5000, speed = 230.0 },
            }
        },
        ["S34LY"] = {
            name = "S34LY",
            type = "S",
            runway = "S34LY",
            waypoints = {
                { name = "FF3LY", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5000, speed = 230.0 },
            }
        },
        ["S34RY"] = {
            name = "S34RY",
            type = "S",
            runway = "S34RY",
            waypoints = {
                { name = "FF3RY", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 4500 },
                { name = "DYB", transition = "", type = "LT" },
                { name = "DYB", transition = "", type = "LT", altitude_min = 5000, speed = 230.0 },
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
