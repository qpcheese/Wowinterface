do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.LEGACY.Spell_Sprint=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.LEGACY.Spell_Sprint
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Sprint"
			self.icon="interface/icons/ability_rogue_sprint.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario		
			scenario.multiplayer:FormatAndSendCustom("SPRINT")
		end
	end	
	

	do	
		local super=XPRACTICE.WoWObject
		XPRACTICE.LEGACY.SprintVisualEffect=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.LEGACY.SprintVisualEffect
		
		function class:SetActorAppearanceViaOwner(actor)
			--actor:SetModelByFileID(166951)	--sprint_cast_base		-- projected, apparently!
			actor:SetModelByFileID(652936)	--pb_speedbuff_impact		-- no anims
			self.expirytime=self.environment.localtime+1.5
		end
				
		function class:Step(elapsed)
			super.Step(self,elapsed)
			self.position.x=self.player.position.x
			self.position.y=self.player.position.y
			self.position.z=self.player.position.z+2
			self.scale=1
		end
	end		
	

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.LEGACY.Spell_Roar=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.LEGACY.Spell_Roar
		
		-- Balance Affinity = 20 yard range
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Stampeding Roar"
			self.icon="interface/icons/spell_druid_stampedingroar_cat.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario		
			local player=scenario.player
			scenario.multiplayer:FormatAndSendCustom("ROAR",player.position.x,player.position.y)
			scenario.multiplayer:FormatAndSendCustom("GOT_ROAR")
		end
	end	
	
	
	do	
		local super=XPRACTICE.WoWObject
		XPRACTICE.LEGACY.RoarVisualEffect=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.LEGACY.RoarVisualEffect
		
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(407341)	--druid_stampeding_roar_01		-- no anims
			self.expirytime=self.environment.localtime+2.0
		end
				
		function class:Step(elapsed)
			super.Step(self,elapsed)
			self.position.x=self.player.position.x
			self.position.y=self.player.position.y
			self.position.z=self.player.position.z+2
			self.scale=1
		end
	end		
	
	
end