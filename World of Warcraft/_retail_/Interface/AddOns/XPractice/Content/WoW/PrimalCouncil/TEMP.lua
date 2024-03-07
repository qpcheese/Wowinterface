do
	--TODO: volatile code reuse -- only use function in multiplayer/messagehandler.lua
	-- local function IsRealOfficer(unit)
		-- unit=strsplit("-",unit)
		-- return ((UnitIsGroupLeader(unit)==true) or (UnitIsGroupAssistant(unit)==true) or not IsInGroup(unit))
	-- end

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.PRIMALCOUNCIL.Spell_SetRole=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Spell_SetRole
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Set Role)"
			--self.icon="interface/icons/inv_jewelry_talisman_06.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			if((not scenario.tempmenu.currentmenu) or scenario.tempmenu.currentmenu.menuclass~=XPRACTICE.SetRoleInterfacev2)then
				scenario.tempmenu:LoadMenu(XPRACTICE.SetRoleInterfacev2)
			else
				scenario.tempmenu:UnloadCurrentMenu()
			end
		end
	end	


	do	
		local super=XPRACTICE.Spell
		XPRACTICE.PRIMALCOUNCIL.Spell_SetSoak=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Spell_SetSoak
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Set Soaks)"
			--self.icon="interface/icons/inv_jewelry_talisman_06.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			if((not scenario.tempmenu.currentmenu) or scenario.tempmenu.currentmenu.menuclass~=XPRACTICE.SetTankSoakInterface)then
				scenario.tempmenu:LoadMenu(XPRACTICE.SetTankSoakInterface)
			else
				scenario.tempmenu:UnloadCurrentMenu()
			end
		end
	end		

	

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.PRIMALCOUNCIL.Spell_Brez=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Spell_Brez
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Brez)"
			self.icon="interface/icons/inv_jewelry_talisman_06.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario	
			scenario:Brez()
		end
	end	
	
	
	do
		local super=XPRACTICE.Spell
		XPRACTICE.PRIMALCOUNCIL.Spell_PallyBubble=XPRACTICE.inheritsFrom(super)
		
		local class=XPRACTICE.PRIMALCOUNCIL.Spell_PallyBubble
			function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Bubble)"
			self.icon="interface/icons/spell_holy_divineshield.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
		end
		
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)		
			-- targetcombat doesn't exist because this is a boss debug button.  use castercombat instead
				-- wait nvm we can't use castercombat because castercombat is spellbunny!
			local player=spellinstancepointer.castercombat.mob.scenario.player
			self.scenario.multiplayer:FormatAndSendCustom("PALLYBUBBLE")
		end
		
	--ghost.animationmodule:TryCompleteOmniSpellcast()	
	end	
	
	do
		local super=XPRACTICE.Aura
		XPRACTICE.PRIMALCOUNCIL.Aura_PallyBubble = XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Aura_PallyBubble

		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.baseduration=5.0
			self.removeondeadingame=true			
			self.tickdelay=1.0
			self.basetickrate=1.0			
			self.tickcount=0
		end			
		function class:OnApply(localtime)
			super.OnApply(self,localtime)
			local player=self.targetcombat.mob
			player.animationmodule:TryCompleteOmniSpellcast()
			--player:CreateSpeechBubble("IMMUNE")	-- don't need to announce to other players here.  fatescribe was an exception.
			local visual=XPRACTICE.PRIMALCOUNCIL.PallyBubbleVisual.new()
			visual:Setup(player.environment,player.position.x,player.position.y,player.position.z)
			visual.player=player
			self.visual=visual
					
		end

		function class:Tick(ticktime)
			self:OnTick(ticktime,1.0)
			--!!!
			--TODO: move to base aura class
			self.previousticktime=ticktime
		end		
		function class:OnTick(ticktime,percentage)
			self.tickcount=self.tickcount+1
			if(self.tickcount>=2 and self.tickcount<=4)then
				local timer=5-self.tickcount
				if(self.targetcombat.mob.scenario)then
					if(self.targetcombat.mob==self.targetcombat.mob.scenario.player)then
							-- (no speech bubbles here, blasphemy debuff comes with its own speech bubble.)
						--self.targetcombat.mob:CreateSpeechBubble(tostring(timer)) 
					end
				end
			end
		end
	end
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.PRIMALCOUNCIL.PallyBubbleVisual=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.PallyBubbleVisual
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(1127086)	--cfx_paladin_divineshield_statebase
			self.scale=1.5
		end
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.5
			self.projectileloopcustomduration=4.0
			self.projectiledespawncustomduration=2.0
		end	
		function class:Step(elapsed)
			super.Step(self,elapsed)
			self.position.x=self.player.position.x
			self.position.y=self.player.position.y
			self.position.z=self.player.position.z
			if(self.player:IsDeadInGame())then
				if(not self.toolate)then
					self.toolate=true
					self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
				end
			end
		end
	end	
	
	
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.PRIMALCOUNCIL.Spell_ChangeMap=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Spell_ChangeMap
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Change Map)"
			self.icon="interface/icons/icon_treasuremap.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario	
			local i=math.floor(math.random()*8)+1
			--print("Map?",i)
			scenario.floor:TransitionTo(i)
		end
	end
	
	
	

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.PRIMALCOUNCIL.Spell_CallToArms=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Spell_CallToArms
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="()"
			self.icon="interface/icons/ability_hunter_beastcall.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario	
			
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				self.scenario.statuslabel:SetText("Using the CALL button requires raid lead/assist.",3.0)
				return
			end
			if(GetNumGroupMembers()<=1)then
				self.scenario.statuslabel:SetText("There are no other players to call!  Create a group first.",3.0)
				return
			end
				

			if((not scenario.tempmenu.currentmenu) or scenario.tempmenu.currentmenu.menuclass~=XPRACTICE.CallToArmsInterface)then
				scenario.tempmenu:LoadMenu(XPRACTICE.CallToArmsInterface)
				scenario.tempmenu.currentmenu.extradata="CALL_TO_ARMS JOIN PRIMALCOUNCIL 1"
			else
				scenario.tempmenu:UnloadCurrentMenu()
			end			
				
		end
	end		


	do	
		local super=XPRACTICE.Spell
		XPRACTICE.PRIMALCOUNCIL.Spell_MoveBoss=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Spell_MoveBoss
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Move boss)"
			self.icon="interface/icons/inv_misc_foot_centaur.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario	
			
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				self.scenario.statuslabel:SetText("Moving the boss requires raid lead/assist.",3.0)
				return
			end
			
			local bossindex=nil
			if(self.scenario.mapindex==3)then				
				if(self.scenario.player.combatmodule.targetmob)then
					if(self.scenario.player.combatmodule.targetmob.info)then
						bossindex=self.scenario.player.combatmodule.targetmob.info.index
					end
				end
				if(not bossindex)then
					self.scenario.statuslabel:SetText("Multiple bosses exist.  You need to target something first!",3.0)
					return
				end
			end
			bossindex=bossindex or 1
			local boss=self.scenario.bosses[bossindex]
			if(boss)then				
				local picker=XPRACTICE.MousePicker.new()
				picker:Setup(scenario.game.environment_gameplay,0,0,0)
				picker.callback=function(s)
					self.scenario.multiplayer:FormatAndSendCustom("MOVE_BOSS",string.char(bossindex),picker.position.x,picker.position.y)
				end
			end
		end
	end




	do	
		local super=XPRACTICE.Spell
		XPRACTICE.PRIMALCOUNCIL.Spell_ClearAll=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Spell_ClearAll
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Clear)"
			self.icon="interface/icons/ability_iyyokuk_drum_red.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
		end		
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)
			local scenario=spellinstancepointer.castercombat.mob.scenario
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				scenario.statuslabel:SetText("That action requires raid lead/assist.",3.0)
				return
			end
			self.scenario.multiplayer:FormatAndSendCustom("CLEAR_ALL")
		end
	end		
	
	local roomnumber=XPRACTICE.PRIMALCOUNCIL.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.PRIMALCOUNCIL.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="CLEAR_ALL"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.PRIMALCOUNCIL.Multiplayer	
	function class.HandleCustom_CLEAR_ALL(self,sender,args)		
		local scenario=self.scenario
		for k,v in pairs(scenario.multiplayer.allplayers)do
			local auras=v.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.PRIMALCOUNCIL.Aura_ConductiveMark)
			for i=1,#auras do
				auras[i]:Die()
			end
		end		
		for i=1,#scenario.earthenpillars do
			scenario.earthenpillars[i]:StartDespawning()
		end
		scenario.earthenpillars={}
		for i=1,#scenario.firezones do
			scenario.firezones[i]:StartDespawning()
		end
		scenario.firezones={}
	end			
			
end