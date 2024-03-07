_XPRACTICE_ReusableCooldownFrames = XPRACTICE.inheritsFrom(_XPRACTICE_ReusableFrames)

XPRACTICE.ReusableCooldownFrames=_XPRACTICE_ReusableCooldownFrames.new()
XPRACTICE.ReusableCooldownFrames.inactiveframes={}
XPRACTICE.ReusableCooldownFrames.activeframes={}
XPRACTICE.ReusableCooldownFrames.nextframeid=0

function _XPRACTICE_ReusableCooldownFrames:NextFrameName()	
	return "XPRACTICE.ReusableCooldownFrame"..tostring(self.nextframeid);
end

function _XPRACTICE_ReusableCooldownFrames:ResetProperties(f)	
	XPRACTICE.ReusableFrames.ResetProperties(self,f)
	--f:SetLossOfControlCooldown(0, 0)
	
	--CooldownFrame_Set(f,0,0,false)
	--CooldownFrame_Clear(f)
	
	
	--f:Clear()--;f:SetAllPoints(UIParent)
	f:SetDrawSwipe(true)
	f:SetSwipeColor(0,0,0,0.8)	
	f:SetSwipeTexture(0)	-- must set color first, then texture.  otherwise it fails spectacularly.
	--f:SetSwipeColor(0.5,0.5,0.5,1)
	f:SetDrawEdge(false)		
	f:SetEdgeTexture("interface/cooldown/edge.blp",1,1,1,1)	
	----f:SetEdgeTexture(131008,1,1,1,1)		
	--f:SetEdgeScale(2)
	--f:SetBlingTexture("interface/cooldown/star4.blp",0.3,0.6,1,0.8)
	f:SetDrawBling(false)
	f:SetHideCountdownNumbers(true)
	f:SetRotation(0)
	--f:SetCooldown(GetTime(),3.0)
	
		--f:SetSwipeTexture(0)
		--f:SetSwipeColor(0.5,0.5,0.5,1)
		--f:SetDrawEdge(true)
		--f:SetCooldown(GetTime(),3.0)
end


function _XPRACTICE_ReusableCooldownFrames:ReturnCreateFrameDetails(framename)
	--return CreateFrame("Cooldown",framename,nil,"CooldownFrameTemplate")
	return CreateFrame("Cooldown",framename)
end