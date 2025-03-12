BASE:TraceClass("MSRS")
BASE:TraceLevel(3)
BASE:TraceOnOff( true )


local msrs = MSRS:New('C:/Program Files/DCS-SimpleRadio-Standalone/DCS-SimpleRadio-Standalone/', 305, radio.modulation.AM):SetVoice("en-US-Standard-B")
msrs:SetBackendSRSEXE()
msrs:SetTTSProviderMicrosoft()
msrs:SetCulture("en-US")

-- local text=SOUNDTEXT:New("Как минимум один самолет с каждой стороны зашел в зону. Таймер старта игры запущен! До старта 2 минуты!"):SetVoice("es-ES-Standard-A")
-- msrs:PlaySoundText(text, 0)

-- local text=SOUNDTEXT:New("At least one aircraft from each side has entered the zone. The game start timer is running! 2 minutes until the start!"):SetVoice("en-US-Standard-B") 
-- msrs:PlaySoundText(text, 15)
atis=ATIS:New("Batumi", 251, radio.modulation.AM)
ATIS:SetLocale("en")
-- ATIS:SetSRS() expects a string for the SRS path even though it is not needed with DCS-gRPC
atis:SetSRS('C:/Program Files/DCS-SimpleRadio-Standalone/DCS-SimpleRadio-Standalone/', 'male', 'en-US')
-- Start ATIS
atis:Start()


env.info("LOCALE is "..SETTINGS:GetLocale())

if (SETTINGS:GetLocale() == 'ru') then
    msrs:SetVoice("ru-RU-Standard-B")
    local text=SOUNDTEXT:New("Как минимум один самолет с каждой стороны зашел в зону. Таймер старта игры запущен! До старта 2 минуты!")
    msrs:PlaySoundText(text, 0)
    
elseif (SETTINGS:GetLocale() == 'en') then    
    local text=SOUNDTEXT:New("At least one aircraft from each side has entered the zone. The game start timer is running! 2 minutes until the start!") 
    msrs:PlaySoundText(text, 0)
end

-- env.info("MSRS:New(nil, 305.0):PlaySoundText(text, 0) done")    
-- msrs:PlayText("Hello World, this is the Moose simple radio text-to-speech class speaking.")
