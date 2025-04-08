-- Файл данных о SID процедурах аэропорта Шарджа
-- @module OMSJ_SID_Data

--- Таблица SID процедур аэропорта Шарджа
-- Содержит детальное описание всех стандартных схем вылета
OMSJ_SID_Data = {
  -- SID для ВПП 12
  RWY12 = {
    -- ANVIX ONE CHARLIE DEPARTURE
    ANVIX1C = {
      name = "ANVIX1C",
      description = "ANVIX ONE CHARLIE DEPARTURE",
      runway = "12",
      waypoints = {
        { name = "RW12_THR", altitude = nil, speed = nil, type = "FLY_OVER" },
        { name = "ANVIX", altitude = 5000, speed = 250, type = "FLY_BY" },
        { name = "KUKLA", altitude = 10000, speed = nil, type = "FLY_BY" }
      },
      restrictions = {
        initialAltitude = 5000,
        initialSpeed = 250,
        minAltitude = 3000,
        maxAltitude = 10000
      },
      notes = "Climb via SID to 5000ft. Expect further climb after ANVIX."
    },
    
    -- DESDI ONE CHARLIE DEPARTURE
    DESDI1C = {
      name = "DESDI1C",
      description = "DESDI ONE CHARLIE DEPARTURE",
      runway = "12",
      waypoints = {
        { name = "RW12_THR", altitude = nil, speed = nil, type = "FLY_OVER" },
        { name = "DESDI", altitude = 5000, speed = 250, type = "FLY_BY" },
        { name = "RANBI", altitude = 10000, speed = nil, type = "FLY_BY" }
      },
      restrictions = {
        initialAltitude = 5000,
        initialSpeed = 250,
        minAltitude = 3000,
        maxAltitude = 10000
      },
      notes = "Climb via SID to 5000ft. Expect further climb after DESDI."
    },
    
    -- EMERU ONE CHARLIE DEPARTURE
    EMERU1C = {
      name = "EMERU1C",
      description = "EMERU ONE CHARLIE DEPARTURE",
      runway = "12",
      waypoints = {
        { name = "RW12_THR", altitude = nil, speed = nil, type = "FLY_OVER" },
        { name = "EMERU", altitude = 5000, speed = 250, type = "FLY_BY" },
        { name = "NABIX", altitude = 10000, speed = nil, type = "FLY_BY" }
      },
      restrictions = {
        initialAltitude = 5000,
        initialSpeed = 250,
        minAltitude = 3000,
        maxAltitude = 10000
      },
      notes = "Climb via SID to 5000ft. Expect further climb after EMERU."
    }
  },
  
  -- SID для ВПП 30
  RWY30 = {
    -- GIDIS ONE TANGO DEPARTURE
    GIDIS1T = {
      name = "GIDIS1T",
      description = "GIDIS ONE TANGO DEPARTURE",
      runway = "30",
      waypoints = {
        { name = "RW30_THR", altitude = nil, speed = nil, type = "FLY_OVER" },
        { name = "GIDIS", altitude = 5000, speed = 250, type = "FLY_BY" },
        { name = "LOVOL", altitude = 10000, speed = nil, type = "FLY_BY" }
      },
      restrictions = {
        initialAltitude = 5000,
        initialSpeed = 250,
        minAltitude = 3000,
        maxAltitude = 10000
      },
      notes = "Climb via SID to 5000ft. Expect further climb after GIDIS."
    },
    
    -- IVURO ONE TANGO DEPARTURE
    IVURO1T = {
      name = "IVURO1T",
      description = "IVURO ONE TANGO DEPARTURE",
      runway = "30",
      waypoints = {
        { name = "RW30_THR", altitude = nil, speed = nil, type = "FLY_OVER" },
        { name = "IVURO", altitude = 5000, speed = 250, type = "FLY_BY" },
        { name = "RANBI", altitude = 10000, speed = nil, type = "FLY_BY" }
      },
      restrictions = {
        initialAltitude = 5000,
        initialSpeed = 250,
        minAltitude = 3000,
        maxAltitude = 10000
      },
      notes = "Climb via SID to 5000ft. Expect further climb after IVURO."
    },
    
    -- LAGSA ONE TANGO DEPARTURE
    LAGSA1T = {
      name = "LAGSA1T",
      description = "LAGSA ONE TANGO DEPARTURE",
      runway = "30",
      waypoints = {
        { name = "RW30_THR", altitude = nil, speed = nil, type = "FLY_OVER" },
        { name = "LAGSA", altitude = 5000, speed = 250, type = "FLY_BY" },
        { name = "NABIX", altitude = 10000, speed = nil, type = "FLY_BY" }
      },
      restrictions = {
        initialAltitude = 5000,
        initialSpeed = 250,
        minAltitude = 3000,
        maxAltitude = 10000
      },
      notes = "Climb via SID to 5000ft. Expect further climb after LAGSA."
    }
  }
}

return OMSJ_SID_Data
