--[[
JTAC Automatic Targeting and Laser Script

Allows a JTAC to mark and hold an IR and Laser point on a target allowing TGP's to lock onto the lase and ease
of target location using NV Goggles

The JTAC will automatically switch targets when a target is destroyed or goes out of Line of Sight

NOTE: LOS doesn't include buildings or tree's... Sorry!

The script can also be useful in daylight by enabling the JTAC to mark enemy positions with Smoke.
The JTAC will only move the smoke to the target every 5 minutes (to stop a huge trail of smoke markers) unless the target
is destroyed, in which case the new target will be marked straight away with smoke.

You can also enable an F10 menu option for coalition units allowing the JTAC(s) to report their current status.

If a JTAC is down it won't report in.

USAGE:

Place JTAC units on the map with the mission editor putting each JTAC in it's own group containing only itself and no
other units. Name the group something easy to remember e.g. JTAC1 and make sure the JTAC units have a unique name which must
not be the same as the group name. The editor should do this for you but be careful if you copy and paste.

Load the script at the start of the mission with a Trigger Once or as the init script of the mission

Run the code below as a DO SCRIPT at the start of the mission, or after a delay if you prefer

JTACAutoLase('JTAC1', 1688)

OR

JTACAutoLase('JTAC1', 1688, false,"all") - means no smoke marks for this jtac and it will target all ground troops

OR

JTACAutoLase('JTAC1', 1688, true,"vehicle") - means  smoke marks for this jtac and it will target ONLY ground vehicles

OR

JTACAutoLase('JTAC1', 1688, true,"troop") - means  smoke marks for this jtac and it will target ONLY ground troops

OR

JTACAutoLase('JTAC1', 1688, true,"all", 4) - means BLUE smoke marks for this jtac and it will target all ground troops

Where JTAC1 is the Group name of the JTAC Group with one and only one JTAC unit.

The script doesn't care if the unit isn't activated when run, as it'll automatically activate when the JTAC is activated in
the mission but there can be a delay of up to 30 seconds after activation for the JTAC to start searching for targets.

You can also run the code at any time if a JTAC is dynamically added to the map as long as you know the Group name of the JTAC.

Last Edit:  21/04/2015

Change log:
				Added new config of JTAC smoke colour globally or per JTAC
                Added new config of JTAC targetting to either target only troops or vehicles or all
                Added new induvidual config of JTAC smoke and location which will override global setting
				Added Lat / Lon + MGRS to JTAC Target position 
                Changed Lasing method to update laser marker rather than create and destroy
                    - This gives much better tracking behaviour!
                Fixed JTAC lasing through terrain.
				Fixed Lase staying on when JTAC Dies
				Fixed Lase staying on when target dies and there are no other targets
				Added Radio noise when message is shown
				Stop multiple JTACS targeting the same target


Parts of MIST used. Source is  https://github.com/mrSkortch/MissionScriptingTools/blob/master/mist.lua

]]

autolase_setup_time_passed = false
autolase_setup_time_length = 300 --default 300

timer.scheduleFunction(function() --Supress JTAC Messages during setup time.
	autolase_setup_time_passed = true
	tti.debug("Mission Setup Time Passed: JTAC Auto-Lase Notifications now enabled")
end, nil, timer.getTime() + autolase_setup_time_length )

--get distance in meters assuming a Flat world
function getDistance(point1, point2)

    local xUnit = point1.x
    local yUnit = point1.z
    local xZone = point2.x
    local yZone = point2.z

    local xDiff = xUnit - xZone
    local yDiff = yUnit - yZone

    return math.sqrt(xDiff * xDiff + yDiff * yDiff)
end


-- CONFIG
JTAC_maxDistance = 8000 -- How far a JTAC can "see" in meters (with LOS)

JTAC_smokeOn = true -- enables marking of target with smoke, can be overriden by the JTACAutoLase in editor

JTAC_smokeColour = 1 -- Green = 0 , Red = 1, White = 2, Orange = 3, Blue = 4

JTAC_jtacStatusF10 = true -- enables F10 JTAC Status menu

JTAC_location = true -- shows location in JTAC message, can be overriden by the JTACAutoLase in editor

JTAC_lock =  "all" -- "vehicle" OR "troop" OR "all" forces JTAC to only lock vehicles or troops or all ground units 

location_DMS = true

enable_mission_editor_jtac_unit = false -- set true if you want to use pre-made jtacs from the mission editor.
-- END CONFIG

-- BE CAREFUL MODIFYING BELOW HERE

GLOBAL_JTAC_LASE = {}
GLOBAL_JTAC_IR = {}
GLOBAL_JTAC_SMOKE = {}
GLOBAL_JTAC_UNITS = {} -- list of JTAC units for f10 command
GLOBAL_JTAC_CURRENT_TARGETS = {}
GLOBAL_JTAC_RADIO_ADDED = {} --keeps track of who's had the radio command added
GLOBAL_JTAC_LASER_CODES = {} -- keeps track of laser codes for jtac
GLOBAL_JTAC_TARGET_LIST = {} --current available targets for sorting to each JTAC for lasing (targets from other JTACs are filtered out). Contains DCS unit objects with their methods and the distance to the JTAC {unit, dist}

--list (in order of priority) of ground target attributes that JTAC will prioritize
-- use for function findNearestVisibleEnemy()
priorityGroundTargetList = {
"SAM TR",
"SAM SR",
"SAM",
"IR Guided SAM",
"AAA",
"Armed Air Defence",
"Tanks",
"Armored vehicles",
"LightArmoredUnits",
"SAM LL",
"SAM elements",
"Ground Vehicles",
"Infantry"
}


function JTACAutoLase(jtacGroupName, laserCode,smoke,lock,colour)

    if smoke == nil then
    
        smoke = JTAC_smokeOn  
    end

    if lock == nil then
    
        lock = JTAC_lock
    end

    if colour == nil then
    	colour = JTAC_smokeColour
    end

    GLOBAL_JTAC_LASER_CODES[jtacGroupName] = laserCode
    
    local jtacGroup = getGroup(jtacGroupName)
    local jtacUnit

    if jtacGroup == nil or #jtacGroup == 0 then

        RTBnotify("JTAC Group " .. jtacGroupName .. " RTB!", 10)

        --remove from list
        GLOBAL_JTAC_UNITS[jtacGroupName] = nil

        cleanupJTAC(jtacGroupName)

        return
    else

        jtacUnit = jtacGroup[1]
        --add to list
        GLOBAL_JTAC_UNITS[jtacGroupName] = jtacUnit:getName()

		        --Targets list and Selected target initialization
        if not GLOBAL_JTAC_TARGET_LIST[jtacGroupName] then
            GLOBAL_JTAC_TARGET_LIST[jtacGroupName] = {}
            --if jtacCoalition then newJtac[jtacCoalition] = true end
        end


    end


    -- search for current unit
	if enable_mission_editor_jtac_unit == true then
		if jtacUnit:isActive() == false then
	
			cleanupJTAC(jtacGroupName)
	
			env.info(jtacGroupName .. ' Not Active - Waiting 30 seconds')
			timer.scheduleFunction(timerJTACAutoLase, { jtacGroupName, laserCode,smoke,lock,colour}, timer.getTime() + 30)
	
			return
		end
	end

    local enemyUnit = getCurrentUnit(jtacUnit, jtacGroupName)

    if enemyUnit == nil and GLOBAL_JTAC_CURRENT_TARGETS[jtacGroupName] ~= nil then

        local tempUnitInfo = GLOBAL_JTAC_CURRENT_TARGETS[jtacGroupName]

  --      env.info("TEMP UNIT INFO: " .. tempUnitInfo.name .. " " .. tempUnitInfo.unitType)

        local tempUnit = Unit.getByName(tempUnitInfo.name)

        --if tempUnit ~= nil and tempUnit:getLife() > 0 and tempUnit:isActive() == true then
        if tempUnit ~= nil and tempUnit:isActive() == true and autolase_setup_time_passed == true then
            notify(jtacGroupName .. " target " .. tempUnitInfo.unitType .. " lost. Scanning for targets. ", 10)
        -- else
             notify(jtacGroupName .. " Kill Confirmed: " .. tempUnitInfo.unitType .. "  Scanning for new targets. ", 10)
        end

        --remove from smoke list
        GLOBAL_JTAC_SMOKE[tempUnitInfo.name] = nil

        -- remove from target list
        GLOBAL_JTAC_CURRENT_TARGETS[jtacGroupName] = nil

        --stop lasing
        cancelLase(jtacGroupName)

    end


    if enemyUnit == nil then
		if jtac_prioritize_air_defences == true then
			enemyUnit = findNearestVisibleEnemy(jtacUnit,lock,nil,jtacGroupName)
		else
			enemyUnit = findNearestVisibleEnemyRandom(jtacUnit,lock,nil,jtacGroupName)
		end
		
        if enemyUnit ~= nil then

            -- store current target for easy lookup
            GLOBAL_JTAC_CURRENT_TARGETS[jtacGroupName] = { name = enemyUnit:getName(), unitType = enemyUnit:getTypeName(), unitId = enemyUnit:getID() }
			if autolase_setup_time_passed == true then
				notify(jtacGroupName .. '. LSR: ' .. laserCode .. " - New Target: " .. enemyUnit:getTypeName() .. getPositionString(enemyUnit) .. heightString(enemyUnit) , 10)
			end
            -- create smoke
            if smoke == true then

                --create first smoke
                createSmokeMarker(enemyUnit,colour)
            end
        end
    end

    if enemyUnit ~= nil then

        laseUnit(enemyUnit, jtacUnit, jtacGroupName, laserCode)

        --   env.info('Timer timerSparkleLase '..jtacGroupName.." "..laserCode.." "..enemyUnit:getName())
        timer.scheduleFunction(timerJTACAutoLase, { jtacGroupName, laserCode, smoke,lock,colour }, timer.getTime() + 10) --default + 1


        if smoke == true then
            local nextSmokeTime = GLOBAL_JTAC_SMOKE[enemyUnit:getName()]

            --recreate smoke marker after 5 mins
            if nextSmokeTime ~= nil and nextSmokeTime < timer.getTime() then

                createSmokeMarker(enemyUnit, colour)
            end
        end

    else
        -- env.info('LASE: No Enemies Nearby')

        -- stop lazing the old spot
        cancelLase(jtacGroupName)
        --  env.info('Timer Slow timerSparkleLase '..jtacGroupName.." "..laserCode.." "..enemyUnit:getName())
		

        timer.scheduleFunction(timerJTACAutoLase, { jtacGroupName, laserCode, smoke,lock,colour }, timer.getTime() + 5)
    end
end

-- used by the timer function
function timerJTACAutoLase(args)
    JTACAutoLase(args[1],args[2],args[3],args[4],args[5])
	--trigger.action.outText("JTAC AutoLase function called...", 5)
end

function cleanupJTAC(jtacGroupName)
    -- clear laser - just in case
    cancelLase(jtacGroupName)
	
	GLOBAL_JTAC_TARGET_LIST[jtacGroupName] = nil
    -- Cleanup
    GLOBAL_JTAC_UNITS[jtacGroupName] = nil

    GLOBAL_JTAC_CURRENT_TARGETS[jtacGroupName] = nil
end


function notify(message, displayFor, groupId)

--timer.scheduleFunction(function() 
	if groupId then
		trigger.action.outTextForGroup(groupId, message, displayFor)
		trigger.action.outSoundForGroup(groupId, "TTI Soundfiles/walkietalkie2.ogg")
	else
  		trigger.action.outTextForCoalition(coalition.side.BLUE, message, displayFor)
	    trigger.action.outSoundForCoalition(coalition.side.BLUE, "TTI Soundfiles/walkietalkie.ogg")
	end
 --end, nil, timer.getTime() + 13  ) 
 -- MUTE SFX  

end

function RTBnotify(message, displayFor, groupId)


	if groupId then
		trigger.action.outTextForGroup(groupId, message, displayFor)
	--	trigger.action.outSoundForGroup(groupId, "walkietalkie2.ogg")
	else
  		trigger.action.outTextForCoalition(coalition.side.BLUE, message, displayFor)
	  --  trigger.action.outSoundForCoalition(coalition.side.BLUE, "walkietalkie.ogg")
	end

 -- MUTE SFX  

end

function createSmokeMarker(enemyUnit,colour)

    --recreate in 5 mins
    GLOBAL_JTAC_SMOKE[enemyUnit:getName()] = timer.getTime() + 300.0

    -- move smoke 2 meters above target for ease
    local enemyPoint = enemyUnit:getPoint()
    trigger.action.smoke({ x = enemyPoint.x, y = enemyPoint.y + 2.0, z = enemyPoint.z }, colour) --TODO: add a stop smoke trigger if ED decides to add that functionality
	
end

function cancelLase(jtacGroupName)

    --local index = "JTAC_"..jtacUnit:getID()

    local tempLase = GLOBAL_JTAC_LASE[jtacGroupName]

    if tempLase ~= nil then
        Spot.destroy(tempLase)
        GLOBAL_JTAC_LASE[jtacGroupName] = nil

        --      env.info('Destroy laze  '..index)

        tempLase = nil
    end

    local tempIR = GLOBAL_JTAC_IR[jtacGroupName]

    if tempIR ~= nil then
        Spot.destroy(tempIR)
        GLOBAL_JTAC_IR[jtacGroupName] = nil

        --  env.info('Destroy laze  '..index)

        tempIR = nil
    end
end

function laseUnit(enemyUnit, jtacUnit, jtacGroupName, laserCode)

    --cancelLase(jtacGroupName)

    local spots = {}

    local enemyVector = enemyUnit:getPoint()
    local enemyVectorUpdated = { x = enemyVector.x, y = enemyVector.y + 2.0, z = enemyVector.z }

    local oldLase = GLOBAL_JTAC_LASE[jtacGroupName]
    local oldIR = GLOBAL_JTAC_IR[jtacGroupName]

    if oldLase == nil or oldIR == nil then

        -- create lase

        local status, result = pcall(function()
            spots['irPoint'] = Spot.createInfraRed(jtacUnit, { x = 0, y = 2.0, z = 0 }, enemyVectorUpdated)
            spots['laserPoint'] = Spot.createLaser(jtacUnit, { x = 0, y = 2.0, z = 0 }, enemyVectorUpdated, laserCode)
            return spots
        end)

        if not status then
            env.error('ERROR: ' .. assert(result), false)
        else
            if result.irPoint then

                --    env.info(jtacUnit:getName() .. ' placed IR Pointer on '..enemyUnit:getName())

                GLOBAL_JTAC_IR[jtacGroupName] = result.irPoint --store so we can remove after

            end
            if result.laserPoint then

                --	env.info(jtacUnit:getName() .. ' is Lasing '..enemyUnit:getName()..'. CODE:'..laserCode)

                GLOBAL_JTAC_LASE[jtacGroupName] = result.laserPoint
            end
        end

    else

        -- update lase

        if oldLase~=nil then
            oldLase:setPoint(enemyVectorUpdated)
        end

        if oldIR ~= nil then
            oldIR:setPoint(enemyVectorUpdated)
        end

    end

end

-- get currently selected unit and check they're still in range
function getCurrentUnit(jtacUnit, jtacGroupName)


    local unit = nil

    if GLOBAL_JTAC_CURRENT_TARGETS[jtacGroupName] ~= nil then
        unit = Unit.getByName(GLOBAL_JTAC_CURRENT_TARGETS[jtacGroupName].name)
    end

    local tempPoint = nil
    local tempDist = nil
    local tempPosition = nil

    local jtacPosition = jtacUnit:getPosition()
    local jtacPoint = jtacUnit:getPoint()

    if unit ~= nil and unit:getLife() > 0 and unit:isActive() == true then

        -- -- calc distance
        -- tempPoint = unit:getPoint()
        -- --   tempPosition = unit:getPosition()

        -- tempDist = getDistance(tempPoint.x, tempPoint.z, jtacPoint.x, jtacPoint.z)
        -- if tempDist < JTAC_maxDistance then
		
		        -- calc distance
        tempPoint = unit:getPoint()
        --   tempPosition = unit:getPosition()

        tempDist = getDistance(unit:getPoint(), jtacUnit:getPoint())
        if tempDist < JTAC_maxDistance then
            -- calc visible

            -- check slightly above the target as rounding errors can cause issues, plus the unit has some height anyways
            local offsetEnemyPos = { x = tempPoint.x, y = tempPoint.y + 2.0, z = tempPoint.z }
            local offsetJTACPos = { x = jtacPoint.x, y = jtacPoint.y + 2.0, z = jtacPoint.z }

            if land.isVisible(offsetEnemyPos, offsetJTACPos) then
                return unit
            end
        end
    end
    return nil
end

	
	    -- -- check priority ref code
	-- for _, enemyUnit in ipairs(unitList) do
        -- local enemyName = enemyUnit.unit:getName()

		-- if enemyUnit.unit:hasAttribute("SAM elements") == true then
			-- return enemyUnit.unit
        -- end
    -- end	
	
    -- for _, enemyUnit in ipairs(unitList) do
        -- local enemyName = enemyUnit.unit:getName()

		-- if enemyUnit.unit:hasAttribute("Ground Vehicles") == true then
			-- return enemyUnit.unit
        -- end
    -- end	 


--original find nearest enemy
-- Find nearest enemy to JTAC that isn't blocked by terrain
function findNearestVisibleEnemyRandom(jtacUnit, targetType,distance,jtacGroupName)

    local maxDistance = distance or JTAC_maxDistance
    local x = 1
    local i = 1

    local units = nil
    local groupName = nil

    local nearestUnit = nil
    local nearestDistance = maxDistance

    local redGroups = coalition.getGroups(1, Group.Category.GROUND)


    local jtacPoint = jtacUnit:getPoint()
    local jtacPosition = jtacUnit:getPosition()

    local tempPoint = nil
    local tempPosition = nil

    local tempDist = nil

    for i = 1, #redGroups do
        if redGroups[i] ~= nil then
            groupName = redGroups[i]:getName()
            units = getGroup(groupName)
            if #units > 0 then

                for x = 1, #units do

                    --check to see if a JTAC has already targeted this unit only if a distance
                    --wasnt passed in
                    local targeted = false
                    if not distance then
                        targeted = alreadyTarget(jtacUnit, units[x])
                    end


                    local allowedTarget = true

                    if targetType == "vehicle" then
                        allowedTarget = isVehicle(units[x])
                    elseif targetType == "troop" then
                        allowedTarget = isInfantry(units[x])
                    else
                        allowedTarget = true
                    end

                    if units[x]:isActive() == true and targeted == false and allowedTarget == true then

                        -- calc distance
                        tempPoint = units[x]:getPoint()
                        tempDist = getDistance(tempPoint, jtacPoint)

                        if tempDist < JTAC_maxDistance and tempDist < nearestDistance then

                            local offsetEnemyPos = { x = tempPoint.x, y = tempPoint.y + 2.0, z = tempPoint.z }
                            local offsetJTACPos = { x = jtacPoint.x, y = jtacPoint.y + 2.0, z = jtacPoint.z }

                            -- calc visible
							
                            if land.isVisible(offsetEnemyPos, offsetJTACPos) then

                                nearestDistance = tempDist
                                nearestUnit = units[x]
                            end
			
                        end
                    end
                end
            end
        end
    end

    if nearestUnit == nil then
        return nil
    end

	tti.debug("JTAC: " .. jtacGroupName .. " is performing a world search!")
    return nearestUnit
end
-- Find nearest enemy to JTAC that isn't blocked by terrain


function findNearestVisibleEnemy(jtacUnit,targetType,distance,jtacGroupName)

    local maxDistance = distance or JTAC_maxDistance
    local x = 1
    local i = 1

    local units = nil
    local groupName = nil

    local nearestUnit = nil
    local nearestDistance = maxDistance

    local jtacPoint = jtacUnit:getPoint()
    local jtacPosition = jtacUnit:getPosition()
    local coa = jtacUnit:getCoalition()

    local tempPoint = nil
    local tempPosition = nil

    local tempDist = nil
	
	local offsetJTACPos = { x = jtacPoint.x, y = jtacPoint.y + 2.0, z = jtacPoint.z }
	
    local volume = {
        id = world.VolumeType.SPHERE,
        params = {
            point = offsetJTACPos,
            radius = maxDistance
        }
    }

    local unitList = {}
	
    local search = function(_unit, coa)
        pcall(function()

            if _unit ~= nil
                    and _unit:getLife() > 0
                    and _unit:isActive()
                    and _unit:getCoalition() ~= coa
                    and not _unit:inAir()
                    and not alreadyTarget(jtac_unit,_unit) then

                local tempPoint = _unit:getPoint()
                local offsetEnemyPos = { x = tempPoint.x, y = tempPoint.y + 2.0, z = tempPoint.z }

                if land.isVisible(offsetJTACPos,offsetEnemyPos ) then

                    local _dist = getDistance(offsetJTACPos, offsetEnemyPos)

                    if _dist < maxDistance then
                        table.insert(unitList,{unit=_unit, dist=_dist})

                    end
                end
            end
        end)

        return true
    end
	
	world.searchObjects(Object.Category.UNIT, volume, search, coa)
	
    GLOBAL_JTAC_TARGET_LIST[jtacGroupName] = unitList

    local sort = function( a,b ) return a.dist < b.dist end
    table.sort(unitList,sort)
    -- sort list
	
	for _, priorityGroundTargetListAtrb in ipairs(priorityGroundTargetList) do
		for _, enemyUnit in ipairs(unitList) do
			local enemyName = enemyUnit.unit:getName()
	
			if enemyUnit.unit:hasAttribute(priorityGroundTargetListAtrb) == true then
				return enemyUnit.unit
			end
		end
	end

    for _, enemyUnit in ipairs(unitList) do
       local enemyName = enemyUnit.unit:getName()
       local airdefense = (enemyUnit.unit:getDesc()["attributes"]["Air Defence"] ~= nil)

        if (targetType == "vehicle" and isVehicle(enemyUnit.unit)) or targetType == "all" then
            if airdefense then
                return enemyUnit.unit
            else
                nearestUnit = enemyUnit.unit
            end

        elseif (targetType == "troop" and isInfantry(enemyUnit.unit)) or targetType == "all" then
            if airdefense then
                return enemyUnit.unit
            else
                nearestUnit = enemyUnit.unit
            end
        end
    end
	
    return nearestUnit

end
-- Find nearest enemy to JTAC that isn't blocked by terrain




-- tests whether the unit is targeted by another JTAC
function alreadyTarget(jtacUnit, enemyUnit)

   -- for , jtacTarget in pairs(jtacCurrentTargets) do
	 for y , jtacTarget in pairs(GLOBAL_JTAC_CURRENT_TARGETS) do

        if jtacTarget.unitId == enemyUnit:getID() then
            -- env.info("ALREADY TARGET")
            return true
        end
    end

    return false
end


-- Returns only alive units from group but the group / unit may not be active

function getGroup(groupName)

    local groupUnits = Group.getByName(groupName)

    local filteredUnits = {} --contains alive units
    local x = 1

    if groupUnits ~= nil and groupUnits:isExist() then

        groupUnits = groupUnits:getUnits()

        if groupUnits ~= nil and #groupUnits > 0 then
            for x = 1, #groupUnits do
                if groupUnits[x]:getLife() > 0  then -- removed and groupUnits[x]:isExist() as isExist doesnt work on single units!
                table.insert(filteredUnits, groupUnits[x])
                end
            end
        end
    end

    return filteredUnits
end

function getAliveGroup(groupName)

    local group = Group.getByName(groupName)

    if group and group:isExist() == true and #group:getUnits() > 0 then
        return group
    end

    return nil
end

-- gets the JTAC status and displays to coalition units
function getJTACStatus(groupId, jtacStatusDisplayTime)

    --returns the status of all JTAC units
    local jtacGroupName = nil
    local jtacUnit = nil
    local jtacUnitName = nil

    local message = "AVAILABLE JTAC/AFAC TARGETS: \n\n"

    for jtacGroupName, jtacUnitName in pairs(GLOBAL_JTAC_UNITS) do

        --look up units
        jtacUnit = Unit.getByName(jtacUnitName)

        if jtacUnit ~= nil and jtacUnit:getLife() > 0 and jtacUnit:isActive() == true then

            local enemyUnit = getCurrentUnit(jtacUnit, jtacGroupName)

            local laserCode =  GLOBAL_JTAC_LASER_CODES[jtacGroupName]

            if laserCode == nil then
            	laserCode = "UNKNOWN"
            end

            if enemyUnit ~= nil and enemyUnit:getLife() > 0 and enemyUnit:isActive() == true then
                message = message .. "" .. jtacGroupName .. " LSR: ".. laserCode .." - TGT: " .. enemyUnit:getTypeName().. getPositionString(enemyUnit) .. heightString(enemyUnit) .. "\n"
            end
        end
    end

    notify(message, jtacStatusDisplayTime, groupId)
end


-- Radio command for players (F10 Menu)
--[[
function addRadioCommands()
if enable_jtac_drones == true then 
    --looop over all players and add command
    --    missionCommands.addCommandForCoalition( coalition.side.BLUE, "JTAC Status" ,nil, getJTACStatus ,nil)

    timer.scheduleFunction(addRadioCommands, nil, timer.getTime() + 10)

    local blueGroups = coalition.getGroups(coalition.side.BLUE)
    local x = 1

    if blueGroups ~= nil then
        for x, tmpGroup in pairs(blueGroups) do


            local index = "GROUP_" .. Group.getID(tmpGroup)
            --   env.info("adding command for "..index)
            if GLOBAL_JTAC_RADIO_ADDED[index] == nil then
                -- env.info("about command for "..index)
                missionCommands.addCommandForGroup(Group.getID(tmpGroup), "JTAC Target Reports", nil, getJTACStatus, Group.getID(tmpGroup))
                GLOBAL_JTAC_RADIO_ADDED[index] = true
               -- env.info("Added command for " .. index)
            end
        end
    end
end
end
--]]

function isInfantry(unit)

    local typeName = unit:getTypeName()

    --type coerce tostring
    typeName = string.lower(typeName.."")

    local soldierType = { "infantry","paratrooper","stinger","manpad"}

    for key,value in pairs(soldierType) do
        if string.match(typeName, value) then
            return true
        end
    end

    return false

end

-- assume anything that isnt soldier is vehicle
function isVehicle(unit)

    if isInfantry(unit) then
        return false
    end

    return true

end
    
function getPositionString(unit)

    if JTAC_location == false then
        return ""
    end

    local lat, lon = coord.LOtoLL(unit:getPosition().p)

    local latLngStr = mist.tostringLL(lat, lon, 3, location_DMS)
	
	local latLngStrdmm = latLngStrdmm(unit,3)

    local mgrsString = mist.tostringMGRS(coord.LLtoMGRS(coord.LOtoLL(unit:getPosition().p)), 5)

    return "\nL/L (DMS.S): " .. latLngStr .. " | (DM.M): " .. latLngStrdmm .. "\nMGRS: "..mgrsString.." "
end

-- source of Function MIST - https://github.com/mrSkortch/MissionScriptingTools/blob/master/mist.lua
function latLngString(unit, acc)

	local lat, lon = coord.LOtoLL(unit:getPosition().p)

	local latHemi, lonHemi
	if lat > 0 then
		latHemi = 'N'
	else
		latHemi = 'S'
	end
	
	if lon > 0 then
		lonHemi = 'E'
	else
		lonHemi = 'W'
	end
	
	lat = math.abs(lat)
	lon = math.abs(lon)
	
	local latDeg = math.floor(lat)
	local latMin = (lat - latDeg)*60
	
	local lonDeg = math.floor(lon)
	local lonMin = (lon - lonDeg)*60
	
  -- degrees, decimal minutes.
	latMin = roundNumber(latMin, acc)
	lonMin = roundNumber(lonMin, acc)
	
	if latMin == 60 then
		latMin = 0
		latDeg = latDeg + 1
	end
		
	if lonMin == 60 then
		lonMin = 0
		lonDeg = lonDeg + 1
	end
	
	local minFrmtStr -- create the formatting string for the minutes place
	if acc <= 0 then  -- no decimal place.
		minFrmtStr = '%02d'
	else
		local width = 3 + acc  -- 01.310 - that's a width of 6, for example.
		minFrmtStr = '%0' .. width .. '.' .. acc .. 'f'
	end
	
	return string.format('%02d', latDeg) .. ' ' .. string.format(minFrmtStr, latMin) .. '\'' .. latHemi .. ''
   .. string.format('%02d', lonDeg) .. ' ' .. string.format(minFrmtStr, lonMin) .. '\'' .. lonHemi

end

function latLngStrdmm(unit, acc)

	local lat, lon = coord.LOtoLL(unit:getPosition().p)

	local latHemi, lonHemi
	if lat > 0 then
		latHemi = 'N'
	else
		latHemi = 'S'
	end
	
	if lon > 0 then
		lonHemi = 'E'
	else
		lonHemi = 'W'
	end
	
	lat = math.abs(lat)
	lon = math.abs(lon)
	
	local latDeg = math.floor(lat)
	local latMin = (lat - latDeg)*60
	
	local lonDeg = math.floor(lon)
	local lonMin = (lon - lonDeg)*60
	
  -- degrees, decimal minutes.
	latMin = roundNumber(latMin, acc)
	lonMin = roundNumber(lonMin, acc)
	
	if latMin == 60 then
		latMin = 0
		latDeg = latDeg + 1
	end
		
	if lonMin == 60 then
		lonMin = 0
		lonDeg = lonDeg + 1
	end
	
	local minFrmtStr -- create the formatting string for the minutes place
	if acc <= 0 then  -- no decimal place.
		minFrmtStr = '%02d'
	else
		local width = 3 + acc  -- 01.310 - that's a width of 6, for example.
		minFrmtStr = '%0' .. width .. '.' .. acc .. 'f'
	end
	
	return string.format('%02d', latDeg) .. ' ' .. string.format(minFrmtStr, latMin) .. '\'' .. latHemi .. '   '
   .. string.format('%02d', lonDeg) .. ' ' .. string.format(minFrmtStr, lonMin) .. '\'' .. lonHemi

end

-- source of Function MIST - https://github.com/mrSkortch/MissionScriptingTools/blob/master/mist.lua
 function MGRSString(MGRS, acc) 
	if acc == 0 then
		return MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph
	else
		return MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format('%0' .. acc .. 'd', roundNumber(MGRS.Easting/(10^(5-acc)), 0)) 
		       .. ' ' .. string.format('%0' .. acc .. 'd', roundNumber(MGRS.Northing/(10^(5-acc)), 0))
	end
end

function heightString(unit)
	local pos = unit:getPosition().p
	local heightMeters = land.getHeight({x = pos.x, y = pos.z})
	local heightMetersRounded = roundNumber(heightMeters, 0)
	local heightFeetRounded = roundNumber(heightMeters * 3.28084, 0)
--	return string.format('ELEV: %dm / %dft', heightMetersRounded, heightFeetRounded)
	return string.format('| ELEV: %dft\n \n', heightFeetRounded)
end

-- From http://lua-users.org/wiki/SimpleRound
 function roundNumber(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

-- -- add the radio commands
-- if JTAC_jtacStatusF10 == true then
    -- timer.scheduleFunction(addRadioCommands, nil, timer.getTime() + 1)
-- end

env.info("JTAC Auto-Lase LUA file loaded ... OK")
tti_jtac_autolase_script_loaded = true