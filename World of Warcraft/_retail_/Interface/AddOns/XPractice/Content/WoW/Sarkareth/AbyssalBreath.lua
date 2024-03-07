do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SARKARETH2.Spell_AbyssalBreath=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.Spell_AbyssalBreath
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Abyssal Breath"
			self.icon="interface/icons/inv_misc_questionmark.blp"
			self.requiresfacing=false;self.projectileclass=nil;
			self.basecastduration=2.5;self.basechannelduration=nil;
			self.basechannelticks=10.0
			self.basecooldown=0.0
			self.usablewhilemoving=true			
		end
		function class:StartCastingEffect(spellinstancepointer)
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario
			local player=scenario.player
			local playerisrelevant=false
			
			if(not player:IsDeadInGame())then
				if(player.rolepointer.rdps or player.rolepointer.healer)then
				--if(true)then
					playerisrelevant=true
				end
			end
			if(playerisrelevant)then			
				local baitx,baity
				local tolerance=3
				if(spellinstancepointer.args[1]==1)then
					baitx=21.64
					baity=33.95
				else
					print("XPRACTICE warning: unknown context for Abyssal Breath ("..tostring(spellinstancepointer.args[1])..")")
				end
				
				if(baitx and baity and tolerance)then
					local distsqr=XPRACTICE.distsqr(player.position.x,player.position.y,baitx,baity)
					if(distsqr<=tolerance*tolerance)then
						playerisrelevant=false
					end	
				end
			end
			local destx,desty
			if(playerisrelevant)then				
				destx=player.position.x
				desty=player.position.y
				scenario:AttemptKillPlayer(player,true,true,"You were too far away from the Abyssal Breath bait group.",10.0)
			else
				local targets={}
				for i=1,#scenario.allpcs do
					local pc=scenario.allpcs[i]
					if(pc.rolepointer.rdps or pc.rolepointer.healer)then
						if(pc.phase==1)then
							tinsert(targets,pc)
						end
					end
				end
				if(#targets==0)then tinsert(targets,player) end
				local i=math.floor(math.random()*#targets)+1
				destx=targets[i].position.x
				desty=targets[i].position.y
			end
			self.destx=destx
			self.desty=desty
			local telegraph=XPRACTICE.SARKARETH2.AbyssalBreathTelegraph.new()
			telegraph:Setup(mob.environment,destx,desty,0.1)
			--TODO LATER: does boss face toward destination here?
		end
		function class:CastingAnimationFunction(spellinstancepointer)				
			spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.SARKARETH2.AnimationList.AbyssalBreath1)
		end		
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)
			local mob=spellinstancepointer.castercombat.mob
			local aura=XPRACTICE.Aura_FlyToPosition.QuickFlyToPosition(mob,self.destx,self.desty,28,XPRACTICE.SARKARETH2.Aura_AbyssalBreath)	--!!!

			local scenario=mob.scenario
			local context=spellinstancepointer.args[1]
			XPRACTICE.SARKARETH2.SpawnAdds(scenario,context)	
		end
		function class:CompleteCastingAnimationFunction(spellinstancepointer)
			spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.SARKARETH2.AnimationList.AbyssalBreath3)
		end
		
	end	




	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SARKARETH2.AbyssalBreathTelegraph=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.AbyssalBreathTelegraph

		function class:SetCustomInfo()
			super.SetCustomInfo(self)		
			self.scale=1.5
		end
		function class:SetActorAppearanceViaOwner(actor)		
			actor:SetModelByFileID(1034211) --target_shadow_state_centeronly
		end
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=2.75
			self.projectiledespawncustomduration=0.25
		end	

		
	end


end