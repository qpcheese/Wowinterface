do
	
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SARKARETH2.Spell_VoidBomb=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.Spell_VoidBomb
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Void Bomb"
			self.icon="interface/icons/inv_misc_questionmark.blp"
			self.requiresfacing=false;self.projectileclass=nil;
			self.basecastduration=1.0;self.basechannelduration=nil;self.basechannelticks=nil;self.basecooldown=0.0
			self.usablewhilemoving=false
		end
		function class:CastingAnimationFunction(spellinstancepointer)				
			spellinstancepointer.castercombat.mob.animationmodule:TryOmniSpellcast()
		end		
		function class:CompleteCastingAnimationFunction(spellinstancepointer)
			spellinstancepointer.castercombat.mob.animationmodule:TryCompleteOmniSpellcast()
		end
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario
			local player=scenario.player
			local playerisrelevant=false
			
			local vbc=XPRACTICE.SARKARETH2.VoidBombController.new()
			vbc.context="bombs"..tostring(spellinstancepointer.args[1])
			vbc.scenario=scenario
			vbc:Setup(mob.environment)
		end
		

	end	


	do 
		local super=XPRACTICE.GameObject
		XPRACTICE.SARKARETH2.VoidBombController=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.VoidBombController
		
		function class:CreateAssociatedObjects()
			self:PlaceBomb(self.context,1)
			self.expirytime=self.environment.localtime+2.0
		end
		function class:OnExpiry()
			super.OnExpiry(self)
			self:PlaceBomb(self.context,2)
		end
		
		function class:PlaceBomb(context,index)
			local fullcontext=context.."-"..tostring(index)
			local scenario=self.scenario
			local player=self.scenario.player
			local playerisrelevant=false

			if(not player:IsDeadInGame())then
				if(player.rolepointer.rdps or player.rolepointer.healer)then
				--if(true)then
					playerisrelevant=true
				end
			end
			if(playerisrelevant)then
				local distsqr
				local baitx,baity
				local tolerance=100.0			
				if(fullcontext=="bombs1-1")then
					--baitx,baity=12.73,36.15
					baitx,baity=14.85,38.06
					tolerance=3.0
				elseif(fullcontext=="bombs1-2")then
					--TODO NEXT: this check might be wrong depending on how fast CPU group moves.  maybe greatly increase tolerance.
					baitx,baity=-1.84,37.13		
					tolerance=5.0
				end			
				if(baitx and baity and tolerance)then
					local distsqr=XPRACTICE.distsqr(player.position.x,player.position.y,baitx,baity)
					if(distsqr<=tolerance*tolerance)then
						playerisrelevant=false
					end	
				end
			end
			local destx,desty=0,0
			if(playerisrelevant)then				
				destx=player.position.x
				desty=player.position.y
				scenario:AttemptKillPlayer(player,true,true,"Stay as close as possible to the ranged group during Void Bombs.",5.0)
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

			
			local vb=XPRACTICE.SARKARETH2.VoidBombTelegraph.new()
			vb.context=fullcontext
			vb.wave=context
			vb.index=index
			vb.scenario=self.scenario			
			vb:Setup(self.environment,destx,desty,0.1)
			
			
			XPRACTICE.SARKARETH2.Choreography.ApplyVoidBombDodge(scenario,context,index,fullcontext,vb)
		end		
		
		
	end
	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SARKARETH2.VoidBombTelegraph=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.VoidBombTelegraph

		function class:SetCustomInfo()
			super.SetCustomInfo(self)		
			self.scale=1.0
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
			--TODO: spawn proper void bomb object
			local vb=XPRACTICE.SARKARETH2.VoidBombOrb.new()
			vb.context=self.context;vb.wave=self.wave;vb.index=self.index
			vb.scenario=self.scenario
			vb:Setup(self.environment,self.position.x,self.position.y,2.0)			
		end		
	end	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SARKARETH2.VoidBombOrb=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.VoidBombOrb

		function class:SetCustomInfo()
			super.SetCustomInfo(self)		
			self.scale=1.5
			self.pulsetimer=1.0
		end
		function class:SetActorAppearanceViaOwner(actor)		
			actor:SetModelByFileID(1372960) --7fx_priest_voidorb_state
		end
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Projectile2SpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=19.75
			self.projectiledespawncustomduration=0.25
		end	
		function class:Step(elapsed)
			super.Step(self,elapsed)
			self.alivetime=self.alivetime or 0
			self.alivetime=self.alivetime+elapsed
			self.pulsetimer=self.pulsetimer-elapsed
			if(self.pulsetimer<=0)then
				self.pulsetimer=self.pulsetimer+1.0
				local pulse=XPRACTICE.SARKARETH2.VoidBombPulse.new()
				pulse:Setup(self.environment,self.position.x,self.position.y,2.0)

				local player=self.scenario.player
				local skipplayerpulsecheck=false

				--orb collision detection for player (3 yards??)
				if((not player:IsDeadInGame()) and player.phase==1)then
					print("orbcheck...")
					--if player already has void bomb aura, they can't soak the other one
					local auras=player.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.SARKARETH2.Aura_VoidBombDebuff)	
					if(#auras==0)then
						local distsqr=XPRACTICE.distsqr(self.position.x,self.position.y,player.position.x,player.position.y)
						if(distsqr<=3*3)then
							--soak it
							self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Projectile2DespawnCustomDuration)
							local aura=player.combatmodule:ApplyAuraByClass(XPRACTICE.SARKARETH2.Aura_VoidBombDebuff)
							aura.context=self.context
							XPRACTICE.SARKARETH2.ApplyOblivion(player,self.context)
						end
						if(player.TEMP_voidbombsoak_wave~=self.wave)then
							self.scenario:AttemptKillPlayer(self.scenario.player,true,true,"You weren't assigned to soak that Void Bomb!",5.0)
							skipplayerpulsecheck=true  -- only so that death message isn't overwritten on same frame
						end
					end
				end
				
				-- TODO: orb collision detection for whichever CPU is supposed to soak
				local mob=self.scenario.voidbombsoakers[self.context]
				if(mob~=player)then
					local distsqr=XPRACTICE.distsqr(self.position.x,self.position.y,player.position.x,player.position.y)
					if(distsqr<=3*3)then
						--soak it
						self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Projectile2DespawnCustomDuration)
						local aura=mob.combatmodule:ApplyAuraByClass(XPRACTICE.SARKARETH2.Aura_VoidBombDebuff)
						aura.context=self.context
						--TODO: CPU moves to go-downstairs position
					end			
				end				
				
				
				if(not skipplayerpulsecheck)then
					--pulse player collision detection (12 yards)
					if((not player:IsDeadInGame()) and player.phase==1)then
						if(player.TEMP_voidbombsoak_wave~=self.wave)then
							local distsqr=XPRACTICE.distsqr(self.position.x,self.position.y,player.position.x,player.position.y)
							if(distsqr<=12*12)then
								self.scenario:AttemptKillPlayer(self.scenario.player,true,false,"Void Bombs have a deceptively large range. Move away from them quickly.",5.0)
							end
						else
							--TODO: apply 1 stack Oblivion
						end
					end
				end


				
					
			end
			
			
			if(self.alivetime>=20)then
				local nova=XPRACTICE.SARKARETH2.VoidBombPulse.new()
				nova:Setup(self.environment,self.position.x,self.position.y,1.0)			
				self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Projectile2DespawnCustomDuration)
				if(self.whosoaksme==self.scenario.player)then
					if(player.phase==1)then
						self.scenario:AttemptKillPlayer(self.scenario.player,true,false,"A Void Bomb exploded.  You were supposed to soak that one.",5.0)
					else
						self.scenario:AttemptKillPlayer(self.scenario.player,true,true,"A Void Bomb exploded upstairs.  You were supposed to soak that one.",5.0)
					end
				else
					--self.scenario.statuslabel:SetText("It seems a CPU messed up somewhere.  Let's pretend that didn't happen...",5.0)
				end
			end
		end
	end	

	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SARKARETH2.VoidBombPulse=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.VoidBombPulse
		function class:SetCustomInfo()
			super.SetCustomInfo(self)		
			self.scale=0.4
			--self.expirytime=self.environment.localtime+0.75
			self.expirytime=self.environment.localtime+0.45
		end
		function class:SetActorAppearanceViaOwner(actor)		
			--actor:SetModelByFileID(1372960) --7fx_priest_voidorb_state
			actor:SetModelByFileID(1000310) --priest_halo_cast_shadow
			--actor:SetModelByFileID(4754511) --10fx_aberrus_sarkareth_dread_travele ... don't use this one for void bombs
			actor:SetAnimation(0,0,5.0)
			actor:Show()
			actor:SetAlpha(1)
		end
		function class:Draw(elapsed)
			self.displayobject:SetPositionAndScale(self.position,self.scale)
		end	

		
	end
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SARKARETH2.VoidBombNova=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.VoidBombNova
		function class:SetCustomInfo()
			super.SetCustomInfo(self)		
			self.scale=2.0
			self.expirytime=0.75
		end
		function class:SetActorAppearanceViaOwner(actor)		
			actor:SetModelByFileID(3055087) --8fx_generic_void_novalow
		end
	end		
		
		

end