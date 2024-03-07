do
	--TODO: move to a more appropriate location
	function XPRACTICE.QuickCast(spell,scenario,boss,args)
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=boss.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=boss.combatmodule
		spellinstance.args=args
		spellinstance.scenario=scenario
		spellinstance.spellbookspell:StartCasting(boss.environment.localtime,spellinstance)		
		boss.combatmodule.castedspell=spellinstance					
	end	

	do
		local roomnumber=XPRACTICE.RASZAGETH.NPCID
		local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASZAGETH.NPCID)		
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="PUSHBACK"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},	--Rasza X
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}, --Rasza Y
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}} --duration
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.RASZAGETH.Multiplayer	
	function class.HandleCustom_PUSHBACK(self,sender,args)		
		local scenario=self.scenario
		local boss=scenario.bosses[1]
		scenario.pushbackduration=args[3]
		XPRACTICE.QuickCast(boss.combatmodule.pushback,scenario,boss,args)
	end			
		
		


	do	
		local super=XPRACTICE.Spell
		XPRACTICE.RASZAGETH.Spell_Pushback=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.Spell_Pushback
		function class:SetCustomInfo()
			super.SetCustomInfo(self)			
			self.name="Hurricane Wing"
			self.icon="interface/icons/ability_dragonriding_vigor01.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=6.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=false
		end
		function class:Broadcast_v2(scenario)		
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				scenario.statuslabel:SetText("That action requires raid lead/assist.",3.0)
				return
			end						
			local args={}
			args[1]=scenario.bosses[1].position.x
			args[2]=scenario.bosses[1].position.y		
			args[3]=scenario.pushbackduration	--set in the schedule event that calls this spell
			self.scenario.multiplayer:FormatAndSendCustom("PUSHBACK",unpack(args))			
		end
		function class:CastingAnimationFunction(spellinstancepointer)				
			if(spellinstancepointer:GetCastProgress()<=(1-2.5/6))then
				spellinstancepointer.castercombat.mob.animationmodule:TryDirectedSpellcast()
			else
				spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.RASZAGETH.AnimationList.HurricaneWing)
			end
		end
		function class:StartCastingEffect(spellinstancepointer)
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local args=spellinstancepointer.args
			local mob=spellinstancepointer.castercombat.mob
			mob.position.x=args[1]
			mob.position.y=args[2]
			mob.combatmodule:ApplyAuraByClass(XPRACTICE.RASZAGETH.Aura_FreezeBoss_Pushback,mob.combatmodule,mob.environment.localtime)
		end
			
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local mob=spellinstancepointer.castercombat.mob
			local push=XPRACTICE.RASZAGETH.PushbackHandler.new()
			push.scenario=spellinstancepointer.scenario
			push:Setup(mob.environment,mob.position.x,mob.position.y)
			
			local visual=XPRACTICE.RASZAGETH.ExtraPushbackFX.new()
			visual.scenario=spellinstancepointer.scenario
			visual:Setup(mob.environment,mob.position.x,mob.position.y)
		end
	end
	
	


	
	
	
	do
		local super=XPRACTICE.Aura
		XPRACTICE.RASZAGETH.Aura_FreezeBoss_Pushback = XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.Aura_FreezeBoss_Pushback
		
		function class:SetupNewauraLists(auramodule)
			super.SetupNewauraLists(self,auramodule)
			tinsert(self.auramodulelists,auramodule.freezeboss)
		end
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.start={x=self.targetcombat.mob.position.x,y=self.targetcombat.mob.position.y,z=self.targetcombat.mob.position.z}
			self.destination={x=0,y=0,z=0}
			self.baseduration=6.0+2.5
			self.prevyaw=nil
		end
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			if(not self.prevyaw)then
				--TODO LATER: separate "orientation" and "forced_orientation" vars so we don't have to overwrite the former
				self.prevyaw=self.targetcombat.mob.orientation.yaw
			end		
			--self.targetcombat.mob.orientation.yaw=math.atan2(-self.targetcombat.mob.position.y,-self.targetcombat.mob.position.x)
			if(not self.targetcombat.mob.ai.suggestmode)then
				self:Die()
			end
		end

		function class:OnRemove()
			super.OnRemove(self)
			if(self.targetcombat.mob.ai.suggestmode)then			
				self.targetcombat.mob.orientation.yaw=self.prevyaw
			end
		end
	end
	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASZAGETH.ExtraPushbackFX = XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.ExtraPushbackFX
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=1			
			actor:SetModelByFileID(4067420)	--9fx_raid2_korrath_fatescribe_windradialground_state
		end
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.4
			self.projectileloopcustomduration=self.scenario.pushbackduration-0.4
			self.projectiledespawncustomduration=0.4
		end	
	end

	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASZAGETH.PushbackHandler = XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.PushbackHandler
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=2
			actor:SetModelByFileID(4067420)	--9fx_raid2_korrath_fatescribe_windradialground_state
		end
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.4
			self.projectileloopcustomduration=self.scenario.pushbackduration-0.4
			self.projectiledespawncustomduration=0.4
		end	
		function class:Step(elapsed)
			super.Step(self,elapsed)			
			self.alivetime=self.alivetime or 0
			self.alivetime=self.alivetime+elapsed
			--TODO: pushback here			
			for k,v in pairs(self.scenario.multiplayer.allplayers) do
				local player=v
				--local player=self.scenario.player
				--
				if(not player:IsDeadInGame())then
					local auras3=player.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.Aura_PushbackImmunity)
					if(not(#auras3>0 and not auras3[1].dying))then
						local angle=math.atan2(player.position.y-self.position.y,player.position.x-self.position.x)
						--print(k,"angle:",angle)
						--local force=28.0
						local force=35.0
						player.position.x=player.position.x+math.cos(angle)*force*elapsed
						player.position.y=player.position.y+math.sin(angle)*force*elapsed
					end
				end
			end
			
		end
		function class:OnProjectileDespawning()
			super.OnProjectileDespawning(self)
			-- TODO: modify air speed
			--for k,v in pairs(scenario.multiplayer.allplayers) do
				--local player=v
				local player=self.scenario.player
				if(not player:IsDeadInGame())then
					-- local auras=player.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.KELTHUZADMULTIPLAYER.Aura_Freeze)
					-- if(not(#auras>0 and not auras[1].dying))then
						local auras2=player.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.RASZAGETH.Aura_PushbackImmunity)
						if(not(#auras2>0 and not auras2[1].dying))then
							if(player:IsInMidair())then
								local angle=math.atan2(player.position.y,player.position.x)
								local force=28.0
								player.velocity.x=player.velocity.x+math.cos(angle)*force
								player.velocity.y=player.velocity.y+math.sin(angle)*force
							end
						end
					-- end
				end
			--end
		end
	end	
	












end