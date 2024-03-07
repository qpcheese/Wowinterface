do	

	--TODO: volatile code reuse -- only use function in multiplayerv2/messagehandler.lua
	local function IsGameHost(multiplayermodule,sender)
		if(not IsInGroup("player"))then return true end
		if(sender==multiplayermodule.hostname)then return true end
		return false		
	end
	
	-- local function IsRealOfficer(unit)
		-- return XPRACTICE.MULTIPLAYERV2.IsRealOfficer(unit)
	-- end
	
	local function IsFlaggedAsOfficer(multiplayermodule,sender)
		if(not IsInGroup("player"))then return true end
		local name1,name2=UnitFullName("player")
		local myfullname=name1.."-"..name2		
		if(myfullname==sender)then return multiplayermodule.officer end
		if(multiplayermodule.allplayers[sender])then return multiplayermodule.allplayers[sender].officer end
		return false
	end

	local roomnumber=XPRACTICE.PRIMALCOUNCIL.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.PRIMALCOUNCIL.NPCID)	
	XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD]={}
	do
		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes={}
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer={}
		local messagecode=0
		

		
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="BREZ"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.requireofficer=false
			self.argtypes={}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]		

		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="SPRINT"
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
		
					
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="MOVE_BOSS"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR}, --boss index
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},	--boss1 x
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},	--boss1 y
				}	
			
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]		
		
			
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="WORLD_STATE"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.requireofficer=true
			self.argtypes={{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR}, --map index
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},	--boss1 x
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},	--boss1 y
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6},	--boss1 yaw
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},	--boss2 x
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},	--boss2 y
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6},
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},	--boss3 x
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},	--boss3 y
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6},
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},	--boss4 x
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},	--boss4 y			
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6}
				}	
			
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]		
		
							
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local super=XPRACTICE.MULTIPLAYERV2.Multiplayerv2
	XPRACTICE.PRIMALCOUNCIL.Multiplayer=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.PRIMALCOUNCIL.Multiplayer		
	
	--local prev=class.Handle_HELLO -- this doesn't work anymore!  prev now refers to FATESCRIBE for some reason --TODO: why?
	local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_HELLO 
	function class.Handle_HELLO(self,sender,args)
		
		--print(XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle, XPRACTICE.PRIMALCOUNCIL.Handle)
		prev(self,sender,args)	
		--XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_HELLO(self,sender,args)	-- but we can do this instead
		--TODO NEXT: this is scenario-specific!
		if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
			--TODO NEXT: move worldmarker send to baseline
			if(self.scenario.worldmarkercontroller)then
				self.scenario.worldmarkercontroller:SendAll(self)
			end
		end		
	end
	

	
	function class.HandleCustom_BREZ(self,sender,args)
		local scenario=self.scenario
		local player=self.allplayers[sender]	
		if(not player)then return end
		local auras=player.combatmodule.auras.deadingame
		if(#auras==0)then return end
		for i=1,#auras do
			auras[i]:Die()
		end
		player:StopAI()
		if(player.spectator~=true)then
			scenario.statuslabel:SetText(sender.." was rezzed.",3.0)
		end
	end			
	
	function class.HandleCustom_SPRINT(self,sender,args)
		local scenario=self.scenario
		local player=self.allplayers[sender]	
		if(not player)then return end
		if(player:IsDeadInGame())then return end
		local auras=player.combatmodule.auras.speedboost
		if(#auras>0 and not auras[1].dying)then
			local newexpiry=player.environment.localtime+8.000
			if(newexpiry>auras[1].expirytime)then auras[1].expirytime=newexpiry end
			auras[1].multiplier=1.7
		else
			local aura=player.combatmodule:ApplyAuraByClass(XPRACTICE.Aura_StampedingRoar,player.combatmodule,player.environment.localtime)
			aura.expirytime=player.environment.localtime+8.000
			aura.multiplier=1.7
		end
		local visual=XPRACTICE.SprintVisualEffect.new()
		visual:Setup(player.environment,player.position.x,player.position.y,player.position.z+2)
		visual.player=player		

	end			
	


	
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
	
	local function QuickQueue(spell,scenario,boss,args)
		if(boss.ai.suggestmode and not spell.usablewhilemoving)then
			--boss:StopAI()
			boss.velocity.x=0;boss.velocity.y=0;boss.velocity.z=0
			boss.position.z=0
		end		
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=boss.combatmodule
		queuepointer.args=args
		local errorcode=boss.combatmodule:TryQueue(queuepointer)				
	end	
	
	function class.HandleCustom_CHANGEMAP(self,sender,args)
		local scenario=self.scenario
		local boss=scenario.boss
		local i=string.byte(args[1])
				
		scenario.floor:TransitionTo(i)
		local name=tostring(XPRACTICE.PRIMALCOUNCIL.ChangeMap.BossNames[i])
		if(name)then
			scenario.statuslabel:SetText("Moving to "..name.."'s room...",5.0)
		end
	end			
	
	function class.HandleCustom_MOVE_BOSS(self,sender,args)
		local scenario=self.scenario
		
		local i=string.byte(args[1])		
		local boss=self.scenario.bosses[i]
		if(boss)then
			boss.ai.targetposition={x=args[2],y=args[3]}
			local distx=(boss.ai.targetposition.x-boss.position.x)
			local disty=(boss.ai.targetposition.y-boss.position.y)
			boss.orientation.yaw=math.atan2(disty,distx)			
		end
	end		
	
	function class.HandleCustom_WORLD_STATE(self,sender,args)
		local scenario=self.scenario
		local i=string.byte(args[1])
		
		if(self.scenario.waitingforcommstimer)then
			self.scenario.waitingforcommstimer=nil
			scenario.floor:TransitionTo(i)
			local name=tostring(XPRACTICE.PRIMALCOUNCIL.ChangeMap.BossNames[i])			
			if(name)then
				scenario.statuslabel:SetText("Moving to "..name.."'s room...",5.0)
			end
			local j=2
			for i=1,4 do
				if(scenario.bosses[i])then
					scenario.bosses[i].position.x=args[j]
					scenario.bosses[i].position.y=args[j+1]
					scenario.bosses[i].orientation.yaw=args[j+2]
				end
				j=j+3
			end
			
		end
	end	
	

end		
		
	
	
	
	