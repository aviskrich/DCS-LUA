-- Файл данных о частотах аэропорта Шарджа
-- @module OMSJ_Frequencies

--- Таблица частот аэропорта Шарджа
-- Содержит все частоты, используемые диспетчерскими службами и навигационными средствами
OMSJ_Frequencies = {
  -- Диспетчерские службы
  ATC = {
    ["ATIS"] = { frequency = 126.75, modulation = 0, callsign = "Sharjah Information" },
    ["GND"] = { frequency = 121.90, modulation = 0, callsign = "Sharjah Ground" },
    ["TWR"] = { frequency = 118.60, modulation = 0, callsign = "Sharjah Tower" },
    ["APP"] = { frequency = 120.25, modulation = 0, callsign = "Sharjah Approach" },
    ["DEP"] = { frequency = 126.20, modulation = 0, callsign = "Sharjah Departure" },
    ["CTR"] = { frequency = 124.50, modulation = 0, callsign = "Emirates Control" }
  },
  
  -- Навигационные средства
  NAV = {
    -- ILS
    ["ILS12"] = { frequency = 110.10, modulation = 0, callsign = "ISRJ", course = 120 },
    ["ILS30"] = { frequency = 110.70, modulation = 0, callsign = "ISRJ", course = 300 },
    
    -- VOR/DME
    ["SHJ"] = { frequency = 114.90, modulation = 0, callsign = "SHJ", type = "VOR/DME" },
    
    -- NDB
    ["SJ"] = { frequency = 350.00, modulation = 0, callsign = "SJ", type = "NDB" }
  },
  
  -- Аварийные частоты
  EMERGENCY = {
    ["GUARD"] = { frequency = 121.50, modulation = 0, callsign = "Guard" },
    ["ALTERNATE"] = { frequency = 243.00, modulation = 0, callsign = "Military Guard" }
  },
  
  -- Соседние аэропорты
  NEARBY = {
    ["OMDB_APP"] = { frequency = 124.90, modulation = 0, callsign = "Dubai Approach" },
    ["OMDB_TWR"] = { frequency = 118.75, modulation = 0, callsign = "Dubai Tower" },
    ["OMAA_APP"] = { frequency = 120.10, modulation = 0, callsign = "Abu Dhabi Approach" },
    ["OMAA_TWR"] = { frequency = 119.20, modulation = 0, callsign = "Abu Dhabi Tower" }
  }
}

return OMSJ_Frequencies
