-- Таблица для хранения информации о выключенных AWACS
DisabledAWACS = {}

-- Функция для отключения всех AWACS
function DisableAllAWACS()
    local awacsSet = SET_GROUP:New():FilterPrefixes("AWACS"):FilterStart()
    awacsSet:ForEachGroup(function(group)
        local groupName = group:GetName()
        local groupTemplate = group:GetTemplate()
        -- Сохраняем шаблон группы для последующего включения
        DisabledAWACS[groupName] = groupTemplate
        group:Explode(100)
        if (group) then 
            group:Destroy()
        end
    end)
    MESSAGE:New("Все AWACS отключены.", 10):ToAll()
end

-- Функция для включения всех AWACS
function EnableAllAWACS()
    for groupName, groupTemplate in pairs(DisabledAWACS) do
        -- Создаем объект SPAWN с использованием сохраненного шаблона
        GROUP:FindByName(groupName):Respawn(nil, true)
    end
    -- Очищаем таблицу после возрождения групп
    DisabledAWACS = {}
    MESSAGE:New("Все AWACS включены.", 10):ToAll()
end

-- Создание меню управления миссией
CommandMenu = MENU_MISSION:New("Управление миссией")
DisableAWACSCommand = MENU_MISSION_COMMAND:New("Убрать AWACS", CommandMenu, DisableAllAWACS)
EnableAWACSCommand = MENU_MISSION_COMMAND:New("Влючить AWACS", CommandMenu, EnableAllAWACS)