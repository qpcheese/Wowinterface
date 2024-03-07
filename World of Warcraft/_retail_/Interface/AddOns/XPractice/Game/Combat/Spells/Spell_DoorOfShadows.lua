do
	----XPRACTICE.AnimationTemplate.QuickSetup(animationlist,			name,				index,	subindex,	priority,	duration,	nextanimation)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"LocSpellPrecastBoth",	920,		0,		"Active",	1.5,		nil)
	
	

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_DoorOfShadows=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_DoorOfShadows
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Door of Shadows (Cursor)"
			self.icon="interface/icons/ability_venthyr_doorofshadows.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
			self.basecooldown=0
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)			
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			local picker=XPRACTICE.MousePicker.new()
			picker:Setup(mob.environment,0,0,0)
			picker.callback=function(s)
				local spell=mob.combatmodule.spellbook.doorofshadows
				local queuepointer=spell:NewQueue()
				queuepointer.castercombat=mob.combatmodule
				local spellinstance=spell:NewCast(queuepointer)
				spellinstance.targetcombat=mob.combatmodule		
				spellinstance.destination={x=picker.position.x,y=picker.position.y}
				local castendtime=mob.environment.localtime		
				spellinstance.spellbookspell:StartCasting(castendtime,spellinstance)				
				queuepointer.castercombat.castedspell=spellinstance					
				queuepointer.castercombat.queuedspell=nil								
				local distx=spellinstance.destination.x-mob.position.x
				local disty=spellinstance.destination.y-mob.position.y
				local dist=math.sqrt(distx*distx+disty*disty)
				if(dist>35)then
					scenario.statuslabel:SetText("Warning: you are moving "..string.format("%0.1f",dist).." yards away (maximum 35 in real game).",2.0)
				end
			end
		end
	end
	
	do
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_DoorOfShadowsTeleport=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_DoorOfShadowsTeleport
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Door of Shadows"
			self.icon="interface/icons/ability_venthyr_doorofshadows.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=1.5;self.basechannelduration=nil;self.basechannelticks=nil
			self.basecooldown=0.5
		end
		
		function class:CastingAnimationFunction(spellinstancepointer)	
			spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.AnimationList.LocSpellPrecastBoth)
			--spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ROLL_LOOP)
		end
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)			
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			mob.animationmodule:ResetAnimation(XPRACTICE.AnimationList.SpellCastOmni)
			mob.position.x=spellinstancepointer.destination.x
			mob.position.y=spellinstancepointer.destination.y
			mob.velocity.x=0
			mob.velocity.y=0
			mob.velocity.z=0
		end		
		
		function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
			local scenario=spellinstance.castercombat.mob.scenario
			local mob=spellinstance.castercombat.mob
			if(mob:IsDeadInGame())then return end
			scenario.multiplayer:FormatAndSend("DOOROFSHADOWS_FINISHCAST",spellinstance.destination.x,spellinstance.destination.y)
		end					
	
	end	
	
	-- do
		-- local super=XPRACTICE.WoWObject
		-- XPRACTICE.BlinkEffect=XPRACTICE.inheritsFrom(super)
		-- local class=XPRACTICE.BlinkEffect
		-- function class:SetCustomInfo()
			-- super.SetCustomInfo(self)
			-- self.expirytime=self.environment.localtime+1.0
			-- self.scale=1
		-- end
		-- function class:SetActorAppearanceViaOwner(actor)
			-- actor:SetModelByFileID(165715) --blink_impact_chest
			-- --actor:SetModelByFileID(1372779) --cfx_mage_shimmer_base
		-- end	
	
	-- end

	local prev=XPRACTICE.MULTIPLAYER.MultiplayerGhost.CreateCombatModule
	function XPRACTICE.MULTIPLAYER.MultiplayerGhost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_DoorOfShadowsTeleport.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.doorofshadows=spell
	end	
	
	local prev=XPRACTICE.PlayerCharacter.CreateCombatModule
	function XPRACTICE.PlayerCharacter:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_DoorOfShadowsTeleport.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.doorofshadows=spell
	end		
	
	function XPRACTICE.MULTIPLAYER.Multiplayer.Handle_DOOROFSHADOWS_FINISHCAST(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
		local spell=ghost.combatmodule.spellbook.doorofshadows
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=ghost.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=ghost.combatmodule	
		spellinstance.destination={x=args[1],y=args[2]}
		local castendtime=ghost.environment.localtime
		spellinstance:CompleteCasting(castendtime,spellinstance)
		
		ghost.destx=ghost.position.x+ghost.velocity.x
		ghost.desty=ghost.position.y+ghost.velocity.y
		ghost.remainingreactiontime=0
	end	
	
	do
		local messagecode=XPRACTICE.MULTIPLAYER.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="DOOROFSHADOWS_FINISHCAST"
		local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}}

		end		
		XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYER.previousmessagecode=messagecode
	end
	
end