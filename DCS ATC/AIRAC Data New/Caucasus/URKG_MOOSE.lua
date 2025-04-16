local AirportData = {
    -- Метаданные аэропорта
    Metadata = {
        ICAO = "URKG",
        Name = "URKG Airport",
        Elevation = 0,
        MagVar = 0,
        Region = "Caucasus"
    },

    -- Путевые точки
    Waypoints = {
        ["D212K"] = { lat = 12.186775, lon = -1.606430556, type = "DFFD" },
        ["D183K"] = { lat = 71.56, lon = 129.071666667, type = "UEST" },
        ["LIMAS"] = { lat = 44.208055556, lon = 37.82, type = "ENRT" },
        ["D178L"] = { lat = 44.366644444, lon = 37.987027778, type = "URKG" },
        ["D200L"] = { lat = 44.388311111, lon = 37.881291667, type = "URKG" },
        ["D184K"] = { lat = 44.391666667, lon = 37.963333333, type = "URKG" },
        ["D204L"] = { lat = 54.467522222, lon = 25.112986111, type = "EYVI" },
        ["MN01Z"] = { lat = 44.478027778, lon = 37.972516667, type = "URKG" },
        ["DOROL"] = { lat = 44.631388889, lon = 37.561666667, type = "ENRT" },
        ["D189L"] = { lat = 44.381666667, lon = 37.936666667, type = "URKG" },
        ["D177J"] = { lat = 44.401666667, lon = 37.995, type = "URKG" },
        ["D189M"] = { lat = 44.369030556, lon = 37.9308, type = "URKG" },
        ["FD01"] = { lat = 32.978241667, lon = 6.056547222, type = "DAUK" },
        ["D174L"] = { lat = 28.233283333, lon = -13.825177778, type = "GCFV" },
        ["D189J"] = { lat = 48.456944444, lon = 17.767222222, type = "LZPP" },
        ["CI01"] = { lat = 32.924161111, lon = 6.06305, type = "DAUK" },
        ["D197L"] = { lat = 28.235372222, lon = -13.915436111, type = "GCFV" },
        ["MN01Y"] = { lat = 44.493813889, lon = 37.979247222, type = "URKG" },
        ["D167K"] = { lat = 44.385222222, lon = 38.039588889, type = "URKG" },
        ["OSNIR"] = { lat = 44.642777778, lon = 38.283888889, type = "ENRT" },
        ["MD012"] = { lat = 64.607594444, lon = -173.032172222, type = "UHMD" },
        ["KUTON"] = { lat = 44.269722222, lon = 38.315, type = "ENRT" },
        ["NALUD"] = { lat = 44.479722222, lon = 37.403611111, type = "ENRT" },
        ["D251N"] = { lat = 44.525, lon = 37.691666667, type = "URKG" },
        ["D137N"] = { lat = 44.383333333, lon = 38.203333333, type = "URKG" },
        ["D195L"] = { lat = 56.732655556, lon = 23.826908333, type = "EVRA" },
        ["D161L"] = { lat = 44.37, lon = 38.07, type = "URKG" },
        ["D161M"] = { lat = 44.867577778, lon = 28.778030556, type = "LRTC" },
        ["MD01"] = { lat = -34.005844444, lon = 18.612711111, type = "FACT" },
        ["D194N"] = { lat = 44.361666667, lon = 37.901666667, type = "URKG" },
        ["D180L"] = { lat = 44.373333333, lon = 37.976666667, type = "URKG" },
        ["D210M"] = { lat = 11.371913889, lon = 42.979686111, type = "HDAM" },
        ["D181K"] = { lat = 33.866291667, lon = -6.750213889, type = "GMME" },
        ["D274N"] = { lat = 44.615, lon = 37.69, type = "URKG" },
        ["D181M"] = { lat = 44.362913889, lon = 37.971075, type = "URKG" },
        ["D197K"] = { lat = 44.405, lon = 37.91, type = "URKG" },
        ["RULAB"] = { lat = 44.366388889, lon = 38.408333333, type = "ENRT" },
        ["D193K"] = { lat = 44.4, lon = 37.923333333, type = "URKG" },
        ["D219J"] = { lat = 44.253, lon = 27.617925, type = "LRFT" },
        ["D183L"] = { lat = 44.368988889, lon = 37.962105556, type = "URKG" },
        ["FN01"] = { lat = 3.630291667, lon = 11.536875, type = "FKYS" },
    },

    -- Данные ВПП
    Runways = {
        ["RW01"] = {
            heading = 10,
            length = 0,
            width = 0,
            threshold = { lat = 44.56848888888889, lon = 38.00821388888889 },
            end = { lat = 44.56848888888889, lon = 38.00821388888889 }
        },
        ["RW19"] = {
            heading = 190,
            length = 0,
            width = 0,
            threshold = { lat = 44.59554444444445, lon = 38.01773055555555 },
            end = { lat = 44.59554444444445, lon = 38.01773055555555 }
        },
    },

    -- Процедуры SID
    SID = {
        ["DORO1A"] = {
            name = "DORO1A",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "", type = "" },
                { name = "DOROL", type = "E", altitude_min = 6000 },
            }
        },
        ["DORO1B"] = {
            name = "DORO1B",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "", type = "" },
                { name = "DOROL", type = "E", altitude_min = 6000 },
            }
        },
        ["DORO1C"] = {
            name = "DORO1C",
            runway = "RW01",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", altitude_min = 920, speed = 185.0 },
                { name = "", type = "" },
                { name = "DOROL", type = "E", altitude_min = 6000 },
            }
        },
        ["DORO3B"] = {
            name = "DORO3B",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "", type = "" },
                { name = "DOROL", type = "E", altitude_min = 6000 },
            }
        },
        ["DORO3C"] = {
            name = "DORO3C",
            runway = "RW01",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", altitude_min = 920, speed = 185.0 },
                { name = "", type = "" },
                { name = "DOROL", type = "E", altitude_min = 6000 },
            }
        },
        ["KUTO1A"] = {
            name = "KUTO1A",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "", type = "" },
                { name = "KUTON", type = "E", altitude_min = 7000 },
            }
        },
        ["KUTO1B"] = {
            name = "KUTO1B",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "", type = "" },
                { name = "KUTON", type = "E", altitude_min = 7000 },
            }
        },
        ["KUTO1C"] = {
            name = "KUTO1C",
            runway = "RW01",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", altitude_min = 920, speed = 185.0 },
                { name = "GNV", type = "D", altitude_min = 3050 },
                { name = "KUTON", type = "E", altitude_min = 7000 },
            }
        },
        ["KUTO3B"] = {
            name = "KUTO3B",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "KUTON", type = "E", altitude_min = 7000 },
            }
        },
        ["KUTO3C"] = {
            name = "KUTO3C",
            runway = "RW01",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", altitude_min = 920, speed = 185.0 },
                { name = "GNV", type = "D", altitude_min = 3050 },
                { name = "KUTON", type = "E", altitude_min = 7000 },
            }
        },
        ["LIMA1A"] = {
            name = "LIMA1A",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "LIMAS", type = "E", altitude_min = 6000 },
            }
        },
        ["LIMA1B"] = {
            name = "LIMA1B",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "LIMAS", type = "E", altitude_min = 6000 },
            }
        },
        ["LIMA1C"] = {
            name = "LIMA1C",
            runway = "RW01",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", altitude_min = 920, speed = 185.0 },
                { name = "", type = "" },
                { name = "LIMAS", type = "E", altitude_min = 6000 },
            }
        },
        ["LIMA3B"] = {
            name = "LIMA3B",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "LIMAS", type = "E", altitude_min = 6000 },
            }
        },
        ["LIMA3C"] = {
            name = "LIMA3C",
            runway = "RW01",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", altitude_min = 920, speed = 185.0 },
                { name = "", type = "" },
                { name = "LIMAS", type = "E", altitude_min = 6000 },
            }
        },
        ["NALU1A"] = {
            name = "NALU1A",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "", type = "" },
                { name = "NALUD", type = "E", altitude_min = 6000 },
            }
        },
        ["NALU1B"] = {
            name = "NALU1B",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "", type = "" },
                { name = "NALUD", type = "E", altitude_min = 6000 },
            }
        },
        ["NALU1C"] = {
            name = "NALU1C",
            runway = "RW01",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", altitude_min = 920, speed = 185.0 },
                { name = "", type = "" },
                { name = "NALUD", type = "E", altitude_min = 6000 },
            }
        },
        ["NALU3B"] = {
            name = "NALU3B",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "", type = "" },
                { name = "NALUD", type = "E", altitude_min = 6000 },
            }
        },
        ["NALU3C"] = {
            name = "NALU3C",
            runway = "RW01",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", altitude_min = 920, speed = 185.0 },
                { name = "", type = "" },
                { name = "NALUD", type = "E", altitude_min = 6000 },
            }
        },
        ["OSNI1A"] = {
            name = "OSNI1A",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "GNV", type = "D" },
                { name = "OSNIR", type = "E", altitude_min = 7000 },
            }
        },
        ["OSNI1B"] = {
            name = "OSNI1B",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "GNV", type = "D" },
                { name = "OSNIR", type = "E", altitude_min = 7000 },
            }
        },
        ["OSNI1C"] = {
            name = "OSNI1C",
            runway = "RW01",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", altitude_min = 920, speed = 185.0 },
                { name = "GNV", type = "D", altitude_min = 3050 },
                { name = "OSNIR", type = "E", altitude_min = 7000 },
            }
        },
        ["OSNI3B"] = {
            name = "OSNI3B",
            runway = "RW19",
            waypoints = {
                { name = "", type = "", altitude_min = 2430 },
                { name = "GNV", type = "D" },
                { name = "OSNIR", type = "E", altitude_min = 7000 },
            }
        },
        ["OSNI3C"] = {
            name = "OSNI3C",
            runway = "RW01",
            waypoints = {
                { name = "", type = "" },
                { name = "", type = "", altitude_min = 920, speed = 185.0 },
                { name = "GNV", type = "D", altitude_min = 3050 },
                { name = "OSNIR", type = "E", altitude_min = 7000 },
            }
        },
    },

    -- Процедуры STAR
    STAR = {
        ["DORO2A"] = {
            name = "DORO2A",
            runway = "RW01",
            waypoints = {
                { name = "DOROL", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "GNV", type = "UR" },
            }
        },
        ["DORO2B"] = {
            name = "DORO2B",
            runway = "RW01",
            waypoints = {
                { name = "DOROL", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D274N", type = "UR" },
            }
        },
        ["DORO2C"] = {
            name = "DORO2C",
            runway = "RW01",
            waypoints = {
                { name = "DOROL", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D204L", type = "UR" },
                { name = "D197L", type = "UR" },
                { name = "FD01", type = "UR" },
            }
        },
        ["DORO4A"] = {
            name = "DORO4A",
            runway = "RW01",
            waypoints = {
                { name = "DOROL", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "GN", type = "UR" },
            }
        },
        ["DORO4C"] = {
            name = "DORO4C",
            runway = "RW01",
            waypoints = {
                { name = "DOROL", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D197K", type = "UR" },
                { name = "D193K", type = "UR" },
                { name = "FD01", type = "UR" },
            }
        },
        ["DOROL2"] = {
            name = "DOROL2",
            runway = "RW01",
            waypoints = {
                { name = "DOROL", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D204L", type = "UR" },
                { name = "D197L", type = "UR" },
                { name = "CI01", type = "UR" },
            }
        },
        ["DOROL4"] = {
            name = "DOROL4",
            runway = "RW01",
            waypoints = {
                { name = "DOROL", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D197K", type = "UR" },
                { name = "D193K", type = "UR" },
                { name = "CI01", type = "UR" },
            }
        },
        ["KUTO2A"] = {
            name = "KUTO2A",
            runway = "RW01",
            waypoints = {
                { name = "KUTON", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "GNV", type = "UR" },
            }
        },
        ["KUTO2B"] = {
            name = "KUTO2B",
            runway = "RW01",
            waypoints = {
                { name = "KUTON", type = "UR", altitude_max = 7000 },
                { name = "D137N", type = "UR" },
            }
        },
        ["KUTO2C"] = {
            name = "KUTO2C",
            runway = "RW01",
            waypoints = {
                { name = "KUTON", type = "UR", altitude_max = 7000 },
                { name = "D180L", type = "UR" },
                { name = "FD01", type = "UR" },
            }
        },
        ["KUTO4A"] = {
            name = "KUTO4A",
            runway = "RW01",
            waypoints = {
                { name = "KUTON", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "GN", type = "UR" },
            }
        },
        ["KUTO4C"] = {
            name = "KUTO4C",
            runway = "RW01",
            waypoints = {
                { name = "KUTON", type = "UR", altitude_max = 7000 },
                { name = "D184K", type = "UR" },
                { name = "FD01", type = "UR" },
            }
        },
        ["KUTON2"] = {
            name = "KUTON2",
            runway = "RW01",
            waypoints = {
                { name = "KUTON", type = "UR", altitude_max = 7000 },
                { name = "D180L", type = "UR" },
                { name = "CI01", type = "UR" },
            }
        },
        ["KUTON4"] = {
            name = "KUTON4",
            runway = "RW01",
            waypoints = {
                { name = "KUTON", type = "UR", altitude_max = 7000 },
                { name = "D184K", type = "UR" },
                { name = "CI01", type = "UR" },
            }
        },
        ["LIMA2A"] = {
            name = "LIMA2A",
            runway = "RW01",
            waypoints = {
                { name = "LIMAS", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "GNV", type = "UR" },
            }
        },
        ["LIMA2B"] = {
            name = "LIMA2B",
            runway = "RW01",
            waypoints = {
                { name = "LIMAS", type = "UR", altitude_max = 7000 },
                { name = "D194N", type = "UR" },
            }
        },
        ["LIMA2C"] = {
            name = "LIMA2C",
            runway = "RW01",
            waypoints = {
                { name = "LIMAS", type = "UR", altitude_max = 7000 },
                { name = "D189L", type = "UR" },
                { name = "FD01", type = "UR" },
            }
        },
        ["LIMA4A"] = {
            name = "LIMA4A",
            runway = "RW01",
            waypoints = {
                { name = "LIMAS", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "GN", type = "UR" },
            }
        },
        ["LIMA4C"] = {
            name = "LIMA4C",
            runway = "RW01",
            waypoints = {
                { name = "LIMAS", type = "UR", altitude_max = 7000 },
                { name = "D189L", type = "UR" },
                { name = "FD01", type = "UR" },
            }
        },
        ["LIMAS2"] = {
            name = "LIMAS2",
            runway = "RW01",
            waypoints = {
                { name = "LIMAS", type = "UR", altitude_max = 7000 },
                { name = "D189L", type = "UR" },
                { name = "CI01", type = "UR" },
            }
        },
        ["LIMAS4"] = {
            name = "LIMAS4",
            runway = "RW01",
            waypoints = {
                { name = "LIMAS", type = "UR", altitude_max = 7000 },
                { name = "D189L", type = "UR" },
                { name = "CI01", type = "UR" },
            }
        },
        ["NALU2A"] = {
            name = "NALU2A",
            runway = "RW01",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "GNV", type = "UR" },
            }
        },
        ["NALU2B"] = {
            name = "NALU2B",
            runway = "RW01",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D251N", type = "UR" },
            }
        },
        ["NALU2C"] = {
            name = "NALU2C",
            runway = "RW01",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D197L", type = "UR" },
                { name = "FD01", type = "UR" },
            }
        },
        ["NALU4A"] = {
            name = "NALU4A",
            runway = "RW01",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "GN", type = "UR" },
            }
        },
        ["NALU4C"] = {
            name = "NALU4C",
            runway = "RW01",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D193K", type = "UR" },
                { name = "FD01", type = "UR" },
            }
        },
        ["NALUD2"] = {
            name = "NALUD2",
            runway = "RW01",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D197L", type = "UR" },
                { name = "CI01", type = "UR" },
            }
        },
        ["NALUD4"] = {
            name = "NALUD4",
            runway = "RW01",
            waypoints = {
                { name = "NALUD", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D193K", type = "UR" },
                { name = "CI01", type = "UR" },
            }
        },
        ["OSNI2A"] = {
            name = "OSNI2A",
            runway = "RW01",
            waypoints = {
                { name = "OSNIR", type = "UR" },
                { name = "GNV", type = "UR" },
            }
        },
        ["OSNI4A"] = {
            name = "OSNI4A",
            runway = "RW01",
            waypoints = {
                { name = "OSNIR", type = "UR" },
                { name = "GN", type = "UR" },
            }
        },
        ["RULA2C"] = {
            name = "RULA2C",
            runway = "RW01",
            waypoints = {
                { name = "RULAB", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D161L", type = "UR", altitude_min = 3050 },
                { name = "D174L", type = "UR" },
                { name = "D180L", type = "UR" },
                { name = "FD01", type = "UR" },
            }
        },
        ["RULA4C"] = {
            name = "RULA4C",
            runway = "RW01",
            waypoints = {
                { name = "RULAB", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D161M", type = "UR", altitude_min = 3050 },
                { name = "D181K", type = "UR" },
                { name = "D183K", type = "UR" },
                { name = "FD01", type = "UR" },
            }
        },
        ["RULAB2"] = {
            name = "RULAB2",
            runway = "RW01",
            waypoints = {
                { name = "RULAB", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D161L", type = "UR", altitude_min = 3050 },
                { name = "D174L", type = "UR" },
                { name = "D180L", type = "UR" },
                { name = "CI01", type = "UR" },
            }
        },
        ["RULAB4"] = {
            name = "RULAB4",
            runway = "RW01",
            waypoints = {
                { name = "RULAB", type = "UR", altitude_min = 7000, altitude_max = 10000 },
                { name = "D161M", type = "UR", altitude_min = 3050 },
                { name = "D181K", type = "UR" },
                { name = "D183K", type = "UR" },
                { name = "CI01", type = "UR" },
            }
        },
    },

    -- Процедуры захода на посадку
    APPROACH = {
        ["D01-U"] = {
            name = "D01-U",
            type = "A",
            runway = "D01-U",
            waypoints = {
                { name = "D137N", transition = "D137N", type = "UR" },
                { name = "", transition = "D137N", type = "" },
                { name = "D178L", transition = "D137N", type = "UR" },
                { name = "D189J", transition = "D137N", type = "UR" },
                { name = "FD01", transition = "D137N", type = "UR" },
                { name = "D194N", transition = "D194N", type = "UR" },
                { name = "D189J", transition = "D194N", type = "UR" },
                { name = "FD01", transition = "D194N", type = "UR" },
                { name = "D251N", transition = "D251N", type = "UR" },
                { name = "", transition = "D251N", type = "" },
                { name = "D200L", transition = "D251N", type = "UR" },
                { name = "D189J", transition = "D251N", type = "UR" },
                { name = "FD01", transition = "D251N", type = "UR" },
                { name = "D274N", transition = "D274N", type = "UR" },
                { name = "", transition = "D274N", type = "" },
                { name = "D200L", transition = "D274N", type = "UR" },
                { name = "D189J", transition = "D274N", type = "UR" },
                { name = "FD01", transition = "D274N", type = "UR" },
                { name = "FD01", transition = "", type = "UR" },
                { name = "MD01", transition = "", type = "UR" },
                { name = "", transition = "", type = "", speed = 200.0 },
                { name = "D219J", transition = "", type = "UR" },
            }
        },
        ["D01-V"] = {
            name = "D01-V",
            type = "A",
            runway = "D01-V",
            waypoints = {
                { name = "D137N", transition = "D137N", type = "UR" },
                { name = "", transition = "D137N", type = "" },
                { name = "D183L", transition = "D137N", type = "UR" },
                { name = "D189J", transition = "D137N", type = "UR" },
                { name = "FD01", transition = "D137N", type = "UR" },
                { name = "D194N", transition = "D194N", type = "UR" },
                { name = "D189J", transition = "D194N", type = "UR" },
                { name = "FD01", transition = "D194N", type = "UR" },
                { name = "D251N", transition = "D251N", type = "UR" },
                { name = "", transition = "D251N", type = "" },
                { name = "D195L", transition = "D251N", type = "UR" },
                { name = "D189J", transition = "D251N", type = "UR" },
                { name = "FD01", transition = "D251N", type = "UR" },
                { name = "D274N", transition = "D274N", type = "UR" },
                { name = "", transition = "D274N", type = "" },
                { name = "D195L", transition = "D274N", type = "UR" },
                { name = "D189J", transition = "D274N", type = "UR" },
                { name = "FD01", transition = "D274N", type = "UR" },
                { name = "FD01", transition = "", type = "UR" },
                { name = "MD012", transition = "", type = "UR" },
                { name = "", transition = "", type = "", speed = 145.0 },
                { name = "D167K", transition = "", type = "UR" },
            }
        },
        ["D01-W"] = {
            name = "D01-W",
            type = "A",
            runway = "D01-W",
            waypoints = {
                { name = "GNV", transition = "GNV", type = "UR" },
                { name = "GNV", transition = "GNV", type = "UR" },
                { name = "D189M", transition = "GNV", type = "UR" },
                { name = "FD01", transition = "GNV", type = "UR" },
                { name = "FD01", transition = "", type = "UR" },
                { name = "MD01", transition = "", type = "UR" },
                { name = "", transition = "", type = "", speed = 185.0 },
                { name = "D210M", transition = "", type = "UR" },
            }
        },
        ["D01-X"] = {
            name = "D01-X",
            type = "A",
            runway = "D01-X",
            waypoints = {
                { name = "GNV", transition = "GNV", type = "UR" },
                { name = "GNV", transition = "GNV", type = "UR" },
                { name = "D189M", transition = "GNV", type = "UR" },
                { name = "FD01", transition = "GNV", type = "UR" },
                { name = "FD01", transition = "", type = "UR" },
                { name = "MD012", transition = "", type = "UR" },
                { name = "", transition = "", type = "", speed = 145.0 },
                { name = "D181M", transition = "", type = "UR" },
            }
        },
        ["D01-Z"] = {
            name = "D01-Z",
            type = "D",
            runway = "D01-Z",
            waypoints = {
                { name = "FD01", transition = "", type = "UR" },
                { name = "MD01", transition = "", type = "UR" },
                { name = "", transition = "", type = "", speed = 185.0 },
                { name = "D212K", transition = "", type = "UR" },
            }
        },
        ["N01-Y"] = {
            name = "N01-Y",
            type = "A",
            runway = "N01-Y",
            waypoints = {
                { name = "GN", transition = "GN", type = "UR" },
                { name = "GN", transition = "GN", type = "UR" },
                { name = "FN01", transition = "GN", type = "UR" },
                { name = "FN01", transition = "", type = "UR" },
                { name = "MN01Y", transition = "", type = "UR" },
                { name = "GN", transition = "", type = "UR", altitude_min = 1462 },
                { name = "", transition = "", type = "" },
            }
        },
        ["N01-Z"] = {
            name = "N01-Z",
            type = "A",
            runway = "N01-Z",
            waypoints = {
                { name = "GN", transition = "GN", type = "UR" },
                { name = "GN", transition = "GN", type = "UR" },
                { name = "FN01", transition = "GN", type = "UR" },
                { name = "FN01", transition = "", type = "UR" },
                { name = "MN01Z", transition = "", type = "UR" },
                { name = "GN", transition = "", type = "UR", altitude_min = 1740 },
                { name = "", transition = "", type = "", speed = 205.0 },
            }
        },
        ["S01-Y"] = {
            name = "S01-Y",
            type = "S",
            runway = "S01-Y",
            waypoints = {
                { name = "FD01", transition = "", type = "UR" },
                { name = "MD012", transition = "", type = "UR" },
                { name = "", transition = "", type = "", speed = 145.0 },
                { name = "D177J", transition = "", type = "UR" },
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
