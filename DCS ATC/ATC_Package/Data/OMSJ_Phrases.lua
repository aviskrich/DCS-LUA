-- Файл фраз для диспетчерских служб аэропорта Шарджа
-- @module OMSJ_Phrases

--- Таблица фраз для диспетчерских служб
-- Содержит шаблоны фраз для различных ситуаций и команд
OMSJ_Phrases = {
  -- Общие фразы
  COMMON = {
    RADIO_CHECK = "%s, %s, reading you %s",
    WEATHER_INFO = "%s, %s, wind %s at %s, temperature %s degrees, QNH %s",
    ACTIVE_RUNWAY = "%s, %s, runway in use %s",
    CONTACT_FREQUENCY = "%s, %s, contact %s on %s, good day",
    RADAR_CONTACT = "%s, %s, radar contact, %s, QNH %s",
    RADAR_SERVICE_TERMINATED = "%s, %s, radar service terminated, frequency change approved, good day",
    STANDBY = "%s, %s, standby",
    NEGATIVE = "%s, %s, negative",
    AFFIRM = "%s, %s, affirm",
    SAY_AGAIN = "%s, %s, say again",
    CORRECTION = "%s, %s, correction, %s"
  },
  
  -- Фразы Tower
  TWR = {
    STARTUP_APPROVED = "%s, %s, startup approved at %s, %s, runway in use %s, QNH %s",
    STARTUP_DENIED = "%s, %s, startup denied, %s",
    TAXI_CLEARANCE = "%s, %s, taxi to holding point %s via taxiway %s for runway %s",
    TAXI_DENIED = "%s, %s, hold position, %s",
    TAKEOFF_CLEARANCE = "%s, %s, wind %s at %s, runway %s, cleared for takeoff",
    TAKEOFF_DENIED = "%s, %s, hold position, %s",
    LANDING_CLEARANCE = "%s, %s, wind %s at %s, runway %s, cleared to land",
    LANDING_DENIED = "%s, %s, go around, %s",
    GO_AROUND = "%s, %s, go around, I say again, go around, %s",
    WELCOME = "%s, %s, welcome to Sharjah, taxi to parking %s via taxiway %s",
    LINEUP_WAIT = "%s, %s, line up and wait runway %s",
    EXPEDITE = "%s, %s, expedite %s due to %s",
    HOLD_SHORT = "%s, %s, hold short of runway %s",
    CROSS_RUNWAY = "%s, %s, cross runway %s, %s"
  },
  
  -- Фразы Approach
  APP = {
    STAR_CLEARANCE = "%s, %s, cleared for %s arrival, runway %s in use, descend to %s, QNH %s",
    APPROACH_CLEARANCE_ILS = "%s, %s, cleared for ILS approach runway %s, maintain %s until established on localizer, frequency %s",
    APPROACH_CLEARANCE_VOR = "%s, %s, cleared for VOR approach runway %s, maintain %s until established on final, frequency %s",
    APPROACH_CLEARANCE_RNAV = "%s, %s, cleared for %s approach runway %s, maintain %s until established on final",
    VECTORS_INITIAL = "%s, %s, vectors for %s approach runway %s, turn heading %s, descend to %s",
    VECTORS_TURN = "%s, %s, turn heading %s, maintain %s",
    VECTORS_FINAL = "%s, %s, turn heading %s for final approach, cleared for %s approach runway %s, contact Tower on %s when established",
    HOLD_INSTRUCTIONS = "%s, %s, hold at %s, %s, maintain %s, expect approach clearance at %s",
    DESCEND = "%s, %s, descend to %s",
    MAINTAIN = "%s, %s, maintain %s",
    EXPECT_APPROACH = "%s, %s, expect %s approach runway %s",
    TRAFFIC_INFO = "%s, %s, traffic at %s o'clock, %s miles, %s, %s"
  },
  
  -- Фразы Departure
  DEP = {
    SID_CLEARANCE = "%s, %s, cleared %s departure, climb to %s, squawk %s",
    CLIMB_CLEARANCE = "%s, %s, climb to %s",
    MAINTAIN_HEADING = "%s, %s, maintain heading %s",
    TURN_HEADING = "%s, %s, turn heading %s",
    RESUME_OWN_NAVIGATION = "%s, %s, resume own navigation direct to %s",
    CONTACT_CENTER = "%s, %s, contact Emirates Center on %s, good day",
    MAINTAIN_SPEED = "%s, %s, maintain %s",
    INCREASE_SPEED = "%s, %s, increase speed to %s",
    REDUCE_SPEED = "%s, %s, reduce speed to %s",
    SQUAWK_IDENT = "%s, %s, squawk %s and ident",
    TRAFFIC_ALERT = "%s, %s, traffic alert, %s"
  },
  
  -- Фразы для распознавания речи (ключевые слова)
  STT_KEYWORDS = {
    -- Общие
    RADIO_CHECK = {"radio check", "how do you read", "radio check"},
    WEATHER = {"weather", "information", "conditions", "QNH"},
    RUNWAY = {"runway", "active runway", "runway in use"},
    READBACK = {"readback", "read back", "confirm"},
    
    -- Tower
    STARTUP = {"startup", "start up", "engine start", "starting engines"},
    TAXI = {"taxi", "taxiing", "request taxi"},
    TAKEOFF = {"takeoff", "take off", "departure", "ready for departure"},
    LANDING = {"landing", "land", "final", "on final"},
    VACATE = {"vacate", "clear of runway", "runway vacated"},
    
    -- Approach
    STAR = {"STAR", "arrival", "arriving"},
    APPROACH = {"approach", "ILS", "VOR", "RNAV", "visual"},
    VECTORS = {"vectors", "vector", "heading"},
    DESCEND = {"descend", "descent", "lower altitude", "down to"},
    
    -- Departure
    SID = {"SID", "departure", "departing"},
    CLIMB = {"climb", "climbing", "higher altitude", "up to"},
    DIRECT = {"direct", "direct to", "proceed to"},
    SPEED = {"speed", "mach", "knots"}
  }
}

return OMSJ_Phrases
