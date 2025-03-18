SetGroup = SET_GROUP:New():FilterPrefixes( "RECON" ):FilterStart()

HQ = GROUP:FindByName( "HQ BLUE" )

CC = COMMANDCENTER:New( HQ, "HQ BLUE" )

RecceDetectionStatic = DETECTION_UNITS:New( SetGroup ):FilterCategories( Unit.Category.STRUCTURE )
RecceDetectionGround = DETECTION_UNITS:New( SetGroup ):FilterCategories( Unit.Category.GROUND_UNIT )

RecceDetectionStatic:Start()
RecceDetectionGround:Start()

--- OnAfter Transition Handler for Event Detect.
-- @param Functional.Detection#DETECTION_UNITS self
-- @param #string From The From State string.
-- @param #string Event The Event string.
-- @param #string To The To State string.
function RecceDetectionStatic:OnAfterDetect(From,Event,To)

  local DetectionReport = self:DetectedReportDetailed()

  HQ:MessageToAll( DetectionReport, 15, "Detection" )
end

function RecceDetectionGround:OnAfterDetect(From,Event,To)

  local DetectionReport = self:DetectedReportDetailed()

  HQ:MessageToAll( DetectionReport, 15, "Detection" )
end

collectgarbage()