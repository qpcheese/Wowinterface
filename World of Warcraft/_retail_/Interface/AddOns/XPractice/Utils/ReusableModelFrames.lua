_XPRACTICE_ReusableModelFrames = XPRACTICE.inheritsFrom(_XPRACTICE_ReusableFrames)

XPRACTICE.ReusableModelFrames=_XPRACTICE_ReusableModelFrames.new()
XPRACTICE.ReusableModelFrames.inactiveframes={}
XPRACTICE.ReusableModelFrames.activeframes={}
XPRACTICE.ReusableModelFrames.nextframeid=0

function _XPRACTICE_ReusableModelFrames:NextFrameName()	
	return "XPRACTICE.ReusableModelFrame"..tostring(self.nextframeid);
end



function _XPRACTICE_ReusableModelFrames:ReturnCreateFrameDetails(framename)
	return CreateFrame("DressUpModel",framename,UIParent)
	--return CreateFrame("PlayerModel",framename,UIParent)
end

-- 
--frame:SetCamera(0) -- full view (i.e. not facecam)

function _XPRACTICE_ReusableModelFrames:ResetProperties(f)	
	XPRACTICE.ReusableFrames.ResetProperties(self,f)
	f:SetCamera(1)
	f:SetPosition(0,0,0)
	f:SetRotation(0)
	f:SetModelScale(1)
	f:SetModelAlpha(1)
	f:SetDesaturation(0.0)
	f:UseModelCenterToTransform(false)
end