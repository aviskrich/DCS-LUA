-- Файл данных о процедурах захода на посадку аэропорта Шарджа
-- @module OMSJ_Approach_Data

--- Таблица процедур захода на посадку аэропорта Шарджа
-- Содержит детальное описание всех схем захода на посадку
OMSJ_Approach_Data = {
  -- Заходы для ВПП 12
  RWY12 = {
    -- ILS подход для ВПП 12
    ILS12 = {
      name = "ILS12",
      description = "ILS APPROACH RUNWAY 12",
      runway = "12",
      type = "ILS",
      frequency = 110.10,
      course = 120,
      waypoints = {
        { name = "RW12_IAF1", altitude = 4000, speed = 200, type = "FLY_BY" },
        { name = "RW12_FAF", altitude = 3000, speed = 180, type = "FLY_OVER" },
        { name = "RW12_THR", altitude = 50, speed = nil, type = "FLY_OVER" }
      },
      restrictions = {
        minAltitude = 3000,
        maxAltitude = 5000,
        minSpeed = 160,
        maxSpeed = 220,
        decisionHeight = 200
      },
      notes = "ILS frequency 110.10, course 120. Decision height 200ft."
    },
    
    -- VOR подход для ВПП 12
    VOR12 = {
      name = "VOR12",
      description = "VOR APPROACH RUNWAY 12",
      runway = "12",
      type = "VOR",
      frequency = 114.90,
      course = 120,
      waypoints = {
        { name = "RW12_IAF2", altitude = 4000, speed = 200, type = "FLY_BY" },
        { name = "RW12_FAF", altitude = 3000, speed = 180, type = "FLY_OVER" },
        { name = "RW12_THR", altitude = 50, speed = nil, type = "FLY_OVER" }
      ],
      restrictions = {
        minAltitude = 3000,
        maxAltitude = 5000,
        minSpeed = 160,
        maxSpeed = 220,
        minimumDescentAltitude = 500
      },
      notes = "VOR frequency 114.90, course 120. Minimum descent altitude 500ft."
    },
    
    -- RNAV подход для ВПП 12
    RNAV12 = {
      name = "RNAV12",
      description = "RNAV APPROACH RUNWAY 12",
      runway = "12",
      type = "RNAV",
      waypoints = {
        { name = "RW12_IAF1", altitude = 4000, speed = 200, type = "FLY_BY" },
        { name = "RW12_IAF2", altitude = 3500, speed = 190, type = "FLY_BY" },
        { name = "RW12_FAF", altitude = 3000, speed = 180, type = "FLY_OVER" },
        { name = "RW12_THR", altitude = 50, speed = nil, type = "FLY_OVER" }
      ],
      restrictions = {
        minAltitude = 3000,
        maxAltitude = 5000,
        minSpeed = 160,
        maxSpeed = 220,
        minimumDescentAltitude = 400
      },
      notes = "RNAV approach. Minimum descent altitude 400ft."
    }
  },
  
  -- Заходы для ВПП 30
  RWY30 = {
    -- ILS подход для ВПП 30
    ILS30 = {
      name = "ILS30",
      description = "ILS APPROACH RUNWAY 30",
      runway = "30",
      type = "ILS",
      frequency = 110.70,
      course = 300,
      waypoints = {
        { name = "RW30_IAF1", altitude = 4000, speed = 200, type = "FLY_BY" },
        { name = "RW30_FAF", altitude = 3000, speed = 180, type = "FLY_OVER" },
        { name = "RW30_THR", altitude = 50, speed = nil, type = "FLY_OVER" }
      ],
      restrictions = {
        minAltitude = 3000,
        maxAltitude = 5000,
        minSpeed = 160,
        maxSpeed = 220,
        decisionHeight = 200
      },
      notes = "ILS frequency 110.70, course 300. Decision height 200ft."
    },
    
    -- VOR подход для ВПП 30
    VOR30 = {
      name = "VOR30",
      description = "VOR APPROACH RUNWAY 30",
      runway = "30",
      type = "VOR",
      frequency = 114.90,
      course = 300,
      waypoints = {
        { name = "RW30_IAF2", altitude = 4000, speed = 200, type = "FLY_BY" },
        { name = "RW30_FAF", altitude = 3000, speed = 180, type = "FLY_OVER" },
        { name = "RW30_THR", altitude = 50, speed = nil, type = "FLY_OVER" }
      ],
      restrictions = {
        minAltitude = 3000,
        maxAltitude = 5000,
        minSpeed = 160,
        maxSpeed = 220,
        minimumDescentAltitude = 500
      },
      notes = "VOR frequency 114.90, course 300. Minimum descent altitude 500ft."
    },
    
    -- RNAV подход для ВПП 30
    RNAV30 = {
      name = "RNAV30",
      description = "RNAV APPROACH RUNWAY 30",
      runway = "30",
      type = "RNAV",
      waypoints = {
        { name = "RW30_IAF1", altitude = 4000, speed = 200, type = "FLY_BY" },
        { name = "RW30_IAF2", altitude = 3500, speed = 190, type = "FLY_BY" },
        { name = "RW30_FAF", altitude = 3000, speed = 180, type = "FLY_OVER" },
        { name = "RW30_THR", altitude = 50, speed = nil, type = "FLY_OVER" }
      ],
      restrictions = {
        minAltitude = 3000,
        maxAltitude = 5000,
        minSpeed = 160,
        maxSpeed = 220,
        minimumDescentAltitude = 400
      },
      notes = "RNAV approach. Minimum descent altitude 400ft."
    }
  }
}

return OMSJ_Approach_Data
