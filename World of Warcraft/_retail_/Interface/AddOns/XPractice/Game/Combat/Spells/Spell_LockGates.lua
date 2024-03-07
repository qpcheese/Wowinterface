local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
	prev(self)
	local spell=XPRACTICE.Spell_LockGateItem.new()
	spell:Setup(self.combatmodule)
	self.combatmodule.spellbook.gateitem=spell
end	

--TODO NEXT: send extraobjects after IEXIST!
do
	do
		local super=XPRACTICE.Mob
		local class=XPRACTICE.LEGACY.DemonicGatewayPurple		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			if(self.setorientationnexttick)then
				self.setorientationnexttick=false
				local partner=self.partner
				if(partner)then
					local angle=math.atan2(partner.position.y-self.position.y,partner.position.x-self.position.x)
					self.orientation.yaw=angle
				end
			end
		end
		local prev=class.TeleportToOtherGateway
		function class:TeleportToOtherGateway(player)
			if(self.partner)then
				prev(self,player)
				player.portaldebuff=false
				local scenario=player.scenario
				if(scenario.multiplayer)then
					scenario.multiplayer:FormatAndSend("LOCKGATETELE",self.position.x,self.position.y,self.position.z,scenario.player.orientation.yaw,self.partner.position.x,self.partner.position.y,self.partner.position.z,self.partner.orientation.yaw,"1")
				end
			else
				self:CreateSpeechBubble("No portal linked to this one!")
			end
		end
		
		local super=XPRACTICE.Mob
		local class=XPRACTICE.LEGACY.DemonicGatewayGreen		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			if(self.setorientationnexttick)then
				self.setorientationnexttick=false
				local partner=self.partner
				if(partner)then
					local angle=math.atan2(partner.position.y-self.position.y,partner.position.x-self.position.x)
					self.orientation.yaw=angle
				end
			end
		end		
		local prev=class.TeleportToOtherGateway
		function class:TeleportToOtherGateway(player)
			if(self.partner)then
				prev(self,player)
				player.portaldebuff=false
				local scenario=player.scenario
				if(scenario.multiplayer)then
					scenario.multiplayer:FormatAndSend("LOCKGATETELE",self.position.x,self.position.y,self.position.z,scenario.player.orientation.yaw,self.partner.position.x,self.partner.position.y,self.partner.position.z,self.partner.orientation.yaw,"2")
				end
			else
				self:CreateSpeechBubble("No portal linked to this one!")
			end
		end		
	end
	
	do
		local class=XPRACTICE.LEGACY.DemonicGatewayTravelPurple
		local prev=class.Step
		function class:Step(elapsed)
			prev(self,elapsed)
			if(not self.yawadjusted)then
				self.yawadjusted=true
				self.orientation_displayed.yaw=math.atan2(self.velocity.y,self.velocity.x)+math.pi/2
			end
		end
	end

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_LockGate1=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_LockGate1
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Demonic Gateway (Purple)"
			self.icon="interface/icons/spell_warlock_demonicportal_purple.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basechannelduration=nil;self.basechannelticks=nil			
			--self.basecooldown=10.0
			--self.basecastduration=2.0;
			self.basecastduration=0.0
			self.basecooldown=1.0
			self.usablewhilemoving=true
		end
		function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
			local scenario=spellinstance.castercombat.mob.scenario
			local mob=spellinstance.castercombat.mob
			if(mob:IsDeadInGame())then return end
			scenario.multiplayer:FormatAndSend("LOCKGATESET",scenario.player.position.x,scenario.player.position.y,scenario.player.position.z,scenario.player.orientation.yaw,"1")
		end			
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)				
			local mob=spellinstancepointer.castercombat.mob
			if(mob:IsDeadInGame())then return end
			local scenario=mob.scenario	
			
			mob.animationmodule:ResetAnimation(XPRACTICE.AnimationList.SpellCastOmni)
			local tele=mob.extraobjects.lockgate1
			if(tele)then
				tele.fadestarttime=mob.environment.localtime
				tele.expirytime=tele.environment.localtime+0.25
				tele.clickzone:Die()
			end
			
			local tele=XPRACTICE.LEGACY.DemonicGatewayPurple.new()
			tele.owner=mob
			tele:Setup(mob.environment,mob.position.x,mob.position.y,mob.position.z)
			tele:FreezeOrientation(mob.orientation.yaw)
			mob.extraobjects.lockgate1=tele
			local mobclickzone=XPRACTICE.MobClickZone.new()
			mobclickzone:Setup(scenario.game.environment_gameplay,tele)
			tele.clickzone=mobclickzone
			
			local partner=mob.extraobjects.lockgate2
			if(partner)then
				tele.partner=partner
				partner.partner=tele
				local angle=math.atan2(tele.position.y-partner.position.y,tele.position.x-partner.position.x)
				tele:FreezeOrientation(angle+math.pi)
				--partner.orientation.yaw=angle
				partner.setorientationnexttick=true
				
				local dist=math.sqrt((tele.position.x-partner.position.x)*(tele.position.x-partner.position.x)+(tele.position.y-partner.position.y)*(tele.position.y-partner.position.y))
				if(mob==scenario.player)then
					if(dist<10)then					
						scenario.statuslabel:SetText("Warning: portal is "..string.format("%0.1f",dist).." yards away (minimum 10 in real game).",2.0)
					elseif(dist>40)then
						scenario.statuslabel:SetText("Warning: portal is "..string.format("%0.1f",dist).." yards away (maximum 40 in real game).",2.0)
					end
				end
			end			
		end
	end
	
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_LockGate2=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_LockGate2
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Demonic Gateway (Green)"
			self.icon="interface/icons/spell_warlock_demonicportal_green.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basechannelduration=nil;self.basechannelticks=nil			
			--self.basecooldown=10.0
			--self.basecastduration=2.0;
			self.basecastduration=0.0
			self.basecooldown=1.0
			self.usablewhilemoving=true
		end
		function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
			local scenario=spellinstance.castercombat.mob.scenario
			local mob=spellinstance.castercombat.mob
			if(mob:IsDeadInGame())then return end
			scenario.multiplayer:FormatAndSend("LOCKGATESET",scenario.player.position.x,scenario.player.position.y,scenario.player.position.z,scenario.player.orientation.yaw,"2")
		end			
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)				
			local mob=spellinstancepointer.castercombat.mob
			if(mob:IsDeadInGame())then return end
			local scenario=mob.scenario	
			mob.animationmodule:ResetAnimation(XPRACTICE.AnimationList.SpellCastOmni)
			local tele=mob.extraobjects.lockgate2
			if(tele)then
				tele.fadestarttime=mob.environment.localtime
				tele.expirytime=tele.environment.localtime+0.25
				tele.clickzone:Die()
			end
			
			local tele=XPRACTICE.LEGACY.DemonicGatewayGreen.new()
			tele.owner=mob
			tele:Setup(mob.environment,mob.position.x,mob.position.y,mob.position.z)
			tele:FreezeOrientation(mob.orientation.yaw)
			mob.extraobjects.lockgate2=tele
			local mobclickzone=XPRACTICE.MobClickZone.new()
			mobclickzone:Setup(scenario.game.environment_gameplay,tele)
			tele.clickzone=mobclickzone
			
			local partner=mob.extraobjects.lockgate1
			if(partner)then
				tele.partner=partner
				partner.partner=tele
				local angle=math.atan2(tele.position.y-partner.position.y,tele.position.x-partner.position.x)
				tele:FreezeOrientation(angle+math.pi)
				--partner.orientation.yaw=angle
				partner.setorientationnexttick=true
				
				local dist=math.sqrt((tele.position.x-partner.position.x)*(tele.position.x-partner.position.x)+(tele.position.y-partner.position.y)*(tele.position.y-partner.position.y))
				if(mob==scenario.player)then
					if(dist<10)then					
						scenario.statuslabel:SetText("Warning: portal is "..string.format("%0.1f",dist).." yards away (minimum 10 in real game).",2.0)
					elseif(dist>40)then
						scenario.statuslabel:SetText("Warning: portal is "..string.format("%0.1f",dist).." yards away (maximum 40 in real game).",2.0)
					end
				end				
			end
			
			
		end
	end
		

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
		function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
			local scenario=spellinstance.castercombat.mob.scenario
			local mob=spellinstance.castercombat.mob
			if(mob:IsDeadInGame())then return end
			
		end			
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
				if(gate and gate.phase==mob.phase)then
					dist=math.sqrt((gate.position.x-mob.position.x)*(gate.position.x-mob.position.x)+(gate.position.y-mob.position.y)*(gate.position.y-mob.position.y))
					if(nearestdist==nil or dist<nearestdist)then
						nearestdist=dist
						nearestgate=gate
					end
				end
				local gate=v.extraobjects.lockgate2
				if(gate and gate.phase==mob.phase)then
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
					if(gate and gate.phase==mob.phase)then
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



	local prev=XPRACTICE.MULTIPLAYER.MultiplayerGhost.CreateCombatModule
	function XPRACTICE.MULTIPLAYER.MultiplayerGhost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_LockGate1.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.lockgate1=spell
		local spell=XPRACTICE.Spell_LockGate2.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.lockgate2=spell		
	end	
	
	
	do
		local messagecode=XPRACTICE.MULTIPLAYER.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="LOCKGATESET"
		local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6},
							{XPRACTICE.MULTIPLAYER.Datatypes.CHAR}}
		end		
		XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYER.previousmessagecode=messagecode
	end	
	
	
	function XPRACTICE.MULTIPLAYER.Multiplayer.Handle_LOCKGATESET(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
		local spell
		if(args[5]=="1")then
			spell=ghost.combatmodule.spellbook.lockgate1
		else
			spell=ghost.combatmodule.spellbook.lockgate2
		end
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=ghost.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=ghost.combatmodule		
		local castendtime=ghost.environment.localtime
		spellinstance:CompleteCasting(castendtime,spellinstance)
	
		local effect
		if(args[5]=="1")then
			effect=ghost.extraobjects.lockgate1
		else
			effect=ghost.extraobjects.lockgate2
		end
		if(effect)then
			effect.position.x=args[1]
			effect.position.y=args[2]
			effect.position.z=args[3]
			if(not effect.partner)then
				effect:FreezeOrientation(args[4])
			end
		end

	end	
	
	
	do
		local messagecode=XPRACTICE.MULTIPLAYER.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="LOCKGATECOMBO"
		local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}}
		end		
		XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYER.previousmessagecode=messagecode
	end	
	
	
	function XPRACTICE.MULTIPLAYER.Multiplayer.Handle_LOCKGATECOMBO(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
		local spell
		spell=ghost.combatmodule.spellbook.lockgate1
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=ghost.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=ghost.combatmodule		
		local castendtime=ghost.environment.localtime
		spellinstance:CompleteCasting(castendtime,spellinstance)
		
		spell=ghost.combatmodule.spellbook.lockgate2
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=ghost.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=ghost.combatmodule		
		local castendtime=ghost.environment.localtime
		spellinstance:CompleteCasting(castendtime,spellinstance)		
	
		local effect
		effect=ghost.extraobjects.lockgate1
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
		local messagecode=XPRACTICE.MULTIPLAYER.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="LOCKGATETELE"
		local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6},
							{XPRACTICE.MULTIPLAYER.Datatypes.CHAR}}
		end		
		XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYER.previousmessagecode=messagecode
	end

	
	
	function XPRACTICE.MULTIPLAYER.Multiplayer.Handle_LOCKGATETELE(self,sender,args)
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