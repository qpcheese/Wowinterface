do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_Blink=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_Blink
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Blink"
			self.icon="interface/icons/spell_arcane_blink.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
			self.basecooldown=0.5
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)				
			local mob=spellinstancepointer.castercombat.mob
			if(mob:IsDeadInGame())then return end
			local scenario=mob.scenario	
			mob.animationmodule:ResetAnimation(XPRACTICE.AnimationList.SpellCastOmni)
			local effect=XPRACTICE.BlinkEffect.new()
			effect:Setup(mob.environment,mob.position.x,mob.position.y,1)
			local x,y
			local yaw=nil			
			x,y=mob.velocity.x,mob.velocity.y
			if(x==0 and y==0)then
				x,y=mob.attemptedmovementunitvector.x,mob.attemptedmovementunitvector.y
			end
			if(x==0 and y==0)then
				yaw=spellinstancepointer.castercombat.mob.orientation.yaw
			else
				--TODO LATER: maybe have a debug feature that yells at us if we try to math.atan instead of math.atan2?
				yaw=math.atan2(y,x)
			end			
			local distance=20
			
			local effect=XPRACTICE.BlinkEffect.new()
			effect:Setup(mob.environment,mob.position.x+distance*1.0*math.cos(yaw),mob.position.y+distance*1.0*math.sin(yaw),1)
			
			mob.position.x=mob.position.x+distance*math.cos(yaw)
			mob.position.y=mob.position.y+distance*math.sin(yaw)			
			mob.position.z=0;mob.velocity.z=0
						
		end
		
		function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
			local scenario=spellinstance.castercombat.mob.scenario
			local mob=spellinstance.castercombat.mob
			if(mob:IsDeadInGame())then return end
			scenario.multiplayer:FormatAndSend("BLINK",scenario.player.attemptedmovementunitvector.x,scenario.player.attemptedmovementunitvector.y,scenario.player.orientation.yaw,scenario.player.position.x,scenario.player.position.y,scenario.player.velocity.x,scenario.player.velocity.y)
		end		
	end	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.BlinkEffect=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.BlinkEffect
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.expirytime=self.environment.localtime+1.0
			self.scale=1
		end
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(165715) --blink_impact_chest
			--actor:SetModelByFileID(1372779) --cfx_mage_shimmer_base
		end	
	
	end

	local prev=XPRACTICE.MULTIPLAYER.MultiplayerGhost.CreateCombatModule
	function XPRACTICE.MULTIPLAYER.MultiplayerGhost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_Blink.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.blink=spell
	end	
	
	function XPRACTICE.MULTIPLAYER.Multiplayer.Handle_BLINK(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		ghost.attemptedmovementunitvector.x=args[1]
		ghost.attemptedmovementunitvector.y=args[2]				
		ghost.orientation.yaw=args[3]
		ghost.position.x=args[4]
		ghost.position.y=args[5]
		ghost.velocity.x=args[6]
		ghost.velocity.y=args[7]
		
		local spell=ghost.combatmodule.spellbook.blink
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=ghost.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=ghost.combatmodule		
		local castendtime=ghost.environment.localtime
		spellinstance:CompleteCasting(castendtime,spellinstance)
		
		ghost.destx=ghost.position.x+ghost.velocity.x
		ghost.desty=ghost.position.y+ghost.velocity.y
		ghost.remainingreactiontime=0
	end	
	
	do
		local messagecode=XPRACTICE.MULTIPLAYER.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="BLINK"
		local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}}
		end		
		XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYER.previousmessagecode=messagecode
	end
	
end