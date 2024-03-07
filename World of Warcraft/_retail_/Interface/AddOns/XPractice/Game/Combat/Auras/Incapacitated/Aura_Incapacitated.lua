do
	local super=XPRACTICE.Aura
	XPRACTICE.Aura_Incapacitated = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Aura_Incapacitated

	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=4.000
	end
	
	function class:SetupNewauraLists(auramodule)
		super.SetupNewauraLists(self,auramodule)
		tinsert(self.auramodulelists,auramodule.incapacitated)
	end
	
	function class:OnApply(localtime)
		super.OnApply(self,localtime)
		self.targetcombat.mob.velocity.x=0
		self.targetcombat.mob.velocity.y=0
	end
	

end