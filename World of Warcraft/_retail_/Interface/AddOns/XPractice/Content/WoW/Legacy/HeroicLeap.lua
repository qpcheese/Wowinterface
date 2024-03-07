do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_HeroicLeap=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_HeroicLeap
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Heroic Leap (Cursor)"
			self.icon="interface/icons/ability_heroicleap.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
			self.basecooldown=0.0	--TODO LATER: 45.0, but link to heroicleapexecute
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)			
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			local picker=XPRACTICE.MousePicker.new()
			picker:Setup(mob.environment,0,0,0)
			picker.callback=function(s)
				local spell=mob.combatmodule.spellbook.heroicleapexecute
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
				-- if(dist>25)then
					-- scenario.statuslabel:SetText("Warning: you are moving "..string.format("%0.1f",dist).." yards away (maximum 25 in real game).",2.0)
				-- end
			end
		end
	end
	
	do
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_HeroicLeapExecute=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_HeroicLeapExecute
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Heroic Leap"
			self.icon="interface/icons/ability_heroicleap.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
			self.basecooldown=0.5	--TODO LATER: 45.0
		end
		
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)			
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			--mob.animationmodule:ResetAnimation(XPRACTICE.AnimationList.SpellCastOmni)
			--mob.position.x=spellinstancepointer.destination.x
			--mob.position.y=spellinstancepointer.destination.y		
			local x=spellinstancepointer.destination.x
			local y=spellinstancepointer.destination.y
			local yaw=math.atan2(y-mob.position.y,x-mob.position.x)
			local aura=mob.combatmodule:ApplyAuraByClass(XPRACTICE.LEGACY.Aura_DeathGrip_GhostCheat)
			aura.destination={x=x,y=y,z=0}
			local xdist=x-mob.position.x
			local ydist=y-mob.position.y
			local dist=math.sqrt(xdist*xdist+ydist*ydist)
			--aura.expirytime=mob.environment.localtime+math.sqrt(dist*0.02)			
			aura.expirytime=mob.environment.localtime+math.sqrt(dist*0.02)*0.5			
			mob:FreezeOrientation(yaw)
			
			---- TODO LATER: leap animation
		end		
		
		function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
			local scenario=spellinstance.castercombat.mob.scenario
			local mob=spellinstance.castercombat.mob
			if(mob:IsDeadInGame())then return end
			scenario.multiplayer:FormatAndSend("HEROICLEAP_FINISHCAST",spellinstance.destination.x,spellinstance.destination.y)
		end					
	
	end		
	
	local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_HeroicLeap.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.heroicleapcursor=spell		
		local spell=XPRACTICE.Spell_HeroicLeapExecute.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.heroicleapexecute=spell
	end	
	
	local prev=XPRACTICE.PlayerCharacter.CreateCombatModule
	function XPRACTICE.PlayerCharacter:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_HeroicLeap.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.heroicleapcursor=spell				
		local spell=XPRACTICE.Spell_HeroicLeapExecute.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.heroicleapexecute=spell
	end			
	
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_HEROICLEAP_FINISHCAST(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
		---- TODO LATER: leap animation
		
		local mob=ghost
		local x=args[1]
		local y=args[2]
		local yaw=math.atan2(y-mob.position.y,x-mob.position.x)
		local aura=mob.combatmodule:ApplyAuraByClass(XPRACTICE.LEGACY.Aura_DeathGrip_GhostCheat)
		aura.destination={x=x,y=y,z=0}
		local xdist=x-mob.position.x
		local ydist=y-mob.position.y
		local dist=math.sqrt(xdist*xdist+ydist*ydist)
		--aura.expirytime=mob.environment.localtime+math.sqrt(dist*0.02)			
		aura.expirytime=mob.environment.localtime+math.sqrt(dist*0.02)*0.5
		mob:FreezeOrientation(yaw)
	end	
	
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="HEROICLEAP_FINISHCAST"
		local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4}}

		end		
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
	end	
end