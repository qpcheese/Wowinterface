do
	local super=XPRACTICE.Aura
	XPRACTICE.Aura_UnskippableCutscene = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Aura_UnskippableCutscene

	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=4.000
	end
	
	function class:SetupNewauraLists(auramodule)
		super.SetupNewauraLists(self,auramodule)
		tinsert(self.auramodulelists,auramodule.unskippablecutscene)
	end
	

end