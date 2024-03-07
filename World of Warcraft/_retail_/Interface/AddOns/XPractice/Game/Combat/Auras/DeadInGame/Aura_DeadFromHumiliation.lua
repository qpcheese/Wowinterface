do
	local super=XPRACTICE.Aura
	XPRACTICE.Aura_DeadFromHumiliation = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Aura_DeadFromHumiliation

	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=nil
		self.animation=XPRACTICE.AnimationList.EmoteCryOverride
		self.removeondeadingame=false
	end
	
	function class:SetupNewauraLists(auramodule)
		super.SetupNewauraLists(self,auramodule)
		tinsert(self.auramodulelists,auramodule.deadingame)
		tinsert(self.auramodulelists,auramodule.animation)
		tinsert(self.auramodulelists,auramodule.incapacitated)		
	end
	
	function class:OnApply(localtime)
		super.OnApply(self,localtime)
		self.targetcombat.mob.velocity.x=0
		self.targetcombat.mob.velocity.y=0
		self.targetcombat.mob.displayobject.drawable:SetSheathed(true)
	end
	
	function class:GetAnimation()
		return self.animation
	end
	
	
	

end