-- these are more or less identical to ModelFrames
-- except we reserve these for "particle" effects
-- (models which don't support customcamera)
-- because "particle" frames malfunction if we try to recycle them for customcamera models.

_XPRACTICE_ReusableParticleFrames = XPRACTICE.inheritsFrom(_XPRACTICE_ReusableFrames)

XPRACTICE.ReusableParticleFrames=_XPRACTICE_ReusableParticleFrames.new()
XPRACTICE.ReusableParticleFrames.inactiveframes={}
XPRACTICE.ReusableParticleFrames.activeframes={}
XPRACTICE.ReusableParticleFrames.nextframeid=0

function _XPRACTICE_ReusableParticleFrames:NextFrameName()	
	return "XPRACTICE.ReusableParticleFrame"..tostring(self.nextframeid);
end



function _XPRACTICE_ReusableParticleFrames:ReturnCreateFrameDetails(framename)
	--return CreateFrame("DressUpModel",framename,UIParent)
	return CreateFrame("PlayerModel",framename,UIParent)
end

function _XPRACTICE_ReusableParticleFrames:ResetProperties(f)	
--TODO: resetproperties for DressUpModel version too

	XPRACTICE.ReusableFrames.ResetProperties(self,f)
	
	--f:Show()		-- we removed the Show and Hide lines recently.
			----------------------------------------------------------------
	--f:SetModel(0)		------------BETA CLIENT CRASH
			----------------------------------------------------------------
	
	--for "particle" models, it is apparently vital to set ModelScale before Position
	--	(both here and during draw event)
	-- otherwise modelscale won't reset properly.
	-- (we would guess matrix multiplication is involved somehow, but Rotation order doesn't appear to make a difference)
	-- TODO: verify
	f:SetModelScale(1)			-- do these lines have any effect now that they're not in a Show/Hide block?
	f:SetPosition(0,0,0)	
	f:SetRotation(0)
	f:UseModelCenterToTransform(false)
	--f:Hide()
end