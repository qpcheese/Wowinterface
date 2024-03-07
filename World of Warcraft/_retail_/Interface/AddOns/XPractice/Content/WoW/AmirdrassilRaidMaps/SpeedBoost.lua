--TODO:
-- shaman_unleashedwind_missile_nosmoke.m2   ?
-- shaman_soothing_wind_nova.m2 ?
-- 7fx_arena_aura_white.m2 ?  (no anims)
-- cfx_shaman_windfury_state.m2 ? (0, 158)
-- wind rush totem displayid 377  (127,0,1)



do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.AMIRDRASSILRAIDMAPS.Spell_Sprint=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.AMIRDRASSILRAIDMAPS.Spell_Sprint
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Sprint"
			self.icon="interface/icons/ability_rogue_sprint.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario		
			scenario.multiplayer:FormatAndSendCustom("SPRINT")
		end
	end	
	

	do	
		local super=XPRACTICE.WoWObject
		XPRACTICE.AMIRDRASSILRAIDMAPS.SprintVisualEffect=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.AMIRDRASSILRAIDMAPS.SprintVisualEffect
		
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
		XPRACTICE.AMIRDRASSILRAIDMAPS.Spell_Roar=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.AMIRDRASSILRAIDMAPS.Spell_Roar
		
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
		XPRACTICE.AMIRDRASSILRAIDMAPS.RoarVisualEffect=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.AMIRDRASSILRAIDMAPS.RoarVisualEffect
		
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