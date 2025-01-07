-- AIRBOSS DOC https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Documentation/Ops.Airboss.html

--AIRBOSS SETTINGS
-- airboss_enable = true

-- airboss_enable_markzones = true

-- airboss_enable_smokezones = true

-- airboss_enable_niceguy = true

-- airboss_enable_tanker = true

-- airboss_enable_rescue_helo = true

function startCvnxRelay()
	if firstSpawnedCvnxRelay ~= true then
		timer.scheduleFunction(function() 
			Group.getByName("CVN7X Relay"):activate()
			tti.debug("AIRBOX CVNX Relay spawned")
		end, nil, timer.getTime() + 7  )
	end
	firstSpawnedCvnxRelay = true
end

function startAirbossOnCvnSpawn()

if airboss_enable == true and mission_era == "modern" or mission_era == "cold_war" then
if carrierOpsTheatre == true then

if carrierCvnExist == true then

BASE:I(cloudBase) 
BASE:I(weatherVisibility )
if weatherVisibility > 5 
then
	if cloudBase > 3000
		then airbossCASE = 1
	
	elseif cloudBase < 3000 and cloudBase >1000
		then airbossCASE = 2
	end
else 
airbossCASE = 3
end

tti.debug("Airboss set to CASE " .. airbossCASE .. " ops.")


local airbossCVN = AIRBOSS:New("CVN-7X", "CVN-7X")

airbossCVN:SetTACAN(43, "X", "CVN")
airbossCVN:SetICLS(5, "LSO")
airbossCVN:SetLSORadio(261)
airbossCVN:SetMarshalRadio(261)
airbossCVN:SetPatrolAdInfinitum(true)
airbossCVN:SetCarrierControlledArea(45)
airbossCVN:SetStaticWeather(true)
airbossCVN:SetMenuSingleCarrier()
airbossCVN:SetRecoveryCase(1)
airbossCVN:SetMaxLandingPattern(3)
airbossCVN:SetDefaultPlayerSkill(AIRBOSS.Difficulty.NORMAL) -- other options EASY / HARD
airbossCVN:SetHandleAIOFF()
airbossCVN:SetMenuRecovery(30, 20, true)
airbossCVN:SetMenuMarkZones(airboss_enable_markzones)
airbossCVN:SetMenuSmokeZones(airboss_enable_smokezones)
airbossCVN:SetAirbossNiceGuy(airboss_enable_niceguy)
airbossCVN:SetRadioRelayMarshal("CVN7X Relay")
airbossCVN:SetRadioRelayLSO("CVN7X Relay")
airbossCVN:SetSoundfilesFolder("Airboss Soundfiles/")
--airbossCVN:Load(nil, "Greenie Board.csv")
--airbossCVN:SetAutoSave(nil, "Greenie Board.csv")

-- create fake recovery window at the end of the mission play
--local window1 = airbossCVN:AddRecoveryWindow("07:31", "23:55", 1, 0, false)
local window1 = airbossCVN:AddRecoveryWindow("07:31", "23:55", airbossCASE, 0, false)

airbossCVN:Start()
startCvnxRelay()

if airboss_enable_tanker == true then
local carrierTanker = nil  --Ops.RecoveryTanker#RECOVERYTANKER
carrierTanker = RECOVERYTANKER:New("CVN-7X", "CVNTanker")
carrierTanker:SetTakeoffHot()
carrierTanker:SetSpeed(274) --True air speed (TAS) in knots. Default 274 knots, which results in ~250 KIAS.
carrierTanker:SetTACAN(31, "KST")
carrierTanker:SetRadio(253, "AM")
carrierTanker:SetRespawnOn()
carrierTanker:Start()
airbossCVN:SetRecoveryTanker(CVNTanker)
end

if airboss_enable_rescue_helo == true then
local RescueheloStennis=RESCUEHELO:New(UNIT:FindByName("CVN-7X"), "CVNRescue")
RescueheloStennis:SetTakeoffHot()
RescueheloStennis:Start()
end

env.info('Airboss Script Loaded... OK')
--trigger.action.outText("AIRBOSS scripts Loaded...", 10)
-- ADD TO CONFIG FILE
-- airboss_enable_markzones = true
-- airboss_enable_smokezones = true
-- airboss_enable_niceguy = true

	timer.scheduleFunction(function() 
	trigger.action.outText(	"<< If the AIRBOSS option does not appear in your F10 - Other Menu, try switching slots a few times and you will get the AIRBOSS message popups! Check the AIRBOSS documentation (link in briefing for more info) >>", 30)
	end, nil, timer.getTime() + 30  )
	
else
tti.debug("CARRIER ERROR DETECTED! Airboss Script DISABLED", true)

end
end

if airboss_enable == false then

	timer.scheduleFunction(function() 
	env.info("AIRBOSS script disabled...")
	end, nil, timer.getTime() + 8  )

end

end
end
startAirbossOnCvnSpawn()
tti_airboss_script_loaded = true