---
-- Author: FlightControl
-- Created: 01.03.2018
-- Contributors: kaltokri
-- Modified: 27.02.2024
--
-- # Documentation:
-- https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Documentation/Wrapper.Group.html
-- https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Documentation/Core.Timer.html
--
-- # Description:
-- In this mission a vehicle will be damaged by Explode and then respawned with full health.
--
-- # Guide:
-- 1. Start the mission and wait 10 seconds.
-- 2. The Vehicle will be damaged.
-- 3. Wait additional 10 seconds and the Vehicle will be respawned with full health.

-- Find the Vehicle and create a GROUP object.
-- @class GROUP
Vehicle = GROUP:FindByName( "Vehicle" )
Position = Vehicle:GetPositionVec3()

Vec2 = POINT_VEC2:NewFromVec3(Position)
COORDINATE:NewFromVec2(UTILS.Vec2Translate(Position, 10, 90)):SmokeRed()

-- Damage the vehicle with a delay of 10 seconds.
Vehicle:Explode( 1, 3 )
MESSAGE:New( "Vehicle will be damaged in 3 seconds and respawn in 20 seconds!", 10 ):ToAll():ToLog()

-- Respawn the vehicle 20 seconds after mission start.
TIMER:New(
  function()
    local oldPosition = POINT_VEC3:NewFromVec3(Position)
    local newPosition = UTILS.VecTranslate(oldPosition, 100, 90)

    Vehicle:InitCoordinate(COORDINATE:NewFromVec3(newPosition), 0)
    Vehicle:Respawn(nil, true)
  end
):Start( 5 )
