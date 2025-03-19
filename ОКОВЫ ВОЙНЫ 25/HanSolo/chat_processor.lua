---@class ChatProcessor
local ChatProcessor = {}

function ChatProcessor.process(playerName, msg)
    -- Ищем ключевое слово после двоеточия в начале строки
    local pattern = "^:([%w_]+)%s+(.*)"
    local keyword, data = string.match(msg, pattern)

    if keyword then
        -- Нашли совпадение
        if keyword == "set_mark" then
            local coalition = CLIENT:FindByPlayerName(playerName):GetDCSGroup():GetCoalition()
            -- Обрабатываем команду set_mark
            local latDir = "([NSns])"
            local longDir = "([EWew])"
            local ddmLat = "(%d%d?)[^%d]+(%d%d?)[^%d]+(%d%d%d?%d?)"
            local ddmLong = "(%d%d?%d?)[^%d]+(%d%d?)[^%d]+(%d%d%d?%d?)"
            local strDat = "(%s+)"

            local regexp = string.format(".*%s.-%s.*%s.-%s.* %s", latDir, ddmLat, longDir, ddmLong, strDat)

            local latN, latD, latM, latDM, longE, longD, longM, longDM, str = data:match(regexp)
            local lat = tonumber(latN) * 100 + tonumber(latD) * 10 + tonumber(latM) + tonumber(latDM) / 1000
            local long = tonumber(longE) * 100 + tonumber(longD) * 10 + tonumber(longM) + tonumber(longDM) / 1000

            local coord = COORDINATE:NewFromLLDD(lat, long)
            MARKER:New(coord, str):ToCoalition(coalition)

            return true
        end
    end

    return false
end