--ВАЖНО!!!!: Не занимать слоты до снятия паузы
--           Не пересекать зоны между собой
--xyu pizda pizda xiuhhhh pizd ahan

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

-- Максимальное число FARP-ов на карте считая темплейт!!!
maxFARPCount = {
  [1] = 4, -- RED Coalition 
  [2] = 4  -- BLUE Coalition
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
    }
  }
}

CARGOUNITS = {
  RED = {
    CRATEAK = {
      name = "CargoAKRED", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("AKCARGORED", country.id.CJTF_RED), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("AKRED"):InitLimit( 30, 0 ), -- спаунер техиники (точное наименование группы)
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
      unitLifetime = 20*60 -- 20 минут время жизни юнита
    }
  },
  BLUE = {
    CRATEAK = {
      name = "CargoAKBLUE", -- уникальнео имя
      spawner = SPAWNSTATIC:NewFromStatic("AKCARGOBLUE", country.id.CJTF_BLUE), -- спаунер коробки (точное наименование статика для коробки)
      spawnerUnit = SPAWN:New("AKBLUE"):InitLimit( 30, 0 ), -- спаунер техиники (точное наименование группы)
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
      unitLifetime = 20*60 -- 20 минут время жизни юнита
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

