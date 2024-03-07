do
	--TODO: maybe rename to SpecialMovementTechnique
	local super=XPRACTICE.Aura_ForcedMovement	
	XPRACTICE.Aura_Roll= XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Aura_Roll
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.animation=XPRACTICE.AnimationList.ROLL_LOOP
		
		--self.baseduration=0.500		
		self.baseduration=0.750
		self.forcedmovementspeed=26.367
		--TODO: as long as player is grounded, roll distance should be independent of framerate
		--self.totaldistance=25
		
		--print("Roll_custominfo")
	end
	
	-- function class:SetupNewauraLists(auramodule)
		-- super.SetupNewauraLists(self,auramodule)
		-- tinsert(self.auramodulelists,auramodule.animation)
	-- end	
	
	function class:OnRemove()
		super.OnRemove(self)
		--print("Roll_remove")
		self.targetcombat.mob.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ROLL_END)
	end
end