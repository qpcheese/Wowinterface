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

	local roomnumber=XPRACTICE.RASZAGETH.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASZAGETH.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="BREATH"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},	--Rasza X
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}, --Rasza Y
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}, --Target X
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}}	--Target Y
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.RASZAGETH.Multiplayer	
	function class.HandleCustom_BREATH(self,sender,args)		
		local scenario=self.scenario
		local boss=scenario.bosses[1]
		XPRACTICE.QuickCast(boss.combatmodule.breath,scenario,boss,args)
	end			
		
		
	local roomnumber=XPRACTICE.RASZAGETH.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASZAGETH.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="DEAD"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=false
			self.argtypes={}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.RASZAGETH.Multiplayer	
	function class.HandleCustom_DEAD(self,sender,args)		
		local scenario=self.scenario
		local player=scenario.multiplayer.allplayers[sender]
		if(player)then scenario:AttemptKillPlayer(player,true) end
	end	



	do	
		local super=XPRACTICE.Spell
		XPRACTICE.RASZAGETH.Spell_Breath=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.Spell_Breath
		function class:SetCustomInfo()
			super.SetCustomInfo(self)			
			self.name="Lightning Breath"
			self.icon="interface/icons/ability_thunderking_thunderstruck.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=3.0;self.basechannelduration=2.0;self.basechannelticks=7
			-- self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=3.0;self.basechannelduration=20.0;self.basechannelticks=70
			self.usablewhilemoving=false
			--TODO: where in the code is this locking mob facing (even when taunted)?
		end
		function class:Broadcast_v2(scenario)		
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				scenario.statuslabel:SetText("That action requires raid lead/assist.",3.0)
				return
			end			
			local allplayerscopy={}
			for k,v in pairs(scenario.multiplayer.allplayers) do				
				if(not v:IsDeadInGame())then
					--if(not v.markedastank)then
						tinsert(allplayerscopy,v)
					--end
				end
			end	
			local boss=scenario.bosses[1]
			for i=1,#allplayerscopy do
				local p=allplayerscopy[i]				
				p.TEMP_DIST=math.sqrt(XPRACTICE.distsqr(p.position.x,p.position.y,boss.position.x,boss.position.y))
			end
			table.sort(allplayerscopy,function(a,b)return a.TEMP_DIST<b.TEMP_DIST end)			
			local medianindex=math.floor(#allplayerscopy/2)
			local farplayercount=#allplayerscopy-medianindex
			local target=nil
			if(farplayercount>0)then
				local r=math.floor(math.random()*farplayercount)+1+medianindex					
				if(r<=#allplayerscopy)then
					target=allplayerscopy[r]
				end
			end
			if(not target)then
				local r=math.floor(math.random()*#allplayerscopy)+1					
				if(r>0)then
					target=allplayerscopy[r]
				end
			end
			local args={}
			args[1]=scenario.bosses[1].position.x
			args[2]=scenario.bosses[1].position.y
			if(target)then
				args[3]=target.position.x
				args[4]=target.position.y
			else
				args[3]=0
				args[4]=0
			end
			self.scenario.multiplayer:FormatAndSendCustom("BREATH",unpack(args))			
		end
		function class:CastingAnimationFunction(spellinstancepointer)	
			
			if(spellinstancepointer:GetCastProgress()<0.8)then
				spellinstancepointer.castercombat.mob.animationmodule:TryDirectedSpellcast()
			else
				spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.RASZAGETH.AnimationList.SpellCastDirected)
			end
		end
		function class:StartCastingEffect(spellinstancepointer)
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local args=spellinstancepointer.args
			local mob=spellinstancepointer.castercombat.mob
			--mob.position.x=args[1]
			--mob.position.y=args[2]
			local distx=args[3]-mob.position.x
			local disty=args[4]-mob.position.y
			local t=math.atan2(disty,distx)		
			mob.orientation.yaw=t

			local gfx=XPRACTICE.RASZAGETH.ChargeUpEffect.new()
			gfx:Setup(mob.environment,mob.position.x,mob.position.y,10)
			gfx.boss=mob
		end
			
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local mob=spellinstancepointer.castercombat.mob
			local t=mob.orientation.yaw	
			local offset=260
			local gfx=XPRACTICE.RASZAGETH.BreathFX.new()
			gfx:Setup(mob.environment,mob.position.x+offset*math.cos(t),mob.position.y+offset*math.sin(t),5.5)
			gfx.orientation_displayed.yaw=t
			local gfx=XPRACTICE.RASZAGETH.BreathFX.new()
			gfx:Setup(mob.environment,mob.position.x+offset*math.cos(t),mob.position.y+offset*math.sin(t),5.5)
			gfx.orientation_displayed.yaw=t
			gfx.orientation_displayed.roll=math.pi/2
			local offset=50
			local gfx=XPRACTICE.RASZAGETH.BreathFX2.new()			
			gfx:Setup(mob.environment,mob.position.x+offset*math.cos(t),mob.position.y+offset*math.sin(t),5.5)
			gfx.orientation_displayed.yaw=t
			-- local offset=25
			-- local gfx=XPRACTICE.RASZAGETH.BreathFX3.new()
			-- gfx:Setup(mob.environment,mob.position.x+offset*math.cos(t),mob.position.y+offset*math.sin(t),5.5)
			-- gfx.orientation_displayed.yaw=t


			
		end
		function class:ChannelingAnimationFunction(spellinstancepointer)	
			spellinstancepointer.castercombat.mob.animationmodule:TryDirectedChannel()
		end		
		
		function class:OnChannelTick(spellinstancepointer,tickcount)
			local mob=spellinstancepointer.castercombat.mob
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local player=scenario.player
			local t=mob.orientation.yaw		
			--local TOLERANCE=5
			local TOLERANCE=6.25
			local necklength=0+TOLERANCE
			local x1=mob.position.x+math.cos(t)*necklength
			local y1=mob.position.y+math.sin(t)*necklength
			local x2=mob.position.x+math.cos(t)*999
			local y2=mob.position.y+math.sin(t)*999
			if(not player:IsDeadInGame())then				
				if(XPRACTICE.LineCircleCollision(x1,y1,x2,y2,player.position.x,player.position.y,TOLERANCE))then
					self.scenario:AttemptKillPlayer(player)
					self.scenario.multiplayer:FormatAndSendCustom("DEAD")
				end
			end
		end
		
	end
	
	




	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASZAGETH.ChargeUpEffect=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.ChargeUpEffect
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=2.0			
			actor:SetModelByFileID(4550333)	--unk
		end						
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.5
			self.projectileloopcustomduration=2.0
			self.projectiledespawncustomduration=0.5
		end	
		function class:Step(elapsed)
			super.Step(self,elapsed)
			local t=self.boss.orientation_displayed.yaw
			self.orientation_displayed.yaw=t
			local neck=32
			self.position.x=self.boss.position.x+neck*math.cos(t)
			self.position.y=self.boss.position.y+neck*math.sin(t)
			self.position.z=10
		end
	end

	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASZAGETH.BreathFX=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.BreathFX
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=2.0
			actor:SetModelByFileID(2143992)	--8fx_mother_laser
		end						
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=1.75
			self.projectiledespawncustomduration=1.0
		end	
	end

	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASZAGETH.BreathFX2=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.BreathFX2
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=4.0
			actor:SetModelByFileID(4550332)
		end						
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=1.75
			self.projectiledespawncustomduration=1.0
		end	
	end
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASZAGETH.BreathFX3=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.BreathFX3
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=2.0
			actor:SetModelByFileID(985711) -- dragonbreath_leishen_lightning_withdecay
		end						
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=1.75
			self.projectiledespawncustomduration=2.0
		end	
	end
	

end