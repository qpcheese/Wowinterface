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
		local messagename="METEOR_AXE"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={}
			for i=1,2 do
				tinsert(self.argtypes,{XPRACTICE.MULTIPLAYERV2.Datatypes.PADDEDGUID})
			end
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.PRIMALCOUNCIL.Multiplayer	
	function class.HandleCustom_METEOR_AXE(self,sender,args)		
		local scenario=self.scenario
		local boss=scenario.bosses[4]		
		QuickCast(boss.combatmodule.meteoraxe,scenario,boss,args)
	end			
	
	

do	
		local super=XPRACTICE.Spell
		XPRACTICE.PRIMALCOUNCIL.Spell_MeteorAxe=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Spell_MeteorAxe
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Meteor Axe"
			self.icon="interface/icons/inv_offhand_1h_artifactdoomhammer_d_01.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
			-- instant cast, 6 second aura duration?
		end
		function class:Broadcast_v2(scenario)						
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				scenario.statuslabel:SetText("That action requires raid lead/assist.",3.0)
				return
			end
			local args={"XXXXXXXXXXXXXXXX","XXXXXXXXXXXXXXXX"}
			local allplayerscopy={}
			for k,v in pairs(scenario.multiplayer.allplayers) do
				if(not v:IsDeadInGame())then
					tinsert(allplayerscopy,v)
				end
			end
			local dists={}
			local boss4=scenario.bosses[4]
			for i=1,#allplayerscopy do
				local p=allplayerscopy[i]				
				p.TEMP_DIST=math.sqrt(XPRACTICE.distsqr(p.position.x,p.position.y,boss4.position.x,boss4.position.y))
			end
			table.sort(allplayerscopy,function(a,b)return a.TEMP_DIST<b.TEMP_DIST end)
			local medianindex=math.floor(#allplayerscopy/2)
			local farplayercount=#allplayerscopy-medianindex			
			-- pick 1 player who is more than the median distance away from Dathea
			--TODO NEXT: make sure this actually works in a large group
			local playersfound=0
			for i=1,1 do
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
			for i=playersfound+1,2 do
				local r=math.floor(math.random()*#allplayerscopy)+1
				if(r<=#allplayerscopy)then
					playersfound=playersfound+1
					args[playersfound]=allplayerscopy[r].paddedguid
					tremove(allplayerscopy,r)
				end
			end
			self.scenario.multiplayer:FormatAndSendCustom("METEOR_AXE",unpack(args))			
		end
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local args=spellinstancepointer.args
			for i=1,2 do
				local guid=args[i]
				local target=scenario.multiplayer.guidpointers[guid]
				if(target and not target:IsDeadInGame())then
					local aura=target.combatmodule:ApplyAuraByClass(XPRACTICE.PRIMALCOUNCIL.Aura_MeteorAxe,target.combatmodule,target.environment.localtime)
				end
			end		
		end
	end	

	do
		local super=XPRACTICE.Aura
		XPRACTICE.PRIMALCOUNCIL.Aura_MeteorAxe=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Aura_MeteorAxe
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.stacks=1
			self.baseduration=6.0
			self.basetickrate=1.0
		end
		function class:OnApply(localtime)
			super.OnApply(self,localtime)
			local player=self.targetcombat.mob
			local ring=XPRACTICE.PRIMALCOUNCIL.MeteorAxeTelegraph.new()
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
			local mob=self.targetcombat.mob
			local scenario=mob.scenario
			self.tickcount=self.tickcount or 0
			self.tickcount=self.tickcount+1		
			local message=nil
			if(self.tickcount==1)then
				local name1,name2=strsplit("-",self.targetcombat.mob.playername)
				message="Meteor Axe on "..name1
			elseif(self.tickcount==4)then
				message="3"
			elseif(self.tickcount==5)then
				message="2"				
			elseif(self.tickcount==6)then
				message="1"
			elseif(self.tickcount==7)then
				--if(mob==scenario.player)then					
					--scenario.multiplayer:FormatAndSendCustom("METEOR_AXE_DESPAWN",mob.position.x,mob.position.y)
				--end
			end			
			if(message)then self.targetcombat.mob:CreateSpeechBubble(message,3.0) end
		end
		function class:OnRemove()
			super.OnRemove(self)
			local mob=self.targetcombat.mob
			local scenario=mob.scenario
			if(mob==scenario.player)then					
				scenario.multiplayer:FormatAndSendCustom("METEOR_AXE_DESPAWN",mob.position.x,mob.position.y)
			end			
		end
	end

	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.PRIMALCOUNCIL.MeteorAxeTelegraph=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.MeteorAxeTelegraph
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=10.0/2.5
			--actor:SetModelByFileID(1611752)	--7fx_kiljaeden_armageddon_pillar			
			--actor:SetModelByFileID(1982733)	--8fx_rl_annihilation_radius
			actor:SetModelByFileID(1907392)	--8fx_rl_annihilation_state			127,158,159
		end						
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Projectile2SpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=6.0-0.25
			self.projectiledespawncustomduration=0.25
			self.alpha=0.5
			self.state=0
		end	
		function class:Step()
			if(self.state==0)then
				self.position.x=self.player.position.x
				self.position.y=self.player.position.y
				if(self.aura.dead)then
					self.state=1
					self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Projectile2DespawnCustomDuration)
				end
			end
		end
	end	
	
	local roomnumber=XPRACTICE.PRIMALCOUNCIL.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.PRIMALCOUNCIL.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="METEOR_AXE_DESPAWN"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={}
			for i=1,2 do
				tinsert(self.argtypes,{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4})	--x,y
			end
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.PRIMALCOUNCIL.Multiplayer	
	function class.HandleCustom_METEOR_AXE_DESPAWN(self,sender,args)		
		local scenario=self.scenario
		local x=args[1]
		local y=args[2]
		for i=1,#scenario.earthenpillars do
			local pillar=scenario.earthenpillars[i]
			local distsqr=XPRACTICE.distsqr(x,y,pillar.position.x,pillar.position.y)
			if(distsqr<=13*13)then
				pillar:StartDespawning()
			end
		end
		local firezone=XPRACTICE.PRIMALCOUNCIL.ScorchedGround.new()
		firezone:Setup(scenario.game.environment_gameplay,x,y,-.9625)
		tinsert(scenario.firezones,firezone)
	end			
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.PRIMALCOUNCIL.ScorchedGround=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.ScorchedGround
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=10.0/13.89
			actor:SetModelByFileID(3088256)	--scale_obj_cylinder_001red				
			self.startingphasealpha=0
			self.expirytime=self.environment.localtime+120
			self.fadestarttime=self.expirytime-1.0			
		end						
		function class:StartDespawning()
			if(not self.despawning)then
				self.despawning=true
				self.expirytime=self.environment.localtime+1
				self.fadestarttime=self.expirytime-1.0	
			end
		end
	end	