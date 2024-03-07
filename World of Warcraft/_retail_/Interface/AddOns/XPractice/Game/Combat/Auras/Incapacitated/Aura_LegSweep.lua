do
	local super=XPRACTICE.Aura_Incapacitated
	XPRACTICE.Aura_LegSweep = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Aura_LegSweep

	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=3.000
	end
	

	function class:OnApply(localtime)
		super.OnApply(self,localtime)
		self.targetcombat.mob.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Knockdown)		
	end
	

end