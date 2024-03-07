do
	do	
		local super=XPRACTICE.Aura_FlyToPosition
		XPRACTICE.SARKARETH2.Aura_AbyssalBreath=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.Aura_AbyssalBreath
		
		function class:QuickCircle()
			local mob=self.targetcombat.mob
			local scenario=mob.scenario
			scenario.breathmanager:AddCircle(mob.position.x,mob.position.y)
		end
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.basetickrate=0.125
			self.diewhenscenarioends=true
		end
		
		function class:SetupNewauraLists(auramodule)
			super.SetupNewauraLists(self,auramodule)
			tinsert(self.auramodulelists,auramodule.animation)			
		end
		
		function class:OnTick(ticktime,percentage)
			super.OnTick(self,ticktime,percentage)
			-- check remaining time and display warnings/overheads if we haven't already
			self:QuickCircle()
		end			
		
		function class:GetAnimation()
			-- note that breath animation isn't intended to loop, so aura duration should be 2s or less
			return XPRACTICE.SARKARETH2.AnimationList.AbyssalBreath3
		end
		
		function class:OnRemove()
			super.OnRemove(self)
			self.targetcombat.mob.animationmodule:PlayAnimation(XPRACTICE.SARKARETH2.AnimationList.AbyssalBreath4)
			self:QuickCircle()
		end
		
	end

end