do
	local super=XPRACTICE.Aura
	XPRACTICE.Aura_LossOfControlAlert = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Aura_LossOfControlAlert

	function class:SetupNewauraLists(auramodule)
		super.SetupNewauraLists(self,auramodule)
		tinsert(self.auramodulelists,auramodule.lossofcontrolalert)
	end
	
	function class:GetLOCAIcon()
		return "interface/icons/spell_frost_stun.blp"
	end
	function class:GetLOCAText()
		return "Stunned"
	end	
end
