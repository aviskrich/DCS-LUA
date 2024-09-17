
MESSAGE:New("Настраиваем рацию на 251", 5, 'INFO'):toAll():toLog()

atisDamascus=ATIS:New(AIRBASE.Syria.Damascus, 250.00)
atisDamascus:SetSRS("C:\\Program Files\\DCS-SimpleRadio-Standalone", "male", "en-EN")--, nil, 5002, "google.json")
-- atisDamascus:SetSRSProvider(MSRS.Provider.GOOGLE)
atisDamascus:SetTowerFrequencies({251.500})
atisDamascus:SetActiveRunwayTakeoff("23R")
atisDamascus:SetActiveRunwayLanding("23L")
atisDamascus:SetVOR(116.00)
atisDamascus:AddILS(109.9, "23")
atisDamascus:SetMapMarks()
atisDamascus:Start()


atisIncirlik=ATIS:New(AIRBASE.Syria.Incirlik, 251.50)
atisIncirlik:SetSRS("C:\\Program Files\\DCS-SimpleRadio-Standalone", nil, nil, "Microsoft Hedda Desktop")
atisIncirlik:SetImperialUnits()
atisIncirlik:SetTACAN(21)
atisIncirlik:SetTowerFrequencies({250.350})
atisIncirlik:AddILS(109.30, "5")
atisIncirlik:AddILS(111.70, "23")
atisIncirlik:Start()