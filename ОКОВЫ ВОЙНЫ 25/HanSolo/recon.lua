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

  if (eventData.TgtUnit and eventData.TgtUnit:GetCoalition()) then
    local coalitionNum = eventData.TgtUnit:GetCoalition()
    local coordinate = eventData.TgtUnit:GetCoordinate()
    local coalitionName = nil
    if coordinate and coalitionNum == coalition.side.RED then
      coalitionName = "RED"
      MARKER:New(coordinate, string.format("Юнит коалиции %s под огнем", coalitionName)):ToAll():Remove(Recon.removeMarkerTime)    
    else
      coalitionName = "BLUE"
      MARKER:New(coordinate, string.format("Юнит коалиции %s под огнем", coalitionName)):ToAll():Remove(Recon.removeMarkerTime)    
    end
    return true
  end

  return false
end
function Recon.UnitEventHandler:OnEventHit(eventData)
  Recon.SetMarker(eventData)
end

Recon.UnitEventHandler:HandleEvent(EVENTS.Hit, Recon.UnitEventHandler.OnEventHit)