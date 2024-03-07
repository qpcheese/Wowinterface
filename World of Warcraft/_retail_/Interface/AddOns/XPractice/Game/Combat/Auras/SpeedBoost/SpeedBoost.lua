do
	local super=XPRACTICE.Aura
	XPRACTICE.Aura_SpeedBoost = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Aura_SpeedBoost

	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=5.000	
		self.multiplier=1.3
	end
	


end