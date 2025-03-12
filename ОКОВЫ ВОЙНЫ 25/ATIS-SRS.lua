local const SRS_PATH = "C:/Program Files/DCS-SimpleRadio-Standalone/DCS-SimpleRadio-Standalone/"
local const SRS_CHARLIE_PATH = "E:/DCS-SimpleRadio-Standalone/"
local const SRS_PORT = 5103 

atisAlDhafra=ATIS:New(AIRBASE.PersianGulf.Al_Dhafra_AFB, 119.65)
atisAlDhafra:SetSRS(SRS_CHARLIE_PATH, 'female', 'en-US', nil, SRS_PORT)
atisAlDhafra:SetActiveRunwayTakeoff(nil, false)
atisAlDhafra:SetActiveRunwayLanding(nil, true)
atisAlDhafra:SetTowerFrequencies({258.0})
atisAlDhafra:SetVOR(114.90)
atisAlDhafra:Start()