do
	local super=XPRACTICE.Aura
	XPRACTICE.Aura_StampedingRoar = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Aura_StampedingRoar

	function class:Setup(castercombat,targetcombat,localtime)
		--TEMP, move to sorting function
		super.Setup(self,castercombat,targetcombat,localtime)		
	end
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=8.000 * 1.24 -- Front of the Pack ilvl 226
		self.multiplier=1.6
	end
	
	function class:SetupNewauraLists(auramodule)
		super.SetupNewauraLists(self,auramodule)
		tinsert(self.auramodulelists,auramodule.speedboost)
	end
	

end

