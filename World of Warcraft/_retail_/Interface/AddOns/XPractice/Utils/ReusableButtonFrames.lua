_XPRACTICE_ReusableButtonFrames = XPRACTICE.inheritsFrom(_XPRACTICE_ReusableFrames)

XPRACTICE.ReusableButtonFrames=_XPRACTICE_ReusableButtonFrames.new()
XPRACTICE.ReusableButtonFrames.inactiveframes={}
XPRACTICE.ReusableButtonFrames.activeframes={}
XPRACTICE.ReusableButtonFrames.nextframeid=0

function _XPRACTICE_ReusableButtonFrames:NextFrameName()	
	return "XPRACTICE.ReusableButtonFrame"..tostring(self.nextframeid);	
end

function _XPRACTICE_ReusableButtonFrames:ResetProperties(f)	
	XPRACTICE.ReusableFrames.ResetProperties(self,f)
	
	ActionButton_HideOverlayGlow(f)
	
	--TODO:
	--f:SetNormalTexture(f.texture)
	local emptytexture
	if(XPRACTICE.TOCVersion>=100000)then
		emptytexture="Interface\\AddOns\\XPractice\\Assets\\Graphics\\transparent.tga"
			-- emptytexture="" does not work in 100002.
	else
		emptytexture=nil
	end
	f:SetNormalTexture(emptytexture)		
	f:SetHighlightTexture(emptytexture)
	f:SetPushedTexture(emptytexture)
	
	f:SetScript("OnClick",nil)
	f:SetScript("OnMouseUp",nil)
	f:SetScript("OnEnter",nil)
	f:SetScript("OnLeave",nil)
	
	--TODO LATER: find out if this is redundant or necessary or even if anything we're doing actually prevents memory leaks
		--(it's certainly not necessary to register click events beforehand, if such a thing is even possible)
	f:UnregisterAllEvents()
	-- mouse is enabled on our buttons by default, so if we disabled it, turn it back on here
		-- note that this line overrides the previous EnableMouse(false) in ReusableFrames.ResetProperties
			-- -- this is one of the reasons ResetProperties hides frames by default
	f:EnableMouse(true)
	f:RegisterForClicks("AnyDown","AnyUp")
	
	--print("ReusableButtonFrames: GetHighlightTexture:",f:GetHighlightTexture())
end


function _XPRACTICE_ReusableButtonFrames:ReturnCreateFrameDetails(framename)
	--return CreateFrame("Button",framename,UIParent)
	local f=CreateFrame("Button",framename,UIParent)
	--f:GetNormalTexture():SetAllPoints(f)
	--f:GetHighlightTexture():SetAllPoints(f)
	--f:GetPushedTexture():SetAllPoints(f)
	return f
end