mainAiTarget = nil
aiClosest = nil

testSpawn = true

AI = {}

-- AI class
function AI:new(side)
    local ai = {}
    ai.aizones = {}
    ai.otherzones = {}
    ai.airtargets = {}
    ai.side = side
    setmetatable(ai, self)
    self.__index = self
    return ai
end

-- Выборка зон и деление на свои-чужие
function AI:SelectZones(airbasesArray, hubsArray)
    self.aizones = {}
    self.otherzones = {}

    for _, zone in ipairs(airbasesArray) do
        if (zone.side == self.side) then
            table.insert(self.aizones, zone)
        else
            table.insert(self.otherzones, zone)
        end
    end

    for _, hub in ipairs(hubsArray) do
        if (hub.side == self.side) then
            --if (self.side == coalition.side.BLUE) then
                table.insert(self.aizones, hub)
            --end
        else
            table.insert(self.otherzones, hub)
        end
    end
end

-- Вычисление ближайшей цели и ближайшей базы
function AI:selectMainAiTarget(airbasesArray, hubsArray)
    self:SelectZones(airbasesArray, hubsArray)

    local distance = nil
    for _, aizone in ipairs(self.aizones) do
        for _, otherzone in ipairs(self.otherzones) do
            local tmpdistance = aizone:GetCoordinate():Get2DDistance(otherzone:GetCoordinate())

            if (distance == nil or tmpdistance < distance) then
                distance = tmpdistance
                self.mainAiTarget = otherzone
                self.aiClosest = aizone
            end
        end
    end

    if self.side == coalition.side.RED then
        self.airtargets = {}
        set_unit:ForEachUnit(function(unit)
            if unit:IsAirPlane() and unit:IsAlive() and unit:IsActive() and unit:GetCoalition() == coalition.side.BLUE then
                table.insert(self.airtargets, unit)
            end
        end)
    end
    
    --print(Sidenames[self.side].." target is "..self.mainAiTarget:GetName().." Range: "..distance)
    return self
end

function aiSpawn(aizone, type, chance, target)
    if (Chance(chance) and aizone.supply >= type.cost) then
        local vehicle = SpawnInZone(type.spawner, aizone)
        if vehicle then
            if (target ~= nil) then
                GroudRouteToZone(vehicle, target)
            end

            --если заспавнился в воде, откатываем
            if vehicle:GetCoordinate():IsSurfaceTypeWater() == true then vehicle:Destroy() return false end

            aizone.supply = aizone.supply - type.cost
            return vehicle
        end
    end
    return nil
end

function aiSpawnAir(aizone, type, chance, target)

    if (Chance(chance) and aizone.supply >= type.cost) then
        if target ~= nil then
            local vehicle = SpawnAirAtAirbase(type.spawner, aizone:GetAirbase())
            if vehicle then
                local result = AirRouteToZone(vehicle, target, 3000)
                if result == true then aizone.supply = aizone.supply - type.cost end
            end
        else
            local vehicle = SpawnAirAtAirbase(type.spawner, aizone:GetAirbase())
            if vehicle then
                local result = AirRouteToZone(vehicle, target, 8000, true)
                if result == true then aizone.supply = aizone.supply - type.cost end
            end
        end
    end
end

function AI:CheckZones()
    for _, aizone in ipairs(self.aizones) do
        aizone:Scan({ Object.Category.UNIT })
        local AAAcounter = 0        
        local SAM7counter = 0
        local SAM8counter = 0
        local SAM10counter = 0
        local landDRLO = 0
        local units = aizone:GetScannedUnits()

        for _, unit in pairs(units) do
            local unitMoose = UNIT:Find( unit )
            if unitMoose:GetThreatLevel() == 6 then
                AAAcounter = AAAcounter + 1
            end            
            if unitMoose:GetThreatLevel() == 7 then --STRELA
                SAM7counter = SAM7counter + 1
            end        
            if unitMoose:GetThreatLevel() == 8 then --TOR
                SAM8counter = SAM8counter + 1
            end 
            if unitMoose:GetThreatLevel() >= 9 then
                SAM10counter = SAM10counter + 1
            end
            --print(unitMoose:GetGroup().GroupName)
            if unitMoose:GetGroup().GroupName:find(RED.LANDDRLO.L13.name, 0) ~= nil or unitMoose:GetGroup().GroupName:find(BLUE.LANDDRLO.FPS117.name, 0) ~= nil then
                landDRLO = landDRLO + 1
            end
        end

        if (aizone.side == 1) then
            --RED SIDE
            if (AAAcounter < 3) then
                aiSpawn(aizone, RED.AAA.ZSU23, 10)
            end

            if (SAM7counter < 2) then
                aiSpawn(aizone, RED.SAM.STRELA, 10)
            end

            if (SAM8counter < 2) then
                aiSpawn(aizone, RED.SAM.TOR, 10)
            end

            if (SAM10counter < 1) then
                aiSpawn(aizone, RED.SAM.BUK, 10)
            end

            if (landDRLO < 1) then
                aiSpawn(aizone, RED.LANDDRLO.L13, 100)
            end

            if Chance(40) then
                if (AAAcounter > 1) then
                    aiSpawn(aizone, RED.LIGHTARMOR.BTR80, 4, self.mainAiTarget)
                    aiSpawn(aizone, RED.ARMOR.T72B3, 3, self.mainAiTarget)
                end

                if (AAAcounter > 1) then
                    if aizone.isAirdrome then
                        aiSpawnAir(aizone, RED.ASSAULTAIRCRAFT.SU25S, 3, self.mainAiTarget)
                    end
                    if #self.airtargets > 3 and aizone.isAirdrome then
                        aiSpawnAir(aizone, RED.FIGHTERAIRCRAFT.SU27, 3) 
                    end         
                end
            end
        else
            if (aizone.supply > 800) then
                --BLUE SIDE
                if (AAAcounter < 3) then
                    aiSpawn(aizone, BLUE.AAA.VULCAN, 10)
                end

                if (SAM7counter < 2) then
                    aiSpawn(aizone, BLUE.SAM.STRELA, 10)
                end    

                if (SAM8counter < 2) then
                    aiSpawn(aizone, BLUE.SAM.TOR, 10)
                end    

                if (SAM10counter < 1) then
                    aiSpawn(aizone, BLUE.SAM.HAWK, 10)
                end

                if AAAcounter > 1 then
                    if aizone.isAirdrome then
                        aiSpawnAir(aizone, BLUE.AIRCRAFT.AWACS, 30)
                    end
                end

                if (landDRLO < 1) then
                    local vehicle = aiSpawn(aizone, BLUE.LANDDRLO.FPS117, 1)
                end
                --aiSpawn(aizone, BLUE.LIGHTARMOR.BRADLEY, 2, self.mainAiTarget)
            end
        end
    end
end
local test = true
function AiTick()
    local redAi = AI:new(coalition.side.RED)
    local blueAi = AI:new(coalition.side.BLUE)
    redAi:selectMainAiTarget(airbasesArray, hubsArray)
    blueAi:selectMainAiTarget(airbasesArray, hubsArray)
    redAi:CheckZones()
    blueAi:CheckZones()

    --local aiRed = AI:selectMainAiTarget(coalition.side.RED)
    if (testSpawn == true) then
        --local spawner = SPAWN:New("TORBLUE")
        --local tor = spawner:SpawnInZone(blueAi.aizones[2], true)
        --print(tor:GetThreatLevel())
        --local group = SpawnAirAtAirbase(BLUE.AIRCRAFT.AWACS.spawner, blueAi.aizones[2]:GetAirbase())
        --print(redAi.airtargets[1]:GetGroup():GetName())
        testSpawn = false
        
        --print(redAi.aizones[2]:GetName())
        --local group = SpawnAirAtAirbase(RED.FIGHTERAIRCRAFT.SU27.spawner, redAi.aizones[2]:GetAirbase())
        --AirRouteToZone(group, ZONE:New( "SouthHub" ), 8000, true)
    end
end