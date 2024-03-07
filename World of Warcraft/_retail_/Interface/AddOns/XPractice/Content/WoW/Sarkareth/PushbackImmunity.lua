
	do
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_PushbackImmunity=XPRACTICE.inheritsFrom(super)
		
		local class=XPRACTICE.Spell_PushbackImmunity
			function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Death's Advance"
			self.icon="interface/icons/spell_shadow_demonicempathy.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
		
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)		
			-- targetcombat doesn't exist because this is a boss debug button.  use castercombat instead
				-- wait nvm we can't use castercombat because castercombat is spellbunny!
			local player=spellinstancepointer.castercombat.mob.scenario.player
			player.scenario.multiplayer:FormatAndSend("PUSHBACKIMMUNITY")
		end
		
		--TODO: not supposed to be any animation on casting
	end	
	
	do
		local super=XPRACTICE.Aura
		XPRACTICE.Aura_PushbackImmunity = XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Aura_PushbackImmunity

		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.baseduration=10.0
			self.removeondeadingame=true			
			self.tickdelay=1.0
			self.basetickrate=1.0			
			self.tickcount=0
		end			
		function class:OnApply(localtime)
			super.OnApply(self,localtime)
			local player=self.targetcombat.mob
			local visual=XPRACTICE.PushbackImmunityVisual.new()
			visual:Setup(player.environment,player.position.x,player.position.y,player.position.z+0.1)
			visual.player=player
			self.visual=visual					
		end

	
	end
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.PushbackImmunityVisual=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PushbackImmunityVisual
		function class:SetActorAppearanceViaOwner(actor)
			--actor:SetModelByFileID(240840)	--deathknight_hysteria until we find the actual red-circle-at-feet thing
			actor:SetModelByFileID(4008207)	--cfx_venthyr_deathknight_statebase_lownoise (this isn't it either)
			self.scale=0.5
			self.alpha=1
			self.displayedpositionoffset={x=0,y=-.5,z=0}
		end
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.75
			self.projectileloopcustomduration=9.5
			self.projectiledespawncustomduration=0.3
		end	
		function class:Step(elapsed)
			super.Step(self,elapsed)
			self.position.x=self.player.position.x
			self.position.y=self.player.position.y
			self.position.z=self.player.position.z
			if(self.player:IsDeadInGame())then
				self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
			end
		end
	end	
	
	
	
	
	local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
		prev(self)
		local spell=XPRACTICE.Spell_PushbackImmunity.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.pushbackimmunity=spell
	end	
	

	do
		local roomnumber=XPRACTICE.SARKARETH2.NPCID
		local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.SARKARETH2.NPCID)			
		local messagecode=XPRACTICE.MULTIPLAYERV2.previousmessagecode	
		
		messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="PUSHBACKIMMUNITY"
		local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
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
	
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2.Handle_PUSHBACKIMMUNITY(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		
		-- local spell=ghost.combatmodule.spellbook.pushbackimmunity
		-- local queuepointer=spell:NewQueue()
		-- queuepointer.castercombat=ghost.combatmodule
		-- local spellinstance=spell:NewCast(queuepointer)
		-- spellinstance.targetcombat=ghost.combatmodule		
		-- local castendtime=ghost.environment.localtime
		-- spellinstance:CompleteCasting(castendtime,spellinstance)
		
		--print("!!!")
		
		ghost.combatmodule:ApplyAuraByClass(XPRACTICE.Aura_PushbackImmunity,ghost.combatmodule,ghost.environment.localtime)
	
		local effect=ghost.extraobjects.pushbackimmunity
		if(effect)then
			effect.position.x=args[1]
			effect.position.y=args[2]
			effect.position.z=args[3]
			effect.orientation_displayed.yaw=args[4]
		end

	end	
	
	