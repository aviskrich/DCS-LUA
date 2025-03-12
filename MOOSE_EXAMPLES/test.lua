local farpCounter = 4

SPAWNSTATIC:NewFromStatic("FARP Inviz #1", country.id.CJTF_BLUE)
    :InitCoordinate(STATIC:FindByName("STATIC #1"):GetCoordinate())
    :Spawn(0, "FARP Inviz #" .. farpCounter)