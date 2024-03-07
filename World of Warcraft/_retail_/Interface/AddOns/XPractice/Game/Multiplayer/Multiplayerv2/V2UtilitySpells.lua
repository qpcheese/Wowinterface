	local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_Blink.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.blink=spell
	end	
	
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_BLINK(self,sender,args)
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
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode			
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="BLINK"
		local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4}}
		end		
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
		
	end
	
	local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_DemonicCircle.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.demoniccircle=spell
	end	
	
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_LOCKSET(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
		-- local circle=ghost.extraobjects.demoniccircle
		-- if(circle)then
			-- circle.stage=3 	-- this is necessary if basecooldown is low enough, to prevent anim 147 from overriding 157
			-- circle.displayobject.drawable:SetAnimation(157)
			-- circle.expirytime=circle.environment.localtime+2.0
		-- end		
		
		local spell=ghost.combatmodule.spellbook.demoniccircle
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=ghost.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=ghost.combatmodule		
		local castendtime=ghost.environment.localtime
		spellinstance:CompleteCasting(castendtime,spellinstance)
	
		local circle=ghost.extraobjects.demoniccircle
		if(circle)then
			circle.position.x=args[1]
			circle.position.y=args[2]
			circle.orientation_displayed.yaw=args[3]
		end

	end	
	
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="LOCKSET"
		local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6}}
		end		
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
	end	
	
	local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_DemonicCircleTeleport.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.demoniccircleteleport=spell
	end		

	
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_LOCKTELE(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
		local spell=ghost.combatmodule.spellbook.demoniccircleteleport
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=ghost.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=ghost.combatmodule		
		local castendtime=ghost.environment.localtime
		spellinstance:CompleteCasting(castendtime,spellinstance)
		
		-- this is a bit redundant but safeguards against desynced circles
		ghost.position.x=args[1]
		ghost.position.y=args[2]
		ghost.orientation_displayed.yaw=args[3]
		
		--ghost.destx=ghost.position.x
		--ghost.desty=ghost.position.y
		ghost.destx=nil;ghost.desty=nil;ghost.ai.targetposition=nil
		
		ghost.remainingreactiontime=0
	end	
	
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="LOCKTELE"
		local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6}}
		end		
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
	end	
	
	local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
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
	
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_DOOROFSHADOWS_FINISHCAST(self,sender,args)
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
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="DOOROFSHADOWS_FINISHCAST"
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


	
	local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_Soulshape.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.soulshape=spell
	end	
	
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_SOULSHAPE(self,sender,args)
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
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="SOULSHAPE"
		local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4}}
		end		
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
	end
	
	
	local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_Transcendence.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.transcendence=spell
	end	
	
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="MONKSET"
		local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6}}
		end		
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
	end	
	
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_MONKSET(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
		local spell=ghost.combatmodule.spellbook.transcendence
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=ghost.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=ghost.combatmodule		
		local castendtime=ghost.environment.localtime
		spellinstance:CompleteCasting(castendtime,spellinstance)
	
		local effect=ghost.extraobjects.transcendence
		if(effect)then
			effect.position.x=args[1]
			effect.position.y=args[2]
			effect.position.z=args[3]
			effect.orientation_displayed.yaw=args[4]
		end

	end	

	local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()
		prev(self)
		local spell=XPRACTICE.Spell_TranscendenceTransfer.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.transcendencetransfer=spell
	end		

	
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_MONKTELE(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
		local spell=ghost.combatmodule.spellbook.transcendencetransfer
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=ghost.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=ghost.combatmodule		
		local castendtime=ghost.environment.localtime
		spellinstance:CompleteCasting(castendtime,spellinstance)
		
		-- this is a bit redundant but safeguards against desynced teleports
		ghost.position.x=args[1]
		ghost.position.y=args[2]
		ghost.position.z=args[3]
		ghost:FreezeOrientation(args[4])	

		local effect=ghost.extraobjects.transcendence
		if(effect)then
			effect.x=args[5]
			effect.y=args[6]
			effect.z=args[7]
			effect.orientation_displayed.yaw=args[8]
		end
		
		-- ghost.destx=ghost.position.x
		-- ghost.desty=ghost.position.y
		ghost.destx=nil;ghost.desty=nil;ghost.ai.targetposition=nil
		ghost.remainingreactiontime=0
	end	
	
	local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
	do
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="MONKTELE"
		local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6}}
		end		
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]				
		
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
	end
	
	
	local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
	do
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
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]	
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
	end
	
	local class=XPRACTICE.MULTIPLAYERV2.Multiplayerv2
	function class.Handle_SPRINT(self,sender,args)
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
		local visual=XPRACTICE.LEGACY.SprintVisualEffect.new()
		visual:Setup(player.environment,player.position.x,player.position.y,player.position.z+2)
		visual.player=player		
	end				

	
	local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.LEGACY.Spell_Sprint.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.dash=spell
		local spell=XPRACTICE.LEGACY.Spell_Roar.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.roar=spell		
	end	
	
	local prev=XPRACTICE.PlayerCharacter.CreateCombatModule
	function XPRACTICE.PlayerCharacter:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.LEGACY.Spell_Sprint.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.dash=spell
		local spell=XPRACTICE.LEGACY.Spell_Roar.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.roar=spell	
	end			
	
	
local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
	prev(self)
	local spell=XPRACTICE.Spell_LockGateCombo.new()
	spell:Setup(self.combatmodule)
	self.combatmodule.spellbook.lockgatecombo=spell
	
	local spell=XPRACTICE.Spell_LockGate1.new()
	spell:Setup(self.combatmodule)
	self.combatmodule.spellbook.lockgate1=spell

	local spell=XPRACTICE.Spell_LockGate2.new()
	spell:Setup(self.combatmodule)
	self.combatmodule.spellbook.lockgate2=spell
	
	-- local spell=XPRACTICE.Spell_LockGateItem.new()
	-- spell:Setup(self.combatmodule)
	-- self.combatmodule.spellbook.gateitem=spell
end	



	do
		XPRACTICE.QuickPlayerDemonicGateway=function(scenario,player,p1x,p1y,p2x,p2y)
			XPRACTICE.ResetQuickPlayerGateways(scenario,player)
			
			local point1,point2
			point1={x=p1x,y=p1y}
			point2={x=p2x,y=p2y}
						
			
			
			local angle=math.atan2(point2.y-point1.y,point2.x-point1.x)
			local purple=XPRACTICE.LEGACY.DemonicGatewayPurple.new()
			purple:Setup(scenario.game.environment_gameplay,point1.x,point1.y,0)
			purple:FreezeOrientation(angle)
			purple.scenario=scenario
			local mobclickzone=XPRACTICE.MobClickZone.new()
			mobclickzone:Setup(scenario.game.environment_gameplay,purple)				
			local green=XPRACTICE.LEGACY.DemonicGatewayGreen.new()
			green:Setup(scenario.game.environment_gameplay,point2.x,point2.y,0)
			green:FreezeOrientation(angle+math.pi)
			green.scenario=scenario
			local mobclickzone=XPRACTICE.MobClickZone.new()
			mobclickzone:Setup(scenario.game.environment_gameplay,green)
			green.alpha=0
			purple.partner=green
			green.partner=purple
			local missile=XPRACTICE.LEGACY.DemonicGatewayMissile.new()
			missile:Setup(scenario.game.environment_gameplay,point1.x,point1.y,2)
			local dist=math.sqrt((point2.x-point1.x)*(point2.x-point1.x)+(point2.y-point1.y)*(point2.y-point1.y))			
			missile.scale=2
			local TRAVELSPEED=60
			missile.expirytime=scenario.game.environment_gameplay.localtime+dist/TRAVELSPEED
			missile.orientation_displayed.yaw=angle
			missile.velocity.x=math.cos(angle)*TRAVELSPEED
			missile.velocity.y=math.sin(angle)*TRAVELSPEED
			missile.green=green
			
			player.extraobjects.lockgate1=purple
			player.extraobjects.lockgate2=green
			
			return purple
		end
	end
	
	do
		XPRACTICE.ResetQuickPlayerGateways=function(scenario,player)
			if(player.extraobjects.lockgate1)then
				player.extraobjects.lockgate1.fadestarttime=scenario.game.environment_gameplay.localtime
				player.extraobjects.lockgate1.expirytime=scenario.game.environment_gameplay.localtime+0.25				
			end
			if(player.extraobjects.lockgate2)then
				player.extraobjects.lockgate2.fadestarttime=scenario.game.environment_gameplay.localtime
				player.extraobjects.lockgate2.expirytime=scenario.game.environment_gameplay.localtime+0.25								
			end
			player.extraobjects.lockgate1=nil
			player.extraobjects.lockgate2=nil				
		end
	end


-- --TODO NEXT: send extraobjects after IEXIST!


do	
	local super=XPRACTICE.Spell
	XPRACTICE.Spell_LockGateCombo=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Spell_LockGateCombo
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.name="Demonic Gateway (Combo)"
		self.icon="interface/icons/spell_warlock_demonicportal_green.blp"
		self.requiresfacing=false;self.projectileclass=nil;self.basechannelduration=nil;self.basechannelticks=nil			
		--self.basecooldown=10.0
		--self.basecastduration=2.0;
		self.basecastduration=0.0
		self.basecooldown=1.0
		self.usablewhilemoving=true
	end
	-- function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
		-- local scenario=spellinstance.castercombat.mob.scenario
		-- local mob=spellinstance.castercombat.mob
		-- if(mob:IsDeadInGame())then return end
		
	-- end			
	function class:CompleteCastingEffect(castendtime,spellinstancepointer)				
		local scenario=spellinstancepointer.castercombat.mob.scenario
		local player=spellinstancepointer.castercombat.mob
		local picker=XPRACTICE.MousePicker.new()
		picker:Setup(player.environment,0,0,0)
		picker.callback=function(s)
			scenario.multiplayer:FormatAndSend("LOCKGATECOMBO",player.position.x,player.position.y,player.position.z,picker.position.x,picker.position.y,picker.position.z)
		end					
	end
end


do	
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_LockGateItem=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_LockGateItem
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Gateway Control Shard"
			self.icon="interface/icons/spell_warlock_demonicportal_purple.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basechannelduration=nil;self.basechannelticks=nil			
			self.basecastduration=0.0
			self.usablewhilemoving=true
		end

		function class:CompleteCastingEffect(castendtime,spellinstancepointer)				
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
						
			local nearestgate=nil
			local nearestdist=nil
			local dist
			for k,v in pairs(scenario.multiplayer.allplayers)do
				local gate=v.extraobjects.lockgate1
				if(gate)then
					dist=math.sqrt((gate.position.x-mob.position.x)*(gate.position.x-mob.position.x)+(gate.position.y-mob.position.y)*(gate.position.y-mob.position.y))
					if(nearestdist==nil or dist<nearestdist)then
						nearestdist=dist
						nearestgate=gate
					end
				end
				local gate=v.extraobjects.lockgate2
				if(gate)then
					dist=math.sqrt((gate.position.x-mob.position.x)*(gate.position.x-mob.position.x)+(gate.position.y-mob.position.y)*(gate.position.y-mob.position.y))
					if(nearestdist==nil or dist<nearestdist)then
						nearestdist=dist
						nearestgate=gate
					end
				end				
			end
			if(scenario.cpulockgates)then
				for k,v in pairs(scenario.cpulockgates)do
					local gate=v 
					if(gate)then
						dist=math.sqrt((gate.position.x-mob.position.x)*(gate.position.x-mob.position.x)+(gate.position.y-mob.position.y)*(gate.position.y-mob.position.y))
						if(nearestdist==nil or dist<nearestdist)then
							nearestdist=dist
							nearestgate=gate
						end
					end
				end
			end
			
			
			if(nearestgate)then
				nearestgate:OnClick(mob)
			else
				scenario.statuslabel:SetText("\124cffff6666Out of range\124r",2.0)
			end
			
		end
	end

end




	
do	
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="LOCKGATECOMBO"
		local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4}}
		end		
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
	end	
	
	
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_LOCKGATECOMBO(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
			
	
		local effect
		effect=ghost.extraobjects.lockgate1
		--TODO: since lock gates aren't being Setup at these coordinates, the game thinks both gates are being placed in the same location (causing warnings to pop up and wrong yaw)
		if(effect)then
			effect.position.x=args[1]
			effect.position.y=args[2]
			effect.position.z=args[3]
		end		
		effect=ghost.extraobjects.lockgate2
		if(effect)then
			effect.position.x=args[4]
			effect.position.y=args[5]
			effect.position.z=args[6]
		end		
	end		
end

do
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="LOCKGATECOMBO"
		local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4}}
		end		
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
		
	end

	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_LOCKGATECOMBO(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
		XPRACTICE.QuickPlayerDemonicGateway(scenario,ghost,args[1],args[2],args[4],args[5])
				
		if(ghost==scenario.player)then
			local dist=math.sqrt(XPRACTICE.distsqr(args[1],args[2],args[4],args[5]))
			if(dist<10)then					
				scenario.statuslabel:SetText("Warning: portal is "..string.format("%0.1f",dist).." yards away (minimum 10 in real game).",2.0)
			elseif(dist>40)then
				scenario.statuslabel:SetText("Warning: portal is "..string.format("%0.1f",dist).." yards away (maximum 40 in real game).",2.0)
			end
		end
		
	end		
end




do
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="LOCKGATETELE"
		local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR}}
		end		
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYERV2.previousmessagecode	=messagecode
	end

	
	
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_LOCKGATETELE(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end		
	
		ghost.position.x=args[1]
		ghost.position.y=args[2]
		ghost.position.z=args[3]
		ghost:FreezeOrientation(args[4])	

		local xdist=args[5]-args[1]
		local ydist=args[6]-args[2]
		local angle=math.atan2(ydist,xdist)
		local bubble=XPRACTICE.LEGACY.DemonicGatewayTravelPurple.new()
		bubble:Setup(self.environment,args[1],args[2],args[3]+2)
		bubble.player=ghost
		bubble.dest={position={x=args[5],y=args[6],z=args[7]}}
		local SPEED=60
		local dist=math.sqrt(xdist*xdist+ydist*ydist)
		bubble.expirytime=self.environment.localtime+dist/SPEED
		bubble.velocity.x=math.cos(angle)*SPEED
		bubble.velocity.y=math.sin(angle)*SPEED
		if(args[9]=="1")then
			bubble.displayobject.drawable:SetModelByFileID(607510)
		else
			bubble.displayobject.drawable:SetModelByFileID(607508)
		end
		--ghost.portaldebuff=true

		ghost.destx=nil;ghost.desty=nil;ghost.ai.targetposition=nil
		ghost.remainingreactiontime=0
	end	
	
end	

local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
	prev(self)
	local spell=XPRACTICE.Spell_Sprint.new()
	spell:Setup(self.combatmodule)
	self.combatmodule.spellbook.dashv2=spell
	
end	


do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_Sprint=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_Sprint
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Sprint"
			self.icon="interface/icons/ability_rogue_sprint.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario	
			scenario.multiplayer:FormatAndSend("SPRINT")
		end
	end	
	

	do	
		local super=XPRACTICE.WoWObject
		XPRACTICE.SprintVisualEffect=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SprintVisualEffect
		
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(166951)	--sprint_cast_base		-- projected, apparently!
			actor:SetModelByFileID(652936)	--pb_speedbuff_impact		-- no anims
			self.expirytime=self.environment.localtime+1.5
		end
				
		function class:Step(elapsed)
			super.Step(self,elapsed)
			self.position.x=self.player.position.x
			self.position.y=self.player.position.y
			self.position.z=self.player.position.z+2
			self.scale=1
		end
	end		
	
end

	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
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
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]		
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
	end

	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_SPRINT(self,sender,args)
		local scenario=self.scenario
		local player=self.allplayers[sender]	
		if(not player)then return end
		if(player:IsDeadInGame())then return end
		local auras=player.combatmodule.auras.speedboost
		--print("HandleSPRINT")
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
	
	
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="SPRINT"
		local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.argtypes={}
		end		
		XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
		
	end
