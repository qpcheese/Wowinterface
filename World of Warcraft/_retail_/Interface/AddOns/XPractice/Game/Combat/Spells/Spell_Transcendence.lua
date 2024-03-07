--TODO NEXT: send extraobjects after IEXIST!
do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_Transcendence=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_Transcendence
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Transcendence"
			self.icon="interface/icons/monk_ability_transcendence.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
			--self.basecooldown=10.0
			self.basecooldown=1.0
		end
		function class:CastingAnimationFunction(spellinstancepointer)	
			spellinstancepointer.castercombat.mob.animationmodule:TryOmniSpellcast()
		end				
		function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
			local scenario=spellinstance.castercombat.mob.scenario
			local mob=spellinstance.castercombat.mob
			if(mob:IsDeadInGame())then return end
			scenario.multiplayer:FormatAndSend("MONKSET",scenario.player.position.x,scenario.player.position.y,scenario.player.position.z,scenario.player.orientation.yaw)
		end			
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)				
			local mob=spellinstancepointer.castercombat.mob
			if(mob:IsDeadInGame())then return end
			local scenario=mob.scenario	
			mob.animationmodule:ResetAnimation(XPRACTICE.AnimationList.SpellCastOmni)
			local effect=mob.extraobjects.transcendence
			if(effect)then
				effect.fadestarttime=mob.environment.localtime
				effect.expirytime=effect.environment.localtime+0.25
			end					
			
			local effect=XPRACTICE.TranscendenceEffect.new()
			effect.owner=mob
			effect:Setup(mob.environment,mob.position.x,mob.position.y,mob.position.z)
			effect.orientation_displayed.yaw=mob.orientation.yaw
			mob.extraobjects.transcendence=effect
		end
		
	
	end	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.TranscendenceEffect=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.TranscendenceEffect
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.scale=1
			self.alivetime=0
			self.stage=1
		end
		function class:SetActorAppearanceViaOwner(actor)
			if(self.owner.SetActorAppearanceViaOwner)then
				self.owner.SetActorAppearanceViaOwner(self.owner,actor)
			end
			actor:SetSpellVisualKit(114729)		--TODO LATER: not quite jade, but close enough for now
		end	
		function class:SetDefaultAnimation()
			self.animationmodule.Step=function(elapsed)return end
			self.displayobject.drawable:SetAnimation(732)
		end		
	
	end

	local prev=XPRACTICE.MULTIPLAYER.MultiplayerGhost.CreateCombatModule
	function XPRACTICE.MULTIPLAYER.MultiplayerGhost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_Transcendence.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.transcendence=spell
	end	
	
	do
		local messagecode=XPRACTICE.MULTIPLAYER.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="MONKSET"
		local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6}}
		end		
		XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYER.previousmessagecode=messagecode
	end	
	
	function XPRACTICE.MULTIPLAYER.Multiplayer.Handle_MONKSET(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
		local spell=ghost.combatmodule.spellbook.transcendence
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=ghost.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=ghost.combatmodule		
		local castendtime=ghost.environment.localtime
		spellinstance:CompleteCasting(castendtime,spellinstance)
	
		local effect=ghost.extraobjects.transcendence
		if(effect)then
			effect.position.x=args[1]
			effect.position.y=args[2]
			effect.position.z=args[3]
			effect.orientation_displayed.yaw=args[4]
		end

	end	
	

	
end


do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_TranscendenceTransfer=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_TranscendenceTransfer
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Transcendence: Transfer"
			self.icon="interface/icons/spell_shaman_spectraltransformation.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
			--self.basecooldown=45.0
			self.basecooldown=4.0
		end
		-- Returns nil if spell can be cast; otherwise returns error code.
		function class:CheckSpecialCastConditions(castercombat,targetcombat)
			--override; don't call super when overriding
			local mob=castercombat.mob
			local effect=mob.extraobjects.transcendence
			if(effect)then
				local distsqr=(mob.position.x-effect.position.x)*(mob.position.x-effect.position.x)+(mob.position.y-effect.position.y)*(mob.position.y-effect.position.y)
				if(distsqr>40*40)then
					local scenario=mob.scenario
					if(scenario)then scenario.statuslabel:SetText("\124cffff6666Out of range\124r",2.0) end
					return "Out of range"
				end
				return nil
			end
			local scenario=mob.scenario
			if(scenario)then scenario.statuslabel:SetText("\124cffff6666You can't do that yet\124r (use MONK SET first)",2.0) end
			return "You can't do that yet"
		end		
		function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
			local mob=spellinstance.castercombat.mob
			if(mob:IsDeadInGame())then return end
			local effect=mob.extraobjects.transcendence
			if(effect)then
				local scenario=spellinstance.castercombat.mob.scenario
				scenario.multiplayer:FormatAndSend("MONKTELE",effect.position.x,effect.position.y,effect.position.z,effect.orientation_displayed.yaw,mob.position.x,mob.position.y,mob.position.z,mob.orientation.yaw)
			end
		end		
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)				
			local mob=spellinstancepointer.castercombat.mob
			if(mob:IsDeadInGame())then return end
			local scenario=mob.scenario	
			
			local effect=mob.extraobjects.transcendence
			if(effect)then
				local residue=XPRACTICE.TranscendenceResidueEffect.new()
				residue:Setup(mob.environment,mob.position.x,mob.position.y,mob.position.z+2)
				mob.position.x,effect.position.x=effect.position.x,mob.position.x
				mob.position.y,effect.position.y=effect.position.y,mob.position.y
				mob.position.z,effect.position.z=effect.position.z,mob.position.z
				mob.velocity.x=0;mob.velocity.y=0;mob.velocity.z=0
				local temp=effect.orientation_displayed.yaw
				effect.orientation_displayed.yaw=mob.orientation.yaw
				mob:FreezeOrientation(temp)
				if(mob==scenario.player)then
					mob.environment.cameramanager.camera.orientation.yaw=mob.orientation.yaw
				end
				mob.animationmodule:ResetAnimation(XPRACTICE.AnimationList.SpellCastOmni)
				
				local residue=XPRACTICE.TranscendenceResidueEffect.new()
				residue:Setup(mob.environment,mob.position.x,mob.position.y,mob.position.z+2)
			end						
		end
		
		
	end	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.TranscendenceResidueEffect=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.TranscendenceResidueEffect
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.expirytime=self.environment.localtime+1.0
			self.scale=1
		end
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(614014) --monk_transcendenceteleport_impact_base
		end	
	
	end	
	
	local prev=XPRACTICE.MULTIPLAYER.MultiplayerGhost.CreateCombatModule
	function XPRACTICE.MULTIPLAYER.MultiplayerGhost:CreateCombatModule()
		prev(self)
		local spell=XPRACTICE.Spell_TranscendenceTransfer.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.transcendencetransfer=spell
	end		

	
	function XPRACTICE.MULTIPLAYER.Multiplayer.Handle_MONKTELE(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
		local spell=ghost.combatmodule.spellbook.transcendencetransfer
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=ghost.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=ghost.combatmodule		
		local castendtime=ghost.environment.localtime
		spellinstance:CompleteCasting(castendtime,spellinstance)
		
		-- this is a bit redundant but safeguards against desynced teleports
		ghost.position.x=args[1]
		ghost.position.y=args[2]
		ghost.position.z=args[3]
		ghost:FreezeOrientation(args[4])	

		local effect=ghost.extraobjects.transcendence
		if(effect)then
			effect.x=args[5]
			effect.y=args[6]
			effect.z=args[7]
			effect.orientation_displayed.yaw=args[8]
		end
		
		-- ghost.destx=ghost.position.x
		-- ghost.desty=ghost.position.y
		ghost.destx=nil;ghost.desty=nil;ghost.ai.targetposition=nil
		ghost.remainingreactiontime=0
	end	
	
	do
		local messagecode=XPRACTICE.MULTIPLAYER.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="MONKTELE"
		local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6}}
		end		
		XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYER.previousmessagecode=messagecode
	end

end