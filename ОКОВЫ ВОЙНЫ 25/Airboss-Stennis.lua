-- Нет меню настроек MOOSE. Закомментируйте эту строку, если необходимо.
_SETTINGS:SetPlayerMenuOff()

-- Самолёт-заправщик S-3B появляется в воздухе.
local tanker = RECOVERYTANKER:New("USS Stennis", "Texaco Group")
tanker:SetTakeoffAir()
tanker:SetRadio(250)
tanker:SetModex(511)
tanker:SetTACAN(1, "TKR")
tanker:__Start(1)

-- E-2D AWACS появляется на USS Stennis.
local awacs = RECOVERYTANKER:New("USS Stennis", "E-2D Wizard Group")
awacs:SetAWACS()
awacs:SetRadio(260)
awacs:SetAltitude(20000)
awacs:SetCallsign(CALLSIGN.AWACS.Wizard)
awacs:SetRacetrackDistances(30, 15)
awacs:SetModex(611)
awacs:SetTACAN(2, "WIZ")
awacs:__Start(1)

-- Спасательный вертолёт с домашней базой Lake Erie. Должен быть глобальным объектом!
local rescuehelo = RESCUEHELO:New("USS Stennis", "Rescue Helo")
rescuehelo:SetHomeBase(AIRBASE:FindByName("Lake Erie"))
rescuehelo:SetModex(42)
rescuehelo:__Start(1)

-- Создаём объект AIRBOSS.
local AirbossStennis = AIRBOSS:New("USS Stennis")

-- Добавляем окна посадки:
-- Режим Case I с 9 до 10 утра.
local window1 = AirbossStennis:AddRecoveryWindow("13:00", "14:00", 1, nil, true, 25)
-- Режим Case II с отклонением 15 градусов от 15:00 на 60 минут.
local window2 = AirbossStennis:AddRecoveryWindow("15:00", "17:00", 2, 15, true, 23)
-- Режим Case III с отклонением 30 градусов от 21:00 до 22:00.
local window3 = AirbossStennis:AddRecoveryWindow("20:00", "23:00", 3, 30, true, 21)

-- Устанавливаем папку со звуковыми файлами Airboss внутри файла miz.
AirbossStennis:SetSoundfilesFolder("Airboss Soundfiles/")

-- Оптимизация меню для единственного авианосца.
AirbossStennis:SetMenuSingleCarrier()

-- Меню капитана.
AirbossStennis:SetMenuRecovery(30, 20, false)

-- Удаляем приземлившиеся самолёты AI с палубы.
AirbossStennis:SetDespawnOnEngineShutdown()

-- Загружаем все сохранённые оценки игроков из папки "Saved Games\DCS" (если lfs был дезинфицирован).
AirbossStennis:Load()

-- Автоматически сохранять результаты игроков в папку "Saved Games\DCS" каждый раз, когда игрок получает итоговую оценку от LSO.
AirbossStennis:SetAutoSave()

-- Включить таблицу посадок.
AirbossStennis:SetTrapSheet()

-- Запустить класс Airboss.
AirbossStennis:Start()

--- Функция, вызываемая при запуске самолёта-заправщика.
function tanker:OnAfterStart(From, Event, To)
  -- Устанавливаем самолёт-заправщик.
  AirbossStennis:SetRecoveryTanker(tanker)

  -- Используем самолёт-заправщик как ретранслятор для передачи сообщений LSO.
  AirbossStennis:SetRadioRelayLSO(self:GetUnitName())
end

--- Функция, вызываемая при запуске самолёта ДРЛО.
function awacs:OnAfterStart(From, Event, To)
  -- Устанавливаем самолёт ДРЛО.
  AirbossStennis:SetAWACS(awacs)
end

--- Функция, вызываемая при запуске спасательного вертолёта.
function rescuehelo:OnAfterStart(From, Event, To)
  -- Используем спасательный вертолёт как ретранслятор для Маршала.
  AirbossStennis:SetRadioRelayMarshal(self:GetUnitName())
end

--- Функция, вызываемая, когда игрок получает оценку от LSO.
function AirbossStennis:OnAfterLSOGrade(From, Event, To, playerData, grade)
  local PlayerData = playerData -- Ops.Airboss#AIRBOSS.PlayerData
  local Grade = grade -- Ops.Airboss#AIRBOSS.LSOgrade

  ----------------------------------------
  --- Интерфейс вашего Discord-бота здесь! ---
  ----------------------------------------

  local score = tonumber(Grade.points)
  local name = tostring(PlayerData.name)

  -- Сообщаем оценку LSO в файл dcs.log.
  self:I(string.format("Player %s scored %.1f", name, score))
end