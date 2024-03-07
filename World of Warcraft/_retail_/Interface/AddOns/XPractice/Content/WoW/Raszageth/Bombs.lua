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
		local messagename="BOMBS"
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
	
	local class=XPRACTICE.RASZAGETH.Multiplayer	
	function class.HandleCustom_BOMBS(self,sender,args)		
		--print("casting BOMBS:",args[1],args[2],args[3])
		local scenario=self.scenario
		local boss=scenario.bosses[1]
		XPRACTICE.QuickCast(boss.combatmodule.bombs,scenario,boss,args)
	end			
		

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.RASZAGETH.Spell_Bombs=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.Spell_Bombs
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Static Charge"
			self.icon="interface/icons/spell_shaman_staticshock.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
		function class:Broadcast_v2(scenario)		
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				scenario.statuslabel:SetText("That action requires raid lead/assist.",3.0)
				return
			end
			--TODO: rotate player coordinates 30 degrees before assigning positions
			local args={"XXXXXXXXXXXXXXXX","XXXXXXXXXXXXXXXX","XXXXXXXXXXXXXXXX"}
			local allplayerscopy={}
			local targets={}
			for k,v in pairs(scenario.multiplayer.allplayers) do				
				if(not v:IsDeadInGame())then
					if(not v.markedastank)then
						tinsert(allplayerscopy,v)
					end
				end
			end	
			XPRACTICE.ShuffleList(allplayerscopy)
			for i=1,3 do
				if(i<=#allplayerscopy)then
					tinsert(targets,allplayerscopy[i])
				end
			end
			table.sort(targets,function(a,b)return a.position.x<b.position.x end)
			if(#targets==3)then
				for i=1,#targets do
					args[i]=targets[i].paddedguid
				end
			elseif(#targets==2)then
				args[1]=targets[1].paddedguid
				args[3]=targets[2].paddedguid
			elseif(#targets==1)then
				args[2]=targets[1].paddedguid
			end			
			self.scenario.multiplayer:FormatAndSendCustom("BOMBS",unpack(args))			
		end
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local args=spellinstancepointer.args
			--print("Conductive Mark",args[1],args[2],args[3])
			for i=1,3 do
				local guid=args[i]
				local target=scenario.multiplayer.guidpointers[guid]
				if(target and not target:IsDeadInGame())then
					local aura=target.combatmodule:ApplyAuraByClass(XPRACTICE.RASZAGETH.Aura_Bomb,target.combatmodule,target.environment.localtime)
					aura.scenario=target.scenario
					if(target.scenario.pauseallmechanics)then							
						aura.ignorepauses=true
					end
					local dir=""
					if(i==1)then dir="LEFT"
					elseif(i==2)then dir="BACK"
					elseif(i==3)then dir="RIGHT"
					end
					local name1,name2=strsplit("-",target.playername)
					
					target:CreateSpeechBubble(name1.." - "..dir)						
					if(target==scenario.player)then
						local iconsize="20"
						local icon="\124T"..self.icon..":"..iconsize.."\124t"
						local link="\124cffff0000\124Hspell:381615\124h[Static Charge]\124h\124r"		--TODO: get Mythic link instead of Normal, if possible
						local message=icon.." You are targeted with "..link.."!"
						XPRACTICE_RaidBossEmote(message,5.0,true)
						scenario.bomblabel:SetText(dir,8.0)
					end			
				end
			end	
		end
	end
	
	


	do
		local super=XPRACTICE.PauseableAura
		XPRACTICE.RASZAGETH.Aura_Bomb=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.Aura_Bomb
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.baseduration=8.0
			self.basetickrate=1.0
		end
		function class:OnApply(localtime)
			super.OnApply(self,localtime)
			local player=self.targetcombat.mob
			local gfx=XPRACTICE.RASZAGETH.BombStatic.new()
			gfx:Setup(player.environment,player.position.x,player.position.y,0.1)
			gfx.aura=self
			gfx.player=player
			local gfx=XPRACTICE.RASZAGETH.BombRing.new()
			gfx:Setup(player.environment,player.position.x,player.position.y,0.1)
			gfx.aura=self
			gfx.player=player		
			local gfx=XPRACTICE.RASZAGETH.BombFalloffWarning.new()
			gfx:Setup(player.environment,player.position.x,player.position.y,0.1)
			gfx.aura=self
			gfx.player=player				
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
			if(self.tickcount>=6 and self.tickcount<=9)then
				local message=tostring(1+8-self.tickcount)
				self.targetcombat.mob:CreateSpeechBubble(message,1.0)
			end
		end
	end


	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASZAGETH.BombFalloffWarning=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.BombFalloffWarning
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=2.0
			--actor:SetModelByFileID(2564324)	--8fx_rl_falloff_player_state_lightning
			actor:SetModelByFileID(3039004)	--8fx_rl_falloff_state_lightning
		end						
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Projectile2SpawnCustomDuration)
			self.projectilespawncustomduration=2.0
			self.projectileloopcustomduration=1.0
			self.projectiledespawncustomduration=1.0
		end	
		function class:Step(elapsed)
			super.Step(self,elapsed)
			self.position.x=self.player.position.x
			self.position.y=self.player.position.y
		end
	end

	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASZAGETH.BombRing=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.BombRing
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=4.0
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

	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASZAGETH.BombStatic=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.BombStatic
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=2.0
			--actor:SetModelByFileID(4254394)	--target_lightning_state_rimonly
			actor:SetModelByFileID(1715082)	--7fx_shivarracoven_golganneth_lightning_debuff
		end						
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=nil
			self.projectiledespawncustomduration=0.25
		end	
		function class:Step(elapsed)
			super.Step(self,elapsed)
			self.position.x=self.player.position.x
			self.position.y=self.player.position.y			
			if(self.aura.dead)then
				if(not self.despawning)then
					self.despawning=true
					self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
					
					local gfx=XPRACTICE.RASZAGETH.BombExplosion1.new()
					gfx:Setup(self.environment,self.position.x,self.position.y,0.1)
					local gfx=XPRACTICE.RASZAGETH.BombExplosion2.new()
					gfx:Setup(self.environment,self.position.x,self.position.y,0.1)
					
				end	
			end

		end
	end
	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASZAGETH.BombExplosion1=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.BombExplosion1
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=4.0
			actor:SetModelByFileID(1953991)	--8fx_generic_lightning_novahigh_impact
			self.expirytime=self.environment.localtime+1.0
		end						
	end		
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.RASZAGETH.BombExplosion2=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.BombExplosion2
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=4.0
			actor:SetModelByFileID(838358)	--lightning_area_impact
			self.expirytime=self.environment.localtime+1.0
		end						
	end	
		
	

end