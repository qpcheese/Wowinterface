do
	--TODO: maybe rename to SpecialMovementTechnique
	local super=XPRACTICE.Aura
	XPRACTICE.Aura_Animation = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Aura_Animation

	function class:Setup(castercombat,targetcombat,localtime)
		--TEMP, move to sorting function
		super.Setup(self,castercombat,targetcombat,localtime)
	end
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.animation=XPRACTICE.AnimationList.Stun
	end
	
	function class:SetupNewauraLists(auramodule)
		super.SetupNewauraLists(self,auramodule)
		tinsert(self.auramodulelists,auramodule.animation)
	end
	
	function class:GetAnimation()
		return self.animation
	end
	

end