-- Define SATAC zone radius in nautical miles
local defaultSATAC_Zone_Radius = 100  -- Set desired radius in nautical miles
local SATAC_Zone_Radius = defaultSATAC_Zone_Radius  -- Set desired radius in nautical miles
local SATAC_Zones = {}  -- Table for storing all zones
local activeZoneIndex = 1  -- Index of active zone

-- Create zones based on static objects "SATAC_Center 1", "SATAC_Center 2", etc.
local zoneCount = 0
local zoneIndex = 1

-- Timer that will reduce zone radius every second
local shrinkScheduler = nil

-- Find all zone centers
while true do
    local centerStatic = STATIC:FindByName("SATAC_Center " .. zoneIndex, false)
    if not centerStatic then
        -- If we didn't find a zone with current index, try to find without index (for backward compatibility)
        if zoneIndex == 1 then
            centerStatic = STATIC:FindByName("SATAC_Center")
            if not centerStatic then
                break
            end
        else
            break
        end
    end
    
    local centerCoordinate = centerStatic:GetCoordinate()
    -- Create SATAC zone using ZONE_RADIUS
    local zoneName = "SATAC_ZONE " .. zoneIndex
    local newZone = ZONE_RADIUS:New(zoneName, centerCoordinate:GetVec2(), UTILS.NMToMeters(SATAC_Zone_Radius))
    
    -- Add zone to the table
    table.insert(SATAC_Zones, newZone)
    zoneCount = zoneCount + 1
    zoneIndex = zoneIndex + 1
end

if zoneCount == 0 then
    env.error("No SATAC_Center objects found!")
    return  -- Stop the script if objects are not found
end

-- Function to stop the zone shrink timer
local function stopShrinkTimer()
    if shrinkScheduler then
        shrinkScheduler:Stop()
    end
end

-- Draw only the active zone
local function DrawActiveZone()
    -- First remove drawing of all zones
    for _, zone in pairs(SATAC_Zones) do
        zone:UndrawZone()
    end
    -- Draw only the active zone
    SATAC_Zones[activeZoneIndex]:DrawZone(-1, {1,0,0})
end

DrawActiveZone()

-- Create group sets for each coalition
redPlayerSet = SET_GROUP:New():FilterCoalitions("red"):FilterPrefixes({"fox"}):FilterStart()
bluePlayerSet = SET_GROUP:New():FilterCoalitions("blue"):FilterPrefixes({"fox"}):FilterStart()

-- Initialize variables for tracking game state
local gameActive = true
local gameStarted = false
local redEnteredZoneTime = nil
local blueEnteredZoneTime = nil
local startTimer = nil  -- Time when the game should start after 120 seconds
local groupsOutsideZone = {}

-- Initialize MSRS only once
msrs = MSRS:New('', 305.00, 0, MSRS.Backend.SRSEXE):SetCoalition(coalition.side.NEUTRAL):SetVoice("en-US-Standard-B")

-- Cache frequently used sounds
local warningSound = USERSOUND:New("warning.wav")
local bellSound = USERSOUND:New("top-gun-bell.ogg")
local chooseSound = USERSOUND:New("choose_triple-bell.wav")

-- Function to send messages only to participating groups using MIST
local function SendMessageToParticipants(messageText, duration, messageTo, messageName, soundName)
    duration = duration or 10
    local _msgName = messageName or "SATAC Status"
    local _msgFor = messageTo
    local _sound = soundName or nil
    
    if _msgFor ~= nil then
        if (type(messageTo)=='string') then 
            _msgFor = {units = {messageTo}}
        elseif (type(messageTo)=='table') then
            _msgFor = {units = messageTo}
        elseif (not messageTo or (type(messageTo)=='number' and messageTo == 0)) then
            _msgFor = {coa = {'all'}}
        end
    else
        local currentPlayers = {}
        _msgFor = {units = currentPlayers}
        
        -- Optimization: collect unit names in one pass for each set
        local function collectUnitNames(group)
            for i = 1, #group:GetUnits() do
                table.insert(currentPlayers, group:GetUnit(i):GetName())
            end
        end
        
        redPlayerSet:ForEachGroup(collectUnitNames)
        bluePlayerSet:ForEachGroup(collectUnitNames)
    end
    
    mist.message.add({
        name = _msgName,
        text = messageText,
        displayTime = duration,
        msgFor = _msgFor,
        sound = _sound
    })
end

-- Function to display status panel using MIST
local function DisplayStatusPanel()
    local activeZone = SATAC_Zones[activeZoneIndex]
    local redAliveTotal = redPlayerSet:CountAlive()
    local blueAliveTotal = bluePlayerSet:CountAlive()

    -- Get the number of alive groups in the zone
    local redCountInZone = 0
    local blueCountInZone = 0
    
    redPlayerSet:ForEachGroup(function(group)
        if group:IsAlive() and group:IsCompletelyInZone(activeZone) then
            redCountInZone = redCountInZone + 1
        end
    end)

    bluePlayerSet:ForEachGroup(function(group)
        if group:IsAlive() and group:IsCompletelyInZone(activeZone) then
            blueCountInZone = blueCountInZone + 1
        end
    end)

    -- Form status panel message
    local statusMessage = "ATTACK STATUS:\n--------------------------------\n"
    statusMessage = statusMessage .. string.format("Active zone: %d of %d\n", activeZoneIndex, zoneCount)
    
    if gameStarted then
        statusMessage = statusMessage .. "Game has started!\n"
    else
        statusMessage = statusMessage .. "Game has not started yet.\n"
    end

    statusMessage = statusMessage .. string.format("Red: alive %d, in zone %d\n",  redAliveTotal, redCountInZone)
    statusMessage = statusMessage .. string.format("Blue: alive %d, in zone %d\n",  blueAliveTotal, blueCountInZone)

    -- Add information about time until game start, if applicable
    if not gameStarted and (redEnteredZoneTime ~= nil or blueEnteredZoneTime ~= nil) and startTimer ~= nil then
        local timeRemaining = math.floor(startTimer - timer.getTime())
        if timeRemaining > 0 then
            statusMessage = statusMessage .. string.format("-------------------------------------\nGame will start in %d seconds.\n", timeRemaining)
        else
            statusMessage = statusMessage .. "-------------------------------------\nGame will start soon...\n"
        end
    end

    -- Send status panel only to participants
    local currentPlayerUnitNames = {}
    
    -- Optimization: collect unit names in one pass for each set
    local function collectUnitNames(group)
        for i = 1, #group:GetUnits() do
            table.insert(currentPlayerUnitNames, group:GetUnit(i):GetName())
        end
    end
    
    redPlayerSet:ForEachGroup(collectUnitNames)
    bluePlayerSet:ForEachGroup(collectUnitNames)
    
    SendMessageToParticipants(statusMessage, 25, currentPlayerUnitNames, "StatusPanel_")
end

-- Function to reset the game
local function ResetGame()
    -- Reset game variables
    gameActive = true
    gameStarted = false
    redEnteredZoneTime = nil
    blueEnteredZoneTime = nil
    startTimer = nil
    groupsOutsideZone = {}
end

-- Function to check game state and process logic
local function CheckGroupsInZone()
    if not gameActive then
        return
    end

    local activeZone = SATAC_Zones[activeZoneIndex]
    local currentTime = timer.getTime()

    -- Update lists of alive groups in the zone
    local redCount = 0
    local blueCount = 0
    
    -- Optimization: count groups in zone in one pass
    redPlayerSet:ForEachGroup(function(group)
        if group and group:IsAlive() then
            if group:IsCompletelyInZone(activeZone) then
                redCount = redCount + 1
            end
        end
    end)

    bluePlayerSet:ForEachGroup(function(group)
        if group and group:IsAlive() then
            if group:IsCompletelyInZone(activeZone) then
                blueCount = blueCount + 1
            end
        end
    end)

    local redAliveTotal = redPlayerSet:CountAlive()
    local blueAliveTotal = bluePlayerSet:CountAlive()

    local allRedInZone = (redCount == redAliveTotal) and (redAliveTotal > 0)
    local allBlueInZone = (blueCount == blueAliveTotal) and (blueAliveTotal > 0)

    -- Game start logic
    if not gameStarted then
        -- Update entry time of first groups
        if redCount > 0 and redEnteredZoneTime == nil then
            redEnteredZoneTime = currentTime
        end
        if blueCount > 0 and blueEnteredZoneTime == nil then
            blueEnteredZoneTime = currentTime
        end

        if redEnteredZoneTime ~= nil and blueEnteredZoneTime ~= nil then
            if allRedInZone and allBlueInZone then
                -- All groups from both sides are in the zone
                gameStarted = true
                msrs:PlayText("Game started!", 1)
                SendMessageToParticipants("Game started! All aircraft have entered the zone.", 10)         
                bellSound:ToAll()                
            else
                -- Start a 120-second timer
                if startTimer == nil then
                    startTimer = math.max(redEnteredZoneTime or 0, blueEnteredZoneTime or 0) + 120
                    msrs:PlayText("At least one aircraft from each side has entered the zone. Game start timer initiated! 2 minutes until start!", 2)
                end
                if currentTime >= startTimer then
                    gameStarted = true
                    msrs:PlayText("Game started!", 1)
                    bellSound:ToAll()
                    SendMessageToParticipants("Game started! 120 seconds have passed since the first aircraft from both sides entered the zone.", 10)                    
                end
            end
        end
    end

    -- Process game logic only after game has started
    if gameStarted then
        -- Variables to track presence of active players in combat
        local redActiveInCombat = false
        local blueActiveInCombat = false
        
        -- Common function to check groups outside the zone
        local function checkGroupOutsideZone(group)
            if group and group:IsAlive() then
                local groupName = group:GetName()
                
                if group:IsCompletelyInZone(activeZone) then
                    -- Group is in zone, reset timer
                    groupsOutsideZone[groupName] = nil
                    
                    -- Mark that there are active players in the zone
                    if group:GetCoalition() == coalition.side.RED then
                        redActiveInCombat = true
                    else
                        blueActiveInCombat = true
                    end
                else
                    -- Group is outside the zone
                    local unit = group:GetUnits()[1]
                    local playerName = unit and unit:GetPlayerName()
                    
                    if not groupsOutsideZone[groupName] then
                        groupsOutsideZone[groupName] = currentTime + 60
                        -- Send message to the group only if it's a player
                        if playerName then
                            SendMessageToParticipants(
                                string.format("%s has left the zone. You have %i seconds to return!", 
                                playerName, 60), 
                                10, 
                                unit:GetName(),
                                "OutsideWarning_" .. groupName
                            )
                            warningSound:ToGroup(GROUP:FindByName(groupName))
                        end
                    else
                        -- Send message to the group only if it's a player
                        if playerName then
                            local timeLeft = math.floor(groupsOutsideZone[groupName] - currentTime)
                            SendMessageToParticipants(
                                string.format("%s has left the zone. You have %i seconds to return!", 
                                playerName, timeLeft), 
                                10, 
                                unit:GetName(),
                                "OutsideWarning_" .. groupName
                            )
                            warningSound:ToGroup(GROUP:FindByName(groupName))
                        end
                        
                        -- If timer hasn't expired yet, consider the group active in combat
                        if currentTime < groupsOutsideZone[groupName] then
                            if group:GetCoalition() == coalition.side.RED then
                                redActiveInCombat = true
                            else
                                blueActiveInCombat = true
                            end
                        end
                        
                        if currentTime >= groupsOutsideZone[groupName] then
                            group:Explode(100)                            
                            groupsOutsideZone[groupName] = nil
                        end
                    end
                end
            end
        end

        -- Check all groups
        redPlayerSet:ForEachGroup(checkGroupOutsideZone)
        bluePlayerSet:ForEachGroup(checkGroupOutsideZone)
        
        -- Check if there are active players in combat
        if not (redActiveInCombat or blueActiveInCombat) then
            -- If there are no active players from at least one side, reset the game
            SendMessageToParticipants("No active players left in the zone. Game reset.", 10)
            msrs:PlayText("No active players left in the zone. Game reset.", 2)
            ResetGame()
        end
    end
end

-- Scheduler for regular game state checks
SCHEDULER:New(nil, CheckGroupsInZone, {}, 0, 2)

-- Scheduler for updating status panel every 5 seconds
SCHEDULER:New(nil, DisplayStatusPanel, {}, 0, 5)

---------------------------------------------------
-- CHAT MESSAGE PROCESSING FOR MISSION SETTINGS --
---------------------------------------------------

-- Table for storing information about disabled AWACS
DisabledAWACS = {}

-- Function to disable all AWACS
function DisableAllAWACS()
    local awacsSet = SET_GROUP:New():FilterPrefixes("AWACS"):FilterStart()
    awacsSet:ForEachGroup(function(group)
        local groupName = group:GetName()
        local groupTemplate = group:GetTemplate()
        -- Save group template for later re-enabling
        DisabledAWACS[groupName] = groupTemplate
        group:Explode(100)
        if (group) then 
            group:Destroy()
        end
    end)
    MESSAGE:New("ATTACK: All AWACS disabled.", 10):ToAll()
end

-- Function to enable all AWACS
function EnableAllAWACS()
    for groupName, groupTemplate in pairs(DisabledAWACS) do
        -- Create SPAWN object using saved template
        GROUP:FindByName(groupName):Respawn(nil, true)
    end
    -- Clear the table after respawning groups
    DisabledAWACS = {}
    MESSAGE:New("ATTACK: All AWACS enabled.", 10):ToAll()
end

-- Function to restart the mission
function RestartMission()
    -- Send message to all players
    MESSAGE:New("ATTACK: Mission will restart in 10 seconds.", 10):ToAll()

    -- Delay before restarting mission
    TIMER:New(function()
        trigger.action.setUserFlag("9001", true)
    end):Start(10)
end

function SetZoneRadius(radius, isShowMessage)
    SATAC_Zone_Radius = radius
    
    -- Update radius for all zones
    for i, zone in ipairs(SATAC_Zones) do
        zone:UndrawZone()
        zone:SetRadius(UTILS.NMToMeters(SATAC_Zone_Radius))
    end
    
    -- Redraw active zone
    DrawActiveZone()
    
    if isShowMessage then
        MESSAGE:New("ATTACK: SATAC zone radius set to ".. radius .." nautical miles.", 10):ToAll()
    end
end

-- Function to randomly select active zone
function SelectRandomZone()
    stopShrinkTimer()
    
    local oldZoneIndex = activeZoneIndex
    chooseSound:ToAll()

    -- Send message about starting selection process
    MESSAGE:New("ATTACK: Initiating new combat zone selection process...", 5):ToAll(nil, 0)
    
    -- Add a small delay to create a "thinking" effect
    SCHEDULER:New(nil, function()
        MESSAGE:New("ATTACK: Analyzing tactical situation...", 5):ToAll(nil, 1)
        
        SCHEDULER:New(nil, function()
            MESSAGE:New("ATTACK: Processing weather data and terrain...", 5):ToAll(nil, 2)
            
            SCHEDULER:New(nil, function()
                -- Select a random zone different from current one, if we have more than one zone
                if #SATAC_Zones > 1 then
                    MESSAGE:New("ATTACK: We have " .. #SATAC_Zones .. " possible zones. Selecting the optimal one...", 5):ToAll(nil, 2.5)
                    
                    repeat
                        activeZoneIndex = math.random(1, #SATAC_Zones)
                    until activeZoneIndex ~= oldZoneIndex
                    
                    MESSAGE:New("ATTACK: Zone #" .. activeZoneIndex .. " selected! Previous zone was #" .. oldZoneIndex, 5):ToAll(nil, 3)
                else
                    activeZoneIndex = 1
                    MESSAGE:New("ATTACK: Only one zone available. Choice is obvious!", 5):ToAll(nil, 2)
                end
                
                ResetGame()
                
                -- Draw new active zone
                DrawActiveZone()
                
                -- Final message with a small delay
                SCHEDULER:New(nil, function()
                    MESSAGE:New("ATTACK: Zone #" .. activeZoneIndex .. " activated! Everyone take combat positions!", 10):ToAll(nil, 1.5)
                    msrs:PlayText("Attention! New SATAC zone activated! Prepare for combat!", 1)
                end, {}, 2)
                
                -- Update global variable SATAC_Zone
                SATAC_Zone = SATAC_Zones[activeZoneIndex]
                SetZoneRadius(defaultSATAC_Zone_Radius)

                StartShrinkZone()
                MESSAGE:New("ATTACK: Shrink zone started!", 10):ToAll()
            end, {}, 3)
        end, {}, 3)
    end, {}, 2)

    return SATAC_Zone
end

function StartShrinkZone()
    local shrinkDurationSec = 20 * 60 -- 20 minutes
    local finalRadius = 2.5 -- miles
    local startRadius = SATAC_Zone_Radius
    local shrinkStep = (startRadius - finalRadius) / shrinkDurationSec

    if shrinkScheduler then
        shrinkScheduler:Start()
        env.info("Shrink zone sheduler started")
    else
        shrinkScheduler = SCHEDULER:New(nil, function()
            if SATAC_Zone_Radius > finalRadius then
                local newRadius = SATAC_Zone_Radius - shrinkStep
                if newRadius < finalRadius then
                    newRadius = finalRadius
                end
                SetZoneRadius(newRadius)
                env.info("Shrink zone radius set to " .. newRadius .. " meters")
            else
                -- Stop timer when minimum radius is reached
                shrinkScheduler:Stop()
                env.info("Shrink zone stopped")
            end

        end, {}, 0, 1)
        env.info("Shrink zone sheduler create + started")
    end
end


-- Create F10 menu for random zone selection
function CreateF10Menu()
    -- Create root menu for administrators
    local adminMenu = MENU_MISSION:New("ATTACK Management")
    
    -- Add menu item for random zone selection
    local randomZoneMenu = MENU_MISSION_COMMAND:New("Select random zone", adminMenu, SelectRandomZone)
    local startShrinkMenu = MENU_MISSION_COMMAND:New("Start Shrink", adminMenu, StartShrinkZone)
    
    -- Add menu items for AWACS management
    -- MENU_MISSION_COMMAND:New("Disable all AWACS", adminMenu, DisableAllAWACS)
    
    -- MENU_MISSION_COMMAND:New("Enable all AWACS", adminMenu, EnableAllAWACS)
    
    -- Add menu item for mission restart
    MENU_MISSION_COMMAND:New("Restart mission", adminMenu, RestartMission)
    
    -- Add submenu for changing zone radius
    local radiusMenu = MENU_MISSION:New("Change zone radius", adminMenu)

    -- Add various radius options
    local radiusOptions = {10, 20, 30, 40, 50}
    for _, radius in ipairs(radiusOptions) do
        MENU_MISSION_COMMAND:New(radius .. " nautical miles", radiusMenu, function() SetZoneRadius(radius) end)
    end
end

_SETTINGS:SetPlayerMenuOff() -- DO NOT REMOVE!!!
CreateF10Menu()