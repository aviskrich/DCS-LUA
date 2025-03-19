UnitEventHandler = EVENTHANDLER:New()
UnitEventHandler:HandleEvent(EVENTS.UnitLost)

-- Создаём фигуру круга (или овала) вокруг координат
local function DrawTriangle(centerCoord, radius, coalition)
  local p1 = centerCoord:Translate(180, radius)
  local p2 = centerCoord:Translate(180+120, radius)
  local p3 = centerCoord:Translate(180-120, radius)
  
  local shapeObj = TRIANGLE:New(p1, p2, p3)
  local colorText = coalition == 1 and "red" or "blue"
  shapeObj.ColorString = colorText
  shapeObj:Draw()

  TIMER:New(1, function()
    shapeObj:RemoveDraw()
  end):Start(30)

  return true
end

function UnitEventHandler.onEventUnitLost(eventData)
  local unit = eventData.unit
  local coalition = unit:GetCoalition()
  local coordinate = unit:GetCoordinate()
  
  DrawTriangle(coordinate, 20, coalition)
end

collectgarbage()