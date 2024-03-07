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
		local messagename="EARTHEN_PILLAR"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={}
			for i=1,4 do
				--tinsert(self.argtypes,{XPRACTICE.MULTIPLAYERV2.Datatypes.PADDEDGUID})
				tinsert(self.argtypes,{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4})	--x
				tinsert(self.argtypes,{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4})	--y
			end
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.PRIMALCOUNCIL.Multiplayer	
	function class.HandleCustom_EARTHEN_PILLAR(self,sender,args)		
		local scenario=self.scenario
		local boss=scenario.bosses[3]		
		QuickCast(boss.combatmodule.earthenpillar,scenario,boss,args)
	end			
		

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.PRIMALCOUNCIL.Spell_EarthenPillar=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Spell_EarthenPillar
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Earthen Pillar"
			self.icon="interface/icons/ability_earthen_pillar.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=1.5;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
		function class:Broadcast_v2(scenario)						
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				scenario.statuslabel:SetText("That action requires raid lead/assist.",3.0)
				return
			end
			local args={9999.9999,9999.9999,9999.9999,9999.9999,9999.9999,9999.9999,9999.9999,9999.9999}
			local targets={"XXXXXXXXXXXXXXXXXXXX","XXXXXXXXXXXXXXXXXXXX","XXXXXXXXXXXXXXXXXXXX","XXXXXXXXXXXXXXXXXXXX"}
			local allplayerscopy={}
			for k,v in pairs(scenario.multiplayer.allplayers) do
				if(not v:IsDeadInGame())then
					tinsert(allplayerscopy,v)
				end
			end
			local dists={}
			local boss3=scenario.bosses[3]
			for i=1,#allplayerscopy do
				local p=allplayerscopy[i]				
				p.TEMP_DIST=math.sqrt(XPRACTICE.distsqr(p.position.x,p.position.y,boss3.position.x,boss3.position.y))
			end
			table.sort(allplayerscopy,function(a,b)return a.TEMP_DIST<b.TEMP_DIST end)
			local medianindex=math.floor(#allplayerscopy/2)
			local farplayercount=#allplayerscopy-medianindex			
			-- pick 2 players who are more than the median distance away from Dathea
			--TODO NEXT: make sure this actually works in a large group
			local playersfound=0
			for i=1,2 do
				if(farplayercount>0)then
					local r=math.floor(math.random()*farplayercount)+1+medianindex					
					if(r<=#allplayerscopy)then
						playersfound=playersfound+1
						targets[playersfound]=allplayerscopy[r].paddedguid
						tremove(allplayerscopy,r)
						farplayercount=farplayercount-1						
					end
				end
			end
			-- then pick any remaining player(s)
			for i=playersfound+1,4 do
				local r=math.floor(math.random()*#allplayerscopy)+1
				if(r<=#allplayerscopy)then
					playersfound=playersfound+1
					targets[playersfound]=allplayerscopy[r].paddedguid
					tremove(allplayerscopy,r)
				end
			end
			for i=1,4 do
				local target=scenario.multiplayer.guidpointers[targets[i]]				
				if(target)then
					args[i*2-1]=target.position.x
					args[i*2]=target.position.y
				end
			end
			self.scenario.multiplayer:FormatAndSendCustom("EARTHEN_PILLAR",unpack(args))			
		end
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local args=spellinstancepointer.args
			--print("Earthen Pillar",args[1],args[2],args[3],args[4])
			--for i=1,7,2 do
			for i=1,4 do
				--local guid=args[i]
				--local target=scenario.multiplayer.guidpointers[guid]
				--if(target and not target:IsDeadInGame())then
				local x=args[i*2-1]
				local y=args[i*2]
				local dist=math.sqrt(XPRACTICE.distsqr(0,0,x,y))			
				if(dist<=100)then
					local telegraph=XPRACTICE.PRIMALCOUNCIL.EarthenPillarTelegraph.new()
					--telegraph:Setup(target.environment,target.position.x,target.position.y,target.position.z)
					telegraph:Setup(spellinstancepointer.castercombat.mob.environment,x,y,0.1)
					telegraph.scenario=scenario
				end
				--end			
			end		
		end
	end
	

	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.PRIMALCOUNCIL.EarthenPillarTelegraph=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.EarthenPillarTelegraph
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=6.0/4.0
			actor:SetModelByFileID(1034150)	--target_earth_state_centeronly
		end						
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=2.5-0.25
			self.projectiledespawncustomduration=0.25
		end	
		function class:OnProjectileDespawning()
			local mini=XPRACTICE.PRIMALCOUNCIL.EarthenPillarMini.new()
			mini:Setup(self.environment,self.position.x,self.position.y,0)
			mini.scenario=self.scenario
		end
	end

	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.PRIMALCOUNCIL.EarthenPillarMini=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.EarthenPillarMini
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=1/2
			--actor:SetModelByFileID(1001789)	--6du_highmaulraid_earthpillar -- too spikey.
			actor:SetModelByFileID(1035014)	--6br_fomor_stonepillar -- correct shape, but wrong color!?
							-- 127-158-154-156
		end						
		function class:SetDefaultAnimation()
			self.displayobject.drawable:SetAnimation(127)
			self.animationmodule.Step=function()end
			self.state=1
			self.alivetime=0
		end	
		function class:Step(elapsed)
			super.Step(self,elapsed)						
			self.alivetime=self.alivetime+elapsed
			if(self.state==1)then
				if(self.alivetime>0.5)then
					self.state=2
					self.displayobject.drawable:SetAnimation(158)
					self.expirytime=self.environment.localtime+3.0
					self.fadestarttime=self.expirytime-1.0
					local bigpillar=XPRACTICE.PRIMALCOUNCIL.EarthenPillar.new()
					bigpillar:Setup(self.environment,self.position.x,self.position.y,self.position.z)
					bigpillar.scenario=self.scenario					
					tinsert(self.scenario.earthenpillars,bigpillar)					
				end
			end
		end
	end		
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.PRIMALCOUNCIL.EarthenPillar=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.EarthenPillar
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=1
			--actor:SetModelByFileID(1001789)	--6du_highmaulraid_earthpillar -- too spikey.
			actor:SetModelByFileID(1035014)	--6br_fomor_stonepillar -- correct shape, but wrong color!?
							-- 127-158-154-156
		end						
		function class:SetDefaultAnimation()
			self.displayobject.drawable:SetAnimation(127)
			self.animationmodule.Step=function()end
			self.state=1
			self.alivetime=0
		end	
		function class:Step(elapsed)
			super.Step(self,elapsed)						
			self.alivetime=self.alivetime+elapsed
			if(self.state==1)then
				if(self.alivetime>1.0)then
					self.state=2
					self.displayobject.drawable:SetAnimation(158)
					-- self.expirytime=self.environment.localtime+3.0
					-- self.fadestarttime=self.expirytime-1.0
				end
			end
			if(self.state==3)then
				if(self.alivetime>4.0)then
					self.state=4
					self.displayobject.drawable:SetAnimation(156)
					self.expirytime=self.environment.localtime+3.0
				end
			end
		end
		function class:StartDespawning()
			if(not self.despawning)then
				self.despawning=true
				self.state=3
				self.alivetime=0
				self.displayobject.drawable:SetAnimation(154)
			end
		end
	end			