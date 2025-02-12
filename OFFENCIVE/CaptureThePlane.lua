-- Два самолета, которые будут выполнять роль флагов летают в орбите на высоте 25 тыс футов и скоростью 300 узлов
local blueFlag = nil
local redFlag = nil

-- Если на дистанции 10 миль от флага есть вражеский самолет, то флаг считается потерянным
-- Если на дистанции 5 миль от флага есть дружеский самолет, то флаг считается захваченным
-- Если оба условия выолнены одновременно, то флаг считаетя потерянным
-- Захваченный флаг (самолет) должен вернуться на свою сторону (точка возврата)
-- Потерянный флаг (самолет) становится в режиме круговой орбиты на высоте 25 тыс футов и скоростью 300 узлов

-- Переменные для хранения точек возврата
local blueFlagReturnPoint = nil
local redFlagReturnPoint = nil

-- Переменные для хранения точек орбиты
local blueFlagOrbitPoint = nil
local redFlagOrbitPoint = nil

-- Функция для обновления состояния флага
local function updateFlagState(flag, returnPoint, orbitPoint)
    local enemyPresent = false
    local friendlyPresent = false

    -- Проверка на наличие вражеских самолетов в радиусе 10 миль
    for _, enemy in ipairs(getEnemyUnitsInArea(flag, 10)) do
        enemyPresent = true
        break
    end

    -- Проверка на наличие дружеских самолетов в радиусе 5 миль
    for _, friend in ipairs(getFriendlyUnitsInArea(flag, 5)) do
        friendlyPresent = true
        break
    end

    -- Если оба условия выполнены или обнаружен враг, флаг считается потерянным
    if enemyPresent then
        flag.status = "lost"
    elseif friendlyPresent then
        flag.status = "captured"
    else
        flag.status = "neutral"
    end

    -- Соответствующие действия в зависимости от состояния флага
    if flag.status == "captured" then
        -- Возвращение флага к точке возврата
        flag:moveTo(returnPoint)
    elseif flag.status == "lost" then
        -- Перевод флага в режим круговой орбиты на высоте 25000 футов и скоростью 300 узлов
        flag:orbit(orbitPoint, 25000, 300)
    end
end

-- Эмуляция получения списка самолетов для проверки диапазона (функции-заглушки)
function getEnemyUnitsInArea(flag, range)
    -- Здесь должна быть логика получения вражеских единиц в указанном диапазоне от флага
    return {}
end

function getFriendlyUnitsInArea(flag, range)
    -- Здесь должна быть логика получения дружеских единиц в указанном диапазоне от флага
    return {}
end

-- Обновление состояния для каждого флага
if blueFlag then
    updateFlagState(blueFlag, blueFlagReturnPoint, blueFlagOrbitPoint)
end

if redFlag then
    updateFlagState(redFlag, redFlagReturnPoint, redFlagOrbitPoint)
end