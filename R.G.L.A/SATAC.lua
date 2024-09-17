-- Capture the flag script by RagnarDa 2013
SATAC = {}

-- - Start of settings for mission designer: -
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Units on red side (unit name):

SATAC.RedGroups = SET_GROUP:New():FilterCoalitions("red"):FilterPrefixes({"=SATAC=","Shochi%-", "Сочи%-"}):FilterStart()
-- Units on blue side (unit name):
SATAC.BlueGroups = SET_GROUP:New():FilterCoalitions("blue"):FilterPrefixes({"=SATAC=","Mozdok%-", "Моздок%-"}):FilterStart()

-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--  - End of settings for mission designer -

-- Define SATAC circle
SATAC.ScriptVersion = "0.21"

SATAC.SATAC_CenterConePos = POINT_VEC2:NewFromVec3(Unit.getByName("SATAC_Center"):getPosition().p)
SATAC.SATAC_Zone_Radius = 50 -- Zone Radius in miles
SATAC.SATAC_Zone_ExtRadius = 70 -- Zone Extended Radius in miles
SATAC.SATAC_ZONE = ZONE_RADIUS:New("SATAC_ZONE", SATAC.SATAC_CenterConePos:GetVec2(), UTILS.NMToMeters(SATAC.SATAC_Zone_Radius))
    :DrawZone(-1, {1,0,0})
SATAC.SATAC_ZONE_EXT = ZONE_RADIUS:New("SATAC_ZONE_EXT", SATAC.SATAC_CenterConePos:GetVec2(), UTILS.NMToMeters(SATAC.SATAC_Zone_ExtRadius))
    :DrawZone(-1, {0,1,0})
SATAC.SATAC_KILL_TIME = 60 -- Время больше которого нельзя находиться за кругом (в сек)
SATAC.RedGroup_OutOfRange_Timer = {}
SATAC.BlueGroup_OutOfRange_Timer = {}

SATAC.isGameStarted = false
SATAC.isRedsInZoneOrNil = false
SATAC.isRedsInExtZoneOrNil = false
SATAC.isBluesInZoneOrNil = false
SATAC.isBluesInExtZoneOrNil = false

SATAC.blueGroupsCount = 0
SATAC.redGroupsCount = 0

SATAC.currentPlayers = nil

-- @Return array of timers for each unit in @param UnitsArray in {['unitName'] = timer, ...} format
function SATAC.initializeTimers(UnitsArray)
	local _timers = {}
	for _i, _group in pairs(UnitsArray) do
		_timers[_group] = -1
	end
	return _timers
end

function refreshAll()
	SATAC.RedGroup_OutOfRange_Timer = SATAC.initializeTimers(SATAC.RedGroups)
	SATAC.BlueGroup_OutOfRange_Timer = SATAC.initializeTimers(SATAC.BlueGroups)
	SATAC.isGameStarted = false
	SATAC.isRedsInZoneOrNil = false
	SATAC.isRedsInExtZoneOrNil = false
	SATAC.isBluesInZoneOrNil = false
	SATAC.isBluesInExtZoneOrNil = false
    SATAC.blueGroupsCount = 0
    SATAC.redGroupsCount = 0
    SATAC.currentPlayers = nil
end

SCHEDULER:New(nil, function()
    -- SATAC.RedUnits:FilterOnce()
    -- SATAC.BlueUnits:FilterOnce()
    SATAC.RedGroups:Flush()
    SATAC.BlueGroups:Flush()

    SATAC.blueGroupsCount = SATAC.BlueGroups:Count()
    SATAC.redGroupsCount = SATAC.RedGroups:Count()

    SATAC.isRedsInExtZoneOrNil = true
    SATAC.isBluesInExtZoneOrNil = true
    SATAC.isRedsInZoneOrNil = true
    SATAC.isBluesInZoneOrNil = true

    MESSAGE:New(string.format("Количество игроков: %i синих, %i красных", SATAC.blueGroupsCount, SATAC.redGroupsCount), 
        3, "DEBUG", true):ToLog()
    
    -- собираем список всех играющих, кому разошлем сообщение
    
    SATAC.currentPlayers = {}
    SATAC.BlueGroups:ForEachGroup(function(_group)
        table.insert(SATAC.currentPlayers, _group:GetName())
    end)
    SATAC.RedGroups:ForEachGroup(function(_group)
        table.insert(SATAC.currentPlayers, _group:GetName())
    end)
    
    
    -- Определим условия старта боя (вошел ли кто-то в зону)
        -- Если вошел, то бой начинается до тех пор, пока в зоне не останется один		
    SATAC.RedGroups:ForEachGroupNotInZone(SATAC.SATAC_ZONE, function(_group)
        SATAC.isRedsInZoneOrNil = false
        if (SATAC.isGameStarted and SATAC.RedGroup_OutOfRange_Timer[_group] ~= nil) then
            SATAC.RedGroup_OutOfRange_Timer[_group] = SATAC.RedGroup_OutOfRange_Timer[_group] + 1
            if (SATAC.RedGroup_OutOfRange_Timer[_group] >= SATAC.SATAC_KILL_TIME) then
                _group:Explode(100)
            end
        end
    end)
    SATAC.BlueGroups:ForEachGroupNotInZone(SATAC.SATAC_ZONE, function(_group)
        SATAC.isBluesInZoneOrNil = false
        if (SATAC.isGameStarted and SATAC.BlueGroup_OutOfRange_Timer[_group] ~= nil) then
            SATAC.BlueGroup_OutOfRange_Timer[_group] = SATAC.BlueGroup_OutOfRange_Timer[_group] + 1
            if (SATAC.BlueGroup_OutOfRange_Timer[_group] >= SATAC.SATAC_KILL_TIME) then
                _group:Explode(100)
            end
        end
    end)
    SATAC.BlueGroups:ForEachGroupNotInZone(SATAC.SATAC_ZONE_EXT, function(_group)
        SATAC.isBluesInExtZoneOrNil = false
    end)
    SATAC.RedGroups:ForEachGroupNotInZone(SATAC.SATAC_ZONE_EXT, function(_group)
        SATAC.isRedsInExtZoneOrNil = false
    end)

    if (SATAC.isRedsInZoneOrNil == true and SATAC.isBluesInZoneOrNil == true) then
        if (SATAC.blueGroupsCount > 0 and SATAC.redGroupsCount > 0) then
            SATAC.isGameStarted = true
            trigger.action.setUserFlag("8001", true) -- Play sound
        end
    end

    -- Если игра началась, то для всех, кто в зоне таймер автоматически обнуляется
    if (SATAC.isGameStarted == true) then
        SATAC.RedGroups:ForEachGroupCompletelyInZone(SATAC.SATAC_ZONE, function(_group)
            SATAC.RedGroup_OutOfRange_Timer[_group] = 0
        end)
        SATAC.BlueGroups:ForEachGroupCompletelyInZone(SATAC.SATAC_ZONE, function(_group)
            SATAC.BlueGroup_OutOfRange_Timer[_group] = 0
        end)
    end

    -- Определим условия победы: Внутри зоны 70 миль, нет ни одного живого противника, а внутри зоны 50 находится союзник			
    if SATAC.isGameStarted == true then
        if (SATAC.isRedsInZoneOrNil == true and (SATAC.isBluesInZoneOrNil == false and SATAC.isBluesInExtZoneOrNil == false)) then
            MESSAGE:New(string.format("RED TEAM conquered zone! RED TEAM WINS."), 10):ToAll()
            trigger.action.setUserFlag("8002", true) -- Play sound
            refreshAll()
        elseif (SATAC.isBluesInZoneOrNil == true and (SATAC.isRedsInZoneOrNil == false and SATAC.isRedsInExtZoneOrNil == false)) then 
            MESSAGE:New(string.format("BLUE TEAM conquered zone! BLUE TEAM WINS."), 10):ToAll()
            trigger.action.setUserFlag("8002", true) -- Play sound
            refreshAll()
        elseif (SATAC.isBluesInExtZoneOrNil == false and SATAC.isRedsInExtZoneOrNil == false) then
            MESSAGE:New(string.format("NOONE conquered zone! THIS IS A DRAW =("), 10):ToAll()
            trigger.action.setUserFlag("8002", true) -- Play sound
            refreshAll()
        end
    end
end, {}, 10, 1, 0)

SCHEDULER:New(nil, function ()

	local _redsOverall = SATAC.redGroupsCount
	local _bluesOverall = SATAC.blueGroupsCount
	local _redsInZone = 0
	local _bluesInZone = 0
	local _msgQueueUnit = {}
	local _msgQueueTime = {}
    
    -- считаем количество юнитов в зоне
    SATAC.BlueGroups:ForEachGroupCompletelyInZone(SATAC.SATAC_ZONE, function(_group)
        _bluesInZone = _bluesInZone + 1
    end)
    SATAC.RedGroups:ForEachGroupCompletelyInZone(SATAC.SATAC_ZONE, function(_group)
        _redsInZone = _redsInZone + 1
    end)

    -- отправляем сообщения о том, что юниты вышли из зоны
    if (SATAC.isGameStarted) then 
        SATAC.BlueGroups:ForEachGroupNotInZone(SATAC.SATAC_ZONE, function(_group)
            MESSAGE:New(string.format("You are out of zone! %i seconds to detonation", SATAC.BlueGroup_OutOfRange_Timer[_group]), 5):ToUnit(_group)            
        end)
        SATAC.RedGroups:ForEachGroupNotInZone(SATAC.SATAC_ZONE, function(_group)
            MESSAGE:New(string.format("You are out of zone! %i seconds to detonation", SATAC.RedGroup_OutOfRange_Timer[_group]), 5):ToUnit(_group)            
        end)
    end

    -- отправляем сообщение о статусе игры
	local msg = {}
	msg.name = 'SATAC Status'
	msg.text = string.format("SATAC Status:\nVersion: %s\nGame started: %s\nReds in zone: %i of %i\nBlues in zone: %i of %i ", 
								SATAC.ScriptVersion, 
								tostring(SATAC.isGameStarted), 
								_redsInZone, 
								_redsOverall, 
								_bluesInZone, 
								_bluesOverall)
	msg.displayTime = 25
    msg.msgFor = {units = SATAC.currentPlayers}

    mist.message.add(msg)
end, {}, 15, 10, 0)