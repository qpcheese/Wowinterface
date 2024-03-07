
	local function QuickCast(spell,scenario,boss,args)
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=boss.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=boss.combatmodule
		spellinstance.args=args
		spellinstance.scenario=scenario
		spellinstance.spellbookspell:StartCasting(boss.environment.localtime,spellinstance)		
		boss.combatmodule.castedspell=spellinstance					
	end	

	local roomnumber=XPRACTICE.PRIMALCOUNCIL.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.PRIMALCOUNCIL.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="CONDUCTIVE_MARK"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={}
			for i=1,3 do
				tinsert(self.argtypes,{XPRACTICE.MULTIPLAYERV2.Datatypes.PADDEDGUID})
			end
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.PRIMALCOUNCIL.Multiplayer	
	function class.HandleCustom_CONDUCTIVE_MARK(self,sender,args)		
		local scenario=self.scenario
		local boss=scenario.bosses[2]		
		QuickCast(boss.combatmodule.conductivemark,scenario,boss,args)
	end			
		

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.PRIMALCOUNCIL.Spell_ConductiveMark=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Spell_ConductiveMark
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Conductive Mark"
			self.icon="interface/icons/spell_shaman_staticshock.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=2.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
		function class:Broadcast_v2(scenario)						
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				scenario.statuslabel:SetText("That action requires raid lead/assist.",3.0)
				return
			end
			local args={"XXXXXXXXXXXXXXXX","XXXXXXXXXXXXXXXX","XXXXXXXXXXXXXXXX"}
			local allplayerscopy={}
			for k,v in pairs(scenario.multiplayer.allplayers) do				
				if(not v:IsDeadInGame())then
					--TODO: maybe also check if player already has aura (but it's not unlikely that it can get reapplied given the way it works)
					tinsert(allplayerscopy,v)
				end
			end
			local dists={}
			local boss2=scenario.bosses[2]
			for i=1,#allplayerscopy do
				local p=allplayerscopy[i]				
				p.TEMP_DIST=math.sqrt(XPRACTICE.distsqr(p.position.x,p.position.y,boss2.position.x,boss2.position.y))
			end
			table.sort(allplayerscopy,function(a,b)return a.TEMP_DIST<b.TEMP_DIST end)
			local medianindex=math.floor(#allplayerscopy/2)
			local farplayercount=#allplayerscopy-medianindex			
			-- pick 2 players who are more than the median distance away from Dathea
			--TODO NEXT: make sure this actually works in a large group
			local playersfound=0
			for i=1,2 do
				if(farplayercount>0)then
					local r=math.floor(math.random()*farplayercount)+1+medianindex					
					if(r<=#allplayerscopy)then
						playersfound=playersfound+1
						args[playersfound]=allplayerscopy[r].paddedguid
						tremove(allplayerscopy,r)
						farplayercount=farplayercount-1						
					end
				end
			end
			-- then pick any remaining player(s)
			for i=playersfound+1,3 do				
				local r=math.floor(math.random()*#allplayerscopy)+1				
				if(r<=#allplayerscopy)then
					playersfound=playersfound+1
					args[playersfound]=allplayerscopy[r].paddedguid
					tremove(allplayerscopy,r)
				end
			end
			self.scenario.multiplayer:FormatAndSendCustom("CONDUCTIVE_MARK",unpack(args))			
		end
		function class:StartCastingEffect(spellinstancepointer)
			local scenario=spellinstancepointer.castercombat.mob.scenario
			--scenario.statuslabel:SetText("CONDUCTIVE MARK -- SPREAD OUT NOW!",3.0)
			XPRACTICE_RaidBossEmote("CONDUCTIVE MARK -- SPREAD OUT",3.0,true)
		end
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local args=spellinstancepointer.args
			--print("Conductive Mark",args[1],args[2],args[3])
			for i=1,3 do
				local guid=args[i]
				local target=scenario.multiplayer.guidpointers[guid]
				if(target and not target:IsDeadInGame())then
					XPRACTICE.PRIMALCOUNCIL.ApplyMark(target)
					if(target==scenario.player)then
						local iconsize="20"
						local icon="\124T"..self.icon..":"..iconsize.."\124t"
						local link="\124cffff0000\124Hspell:371624\124h[Conductive Mark]\124h\124r"		--TODO: get Heroic link instead of Normal, if possible
						local message=icon.." You are targeted with "..link.."."
						XPRACTICE_RaidBossEmote(message,5.0,true)
					end
				end
			end		
		end
	end
	
	XPRACTICE.PRIMALCOUNCIL.ApplyMark=function(player)
		local auras=player.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.PRIMALCOUNCIL.Aura_ConductiveMark)
		if(#auras>0)then
			auras[1].stacks=auras[1].stacks+1
			auras[1].expirytime=player.environment.localtime+auras[1].baseduration
		else
			local aura=player.combatmodule:ApplyAuraByClass(XPRACTICE.PRIMALCOUNCIL.Aura_ConductiveMark,player.combatmodule,player.environment.localtime)
			aura.scenario=player.scenario
		end	
	end
	
	
	do
		local super=XPRACTICE.Aura
		XPRACTICE.PRIMALCOUNCIL.Aura_ConductiveMark=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Aura_ConductiveMark
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.stacks=1
			self.baseduration=20.0
			self.basetickrate=0.5
		end
		function class:OnApply(localtime)
			super.OnApply(self,localtime)
			local player=self.targetcombat.mob
			local ring=XPRACTICE.PRIMALCOUNCIL.ConductiveMarkRing.new()
			ring:Setup(player.environment,player.position.x,player.position.y,0.1)
			ring.aura=self
			ring.player=player
		end
		function class:Tick(ticktime)
			self:OnTick(ticktime,1)
			--TODO: move to base aura class
			self.previousticktime=ticktime
		end				
		function class:OnTick(ticktime,percentage)
			super.OnTick(self,ticktime,percentage)
			self.tickcount=self.tickcount or 0
			self.tickcount=self.tickcount+1			
			self.targetcombat.mob.scenario.collision:DebuffCheck(self.targetcombat.mob,self.tickcount)
			if(self.tickcount%2==1)then
				local WHITESKULL="\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_8:12\124t"
				local message=tostring(self.stacks)
				if(self.stacks>1)then message=WHITESKULL..message..WHITESKULL end
				self.targetcombat.mob:CreateSpeechBubble(message,2.0)
			end
		end
	end

	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.PRIMALCOUNCIL.ConductiveMarkRing=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.ConductiveMarkRing
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=5.0/4.0
			actor:SetModelByFileID(4254394)	--target_lightning_state_rimonly
		end						
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=nil
			self.projectiledespawncustomduration=0.25
		end	
		function class:Step(elapsed)
			super.Step(self,elapsed)
			if(self.aura.dead)then
				if(not self.despawning)then
					self.despawning=true
					self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
				end				
			end
			self.position.x=self.player.position.x
			self.position.y=self.player.position.y
		end
	end
	
	
	
	
	
	
	
	
	local roomnumber=XPRACTICE.PRIMALCOUNCIL.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.PRIMALCOUNCIL.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="CAUGHT_MARK_FROM"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=false
			self.argtypes={{XPRACTICE.MULTIPLAYERV2.Datatypes.PADDEDGUID}}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end	
	local class=XPRACTICE.PRIMALCOUNCIL.Multiplayer	
	function class.HandleCustom_CAUGHT_MARK_FROM(self,sender,args)		
		local scenario=self.scenario
		local from=scenario.multiplayer.guidpointers[args[1]]
		local player=self.allplayers[sender]
		local hadmarkalready=false
		local auras=player.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.PRIMALCOUNCIL.Aura_ConductiveMark)
		if(#auras>0)then
			hadmarkalready=true
		end
		XPRACTICE.PRIMALCOUNCIL.ApplyMark(player)
		scenario.statuslabel:SetText(player.playername.." catches Conductive Mark from "..from.playername..".",3.0)
		if(from==scenario.player and hadmarkalready==false)then		
			-- prevent immediate tagbacks			
			if((not player.graceperiod) or player.graceperiod<player.environment.localtime+1.0)then
				player.graceperiod=player.environment.localtime+1.0
			end
		end		
	end					
	
	
	local roomnumber=XPRACTICE.PRIMALCOUNCIL.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.PRIMALCOUNCIL.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="CLEANSED_MARK"
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
	local class=XPRACTICE.PRIMALCOUNCIL.Multiplayer	
	function class.HandleCustom_CLEANSED_MARK(self,sender,args)		
		local scenario=self.scenario
		local player=self.allplayers[sender]
		local auras=player.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.PRIMALCOUNCIL.Aura_ConductiveMark)
		for i=1,#auras do
			local expirytime=player.environment.localtime+1.0
			if(auras[i].expirytime>expirytime)then auras[i].expirytime=expirytime end
		end
	end			