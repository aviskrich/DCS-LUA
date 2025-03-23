---dcshook

---@class ChatInterceptor : EventHandler
local ChatInterceptor = {}
function ChatInterceptor.onPlayerTryChangeSlot(playerid, side, slotId)
  log.write("DynBlock", log.INFO, "%s, %s, %s", tostring(playerid), tostring(side), tostring(slotId))
  local playerInfo = net.get_player_info(playerid)
  local msg = string.format("Welcome %s", playerInfo.name)
  net.send_chat_to(msg, playerid)
  return true
end

local counter = 150000  

function ChatInterceptor.onPlayerTrySendChat(playerId, msg, all)
  net.log("chat hook")
  -- net.dostring_in('server', string.format("ChatProcessor.process(%s, %s)", playerName, msg))  

  local pattern = "^:([%w_]+)%s+(.*)"
  local keyword, data = string.match(msg, pattern)
  net.log(string.format("CHAT_PROCESSOR: %s; %s", keyword, data))

  if keyword then
      -- Нашли совпадение
      if keyword == "mark" then
          local coalition = net.get_player_info(playerId).side

          -- Обрабатываем команду set_mark
          local latDir = "([NSns])"
          local longDir = "([EWew])"
          local ddmLat = "(%d%d?)[^%d]+(%d%d?)[^%d]+(%d%d%d?%d?)"
          local ddmLong = "(%d%d?%d?)[^%d]+(%d%d?)[^%d]+(%d%d%d?%d?)"
          local strDat = "%s*(.*)"

          local regexp = string.format(".*%s.-%s.*%s.-%s.-%s", latDir, ddmLat, longDir, ddmLong, strDat)
          net.log(string.format("CHAT_PROCESSOR: regexp: %s", regexp))

          local latN, latD, latM, latDM, longE, longD, longM, longDM, str = data:match(regexp)
		      net.log(string.format("CHAT PROCESSOR: latN=%s, latD=%s, latM=%s, latDM=%s, longE=%s, longD=%s, longM=%s, longDM=%s, str=%s",latN, latD, latM, latDM, longE, longD, longM, longDM, str))

          local lat = tonumber(latD) + tonumber(latM..'.'..latDM)/60
          local long = tonumber(longD) + tonumber(longM..'.'..longDM)/60
          net.log(string.format("CHAT_PROCESSOR: lat: %s, long: %s", lat, long))
          
          local command = string.format("trigger.action.markToCoalition(%s, '%s', coord.LLtoLO(%s, %s), %s, false, '%s')", counter, str, lat, long, coalition, str)
          net.log(command)
    
          net.dostring_in('server', command)
          counter=counter+1

          return true
      end
  end
end

DCS.setUserCallbacks(ChatInterceptor)