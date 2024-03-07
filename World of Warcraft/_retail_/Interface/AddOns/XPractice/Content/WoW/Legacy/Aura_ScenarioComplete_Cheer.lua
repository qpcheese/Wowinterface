do
	local super=XPRACTICE.Aura
	XPRACTICE.LEGACY.Aura_ScenarioComplete_Cheer = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.LEGACY.Aura_ScenarioComplete_Cheer

	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		--self.animation=XPRACTICE.AnimationList.EmoteCheerOverride
		self.baseduration=4.000		
		self.tickdelay=1.0
		self.basetickrate=1.0
		
		self.tickcount=0
	end
	
	function class:SetupNewauraLists(auramodule)
		super.SetupNewauraLists(self,auramodule)
		--tinsert(self.auramodulelists,auramodule.animation)
		tinsert(self.auramodulelists,auramodule.incapacitated)
	end
	
	-- function class:GetAnimation()
		-- return self.animation
	-- end
	
	function class:OnTick(ticktime,percentage)
		self.tickcount=self.tickcount+1
		if(self.tickcount==1)then
			self.targetcombat.mob.animationmodule:PlayAnimation(XPRACTICE.AnimationList.EmoteCheerOverride)
			self.targetcombat.mob.displayobject.drawable:SetSheathed(true)
		end
	end

end