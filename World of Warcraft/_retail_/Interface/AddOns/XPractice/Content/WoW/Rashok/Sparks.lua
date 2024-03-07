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

	local roomnumber=XPRACTICE.RASHOK.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASHOK.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="SPARKS"
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
	
	local class=XPRACTICE.RASHOK.Multiplayer	
	function class.HandleCustom_SPARKS(self,sender,args)		
		local scenario=self.scenario
		local boss=scenario.bosses[1]
		XPRACTICE.QuickCast(boss.combatmodule.sparks,scenario,boss,args)
	end			
		


	do	
		local super=XPRACTICE.Spell
		XPRACTICE.RASHOK.Spell_Sparks=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.Spell_Sparks
		function class:SetCustomInfo()
			super.SetCustomInfo(self)			
			self.name="Volatile Current"
			self.icon="interface/icons/spell_nature_stormreach.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=3.0;self.basechannelduration=nil;self.basechannelticks=7
			self.usablewhilemoving=false
		end
		function class:Broadcast_v2(scenario)		
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				scenario.statuslabel:SetText("That action requires raid lead/assist.",3.0)
				return
			end						
			self.scenario.multiplayer:FormatAndSendCustom("SPARKS")
		end
		function class:CastingAnimationFunction(spellinstancepointer)				
			spellinstancepointer.castercombat.mob.animationmodule:TryDirectedSpellcast()
		end
		function class:StartCastingEffect(spellinstancepointer)
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local args=spellinstancepointer.args
			local mob=spellinstancepointer.castercombat.mob
			
			for k,v in pairs(scenario.multiplayer.allplayers)do
				if(not v:IsDeadInGame())then
					local aura=v.combatmodule:ApplyAuraByClass(XPRACTICE.RASHOK.Aura_Spark,v.combatmodule,v.environment.localtime)
					aura.scenario=v.scenario
					aura.player=v
					if(aura.scenario.pauseallmechanics)then
						aura.ignorepauses=true
					end
				end
			end
		end			
	end
	
	

	do
		local super=XPRACTICE.PauseableAura
		XPRACTICE.RASHOK.Aura_Spark=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.Aura_Spark
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.baseduration=3.0
		end
		function class:OnApply(localtime)
			super.OnApply(self,localtime)
			local player=self.targetcombat.mob
			local gfx=XPRACTICE.RASHOK.SparkTelegraph.new()
			gfx:Setup(player.environment,player.position.x,player.position.y,0.1)
			gfx.aura=self
			gfx.player=player			
		end			
		function class:OnRemove()
			super.OnRemove(self)
			local player=self.targetcombat.mob
			if(player==player.scenario.player)then
				self.scenario.multiplayer:FormatAndSendCustom("SPARK_SPAWN",player.position.x,player.position.y)			
			end
			--TODO: actual in-game ring explosions+spark spawns appear to be staggered across 0.5-1.0ish sec
		end
	end
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASHOK.SparkTelegraph=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.SparkTelegraph
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=1.0/4.5*8.0
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
			if(self.aura)then
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
	end
	
	
	
	
	
	
	
	
	local roomnumber=XPRACTICE.RASHOK.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASHOK.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="SPARK_SPAWN"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=false
			self.argtypes={{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},	
							{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.RASHOK.Multiplayer	
	function class.HandleCustom_SPARK_SPAWN(self,sender,args)		
		local scenario=self.scenario
		local player=scenario.multiplayer.allplayers[sender]
		if(player)then
			--player.position.x=args[1]
			--player.position.y=args[2]
			
			local fx=XPRACTICE.RASHOK.SparkSpawnFX.new()
			fx:Setup(player.environment,args[1],args[2],1)
			local spark=XPRACTICE.RASHOK.VolatileSpark.new()
			local x,y=XPRACTICE.RandomPointInCircle(args[1],args[2],4)
			spark:Setup(player.environment,x,y,2)
			spark.scenario=scenario
			if(scenario.pauseallmechanics)then
				spark.ignorepauses=true
			end
		end
	end		




	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASHOK.SparkSpawnFX=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.SparkSpawnFX
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=1
			actor:SetModelByFileID(166493)	--lightning_ring_nova
			self.expirytime=self.environment.localtime+1.5
		end						
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=nil
			self.projectiledespawncustomduration=0.25
		end	
		function class:Step(elapsed)
			super.Step(self,elapsed)
			if(self.aura)then
				if(self.aura.dead)then
					if(not self.despawning)then
						self.despawning=true
						self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
					end				
				end
			end
		end
	end
	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASHOK.VolatileSpark=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.VolatileSpark
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=1
			actor:SetModelByFileID(4547489)	--unk
			self.realalivetime=0
			self.alivetime=0
			self.lifetime=1.5+math.random()*1.0
		end						
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Projectile2SpawnCustomDuration)
			self.projectilespawncustomduration=nil
			self.projectileloopcustomduration=nil
			self.projectiledespawncustomduration=0.25
		end	
		function class:Step(elapsed)
			super.Step(self,elapsed)
			self.realalivetime=self.realalivetime+elapsed
			if(self.stage~=2 and self.realalivetime>0.5)then
				self.stage=2
				self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileLoopCustomDuration)
			end
			if(self.scenario.pauseallmechanics==false or self.ignorepauses==true)then
				self.alivetime=self.alivetime+elapsed
				if(self.despawning~=true and self.alivetime>=self.lifetime)then
					self.despawning=true
					self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
				end				
			end
		end
	end	

end