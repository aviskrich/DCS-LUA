-- BASE:TraceClass("EVENTHANDLER")
-- BASE:TraceLevel(3)
-- BASE:TraceOnOff( true )

---@class Recon
---@field groundUnits SET_UNIT

Recon = {
  UnitEventHandler = EVENTHANDLER:New(),  
  removeMarkerTime = 60
}
function Recon.SetMarker(eventData)
  --UTILS.PrintTableToLog(eventData)

  local tgt = eventData and eventData.TgtUnit or nil
  if tgt ~= nil then
    local exists = tgt:IsExist()
    if exists then
      local coalitionNum = tgt:GetCoalition()
      if coalitionNum ~= nil then
        local unitName = tgt:GetName()
        local coordinate = tgt:GetCoordinate()
        local coalitionName = nil
        if coordinate then
          if coalitionNum == coalition.side.RED then
            coalitionName = "RED"
          else
            coalitionName = "BLUE"
          end
          MARKER:New(coordinate, string.format("Юнит %s коалиции %s под огнем", unitName, coalitionName)):ToAll():Remove(Recon.removeMarkerTime)
          return true
        end
      end
    end
  end
  return false
end
function Recon.UnitEventHandler:OnEventHit(eventData)
  local localEventData = eventData
  Recon.SetMarker(localEventData)
end

Recon.UnitEventHandler:HandleEvent(EVENTS.Hit, Recon.UnitEventHandler.OnEventHit)