--ВАЖНО!!!!: Не занимать слоты до снятия паузы
--           Не пересекать зоны между собой
--xyu pizda

--Имена зон для захвата
zoneNames = {
  'Zone-1',
  'Zone-2',
  'Zone-3',
  'Zone-4',
  'Zone-5',
  'Zone-6',
  'Zone-7',
  'Zone-8',
  'Zone-9',
  'Zone-10',
  'Zone-11',
  'Zone-12',
  'Zone-13',
  'Zone-14',
  'Zone-15',
  'Zone-16',
  'Zone-17',
  'Zone-18',
  'Zone-19',
  'Zone-20',
  'Zone-21',
  'Zone-22',
  'Zone-23',
  'Zone-24',
  'Zone-25',
  'Zone-26',
  'Zone-27',
  'Zone-28',
  'Zone-29',
  'Zone-30',
  'Zone-31',
  'Zone-32',
  'Zone-33',
  'Zone-34',
  'Zone-35',
  'Zone-36',
  'Zone-37',
  'Zone-38',
  'Zone-39',
  'Zone-40',
  'Zone-41',
  'Zone-42',
  'Zone-43',
  'Zone-44',
  'Zone-45',
  'Zone-46',
  'Zone-47',
  'Zone-48',
  'Zone-49',
  'Zone-50',
  'Zone-51',
  'Zone-52',
  'Zone-53',
  'Zone-54',
  'Zone-55',
  'Zone-56',
  'Zone-57',
  'Zone-58',
  'Zone-59',
  'Zone-60',
  'Zone-61',
  'Zone-62',
  'Zone-63',
  'Zone-64',
  'Zone-65',
  'Zone-66',
  'Zone-67',
  'Zone-68',
  'Zone-69',
  'Zone-70',
  'Zone-71',
  'Zone-72',
  'Zone-73',
  'Zone-80'
}

--Имена зон для погрузки
zoneCargo = {
  'Zone-1',
  'Zone-3',
  'Zone-4',
  'Zone-74',
  'Zone-75',
  'Zone-76',
  'Zone-77',
  'Zone-78',
  'Zone-79',
  'Zone-80'
}

-- Максимальное число FARP-ов на карте (не считая темплейта)
maxFARPCount = {
  [1] = 3, -- RED Coalition
  [2] = 3  -- BLUE Coalition
}

--ГРУЗЫ
CARGOSTATIC = {
  RED = {
    CRATEFARP = {
      name = "FARPPADRED", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("1FARPPADCARGORED", country.id.CJTF_RED), -- спаунер коробки (точное наименование статика для коробки)
      -- spawnerUnit = SPAWN:New("FARPPADSTUFFRED"), -- спаунер техиники (точное наименование группы)
      constructionSpawner = { -- спаунер строительства FARPa
        spawnFarp    = SPAWNSTATIC:NewFromStatic("RDYNFARP_TEMPLATE", country.id.CJTF_RED),      -- сам фарп
        spawnPalatka = SPAWNSTATIC:NewFromStatic("RFARP_PALATKA_TEMPLATE", country.id.CJTF_RED), -- палатка
        spawnFlag    = SPAWNSTATIC:NewFromStatic("RFLAG_TEMPLATE", country.id.CJTF_RED),         -- статик коробки
        spawnShinaLT = SPAWNSTATIC:NewFromStatic("RSHINA_TEMPLATE_LT", country.id.CJTF_RED),     -- статик шины
        spawnShinaRT = SPAWNSTATIC:NewFromStatic("RSHINA_TEMPLATE_RT", country.id.CJTF_RED),     -- статик шины
        spawnShineLB = SPAWNSTATIC:NewFromStatic("RSHINA_TEMPLATE_LB", country.id.CJTF_RED),     -- статик шины
        spawnShinaRB = SPAWNSTATIC:NewFromStatic("RSHINA_TEMPLATE_RB", country.id.CJTF_RED)      -- статик шины
      },
      cargoType = 'FARPPAD',
      nameText = "Фарп площадка", -- Название (для меню)
      value = 3000, -- Вес
      static = true,
    },
    CRATEBUILDER = {
      name = "FARPRED", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("2FARPCARGORED", country.id.CJTF_RED), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("FARPSTUFFRED"), -- спаунер техиники (точное наименование группы)
      cargoType = 'FARPSTUFF',
      nameText = "Машины снабжения фарпа", -- Название (для меню)
      value = 3000, -- Вес
      static = true,
      limitedDistanceFromBASE = 150, -- ограничение на расстояние от базы
    },
    CRATEFUEL = {
      name = "FUELRED", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("FUELCARGORED", country.id.CJTF_RED), -- спаунер коробки (точное наименование статика для коробки)
      nameText = "Топливо", -- Название (для меню)
      cargoType = "liquid", -- тип груза топливо или амуниция (liquid/ammo)
      content = { -- содержание груза (тип, количество)
        { type = STORAGE.Liquid.JETFUEL, count = 3000 }
      },
      value = 3000, -- вес коробки
      static = true,
    },
    CRATENAR = {
      name = "CargoNarRED", -- уникальное имя
      spawner = SPAWNSTATIC:NewFromStatic("NARCARGORED", country.id.CJTF_RED),
      nameText = "НАР и cнаряды",
      cargoType = "ammo", -- тип груза топливо или амуниция в т.ч. борты (liquid/ammo)
      content = {
        { type = ENUMS.Storage.weapons.Gazelle.GIAT_M261_APHE,  count = 1 },
        { type = ENUMS.Storage.weapons.Gazelle.GIAT_M261_HEAP,  count = 1 },
        { type = ENUMS.Storage.weapons.OH58.MG_M3P500,  count = 1 },
        { type = ENUMS.Storage.weapons.UH1H.M134_MiniGun_Right,  count = 1 },
        { type = ENUMS.Storage.weapons.UH1H.M134_MiniGun_Left,  count = 1 },
        { type = ENUMS.Storage.weapons.UH1H.M60_MG_Left_Door,  count = 1 },
        { type = ENUMS.Storage.weapons.UH1H.M60_MG_Right_Door,  count = 1 },
        { type = ENUMS.Storage.weapons.CH47.CH47_PORT_M240H,  count = 1 },
        { type = ENUMS.Storage.weapons.CH47.CH47_STBD_M240H,  count = 1 },
        { type = ENUMS.Storage.weapons.CH47.CH47_AFT_M240H,  count = 1 },
        { type = {4, 15, 46, 170},  count = 2 }, -- Гув
        { type = {4, 15, 46, 20},  count = 2 },  -- УПК
        { type = {4, 15, 46, 183},  count = 1 }, -- КОРД
        { type = {4, 15, 46, 184},  count = 1 }, -- ПКТ
        { type = "weapons.nurs.HYDRA_70_M151",  count = 40 },
        { type = "weapons.nurs.HYDRA_70_M257",  count = 20 },
        { type = "weapons.nurs.HYDRA_70_MK5",  count = 40 },
        { type = "weapons.nurs.C_8",  count = 40 },
        { type = "weapons.nurs.C_8OFP2",  count = 40 },
        { type = "weapons.nurs.C_8OM",  count = 20 },
        { type = "weapons.nurs.S-24B",  count = 4 },
        { type = "weapons.nurs.SNEB_TYPE257_H1",  count = 20 },
        { type = "weapons.nurs.SNEB_TYPE259E_H1",  count = 20 }
      },
      value = 3000,
      static = true,
    },
    CRATEMISSLE = {
      name = "CargoMissleRED", -- уникальное имя
      spawner = SPAWNSTATIC:NewFromStatic("MISSLECARGORED", country.id.CJTF_RED),
      nameText = "Ракеты",
      cargoType = "ammo", -- тип груза топливо или амуниция в т.ч. борты (liquid/ammo)
      content = {
        { type = "weapons.missiles.Mistral",  count = 4 },
        { type = "weapons.missiles.OH58D_FIM_92",  count = 4 },
        { type = "weapons.missiles.P_60",  count = 4 },
        { type = "weapons.missiles.AT_6",  count = 8 },
        { type = "weapons.missiles.HOT3_MBDA",  count = 8 },
      },
      value = 3000,
      static = true,
    }
  },
  BLUE = {
    CRATEFARP = {
      name = "FARPPADBLUE", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("1FARPPADCARGOBLUE", country.id.CJTF_BLUE), -- спаунер коробки (точное наименование статика для коробки)
      -- spawnerUnit = SPAWN:New("FARPPADSTUFFBLUE"), -- спаунер техиники (точное наименование группы)
      constructionSpawner = { -- спаунер строительства FARPa
        spawnFarp    = SPAWNSTATIC:NewFromStatic("BDYNFARP_TEMPLATE", country.id.CJTF_BLUE),      -- сам фарп
        spawnPalatka = SPAWNSTATIC:NewFromStatic("BFARP_PALATKA_TEMPLATE", country.id.CJTF_BLUE), -- палатка
        spawnFlag    = SPAWNSTATIC:NewFromStatic("BFLAG_TEMPLATE", country.id.CJTF_BLUE),         -- статик коробки
        spawnShinaLT = SPAWNSTATIC:NewFromStatic("BSHINA_TEMPLATE_LT", country.id.CJTF_BLUE),     -- статик шины
        spawnShinaRT = SPAWNSTATIC:NewFromStatic("BSHINA_TEMPLATE_RT", country.id.CJTF_BLUE),     -- статик шины
        spawnShineLB = SPAWNSTATIC:NewFromStatic("BSHINA_TEMPLATE_LB", country.id.CJTF_BLUE),     -- статик шины
        spawnShinaRB = SPAWNSTATIC:NewFromStatic("BSHINA_TEMPLATE_RB", country.id.CJTF_BLUE)      -- статик шины
      },
      cargoType = 'FARPPAD',
      nameText = "Фарп площадка", -- Название (для меню)
      value = 3000, -- Вес
      static = true,
    },
    CRATEBUILDER = {
      name = "FARPBLUE", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("2FARPCARGOBLUE", country.id.CJTF_BLUE), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("FARPSTUFFBLUE"), -- спаунер техиники (точное наименование группы)
      cargoType = 'FARPSTUFF',
      nameText = "Машины снабжения фарпа", -- Название (для меню)
      value = 3000, -- Вес
      static = true,
      limitedDistanceFromBASE = 150, -- ограничение на расстояние от базы
    },
    CRATEFUEL = {
      name = "FUELBLUE", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("FUELCARGOBLUE", country.id.CJTF_BLUE), -- спаунер коробки (точное наименование статика для коробки)
      nameText = "Топливо", -- Название (для меню)
      cargoType = "liquid", -- тип груза топливо или амуниция (liquid/ammo)
      content = { -- содержание груза (тип, количество)
        { type = STORAGE.Liquid.JETFUEL, count = 3000 }
      },
      value = 3000, -- вес коробки
      static = true,
    },
    
    CRATENAR = {
      name = "CargoNarBLUE", -- уникальное имя
      spawner = SPAWNSTATIC:NewFromStatic("NARCARGOBLUE", country.id.CJTF_BLUE),
      nameText = "НАР и cнаряды",
      cargoType = "ammo", -- тип груза топливо или амуниция в т.ч. борты (liquid/ammo)
      content = {
        { type = ENUMS.Storage.weapons.Gazelle.GIAT_M261_APHE,  count = 1 },
        { type = ENUMS.Storage.weapons.Gazelle.GIAT_M261_HEAP,  count = 1 },
        { type = ENUMS.Storage.weapons.OH58.MG_M3P500,  count = 1 },
        { type = ENUMS.Storage.weapons.UH1H.M134_MiniGun_Right,  count = 1 },
        { type = ENUMS.Storage.weapons.UH1H.M134_MiniGun_Left,  count = 1 },
        { type = ENUMS.Storage.weapons.UH1H.M60_MG_Left_Door,  count = 1 },
        { type = ENUMS.Storage.weapons.UH1H.M60_MG_Right_Door,  count = 1 },
        { type = ENUMS.Storage.weapons.CH47.CH47_PORT_M240H,  count = 1 },
        { type = ENUMS.Storage.weapons.CH47.CH47_STBD_M240H,  count = 1 },
        { type = ENUMS.Storage.weapons.CH47.CH47_AFT_M240H,  count = 1 },
        { type = {4, 15, 46, 170},  count = 2 }, -- Гув 
        { type = {4, 15, 46, 20},  count = 2 }, -- УПК 
        { type = {4, 15, 46, 183},  count = 1 }, -- Корд 
        { type = {4, 15, 46, 184},  count = 1 }, --ПКТ
        { type = "weapons.nurs.HYDRA_70_M151",  count = 40 },
        { type = "weapons.nurs.HYDRA_70_M257",  count = 20 },
        { type = "weapons.nurs.HYDRA_70_MK5",  count = 40 },
        { type = "weapons.nurs.C_8",  count = 40 },
        { type = "weapons.nurs.C_8OFP2",  count = 40 },
        { type = "weapons.nurs.C_8OM",  count = 20 },
        { type = "weapons.nurs.S-24B",  count = 4 },
        { type = "weapons.nurs.SNEB_TYPE257_H1",  count = 20 },
        { type = "weapons.nurs.SNEB_TYPE259E_H1",  count = 20 }
      },
      value = 3000,
      static = true,
    },
    CRATEMISSLE = {
      name = "CargoMissleBLUE", -- уникальное имя
      spawner = SPAWNSTATIC:NewFromStatic("MISSLECARGOBLUE", country.id.CJTF_BLUE),
      nameText = "Ракеты",
      cargoType = "ammo", -- тип груза топливо или амуниция в т.ч. борты (liquid/ammo)
      content = {
        { type = "weapons.missiles.Mistral",  count = 4 },
        { type = "weapons.missiles.OH58D_FIM_92",  count = 4 },
        { type = "weapons.missiles.P_60",  count = 4 },
        { type = "weapons.missiles.AT_6",  count = 8 },
        { type = "weapons.missiles.HOT3_MBDA",  count = 8 },
      },
      value = 3000,
      static = true,
    }
  }
}

CARGOUNITS = {
  RED = {
    CRATEAK = {
      name = "CargoAKRED", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("AKCARGORED", country.id.CJTF_RED), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("AKRED"):InitLimit( 60, 0 ), -- спаунер техиники (точное наименование группы)
      nameText = "Взвод пехоты", -- Название (для меню)
      value = 1500, -- Вес
      static = true,
    },
    CRATERPG = {
      name = "CargoRPGRED", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("RPGCARGORED", country.id.CJTF_RED), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("RPGRED"):InitLimit( 25, 0 ), -- спаунер техиники (точное наименование группы)
      nameText = "Взвод РПГ", -- Название (для меню)
      value = 1500, -- Вес
      static = true,
    },
    CRATEIGLA = {
      name = "CargoIGLARED", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("IGLACARGORED", country.id.CJTF_RED), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("IGLARED"):InitLimit( 9, 0 ), -- спаунер техиники (точное наименование группы)
      nameText = "Взвод ПЗРК", -- Название (для меню)
      value = 1500, -- Вес
      static = true,
    },
    CRATEZU23 = {
      name = "CargoZU23RED", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("ZU23CARGORED", country.id.CJTF_RED), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("ZU23RED"):InitLimit( 5, 0 ), -- спаунер техиники (точное наименование группы)
      nameText = "Орудие ЗУ-23", -- Название (для меню)
      value = 3000, -- Вес
      static = true,
    },
    CRATEKC19 = {
      name = "CargoKC19RED", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("KC19CARGORED", country.id.CJTF_RED), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("KC19RED"):InitLimit( 5, 0 ), -- спаунер техиники (точное наименование группы)
      nameText = "Орудие КС-19", -- Название (для меню)
      value = 9000, -- Вес
      static = true,
    },
    CRATEREARM = {
      name = "CargoRearmRED", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("REARMCARGORED", country.id.CJTF_RED), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("REARMRED"):InitLimit( 20, 0 ), -- спаунер техиники (точное наименование группы)
      nameText = "Боеприпасы для техники", -- Название (для меню)
      value = 3000, -- Вес
      static = true,
      unitLifetime = 10 -- 20 минут время жизни юнита
    }
  },
  BLUE = {
    CRATEAK = {
      name = "CargoAKBLUE", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("AKCARGOBLUE", country.id.CJTF_BLUE), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("AKBLUE"):InitLimit( 60, 0 ), -- спаунер техиники (точное наименование группы)
      nameText = "Взвод пехоты", -- Название (для меню)
      value = 1500, -- Вес
      static = true,
    },
    CRATERPG = {
      name = "CargoRPGBLUE", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("RPGCARGOBLUE", country.id.CJTF_BLUE), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("RPGBLUE"):InitLimit( 25, 0 ), -- спаунер техиники (точное наименование группы)
      nameText = "Взвод РПГ", -- Название (для меню)
      value = 1500, -- Вес
      static = true,
    },
    CRATEIGLA = {
      name = "CargoIGLABLUE", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("IGLACARGOBLUE", country.id.CJTF_BLUE), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("IGLABLUE"):InitLimit( 9, 0 ), -- спаунер техиники (точное наименование группы)
      nameText = "Взвод ПЗРК", -- Название (для меню)
      value = 1500, -- Вес
      static = true,
    },
    CRATEZU23 = {
      name = "CargoZU23BLUE", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("ZU23CARGOBLUE", country.id.CJTF_BLUE), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("ZU23BLUE"):InitLimit( 5, 0 ), -- спаунер техиники (точное наименование группы)
      nameText = "Орудие ЗУ-23", -- Название (для меню)
      value = 3000, -- Вес
      static = true,
    },
    CRATEKC19 = {
      name = "CargoKC19BLUE", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("KC19CARGOBLUE", country.id.CJTF_BLUE), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("KC19BLUE"):InitLimit( 5, 0 ), -- спаунер техиники (точное наименование группы)
      nameText = "Орудие КС-19", -- Название (для меню)
      value = 9000, -- Вес
      static = true,
    },
    CRATEREARM = {
      name = "CargoRearmBLUE", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("REARMCARGOBLUE", country.id.CJTF_BLUE), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("REARMBLUE"):InitLimit( 20, 0 ), -- спаунер техиники (точное наименование группы)
      nameText = "Боеприпасы для техники", -- Название (для меню)
      value = 3000, -- Вес
      static = true,
      unitLifetime = 10 -- 20 минут время жизни юнита
    }
  }
}

oprint = print -- origin print
print = function(...)
  if (... == true) then return trigger.action.outText("true", 40) end
  if (... == false) then return trigger.action.outText("false", 40) end
  if type(...) == "table" then
    local str = ''
    local amount = 0
    for i, v in pairs(...) do
      amount = amount + 1
      local pre = type(i) == "string" and i .. "=" or ""
      str = str .. pre .. tostring(v) .. "\t"
    end
    trigger.action.outText(str, 40)
  else
    trigger.action.outText(..., 40)
  end
end

function Chance(percentage)
  local randomValue = math.random(100) -- Генерирует случайное число от 1 до 100
  return randomValue <= percentage
end

