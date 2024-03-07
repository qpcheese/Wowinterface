do

	do
		local roomnumber=XPRACTICE.RASHOK.NPCID
		local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASHOK.NPCID)		
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="SEARINGSLAM"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},	--target X
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4} --target Y
							}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.RASHOK.Multiplayer	
	function class.HandleCustom_SEARINGSLAM(self,sender,args)		
		local scenario=self.scenario
		local boss=scenario.bosses[1]
		XPRACTICE.QuickCast(boss.combatmodule.searingslam,scenario,boss,args)
	end			
		
		


	do	
		local super=XPRACTICE.Spell
		XPRACTICE.RASHOK.Spell_SearingSlam=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.Spell_SearingSlam
		function class:SetCustomInfo()
			super.SetCustomInfo(self)			
			self.name="Searing Slam"
			self.icon="interface/icons/inv_misc_questionmark.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=5.0;self.basechannelduration=nil;self.basechannelticks=nil			
			self.usablewhilemoving=false
		end
		function class:Broadcast_v2(scenario)		
			--DON'T USE BROADCAST FOR THE DODGE SCENARIO
			-- it will always target the player instead of the preset locations
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				scenario.statuslabel:SetText("That action requires raid lead/assist.",3.0)
				return
			end						
			local args={}
			args[1]=scenario.player.position.x
			args[2]=scenario.player.position.y
			self.scenario.multiplayer:FormatAndSendCustom("SEARINGSLAM",unpack(args))	
		end
		function class:CastingAnimationFunction(spellinstancepointer)				
			if(spellinstancepointer:GetCastProgress()<=(5/6))then
				spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ChannelCastOmni)
			else
				spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.RASHOK.AnimationList.SearingSlam)
			end
		end
		function class:StartCastingEffect(spellinstancepointer)
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local args=spellinstancepointer.args
			local mob=spellinstancepointer.castercombat.mob
		
			mob.destx=nil;mob.desty=nil;mob.ai.targetposition=nil
		
			local telegraph=XPRACTICE.RASHOK.SearingSlamTelegraph.new()
			telegraph:Setup(mob.environment,args[1],args[2],0.1)
			telegraph.scenario=scenario
			local telegraph=XPRACTICE.RASHOK.SearingSlamTelegraphArrow.new()
			telegraph:Setup(mob.environment,args[1],args[2],5.0)
			
			local yaw=math.atan2(args[2]-mob.position.y,args[1]-mob.position.x)
			mob.orientation.yaw=yaw	--TODO: track player target as they move around
		end
			
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local args=spellinstancepointer.args
			local mob=spellinstancepointer.castercombat.mob		
			
			
			local x=args[1]
			local y=args[2]
			local yaw=math.atan2(y-mob.position.y,x-mob.position.x)
			local xdist=x-mob.position.x
			local ydist=y-mob.position.y
			local dist=math.sqrt(XPRACTICE.distsqr(mob.position.x,mob.position.y,x,y))
			if(dist>10)then				
				local targetdist=dist-10
				
				x=mob.position.x+targetdist*math.cos(yaw)
				y=mob.position.y+targetdist*math.sin(yaw)

				local aura=mob.combatmodule:ApplyAuraByClass(XPRACTICE.LEGACY.Aura_DeathGrip_GhostCheat)
				aura.destination={x=x,y=y,z=0}
				aura.expirytime=mob.environment.localtime+0.75
			end
			
			mob.destx=x;mob.desty=y;mob.ai.targetposition={x=x,y=y}
			mob:FreezeOrientation(yaw)				

		end
	end
	
	
	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASHOK.SearingSlamTelegraph=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.SearingSlamTelegraph
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(943427)
			self.scale=2.5	--10 yards?
		end
		
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=4.75+0.75
			self.projectiledespawncustomduration=0.25
		end			
		
		function class:OnProjectileDespawning()
			--TODO: make sure this is where the player was actually standing when rashok finished casting
			-- local vortex=XPRACTICE.RASHOK.LavaVortex.new()
			-- vortex:Setup(self.environment,self.position.x,self.position.y)
			-- tinsert(self.scenario.lavavortexs,vortex)
			-- vortex.scenario=self.scenario
			local vortex=self.scenario.vortexmanager:NewVortex(self.position.x,self.position.y)
			vortex.scenario=self.scenario
		end
	end
	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASHOK.SearingSlamTelegraphArrow=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.SearingSlamTelegraphArrow
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3671907)
			self.scale=2.0
		end
		
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=4.75
			self.projectiledespawncustomduration=0.25
		end			
	end

end