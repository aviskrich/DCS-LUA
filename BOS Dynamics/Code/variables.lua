--MAIN DATA
cargoArray = {}
playersArray = {}
hubsArray = {} -- Хабы
airbasesArray = {} -- Воздушные базы
allZoneArray = {} -- все зоны

groups = {} -- Группы

Side = {
  RED = 1,
  BLUE = 2,
  NEUTRAL = 3
}

ZoneType = {
  HUB = 1,
  AIRBASE = 2
}

Sidenames = {"RED", "BLUE", "NEUTRAL"}

Alpha = 0.5

AirbaseRadius = 4000

SideColor = {
  RED = {1,0,0},
  BLUE = {0,0,1},
  NEUTRAL = {1,1,0},
  WHITE = {1,1,1}
}

ZoneInterval = 10
AiInterval = 30

suplaySurplus = 2
suplyLimit = 10000

supplyKgIndex = 2

---BLUE
BLUE = {
  INFANTRY = {
    LANDINGINFANTRY = {name = "LANDINGINFANTRY", cost = 300, spawner = SPAWN:New("LANDINGINFANTRY")} 
  },
  LANDDRLO = {
    FPS117 = {name = "FPS117", cost = 300, spawner = SPAWN:New("FPS117"):InitLimit( 3, 0 )} 
  },
  LIGHTARMOR = { 
    BRADLEY = {name = "BRADLEY", cost = 300, spawner = SPAWN:New("BRADLEY")},
    LANDINGHMMWV = {name = "LANDINGHMMWV", cost = 300, spawner = SPAWN:New("LANDINGHMMWV")} 
  },
  AAA = {
    VULCAN = {name ="VULCAN", cost = 300, spawner = SPAWN:New("VULCAN")},
  },
  SAM = {
    STRELA = {name = "AVANGER", cost = 400, spawner = SPAWN:New("AVANGER")},
    TOR = {name = "TOR", cost = 600, spawner = SPAWN:New("TORBLUE")},
    HAWK = {name = "HAWK", cost = 800, spawner = SPAWN:New("HAWK")},
  },
  AIRCRAFT = {
    AWACS = {name = "AWACS", cost = 100, spawner = SPAWN:New("AWACS"):InitLimit(1,0)}
  }
}

---RED
RED = {
  LANDDRLO = {
    L13 = {name = "L13", cost = 300, spawner = SPAWN:New("L13"):InitLimit( 3, 0 )} 
  },
  LIGHTARMOR = {
    BTR80 = {name = "BTR80", cost = 300, spawner = SPAWN:New("BTR80"):InitLimit( 40, 0 )}
  },
  AAA = {
    ZSU23 = {name ="ZSU23", cost = 300, spawner = SPAWN:New("ZSU23")}
  },
  SAM = {
    STRELA = {name = "STRELA", cost = 400, spawner = SPAWN:New("STRELA")},
    TOR = {name = "TOR", cost = 600, spawner = SPAWN:New("TOR")},
    BUK = {name = "BUK", cost = 800, spawner = SPAWN:New("BUK")},
  },
  ASSAULTAIRCRAFT = {
    SU25S = {name = "SU25S", cost = 200, spawner = SPAWN:New("SU25S")}
  },
  FIGHTERAIRCRAFT = {
    SU27 = {name = "SU27", cost = 600, spawner = SPAWN:New("SU27"):InitLimit( 8, 0 )}
  },
  ARMOR = {
    T72B3 = {name = "T72B3", cost = 500, spawner = SPAWN:New("T72B3"):InitLimit( 20, 0 )}
  } 
}

CARGOSTATIC = {
  SUPPLY = {
    CRATE = {name = "CargoSimple", spawner = SPAWNSTATIC:NewFromStatic( "CargoSimple", country.id.USA ):InitCargo(true):InitCargoMass(100), supply = true, nameText = "Припасы - 100кг.", cost = 100, value = 100},
    CRATE300 = {name = "CargoSimple300", spawner = SPAWNSTATIC:NewFromStatic( "CargoSimple", country.id.USA ):InitCargo(true):InitCargoMass(300), supply = true, nameText = "Припасы - 300кг.", cost = 300, value = 300},
    CRATE1000 = {name = "CargoSimple1000", spawner = SPAWNSTATIC:NewFromStatic( "CargoSimple", country.id.USA ):InitCargo(true):InitCargoMass(1000), supply = true, nameText = "Припасы - 1000кг.", cost = 1000, value = 1000},
    CRATEBUILDER = {
      name = "CargoBuilder", 
      spawner = SPAWNSTATIC:NewFromStatic( "CargoBuilder", country.id.USA), 
      spawnerUnit = SPAWN:New("FarpSupply"),
      nameText = "Части форпоста 1/3", 
      cost = 100, 
      value = 2000,
      parts = 3,
      static = true,
      allow = ZoneType.HUB
    },
    CRATEJETFUEL = {
      name = "JETFUELCARGO", 
      spawner = SPAWNSTATIC:NewFromStatic( "JETFUELCARGO", country.id.USA), 
      nameText = "Топливо", 
      cost = 100, 
      value = 1000,
      static = true,
      payload = {
        type = STORAGE.Liquid.JETFUEL,
        amount = 50000,
      },
      allow = ZoneType.HUB
    }
  },
  LANDING = {
    INFANTRYCRATE = {name = "INFANTRYCRATE", spawner = SPAWNSTATIC:NewFromStatic( "INFANTRYCRATE", country.id.USA ), cost = 50, spawnerUnit = SPAWN:New("LANDINGINFANTRY"), nameText = "Пехота", value = 700},
    HMMWVCRATE = {name = "HMMWVCRATE", spawner = SPAWNSTATIC:NewFromStatic( "LANDINGHMMWVSTATIC", country.id.USA ), cost = 70, spawnerUnit = SPAWN:New("LANDINGHMMWV"), nameText = "HMMWV", value = 3500},
    LANDINGMAXXPROCRATE = {name = "LANDINGMAXXPROCRATE", spawner = SPAWNSTATIC:NewFromStatic( "LANDINGMAXXPROSTATIC", country.id.USA ), cost = 80, spawnerUnit = SPAWN:New("LANDINGMAXXPRO"), nameText = "MRAP MaxxPro", value = 10000},
    LANDINGABRAMS = {
      name = "ABRAMS", 
      spawner = SPAWNSTATIC:NewFromStatic( "BIGCONTAINER", country.id.USA), 
      spawnerUnit = SPAWN:New("ABRAMS"),
      nameText = "M1A2C Abrams 1/4", 
      cost = 50, 
      value = 5000,
      parts = 4
    },
    BRADLEYCRATE = {
      name = "BRADLEYCRATE", 
      spawner = SPAWNSTATIC:NewFromStatic( "LANDINGBRADLEYSTATIC", country.id.USA ), 
      cost = 35, spawnerUnit = SPAWN:New("LANDINGDBRADLEY"), 
      nameText = "Bradley 1/3", 
      value = 3000,
      parts = 3
    },
    LINEBRACKERCRATE = {
      name = "LINEBRACKERCRATE", 
      spawner = SPAWNSTATIC:NewFromStatic( "LANDINGDLINEBRACKERSTATIC", country.id.USA ), 
      cost = 50, spawnerUnit = SPAWN:New("LANDINGDLINEBRACKER"), 
      nameText = "Linebracker 1/3", 
      value = 3000,
      parts = 3
    },
  }
}