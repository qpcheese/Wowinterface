do

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SMOLDERON.Spell_Role_Tank=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SMOLDERON.Spell_Role_Tank		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Tank)"
			self.icon="interface/icons/ability_warrior_defensivestance.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			scenario.multiplayer:FormatAndSendCustom("ROLE",string.char(1))
		end
	end	

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SMOLDERON.Spell_Role_Melee=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SMOLDERON.Spell_Role_Melee
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Tank)"
			self.icon="interface/icons/inv_sword_27.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			scenario.multiplayer:FormatAndSendCustom("ROLE",string.char(2))
		end
	end	
	
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SMOLDERON.Spell_Role_Ranged=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SMOLDERON.Spell_Role_Ranged
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Tank)"
			self.icon="interface/icons/inv_weapon_bow_05.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			scenario.multiplayer:FormatAndSendCustom("ROLE",string.char(3))
		end
	end		

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SMOLDERON.Spell_Reroll=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SMOLDERON.Spell_Reroll
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Randomize)"
			self.icon="interface/icons/inv_misc_dice_02.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				self.scenario.statuslabel:SetText("That function requires raid lead/assist.",3.0)
				return
			end						
			XPRACTICE.SMOLDERON.AutoEffects.Randomize(scenario)			
		end
	end	
	
	local function ClearEffects(scenario)
		for k,v in pairs(scenario.multiplayer.allplayers) do
			local radius=1
			local args={string.char(radius+48),v.position.x,v.position.y}
			scenario.multiplayer:FormatAndSend("CUSTOMEFFECT_ERASE",unpack(args))	
			scenario.customeffectcontroller:SetEraseEffect(v.paddedguid,args[1],args[2],args[3],args[4],args[5],args[6])
		end
	end
	
	local function SetEffects(scenario,tank,group)
		local presets=XPRACTICE_SAVEDATA["SMOLDERON"]["CustomEffectPresets4"]
		if(tank)then
			local attach=tank
			local code=presets[1]
			local args={string.sub(code,1,1),string.sub(code,2,2),string.sub(code,3,3),string.sub(code,4,4),attach.paddedguid}				
			scenario.multiplayer:FormatAndSend("CUSTOMEFFECT_ATTACH",unpack(args))			
			scenario.customeffectcontroller:SetAttachEffect(scenario.player.paddedguid,args[1],args[2],args[3],args[4],args[5])
		end
		for i=1,#group do
			local attach=group[i]
			local code=presets[3]
			local args={string.sub(code,1,1),string.sub(code,2,2),string.sub(code,3,3),string.sub(code,4,4),attach.paddedguid}				
			scenario.multiplayer:FormatAndSend("CUSTOMEFFECT_ATTACH",unpack(args))
			scenario.customeffectcontroller:SetAttachEffect(scenario.player.paddedguid,args[1],args[2],args[3],args[4],args[5])			
		end
	end
	
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SMOLDERON.Spell_Group1Effects=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SMOLDERON.Spell_Group1Effects
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Group 1)"
			self.icon="interface/icons/ability_mage_moltenarmor.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				self.scenario.statuslabel:SetText("That function requires raid lead/assist.",3.0)
				return
			end						
			if(not scenario.groups_have_been_set)then
				scenario.statuslabel:SetText("Groups have not been randomized!  Click the RNG button first.",5.0)
				return
			end
			local presets=XPRACTICE_SAVEDATA["SMOLDERON"]["CustomEffectPresets4"]
			if(not presets or not presets[1] or not presets[3])then
				scenario.statuslabel:SetText("Effect presets are missing! Make sure at least 3 presets are defined in the Effects tab.",5.0)
				return
			end
			ClearEffects(scenario)
			SetEffects(scenario,scenario.group1tank,scenario.group1)
		end
	end	
	
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SMOLDERON.Spell_Group2Effects=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SMOLDERON.Spell_Group2Effects
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Group 2)"
			self.icon="interface/icons/ability_warlock_inferno.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario				
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				self.scenario.statuslabel:SetText("That function requires raid lead/assist.",3.0)
				return
			end			
			if(not scenario.groups_have_been_set)then
				scenario.statuslabel:SetText("Groups have not been randomized!  Click the RNG button first.",5.0)
				return
			end
			local presets=XPRACTICE_SAVEDATA["SMOLDERON"]["CustomEffectPresets4"]
			if(not presets or not presets[1] or not presets[3])then
				scenario.statuslabel:SetText("Effect presets are missing! Make sure at least 3 presets are defined in the Effects tab.",5.0)
				return
			end
			ClearEffects(scenario)
			SetEffects(scenario,scenario.group2tank,scenario.group2)
		end
	end	
		
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SMOLDERON.Spell_ClearEffects=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SMOLDERON.Spell_ClearEffects
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Clear)"
			self.icon="interface/icons/inv_misc_bomb_01.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				self.scenario.statuslabel:SetText("That function requires raid lead/assist.",3.0)
				return
			end						
			ClearEffects(scenario)
		end
	end	
		


	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SMOLDERON.Spell_ForceSingleplayer=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SMOLDERON.Spell_ForceSingleplayer
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Force Single-Player)"
			self.icon="interface/icons/spell_hunter_lonewolf.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			if(scenario.multiplayer.forcesingleplayer==true)then
				scenario.statuslabel:SetText("It looks like you're already in single-player mode!\nTo revert to multiplayer, hit Esc and restart the scenario.",10.0)
				return
			end
			scenario.multiplayer:SendGoodbye()
			scenario.multiplayer.forcesingleplayer=true
			scenario.statuslabel:SetText("You are now in single-player mode and can operate the boss control buttons.\nTo revert to multiplayer, hit Esc and restart the scenario.",10.0)
		end
	end	
		

		
	

end