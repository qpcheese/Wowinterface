--TODO: taunt will desync if someone shows up late

do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.RASZAGETH.Spell_TauntBoss=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.Spell_TauntBoss
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Taunt"
			self.icon="interface/icons/spell_nature_reincarnation.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.basecooldown=6.0
		end
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)
			local scenario=spellinstancepointer.castercombat.mob.scenario
			-- if(scenario.player.rolepointer and scenario.player.rolepointer.mob==scenario.boss)then
				-- scenario.statuslabel:settext("but... you are the boss.",3.0)
				-- return
			-- end			
			-- if(scenario.player.spectator)then
				-- scenario.statuslabel:settext("the boss can't target spectators.  set role first.",3.0)
				-- return
			-- end
			self.scenario.multiplayer:FormatAndSendCustom("TAUNTBOSS",scenario.player.position.x,scenario.player.position.y)			
		end
	end	
end

do
	local roomnumber=XPRACTICE.RASZAGETH.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASZAGETH.NPCID)	
	do	
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode		
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="TAUNTBOSS"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=false
			self.argtypes={{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4}}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]		
							
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
	end
	
	local class=XPRACTICE.RASZAGETH.Multiplayer
	function class.HandleCustom_TAUNTBOSS(self,sender,args)
		local scenario=self.scenario
		local player=self.allplayers[sender]		
		if(not player)then return end
		if(player:IsDeadInGame())then return end
		--if(player.spectator)then return end	
		local boss=scenario.bosses[1]
		player:CreateSpeechBubble(sender.." taunts "..boss.playername)
		boss.combatmodule.tauntmovetarget=player
		boss:SetTargetMob(player)
		boss.combatmodule:StartAutoAttacking()
		player.combatmodule:ApplyAuraByClass(XPRACTICE.RASZAGETH.Aura_TauntBoss,boss.combatmodule,player.environment.localtime)
		
		if(true)then
			local destx
			local desty
			local distx=args[1]-boss.position.x
			local disty=args[2]-boss.position.y
			local dist=math.sqrt(distx*distx+disty*disty)
			local radius=boss.chaseradius
			local t=math.atan2(disty,distx)
			destx=boss.position.x+math.cos(t)*(dist-radius)
			desty=boss.position.y+math.sin(t)*(dist-radius)
			if(dist>radius)then
				--TODO: check if dist>radius BEFORE sending MOVEBOSS_TAUNTED to prevent suggestmode desync
				boss:SuggestDestination(destx,desty,0,sender)	-- 0: move immediately
			else
				-- don't need to turn toward tank.  murloc handles it automatically
				--boss:SuggestOrientation(math.atan2(disty,distx),0,sender)
			end
		end
	end			
end




do
	local super=XPRACTICE.Aura
	XPRACTICE.RASZAGETH.Aura_TauntBoss = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.RASZAGETH.Aura_TauntBoss
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.destination={x=0,y=0,z=0}
		self.baseduration=nil
		self.basetickrate=2.0
	end
	
	function class:Tick(ticktime)
		self:OnTick(ticktime,1.0)
		--!!!
		--TODO: move to base aura class
		self.previousticktime=ticktime
	end		
	

	function class:OnTick(ticktime,percentage)
		super.OnTick(self,ticktime,percentage)
		local scenario=self.castercombat.mob.scenario
		if(self.castercombat.tauntmovetarget==scenario.player and self.castercombat.mob.ai.suggestmode)then
			scenario.multiplayer:FormatAndSendCustom("MOVEBOSS_TAUNTED",scenario.player.position.x,scenario.player.position.y)
		else
			self:Die()
		end
	end
	
	

end

do
	local roomnumber=XPRACTICE.RASZAGETH.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASZAGETH.NPCID)	
	do	
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="MOVEBOSS_TAUNTED"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=false
			self.argtypes={{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4}}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]		
							
		XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode
	end
	
	local class=XPRACTICE.RASZAGETH.Multiplayer
	function class.HandleCustom_MOVEBOSS_TAUNTED(self,sender,args)
		local scenario=self.scenario
		local player=self.allplayers[sender]
		if(not player)then return end
		if(player:IsDeadInGame())then return end
		local boss=scenario.bosses[1]
	
		--TODO: consider skipping this check maybe; then players who enter late will know who's taunted
		if(boss.combatmodule.tauntmovetarget==player)then
			local destx
			local desty
			local distx=args[1]-boss.position.x
			local disty=args[2]-boss.position.y
			local dist=math.sqrt(distx*distx+disty*disty)
			if(dist<0.1)then return end
			--print("Actual dist:",dist)
			local radius=boss.chaseradius	
			if(dist>radius+0.5)then
				--print("Chase dist:",dist-radius)
				local t=math.atan2(disty,distx)
				destx=boss.position.x+math.cos(t)*(dist-radius)
				desty=boss.position.y+math.sin(t)*(dist-radius)			
				--TODO: check if dist>radius BEFORE sending MOVEBOSS_TAUNTED to prevent suggestmode desync
				boss:SuggestDestination(destx,desty,0,sender)	-- 0: move immediately
			else
				-- don't need to turn toward tank.  murloc handles it automatically
				--boss:SuggestOrientation(math.atan2(disty,distx),0,sender)
			end
		end
	end			

end