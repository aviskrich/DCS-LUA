-- Файл данных о STAR процедурах аэропорта Шарджа
-- @module OMSJ_STAR_Data

--- Таблица STAR процедур аэропорта Шарджа
-- Содержит детальное описание всех стандартных схем прибытия
OMSJ_STAR_Data = {
  -- STAR для ВПП 12
  RWY12 = {
    -- ULDOT ONE CHARLIE ARRIVAL
    ULDOT1C = {
      name = "ULDOT1C",
      description = "ULDOT ONE CHARLIE ARRIVAL",
      runway = "12",
      waypoints = {
        { name = "ULDOT", altitude = 10000, speed = 280, type = "FLY_BY" },
        { name = "RABLA", altitude = 7000, speed = 250, type = "FLY_BY" },
        { name = "HOLD1", altitude = 5000, speed = 220, type = "FLY_BY" },
        { name = "RW12_IAF1", altitude = 4000, speed = 200, type = "FLY_BY" },
        { name = "RW12_FAF", altitude = 3000, speed = 180, type = "FLY_OVER" }
      },
      restrictions = {
        initialAltitude = 10000,
        initialSpeed = 280,
        minAltitude = 3000,
        maxAltitude = 15000
      },
      notes = "Descend via STAR. Expect ILS approach runway 12."
    },
    
    -- TONVO ONE CHARLIE ARRIVAL
    TONVO1C = {
      name = "TONVO1C",
      description = "TONVO ONE CHARLIE ARRIVAL",
      runway = "12",
      waypoints = {
        { name = "TONVO", altitude = 10000, speed = 280, type = "FLY_BY" },
        { name = "RABLA", altitude = 7000, speed = 250, type = "FLY_BY" },
        { name = "HOLD1", altitude = 5000, speed = 220, type = "FLY_BY" },
        { name = "RW12_IAF2", altitude = 4000, speed = 200, type = "FLY_BY" },
        { name = "RW12_FAF", altitude = 3000, speed = 180, type = "FLY_OVER" }
      },
      restrictions = {
        initialAltitude = 10000,
        initialSpeed = 280,
        minAltitude = 3000,
        maxAltitude = 15000
      },
      notes = "Descend via STAR. Expect ILS approach runway 12."
    }
  },
  
  -- STAR для ВПП 30
  RWY30 = {
    -- IMDIL ONE TANGO ARRIVAL
    IMDIL1T = {
      name = "IMDIL1T",
      description = "IMDIL ONE TANGO ARRIVAL",
      runway = "30",
      waypoints = {
        { name = "IMDIL", altitude = 10000, speed = 280, type = "FLY_BY" },
        { name = "GETBO", altitude = 7000, speed = 250, type = "FLY_BY" },
        { name = "HOLD2", altitude = 5000, speed = 220, type = "FLY_BY" },
        { name = "RW30_IAF1", altitude = 4000, speed = 200, type = "FLY_BY" },
        { name = "RW30_FAF", altitude = 3000, speed = 180, type = "FLY_OVER" }
      },
      restrictions = {
        initialAltitude = 10000,
        initialSpeed = 280,
        minAltitude = 3000,
        maxAltitude = 15000
      },
      notes = "Descend via STAR. Expect ILS approach runway 30."
    },
    
    -- GETBO ONE TANGO ARRIVAL
    GETBO1T = {
      name = "GETBO1T",
      description = "GETBO ONE TANGO ARRIVAL",
      runway = "30",
      waypoints = {
        { name = "GETBO", altitude = 10000, speed = 280, type = "FLY_BY" },
        { name = "HOLD2", altitude = 5000, speed = 220, type = "FLY_BY" },
        { name = "RW30_IAF2", altitude = 4000, speed = 200, type = "FLY_BY" },
        { name = "RW30_FAF", altitude = 3000, speed = 180, type = "FLY_OVER" }
      },
      restrictions = {
        initialAltitude = 10000,
        initialSpeed = 280,
        minAltitude = 3000,
        maxAltitude = 15000
      },
      notes = "Descend via STAR. Expect ILS approach runway 30."
    }
  }
}

return OMSJ_STAR_Data
