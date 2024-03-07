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
		local roomnumber=XPRACTICE.RASHOK.NPCID
		local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASHOK.NPCID)		
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="FRONTALCONE"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},	--Boss X
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}, --Boss Y
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}} --Boss angle
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.RASHOK.Multiplayer	
	function class.HandleCustom_FRONTALCONE(self,sender,args)		
		local scenario=self.scenario
		local boss=scenario.bosses[1]
		XPRACTICE.QuickCast(boss.combatmodule.frontalcone,scenario,boss,args)
	end			
		
		


	do	
		local super=XPRACTICE.Spell
		XPRACTICE.RASHOK.Spell_FrontalCone=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.Spell_FrontalCone
		function class:SetCustomInfo()
			super.SetCustomInfo(self)			
			self.name="Shadowlava Blast"
			self.icon="interface/icons/inv_misc_questionmark.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=5.0;self.basechannelduration=nil;self.basechannelticks=nil
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
			args[3]=math.atan2(scenario.player.position.y-args[2],scenario.player.position.x-args[1])	-- aim at player
			self.scenario.multiplayer:FormatAndSendCustom("FRONTALCONE",unpack(args))	
		end
		function class:CastingAnimationFunction(spellinstancepointer)				
			if(spellinstancepointer:GetCastProgress()<=(5/6))then
				spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.RASHOK.AnimationList.SlowChannelCastOmni)
			else
				spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.RASHOK.AnimationList.FastSearingSlam)
			end
		end
		function class:StartCastingEffect(spellinstancepointer)
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local args=spellinstancepointer.args
			local mob=spellinstancepointer.castercombat.mob
			--mob.position.x=args[1]
			--mob.position.y=args[2]
			mob.orientation.yaw=args[3]
			--mob:SuggestOrientation(args[3],0,"[null]")
			mob.combatmodule:ApplyAuraByClass(XPRACTICE.RASHOK.Aura_FreezeBoss_Pushback,mob.combatmodule,mob.environment.localtime)
			local telegraph=XPRACTICE.RASHOK.FrontalConeTelegraph.new()
			local angle=args[3]-0.2
			telegraph:Setup(scenario.player.environment,mob.position.x+60*math.cos(angle),mob.position.y+60*math.sin(angle),-1)
			telegraph.orientation_displayed.yaw=angle
			local telegraph=XPRACTICE.RASHOK.FrontalConeTelegraph.new()
			angle=args[3]+0.2
			telegraph:Setup(scenario.player.environment,mob.position.x+60*math.cos(angle),mob.position.y+60*math.sin(angle),-1)
			telegraph.orientation_displayed.yaw=angle			
		
		end
			
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local args=spellinstancepointer.args
			local mob=spellinstancepointer.castercombat.mob		
			
			local impact=XPRACTICE.RASHOK.FrontalConeImpact.new()						
			local angle=args[3]-math.pi/8
			impact:Setup(scenario.player.environment,args[1]+60*math.cos(angle),args[2]+60*math.sin(angle),1)			
			impact.orientation_displayed.yaw=angle
			local impact=XPRACTICE.RASHOK.FrontalConeImpact.new()						
			local angle=args[3]+math.pi/8
			impact:Setup(scenario.player.environment,args[1]+60*math.cos(angle),args[2]+60*math.sin(angle),1)			
			impact.orientation_displayed.yaw=angle
			
			local dodgeangle=math.atan2(scenario.player.position.y-args[2],scenario.player.position.x-args[1])
			if(math.abs(XPRACTICE.AngleDifference(args[3],dodgeangle))<=math.pi/4)then	--45 degrees in either direction == 90 degree cone
				scenario:AttemptKillPlayer(scenario.player)	--TODO: multiplayer comms
			end
		end
	end
	
	
	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASHOK.FrontalConeTelegraph=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.FrontalConeTelegraph
		function class:SetActorAppearanceViaOwner(actor)
			--actor:SetModelByFileID(4703497)
			actor:SetModelByFileID(2053766)
			self.scale=2.0
		end
		
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=4.75
			self.projectiledespawncustomduration=0.25
		end			
	end
	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASHOK.FrontalConeImpact=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.FrontalConeImpact
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(4703498)
			self.scale=4.0
		end
		
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
			--self.projectilespawncustomduration=0.25
			--self.projectileloopcustomduration=4.75
			self.projectiledespawncustomduration=1.0
		end			
	end	
	
end