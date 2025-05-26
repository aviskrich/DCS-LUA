--[[

TACT bubble rule script (by Bushmanni, updated by X-man, modified for coalition entry announcement)

Shrinking zone integration with mission editor zone preservation

Requires MIST (4.5.90+ recommended)

]]

-- === Editable variables ===

local warningSound = "warning.ogg"
local infoSound = "info.ogg"
local innerZone = "innerzone"
local outerZone = "outerzone"
local shrinkSound = "Ping1.ogg"
local winningSound = "Winning Sound Effect.ogg"

-- === Zone initialization ===

local initialInnerData = mist.DBs.zonesByName[innerZone]
local initialOuterData = mist.DBs.zonesByName[outerZone]
local initialRatio = initialOuterData.radius / initialInnerData.radius
local defaultShrinkRadius = math.floor(initialInnerData.radius / 1852) -- Convert meters to NM
local finalShrinkRadius = 30 -- Minimum radius in NM

-- === Shrinking variables ===

local shrinkActive = false
local gracePeriod = 60 -- seconds
local graceTimer = nil
local shrinkDuration = 900 -- 15 minutes
local innerMarkerId, outerMarkerId = nil, nil
local lastAnnouncedRadius = nil

-- === Core TACT variables ===

local planes = mist.makeUnitTable({"[all][plane]"})
local PlanesInZone = {}
local PlanesOutOfZone = {}
local redwin = false
local bluewin = false
local pilotNames = {}
local battleSituation = 0

-- === New: Track first coalition in zone ===
local firstCoalitionInZone = nil

-- === Utility functions ===

local function nmToMeters(nm) return nm * 1852 end

function timeTostr(seconds)
    local secs = string.format('%02.0f', math.fmod(seconds, 60))
    local minutes = string.format('%02.0f', math.fmod(seconds/60, 60))
    local hours = string.format('%.0f', math.modf(seconds/3600))
    return (hours .. ":" .. minutes .. ":" .. secs)
end

function getSpeed(velVector)
    return (velVector.x^2 + velVector.y^2 + velVector.z^2)^0.5
end

function hasLanded(unitName)
    if unitName and Unit.getByName(unitName) then
        local planeUnit = Unit.getByName(unitName)
        local location3d = planeUnit:getPoint()
        local location2d = mist.utils.makeVec2(location3d)
        local agl = location3d.y - land.getHeight(location2d)
        return getSpeed(planeUnit:getVelocity()) < 5 and agl < 7
    end
    return false
end

-- === Zone management ===

function SetZoneRadius(radiusNM)
    local innerRadius = nmToMeters(radiusNM)
    local outerRadius = innerRadius * initialRatio

    -- Update MIST DB zones
    mist.DBs.zonesByName[innerZone].radius = innerRadius
    mist.DBs.zonesByName[outerZone].radius = outerRadius

    -- Remove existing markers
    if innerMarkerId then 
        if not mist.marker.remove(innerMarkerId) then
            env.error("STAR -- Failed to remove inner marker")
        end
    end
    if outerMarkerId then mist.marker.remove(outerMarkerId) end
    if innerLabelId then mist.marker.remove(innerLabelId) end
    if outerLabelId then mist.marker.remove(outerLabelId) end

    -- Draw new circles with high-visibility colors
    innerMarkerId = mist.marker.add({
        pos = mist.DBs.zonesByName[innerZone].point,
        radius = innerRadius,
        mType = 2,
        color = {1, 0, 0, 1},
        fillColor = {0, 0, 0, 0},
        lineType = 1,
    }).idx

    outerMarkerId = mist.marker.add({
        pos = mist.DBs.zonesByName[outerZone].point,
        radius = outerRadius,
        mType = 2,
        color = {1, 0, 0, 1},
        fillColor = {0, 0, 0, 0},
        lineType = 1,
    }).idx

    -- Add mark panels (labels) at the center of each zone
    innerLabelId = mist.marker.add({
        pos = mist.DBs.zonesByName[innerZone].point,
        mType = 0, -- Mark panel
        text = "COMBAT ZONE",
        fontSize = 20,
        fontColor = {1,1,1,1}
    }).idx

    outerLabelId = mist.marker.add({
        pos = mist.DBs.zonesByName[outerZone].point,
        mType = 0, -- Mark panel
        text = "WARNING ZONE",
        fontSize = 20,
        fontColor = {1,1,1,1}
    }).idx
end

-- === Shrinking logic ===

function StartShrinkZone()
    if shrinkActive or graceTimer then return end

    -- Announce which coalition entered first
    local coalitionName = "UNKNOWN"
    if firstCoalitionInZone == 1 then
        coalitionName = "RED"
    elseif firstCoalitionInZone == 2 then
        coalitionName = "BLUE"
    end
    trigger.action.outText(coalitionName .. " SIDE HAS INITIATED SHRINKING - SHRINKING BEGINS IN 60 SECONDS", 25)

    graceTimer = mist.scheduleFunction(function()
        if #PlanesInZone == 0 then
            trigger.action.outText("GRACE PERIOD CANCELLED - NO PLANES IN ZONE", 15)
            trigger.action.outSound(infoSound)
            graceTimer = nil
            return
        end

        shrinkActive = true
        local startTime = timer.getTime()
        local shrinkPerSecond = (defaultShrinkRadius - finalShrinkRadius)/shrinkDuration

        mist.scheduleFunction(function()
            if not shrinkActive then return end
            local elapsed = timer.getTime() - startTime
            if elapsed >= shrinkDuration then
                SetZoneRadius(finalShrinkRadius)
                trigger.action.outText("MINIMUM COMBAT RADIUS OF 30nm REACHED", 15)
                trigger.action.outSound(infoSound)
                shrinkActive = false
                return
            end

            local newRadius = defaultShrinkRadius - (shrinkPerSecond * elapsed)
            SetZoneRadius(newRadius)
            local roundedRadius = math.floor(newRadius / 5) * 5
            if lastAnnouncedRadius == nil or roundedRadius < lastAnnouncedRadius then
                trigger.action.outText(string.format("COMBAT ZONE SHRINKING: %.1f NM", newRadius), 15)
                trigger.action.outSound(shrinkSound)
                lastAnnouncedRadius = roundedRadius
            end
        end, {}, timer.getTime() + 1, 1)
    end, {}, timer.getTime() + gracePeriod)
end

-- === Main logic loop ===

function mainLoop()
    mist.scheduleFunction(mainLoop, {}, timer.getTime() + 1)

    -- Shrink activation
    if not shrinkActive and not graceTimer and #PlanesInZone > 0 then
        StartShrinkZone()
    end

    if not redwin and not bluewin then
        -- checking for planes in zone
        for index, plane in ipairs(planes) do
            if plane then
                local planeGroupID = mist.DBs.unitsByName[plane].groupId
                if Unit.getByName(plane) and planeGroupID then
                    local unitTable = mist.getUnitsInZones({plane}, {innerZone}, "cylinder")
                    if #unitTable > 0 then
                        table.insert(PlanesInZone, plane)
                        table.remove(planes, index)
                        env.info("STAR -- " .. Unit.getByName(plane):getPlayerName() .. " entered combat area. Time:" .. timeTostr(timer.getTime()))
                        pilotNames[plane] = Unit.getByName(plane):getPlayerName()
                        trigger.action.outTextForGroup(planeGroupID, "You or a member of your group are inside combat area.", 30)
                        trigger.action.outSoundForGroup(planeGroupID, infoSound)

                        -- === New: Set first coalition if not already set ===
                        if #PlanesInZone == 1 and not firstCoalitionInZone then
                            firstCoalitionInZone = Unit.getByName(plane):getCoalition()
                        end
                    end
                end
            end
        end

        -- checking for landed planes inside the area and blowing them up
        for index, plane in ipairs(PlanesInZone) do
            if plane and Unit.getByName(plane) then
                if hasLanded(plane) then
                    local planeGroupID = mist.DBs.unitsByName[plane].groupId
                    env.info("STAR -- " .. Unit.getByName(plane):getPlayerName() .. " was blown up after landing inside combat area. Time:" .. timeTostr(timer.getTime()))
                    trigger.action.explosion(Unit.getByName(plane):getPoint(), 500)
                    table.remove(PlanesInZone, index)
                end
            end
        end

        -- checking for planes about to go outside of zone
        for index, plane in ipairs(PlanesInZone) do
            if plane then
                local unitTable = mist.getUnitsInZones({plane}, {innerZone}, "cylinder")
                if #unitTable == 0 then
                    local planeGroupID = mist.DBs.unitsByName[plane].groupId
                    trigger.action.outTextForGroup(planeGroupID, "You or a member of your group are about to leave combat area.", 1)
                    trigger.action.outSoundForGroup(planeGroupID, infoSound)
                end
            end
        end

        -- checking for planes outside of zone
        for index, plane in ipairs(PlanesInZone) do
            if plane then
                local unitTable = mist.getUnitsInZones({plane}, {outerZone}, "cylinder")
                if #unitTable == 0 then
                    table.insert(PlanesOutOfZone, plane)
                    table.remove(PlanesInZone, index)
                    local planeGroupID = mist.DBs.unitsByName[plane].groupId
                    env.info("STAR -- " .. pilotNames[plane] .. " exited combat area. Time:" .. timeTostr(timer.getTime()))
                    trigger.action.outTextForGroup(planeGroupID, "You or a member of your group are outside combat area and cannot return.", 60)
                    trigger.action.outSoundForGroup(planeGroupID, infoSound)
                end
            end
        end

        -- checking for returning planes in warning zone
        for index, plane in ipairs(PlanesOutOfZone) do
            if plane then
                local unitTable = mist.getUnitsInZones({plane}, {outerZone}, "cylinder")
                if #unitTable > 0 then
                    local planeGroupID = mist.DBs.unitsByName[plane].groupId
                    trigger.action.outTextForGroup(planeGroupID, "\nWarning! Warning! You or a member of your group can't return to combat area. Turn around!", 1)
                    trigger.action.outSoundForGroup(planeGroupID, warningSound)
                end
            end
        end

        -- checking for planes in detonation zone
        for index, plane in ipairs(PlanesOutOfZone) do
            if plane then
                local unitTable = mist.getUnitsInZones({plane}, {innerZone}, "cylinder")
                if #unitTable > 0 then
                    env.info("STAR -- " .. Unit.getByName(plane):getPlayerName() .. " was blown up trying to re-enter combat area. Time:" .. timeTostr(timer.getTime()))
                    trigger.action.explosion(Unit.getByName(plane):getPoint(), 500)
                end
            end
        end

        -- checking for dead planes and resetting the slot
        for index, plane in ipairs(PlanesOutOfZone) do
            if plane then
                if not Unit.getByName(plane) then
                    table.insert(planes, plane)
                    table.remove(PlanesOutOfZone, index)
                end
            end
        end

        -- checking for combat area control
        local redsInside, bluesInside, redsOutside, bluesOutside = 0, 0, 0, 0
        for index, plane in ipairs(PlanesInZone) do
            if plane then
                local planeCoal = Unit.getByName(plane):getCoalition()
                if planeCoal == 1 then
                    redsInside = redsInside + 1
                elseif planeCoal == 2 then
                    bluesInside = bluesInside + 1
                end
            end
        end

        for index, plane in ipairs(planes) do
            if plane then
                if Unit.getByName(plane) then
                    local planeCoal = Unit.getByName(plane):getCoalition()
                    if planeCoal == 1 then
                        redsOutside = redsOutside + 1
                    elseif planeCoal == 2 then
                        bluesOutside = bluesOutside + 1
                    end
                end
            end
        end

        if (redsInside > 0) and (bluesInside == 0) and (not redWinTimer) and (not redwin) then
            redWinTimer = timer.getTime()
            blueWinTimer = false
            trigger.action.outText("Red has taken control of the battle area.", 30)
            trigger.action.outSound(infoSound)
            env.info("STAR -- Red takes control of battle area. Time:" .. timeTostr(timer.getTime()))
            if (battleSituation == 1) and (bluesInside == 0) then
                trigger.action.outText("All Blues are out of the fight. Red has control of the battle area.\nRTB.", 60)
                trigger.action.outSound(winningSound)
                env.info("STAR -- All Blues are out of the fight. Red has control of the battle area. Time:" .. timeTostr(timer.getTime()))
                redwin = true
                shrinkActive = false
            end
        elseif (redsInside == 0) and (bluesInside > 0) and (not blueWinTimer) and (not bluewin) then
            blueWinTimer = timer.getTime()
            redWinTimer = false
            trigger.action.outText("Blue has taken control of battle area.", 30)
            trigger.action.outSound(infoSound)
            env.info("STAR -- Blue takes control of the battle area. Time:" .. timeTostr(timer.getTime()))
            if (battleSituation == 1) and (redsInside == 0) then
                trigger.action.outText("All Reds are out of the fight. Blue has control of the battle area.\nRTB.", 60)
                trigger.action.outSound(winningSound)
                env.info("STAR -- All Reds are out of the fight. Blue has control of the battle area. Time:" .. timeTostr(timer.getTime()))
                bluewin = true
                shrinkActive = false
            end
        elseif ((redsInside == 0) and (bluesInside == 0)) and (redWinTimer or blueWinTimer) then
            redWinTimer = false
            blueWinTimer = false
            trigger.action.outText("Battle area is empty. Battle area control is neutralized.", 30)
            trigger.action.outSound(infoSound)
            env.info("STAR -- Battle area is empty. Battle area control is neutralized. Time:" .. timeTostr(timer.getTime()))
            battleSituation = 0
            shrinkActive = false
        elseif ((redsInside > 0) and (bluesInside > 0)) and (redWinTimer or blueWinTimer) then
            redWinTimer = false
            blueWinTimer = false
            trigger.action.outText("Battle area is contested. Battle area control is neutralized.", 30)
            trigger.action.outSound(infoSound)
            env.info("STAR -- Battle area is contested. Battle area control is neutralized. Time:" .. timeTostr(timer.getTime()))
            battleSituation = 1
        end

        if redWinTimer and (timer.getTime() - redWinTimer) > 300 and ((not bluewin) and (not redwin)) then
            trigger.action.outText("Red has controlled battle area for 5 mins.\nRTB", 60)
            redwin = true
            env.info("STAR -- Red has controlled the battle area for 5 mins. Time:" .. timeTostr(timer.getTime()))
            shrinkActive = false
        end

        if blueWinTimer and (timer.getTime() - blueWinTimer) > 300 and ((not bluewin) and (not redwin)) then
            trigger.action.outText("Blue has controlled battle area for 5 mins.\nRTB", 60)
            bluewin = true
            env.info("STAR-- Blue has controlled the battle area for 5 mins. Time:" .. timeTostr(timer.getTime()))
            shrinkActive = false
        end
    end
end

SetZoneRadius(defaultShrinkRadius)
env.info("STAR -- Mission started. Time:" .. timeTostr(timer.getTime()))
mainLoop()
