do
	local super=XPRACTICE.Aura
	XPRACTICE.Aura_ScenarioComplete_Cheer = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Aura_ScenarioComplete_Cheer

	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=4.000
	end
	
	function class:SetupNewauraLists(auramodule)
		super.SetupNewauraLists(self,auramodule)
		tinsert(self.auramodulelists,auramodule.unskippablecutscene)
	end
	

end