do
	local super=XPRACTICE.WoWObject
	XPRACTICE.ABERRUSRAIDMAPS.HintArrow=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ABERRUSRAIDMAPS.HintArrow
	
	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		self.changecount=0
		self.prevx=nil
		self.prevy=nil
	end
	

	
	function class:SetActorAppearanceViaOwner(actor)
		actor:SetModelByFileID(3671908) --8fx_rl_personalresponsibility_arrow_gold
		self.scale=1.5
	end
	
	function class:SetDefaultAnimation()
		self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
		self.projectilespawncustomduration=0.25
		self.projectileloopcustomduration=7.0
		self.projectiledespawncustomduration=0.25	
	end

		
	
end



do
	local super=XPRACTICE.ABERRUSRAIDMAPS.HintArrow
	XPRACTICE.ABERRUSRAIDMAPS.BossHintArrow=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ABERRUSRAIDMAPS.BossHintArrow
	
	-- function class:Step(elapsed)
		-- local scenario=self.scenario
		-- if(scenario.player)then
			
			-- --if(false)then				
				-- self.alpha=1
				-- self.position.x=scenario.player.destx
				-- self.position.y=scenario.player.desty		
				-- self.position.z=1				
				-- self.scale=2
				-- --print("!!!",scenario.player.destx,scenario.player.desty,self.scale)
				-- if(self.position.x~=self.prevx or self.position.y~=self.prevy)then
					-- self.changecount=self.changecount+1
					-- --print("ARROW",self.changecount,self.position.x,self.position.y)
				-- end
			-- else
				-- self.alpha=0
			-- end
		-- end
		-- self.prevx=self.position.x
		-- self.prevy=self.position.y	
	-- end
		
	
	function class:SetActorAppearanceViaOwner(actor)
		actor:SetModelByFileID(3635055) --8fx_rl_personalresponsibility_arrow_red
		self.scale=3.75
	end
	
	function class:SetDefaultAnimation()
		self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
		self.projectilespawncustomduration=0.25
		self.projectileloopcustomduration=7.0
		self.projectiledespawncustomduration=0.25	
	end

		
	
end