

--Время задержки перед тиком на проверку зоны
tickInterval = 20

--Цвета сторон
SideColor = {
  RED = {1,0,0},
  BLUE = {0,0,1},
  NEUTRAL = {1,1,0},
  WHITE = {1,1,1}
}

--Прозрачной закраски зоны
Alpha = 0.05

--------------------------------------------------------------------------------------------------------------------------------
set_unit = SET_UNIT:New():FilterStart()
zones = {}

for _, zoneName in ipairs(zoneNames) do
  table.insert(zones, ZONE:FindByName(zoneName));
end

function CheckZone(zone)
  zone:Scan({Object.Category.UNIT},{Unit.Category.GROUND_UNIT})

  if (zone.side ~= coalition.side.BLUE and zone:IsAllInZoneOfCoalition(coalition.side.BLUE)) then
    zone.side = coalition.side.BLUE
    trigger.action.outText("Синие захватили "..zone:GetName(), 30)  
  end

  if (zone.side ~= coalition.side.RED and zone:IsAllInZoneOfCoalition(coalition.side.RED)) then
    zone.side = coalition.side.RED
    trigger.action.outText("Красные захватили "..zone:GetName(), 30)  
  end

  if ((zone.side ~= coalition.side.NEUTRAL and zone:IsSomeInZoneOfCoalition(coalition.side.RED) and zone:IsSomeInZoneOfCoalition(coalition.side.BLUE)) or (zone.side ~= coalition.side.NEUTRAL and zone:IsNoneInZoneOfCoalition(coalition.side.RED) and zone:IsNoneInZoneOfCoalition(coalition.side.BLUE))) then
    zone.side = coalition.side.NEUTRAL
    trigger.action.outText("Зона "..zone:GetName().." теперь нейтральна", 30)  
  end

  local color = SideColor.NEUTRAL

  if zone.side == coalition.side.RED then color = SideColor.RED end
  if zone.side == coalition.side.BLUE then color = SideColor.BLUE end

  --zone.textId = zone:GetCoordinate():Translate(range/2, 90):TextToAll(zone:GetName().."\nSupply: "..zone.supply..fuel, coalition.side.ALL, SideColor.BLUE, 1, SideColor.WHITE, 0.5, 15, true)     
  zone:UndrawZone()
  zone:DrawZone(coalition.side.ALL, color, 1, color, Alpha, 1, true)  
end

function Tick()
  for _, zone in ipairs(zones) do
    CheckZone(zone)
  end
end

SCHEDULER:New(nil, Tick, nil, 0, tickInterval)
trigger.action.outText("Server started", 10)