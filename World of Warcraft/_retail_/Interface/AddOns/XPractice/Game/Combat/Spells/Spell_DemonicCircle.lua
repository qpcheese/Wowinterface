--TODO NEXT: send extraobjects after IEXIST!
do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_DemonicCircle=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_DemonicCircle
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Demonic Circle"
			self.icon="interface/icons/spell_shadow_demoniccirclesummon.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.5;self.basechannelduration=nil;self.basechannelticks=nil
			--self.basecooldown=10.0
			self.basecooldown=1.0
			--TODO: can't cast while deadingame...
		end
		function class:CastingAnimationFunction(spellinstancepointer)	
			spellinstancepointer.castercombat.mob.animationmodule:TryOmniSpellcast()
		end				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)				
			local mob=spellinstancepointer.castercombat.mob
			if(mob:IsDeadInGame())then return end
			local scenario=mob.scenario	
			mob.animationmodule:ResetAnimation(XPRACTICE.AnimationList.SpellCastOmni)
			local circle=mob.extraobjects.demoniccircle
			if(circle)then
				circle.stage=3 	-- this is necessary if basecooldown is low enough, to prevent anim 147 from overriding 157
				circle.displayobject.drawable:SetAnimation(157)
				circle.expirytime=circle.environment.localtime+2.0
			end					
			
			local circle=XPRACTICE.DemonicCircleEffect.new()
			circle:Setup(mob.environment,mob.position.x,mob.position.y,0)
			circle.orientation_displayed.yaw=mob.orientation.yaw
			mob.extraobjects.demoniccircle=circle
		end
		
		function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
			local scenario=spellinstance.castercombat.mob.scenario
			local mob=spellinstance.castercombat.mob
			if(mob:IsDeadInGame())then return end
			scenario.multiplayer:FormatAndSend("LOCKSET",scenario.player.position.x,scenario.player.position.y,scenario.player.orientation.yaw)
		end		
	end	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.DemonicCircleEffect=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.DemonicCircleEffect
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.scale=1
			self.alivetime=0
			self.stage=1
		end
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(165920)	--demoniccirclesummon_base (145,147,157)
			--actor:SetModelByUnit("player")	--demoniccirclesummon_base (145,147,157)
			
			-- there is also a file labeled "demoniccirclesummon_teleport" but it doesn't appear to be relevant
			
		end	
		function class:SetDefaultAnimation()
			self.animationmodule.Step=function(elapsed)return end
			self.displayobject.drawable:SetAnimation(145)
		end		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			
			self.alivetime=self.alivetime+elapsed
			if(self.stage==1)then
				if(self.alivetime>3.0)then
					self.stage=2
					self.displayobject.drawable:SetAnimation(147)
				end
			end
		end
	
	end

	local prev=XPRACTICE.MULTIPLAYER.MultiplayerGhost.CreateCombatModule
	function XPRACTICE.MULTIPLAYER.MultiplayerGhost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_DemonicCircle.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.demoniccircle=spell
	end	
	
	function XPRACTICE.MULTIPLAYER.Multiplayer.Handle_LOCKSET(self,sender,args)
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
		local messagecode=XPRACTICE.MULTIPLAYER.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="LOCKSET"
		local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6}}
		end		
		XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYER.previousmessagecode=messagecode
	end
	
end


do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_DemonicCircleTeleport=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_DemonicCircleTeleport
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Demonic Circle: Teleport"
			self.icon="interface/icons/spell_shadow_demoniccircleteleport.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
			--self.basecooldown=30.0
			self.basecooldown=4.0
		end
		-- Returns nil if spell can be cast; otherwise returns error code.
		function class:CheckSpecialCastConditions(castercombat,targetcombat)
			--override; don't call super when overriding
			local mob=castercombat.mob
			local circle=mob.extraobjects.demoniccircle
			if(circle)then
				local distsqr=(mob.position.x-circle.position.x)*(mob.position.x-circle.position.x)+(mob.position.y-circle.position.y)*(mob.position.y-circle.position.y)
				if(distsqr>40*40)then
					local scenario=mob.scenario
					if(scenario)then scenario.statuslabel:SetText("\124cffff6666Out of range\124r",2.0) end
					return "Out of range"
				end
			
				return nil
			end
			local scenario=mob.scenario
			if(scenario)then scenario.statuslabel:SetText("\124cffff6666You can't do that yet\124r (use LOCK SET first)",2.0) end
			return "You can't do that yet"
		end		
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)				
			local mob=spellinstancepointer.castercombat.mob
			if(mob:IsDeadInGame())then return end
			local scenario=mob.scenario	
			
			local circle=mob.extraobjects.demoniccircle
			if(circle)then
				local effect=XPRACTICE.BlinkEffect.new()
				effect:Setup(mob.environment,mob.position.x,mob.position.y,1)	
	
				mob.position.x=circle.position.x
				mob.position.y=circle.position.y
				mob.position.z=circle.position.z
				mob.velocity.x=0;mob.velocity.y=0;mob.velocity.z=0
				mob:FreezeOrientation(circle.orientation_displayed.yaw)
				if(mob==scenario.player)then
					mob.environment.cameramanager.camera.orientation.yaw=mob.orientation.yaw
				end
				mob.animationmodule:ResetAnimation(XPRACTICE.AnimationList.SpellCastOmni)
				local effect=XPRACTICE.BlinkEffect.new()
				effect:Setup(mob.environment,mob.position.x,mob.position.y,1)				
				--spellinstancepointer.successful=true
			else
				-- if(mob==scenario.player)then
					-- scenario.statuslabel:SetText("\"\124cffff6666You can't do that yet\124r\" (use LOCK SET first)",2.0)
				-- end
				--spellinstancepointer.successful=false
				--TODO: don't set cooldown either
			end						
		end
		
		function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
			local mob=spellinstance.castercombat.mob
			if(mob:IsDeadInGame())then return end
			--if(spellinstance.successful)then
			local circle=spellinstance.castercombat.mob.extraobjects.demoniccircle
			if(circle)then
				local scenario=spellinstance.castercombat.mob.scenario
				scenario.multiplayer:FormatAndSend("LOCKTELE",circle.position.x,circle.position.y,circle.orientation.yaw)
			end
			--end
		end		
	end	
	
	local prev=XPRACTICE.MULTIPLAYER.MultiplayerGhost.CreateCombatModule
	function XPRACTICE.MULTIPLAYER.MultiplayerGhost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_DemonicCircleTeleport.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.demoniccircleteleport=spell
	end		

	
	function XPRACTICE.MULTIPLAYER.Multiplayer.Handle_LOCKTELE(self,sender,args)
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
		local messagecode=XPRACTICE.MULTIPLAYER.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="LOCKTELE"
		local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6}}
		end		
		XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]			
		
		XPRACTICE.MULTIPLAYER.previousmessagecode=messagecode
	end

end