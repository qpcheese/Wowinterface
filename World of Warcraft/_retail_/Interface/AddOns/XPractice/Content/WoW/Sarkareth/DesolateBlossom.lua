do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SARKARETH2.Spell_DesolateBlossom=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.Spell_DesolateBlossom
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Desolate Blossom"
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
				if(player.rolepointer.mdps)then
				--if(true)then
					playerisrelevant=true
				end
			end
			if(playerisrelevant)then			
				local baitx,baity
				local tolerance=3
				if(spellinstancepointer.args[1]==1)then
					baitx,baity=XPRACTICE.SARKARETH2.Schedule.ReplayCoordsToWorldCoords(nil,-2465.61,2043.45)
				else
					print("XPRACTICE warning: unknown context for Desolate Blossom ("..tostring(spellinstancepointer.args[1])..")")
				end
				
				if(baitx and baity and tolerance)then
					local distsqr=XPRACTICE.distsqr(player.position.x,player.position.y,21.64,33.95)
					if(distsqr<=5*5)then
						playerisrelevant=false
					end	
				end
			end
			local destx,desty
			if(playerisrelevant)then				
				scenario:AttemptKillPlayer(player,true,true,"You were too far away from the Desolate Blossom bait group.",10.0)
			end
			local targets={}
			for i=1,#scenario.allpcs do
				local pc=scenario.allpcs[i]
				if(pc.rolepointer.mdps)then
					tinsert(targets,pc)
				end
			end
			if(#targets<2)then tinsert(targets,scenario.cpus[1]);tinsert(targets,scenario.cpus[2]) end
			local mob1,mob2=XPRACTICE.FindTwoMostDistantMobs(targets)
			self.destx1=mob1.position.x
			self.desty1=mob1.position.y
			self.destx2=mob2.position.x
			self.desty2=mob2.position.y
			--print("Desolate Blossom:",self.destx1,self.desty1,self.destx2,self.desty2)
			
			local telegraph=XPRACTICE.SARKARETH2.DesolateBlossomTelegraph.new()
			telegraph.scenario=scenario
			telegraph:Setup(mob.environment,self.destx1,self.desty1,0.1)
			local telegraph=XPRACTICE.SARKARETH2.DesolateBlossomTelegraph.new()
			telegraph.scenario=scenario
			telegraph:Setup(mob.environment,self.destx2,self.desty2,0.1)
		end
		function class:CastingAnimationFunction(spellinstancepointer)				
			spellinstancepointer.castercombat.mob.animationmodule:TryOmniSpellcast()
		end		
		function class:CompleteCastingAnimationFunction(spellinstancepointer)
			spellinstancepointer.castercombat.mob.animationmodule:TryCompleteOmniSpellcast()
		end
		
	end	




	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SARKARETH2.DesolateBlossomTelegraph=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.DesolateBlossomTelegraph

		function class:SetCustomInfo()
			super.SetCustomInfo(self)		
			self.scale=1.5*1.75
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
		function class:OnProjectileDespawning()
			self.scenario.blossommanager:AddCircle(self.position.x,self.position.y)
		end

		
	end


end