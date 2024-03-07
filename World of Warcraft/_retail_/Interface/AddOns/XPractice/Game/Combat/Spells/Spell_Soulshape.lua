do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_Soulshape=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_Soulshape
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Soulshape"
			self.icon="interface/icons/ability_nightfae_flicker.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
			self.basecooldown=4.0
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)				
			local mob=spellinstancepointer.castercombat.mob
			if(mob:IsDeadInGame())then return end
			local scenario=mob.scenario	
			
			
			local auras=mob.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.Aura_Soulshape)
			if(#auras==0)then
				mob.combatmodule:ApplyAuraByClass(XPRACTICE.Aura_Soulshape)
			end			
			
			mob.animationmodule:ResetAnimation(XPRACTICE.AnimationList.SpellCastOmni)
			local effect=XPRACTICE.SoulshapeBlinkEffect.new()
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
				yaw=math.atan2(y,x)
			end			
			local distance=15			
			--local effect=XPRACTICE.SoulshapeBlinkEffect.new()
			--effect:Setup(mob.environment,mob.position.x+distance*1.0*math.cos(yaw),mob.position.y+distance*1.0*math.sin(yaw),1)			
			mob.position.x=mob.position.x+distance*math.cos(yaw)
			mob.position.y=mob.position.y+distance*math.sin(yaw)			
			mob.position.z=0;mob.velocity.z=0
		end
		
		function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
			local scenario=spellinstance.castercombat.mob.scenario
			local mob=spellinstance.castercombat.mob
			if(mob:IsDeadInGame())then return end
			scenario.multiplayer:FormatAndSend("SOULSHAPE",scenario.player.attemptedmovementunitvector.x,scenario.player.attemptedmovementunitvector.y,scenario.player.orientation.yaw,scenario.player.position.x,scenario.player.position.y,scenario.player.velocity.x,scenario.player.velocity.y)
		end		
	end	

	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SoulshapeBlinkEffect=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SoulshapeBlinkEffect
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.expirytime=self.environment.localtime+1.0
			self.scale=1
		end
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3616943) --9fx_generic_anima_ardenweald_teleportresidue
			--actor:SetModelByFileID(1372779) --cfx_mage_shimmer_base
		end	
	
	end
	

	local prev=XPRACTICE.MULTIPLAYER.MultiplayerGhost.CreateCombatModule
	function XPRACTICE.MULTIPLAYER.MultiplayerGhost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_Soulshape.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.soulshape=spell
	end	
	
	function XPRACTICE.MULTIPLAYER.Multiplayer.Handle_SOULSHAPE(self,sender,args)
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
		
		local spell=ghost.combatmodule.spellbook.soulshape
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
		local messagename="SOULSHAPE"
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
	
		
	do
		local super=XPRACTICE.Aura
		XPRACTICE.Aura_Soulshape = XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Aura_Soulshape
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.baseduration=12.000
			self.multiplier=1.3
		end	
		function class:OnApply(localtime)
			super.OnApply(self,localtime)
			local mob=self.targetcombat.mob
			local effect=XPRACTICE.SoulshapeVisualEffect.new()
			effect:Setup(mob.environment,mob.position.x,mob.position.y,mob.position.z)
			effect.player=mob			
			self.visualeffect=effect		
			mob.displayobject.drawable:SetModelByCreatureDisplayID(93949) -- vulpin (soulshape)
		end	
		function class:SetupNewauraLists(auramodule)
			super.SetupNewauraLists(self,auramodule)
			tinsert(self.auramodulelists,auramodule.speedboost)
		end		
		function class:OnRemove()
			super.OnRemove(self)
			if(self.visualeffect)then
				if(not self.visualeffect.dying)then
					self.visualeffect.displayobject.drawable:SetAnimation(159)
					self.visualeffect.expirytime=self.visualeffect.environment.localtime+0.5
				end
			end
			local mob=self.targetcombat.mob
			if(mob.SetActorAppearanceViaOwner)then
				mob:SetActorAppearanceViaOwner(mob.displayobject.drawable)
			elseif(mob.displayobject.SetAppearance)then
				mob.displayobject:SetAppearance()
			end
		end		
	end	
	
	do	
		local super=XPRACTICE.WoWObject
		XPRACTICE.SoulshapeVisualEffect=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SoulshapeVisualEffect
		
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3619295)	--9fx_generic_anima_ardenweald_soulshape_low		-- (0,159)
			--self.expirytime=self.environment.localtime+12
		end
				
		function class:Step(elapsed)
			super.Step(self,elapsed)
			self.position.x=self.player.position.x
			self.position.y=self.player.position.y
			self.position.z=self.player.position.z+1
			self.scale=1
			--TODO: die if player is missing soulshape aura
		end
	end		
	
end
	
	
