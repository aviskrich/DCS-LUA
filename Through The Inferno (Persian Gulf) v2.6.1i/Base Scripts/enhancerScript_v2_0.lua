----------------------- INIT -------------------------------------------------------------

local evento = {};
enhancer = {};
enhancer.common = {};
enhancer.lasedrone = {};
enhancer.recon = {};
enhancer.strike = {};
enhancer.sead = {};
enhancer.attack = {};
enhancer.sweep = {};
enhancer.escort = {};


------------------------- CONFIGURATION -------------------------------------------------------------
enhancer.lasedrone.availability = 100; -- chance of lase support available in the mission. 0 = no available at all; 1 - 99 = % chances availability; 100% = always available
enhancer.lasedrone.waitTime = 300; -- time in seconds between request a lase support and the lase support became available to use
enhancer.recon.availability = 100;-- chance of recon support available in the mission. 0 = no available at all; 1 - 99 = % chances availability; 100% = always available
enhancer.recon.waitTime = 300;-- time in seconds between request a recon support and the recon support become available to use
enhancer.strike.availability = 100;-- chance of strike support available in the mission. 0 = no available at all; 1 - 99 = % chances availability; 100% = always available
enhancer.strike.waitTime = 300;-- time in seconds between request a strike support and the strike support become available to use
enhancer.sead.availability = 100; -- chance of SEAD support available in the mission. 0 = no available at all; 1 - 99 = % chances availability; 100% = always available
enhancer.sead.waitTime = 300;-- time in seconds between request a SEAD support and the SEAD support became available to use
enhancer.sead.maxRequest = 2; -- max number of SEAD packages available during current mission
enhancer.attack.availability = 100;-- chance of ground attack support available in the mission. 0 = no available at all; 1 - 99 = % chances availability; 100% = always available
enhancer.attack.waitTime = 300;-- time in seconds between request a ground attack support and the ground attack support become available to use
enhancer.attack.maxRequest = 2;-- max number of ground attack packages available during current mission
enhancer.sweep.availability = 100;-- chance of fighter sweep support available in the mission. 0 = no available at all; 1 - 99 = % chances availability; 100% = always available
enhancer.sweep.waitTime = 300;-- time in seconds between request a fighter sweep support and the fighter sweep support become available to use
enhancer.sweep.maxRequest = 2; -- max number of fighter sweep packages available during current mission
enhancer.escort.availability = 100;-- chance of escort available in the mission. 0 = no available at all; 1 - 99 = % chances availability; 100% = always available
enhancer.escort.waitTime = 300;-- time in seconds between request a escort package and the escort support become available to use
enhancer.escort.maxRequest = 2;-- max number of escort packages available during current mission


----------------------- VARIABLES -------------------------------------------------------------
enhancer.common.RPPos = nil;
enhancer.common.TakeOff = nil;
enhancer.common.radioFreq = nil;
enhancer.lasedrone.laserPos = nil;
enhancer.lasedrone.laserCode = nil;
enhancer.lasedrone.laserSpot = nil;
enhancer.lasedrone.droneName = "";
enhancer.lasedrone.reaperInProgress = false;
enhancer.lasedrone.reaperInOA = false;
enhancer.lasedrone.isLaseAvailable = false;
enhancer.lasedrone.currentLasedTarget = nil;
enhancer.recon.satellitePos = nil;
enhancer.recon.satelliteInProgress = false;
enhancer.recon.satelliteInOA = false;
enhancer.recon.isSatelliteAvailable = false;
enhancer.strike.herculesPos = nil;
enhancer.strike.herculesInProgress = false;
enhancer.strike.herculesInOA = false;
enhancer.strike.isHerculesAvailable = false;
enhancer.sead.samList = "SNR_75V;TOR 9A331;2S6 TUNGUSKA;55G6 EWR;1L13 EWR;S-300PS 54K6 CP;S-300PS 64H6E SR;DOG EAR RADAR;SA-11 BUK CC 9S470M1;S-300PS 40B6M TR;S-300PS 40B6MD SR; SA-11 BUK SR 9S18M1;STRELA-10M3;M48 CHAPARRAL;M1097 AVENGER;HQ-7_STR_SP;HAWK TR;HAWK SR;HAWK CWAR;PATRIOT ECS;PATRIOT AMG;NASAMS_RADAR_MPQ64F1;PATRIOT STR;RAPIER_FSA_BLINDFIRE_RADAR;RAPIER_FSA_OPTICAL_TRACKER_UNIT;P-19 S-125 SR;SNR S-125 TR;ROLAND RADAR;OSA 9A33 LN;KUB 1S1 STR;RPC 5N62V";
enhancer.sead.targetPos = nil;
enhancer.sead.packageInProgress = false;
enhancer.sead.packageInOA = false;
enhancer.sead.isPackageAvailable = false;
enhancer.sead.packageName = nil;
enhancer.sead.targetGroupName = nil;
enhancer.sead.currentRequest = 0;
enhancer.attack.targetPos = nil;
enhancer.attack.packageInProgress = false;
enhancer.attack.packageInOA = false;
enhancer.attack.isPackageAvailable = false;
enhancer.attack.packageName = nil;
enhancer.attack.targetGroupName = nil;
enhancer.attack.currentRequest = 0;
enhancer.sweep.targetPos = nil;
enhancer.sweep.packageInProgress = false;
enhancer.sweep.packageInOA = false;
enhancer.sweep.isPackageAvailable = false;
enhancer.sweep.packageName = nil;
enhancer.sweep.targetGroupName = nil;
enhancer.sweep.currentRequest = 0;
enhancer.escort.targetPos = nil;
enhancer.escort.Route = {};
enhancer.escort.packageInProgress = false;
enhancer.escort.packageInOA = false;
enhancer.escort.isPackageAvailable = false;
enhancer.escort.packageName = nil;
enhancer.escort.targetGroupName = nil;
enhancer.escort.currentRequest = 0;
enhancer.escort.lastSearchPos = nil;
enhancer.escort.RWRUnitList = "";
enhancer.escort.searchUnitList = {};
enhancer.escort.currentTarget = nil;
enhancer.escort.ignoreTargets = false;
enhancer.escort.ignoreTargetsList = "";
enhancer.escort.speed = 55;
enhancer.escort.ROEAttack = false;
enhancer.escort.currentROE = false;

----------------------- FUNCTIONS ----------------------------------------------------------------------
function evento:onEvent(event)
	if (world.event.S_EVENT_MARK_CHANGE == event.id) then	
		if (string.match(event.text, "DO_LASE;") ~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				if enhancer.lasedrone.laserSpot ~= nil then
					--trigger.action.outText("Laser destruido", 15, false)						
					enhancer.lasedrone.laserSpot:destroy()
					enhancer.lasedrone.laserSpot = nil
				end
			
				local index1 = string.find(event.text, ";", 0)
				enhancer.lasedrone.laserCode = enhancer.trim(string.sub(event.text, index1 + 1, string.len(event.text)))			
				enhancer.lasedrone.laserPos = event.pos
				--trigger.action.outText("Target for laser; X: " .. enhancer.lasedrone.laserPos.x .. "; Y: " .. enhancer.lasedrone.laserPos.y .. "; Z: " .. enhancer.lasedrone.laserPos.z, 20, 0)			
				if enhancer.lasedrone.laserPos ~= nil and enhancer.lasedrone.laserCode ~= nil and enhancer.lasedrone.laserCode ~= "" and enhancer.isInteger(enhancer.lasedrone.laserCode) then		 				
					trigger.action.outText("You can request drone to lase targets now. Code: " .. enhancer.lasedrone.laserCode, 10, false)
					trigger.action.outSound("sounds/enhancer_Beep.ogg")
				else
					trigger.action.outText("Target for laser not created. Wrong mark format. Check documentation", 10, false)
					trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")
				end
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
		elseif (string.match(event.text, "DO_LASE") ~= nil) and (string.match(event.text, "DO_LASE;") == nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				if enhancer.lasedrone.laserSpot ~= nil then
					--trigger.action.outText("Laser destruido", 15, false)						
					enhancer.lasedrone.laserSpot:destroy()
					enhancer.lasedrone.laserSpot = nil
				end
				
				enhancer.lasedrone.laserCode = "1688"
				enhancer.lasedrone.laserPos = event.pos
				--trigger.action.outText("Target for laser; X: " .. enhancer.lasedrone.laserPos.x .. "; Y: " .. enhancer.lasedrone.laserPos.y .. "; Z: " .. enhancer.lasedrone.laserPos.z, 20, 0)			
				 				
				trigger.action.outText("You can request drone to lase targets now. Code: " .. enhancer.lasedrone.laserCode, 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")				
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers	
		elseif (string.match(event.text, "DO_RECON") ~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.recon.satellitePos = event.pos
				trigger.action.outText("You can request recon on target now.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
		elseif (string.match(event.text, "DO_STRIKE") ~= nil) and (string.match(event.text, "DO_STRIKE;") == nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.strike.herculesPos = event.pos
				trigger.action.outText("You can request strike on target now.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
			
		elseif (string.match(event.text, "DO_STRIKE;") ~= nil) then	
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				local index1 = string.find(event.text, ";", 0)
				local LatLongStr = enhancer.trim(string.sub(event.text, index1 + 1, string.len(event.text)))	
				
				enhancer.strike.herculesPos = enhancer.getVec3FromCoord(LatLongStr)
				
				if enhancer.strike.herculesPos  ~= nil then
					trigger.action.outText("You can request strike on target now.", 10, false)
					trigger.action.outSound("sounds/enhancer_Beep.ogg")
				else
					trigger.action.outText("Strike Point not created. Wrong mark or coordinates format. Check documentation", 10, false)
					trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")
				end			
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers			
		elseif (string.match(event.text, "DO_RP;") ~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then			
				local index1 = string.find(event.text, ";", 0)
				enhancer.common.radioFreq = enhancer.trim(string.sub(event.text, index1 + 1, string.len(event.text)))			
				enhancer.common.RPPos = event.pos
				--trigger.action.outText("Target for RP; X: " .. enhancer.common.RPPos.x .. "; Y: " .. enhancer.common.RPPos.y .. "; Z: " .. enhancer.common.RPPos.z, 20, 0)			
				--trigger.action.outText("radio " .. enhancer.common.radioFreq, 20, 0)			
				if enhancer.common.RPPos ~= nil and enhancer.common.radioFreq ~= nil and enhancer.common.radioFreq ~= "" and enhancer.isNumeric(enhancer.common.radioFreq) then		 				
					trigger.action.outText("Rally Point for support packages has been established. Mission radio freq: " .. enhancer.common.radioFreq .."Mhz AM", 10, false)
					trigger.action.outSound("sounds/enhancer_Beep.ogg")
				else
					trigger.action.outText("Rally Point not created. Wrong mark format. Check documentation", 10, false)
					trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")
				end
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
        elseif (string.match(event.text, "DO_RP") ~= nil) and (string.match(event.text, "DO_RP;") == nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.common.RPPos = event.pos
				enhancer.common.radioFreq = "127.5"
				trigger.action.outText("Rally Point for support packages has been established. Mission radio freq: " .. enhancer.common.radioFreq .."Mhz AM", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers			
		elseif (string.match(event.text, "DO_SEAD") ~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.sead.targetPos = event.pos
				trigger.action.outText("Target area for SEAD packages has been established.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
		elseif (string.match(event.text, "DO_ATTACK")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.attack.targetPos = event.pos
				trigger.action.outText("Target area for Ground Attack packages has been established.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
		elseif (string.match(event.text, "DO_SWEEP")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.sweep.targetPos = event.pos
				trigger.action.outText("Target area for fighter sweep has been established.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
		elseif (string.match(event.text, "DO_TAKEOFF")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.common.TakeOff = event.pos
				trigger.action.outText("Take off Airbase for support packages has been established.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers		
		elseif (string.match(event.text, "DO_ESCORT")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then					
				enhancer.escort.targetPos = event.pos
				trigger.action.outText("Escort destination area has been established.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
		elseif (string.match(event.text, "DO_WPESCORT1")~= nil) and (string.match(event.text, "DO_WPESCORT10")== nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				
				enhancer.escort.Route[1] = {
							action = "Fly Over Point",
							type= "Turning Point",
							x = event.pos.x,
							y = event.pos.z,
							alt = 220,
							alt_type = "RADIO",
							speed = enhancer.escort.speed,
							ETA = 100,
							ETA_locked = false,
							name = "WP1", 							
							}					
				trigger.action.outText("WP1 has been established for escort package.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")				
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers	
		elseif (string.match(event.text, "DO_WPESCORT2")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				
				enhancer.escort.Route[2] = {
							action = "Fly Over Point",
							type= "Turning Point",
							x = event.pos.x,
							y = event.pos.z,
							alt = 220,
							alt_type = "RADIO",
							speed = enhancer.escort.speed,
							ETA = 100,
							ETA_locked = false,
							name = "WP2", 							
							}					
				trigger.action.outText("WP2 has been established for escort package.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")				
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers	
		elseif (string.match(event.text, "DO_WPESCORT3")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				
				enhancer.escort.Route[3] = {
							action = "Fly Over Point",
							type= "Turning Point",
							x = event.pos.x,
							y = event.pos.z,
							alt = 220,
							alt_type = "RADIO",
							speed = enhancer.escort.speed,
							ETA = 100,
							ETA_locked = false,
							name = "WP3", 							
							}					
				trigger.action.outText("WP3 has been established for escort package.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")				
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers		
		elseif (string.match(event.text, "DO_WPESCORT4")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				
				enhancer.escort.Route[4] = {
							action = "Fly Over Point",
							type= "Turning Point",
							x = event.pos.x,
							y = event.pos.z,
							alt = 220,
							alt_type = "RADIO",
							speed = enhancer.escort.speed,
							ETA = 100,
							ETA_locked = false,
							name = "WP4", 							
							}					
				trigger.action.outText("WP4 has been established for escort package.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")				
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers		
		elseif (string.match(event.text, "DO_WPESCORT5")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				
				enhancer.escort.Route[5] = {
							action = "Fly Over Point",
							type= "Turning Point",
							x = event.pos.x,
							y = event.pos.z,
							alt = 220,
							alt_type = "RADIO",
							speed = enhancer.escort.speed,
							ETA = 100,
							ETA_locked = false,
							name = "WP5", 							
							}					
				trigger.action.outText("WP5 has been established for escort package.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")				
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers		
		elseif (string.match(event.text, "DO_WPESCORT6")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				
				enhancer.escort.Route[6] = {
							action = "Fly Over Point",
							type= "Turning Point",
							x = event.pos.x,
							y = event.pos.z,
							alt = 220,
							alt_type = "RADIO",
							speed = enhancer.escort.speed,
							ETA = 100,
							ETA_locked = false,
							name = "WP6", 							
							}					
				trigger.action.outText("WP6 has been established for escort package.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")				
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers		
		elseif (string.match(event.text, "DO_WPESCORT7")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				
				enhancer.escort.Route[7] = {
							action = "Fly Over Point",
							type= "Turning Point",
							x = event.pos.x,
							y = event.pos.z,
							alt = 220,
							alt_type = "RADIO",
							speed = enhancer.escort.speed,
							ETA = 100,
							ETA_locked = false,
							name = "WP7", 							
							}					
				trigger.action.outText("WP7 has been established for escort package.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")				
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers	
		elseif (string.match(event.text, "DO_WPESCORT8")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				
				enhancer.escort.Route[8] = {
							action = "Fly Over Point",
							type= "Turning Point",
							x = event.pos.x,
							y = event.pos.z,
							alt = 220,
							alt_type = "RADIO",
							speed = enhancer.escort.speed,
							ETA = 100,
							ETA_locked = false,
							name = "WP8", 							
							}					
				trigger.action.outText("WP8 has been established for escort package.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")				
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers	
		elseif (string.match(event.text, "DO_WPESCORT9")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				
				enhancer.escort.Route[9] = {
							action = "Fly Over Point",
							type= "Turning Point",
							x = event.pos.x,
							y = event.pos.z,
							alt = 220,
							alt_type = "RADIO",
							speed = enhancer.escort.speed,
							ETA = 100,
							ETA_locked = false,
							name = "WP9", 							
							}					
				trigger.action.outText("WP9 has been established for escort package.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")				
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers		
		elseif (string.match(event.text, "DO_WPESCORT10")~= nil) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				
				enhancer.escort.Route[10] = {
							action = "Fly Over Point",
							type= "Turning Point",
							x = event.pos.x,
							y = event.pos.z,
							alt = 220,
							alt_type = "RADIO",
							speed = enhancer.escort.speed,
							ETA = 100,
							ETA_locked = false,
							name = "WP10", 							
							}					
				trigger.action.outText("WP10 has been established for escort package.", 10, false)
				trigger.action.outSound("sounds/enhancer_Beep.ogg")				
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers	
			
		end --fin event.text

		
	elseif (world.event.S_EVENT_MARK_REMOVED == event.id) then	 ----------------------------------------------------------------------------------			
		if event.text  == "DO_TAKEOFF" then
			trigger.action.outText("INFO: Take off point has been removed", 10, false)	
			trigger.action.outSound("sounds/enhancer_Beep.ogg")
			enhancer.common.TakeOff = nil
			
		elseif event.text == "DO_WPESCORT1" then
			trigger.action.outText("INFO: Escort WP1 has been removed", 10, false)	
			trigger.action.outSound("sounds/enhancer_Beep.ogg")
			enhancer.escort.Route[1] = nil
			
		elseif event.text == "DO_WPESCORT2" then
			trigger.action.outText("INFO: Escort WP2 has been removed", 10, false)	
			trigger.action.outSound("sounds/enhancer_Beep.ogg")
			enhancer.escort.Route[2] = nil
			
		elseif event.text == "DO_WPESCORT3" then
			trigger.action.outText("INFO: Escort WP3 has been removed", 10, false)	
			trigger.action.outSound("sounds/enhancer_Beep.ogg")
			enhancer.escort.Route[3] = nil

		elseif event.text == "DO_WPESCORT4" then
			trigger.action.outText("INFO: Escort WP4 has been removed", 10, false)	
			trigger.action.outSound("sounds/enhancer_Beep.ogg")
			enhancer.escort.Route[4] = nil

		elseif event.text == "DO_WPESCORT5" then
			trigger.action.outText("INFO: Escort WP5 has been removed", 10, false)	
			trigger.action.outSound("sounds/enhancer_Beep.ogg")
			enhancer.escort.Route[5] = nil

		elseif event.text == "DO_WPESCORT6" then
			trigger.action.outText("INFO: Escort WP6 has been removed", 10, false)	
			trigger.action.outSound("sounds/enhancer_Beep.ogg")
			enhancer.escort.Route[6] = nil

		elseif event.text == "DO_WPESCORT7" then
			trigger.action.outText("INFO: Escort WP7 has been removed", 10, false)	
			trigger.action.outSound("sounds/enhancer_Beep.ogg")
			enhancer.escort.Route[7] = nil
	
		elseif event.text == "DO_WPESCORT8" then
			trigger.action.outText("INFO: Escort WP8 has been removed", 10, false)	
			trigger.action.outSound("sounds/enhancer_Beep.ogg")
			enhancer.escort.Route[8] = nil
			
		elseif event.text == "DO_WPESCORT9" then
			trigger.action.outText("INFO: Escort WP9 has been removed", 10, false)	
			trigger.action.outSound("sounds/enhancer_Beep.ogg")
			enhancer.escort.Route[9] = nil

		elseif event.text == "DO_WPESCORT10" then
			trigger.action.outText("INFO: Escort WP10 has been removed", 10, false)	
			trigger.action.outSound("sounds/enhancer_Beep.ogg")
			enhancer.escort.Route[10] = nil
		
		end --S_EVENT_MARK_REMOVED
	elseif (world.event.S_EVENT_UNIT_LOST == event.id) then	 ----------------------------------------------------------------------------------				
		if event.initiator ~= nil and event.initiator:getCategory() == Object.Category.UNIT  and event.initiator:getGroup() ~= nil and event.initiator:getGroup():getName() == enhancer.sead.packageName 
			and #Group.getByName(enhancer.sead.packageName):getUnits() == 1 then
			--trigger.action.outText("SEAD muertos" , 20, false)
			enhancer.N41 = missionCommands.addCommand('Request SEAD package', enhancer.N4, enhancer.requestSEAD, nil)	
			if enhancer.N42 ~= nil then missionCommands.removeItem(enhancer.N42) end
			if enhancer.N43 ~= nil then missionCommands.removeItem(enhancer.N43) end
			if enhancer.N91 ~= nil then missionCommands.removeItem(enhancer.N91) end
			enhancer.sead.packageInProgress = false;
			enhancer.sead.packageInOA = false;
			enhancer.sead.packageName = nil;
			enhancer.sead.targetGroupName = nil;				
		end
		
		if event.initiator ~= nil and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getGroup() ~= nil and event.initiator:getGroup():getName() == enhancer.attack.packageName 
			and #Group.getByName(enhancer.attack.packageName):getUnits() == 1 then
			--trigger.action.outText("Ground Attack muertos" , 20, false)
			enhancer.N51 = missionCommands.addCommand('Request Ground Attack package', enhancer.N5, enhancer.requestGrAttack, nil)	
			if enhancer.N52 ~= nil then missionCommands.removeItem(enhancer.N52) end
			if enhancer.N53 ~= nil then missionCommands.removeItem(enhancer.N53) end	
			if enhancer.N92 ~= nil then missionCommands.removeItem(enhancer.N92) end
			enhancer.attack.packageInProgress = false;
			enhancer.attack.packageInOA = false;
			enhancer.attack.packageName = nil;
			enhancer.attack.targetGroupName = nil;				
		end
		
		if event.initiator ~= nil and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getGroup() ~= nil and event.initiator:getGroup():getName() == enhancer.sweep.packageName 
			and #Group.getByName(enhancer.sweep.packageName):getUnits() == 1 then
			--trigger.action.outText("Sweep muertos" , 20, false)
			enhancer.N61 = missionCommands.addCommand('Request Fighter Sweep package', enhancer.N6, enhancer.requestFighterSweep, nil)	
			if enhancer.N62 ~= nil then missionCommands.removeItem(enhancer.N62) end
			if enhancer.N63 ~= nil then missionCommands.removeItem(enhancer.N63) end
			if enhancer.N93 ~= nil then missionCommands.removeItem(enhancer.N93) end
			enhancer.sweep.packageInProgress = false;
			enhancer.sweep.packageInOA = false;
			enhancer.sweep.packageName = nil;
			enhancer.sweep.targetGroupName = nil;				
		end		
		
		if event.initiator ~= nil and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getGroup() ~= nil and event.initiator:getGroup():getName() == enhancer.escort.packageName 
			and #Group.getByName(enhancer.escort.packageName):getUnits() == 1 then
			--trigger.action.outText("Escort muertos" , 20, false)
			enhancer.N81 = missionCommands.addCommand('Request escort package', enhancer.N8, enhancer.requestEscort, nil)	
			if enhancer.N82 ~= nil then missionCommands.removeItem(enhancer.N82) end
			if enhancer.N83 ~= nil then missionCommands.removeItem(enhancer.N83) end
			if enhancer.N84 ~= nil then missionCommands.removeItem(enhancer.N84) end
			if enhancer.N85 ~= nil then missionCommands.removeItem(enhancer.N85) end	
			if enhancer.N86 ~= nil then missionCommands.removeItem(enhancer.N86) end
			if enhancer.N87 ~= nil then missionCommands.removeItem(enhancer.N87) end
			if enhancer.N95 ~= nil then missionCommands.removeItem(enhancer.N95) end
			enhancer.escort.packageInProgress = false;
			enhancer.escort.packageInOA = false;
			enhancer.escort.packageName = nil;
			enhancer.escort.targetGroupName = nil;			
			enhancer.escort.RWRUnitList = ""		
			enhancer.escort.currentTarget = nil
			enhancer.escort.lastSearchPos = nil
			enhancer.escort.ROEAttack = false;
			enhancer.escort.currentROE = false		
		end		
		
		--el control de que el escort destruya infanteria est? en el evento S_EVENT_KILL, por que los trata como objetos estaticos
		if event.initiator ~= nil and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getGroup() ~= nil and enhancer.escort.currentTarget ~= nil and  event.initiator:getGroup():getName() == enhancer.escort.currentTarget 
			and #(event.initiator:getGroup()):getUnits() <= 1 then
			
			enhancer.setMessageDelayed("COLT 7: Asigned targets killed. Returning to last position and waiting further orders.", 8, 5, true)
			enhancer.setSoundDelayed("enhancer_COLT_TargetKilled.ogg", 5)
			
			missionCommands.removeItem(enhancer.escort.searchUnitList[event.initiator:getGroup():getName()])

			enhancer.returnEscort()
			enhancer.escort.currentTarget = nil
			
		end -- enhancer.escort.currentTarget
		
		if event.initiator ~= nil and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getGroup() ~= nil and enhancer.attack.targetGroupName ~= nil and  event.initiator:getGroup():getName() == enhancer.attack.targetGroupName 
			and #(event.initiator:getGroup()):getUnits() <= 1 then
		
			enhancer.returnGrAttack()
			enhancer.attack.targetGroupName = nil
			
		end -- enhancer.GrAttack.targetGroupName
		
		if event.initiator ~= nil and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getGroup() ~= nil and enhancer.sweep.targetGroupName ~= nil and  event.initiator:getGroup():getName() == enhancer.sweep.targetGroupName 
			and #(event.initiator:getGroup()):getUnits() <= 1 then
		
			enhancer.returnFighterSweep()
			enhancer.sweep.targetGroupName = nil
			
		end -- enhancer.sweep.targetGroupName
		
		if event.initiator ~= nil and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getGroup() ~= nil and enhancer.sead.targetGroupName ~= nil and  event.initiator:getGroup():getName() == enhancer.sead.targetGroupName 
			and #(event.initiator:getGroup()):getUnits() <= 1 then
		
			enhancer.returnSEAD()
			enhancer.sead.targetGroupName = nil
			
		end -- enhancer.sead.targetGroupName
				
	elseif (world.event.S_EVENT_KILL == event.id) then
		
		-- por alguna razon estupida DCS considera a la infanteria como objetos estaticos aqui. No se si sera un bug
		-- y posiblemente por eso, en los eventos no se puede hacer un :getGroup() por que da nulo siempre.
		if event.initiator ~= nil and event.target ~= nil and enhancer.escort.currentTarget ~= nil
			and event.target:getCategory() == Object.Category.STATIC
			and event.initiator:getGroup():getName() == enhancer.escort.packageName 
			and (Group.getByName(enhancer.escort.currentTarget) == nil or #(Group.getByName(enhancer.escort.currentTarget):getUnits()) == 0) then
							
			--trigger.action.outText("Todos muertos!!!!!!", 8, false)				
							
			enhancer.setMessageDelayed("COLT 7: Asigned targets killed. Returning to last position and waiting further orders.", 8, 5, true)
			enhancer.setSoundDelayed("enhancer_COLT_TargetKilled.ogg", 5)
			
			missionCommands.removeItem(enhancer.escort.searchUnitList[enhancer.escort.currentTarget])

			enhancer.returnEscort()
			enhancer.escort.currentTarget = nil
			
		end -- enhancer.escort.currentTarget
			
	end -- world.event.S_EVENT_MARK_CHANGE
end;


function enhancer.trim(s)
  return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end


function enhancer.isInteger(str)
  return not (str == "" or str:match("%D"))
end


function enhancer.isNumeric(value)
	if value == tostring(tonumber(value)) then
		return true
	else
		return false
	end
end


function enhancer.getDistancePointPoint(point1, point2)	
	-- la distancia devuelta es en Km
	if point1 ~= nil and point2 ~= nil then
		local distance = math.abs(((point1.x  - point2.x)^2 + (point1.y  - point2.y)^2)^(0.5))
		--trigger.action.outText("distancia entre puntos: " .. distance, 5)
		return distance
	else
		return 100000000000000
	end
	
end


function enhancer.getHeading(unit)
	if unit ~= nil then
		local pos = unit:getPosition()
		if pos then
			local Heading = math.atan2(pos.x.z, pos.x.x)			
			if Heading < 0 then
				Heading = Heading + 2*math.pi
			end
			return Heading
		end
	else 
			return 0
	end
end


function enhancer.getBearing(pointRef, PointBearing)
	--trigger.action.outText("getBearing", 10) 
	local p = {}
    p.x = PointBearing.x - pointRef.x
    p.y = PointBearing.y - pointRef.y
 
    local r = math.atan2(p.y, p.x)*180/math.pi
	if r < 0 then 
		r = 360 + r
	end
    --trigger.action.outText("bearing: " .. r .. "?", 10) 
	return math.floor(r + 0.5)
end


function enhancer.getCoordinatesSTR(decLat, decLong)	
	local lat1, latF1 = math.modf(decLat)
	local latF2, latF3 = math.modf(latF1 * 60)
	
	local long1, longF1 = math.modf(decLong)
	local longF2, longF3 = math.modf(longF1 * 60)
	
	return {lat = string.format("%02d", lat1) .. "º " .. string.format("%02d",latF2) .. "' " .. string.format("%02d",math.floor(latF3 * 60)) .. "''N", 
					long = string.format("%02d", long1) .. "º " .. string.format("%02d",longF2) .. "' " .. string.format("%02d",math.floor(longF3 * 60)) .. "''E"}	
end


function enhancer.getVec3FromCoord(LLTOTAL)
	local LL1Lat = nil
	local LL1Long = nil
	local isOK = false
	local vecLL3 = nil
	
	if string.len(LLTOTAL) == 13 then							
		LL1Lat = tonumber(string.sub(LLTOTAL,1,2)) + tonumber(string.sub(LLTOTAL,3,4)) * 1/60 + tonumber(string.sub(LLTOTAL,5,6)) * 1/3600			
		LL1Long = tonumber(string.sub(LLTOTAL,8,9)) + tonumber(string.sub(LLTOTAL,10,11)) * 1/60 + tonumber(string.sub(LLTOTAL,12,13)) * 1/3600				
		isOK = true
	elseif string.len(LLTOTAL) == 14 then							
		LL1Lat = tonumber(string.sub(LLTOTAL,1,2)) + tonumber(string.sub(LLTOTAL,3,4)) * 1/60 + tonumber(string.sub(LLTOTAL,5,6)) * 1/3600			
		LL1Long = tonumber(string.sub(LLTOTAL,8,10)) + tonumber(string.sub(LLTOTAL,11,12)) * 1/60 + tonumber(string.sub(LLTOTAL,12,14)) * 1/3600				
		isOK = true
	elseif string.len(LLTOTAL) > 14 then
		local sepLL = string.find(LLTOTAL, "_", 0)
		local substrLat = string.sub(LLTOTAL, 0, sepLL)
		local substrLon = string.sub(LLTOTAL, sepLL + 1, string.len(LLTOTAL))
		--trigger.action.outText("substrLat " .. substrLat .. ";substrLon " .. substrLon, 15, false)								
		
		local sepLat = string.find(substrLat, " ", 0)
		substrGradosLat = string.sub(substrLat, 0, sepLat)
		substrMinutosLat = string.sub(substrLat, sepLat, string.len(substrLat) -1)
		--trigger.action.outText("substrGradosLat " .. substrGradosLat .. ";substrMinutosLat " .. substrMinutosLat, 15, false)								
							
		
		local sepLon = string.find(substrLon, " ", 0)
		local substrGradosLon = string.sub(substrLon, 0, sepLon)
		local substrMinutosLon = string.sub(substrLon, sepLon, string.len(substrLon) -1)
		--trigger.action.outText("substrGradosLon " .. substrGradosLon .. ";substrMinutosLon " .. substrMinutosLon, 15, false)								
		
		LL1Lat = tonumber(substrGradosLat) + tonumber(substrMinutosLat) * 1/60
		LL1Long = tonumber(substrGradosLon) + tonumber(substrMinutosLon) * 1/60
		isOK = true				
	end
	
	
	if isOK == true then				
		local converted = coord.LLtoLO(LL1Lat, LL1Long)
		local altitud = land.getHeight({x = converted.x, y = converted.z})									
		--trigger.action.outText("x " .. converted.x .. ";y " .. altitud ..  ";z " .. converted.z, 15, false)					
		vecLL3 = {x = converted.x, y = altitud, z = converted.z}
		return vecLL3
	else
		return nil
	end
end


function enhancer.showMessage(parameters)	
	trigger.action.outText(parameters.ptext, parameters.pduration, parameters.pclear)		
end


function enhancer.setMessageDelayed(text, duration, delaySec, clear)
	if clear == nil or clear == false then
        clear = false
	else
		clear = true
    end
	
	timer.scheduleFunction(enhancer.showMessage, {ptext = text, pduration = duration, pclear = clear}, timer.getTime() + delaySec)	
end


function enhancer.setSoundDelayed(sound, delaySec)
	timer.scheduleFunction(enhancer.playSound, {psound = sound}, timer.getTime() + delaySec)
end


function enhancer.playSound(parameters)	
	trigger.action.outSound("sounds/" .. parameters.psound)		
end


function enhancer.getNearestAirBase(point)
	--trigger.action.outText("getNearestAirBase", 30, false)
	local playerCoalition = nil
	if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
		playerCoalition = coalition.side.RED
	elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
		playerCoalition = coalition.side.BLUE
	end
	
	local FoundBases = coalition.getAirbases(playerCoalition)
	
	if #FoundBases == 0 then
		FoundBases = coalition.getAirbases(coalition.side.NEUTRAL)
	end
	
	local Mindistance = 100000000
	local distance = 0				
	local nearestBase = nil
	
	for i = 1, #FoundBases do
		--trigger.action.outText(enhancer.sead.targetPos.x .. ";" .. enhancer.sead.targetPos.y ..  ";" .. enhancer.sead.targetPos.z, 30, false)
		--trigger.action.outText(FoundBases[i]:getPoint().x .. ";" .. FoundBases[i]:getPoint().y .. ";" .. FoundBases[i]:getPoint().z, 30, false)
		--trigger.action.outText("distance " .. distance, 30, false)
		
		distance = enhancer.getDistancePointPoint({x = point.x, y = point.z}, {x = FoundBases[i]:getPoint().x, y = FoundBases[i]:getPoint().z})
		if distance < Mindistance then
			nearestBase = FoundBases[i]
			Mindistance = distance
			--trigger.action.outText("new nearest base " .. nearestBase:getName(), 30, false)					
		end		
	end	 --end for
	
	return nearestBase
end;


function enhancer.searchGrTargets(pPoint, pRadius, pType)
	local foundUnits = {}
	local volS = {
	   id = world.VolumeType.SPHERE,
	   params = {
		 point = pPoint,
		 radius = pRadius
	   }
	 }
	 	  
	 local ifFound = function(foundItem, val)
				--trigger.action.outText("something found", 15, true)
				local playerCoalition = coalition.side.BLUE							
					if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
						playerCoalition = coalition.side.RED
					elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
						playerCoalition = coalition.side.BLUE
				end
				if foundItem:inAir() ~= true and foundItem:getCoalition() ~= playerCoalition and foundItem:getCoalition() ~= coalition.side.NEUTRAL  and foundItem:getLife() > 0 then				
					foundUnits[#foundUnits + 1] = foundItem				
				end
				return true
			end
	
	world.searchObjects(pType, volS, ifFound)
	--trigger.action.outText(foundUnits[1]:getName(), 15, true)						
	return foundUnits
	--Object.Category.UNIT
end;


function enhancer.searchSatelliteTargets(pPoint, pRadius, pType)
	local foundUnits = {}
	local volS = {
	   id = world.VolumeType.SPHERE,
	   params = {
		 point = pPoint,
		 radius = pRadius
	   }
	 }
	 	  
	 local ifFound = function(foundItem, val)
				--trigger.action.outText("something found", 15, true)
				local playerCoalition = coalition.side.BLUE							
					if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
						playerCoalition = coalition.side.RED
					elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
						playerCoalition = coalition.side.BLUE
				end
				if foundItem:inAir() ~= true and foundItem:getCoalition() ~= playerCoalition and foundItem:getCoalition() ~= coalition.side.NEUTRAL and foundItem:getLife() > 0 then				
					foundUnits[#foundUnits + 1] = foundItem				
				end
				return true
			end
	
	world.searchObjects(pType, volS, ifFound)
	--trigger.action.outText(foundUnits[1]:getName(), 15, true)						
	return foundUnits
	--Object.Category.UNIT
end;


function enhancer.searchAircraft(pPoint, pRadius, pType)
	local foundUnits = {}
	local volS = {
	   id = world.VolumeType.SPHERE,
	   params = {
		 point = pPoint,
		 radius = pRadius
	   }
	 }
	 	  
	 local ifFound = function(foundItem, val)
				--trigger.action.outText("something found", 15, true)
				local playerCoalition = coalition.side.BLUE							
					if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
						playerCoalition = coalition.side.RED
					elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
						playerCoalition = coalition.side.BLUE
				end
				if #foundUnits == 0 and foundItem:inAir() == true and foundItem:getCoalition() ~= playerCoalition and foundItem:getCoalition() ~= coalition.side.NEUTRAL and foundItem:getLife() > 0 then
					foundUnits[#foundUnits + 1] = foundItem				
					--trigger.action.outText("unit selected: " .. foundUnits[1]:getName(), 15, true)
				end
				return true
			end
	
	world.searchObjects(pType, volS, ifFound)
--	trigger.action.outText(foundUnits[1]:getName(), 15, true)						
	return foundUnits
	--Object.Category.UNIT
end;


function enhancer.searchSAMObjects(pPoint, pRadius, pType)
	local foundUnits = {}
	local volS = {
	   id = world.VolumeType.SPHERE,
	   params = {
		 point = pPoint,
		 radius = pRadius
	   }
	 }
	 	  
	 local ifFound = function(foundItem, val)	
		if foundItem:inAir() ~= true then
			--trigger.action.outText(foundItem:getName() .. " is target type " .. string.upper(foundItem:getTypeName()), 15, false)
			
			local sams = string.upper(enhancer.sead.samList:gsub("-",""):gsub(" ",""):gsub("_",""))
			local tipo = string.upper(foundItem:getTypeName():gsub("-",""):gsub(" ",""):gsub("_",""))			
			--trigger.action.outText(sams, 15, false)		
			--trigger.action.outText(foundItem:getTypeName() .. " " .. foundItem:getGroup():getName(), 15, false)				
			local playerCoalition = coalition.side.BLUE
				if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
					playerCoalition = coalition.side.RED
				elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
					playerCoalition = coalition.side.BLUE
			end
			
			if string.match(sams, tipo) and foundItem:getCoalition() ~= playerCoalition and foundItem:getCoalition() ~= coalition.side.NEUTRAL and foundItem:getLife() > 0 then		
				foundUnits[#foundUnits + 1] = foundItem	
				--trigger.action.outText("Nuevo Objetivo encontrado " .. foundItem:getTypeName() .. " " .. foundItem:getGroup():getName() .. "; vida: " .. foundItem:getLife(), 15, false)
			end
			
		end-- foundItem:inAir()
		return true
	 end --end funtion ifFound
						
	world.searchObjects(pType, volS, ifFound)
	--trigger.action.outText(foundUnits[1]:getName(), 15, true)						
	return foundUnits
	--Object.Category.UNIT
end;


function removeRadioSilent(controller) 
	controller:setOption( AI.Option.Air.id.SILENCE, false )
end;


function enhancer.requestDrone()
		if enhancer.lasedrone.laserPos ~= nil and enhancer.lasedrone.laserCode ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting drone for painting target near following coordinates: ", 7, 1, true)
			enhancer.setSoundDelayed("enhancer_PLAYER_RequestDrone.ogg", 1)
			local lat, long, alt = coord.LOtoLL(enhancer.lasedrone.laserPos)		
						
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.lasedrone.laserPos))
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)			
			if enhancer.isLaseAvailable == true then
				if (enhancer.lasedrone.reaperInOA == false and enhancer.lasedrone.reaperInProgress == false) then			
					timer.scheduleFunction(enhancer.createDroneDelayed, nil, timer.getTime() + enhancer.lasedrone.waitTime)
					enhancer.setMessageDelayed("COMMAND: Copied, sending Reaper drone to the OA.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_SendDrone.ogg", 12)
					enhancer.setMessageDelayed("INFO: Total ETA for drone " .. enhancer.lasedrone.waitTime .." secs", 10, 12, false)
					enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)			
					enhancer.setMessageDelayed("     Grid: " .. MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format("%05d", MGRS.Easting) .. ' ' .. string.format("%05d", MGRS.Northing), 60, 12, false)			
					enhancer.lasedrone.reaperInProgress = true;
				elseif (enhancer.lasedrone.reaperInOA == false and enhancer.lasedrone.reaperInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, MQ-9 Reaper is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_NegativeDrone.ogg", 12)					
				end --fin enhancer.lasedrone.reaperInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.isLaseAvailable	
		else
			trigger.action.outText("INFO: You need to create a mark DO_LASE;XXXX for target in F10 map (where XXXX is the laser code)", 15, true)									
			trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.lasedrone.laserPos
end;


function enhancer.createDroneDelayed()
	enhancer.setMessageDelayed("PONTIAC 5: Drone is in the Operation area. Ready to copy target. Over", 20, 2, true)	
	enhancer.setSoundDelayed("enhancer_PONTIAC_inOA.ogg", 2)
	missionCommands.removeItem(enhancer.N11)
	enhancer.N12 = missionCommands.addCommand('Paint target near my mark', enhancer.N1, enhancer.createLaserNearestEnemy, nil)
	enhancer.N13 = missionCommands.addCommand('Paint my mark', enhancer.N1, enhancer.createLaserOnMark, nil)
	enhancer.N14 = missionCommands.addCommand('Terminate painting', enhancer.N1, enhancer.stopLaser, nil)	
	enhancer.N96 = missionCommands.addCommand('Dismiss DRONE package', enhancer.N9, enhancer.requestDismissPackage, "DRONE")
	enhancer.lasedrone.reaperInOA = true
	
	local _country = country.id.CJTF_BLUE	
	
	if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
		_country = country.id.CJTF_RED	
	elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
		_country = country.id.CJTF_BLUE	
	end
	
	enhancer.lasedrone.droneName = "Lase Drone" .. math.random(9999,99999)	
	
	local _droneData =
                        {
                            ["modulation"] = 0,
                            ["tasks"] = 
                            {
                            }, -- end of ["tasks"]
                            ["radioSet"] = true,
                            ["task"] = "Reconnaissance",
                            ["uncontrolled"] = false,
                            ["route"] = 
                            {
                                ["points"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 10668,
                                        ["action"] = "Turning Point",
                                        ["alt_type"] = "BARO",
                                        ["speed"] = 92.5,
                                        ["task"] = 
                                        {
                                            ["id"] = "ComboTask",
                                            ["params"] = 
                                            {
                                                ["tasks"] = 
                                                {
                                                    [1] = 
                                                    {
                                                        ["enabled"] = true,
                                                        ["auto"] = true,
                                                        ["id"] = "WrappedAction",
                                                        ["number"] = 1,
                                                        ["params"] = 
                                                        {
                                                            ["action"] = 
                                                            {
                                                                ["id"] = "EPLRS",
                                                                ["params"] = 
                                                                {
                                                                    ["value"] = true,
                                                                    ["groupId"] = 3,
                                                                }, -- end of ["params"]
                                                            }, -- end of ["action"]
                                                        }, -- end of ["params"]
                                                    }, -- end of [1]
                                                    [2] = 
                                                    {
                                                        ["enabled"] = true,
                                                        ["auto"] = false,
                                                        ["id"] = "Orbit",
                                                        ["number"] = 2,
                                                        ["params"] = 
                                                        {
                                                            ["altitude"] = 10668,
                                                            ["pattern"] = "Circle",
                                                            ["speed"] = 92.5,
                                                            ["speedEdited"] = true,
                                                        }, -- end of ["params"]
                                                    }, -- end of [2]
                                                    [3] = 
                                                    {
                                                        ["enabled"] = true,
                                                        ["auto"] = false,
                                                        ["id"] = "WrappedAction",
                                                        ["number"] = 3,
                                                        ["params"] = 
                                                        {
                                                            ["action"] = 
                                                            {
                                                                ["id"] = "SetInvisible",
                                                                ["params"] = 
                                                                {
                                                                    ["value"] = true,
                                                                }, -- end of ["params"]
                                                            }, -- end of ["action"]
                                                        }, -- end of ["params"]
                                                    }, -- end of [3]
                                                }, -- end of ["tasks"]
                                            }, -- end of ["params"]
                                        }, -- end of ["task"]
                                        ["type"] = "Turning Point",
                                        ["ETA"] = 0,
                                        ["ETA_locked"] = true,
                                        ["y"] = enhancer.lasedrone.laserPos.z,
                                        ["x"] = enhancer.lasedrone.laserPos.x + 100,
                                        ["formation_template"] = "",
                                        ["speed_locked"] = true,
                                    }, -- end of [1]
                                }, -- end of ["points"]
                            }, -- end of ["route"]
                            ["groupId"] = math.random(9999,99999),
                            ["hidden"] = false,
                            ["units"] = 
                            {
                                [1] = 
                                {
                                    ["alt"] = 10668,
                                    ["alt_type"] = "BARO",
                                    ["livery_id"] = "'camo' scheme",
                                    ["skill"] = "High",
                                    ["speed"] = 92.5,
                                    ["type"] = "MQ-9 Reaper",
                                    ["unitId"] = math.random(9999,99999),
                                    ["psi"] = 0,
                                    ["y"] = enhancer.lasedrone.laserPos.z,
                                    ["x"] = enhancer.lasedrone.laserPos.x + 100,
                                    ["name"] = enhancer.lasedrone.droneName,
                                    ["payload"] = 
                                    {
                                        ["pylons"] = 
                                        {
                                        }, -- end of ["pylons"]
                                        ["fuel"] = 1300,
                                        ["flare"] = 0,
                                        ["chaff"] = 0,
                                        ["gun"] = 100,
                                    }, -- end of ["payload"]
                                    ["heading"] = 0,
                                    ["callsign"] = 
                                    {
                                        [1] = 8,
                                        [2] = 5,
                                        [3] = 1,
                                        ["name"] = "Pontiac51",
                                    }, -- end of ["callsign"]
                                    ["onboard_num"] = "020",
                                }, -- end of [1]
                            }, -- end of ["units"]
                            ["y"] = enhancer.lasedrone.laserPos.z,
                            ["x"] = enhancer.lasedrone.laserPos.x + 100,
                            ["name"] = enhancer.lasedrone.droneName,
                            ["communication"] = true,
                            ["start_time"] = 0,
                            ["frequency"] = 254,
                        }
	
	coalition.addGroup(_country, Group.Category.AIRPLANE, _droneData)			
	
	timer.scheduleFunction(enhancer.createLaserNearestEnemy, nil, timer.getTime() + 8)
	
end;


function enhancer.stopLaser()	
	enhancer.lasedrone.currentLasedTarget = "STOP"
	
	enhancer.setMessageDelayed("PLAYER: Terminate lasing.", 5, 1, true)	
	enhancer.setSoundDelayed("enhancer_PLAYER_TermLase.ogg", 1)		
	if enhancer.lasedrone.laserSpot ~= nil then
		enhancer.setMessageDelayed("PONTIAC 5: Wilco. Terminate lasing.... Laser is now off", 10, 8, true)						
		enhancer.setSoundDelayed("enhancer_PONTIAC_LaserOff.ogg", 8)
		enhancer.lasedrone.laserSpot:destroy()
		enhancer.lasedrone.laserSpot = nil	
	else			
		enhancer.setMessageDelayed("PONTIAC 5: Negative. Currently not lasing a target", 10, 8, true)						
		enhancer.setSoundDelayed("enhancer_PONTIAC_NoLasing.ogg", 8)
	end

end;


function enhancer.createLaserOnMark()
	enhancer.setMessageDelayed("PLAYER: Requesting current target painted. Copy following coordinates: ", 7, 1, true)
	enhancer.setSoundDelayed("enhancer_PLAYER_ReqPaint.ogg", 1)
	local lat, long, alt = coord.LOtoLL(enhancer.lasedrone.laserPos)								
	local coordSTR = enhancer.getCoordinatesSTR(lat, long)
	local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.lasedrone.laserPos))
	enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)	
	
	enhancer.lasedrone.currentLasedTarget = "STOP"
	
	if enhancer.lasedrone.laserSpot ~= nil then
		--trigger.action.outText("Laser destruido", 15, false)						
		enhancer.lasedrone.laserSpot:destroy()
		enhancer.lasedrone.laserSpot = nil
	end	
	
	enhancer.setMessageDelayed("PONTIAC 5: Roger, painting your target now.... Laser is now on. Code: " .. enhancer.lasedrone.laserCode, 30, 8, true)	
	enhancer.setSoundDelayed("enhancer_PONTIAC_PaintingTarget.ogg", 8)
	if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
		enhancer.lasedrone.laserSpot = Spot.createLaser(Group.getByName(enhancer.lasedrone.droneName):getUnit(1), nil, enhancer.lasedrone.laserPos, enhancer.lasedrone.laserCode)
	elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
		enhancer.lasedrone.laserSpot = Spot.createLaser(Group.getByName(enhancer.lasedrone.droneName):getUnit(1), nil, enhancer.lasedrone.laserPos, enhancer.lasedrone.laserCode)	
	end	
	
end;


function enhancer.createLaserNearestEnemy()	
	enhancer.setMessageDelayed("PLAYER: Requesting current target painted. Copy following coordinates: ", 7, 1, true)
	enhancer.setSoundDelayed("enhancer_PLAYER_ReqPaint.ogg", 1)
	local lat, long, alt = coord.LOtoLL(enhancer.lasedrone.laserPos)								
	local coordSTR = enhancer.getCoordinatesSTR(lat, long)
	local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.lasedrone.laserPos))
	enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)
	
	local GroupPosition = nil
	
	local FoundUnits = enhancer.searchSatelliteTargets(enhancer.lasedrone.laserPos, 100, {Object.Category.UNIT, Object.Category.STATIC})
		
	if 	FoundUnits ~= nil and #FoundUnits > 0 then	
		GroupPosition = FoundUnits[1]:getPoint()
		enhancer.setMessageDelayed("PONTIAC 5: Roger, painting your target now.... Laser is now on. Code: " .. enhancer.lasedrone.laserCode, 30, 8, true)
		enhancer.setMessageDelayed("INFO: lased target " .. FoundUnits[1]:getTypeName(), 30, 8, false)
		enhancer.setSoundDelayed("enhancer_PONTIAC_PaintingTarget.ogg", 8)
		enhancer.lasedrone.currentLasedTarget = FoundUnits[1]:getName()
		if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
			enhancer.lasedrone.laserSpot = Spot.createLaser(Group.getByName(enhancer.lasedrone.droneName):getUnit(1), nil, GroupPosition, enhancer.lasedrone.laserCode)
		elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
			enhancer.lasedrone.laserSpot = Spot.createLaser(Group.getByName(enhancer.lasedrone.droneName):getUnit(1), nil, GroupPosition, enhancer.lasedrone.laserCode)	
		end
	else
		if enhancer.lasedrone.laserSpot ~= nil then
			--trigger.action.outText("Laser destruido", 15, false)						
			enhancer.lasedrone.laserSpot:destroy()
			enhancer.lasedrone.laserSpot = nil
		end	
		GroupPosition = enhancer.lasedrone.laserPos
		enhancer.lasedrone.currentLasedTarget = "STOP"
		enhancer.setMessageDelayed("PONTIAC 5: Roger, painting your target now.... Laser is now on. Code: " .. enhancer.lasedrone.laserCode, 30, 8, true)
		enhancer.setMessageDelayed("INFO: No target found in the vicinity. Targeting marked point", 30, 8, false)
		enhancer.setSoundDelayed("enhancer_PONTIAC_PaintingTarget.ogg", 8)
		if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
			enhancer.lasedrone.laserSpot = Spot.createLaser(Group.getByName(enhancer.lasedrone.droneName):getUnit(1), nil, GroupPosition, enhancer.lasedrone.laserCode)
		elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
			enhancer.lasedrone.laserSpot = Spot.createLaser(Group.getByName(enhancer.lasedrone.droneName):getUnit(1), nil, GroupPosition, enhancer.lasedrone.laserCode)	
		end
	end	
	
end;	


function enhancer.requestSatellite()	
		if enhancer.recon.satellitePos ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting recon on target. Copy following coordinates: ", 7, 1, true)
			enhancer.setSoundDelayed("enhancer_PLAYER_ReqRecon.ogg", 1)	
			local lat, long, alt = coord.LOtoLL(enhancer.recon.satellitePos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.recon.satellitePos))
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)			
			if enhancer.recon.isSatelliteAvailable == true then
				if (enhancer.recon.satelliteInOA == false and enhancer.recon.satelliteInProgress == false) then			
					timer.scheduleFunction(enhancer.createSatelliteDelayed, nil, timer.getTime() + enhancer.recon.waitTime)
					enhancer.setMessageDelayed("COMMAND: Copied, diverting surveillance satellite to OA.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_ReqSatellite.ogg", 12)
					enhancer.setMessageDelayed("INFO: Total ETA for getting satellite in position " .. enhancer.recon.waitTime .." secs", 10, 12, false)
					enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)			
					enhancer.setMessageDelayed("     Grid: " .. MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format("%05d", MGRS.Easting) .. ' ' .. string.format("%05d", MGRS.Northing), 60, 12, false)	
					enhancer.recon.satelliteInProgress = true;
				elseif (enhancer.recon.satelliteInOA == false and enhancer.recon.satelliteInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, satellite is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_NegativeSatellite.ogg", 12)
				else
					timer.scheduleFunction(enhancer.createSatelliteDelayed, nil, timer.getTime() + 60)			
					enhancer.setMessageDelayed("COMMAND: Copied, diverting surveillance satellite to OA.", 10, 12, true)
					enhancer.setMessageDelayed("INFO: Wait 60 segs until satellite is re-alligned", 10, 12, false)
					enhancer.setSoundDelayed("enhancer_COMMAND_ReqSatellite.ogg", 12)					
				end --fin enhancer.recon.satelliteInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.recon.isSatelliteAvailable	
		else
			trigger.action.outText("INFO: You need to create a mark DO_RECON for target in F10 map", 15, true)						
			trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.recon.satellitePos
end;


function enhancer.createSatelliteDelayed()
	-- un radio de 3300 es una triggerzone de radio = 10000 aprox

	enhancer.recon.satelliteInOA = true
	enhancer.recon.satelliteInProgress = false;
	
	local FoundUnits = enhancer.searchSatelliteTargets(enhancer.recon.satellitePos, 10000, {Object.Category.UNIT, Object.Category.STATIC})
		
	local _country = country.id.CJTF_BLUE	
	
	if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
		_country = country.id.CJTF_RED	
	elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
		_country = country.id.CJTF_BLUE	
	end
	
	local nameAllySateliteGroup = "Satelite " .. math.random(9999,99999)				
	
	local GroupPosition = nil
	local tacanUnits = {}
	
	if 	FoundUnits ~= nil and #FoundUnits > 0 then
		GroupPosition = FoundUnits[1]:getPoint()
		enhancer.setMessageDelayed("COMMAND: Recon satellite has found possible targets in the OA.", 20, 2, true)
		enhancer.setSoundDelayed("enhancer_COMMAND_SatelliteTargetsFound.ogg", 2)
		enhancer.setMessageDelayed("INFO: Check F10 map to get more info", 20, 2, false)
		local contador = 1
		for i = 1, #FoundUnits do
			local Position = FoundUnits[i]:getPoint()
			local distance = 1000000
			local noTacan = false
			
			for j = 1, #tacanUnits do	
				if tacanUnits[j] ~= nil then
					--trigger.action.outText("hay " .. j .. " de " .. #tacanUnits .. " con i = " .. i, 30, false)					
					
					--trigger.action.outText("objeto encontrado: " .. Position.x .. " " .. Position.z, 30, false)					
					--trigger.action.outText("unidad Tacan " .. j .. ": " .. tacanUnits[j].x .. " " .. tacanUnits[j].y, 30, false)
					--ojo tacan aun no son unidades, tan solo es una tabla a estas alturas. Por eso no se puede usar getPosition, sino que hay que acceder a x e y directamente, ya que son propiedades del objeto contenido.
					-- ademas hay que tener en cuenta que en tacanUnits[j].y, en realidad ya est? la coordenada z, con lo cual comparamos Position.z con objeto.z realmente
					distance = enhancer.getDistancePointPoint({x = Position.x, y = Position.z}, {x = tacanUnits[j].x, y = tacanUnits[j].y})							
					--trigger.action.outText("distance: " .. distance, 30, false)						
					if distance < 1000 then
						noTacan = true
					end
				end	
			end
			
			if noTacan == false then
					tacanUnits[contador] = {
								["alt"] = 0,
								["heading"] = 0,                                        
								["type"] = "TACAN_beacon",
								["psi"] = 0,                                        
								["y"] = Position.z + 20 ,
								["x"] = Position.x + 20,                                        
								["name"] =  "Satellite mark" .. math.random(9999,99999),                                        
								["speed"] = 0,
								["unitId"] =  math.random(9999,99999),                                        
								["skill"] = "High",
							} -- end of [i]
					contador = contador + 1			
					--trigger.action.outText("contador: " .. contador, 30, false)						
			end --noTacan
		end --for
	else
		-- si no encuentra nada, crea el tacan en la propia marca
		enhancer.setMessageDelayed("COMMAND: Recon satellite has not found relevant information in the OA.", 20, 2, true)						
		enhancer.setSoundDelayed("enhancer_COMMAND_SatelliteNotFound.ogg", 2)
		GroupPosition = enhancer.recon.satellitePos
		tacanUnits[1] = {
								["alt"] = 0,
								["heading"] = 0,                                        
								["type"] = "TACAN_beacon",
								["psi"] = 0,                                        
								["y"] = GroupPosition.z ,
								["x"] = GroupPosition.x,                                        
								["name"] =  "Satellite mark" .. math.random(9999,99999),                                        
								["speed"] = 0,
								["unitId"] =  math.random(9999,99999),                                        
								["skill"] = "High",
							} -- end of [1]
	end --#FoundUnits ~= nil and FoundUnits > 0
	
	local _tacandata =     {
								["modulation"] = 0,
								["tasks"] = 
								{
								}, -- end of ["tasks"]
								["task"] = "",
								["uncontrolled"] = false,
								["groupId"] = 500 + math.random(1, 1000),
								["hidden"] = false,
								["units"] = tacanUnits,											
								["y"] = GroupPosition.z + 20,
								["x"] = GroupPosition.x + 20,
								["name"] = nameAllySateliteGroup,                                         
								["communication"] = true,
								["start_time"] = 0,
								["frequency"] = 124,
					}
					
					
	local SetInvisible = { 
		id = 'SetInvisible', 
		params = { 
			value = true 
			} 
		}
		
	local SetImmortal = { 
	id = 'SetImmortal', 
	params = { 
		value = true 
		} 
	}	
	
	coalition.addGroup(_country, Group.Category.GROUND, _tacandata)
	
	local allySateliteController = Group.getByName(nameAllySateliteGroup):getController()
	allySateliteController:setCommand(SetInvisible)
	allySateliteController:setCommand(SetImmortal)				
end;


function enhancer.requestStrike()	
		if enhancer.strike.herculesPos ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting strike on target. Copy following coordinates: ", 7, 1, true)
			enhancer.setSoundDelayed("enhancer_PLAYER_ReqStrike.ogg", 1)	
			local lat, long, alt = coord.LOtoLL(enhancer.strike.herculesPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.strike.herculesPos))
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)			
			if enhancer.strike.isHerculesAvailable == true then
				if (enhancer.strike.herculesInOA == false and enhancer.strike.herculesInProgress == false) then			
					timer.scheduleFunction(enhancer.setStrike, nil, timer.getTime() + enhancer.strike.waitTime)
					enhancer.setMessageDelayed("COMMAND: Copied, sending AC-130U strike package to OA.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_ReqStrike.ogg", 12)
					enhancer.setMessageDelayed("INFO: Total ETA for AC-130U gunship in position " .. enhancer.strike.waitTime .." secs", 10, 12, false)
					enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)			
					enhancer.setMessageDelayed("     Grid: " .. MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format("%05d", MGRS.Easting) .. ' ' .. string.format("%05d", MGRS.Northing), 60, 12, false)	
					enhancer.strike.herculesInProgress = true;
				elseif (enhancer.strike.herculesInOA == false and enhancer.strike.herculesInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, strike package is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_NegativeStrike.ogg", 12)
				else
					timer.scheduleFunction(enhancer.setStrike, nil, timer.getTime() + 10)			
				end --fin enhancer.strike.herculesInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.strike.isHerculesAvailable	
		else
			trigger.action.outText("INFO: You need to create a mark DO_STRIKE for target in F10 map", 15, true)						
			trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.strike.herculesPos
end;

	
function enhancer.setStrike()
	enhancer.setMessageDelayed("SPOOKY 25: This is Spooky 25. Requesting confirmation for strike with 105mm cannons.", 8, 1, true)
	enhancer.setSoundDelayed("enhancer_SPOOKY_RequestConfirm.ogg", 1)
	enhancer.setMessageDelayed("PLAYER: Spooky 25. Confirmed. Give them hell.", 10, 10, true)
	enhancer.setSoundDelayed("enhancer_PLAYER_GiveHell.ogg", 10)	
	enhancer.setMessageDelayed("SPOOKY 25: Commencing.", 10, 17, true)
	enhancer.setSoundDelayed("enhancer_SPOOKY_Commencing.ogg", 17)
	enhancer.strike.herculesInOA = true;
	enhancer.strike.herculesInProgress = false;
	for i = 20, 40 do
		timer.scheduleFunction(enhancer.setExplosionDelayed, nil, timer.getTime() + i)			
	end
end;
	

function enhancer.setExplosionDelayed()	
	--trigger.action.outText("PUM1: " .. enhancer.lasedrone.laserPos.x, 15, true)	
	trigger.action.explosion({x = enhancer.strike.herculesPos.x + math.random(-30,30), y = enhancer.strike.herculesPos.y, z = enhancer.strike.herculesPos.z  + math.random(-30,30)}, math.random(50,200))
	--trigger.action.outText("PUM2", 15, false)						
end;


function enhancer.requestSEAD()	
		if enhancer.common.RPPos ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting SEAD support package. Copy following coordinates for Rally Point: ", 7, 1, true)
			enhancer.setSoundDelayed("enhancer_PLAYER_ReqSEAD.ogg", 1)	
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.common.RPPos))
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 2, false)			
			if enhancer.sead.isPackageAvailable == true and enhancer.sead.currentRequest < enhancer.sead.maxRequest then
				if (enhancer.sead.packageInOA == false and enhancer.sead.packageInProgress == false) then								
					enhancer.setMessageDelayed("COMMAND: Copied, sending SEAD package to OA.", 10, 14, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_ReqSEAD.ogg", 14)					
					if enhancer.common.TakeOff ~= nil then
						enhancer.createSEADGroup()
					else			
						timer.scheduleFunction(enhancer.createSEADGroup, nil, timer.getTime() + enhancer.sead.waitTime)					
						enhancer.setMessageDelayed("INFO: Total ETA for SEAD package in position " .. enhancer.sead.waitTime .." secs", 10, 12, false)						
						enhancer.setMessageDelayed("Rally Point: " .. coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)
						enhancer.setMessageDelayed("     Grid: " .. MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format("%05d", MGRS.Easting) .. ' ' .. string.format("%05d", MGRS.Northing), 60, 12, false)
					end					
					enhancer.sead.currentRequest = 	enhancer.sead.currentRequest + 1
					enhancer.sead.packageInProgress = true
				elseif (enhancer.sead.packageInOA == false and enhancer.sead.packageInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, SEAD package is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_NegSEAD1.ogg", 12)
				else
					enhancer.setMessageDelayed("COMMAND: Negative, SEAD package is already in the OA.", 10, 12, true)			
					enhancer.setSoundDelayed("enhancer_COMMAND_NegSEAD2.ogg", 12)
				end --fin enhancer.sead.packageInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.sead.isPackageAvailable
		else
			trigger.action.outText("INFO: You need to create a mark DO_RP for Rally Point in F10 map", 15, true)						
			trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.common.RPPos
end;


function enhancer.createSEADGroup()
		--trigger.action.outText("createSEADGroup", 10) 		
		enhancer.sead.packageName = "SEAD package" ..math.random(9999,99999)		
		
		local xAlly = enhancer.common.RPPos.x 
		local yAlly = enhancer.common.RPPos.z
		
		local airBase = nil
			
		if enhancer.common.TakeOff ~= nil then
			xAlly = enhancer.common.TakeOff.x 
			yAlly = enhancer.common.TakeOff.z
			airBase = enhancer.getNearestAirBase(enhancer.common.TakeOff)
			--trigger.action.outText("Despegando de " .. airBase:getName(), 15)
		end
			
		local _airtype = "FA-18C_hornet"
		
		local _player = nil
		local _country = country.id.CJTF_BLUE
		
		if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.RED)[1]
			_country = country.id.CJTF_RED	
		elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.BLUE)[1]
			_country = country.id.CJTF_BLUE	
		end
		
		local heading = enhancer.getHeading(_player)
		
		if heading == nil then
			heading = math.random(256)
		end
		
		local _payload = nil
		
		_payload =  {
                           ["pylons"] = 
                           {
                               [1] = 
                               {
                                   ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                               }, -- end of [1]
                               [2] = 
                               {
                                   ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
                               }, -- end of [2]
                               [3] = 
                               {
                                   ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
                               }, -- end of [3]
                               [4] = 
                               {
                                   ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                               }, -- end of [4]
                               [5] = 
                               {
                                   ["CLSID"] = "{CBU_99}",
                               }, -- end of [5]
                               [6] = 
                               {
                                   ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                               }, -- end of [6]
                               [7] = 
                               {
                                   ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
                               }, -- end of [7]
                               [8] = 
                               {
                                   ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
                               }, -- end of [8]
                               [9] = 
                               {
                                   ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                               }, -- end of [9]
                           }, -- end of ["pylons"]
                           ["fuel"] = "6103",
                           ["flare"] = 60,
                           ["ammo_type"] = 1,
                           ["chaff"] = 60,
                           ["gun"] = 100,
                    } -- end of ["payload"]
        
            
		local _allyData =     {								
                                ["modulation"] = 0,                                
                                ["uncontrolled"] = false,
                                ["groupId"] = math.random(9999,99999),
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 6000,
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yAlly,
                                        ["x"] = xAlly,
										["skill"] = "Excellent",
										["payload"] = _payload,                                        
                                        ["name"] =  "SEAD package unit" .. math.random(9999,99999),                                        
                                        ["speed"] = 200,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
                                    }, -- end of [1]
								[2] = 
                                    {
                                        ["alt"] = 6000,
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yAlly,
                                        ["x"] = xAlly - 50,                                        
										["payload"] = _payload,
                                        ["name"] =  "SEAD package unit" .. math.random(9999,99999),                                        
                                        ["speed"] = 200,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
									}, -- end of [2]																
                                }, -- end of ["units"]
                                ["y"] = yAlly,
                                ["x"] = xAlly,
                                ["name"] =  enhancer.sead.packageName,
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["frequency"] = enhancer.common.radioFreq,
								["task"] = "SEAD",
								["taskSelected"] = true,
                    }
            
			
			if enhancer.common.TakeOff ~= nil then
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 100,
					   altitude = 6000,
				   } 
				 }
		
			_allyData["route"] = 
                                {
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 0,
                                            ["type"] = "TakeOffParking",
                                            ["action"] = "From Parking Area",
                                            ["alt_type"] = "RADIO",
                                            ["formation_template"] = "",
                                            ["ETA"] = 0,
											["airdromeId"] = airBase:getID(),
                                            ["y"] = yAlly,
                                            ["x"] = xAlly,
                                            ["speed"] = 0,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                       
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["speed_locked"] = true,
                                        }, -- end of [1]										
										[2] = 
                                        {
                                            ["alt"] = 6000,
                                            ["type"] = "WP2",                                                                                                                                    
                                            ["ETA"] = 100,											
                                            ["y"] = enhancer.common.RPPos.z,
                                            ["x"] = enhancer.common.RPPos.x,
                                            ["speed"] = 200,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = {orbit}, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]     
                                        }, -- end of [2]
                                    }, -- end of ["points"]
                                } -- end of ["route"]
		end		
                    
			coalition.addGroup(_country, Group.Category.AIRPLANE, _allyData)			
			 
			 local SetCallsign = { 
				  id = 'SetCallsign', 
				  params = { 
					callname = 3, 
					number = 8, 
				  } 
				}
			
			local _controller = Group.getByName(enhancer.sead.packageName):getController()			
			
			_controller:setOption( AI.Option.Air.id.PROHIBIT_WP_PASS_REPORT, true )
			_controller:setOption( AI.Option.Air.id.SILENCE, true )		
			_controller:setOption( AI.Option.Air.id.RTB_ON_BINGO, true )
			_controller:setOption( AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE )
			
			_controller:setCommand(SetCallsign)
			
			
			
			if enhancer.common.TakeOff == nil then
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 100,
					   altitude = 6000,
				   } 
				 }
			_controller:pushTask(orbit)
			enhancer.setMessageDelayed("UZI 8: We are in RP area. Waiting for further instructions.", 15, 2, true)
			enhancer.setSoundDelayed("enhancer_UZI_inRP.ogg", 2)
			enhancer.setMessageDelayed("INFO: You can request SEAD on target mark using F10 --> Enhance menu --> SEAD...", 15, 2, false)	
		else
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)			
			local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.common.RPPos))
			enhancer.setMessageDelayed("UZI 8: Checking 2 hornets for SEAD mission. Proceeding to RP at following coordinates:", 15, 25, true)
			enhancer.setSoundDelayed("enhancer_UZI_checkIn.ogg", 25)
			enhancer.setMessageDelayed("Rally Point: " .. coordSTR.lat .. " " .. coordSTR.long, 60, 25, false)
			enhancer.setMessageDelayed("     Grid: " .. MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format("%05d", MGRS.Easting) .. ' ' .. string.format("%05d", MGRS.Northing), 60, 25, false)
		end
				
			timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 5)					
			
			enhancer.sead.packageInOA = true;
			enhancer.sead.packageInProgress = false;
			
			enhancer.N42 = missionCommands.addCommand('Push SEAD package', enhancer.N4, enhancer.setSEAD, nil)				
			enhancer.N91 = missionCommands.addCommand('Dismiss SEAD package', enhancer.N9, enhancer.requestDismissPackage, "SEAD")
			missionCommands.removeItem(enhancer.N41)
			enhancer.N41 = nil						
end

	
function enhancer.setSEAD()	
		--Group.getByName(enhancer.sead.packageName):destroy()
		
		if enhancer.sead.targetPos ~= nil then			
								
			enhancer.setMessageDelayed("PLAYER: Begin SEAD mission.", 8, 2, true)
			enhancer.setSoundDelayed("enhancer_PLAYER_BeginSEAD.ogg", 2)		
			
			local FoundUnits = enhancer.searchSAMObjects(enhancer.sead.targetPos, 14500, Object.Category.UNIT)
			
			if FoundUnits ~= nil and FoundUnits[1] ~= nil then			
				
				enhancer.setMessageDelayed("UZI 8: Wilco, attacking new targets.", 15, 10, true)
				enhancer.setSoundDelayed("enhancer_UZI_AttackTargets.ogg", 10)
				
				
				local Mindistance = 100000000
				local distance = 0				
				local nearestUnit = nil
				
				for i = 1, #FoundUnits do
					--trigger.action.outText(enhancer.sead.targetPos.x .. ";" .. enhancer.sead.targetPos.y ..  ";" .. enhancer.sead.targetPos.z, 30, false)
					--trigger.action.outText(FoundUnits[i]:getPoint().x .. ";" .. FoundUnits[i]:getPoint().y .. ";" .. FoundUnits[i]:getPoint().z, 30, false)
					--trigger.action.outText("distance " .. distance, 30, false)
					
					distance = enhancer.getDistancePointPoint({x = enhancer.sead.targetPos.x, y = enhancer.sead.targetPos.z}, {x = FoundUnits[i]:getPoint().x, y = FoundUnits[i]:getPoint().z})
					if distance < Mindistance then
						nearestUnit = FoundUnits[i]
						Mindistance = distance
						--trigger.action.outText("new nearest unit " .. nearestUnit:getTypeName(), 30, false)					
					end
					
				end	
				
				
				enhancer.sead.targetGroupName = nearestUnit:getGroup():getName()
				Group.getByName(enhancer.sead.packageName):getController():setOption( AI.Option.Air.id.SILENCE, true )	
				enhancer.doSEAD(Group.getByName(enhancer.sead.packageName), nearestUnit:getGroup())
				timer.scheduleFunction(removeRadioSilent, Group.getByName(enhancer.sead.packageName):getController(), timer.getTime() + 15)					
			else
				
				enhancer.setMessageDelayed("UZI 8: Negative, I have no enemy spikes near the target area.", 15, 10, true)
				enhancer.setSoundDelayed("enhancer_UZI_NoTargets.ogg", 10)
					
			end
		else			
			trigger.action.outText("INFO: You need to create a mark DO_SEAD for target area in F10 map", 15, true)						
			trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")	
		end	
end;


function enhancer.doSEAD(attackingGroup, objetiveGroup)

		--objetiveGroup = Group.getByName("testSAM")
		--trigger.action.outText("attack_Group: " .. attackingGroup:getName(), 30)    		
		--trigger.action.outText("victim_Group: " .. objetiveGroup:getName(), 30)    		
				
	if objetiveGroup ~= nil then	
				
		local _controller = attackingGroup:getController();
		--_controller:resetTask()
				
		local routePoints = {}
		
		local AttackGroup = { 
		  id = 'AttackGroup', 
		  params = { 
			groupId = objetiveGroup:getID(),    
		  } 
		}
		
		
			routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = attackingGroup:getUnit(1):getPoint().x,
					y = attackingGroup:getUnit(1):getPoint().z,
					alt = 5000,
					alt_type = "RADIO",
					speed = 250,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = AttackGroup,
					}	
		
			routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = objetiveGroup:getUnit(1):getPoint().x,
					y = objetiveGroup:getUnit(1):getPoint().z,
					alt = 5000,
					alt_type = "RADIO",
					speed = 250,
					ETA = 100,
					ETA_locked = false,
					name = "WP2", 
					task = nil,
					}
				
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
				
		_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE )
		_controller:setOption( AI.Option.Air.id.PROHIBIT_WP_PASS_REPORT, true )
		_controller:setOption( AI.Option.Air.id.RTB_ON_BINGO, true )
		_controller:setOption( AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE )
		
		_controller:setTask(_mission)
		   
		missionCommands.removeItem(enhancer.N42)
		enhancer.N42 = nil
		enhancer.N43 = missionCommands.addCommand('Cancel SEAD mission', enhancer.N4, enhancer.cancelSEAD, nil)
		--trigger.action.outText("ataque asignado", 30)	
		
	end --fin objetiveGroup ~= nil
	
end


function enhancer.cancelSEAD()

	enhancer.setMessageDelayed("PLAYER: Cancel SEAD mission and return to RP area.", 8, 2, true)
	enhancer.setSoundDelayed("enhancer_PLAYER_CancelSEAD.ogg", 2)

	local _controller = Group.getByName(enhancer.sead.packageName):getController()		
	--_controller:resetTask()
	
	local orbit = {
					   id = 'Orbit', 
						 params = { 
						   pattern = 'Circle',
						   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
						   speed = 150,
						   altitude = 6000,
					   } 
					 }
	
	local routePoints = {}
	
	routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = Group.getByName(enhancer.sead.packageName):getUnit(1):getPoint().x,
					y = Group.getByName(enhancer.sead.packageName):getUnit(1):getPoint().z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = nil,
					}	
		
	routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = enhancer.common.RPPos.x,
					y = enhancer.common.RPPos.z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP2", 
					task = orbit,
					}			
					
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
	
	_controller:setTask(_mission)
	
	_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.RETURN_FIRE )	
	
	enhancer.setMessageDelayed("UZI 8: WILCO, Cancelling current SEAD mission.", 15, 10, true)
	enhancer.setSoundDelayed("enhancer_UZI_CancelSEAD.ogg", 10)
	enhancer.N42 = missionCommands.addCommand('Push SEAD package', enhancer.N4, enhancer.setSEAD, nil)				
	missionCommands.removeItem(enhancer.N43)	
	enhancer.N43 = nil
end;


function enhancer.returnSEAD()

	local _controller = Group.getByName(enhancer.sead.packageName):getController()	
	
	--_controller:resetTask()
	
	local orbit = {
					   id = 'Orbit', 
						 params = { 
						   pattern = 'Circle',
						   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
						   speed = 150,
						   altitude = 6000,
					   } 
					 }
	
	local routePoints = {}
	
	routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = Group.getByName(enhancer.sead.packageName):getUnit(1):getPoint().x,
					y = Group.getByName(enhancer.sead.packageName):getUnit(1):getPoint().z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = nil,
					}	
		
	routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = enhancer.common.RPPos.x,
					y = enhancer.common.RPPos.z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP2", 
					task = orbit,
					}			
					
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
	
	_controller:setTask(_mission)
	
	_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.RETURN_FIRE )	
	
end;


function enhancer.requestGrAttack()	
		if enhancer.common.RPPos ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting Ground Attack support package. Copy following coordinates for Rally Point: ", 7, 1, true)
			enhancer.setSoundDelayed("enhancer_PLAYER_ReqAttack.ogg", 1)
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.common.RPPos))
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)			
			if enhancer.attack.isPackageAvailable == true and enhancer.attack.currentRequest < enhancer.attack.maxRequest then
				if (enhancer.attack.packageInOA == false and enhancer.attack.packageInProgress == false) then			
					enhancer.setMessageDelayed("COMMAND: Copied, sending Ground Attack package to OA.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_ReqAttack.ogg", 12)
					if enhancer.common.TakeOff ~= nil then
						enhancer.createGrAttackGroup()
					else
						timer.scheduleFunction(enhancer.createGrAttackGroup, nil, timer.getTime() + enhancer.attack.waitTime)
						enhancer.setMessageDelayed("INFO: Total ETA for Ground Attack package in position " .. enhancer.attack.waitTime .." secs", 10, 12, false)						
						enhancer.setMessageDelayed("Rally Point: " .. coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)
						enhancer.setMessageDelayed("     Grid: " .. MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format("%05d", MGRS.Easting) .. ' ' .. string.format("%05d", MGRS.Northing), 60, 12, false)	
					end						
					enhancer.attack.currentRequest = enhancer.attack.currentRequest + 1					
					enhancer.attack.packageInProgress = true
				elseif (enhancer.attack.packageInOA == false and enhancer.attack.packageInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, Ground Attack package is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_NegAttack1.ogg", 12)
				else
					enhancer.setMessageDelayed("COMMAND: Negative, Ground Attack package is already in the OA.", 10, 12, true)			
					enhancer.setSoundDelayed("enhancer_COMMAND_NegAttack2.ogg", 12)
				end --fin enhancer.attack.packageInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.attack.isPackageAvailable
		else
			trigger.action.outText("INFO: You need to create a mark DO_RP for Rally Point in F10 map", 15, true)						
			trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.common.RPPos
end;


function enhancer.createGrAttackGroup()
		--trigger.action.outText("createAttackGroup", 10) 		
		enhancer.attack.packageName = "GrAtt package" ..math.random(9999,99999)		
		
		local xAlly = enhancer.common.RPPos.x 
		local yAlly = enhancer.common.RPPos.z
		local airBase = nil
			
		if enhancer.common.TakeOff ~= nil then
			xAlly = enhancer.common.TakeOff.x 
			yAlly = enhancer.common.TakeOff.z
			airBase = enhancer.getNearestAirBase(enhancer.common.TakeOff)
			--trigger.action.outText("Despegando de " .. airBase:getName(), 15)
		end
						
		local _airtype =  "A-10C"		
		
		local _player = nil
		local _country = country.id.CJTF_BLUE
		
		if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.RED)[1]
			_country = country.id.CJTF_RED	
		elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.BLUE)[1]
			_country = country.id.CJTF_BLUE	
		end
		
		
		local heading = enhancer.getHeading(_player)
		
		if heading == nil then
			heading = math.random(256)
		end
		
		
		local _payload = nil
		_payload = {
				["pylons"] =
				{	[1] =
					{	
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [1]			
					[2] =
					{	
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [2]			
					[3] =
					{
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [3]			
					[4] =
					{
					["CLSID"] = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}",
					}, -- end of [4]
					[5] =
					{
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [5]
					[6] =
					{
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [6]
					[7] =
					{
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [7]
					[8] =
					{
					["CLSID"] = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}",
					}, -- end of [8]	
					[9] =
					{	
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [9]							
					[10] =
					{
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					}, -- end of [10]
					[11] =
					{					
					}, -- end of [3]		
					
				}, -- end of ["pylons"]
				["fuel"] = "6103",
				["flare"] = 120,
				["chaff"] = 240,
				["gun"] = 100,
			}
        
            
		local _allyData =     {
                                ["modulation"] = 0,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["uncontrolled"] = false,
                                ["groupId"] = math.random(9999,99999),
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 6000,
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yAlly,
                                        ["x"] = xAlly,
										["skill"] = "Excellent",
										["payload"] = _payload,                                        
                                        ["name"] =  "GrAtt package unit" .. math.random(9999,99999),                                        
                                        ["speed"] = 200,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
                                    }, -- end of [1]
								[2] = 
                                    {
                                        ["alt"] = 6000,
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yAlly,
                                        ["x"] = xAlly - 50,                                        
										["payload"] = _payload,
                                        ["name"] =  "GrAtt package unit" .. math.random(9999,99999),                                        
                                        ["speed"] = 200,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
                                    }, -- end of [1]								
                                }, -- end of ["units"]
                                ["y"] = yAlly,
                                ["x"] = xAlly,
                                ["name"] =  enhancer.attack.packageName,
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["frequency"] = enhancer.common.radioFreq,
								["task"] = "CAS"
                    }
            
                   
		if enhancer.common.TakeOff ~= nil then
		
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 100,
					   altitude = 6000,
				   } 
				 }
		
			_allyData["route"] = 
                                {
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 0,
                                            ["type"] = "TakeOffParking",
                                            ["action"] = "From Parking Area",
                                            ["alt_type"] = "RADIO",
                                            ["formation_template"] = "",
                                            ["ETA"] = 0,
											["airdromeId"] = airBase:getID(),
                                            ["y"] = yAlly,
                                            ["x"] = xAlly,
                                            ["speed"] = 0,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                       
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
										[2] = 
                                        {
                                            ["alt"] = 6000,
                                            ["type"] = "WP1",                                                                                                                                    
                                            ["ETA"] = 100,											
                                            ["y"] = enhancer.common.RPPos.z,
                                            ["x"] = enhancer.common.RPPos.x,
                                            ["speed"] = 200,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = {orbit}, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]                                            
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                } -- end of ["route"]
		end		
				   
				   
		coalition.addGroup(_country, Group.Category.AIRPLANE, _allyData)
			 
		local SetCallsign = { 
				  id = 'SetCallsign', 
				  params = { 
					callname = 10, 
					number = 7, 
				  } 
				}	 
			 
			
		local _controller = Group.getByName(enhancer.attack.packageName):getController()		
		_controller:setOption( AI.Option.Air.id.PROHIBIT_WP_PASS_REPORT, true )
		_controller:setOption( AI.Option.Air.id.SILENCE, true )		
		_controller:setOption( AI.Option.Air.id.RTB_ON_BINGO, true )
		_controller:setOption( AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE )			
		_controller:setCommand(SetCallsign)
		
		if enhancer.common.TakeOff == nil then
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 100,
					   altitude = 6000,
				   } 
				 }
			_controller:pushTask(orbit)
						
			enhancer.setMessageDelayed("BOAR 7: We are in RP area. Waiting for further instructions.", 15, 2, true)
			enhancer.setSoundDelayed("enhancer_BOAR_inRP.ogg", 2)
			enhancer.setMessageDelayed("INFO: You can request Ground Attack on target mark using F10 --> Enhance menu --> Ground Attack...", 15, 2, false)
		else
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)			
			local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.common.RPPos))
			enhancer.setMessageDelayed("BOAR 7: Checking 2 warthogs for Ground Attack mission. Proceeding to RP at following coordinates:", 15, 25, true)
			enhancer.setSoundDelayed("enhancer_BOAR_checkIn.ogg", 25)
			enhancer.setMessageDelayed("Rally Point: " .. coordSTR.lat .. " " .. coordSTR.long, 60, 25, false)
			enhancer.setMessageDelayed("     Grid: " .. MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format("%05d", MGRS.Easting) .. ' ' .. string.format("%05d", MGRS.Northing), 60, 25, false)	
		end
		
		timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 5)	
			
		enhancer.attack.packageInOA = true;
		enhancer.attack.packageInProgress = false;
		
		enhancer.N52 = missionCommands.addCommand('Push Ground Attack package', enhancer.N5, enhancer.setGrAttack, false)	
		enhancer.N92 = missionCommands.addCommand('Dismiss GROUND ATTACK package', enhancer.N9, enhancer.requestDismissPackage, "GA")		
		missionCommands.removeItem(enhancer.N51)
		enhancer.N51 = nil
			
end

	
function enhancer.setGrAttack()	
		if enhancer.attack.targetPos ~= nil then			
		
			enhancer.setMessageDelayed("PLAYER: Begin Attack mission.", 8, 2, true)
			enhancer.setSoundDelayed("enhancer_PLAYER_BeginAttack.ogg", 2)
		
			local FoundUnits = enhancer.searchGrTargets(enhancer.attack.targetPos, 14500, Object.Category.UNIT)					
			if FoundUnits ~= nil and FoundUnits[1] ~= nil then
				enhancer.setMessageDelayed("BOAR 7: Wilco, attacking new ground targets.", 15, 10, true)					
				enhancer.setSoundDelayed("enhancer_BOAR_AttackTargets.ogg", 10)
				
				local Mindistance = 100000000
				local distance = 0				
				local nearestUnit = nil
				
				for i = 1, #FoundUnits do
					--trigger.action.outText(enhancer.attack.targetPos.x .. ";" .. enhancer.attack.targetPos.y ..  ";" .. enhancer.attack.targetPos.z, 30, false)
					--trigger.action.outText(FoundUnits[i]:getPoint().x .. ";" .. FoundUnits[i]:getPoint().y .. ";" .. FoundUnits[i]:getPoint().z, 30, false)
					--trigger.action.outText("distance " .. distance, 30, false)
					
					distance = enhancer.getDistancePointPoint({x = enhancer.attack.targetPos.x, y = enhancer.attack.targetPos.z}, {x = FoundUnits[i]:getPoint().x, y = FoundUnits[i]:getPoint().z})
					if distance < Mindistance then
						nearestUnit = FoundUnits[i]
						Mindistance = distance
						--trigger.action.outText("new nearest unit " .. nearestUnit:getTypeName(), 30, false)
					end
				end	
				
				enhancer.attack.targetGroupName = nearestUnit:getGroup():getName()				
				Group.getByName(enhancer.attack.packageName):getController():setOption( AI.Option.Air.id.SILENCE, true )	
					
				enhancer.doGrAttack(Group.getByName(enhancer.attack.packageName), nearestUnit:getGroup())
				
				timer.scheduleFunction(removeRadioSilent, Group.getByName(enhancer.attack.packageName):getController(), timer.getTime() + 15)									
			else				
				enhancer.setMessageDelayed("BOAR 7: Negative, no tally enemy near the target area.", 15, 10, true)
				enhancer.setSoundDelayed("enhancer_BOAR_NoTargets.ogg", 10)
			end
		else			
			trigger.action.outText("INFO: You need to create a mark DO_ATTACK for target area in F10 map", 15, true)
			trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")	
		end	
end;


function enhancer.doGrAttack(attackingGroup, objetiveGroup)

	--trigger.action.outText("attack_Group: " .. attackingGroup:getName(), 30)    		
	--trigger.action.outText("victim_Group: " .. objetiveGroup:getName(), 30) 
	
	if objetiveGroup ~= nil then	

		local _controller = attackingGroup:getController();
		--_controller:resetTask()
	
		local AttackGroup = nil
		local objetiveType = objetiveGroup:getUnit(1):getTypeName()
		
		objetiveType = string.upper(objetiveType):gsub("-",""):gsub(" ",""):gsub("_","")
		--trigger.action.outText("comprobando tipo" .. objetiveType, 30) 	
		if (string.match(objetiveType, "SOLDIER") ~= nil or string.match(objetiveType, "PARATROOPER") ~= nil or string.match(objetiveType, "INFANTRY") ~= nil) and string.match(objetiveType, "AAA") == nil then
			--trigger.action.outText("es infanteria: " .. objetiveType, 30)  
			AttackGroup = { 
							  id = 'AttackGroup', 
							  params = { 
								groupId = objetiveGroup:getID(),  
								weaponType = 30720,	
								expend = "QUARTER",
							  } 
							}
		else
			--trigger.action.outText("no es infanteria: " .. objetiveType, 30)  
			AttackGroup = { 
							  id = 'AttackGroup', 
							  params = { 
								groupId = objetiveGroup:getID(),			
							  } 
							}
		end
				
		local routePoints = {} 
														
			routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = attackingGroup:getUnit(1):getPoint().x,
					y = attackingGroup:getUnit(1):getPoint().z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 250,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = AttackGroup,
					}	
		
			routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = objetiveGroup:getUnit(1):getPoint().x,
					y = objetiveGroup:getUnit(1):getPoint().z,
					alt = 6000,
					alt_type = "BARO",
					speed = 250,
					ETA = 100,
					ETA_locked = false,
					name = "WP2", 
					task = nil,
					}
			
		--trigger.action.markToAll(2, "Destination point", {x = xDestiny, y = 0, z = yDestiny})
		
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
		
		_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE )
		_controller:setTask(_mission)
		
		missionCommands.removeItem(enhancer.N52)
		enhancer.N52 = nil
		enhancer.N53 = missionCommands.addCommand('Cancel Attack mission', enhancer.N5, enhancer.cancelGrAttack, nil)
		
		--trigger.action.outText("ataque asignado", 30)	
		
	end
end;


function enhancer.cancelGrAttack()
	
	enhancer.setMessageDelayed("PLAYER: Cancel Attack mission and return to RP area.", 8, 2, true)
	enhancer.setSoundDelayed("enhancer_PLAYER_CancelAttack.ogg", 2)

	local _controller = Group.getByName(enhancer.attack.packageName):getController()	
	
	--_controller:resetTask()
	
	local orbit = {
					   id = 'Orbit', 
						 params = { 
						   pattern = 'Circle',
						   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
						   speed = 150,
						   altitude = 6000,
					   } 
					 }
	
	local routePoints = {}
	
	routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = Group.getByName(enhancer.attack.packageName):getUnit(1):getPoint().x,
					y = Group.getByName(enhancer.attack.packageName):getUnit(1):getPoint().z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = nil,
					}	
		
	routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = enhancer.common.RPPos.x,
					y = enhancer.common.RPPos.z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP2", 
					task = orbit,
					}			
					
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
	
	_controller:setTask(_mission)
	
	_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.RETURN_FIRE )
	enhancer.setMessageDelayed("BOAR 7: WILCO, Cancelling current attack mission.", 15, 10, true)
	enhancer.setSoundDelayed("enhancer_BOAR_CancelAttack.ogg", 10)
	enhancer.N52 = missionCommands.addCommand('Push Ground Attack package', enhancer.N5, enhancer.setGrAttack, nil)				
	missionCommands.removeItem(enhancer.N53)
	enhancer.N53 = nil	
end;


function enhancer.returnGrAttack()
	
	local _controller = Group.getByName(enhancer.attack.packageName):getController()	
	
	--_controller:resetTask()
	
	local orbit = {
					   id = 'Orbit', 
						 params = { 
						   pattern = 'Circle',
						   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
						   speed = 150,
						   altitude = 6000,
					   } 
					 }
	
	local routePoints = {}
	
	routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = Group.getByName(enhancer.attack.packageName):getUnit(1):getPoint().x,
					y = Group.getByName(enhancer.attack.packageName):getUnit(1):getPoint().z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = nil,
					}	
		
	routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = enhancer.common.RPPos.x,
					y = enhancer.common.RPPos.z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP2", 
					task = orbit,
					}			
					
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
	
	_controller:setTask(_mission)
	
	_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.RETURN_FIRE )	
end;


function enhancer.requestFighterSweep()	
		if enhancer.common.RPPos ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting Fighter Sweep support package. Copy following coordinates for Rally Point: ", 7, 1, true)
			enhancer.setSoundDelayed("enhancer_PLAYER_ReqSweep.ogg", 1)
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.common.RPPos))
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)			
			if enhancer.sweep.isPackageAvailable == true and enhancer.sweep.currentRequest < enhancer.sweep.maxRequest then
				if (enhancer.sweep.packageInOA == false and enhancer.sweep.packageInProgress == false) then			
					enhancer.setMessageDelayed("COMMAND: Copied, sending fighter sweep package to OA.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_ReqSweep.ogg", 12)
					
					if enhancer.common.TakeOff ~= nil then
						enhancer.createFighterSweepGroup()
					else			
						timer.scheduleFunction(enhancer.createFighterSweepGroup, nil, timer.getTime() + enhancer.sweep.waitTime)					
						enhancer.setMessageDelayed("INFO: Total ETA for Fighter Sweep package in position " .. enhancer.sweep.waitTime .." secs", 10, 12, false)						
						enhancer.setMessageDelayed("Rally Point: " .. coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)
						enhancer.setMessageDelayed("     Grid: " .. MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format("%05d", MGRS.Easting) .. ' ' .. string.format("%05d", MGRS.Northing), 60, 12, false)	
					end					
					enhancer.sweep.currentRequest = enhancer.sweep.currentRequest + 1
					enhancer.sweep.packageInProgress = true
				elseif (enhancer.sweep.packageInOA == false and enhancer.sweep.packageInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, Fighter Sweep package is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_NegSweep1.ogg", 12)
				else
					enhancer.setMessageDelayed("COMMAND: Negative, Fighter Sweep package is already in the OA.", 10, 12, true)			
					enhancer.setSoundDelayed("enhancer_COMMAND_NegSweep2.ogg", 12)
				end --fin enhancer.sweep.packageInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.sweep.isPackageAvailable
		else
			trigger.action.outText("INFO: You need to create a mark DO_RP for Rally Point in F10 map", 15, true)						
			trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.common.RPPos
end;


function enhancer.createFighterSweepGroup()
		--trigger.action.outText("createFighterSweepGroup", 10)    
		
		local xSweep = enhancer.common.RPPos.x
		local ySweep = enhancer.common.RPPos.z
		local airBase = nil
			
		if enhancer.common.TakeOff ~= nil then
			xAlly = enhancer.common.TakeOff.x 
			yAlly = enhancer.common.TakeOff.z
			airBase = enhancer.getNearestAirBase(enhancer.common.TakeOff)
			--trigger.action.outText("Despegando de " .. airBase:getName(), 15)
		end
			
		local _player = nil
		local _country = country.id.CJTF_BLUE		
		
		if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.RED)[1]
			_country = country.id.CJTF_RED	
		elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.BLUE)[1]
			_country = country.id.CJTF_BLUE
		end
				
		local heading = enhancer.getHeading(_player)
		
		if heading == nil then
			heading = math.random(256)
		end
		
		local _airtype = ""
		local _velocity = 0		
		local _allyData = nil
		local _payload = nil
	
		local nameAllyAirGroup = "Sweep" .. math.random(1,9999) 		
		enhancer.sweep.packageName = nameAllyAirGroup
		
		if _country == country.id.CJTF_RED then
			_airtype = "MiG-29A"
			_velocity = 200	
			
			_payload = {
				["pylons"] =
				{	[1] =
					{		
					["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}", --R-73
					}, -- end of [1]			
					[2] =
					{
					["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}", --R-73
					}, -- end of [2]			
					[3] =
					{	
					["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}", --R-27ER
					}, -- end of [3]			
					[4] =
					{
					["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}", --fuel tank
					}, -- end of [4]
					[5] =
					{
					["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}", --R-27ER
					}, -- end of [5]
					[6] =
					{
					["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}", --R-73
					}, -- end of [6]
					[7] =
					{
					["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}", --R-73
					}, -- end of [7]
					
				}, -- end of ["pylons"]
				["fuel"] = "6103",
				["flare"] = 120,
				["chaff"] = 240,
				["gun"] = 100,
			}
				            
		_allyData =     {
                                ["modulation"] = 0,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["uncontrolled"] = false,
                                ["groupId"] = math.random(9999,99999),
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 6000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = ySweep,
                                        ["x"] = xSweep,
										["skill"] = "Excellent",
										["payload"] = _payload,                                        
                                        ["name"] =  "SweepUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
                                    }, -- end of [1]
								[2] = 
                                    {
                                        ["alt"] = 6000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = ySweep,
                                        ["x"] = xSweep - 25,                                        
										["payload"] = _payload,
                                        ["name"] =  "SweepUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
									}, -- end of [2]
								[3] = 
                                    {
                                        ["alt"] = 6000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = ySweep,
                                        ["x"] = xSweep + 25,                                        
										["payload"] = _payload,
                                        ["name"] =  "SweepUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
									}, -- end of [3]
								[4] = 
                                    {
                                        ["alt"] = 6000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = ySweep + 25,
                                        ["x"] = xSweep + 25,                                        
										["payload"] = _payload,
                                        ["name"] =  "SweepUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",		
									}, -- end of [4]									
                                }, -- end of ["units"]
                                ["y"] = ySweep,
                                ["x"] = xSweep,
                                ["name"] =  nameAllyAirGroup,
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["frequency"] = enhancer.common.radioFreq,
								["task"] = "Escort",
                    }
					
		elseif _country == country.id.CJTF_BLUE then	
			_airtype = "F-16C bl.50"
			_velocity = 200	
			
			_payload = {
				["pylons"] =
				{	[1] =
					{		
					["CLSID"] = "{AIM-9L}", --AIM-9
					}, -- end of [1]			
					[2] =
					{
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}", --AIM-120
					}, -- end of [2]			
					[3] =
					{	
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}", --AIM-7
					}, -- end of [3]			
					[4] =
					{
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}", --fuel tank
					}, -- end of [4]
					[5] =
					{					
					}, -- end of [5]
					[6] =
					{
					
					}, -- end of [6]
					[7] =
					{
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}", --fuel tank
					}, -- end of [7]
					[8] =
					{
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}", --AIM-7
					}, -- end of [8]
					[9] =
					{
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}", --AIM-120
					}, -- end of [9]
					[10] =
					{
					["CLSID"] = "{AIM-9L}", --AIM-9
					}, -- end of [10]
					
					
				}, -- end of ["pylons"]
				["fuel"] = "6103",
				["flare"] = 120,
				["chaff"] = 240,
				["gun"] = 100,
			}
				            
		_allyData =     {
                                ["modulation"] = 0,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["uncontrolled"] = false,
                                ["groupId"] = math.random(9999,99999),
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 6000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = ySweep,
                                        ["x"] = xSweep,
										["skill"] = "Excellent",
										["payload"] = _payload,                                        
                                        ["name"] =  "hostileAirUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "Excellent",
                                    }, -- end of [1]
								[2] = 
                                    {
                                        ["alt"] = 6000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = ySweep,
                                        ["x"] = xSweep - 25,                                        
										["payload"] = _payload,
                                        ["name"] =  "hostileAirUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "Excellent",
									}, -- end of [2]
								[3] = 
                                    {
                                        ["alt"] = 6000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = ySweep,
                                        ["x"] = xSweep + 25,                                        
										["payload"] = _payload,
                                        ["name"] =  "hostileAirUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "Excellent",
									}, -- end of [3]								
                                }, -- end of ["units"]
                                ["y"] = ySweep,
                                ["x"] = xSweep,
                                ["name"] =  nameAllyAirGroup,
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["frequency"] = enhancer.common.radioFreq,
								["task"] = "Fighter Sweep",
                    }	
		end  
		
		
		if enhancer.common.TakeOff ~= nil then
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 100,
					   altitude = 6000,
				   } 
				 }
		
			_allyData["route"] = 
                                {
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 0,
                                            ["type"] = "TakeOffParking",
                                            ["action"] = "From Parking Area",
                                            ["alt_type"] = "RADIO",
                                            ["formation_template"] = "",
                                            ["ETA"] = 0,
											["airdromeId"] = airBase:getID(),
                                            ["y"] = yAlly,
                                            ["x"] = xAlly,
                                            ["speed"] = 0,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                       
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
										[2] = 
                                        {
                                            ["alt"] = 6000,
                                            ["type"] = "WP1",
											["alt_type"] = "RADIO",											
                                            ["ETA"] = 100,											
                                            ["y"] = enhancer.common.RPPos.z,
                                            ["x"] = enhancer.common.RPPos.x,
                                            ["speed"] = 200,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = {orbit}, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]                                            
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                } -- end of ["route"]
		end		
		
		coalition.addGroup(_country, Group.Category.AIRPLANE, _allyData)
				 
		 local SetCallsign = { 
				  id = 'SetCallsign', 
				  params = { 
					callname = 6, 
					number = 6, 
				  } 
				}	
		 
		 
		
		local _controller = Group.getByName(enhancer.sweep.packageName):getController()		
		
		_controller:setOption( AI.Option.Air.id.PROHIBIT_WP_PASS_REPORT, true )
		_controller:setOption( AI.Option.Air.id.SILENCE, true )		
		_controller:setOption( AI.Option.Air.id.RTB_ON_BINGO, true )
		_controller:setOption( AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE )		
		
		_controller:setCommand(SetCallsign)
		
		if enhancer.common.TakeOff == nil then
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 100,
					   altitude = 6000,
				   } 
				 }
			_controller:pushTask(orbit)
			enhancer.setMessageDelayed("FORD 6: We are in RP area. Waiting for further instructions.", 15, 2, true)
			enhancer.setSoundDelayed("enhancer_FORD_inRP.ogg", 2)
			enhancer.setMessageDelayed("INFO: You can request Fighter Sweep on target mark using F10 --> Enhance menu --> SWEEP...", 15, 2, false)
		else
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)			
			local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.common.RPPos))
			enhancer.setMessageDelayed("FORD 6: Checking 3 aircrafts for Fighter Sweep mission. Proceeding to RP at following coordinates:", 15, 25, true)
			enhancer.setSoundDelayed("enhancer_FORD_checkIn.ogg", 25)
			enhancer.setMessageDelayed("Rally Point: " .. coordSTR.lat .. " " .. coordSTR.long, 60, 25, false)
			enhancer.setMessageDelayed("     Grid: " .. MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format("%05d", MGRS.Easting) .. ' ' .. string.format("%05d", MGRS.Northing), 60, 25, false)	
		end
			
		timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 5)			
			
			
		enhancer.sweep.packageInOA = true;
		enhancer.sweep.packageInProgress = false;
		
		enhancer.N62 = missionCommands.addCommand('Push fighter sweep package', enhancer.N6, enhancer.setFighterSweep, nil)	
		enhancer.N93 = missionCommands.addCommand('Dismiss SWEEP package', enhancer.N9, enhancer.requestDismissPackage, "SWEEP")
		missionCommands.removeItem(enhancer.N61)
		enhancer.N61 = nil
end


function enhancer.setFighterSweep()	
		--trigger.action.outText("setFighterSweep", 15, true)
		if enhancer.sweep.targetPos ~= nil and Group.getByName(enhancer.sweep.packageName) ~= nil then				
			
			enhancer.setMessageDelayed("PLAYER: Begin Fighter Sweep mission.", 8, 2, true)
			enhancer.setSoundDelayed("enhancer_PLAYER_BeginSweep.ogg", 2)
		
			local FoundUnits = enhancer.searchAircraft(enhancer.sweep.targetPos, 30000, Object.Category.UNIT)					
			if FoundUnits ~= nil and FoundUnits[1] ~= nil then
				enhancer.setMessageDelayed("FORD 6: Wilco, proceding with sweep mission.", 15, 10, true)					
				enhancer.setSoundDelayed("enhancer_FORD_AttackTargets.ogg", 10)
				enhancer.sweep.targetGroupName = FoundUnits[1]:getGroup():getName()
				Group.getByName(enhancer.sweep.packageName):getController():setOption( AI.Option.Air.id.SILENCE, true )	
				enhancer.doSweepAttack(Group.getByName(enhancer.sweep.packageName), FoundUnits[1]:getGroup())
				timer.scheduleFunction(removeRadioSilent, Group.getByName(enhancer.sweep.packageName):getController(), timer.getTime() + 15)									
			else				
				enhancer.setMessageDelayed("FORD 6: Negative, no enemies near the target area.", 15, 20, true)
				enhancer.setSoundDelayed("enhancer_FORD_NoTargets.ogg", 20)				
				enhancer.setMessageDelayed("FORD 6: We will proceed to the target area and do TARCAP until further instructions", 30, 25, false)
				enhancer.setSoundDelayed("enhancer_FORD_TARCAP.ogg", 25)
				local SEADController = Group.getByName(enhancer.sweep.packageName):getController()
				SEADController:setOption( AI.Option.Air.id.SILENCE, true )				
				timer.scheduleFunction(removeRadioSilent, SEADController, timer.getTime() + 15)									
				timer.scheduleFunction(enhancer.doTARCAP, {groupTARCAP = Group.getByName(enhancer.sweep.packageName), point = enhancer.sweep.targetPos}, timer.getTime() + 5)
			end
		else			
			trigger.action.outText("INFO: You need to create a mark DO_SWEEP for target area in F10 map", 15, true)
			trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")	
		end	
end;


function enhancer.doSweepAttack(attackingGroup, objetiveGroup)

	--trigger.action.outText("attack_Group: " .. attackingGroup:getName(), 30)    		
					
	if objetiveGroup ~= nil then	
		--trigger.action.outText("victim_Group: " .. objetiveGroup:getName(), 30)    		
				
		local routePoints = {}
		
		local AttackGroup = { 
		  id = 'AttackGroup', 
		  params = { 
			groupId = objetiveGroup:getID(),    
		  } 
		}
		
		--trigger.action.markToAll(1, "Starting point", {x = 25, y = 23, z = 060})												
			routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = attackingGroup:getUnit(1):getPoint().x,
					y = attackingGroup:getUnit(1):getPoint().z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = AttackGroup,
					}	
		
			routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = objetiveGroup:getUnit(1):getPoint().x,
					y = objetiveGroup:getUnit(1):getPoint().z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP2", 
					task = nil,
					}
			
		--trigger.action.markToAll(2, "Destination point", {x = xDestiny, y = 0, z = yDestiny})
		
		local _controller = attackingGroup:getController()
		
		--_controller:resetTask()	
			
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
			
		_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE )
		_controller:setTask(_mission)
				 
		
		missionCommands.removeItem(enhancer.N62)
		enhancer.N62 = nil
		enhancer.N63 = missionCommands.addCommand('Cancel Fighter Sweep mission', enhancer.N6, enhancer.cancelFighterSweep, nil)
		--trigger.action.outText("ataque asignado", 30)	
		
	end
end;


function enhancer.cancelFighterSweep()

	enhancer.setMessageDelayed("PLAYER: Cancel Fighter Sweep mission and return to RP area.", 8, 2, true)
	enhancer.setSoundDelayed("enhancer_PLAYER_CancelSweep.ogg", 2)

	local _controller = Group.getByName(enhancer.sweep.packageName):getController()	
	
	--_controller:resetTask()
	
	local orbit = {
					   id = 'Orbit', 
						 params = { 
						   pattern = 'Circle',
						   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
						   speed = 150,
						   altitude = 6000,
					   } 
					 }
	
	local routePoints = {}
	
	routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = Group.getByName(enhancer.sweep.packageName):getUnit(1):getPoint().x,
					y = Group.getByName(enhancer.sweep.packageName):getUnit(1):getPoint().z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = nil,
					}	
		
	routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = enhancer.common.RPPos.x,
					y = enhancer.common.RPPos.z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP2", 
					task = orbit,
					}			
					
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
	
	_controller:setTask(_mission)
	
	_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.RETURN_FIRE )
	enhancer.setMessageDelayed("FORD 6: WILCO, Cancelling current Fighter Sweep mission.", 15, 10, true)
	enhancer.setSoundDelayed("enhancer_FORD_CancelSweep.ogg", 10)
	enhancer.N62 = missionCommands.addCommand('Push fighter sweep package', enhancer.N6, enhancer.setFighterSweep, nil)
	missionCommands.removeItem(enhancer.N63)	
	enhancer.N63 = nil
end;


function enhancer.returnFighterSweep()
	local _controller = Group.getByName(enhancer.sweep.packageName):getController()	
	
	--_controller:resetTask()
	
	local orbit = {
					   id = 'Orbit', 
						 params = { 
						   pattern = 'Circle',
						   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
						   speed = 150,
						   altitude = 6000,
					   } 
					 }
	
	local routePoints = {}
	
	routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = Group.getByName(enhancer.sweep.packageName):getUnit(1):getPoint().x,
					y = Group.getByName(enhancer.sweep.packageName):getUnit(1):getPoint().z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = nil,
					}	
		
	routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = enhancer.common.RPPos.x,
					y = enhancer.common.RPPos.z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP2", 
					task = orbit,
					}			
					
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
	
	_controller:setTask(_mission)
	
	_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.RETURN_FIRE )	
end;


function enhancer.doTARCAP(parameters)
	--trigger.action.outText("Mejor una tarcap x=" .. parameters.point.x .. "; y= " .. parameters.point.z , 15, true)
	
	parameters.groupTARCAP:getController():resetTask()
	
	local orbit = {
					   id = 'Orbit', 
						 params = { 
						   pattern = 'Circle',
						   point = {x = parameters.point.x, y = parameters.point.z},
						   speed = 150,
						   altitude = 6000,
					   } 
					 }
					
	local routePoints = {}			
	routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = parameters.groupTARCAP:getUnit(1):getPoint().x,
					y = parameters.groupTARCAP:getUnit(1):getPoint().z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 250,
					ETA = 150,
					ETA_locked = false,
					name = "WP1",					
					}	
		
	routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = parameters.point.x,
					y = parameters.point.z,
					alt = 6000,
					alt_type = "RADIO",
					speed = 150,
					ETA = 100,
					ETA_locked = false,
					name = "WP2", 
					task = orbit,
					}
			
		--trigger.action.markToAll(2, "Destination point", {x = xDestiny, y = 0, z = yDestiny})
		
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }					
					
	
	parameters.groupTARCAP:getController():pushTask(_mission)	
	parameters.groupTARCAP:getController():setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE )
	
	missionCommands.removeItem(enhancer.N62)
	enhancer.N62 = nil
	enhancer.N63 = missionCommands.addCommand('Cancel Fighter Sweep mission', enhancer.N6, enhancer.cancelFighterSweep, nil)

end


function enhancer.requestScout()			
	trigger.action.outText("INFO: Scout package is only available for PATREON.", 15, true)						
	trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")			
end;


function enhancer.requestEscort()	
		if enhancer.common.RPPos ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting Escort package. Copy following coordinates for Rally Point: ", 7, 1, true)
			enhancer.setSoundDelayed("enhancer_PLAYER_ReqEscort.ogg", 1)
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.common.RPPos))
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)			
			if enhancer.escort.isPackageAvailable == true and enhancer.escort.currentRequest < enhancer.escort.maxRequest then
				if (enhancer.escort.packageInOA == false and enhancer.escort.packageInProgress == false) then			
					enhancer.setMessageDelayed("COMMAND: Copied, sending Escort package to OA.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_ReqEscort.ogg", 12)
					if enhancer.common.TakeOff ~= nil then
						enhancer.createEscortGroup()
					else
						timer.scheduleFunction(enhancer.createEscortGroup, nil, timer.getTime() + enhancer.escort.waitTime)
						enhancer.setMessageDelayed("INFO: Total ETA for Escort package in position " .. enhancer.escort.waitTime .." secs", 10, 12, false)						
						enhancer.setMessageDelayed("Rally Point: " .. coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)
						enhancer.setMessageDelayed("     Grid: " .. MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format("%05d", MGRS.Easting) .. ' ' .. string.format("%05d", MGRS.Northing), 60, 12, false)	
					end						
					enhancer.escort.currentRequest = enhancer.escort.currentRequest + 1					
					enhancer.escort.packageInProgress = true
				elseif (enhancer.escort.packageInOA == false and enhancer.escort.packageInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, Escort package is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("enhancer_COMMAND_NegEscort1.ogg", 12)
				else
					enhancer.setMessageDelayed("COMMAND: Negative, Escort package is already in the OA.", 10, 12, true)			
					enhancer.setSoundDelayed("enhancer_COMMAND_NegEscort2.ogg", 12)
				end --fin enhancer.escort.packageInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.escort.isPackageAvailable
		else
			trigger.action.outText("INFO: You need to create a mark DO_RP for Rally Point in F10 map", 15, true)						
			trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.common.RPPos
end;


function enhancer.createEscortGroup()
	--trigger.action.outText("createEscortGroup", 10) 		
		enhancer.escort.packageName = "Escort package" ..math.random(9999,99999)		
		
		local xAlly = enhancer.common.RPPos.x 
		local yAlly = enhancer.common.RPPos.z
		
		local airBase = nil
					
		if enhancer.common.TakeOff ~= nil then			
			airBase = enhancer.getNearestAirBase(enhancer.common.TakeOff)			
			--trigger.action.outText("Despegando de " .. airBase:getName() .. "; Category: " .. airBase:getDesc()["category"], 15)
			--trigger.action.outText("AirbaseID: " .. airBase:getID(), 15)
			local parkings = airBase:getParking(true)
			for i = 1, #parkings do
				if parkings[i].Term_Type == 40 or parkings[i].Term_Type == 104 then
					--trigger.action.outText("Parking " .. parkings[i].Term_Index .. "; x: " .. parkings[i].vTerminalPos.x, 15)
					--trigger.action.markToAll(1 , "PARKING" , parkings[i].vTerminalPos)
					xAlly = parkings[i].vTerminalPos.x
					yAlly = parkings[i].vTerminalPos.z
					break
				end
			end --for			
		end
						
		local _airtype =  nil		
		
		local _player = nil
		local _country = country.id.CJTF_BLUE
		local _payload = nil
		local _allyData = nil
		
		local heading = nil
		
		if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.RED)[1]
			_country = country.id.CJTF_RED	
			_airtype =  "Ka-50"	
			
			heading = enhancer.getHeading(_player)		
			if heading == nil then
				heading = math.random(256)
			end
					
			_payload = {
                            ["pylons"] = 
                            {
                                [1] = 
                                {
                                    ["CLSID"] = "{A6FD14D3-6D30-4C85-88A7-8D17BEE120E2}",
                                }, -- end of [1]
                                [2] = 
                                {
                                    ["CLSID"] = "{B99EE8A8-99BC-4a8d-89AC-A26831920DCE}",
                                }, -- end of [2]
                                [3] = 
                                {
                                    ["CLSID"] = "{B99EE8A8-99BC-4a8d-89AC-A26831920DCE}",
                                }, -- end of [3]
                                [4] = 
                                {
                                    ["CLSID"] = "{A6FD14D3-6D30-4C85-88A7-8D17BEE120E2}",
                                }, -- end of [4]
                            }, -- end of ["pylons"]
                            ["fuel"] = 1450,
                            ["flare"] = 128,
                            ["chaff"] = 0,
                            ["gun"] = 100,
                        } -- end of ["payload"]
			
		elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.BLUE)[1]
			_country = country.id.CJTF_BLUE	
			_airtype = "AH-64D"
			
			heading = enhancer.getHeading(_player)		
			if heading == nil then
				heading = math.random(256)
			end
			
			_payload = {
                        ["pylons"] = 
                        {
                            [1] = 
                            {
                                ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
                            }, -- end of [1]
                            [2] = 
                            {
                                ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
                            }, -- end of [2]
                            [3] = 
                            {
                                ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
                            }, -- end of [3]
                            [4] = 
                            {
                                ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
                            }, -- end of [4]
                        }, -- end of ["pylons"]
                        ["fuel"] = 1157,
                        ["flare"] = 30,
                        ["chaff"] = 30,
                        ["gun"] = 100,
                    } -- end of ["payload"]
		end --end coalition
		
		
		_allyData =     {
                                ["modulation"] = 0,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["uncontrolled"] = false,
                                ["groupId"] = math.random(9999,99999),
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = land.getHeight({x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z}) + 200,
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yAlly,
                                        ["x"] = xAlly,
										["skill"] = "Excellent",
										["payload"] = _payload,                                        
                                        ["name"] =  "Escort package unit" .. math.random(9999,99999),                                        
                                        ["speed"] = 0,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
                                    }, -- end of [1]																
                                }, -- end of ["units"]
                                ["y"] = yAlly,
                                ["x"] = xAlly,
                                ["name"] =  enhancer.escort.packageName,
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["frequency"] = enhancer.common.radioFreq,
								["task"] = "CAS"
                    }
            
                   
		if enhancer.common.TakeOff ~= nil and airBase ~= nil then
		
			local altitud = land.getHeight({x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z}) + 200			
		
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 0,
					   altitude = altitud,
				   } 
				 }
		
			_allyData["route"] = 
                                {
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 0,
                                            ["type"] = "TakeOffParking",
                                            ["action"] = "From Parking Area",
                                            ["alt_type"] = "RADIO",
                                            ["formation_template"] = "",
                                            ["ETA"] = 0,											
                                            ["y"] = yAlly,
                                            ["x"] = xAlly,
                                            ["speed"] = 0,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                       
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
										[2] = 
                                        {
                                            ["alt"] = 220,
											["alt_type"] = "RADIO",
                                            ["type"] = "WP1",                                                                                                                                    
                                            ["ETA"] = 100,											
                                            ["y"] = enhancer.common.RPPos.z,
                                            ["x"] = enhancer.common.RPPos.x,
                                            ["speed"] = enhancer.escort.speed,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = {orbit}, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]                                            
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                } -- end of ["route"]
								
			if airBase:getDesc()["category"] == Airbase.Category.HELIPAD then
				--trigger.action.outText("Es helipad", 10)
				_allyData["route"]["points"][1]["helipadId"] = airBase:getID()
			elseif airBase:getDesc()["category"] == Airbase.Category.SHIP then
				--trigger.action.outText("Es barco", 10)
				_allyData["route"]["points"][1]["helipadId"] = airBase:getID()
			else
				--trigger.action.outText("Es aerodromo", 10)
				_allyData["route"]["points"][1]["airdromeId"] = airBase:getID()
			end					
										
		end		
				   
				   
		coalition.addGroup(_country, Group.Category.HELICOPTER, _allyData)
			 
		local SetCallsign = { 
				  id = 'SetCallsign', 
				  params = { 
					callname = 4, 
					number = 7, 
				  } 
				}	 
			 
			
		local _controller = Group.getByName(enhancer.escort.packageName):getController()		
		_controller:setOption( AI.Option.Air.id.PROHIBIT_WP_PASS_REPORT, true )
		_controller:setOption( AI.Option.Air.id.SILENCE, true )		
		_controller:setOption( AI.Option.Air.id.RTB_ON_BINGO, true )
		_controller:setOption( AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE )			
		_controller:setCommand(SetCallsign)
		
		if enhancer.common.TakeOff == nil then
			--trigger.action.outText("creado en RP1", 10) 		
			local altitud = land.getHeight({x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z}) + 200			
		
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 0,
					   altitude = altitud,
				   } 
				 }
			_controller:pushTask(orbit)
						
			enhancer.setMessageDelayed("COLT 7: We are in RP area. Waiting for further instructions.", 15, 2, true)
			enhancer.setSoundDelayed("enhancer_COLT_inRP.ogg", 2)
			enhancer.setMessageDelayed("INFO: You can request to escort the area near target mark using F10 --> Enhance menu --> Escort...", 15, 2, false)
			--trigger.action.outText("creado en RP2", 10) 		
		else
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)			
			local MGRS = coord.LLtoMGRS(coord.LOtoLL(enhancer.common.RPPos))
			enhancer.setMessageDelayed("COLT 7: Checking one helo for escort mission. Proceeding to RP at following coordinates:", 15, 25, true)
			enhancer.setSoundDelayed("enhancer_COLT_checkIn.ogg", 25)
			enhancer.setMessageDelayed("Rally Point: " .. coordSTR.lat .. " " .. coordSTR.long, 60, 25, false)
			enhancer.setMessageDelayed("     Grid: " .. MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format("%05d", MGRS.Easting) .. ' ' .. string.format("%05d", MGRS.Northing), 60, 25, false)	
		end
		
		timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 15)	
			
		enhancer.escort.packageInOA = true;
		enhancer.escort.packageInProgress = false;
		
		missionCommands.removeItem(enhancer.N81)
		enhancer.N81 = nil
		enhancer.N82 = missionCommands.addCommand('Escort to marked area', enhancer.N8, enhancer.setEscort, nil)			
		enhancer.N83 = missionCommands.addCommand('Anchor in your position', enhancer.N8, enhancer.anchorEscortHere, nil)
		enhancer.N84 = missionCommands.addSubMenu('FOLLOW ROUTE', enhancer.N8)		    
		enhancer.N841 = missionCommands.addCommand('from WP1', enhancer.N84, enhancer.goWPEscort, {WP = 1})
		enhancer.N841 = missionCommands.addCommand('from WP2', enhancer.N84, enhancer.goWPEscort, {WP = 2})
		enhancer.N841 = missionCommands.addCommand('from WP3', enhancer.N84, enhancer.goWPEscort, {WP = 3})
		enhancer.N841 = missionCommands.addCommand('from WP4', enhancer.N84, enhancer.goWPEscort, {WP = 4})
		enhancer.N841 = missionCommands.addCommand('from WP5', enhancer.N84, enhancer.goWPEscort, {WP = 5})
		enhancer.N841 = missionCommands.addCommand('from WP6', enhancer.N84, enhancer.goWPEscort, {WP = 6})
		enhancer.N841 = missionCommands.addCommand('from WP7', enhancer.N84, enhancer.goWPEscort, {WP = 7})
		enhancer.N841 = missionCommands.addCommand('from WP8', enhancer.N84, enhancer.goWPEscort, {WP = 8})
		enhancer.N841 = missionCommands.addCommand('from WP9', enhancer.N84, enhancer.goWPEscort, {WP = 9})
		enhancer.N841 = missionCommands.addCommand('from WP10', enhancer.N84, enhancer.goWPEscort, {WP = 10})
		enhancer.N85 = missionCommands.addCommand('Return to RP', enhancer.N8, enhancer.cancelEscort, nil)		    
		enhancer.N86 = missionCommands.addSubMenu('OPTIONS...', enhancer.N8)		    
		enhancer.N861 = missionCommands.addSubMenu('ROE...', enhancer.N86)		    
		enhancer.N8611 = missionCommands.addCommand('Weapons free', enhancer.N861, enhancer.escortROE, true)		    
		enhancer.N862 = missionCommands.addSubMenu('SPEED...', enhancer.N86)		
		enhancer.N8621 = missionCommands.addCommand('75 knots', enhancer.N862, enhancer.escortSetSpeed, 39)	-- parametro en metros por segundo (1m/s = 1.944 Kn)	
		enhancer.N8622 = missionCommands.addCommand('100 knots', enhancer.N862, enhancer.escortSetSpeed, 54) -- parametro en metros por segundo (1m/s = 1.944 Kn)
		enhancer.N8623 = missionCommands.addCommand('135 knots', enhancer.N862, enhancer.escortSetSpeed, 70) -- parametro en metros por segundo (1m/s = 1.944 Kn)		
		enhancer.N95 = missionCommands.addCommand('Dismiss ESCORT package', enhancer.N9, enhancer.requestDismissPackage, "ESCORT")
end


function enhancer.escortSetSpeed(MetrosSegundo)
	enhancer.escort.speed = MetrosSegundo;
	
	for i = 1, #enhancer.escort.Route do	
		if enhancer.escort.Route[i] ~= nil then
			enhancer.escort.Route[i]["speed"] = enhancer.escort.speed		
		end	
	end
	
	trigger.action.outText("INFO: Speed for next escort action will be " .. math.floor(MetrosSegundo * 1.944) .. "Kn", 15, true)	
	trigger.action.outText("(To apply new speed: order the Escort return to RP, follow route or go to Escort mark again)", 15, false)	
	trigger.action.outSound("sounds/enhancer_Beep.ogg")	
end


function enhancer.setEscort()	
		if enhancer.escort.targetPos ~= nil then			
			
			
		enhancer.setMessageDelayed("PLAYER: Proceed to destination area.", 8, 2, true)
		enhancer.setSoundDelayed("enhancer_PLAYER_BeginEscort.ogg", 2)		
		
		enhancer.setMessageDelayed("COLT 7: Wilco, proceeding to marked area.", 15, 10, true)					
		enhancer.setSoundDelayed("enhancer_COLT_ExploreMarkedArea.ogg", 10)
			
								
			local escortGroup = Group.getByName(enhancer.escort.packageName) 	
			local _controller = escortGroup:getController();
			_controller:setOption( AI.Option.Air.id.SILENCE, true )
			--_controller:resetTask()
			
			
			--trigger.action.outText("X: " .. enhancer.escort.targetPos.x, 10)
			--trigger.action.outText("Y: " .. enhancer.escort.targetPos.z, 10)
			
			local orbit = {
							   id = 'Orbit', 
								 params = { 
								   pattern = 'Circle',
								   point = {x = enhancer.escort.targetPos.x, y = enhancer.escort.targetPos.z},
								   speed = 0,
								   altitude = 250,
							   } 
							 }
				
			
			local routePoints = {}
			routePoints[1] = {
							action = "Fly Over Point",
							type= "Turning Point",
							x = escortGroup:getUnit(1):getPoint().x,
							y = escortGroup:getUnit(1):getPoint().z,
							alt = 220,
							alt_type = "RADIO",
							speed = enhancer.escort.speed,
							ETA = 100,
							ETA_locked = false,
							name = "WP1", 
							task = nil,
							}	
							
					routePoints[2] = {
							action = "Fly Over Point",
							type= "Turning Point",
							x = enhancer.escort.targetPos.x,
							y = enhancer.escort.targetPos.z,
							alt = 220,
							alt_type = "RADIO",
							speed = enhancer.escort.speed,
							ETA = 100,
							ETA_locked = false,
							name = "WP2", 
							task = orbit,
							}	
						
				local _mission = { 
					id = 'Mission', 
					params = { 
						airborne = true,
						route = { 
							points = routePoints
						}, 
					} 
				}
				
					
				local _controller = escortGroup:getController();
				_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.RETURN_FIRE )
				_controller:setOption( AI.Option.Air.id.PROHIBIT_WP_PASS_REPORT, true )
				_controller:setOption( AI.Option.Air.id.RTB_ON_BINGO, true )
				_controller:setOption( AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE )		
				_controller:setOption( AI.Option.Air.id.SILENCE, true )	
				
				timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 15)	
				
				_controller:setTask(_mission)
				--trigger.action.outText("mission asignada", 10)				
						
			timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 15)									
			
			enhancer.escort.currentTarget = nil			
		else			
			trigger.action.outText("INFO: You need to create a mark DO_ESCORT for target area in F10 map", 15, true)
			trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")	
		end	
end;


function enhancer.cancelEscort()
		
	enhancer.setMessageDelayed("PLAYER: Cancel Escort mission and return to RP area.", 8, 2, true)
	enhancer.setSoundDelayed("enhancer_PLAYER_CancelEscort.ogg", 2)
	
	enhancer.setMessageDelayed("COLT 7: WILCO, Cancelling current escort mission.", 15, 10, true)
	enhancer.setSoundDelayed("enhancer_COLT_CancelEscort.ogg", 10)	
		
	
	local _controller = Group.getByName(enhancer.escort.packageName):getController()		
	enhancer.escort.currentTarget = nil
	
	--_controller:resetTask()
		
	_controller:setOption( AI.Option.Air.id.SILENCE, true )						
	timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 15)	
	  
	local orbit = {
		   id = 'Orbit', 
			 params = { 
			   pattern = 'Circle',
			   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
			   speed = 0,
			   altitude = land.getHeight({x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z}) + 200,
		   } 
		 }
			
	
	local routePoints = {}
	
	routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = Group.getByName(enhancer.escort.packageName):getUnit(1):getPoint().x,
					y = Group.getByName(enhancer.escort.packageName):getUnit(1):getPoint().z,
					alt = 220,
					alt_type = "RADIO",
					speed = enhancer.escort.speed,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = nil,
					}	
		
	routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = enhancer.common.RPPos.x,
					y = enhancer.common.RPPos.z,
					alt = 220,
					alt_type = "RADIO",
					speed = enhancer.escort.speed,
					ETA = 100,
					ETA_locked = false,
					name = "WP2", 
					task = orbit,
					}			
					
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
		
	_controller:setTask(_mission)
	
	enhancer.escort.ROEAttack = enhancer.escort.currentROE --vuelve al ROE actual, por si etaba en medio de un ataque
end;


function enhancer.returnEscort()
	
	if enhancer.escort.lastSearchPos ~= nil then
		local _controller = Group.getByName(enhancer.escort.packageName):getController()		
		enhancer.escort.currentTarget = nil
		
		--_controller:resetTask()
				  
		local orbit = {
			   id = 'Orbit', 
				 params = { 
				   pattern = 'Circle',
				   point = {x = enhancer.escort.lastSearchPos.x, y = enhancer.escort.lastSearchPos.z},
				   speed = 0,
				   altitude = 250,
			   } 
			 }
				
		
		local routePoints = {}
		
		routePoints[1] = {
						action = "Fly Over Point",
						type= "Turning Point",
						x = enhancer.escort.lastSearchPos.x,
						y = enhancer.escort.lastSearchPos.z,
						alt = 220,
						alt_type = "RADIO",
						speed = 200,
						ETA = 100,
						ETA_locked = false,
						name = "WP2", 
						task = orbit,
						}			
						
			
			local _mission = { 
				id = 'Mission', 
				params = { 
					airborne = true,
					route = { 
						points = routePoints
					}, 
				} 
			}
			
		_controller:setTask(_mission)
		enhancer.escort.ROEAttack = enhancer.escort.currentROE --vuelve al ROE actual, por si etaba en medio de un ataque		
	end	
end;


function enhancer.searchEscort(FoundUnits)
	--trigger.action.outText("searchEscort", 15, false)	
		
	if enhancer.N87 ~= nil then		
		missionCommands.removeItem(enhancer.N87)	
		enhancer.N87 = nil
	end
	
	local escortGroup = Group.getByName(enhancer.escort.packageName)		
	--local detectedUnits = _controller:getDetectedTargets(Controller.Detection.VISUAL, Controller.Detection.OPTIC)	
	
	local FoundGroups = ""
	--trigger.action.outText("numeroDetectados: " .. #FoundUnits, 15, false)	
		
	local infantryAlreadyDetected = false
		
	if #FoundUnits > 0 then
		local numMax = 6
		local counter = 0
				
		for i = 1, #FoundUnits do	
			local lat, long, alt = coord.LOtoLL(FoundUnits[i]:getPoint())		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			
			if string.match(FoundGroups, ";" .. FoundUnits[i]:getGroup():getID() .. ";") == nil	then
				local objetiveType = string.upper(FoundUnits[i]:getTypeName())
				local objetiveTypeList = ""
				local shortobjetiveTypeList = ""
				local bearingEnemy = enhancer.getBearing({x = escortGroup:getUnit(1):getPoint().x, y = escortGroup:getUnit(1):getPoint().z} , {x = FoundUnits[i]:getPoint().x, y = FoundUnits[i]:getPoint().z})
				
				local distanceEnemy = string.format("%.2f",enhancer.getDistancePointPoint({x = escortGroup:getUnit(1):getPoint().x, y = escortGroup:getUnit(1):getPoint().z} , {x = FoundUnits[i]:getPoint().x, y = FoundUnits[i]:getPoint().z}) / 1852)
								
				if enhancer.N87 == nil then
					enhancer.N87 = missionCommands.addSubMenu('ATTACK...', enhancer.N8)				
				end	
				
				if counter <= numMax then
				
					local direction = ""

					if (FoundUnits[i]:getVelocity().z ~= 0 or FoundUnits[i]:getVelocity().x ~= 0) then
						local angulo = math.atan2(FoundUnits[i]:getVelocity().z , FoundUnits[i]:getVelocity().x) * 180/math.pi	
						if angulo < 0 then 
							angulo = 360 + angulo
						end
						if angulo > 337 and angulo <= 22 then
							direction = "| Moving: N"
						elseif angulo > 22 and angulo <= 67 then
							direction = "| Moving: N-E"
						elseif angulo > 67 and angulo <= 112 then
							direction = "| Moving: E"
						elseif angulo > 112 and angulo <= 157 then
							direction = "| Moving: S-E"	
						elseif angulo > 157 and angulo <= 202 then
							direction = "| Moving: S"
						elseif angulo > 202 and angulo <= 247 then
							direction = "| Moving: S-W"	
						elseif angulo > 247 and angulo <= 292 then
							direction = "| Moving: W"
						elseif angulo > 292 and angulo <= 337 then
							direction = "| Moving: N-W"		
						end
					end
				
					if (string.match(objetiveType, "SOLDIER") ~= nil or string.match(objetiveType, "PARATROOPER") ~= nil or string.match(objetiveType, "INFANTRY") ~= nil
							or string.match(objetiveType:gsub("%-", "_"), "GNDCREW") ~= nil
							or string.match(objetiveType:gsub("%-", "_"), "NATO_MAN") ~= nil
					) and string.match(objetiveType, "AAA") == nil then
					
						if infantryAlreadyDetected == false then
							enhancer.setMessageDelayed("    - Target Group ".. counter + 1 .. " (" .. FoundUnits[i]:getGroup():getName() .. "): SOLDIERS | "  .. bearingEnemy .. "º" .. " " .. distanceEnemy .. "nm | " .. coordSTR.lat .. " " .. coordSTR.long .. direction, 60, 11, false)
							infantryAlreadyDetected = true
							counter = counter + 1
							enhancer.escort.searchUnitList[FoundUnits[i]:getGroup():getName()] = missionCommands.addCommand(FoundUnits[i]:getGroup():getName()  .. ": SOLDIERS (" .. bearingEnemy .. "º" .. " " .. distanceEnemy .. "nm) " .. direction , enhancer.N87, enhancer.doEscortAttack, {objetiveGroupName = FoundUnits[i]:getGroup():getName(), verbose = true})
							FoundGroups = FoundGroups .. ";" .. FoundUnits[i]:getGroup():getID() .. ";"
						end	
					else
											
						for j = 1, FoundUnits[i]:getGroup():getSize() do							
								--trigger.action.outText("objetiveTypeList: " .. objetiveTypeList, 15, false)
								--trigger.action.outText("currentUnitType: " .. FoundUnits[i]:getGroup():getUnit(j):getTypeName(), 15, false)
							if string.match(objetiveTypeList:gsub("-",""):gsub(" ",""):gsub("_",""), "|" .. FoundUnits[i]:getGroup():getUnit(j):getTypeName():gsub("-",""):gsub(" ",""):gsub("_","") .. "|" ) == nil then
								objetiveTypeList = objetiveTypeList .. "|" .. FoundUnits[i]:getGroup():getUnit(j):getTypeName() .. "|"
								if string.len(FoundUnits[i]:getGroup():getUnit(j):getTypeName()) > 6 then
									shortobjetiveTypeList = shortobjetiveTypeList .. "|" .. string.sub(FoundUnits[i]:getGroup():getUnit(j):getTypeName(), 1, 6).. "...|"
								else
									shortobjetiveTypeList = shortobjetiveTypeList .. "|" .. FoundUnits[i]:getGroup():getUnit(j):getTypeName() .. "|"
								end
							end
							
						end
					
						enhancer.setMessageDelayed("    - Target Group ".. counter + 1 .. " (" .. FoundUnits[i]:getGroup():getName() .. "): " .. bearingEnemy .. "º" .. " " .. distanceEnemy .. "nm | " .. coordSTR.lat .. " " .. coordSTR.long .. direction, 60, 11, false)
						enhancer.setMessageDelayed("               " .. objetiveTypeList, 60, 11, false)
						counter = counter + 1
												
						enhancer.escort.searchUnitList[FoundUnits[i]:getGroup():getName()] = missionCommands.addCommand(FoundUnits[i]:getGroup():getName() .. ": " .. shortobjetiveTypeList .. "(" .. bearingEnemy .. "º" .. " " .. distanceEnemy .. "nm) " .. direction, enhancer.N87, enhancer.doEscortAttack, {objetiveGroupName = FoundUnits[i]:getGroup():getName(), verbose = true})	
						FoundGroups = FoundGroups .. ";" .. FoundUnits[i]:getGroup():getID() .. ";"
					end	 --end is infantry				
				end-- end counter
			end  -- FoundGroups
		end --end for
		
		enhancer.setMessageDelayed("INFO: Now you can request the escort to attack a target (F10 OTHER --> ENHANCE MENU...  --> ESCORT... --> ATTACK...)", 60, 12, false)
		
	end --#FoundUnits

end


function enhancer.anchorEscortHere()

	--trigger.action.outText("anchorEscortHere", 15, false)

	enhancer.setMessageDelayed("PLAYER: Anchor in your current position and wait for further orders.", 5, 2, true)
	enhancer.setSoundDelayed("enhancer_PLAYER_AnchorHere.ogg", 2)
	
	enhancer.setMessageDelayed("COLT 7: WILCO, anchor in current position.", 15, 10, true)
	enhancer.setSoundDelayed("enhancer_COLT_AnchorHere.ogg", 10)

	local _controller = Group.getByName(enhancer.escort.packageName):getController()		
	
	--_controller:resetTask()
	
	_controller:setOption( AI.Option.Air.id.SILENCE, true )						
	timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 15)	
		  
	local orbit = {
		   id = 'Orbit', 
			 params = { 
			   pattern = 'Circle',
			   point = {x = Group.getByName(enhancer.escort.packageName):getUnit(1):getPoint().x, y = Group.getByName(enhancer.escort.packageName):getUnit(1):getPoint().z},
			   speed = 0,
			   altitude = 250,
		   } 
		 }
		
	_controller:pushTask(orbit)
	enhancer.escort.ROEAttack = enhancer.escort.currentROE --vuelve al ROE actual, por si etaba en medio de un ataque
end


function enhancer.goWPEscort(params)
	--trigger.action.outText("goWPEscort", 10)
			
	if  #enhancer.escort.Route > 0 and enhancer.escort.targetPos ~= nil  and params.WP <= #enhancer.escort.Route then	
			
		enhancer.setMessageDelayed("PLAYER: Proceed to follow route from marked WP (WP".. params.WP .. ")", 5, 2, true)
		enhancer.setSoundDelayed("enhancer_PLAYER_FollowRoute.ogg", 2)
		
		enhancer.setMessageDelayed("COLT 7: WILCO, proceeding to follow route.", 15, 10, true)
		enhancer.setSoundDelayed("enhancer_COLT_FollowRoute.ogg", 10)
		
	
		local escortGroup = Group.getByName(enhancer.escort.packageName) 	
		local _controller = escortGroup:getController();	
		--_controller:resetTask()		
		
		enhancer.escort.currentTarget = nil
								
		_controller:setOption( AI.Option.Air.id.SILENCE, true )						
		timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 15)			
						
		
		local routePoints = {}
		
		--El primer punto de ruta es la posicion actual del escort	
		routePoints[1] = {
						action = "Fly Over Point",
						type= "Turning Point",
						x = escortGroup:getUnit(1):getPoint().x,
						y = escortGroup:getUnit(1):getPoint().z,
						alt = 220,
						alt_type = "RADIO",
						speed = enhancer.escort.speed,
						ETA = 100,
						ETA_locked = false,
						name = "WP1", 
						task = nil,
						}	
						
		--el resto de routepoints se guardaron a medida que se crearon las marcas. Ahora los asignamos a la coleccion de routePoints, partir del solicitado por el jugador
		--trigger.action.outText("for desde 1 hasta" .. #enhancer.escort.Route - params.WP + 1, 10)
		for i = 1, #enhancer.escort.Route - params.WP + 1 do					
			if enhancer.escort.Route[params.WP + i - 1] ~= nil then
				--trigger.action.outText("asignado WP" .. i .. " desde el " .. params.WP + i - 1, 10)
				routePoints[i+1] = enhancer.escort.Route[params.WP + i - 1]
			end	
		end		
		
		-- y al ultimo le asignamos el punto marcado con DO_ESCORT y orbitar
		routePoints[#routePoints + 1] = {
						action = "Fly Over Point",
						type= "Turning Point",
						x = enhancer.escort.targetPos.x,
						y = enhancer.escort.targetPos.z,
						alt = 220,
						alt_type = "RADIO",
						speed = enhancer.escort.speed,
						ETA = 100,
						ETA_locked = false,
						name = "ESCORT AREA", 
						task = nil,
						}


		local orbit = {
						   id = 'Orbit', 
							 params = { 
							   pattern = 'Circle',
							   point = {x = routePoints[#routePoints].x, y = routePoints[#routePoints].y},
							   speed = 0,
							   altitude = 250,
						   } 
						 }	

		
		routePoints[#routePoints]["task"] = orbit
		
						
		local _mission = { 
			id = 'Mission', 
			params = { 
				airborne = true,
				route = { 
					points = routePoints
				}, 
			} 
		}
		
			
		local _controller = escortGroup:getController();
		
		
		_controller:setTask(_mission)
					
		enhancer.escort.ROEAttack = enhancer.escort.currentROE --vuelve al ROE actual, por si estaba en medio de un ataque
		--trigger.action.outText("mission asignada", 10)
	else			
		trigger.action.outText("INFO: Can't calculate a correct route. You need to create marks up to DO_WPESCORT" .. params.WP .. " and one DO_ESCORT mark in F10 map", 15, true)
		trigger.action.outSound("sounds/enhancer_IncorrectBeep.ogg")		
	end		
end


function enhancer.doEscortAttack(parameters)
	
	local attackingGroup = Group.getByName(enhancer.escort.packageName) 
	local objetiveGroup = Group.getByName(parameters.objetiveGroupName)
	
	--trigger.action.outText("attack_Group: " .. objetiveGroup:getName(), 30) 
	--trigger.action.outText("objetiveGroup: " .. parameters.objetiveGroupName .. " " .. objetiveGroup:getSize(), 30) 
	
	if attackingGroup ~= nil then
		
		if objetiveGroup:getSize() > 0 then	
			
			local objetiveType = objetiveGroup:getUnit(1):getTypeName()
			
			objetiveType = string.upper(objetiveType):gsub("-",""):gsub(" ",""):gsub("_","")
		
			local AttackGroup = nil
					
			if (string.match(objetiveType, "SOLDIER") ~= nil or string.match(objetiveType, "PARATROOPER") ~= nil or string.match(objetiveType, "INFANTRY") ~= nil) and string.match(objetiveType, "AAA") == nil then
				--trigger.action.outText("es infanteria: " .. objetiveType, 30)  
				AttackGroup = { 
								  id = 'AttackGroup', 
								  params = { 
									groupId = objetiveGroup:getID(),  
									weaponType = 805306368,
								  } 
								}
			else
				--trigger.action.outText("no es infanteria: " .. objetiveType, 30)  
				AttackGroup = { 
								  id = 'AttackGroup', 
								  params = { 
									groupId = objetiveGroup:getID(),			
								  } 
								}
			end
			
			
			local orbit = {
						   id = 'Orbit', 
							 params = { 
							   pattern = 'Circle',
							   point = {x = attackingGroup:getUnit(1):getPoint().x + (objetiveGroup:getUnit(1):getPoint().x - attackingGroup:getUnit(1):getPoint().x)/4, y = attackingGroup:getUnit(1):getPoint().z + (objetiveGroup:getUnit(1):getPoint().z - attackingGroup:getUnit(1):getPoint().z)/4},
							   speed = 0,
							   altitude = 250,
						   } 
						 }
			
					
			local routePoints = {} 
															
				routePoints[1] = {
						action = "Fly Over Point",
						type= "Turning Point",
						x = attackingGroup:getUnit(1):getPoint().x,
						y = attackingGroup:getUnit(1):getPoint().z,
						alt = 200,
						alt_type = "RADIO",
						speed = 250,
						ETA = 100,
						ETA_locked = false,
						name = "WP1", 
						task = AttackGroup,
						}	
			
--				routePoints[2] = {
--						action = "Fly Over Point",
--						type= "Turning Point",
--						x = attackingGroup:getUnit(1):getPoint().x + (objetiveGroup:getUnit(1):getPoint().x - attackingGroup:getUnit(1):getPoint().x)/4,
--						y = attackingGroup:getUnit(1):getPoint().z + (objetiveGroup:getUnit(1):getPoint().z - attackingGroup:getUnit(1):getPoint().z)/4,
--						alt = 300,
--						alt_type = "RADIO",
--						speed = 0,
--						ETA = 100,
--						ETA_locked = false,
--						name = "WP2", 
--						task = orbit,
--						}
				
			--trigger.action.markToAll(math.random(10,99999), "Destination point", {x = attackingGroup:getUnit(1):getPoint().x + (objetiveGroup:getUnit(1):getPoint().x - attackingGroup:getUnit(1):getPoint().x)/4, y = 0, z = attackingGroup:getUnit(1):getPoint().z + (objetiveGroup:getUnit(1):getPoint().z - attackingGroup:getUnit(1):getPoint().z)/4})
			
			
			local _mission = { 
				id = 'Mission', 
				params = { 
					airborne = true,
					route = { 
						points = routePoints
					}, 
				} 
			}
							
			local _controller = attackingGroup:getController();
			--_controller:resetTask()
			_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE)
			_controller:setOption( AI.Option.Air.id.SILENCE, true)
			_controller:setOption( AI.Option.Air.id.MISSILE_ATTACK, AI.Option.Air.val.MISSILE_ATTACK.MAX_RANGE)
			_controller:setTask(_mission)
			
			enhancer.escort.currentTarget = objetiveGroup:getName()
			if parameters.verbose == true then
				enhancer.setMessageDelayed("PLAYER: Attack assigned target", 5, 1, true)
				enhancer.setSoundDelayed("enhancer_PLAYER_AttackTarget.ogg", 1)
				enhancer.setMessageDelayed("COLT 7: WILCO, Attacking asigned target. (" .. parameters.objetiveGroupName .. ")", 10, 4, true)
				enhancer.setSoundDelayed("enhancer_COLT_AttackTarget.ogg", 4)
			end
			timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 10)		
			--trigger.action.outText("ataque asignado", 30)			
		else
			enhancer.setMessageDelayed("PLAYER: Attack asigned target", 5, 1, true)
				enhancer.setSoundDelayed("enhancer_PLAYER_AttackTarget.ogg", 1)
			enhancer.setMessageDelayed("COLT 7: Negative, this target is already destroyed.", 10, 4, true)
			enhancer.setSoundDelayed("enhancer_COLT_AlreadyDestroyed.ogg", 4)
		end --attackingGroup ~= nil
	end 	
end;
				

function enhancer.escortROE(isAttack)
	
	if isAttack == false then
		enhancer.setMessageDelayed("PLAYER: Weapons hold.", 10, 2, true)
		enhancer.setSoundDelayed("enhancer_PLAYER_WeaponsHold.ogg", 2)
		enhancer.setMessageDelayed("COLT 7: WILCO.", 5, 10, true)
		enhancer.setSoundDelayed("enhancer_COLT_WILCO.ogg", 10)		
		missionCommands.removeItem(enhancer.N8612)
		enhancer.N8612 = nil
		enhancer.N8611 = missionCommands.addCommand('Weapons free', enhancer.N861, enhancer.escortROE, true)		
	else
		enhancer.setMessageDelayed("PLAYER: Weapons free.", 10, 2, true)
		enhancer.setSoundDelayed("enhancer_PLAYER_Weaponsfree.ogg", 2)
		enhancer.setMessageDelayed("COLT 7: WILCO.", 5, 10, true)
		enhancer.setSoundDelayed("enhancer_COLT_WILCO.ogg", 10)
		missionCommands.removeItem(enhancer.N8611)
		enhancer.N8611 = nil
		enhancer.N8612 = missionCommands.addCommand('Weapons hold', enhancer.N861, enhancer.escortROE, false)		
	end
	
	enhancer.escort.ROEAttack = isAttack
	enhancer.escort.currentROE = isAttack
		
end


function enhancer.requestDismissPackage(groupType)
	enhancer.setMessageDelayed("PLAYER: You can RTB. Thank you for the support.", 10, 2, true)
	enhancer.setSoundDelayed("enhancer_PLAYER_CanRTB.ogg", 2)
	timer.scheduleFunction(enhancer.dismissPackage, {pgroupType = groupType}, timer.getTime() + 30)
	
	if groupType == "SEAD" and Group.getByName(enhancer.sead.packageName):getUnit(1) ~= nil then		
		enhancer.setMessageDelayed("UZI 8: Roger. Was a pleasure. Have a nice day.", 10, 10, true)
		enhancer.setSoundDelayed("enhancer_UZI_RTB.ogg", 10)
	elseif groupType == "GA" and Group.getByName(enhancer.attack.packageName):getUnit(1) ~= nil then		
		enhancer.setMessageDelayed("BOAR 7: Roger. Was a pleasure. Have a nice day.", 10, 10, true)
		enhancer.setSoundDelayed("enhancer_BOAR_RTB.ogg", 10)		
	elseif groupType == "SWEEP" and Group.getByName(enhancer.sweep.packageName):getUnit(1) ~= nil then			
		enhancer.setMessageDelayed("FORD 6: Roger. Was a pleasure. Have a nice day.", 10, 7, true)
		enhancer.setSoundDelayed("enhancer_FORD_RTB.ogg", 7)	
	elseif groupType == "ESCORT" and Group.getByName(enhancer.escort.packageName):getUnit(1) ~= nil then		
		enhancer.setMessageDelayed("COLT 7: Roger. Was a pleasure. Have a nice day.", 10, 7, true)
		enhancer.setSoundDelayed("enhancer_COLT_RTB.ogg", 7)
	elseif groupType == "DRONE" and Group.getByName(enhancer.lasedrone.droneName):getUnit(1) ~= nil then		
		enhancer.setMessageDelayed("PONTIAC 5: Roger. Was a pleasure. Have a nice day.", 10, 7, true)
		enhancer.setSoundDelayed("enhancer_COLT_RTB.ogg", 7)
	end
end


function enhancer.dismissPackage(parameters)
	enhancer.setMessageDelayed("[INFO]: " .. parameters.pgroupType  .. " package has left the OA.", 15, 2, true)	
	enhancer.setSoundDelayed("enhancer_Beep.ogg", 2)
	if parameters.pgroupType == "SEAD" and Group.getByName(enhancer.sead.packageName):getUnit(1) ~= nil then
		enhancer.destroyGroup(enhancer.sead.packageName)
		enhancer.N41 = missionCommands.addCommand('Request SEAD package', enhancer.N4, enhancer.requestSEAD, nil)	
		if enhancer.N42 ~= nil then missionCommands.removeItem(enhancer.N42) end
		if enhancer.N43 ~= nil then missionCommands.removeItem(enhancer.N43) end
		if enhancer.N91 ~= nil then missionCommands.removeItem(enhancer.N91) end		
		enhancer.sead.packageInProgress = false;
		enhancer.sead.packageInOA = false;
		enhancer.sead.packageName = nil;
		enhancer.sead.targetGroupName = nil;
		
	elseif parameters.pgroupType == "GA" and Group.getByName(enhancer.attack.packageName):getUnit(1) ~= nil then
		enhancer.destroyGroup(enhancer.attack.packageName)			
		enhancer.N51 = missionCommands.addCommand('Request Ground Attack package', enhancer.N5, enhancer.requestGrAttack, nil)	
		if enhancer.N52 ~= nil then missionCommands.removeItem(enhancer.N52) end
		if enhancer.N53 ~= nil then missionCommands.removeItem(enhancer.N53) end	
		if enhancer.N92 ~= nil then missionCommands.removeItem(enhancer.N92) end
		enhancer.attack.packageInProgress = false;
		enhancer.attack.packageInOA = false;
		enhancer.attack.packageName = nil;
		enhancer.attack.targetGroupName = nil;
		
	elseif parameters.pgroupType == "SWEEP" and Group.getByName(enhancer.sweep.packageName):getUnit(1) ~= nil then		
		enhancer.destroyGroup(enhancer.sweep.packageName)		
		enhancer.N61 = missionCommands.addCommand('Request Fighter Sweep package', enhancer.N6, enhancer.requestFighterSweep, nil)	
		if enhancer.N62 ~= nil then missionCommands.removeItem(enhancer.N62) end
		if enhancer.N63 ~= nil then missionCommands.removeItem(enhancer.N63) end
		if enhancer.N93 ~= nil then missionCommands.removeItem(enhancer.N93) end
		enhancer.sweep.packageInProgress = false;
		enhancer.sweep.packageInOA = false;
		enhancer.sweep.packageName = nil;
		enhancer.sweep.targetGroupName = nil;
			
	elseif parameters.pgroupType == "ESCORT" and Group.getByName(enhancer.escort.packageName):getUnit(1) ~= nil then		
		enhancer.destroyGroup(enhancer.escort.packageName)	
		enhancer.N81 = missionCommands.addCommand('Request escort package', enhancer.N8, enhancer.requestEscort, nil)	
		if enhancer.N82 ~= nil then missionCommands.removeItem(enhancer.N82) end
		if enhancer.N83 ~= nil then missionCommands.removeItem(enhancer.N83) end
		if enhancer.N84 ~= nil then missionCommands.removeItem(enhancer.N84) end
		if enhancer.N85 ~= nil then missionCommands.removeItem(enhancer.N85) end	
		if enhancer.N86 ~= nil then missionCommands.removeItem(enhancer.N86) end
		if enhancer.N87 ~= nil then missionCommands.removeItem(enhancer.N87) end
		if enhancer.N95 ~= nil then missionCommands.removeItem(enhancer.N95) end
		enhancer.escort.packageInProgress = false;
		enhancer.escort.packageInOA = false;
		enhancer.escort.packageName = nil;
		enhancer.escort.targetGroupName = nil;		
		enhancer.escort.RWRUnitList = ""		
		enhancer.escort.currentTarget = nil
		enhancer.escort.lastSearchPos = nil
		
	elseif parameters.pgroupType == "DRONE" and Group.getByName(enhancer.lasedrone.droneName):getUnit(1) ~= nil then
		enhancer.destroyGroup(enhancer.lasedrone.droneName)		
		enhancer.N11 = missionCommands.addCommand('Request Drone', enhancer.N1, enhancer.requestDrone, nil)			
		if enhancer.N12 ~= nil then missionCommands.removeItem(enhancer.N12) end
		if enhancer.N13 ~= nil then missionCommands.removeItem(enhancer.N13) end
		if enhancer.N14 ~= nil then missionCommands.removeItem(enhancer.N14) end	
		if enhancer.N15 ~= nil then missionCommands.removeItem(enhancer.N15) end		
		if enhancer.N96 ~= nil then missionCommands.removeItem(enhancer.N96) end
		enhancer.lasedrone.laserPos = nil;
		enhancer.lasedrone.laserCode = nil;
		enhancer.lasedrone.laserSpot = nil;
		enhancer.lasedrone.droneName = "";
		enhancer.lasedrone.reaperInProgress = false;
		enhancer.lasedrone.reaperInOA = false;
		enhancer.lasedrone.isLaseAvailable = false;
		enhancer.lasedrone.currentLasedTarget = "STOP";
	end
end;


function enhancer.destroyGroup(groupName)
	if Group.getByName(groupName):getUnit(1) ~= nil then
		Group.getByName(groupName):destroy()
	end	
end;





function enhancer.doTimer()
	--trigger.action.outText("doTimer", 10)
	
	-- ESCORT scanning targets***********************************************************************************************************************	
	if enhancer.escort.packageName ~= nil then
		local escortGroup = Group.getByName(enhancer.escort.packageName)
		local _controller = escortGroup:getController()
		local escortGroupPosXY = {x = escortGroup:getUnit(1):getPoint().x, y = escortGroup:getUnit(1):getPoint().z}		
		local anchorPosXY = nil
		local targetPosXY = nil
		local newtargetFound = false
		
		--trigger.action.outText("Dist. lastStopPos:" .. enhancer.getDistancePointPoint(escortGroupPosXY, lastStopPosXY), 10)				
		
			--search for enemies
						
			local FoundUnits = enhancer.searchGrTargets(escortGroup:getUnit(1):getPoint(), 7500, Object.Category.UNIT)	-- en metros
			--trigger.action.outText("numeroDetectados: " .. #FoundUnits, 15, false)	
				
			if #FoundUnits > 0 then
				--trigger.action.outText("currentTargetsList: " .. enhancer.escort.ignoreTargetsList, 10)	
								
				
				for i = 1, #FoundUnits do	
					if string.match(enhancer.escort.ignoreTargetsList, FoundUnits[i]:getGroup():getID()) == nil then
						newtargetFound = true
						--trigger.action.outText("new target: " .. FoundUnits[i]:getGroup():getID(), 10)								
						enhancer.escort.ignoreTargetsList = enhancer.escort.ignoreTargetsList .. ";" .. FoundUnits[i]:getGroup():getID() .. ";"						
					end
				end --for
						
				
				if newtargetFound == true then
					enhancer.escort.lastSearchPos = escortGroup:getUnit(1):getPoint()
					
					--_controller:resetTask()

					if enhancer.escort.ROEAttack == false then
						
						local anguloLlegada = math.atan2(FoundUnits[1]:getPoint().z  - escortGroup:getUnit(1):getPoint().z, FoundUnits[1]:getPoint().x - escortGroup:getUnit(1):getPoint().x)
						--trigger.action.outText("angulo " .. anguloLlegada, 10)
						
						
						local offSetY = 500 * math.sin(anguloLlegada)
						local offSetX = 500 * math.cos(anguloLlegada)	
						
						local offSetY2 = 1000 * math.sin(anguloLlegada)
						local offSetX2 = 1000 * math.cos(anguloLlegada)
						
						local posX = escortGroup:getUnit(1):getPoint().x + offSetX
						local posY = escortGroup:getUnit(1):getPoint().z + offSetY
						
						local posX2 = escortGroup:getUnit(1):getPoint().x + offSetX2
						local posY2 = escortGroup:getUnit(1):getPoint().z + offSetY2
						
						local routePoints = {}
						routePoints[1] = {
										action = "Fly Over Point",
										type= "Turning Point",
										x = escortGroup:getUnit(1):getPoint().x,
										y = escortGroup:getUnit(1):getPoint().z,
										alt = 200,
										alt_type = "RADIO",
										speed = enhancer.escort.speed,
										ETA = 100,
										ETA_locked = false,
										name = "WP1", 
										task = nil,
										}	
							
								routePoints[2] = {
										action = "Fly Over Point",
										type= "Turning Point",
										x = posX,
										y = posY,
										alt = 200,
										alt_type = "RADIO",
										speed = enhancer.escort.speed/1.5,
										ETA = 100,
										ETA_locked = false,
										name = "WP2", 
										task = nil,
										}
								routePoints[3] = {
										action = "Fly Over Point",
										type= "Turning Point",
										x = posX2,
										y = posY2,
										alt = 200,
										alt_type = "RADIO",
										speed = 0,
										ETA = 100,
										ETA_locked = false,
										name = "WP3", 
										task = nil,
										}		
										
									
							local _mission = { 
								id = 'Mission', 
								params = { 
									airborne = true,
									route = { 
										points = routePoints
									}, 
								} 
							}
							
						_controller:setTask(_mission)
						
						enhancer.setMessageDelayed("COLT 7: Tally new enemies in route. Anchored at current position and waiting further orders.", 20, 5, true)
						enhancer.setSoundDelayed("enhancer_COLT_EnemiesInRoute.ogg", 5)
						enhancer.escort.ROEAttack = enhancer.escort.currentROE --una vez se para, vuelve al ROE actual			
					else
						enhancer.setMessageDelayed("COLT 7: Tally enemies in route. Engaging target. (" .. FoundUnits[1]:getGroup():getName() .. ")", 59, 5, false)					
						enhancer.setSoundDelayed("enhancer_COLT_EngagingTarget.ogg", 5)
						enhancer.escort.ROEAttack = false -- una vez inicia el ataque a un objetivo, si encuentra otro, debe pararse y avisar para que el jugador tome la decision
						enhancer.doEscortAttack({objetiveGroupName = FoundUnits[1]:getGroup():getName(), verbose = false})
					end
					
					enhancer.searchEscort(FoundUnits)
				end -- newtargetFound
				
				
				
			else
				--trigger.action.outText("Enemigos no encontrados", 10)
				--si no encontramos enemigos, reseteamos la lista de enemigos ya conocidos				
				enhancer.escort.ignoreTargetsList = ""
				
			end	--FoundUnits		
	-- ESCORT RWR***********************************************************************************************************************	
		--trigger.action.outText("Checkeando RWR", 10, false)
		local enemyCoalition = nil
		if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
			enemyCoalition = coalition.side.BLUE
		elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
			enemyCoalition = coalition.side.RED
		end
		
		--trigger.action.outText("coalicion " .. enemyCoalition, 10, false)
		local allEnemyGroups = coalition.getGroups(enemyCoalition, Group.Category.GROUND)
		
		for i, enemyGroup in pairs(allEnemyGroups) do			
			for index, enemyUnit in pairs(enemyGroup:getUnits()) do					
				if enemyUnit:hasSensors(Unit.SensorType.RADAR) then		
					--trigger.action.outText(enemyUnit:getTypeName(), 10, false)				
					local detected, visible, lastTime, tipo, distance,lastPos, lastVel = _controller:isTargetDetected(enemyUnit, Controller.Detection.RWR)	
					
					if detected and string.match(enhancer.escort.RWRUnitList, ";" .. enemyUnit:getID() ..";") == nil then						
						local anguloRWR = enhancer.getBearing({x = escortGroup:getUnit(1):getPoint().x, y = escortGroup:getUnit(1):getPoint().z} , {x = enemyUnit:getPoint().x, y = enemyUnit:getPoint().z})
						
						enhancer.setMessageDelayed("COLT 7: I have new enemy spike in my RWR; " .. enemyUnit:getTypeName() .. ". Bearing " .. anguloRWR .. "º", 20, 10, true)
						enhancer.setSoundDelayed("enhancer_COLT_SpikeDetected.ogg", 10)
						
						enhancer.escort.RWRUnitList = enhancer.escort.RWRUnitList .. ";" .. enemyUnit:getID() .. ";"
						--trigger.action.outText(enhancer.escort.RWRUnitList, 10, false)		
						--trigger.action.outText("detectado grupo " .. enemyUnit:getGroup():getID() .. ";Bearing " .. anguloRWR .. "º", 10, false)
					elseif detected == false and string.match(enhancer.escort.RWRUnitList, ";" .. enemyUnit:getID() .. ";") ~= nil then						
						enhancer.escort.RWRUnitList = string.gsub(enhancer.escort.RWRUnitList, ";" .. enemyUnit:getID() .. ";", " ")
						--trigger.action.outText("quitado grupo ;" .. enemyUnit:getID() .. ";", 10, false)						
						--trigger.action.outText(enhancer.escort.RWRUnitList, 10, false)		
					end	--detected				
				end --has sensors			
			end --for enemyunit	
		end --for nenemygroup
				
	end -- enhancer.escort.packageName
	
	timer.scheduleFunction(enhancer.doTimer, nil, timer.getTime() + 20)
end;

---[[
function enhancer.setEnhancerMenu()
	menuPrinc = missionCommands.addSubMenu('Mission Enhancer Menu')
	enhancer.N1 = missionCommands.addSubMenu('DRONE LASE', menuPrinc)
	enhancer.N11 = missionCommands.addCommand('Request Drone', enhancer.N1, enhancer.requestDrone, nil)	
	
	enhancer.N2 = missionCommands.addCommand('Recon my target', menuPrinc, enhancer.requestSatellite, nil)
	
	enhancer.N3 = missionCommands.addCommand('Strike on my target', menuPrinc, enhancer.requestStrike, nil)	
	
	enhancer.N4 = missionCommands.addSubMenu('SEAD', menuPrinc)
	enhancer.N41 = missionCommands.addCommand('Request SEAD package', enhancer.N4, enhancer.requestSEAD, nil)	
	--enhancer.N43 = missionCommands.addCommand('Test destroy unit', enhancer.N4, destroyUnit, nil)	
	
	enhancer.N5 = missionCommands.addSubMenu('GROUND ATTACK', menuPrinc)
	enhancer.N51 = missionCommands.addCommand('Request Ground Attack package', enhancer.N5, enhancer.requestGrAttack, nil)	
	
	enhancer.N6 = missionCommands.addSubMenu('SWEEP', menuPrinc)
	enhancer.N61 = missionCommands.addCommand('Request fighter sweep package', enhancer.N6, enhancer.requestFighterSweep, nil)	
	
	enhancer.N7 = missionCommands.addSubMenu('SCOUT.', menuPrinc)
	enhancer.N71 = missionCommands.addCommand('Request scout package', enhancer.N7, enhancer.requestScout, nil)

	enhancer.N8 = missionCommands.addSubMenu('ESCORT', menuPrinc)
	enhancer.N81 = missionCommands.addCommand('Request escort package', enhancer.N8, enhancer.requestEscort, nil)	
	
	enhancer.N9 = missionCommands.addSubMenu('DISMISS', menuPrinc)
	
end;
--]]


function enhancer.setAvailability()
	local randomLase = math.random() * 100
	--trigger.action.outText("randomLase: " .. randomLase, 10, false)
	if randomLase < enhancer.lasedrone.availability then
		--trigger.action.outText("isLaseAvailable: true", 10, false)
		enhancer.isLaseAvailable = true
	else
		--trigger.action.outText("isLaseAvailable: false", 10, false)
		enhancer.isLaseAvailable = false
	end
	
	local randomRecon = math.random() * 100
	--trigger.action.outText("randomRecon: " .. randomRecon, 10, false)
	if randomRecon < enhancer.recon.availability then
		--trigger.action.outText("isSatelliteAvailable: true", 10, false)
		enhancer.recon.isSatelliteAvailable = true
	else
		--trigger.action.outText("isSatelliteAvailable: false", 10, false)
		enhancer.recon.isSatelliteAvailable = false
	end
	
	local randomStrike = math.random() * 100
	--trigger.action.outText("randomStrike: " .. randomStrike, 10, false)
	if randomStrike < enhancer.strike.availability then
		--trigger.action.outText("isHerculesAvailable: true", 10, false)
		enhancer.strike.isHerculesAvailable = true
	else
		--trigger.action.outText("isHerculesAvailable: false", 10, false)
		enhancer.strike.isHerculesAvailable = false
	end
	
	local randomSEAD = math.random() * 100
	--trigger.action.outText("randomSEAD: " .. randomSEAD, 10, false)
	if randomSEAD < enhancer.sead.availability then
		--trigger.action.outText("isPackageAvailable: true", 10, false)
		enhancer.sead.isPackageAvailable = true
	else
		--trigger.action.outText("isPackageAvailable: false", 10, false)
		enhancer.strike.isPackageAvailable = false
	end
	
	local randomATTACK = math.random() * 100
	--trigger.action.outText("randomATTACK: " .. randomSEAD, 10, false)
	if randomATTACK < enhancer.attack.availability then
		--trigger.action.outText("isPackageAvailable: true", 10, false)
		enhancer.attack.isPackageAvailable = true
	else
		--trigger.action.outText("isPackageAvailable: false", 10, false)
		enhancer.attack.isPackageAvailable = false
	end
	
	local randomSweep = math.random() * 100
	--trigger.action.outText("randomSweep: " .. randomSEAD, 10, false)
	if randomSweep < enhancer.sweep.availability then
		--trigger.action.outText("isPackageAvailable: true", 10, false)
		enhancer.sweep.isPackageAvailable = true
	else
		--trigger.action.outText("isPackageAvailable: false", 10, false)
		enhancer.sweep.isPackageAvailable = false
	end
	
	local randomEscort = math.random() * 100
	--trigger.action.outText("randomSweep: " .. randomSEAD, 10, false)
	if randomEscort < enhancer.escort.availability then
		--trigger.action.outText("isPackageAvailable: true", 10, false)
		enhancer.escort.isPackageAvailable = true
	else
		--trigger.action.outText("isPackageAvailable: false", 10, false)
		enhancer.escort.isPackageAvailable = false
	end
	
end;
	
world.addEventHandler(evento);
--enhancer.setEnhancerMenu();
timer.scheduleFunction(enhancer.setAvailability, nil, timer.getTime() + 1)
enhancer.doTimer();
--trigger.action.outText("M.E.P v2.0", 5, false)

