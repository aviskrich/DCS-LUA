---dcshook

local Inspect = require("inspect")
local lfs = require("lfs")

local function dumpObject(obj, filename)
  local path = lfs.writedir()
  local file = io.open(path .. filename .. ".lua", "w")
  if file then
    file:write(filename .. " = " .. Inspect(obj))
    file:close()
  end
end

---@class ChatInterceptor : EventHandler
local ChatInterceptor = {}
function ChatInterceptor.onPlayerTryChangeSlot(playerid, side, slotId)
  log.write("DynBlock", log.INFO, "%s, %s, %s", tostring(playerid), tostring(side), tostring(slotId))
  local playerInfo = net.get_player_info(playerid)
  local msg = string.format("Welcome %s", playerInfo.name)
  net.send_chat_to(msg, playerid)
  return true
end

function ChatInterceptor.onPlayerTrySendChat(playerId, msg, all)
  local playerName = net.get_player_info(playerId).name

  if ChatProcessor ~= nil then
    net.log("chat hook")
    net.dostring_in('server', string.format("ChatProcessor.process(%s, %s)", playerName, msg))
  end
end

dumpObject(DCS, "DCS")

DCS.setUserCallbacks(ChatInterceptor)
