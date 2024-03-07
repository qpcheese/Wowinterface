do
	--TODO: volatile code reuse -- only use function in multiplayer/messagehandler.lua
	local function IAmGameHost(multiplayer)
		if(not IsInGroup("player"))then return true end
		if(multiplayer.host)then return true end
		return false		
	end

	local function QuickCast(spellclass,scenario,boss,args)
		if(spellclass.spellbookpointers and spellclass.spellbookpointers[boss])then
			spell=spellclass.spellbookpointers[boss]
		else	
			if(not spellclass.spellbookpointers)then spellclass.spellbookpointers={} end
			spell=spellclass.new()
			spell:Setup(boss.combatmodule)			
			boss.combatmodule.spellbook[spellclass]=spell
			spell.scenario=scenario
			spellclass.spellbookpointers[boss]=spell
		end
	
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=boss.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=boss.combatmodule
		spellinstance.args=args
		spellinstance.scenario=scenario
		spellinstance.spellbookspell:StartCasting(boss.environment.localtime,spellinstance)		
		boss.combatmodule.castedspell=spellinstance					
	end	

	do
		XPRACTICE.SARKARETH2.Event = {}
		local class=XPRACTICE.SARKARETH2.Event
		class.__index = class
		function class.new()
			local self=setmetatable({}, class)
			return self
		end
		function class:Setup(scenario)
			self.scenario=scenario
			self.time=nil
			self.func=nil
		end
		function class:SetTime(m,s)
			self.time=m*60+s
		end
	end


	do
		local super=XPRACTICE.GameObject
		XPRACTICE.SARKARETH2.Schedule=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.Schedule
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)		
			self.events={}
			self.time=0
			self.nexteventid=nil
		end
		
		function class:NewEvent(m,s,func)
			local event=XPRACTICE.SARKARETH2.Event.new()
			event:Setup(self.scenario)
			event:SetTime(m,s)
			event.done=false
			event.func=func
			--print("Event:",event.time)
			if(#self.events==0)then
				tinsert(self.events,event)
				--print("Insert into empty list")
			elseif(event.time>=self.events[#self.events].time)then
				tinsert(self.events,event)
				--print("Insert at end of list")
			else
				for i=1,#self.events do
					if(self.events[i].time>event.time)then
						table.insert(self.events,i,event)
						--print("Insert at ",i)
						break
					end
				end
			end
			return event
		end
		
		function class:GotoTime(newtime)
			self.time=newtime
			self.nexteventid=nil
			for i=1,#self.events do
				local event=self.events[i]
				if(event.time<newtime)then
					event.done=true
				else
					if(not self.nexteventid)then self.nexteventid=i end
					event.done=false
				end
			end			
		end
		

		
				
		function class:CreateAssociatedObjects()
			
			if(XPRACTICE_SAVEDATA.SARKARETH2.subscenario==2)then return end
			
			local schedule=self
			local scenario=self.scenario
			local multiplayer=scenario.multiplayer		
			local boss=scenario.bosses[1]
			local cpus=scenario.cpus		--"brmmonk" is tank1, "blooddk" is tank2
			local spells=boss.combatmodule
			
			self.events={}
			self.nexteventid=1
			

			local timer=0.0
			timer=0.0
			
			if(false)then				
				self:NewEvent(1,42.965,function()
					self:GotoTime(2*60+23)
					--boss.position.x=50;boss.position.y=0
					--scenario.statuslabel:SetText("Abyssal Breath check...",4.0);self:AbyssalBreath(1)
					----scenario:AttemptKillPlayer(scenario.player,true,true,"Embarrassment check...",4.0)
				end)
				--return
			end

			self:NewEvent(1,42.965,function()					
				self:VoidEmpowerment()
			end)						
			self:NewEvent(1,43.762,function()
				QuickCast(XPRACTICE.SARKARETH2.Spell_VoidEmpowerment,scenario,boss)
				self:VoidEmpowermentApplyOblivionStacks()
				XPRACTICE.SARKARETH2.Choreography.ApplyIntermission1GoUpstairs(scenario)
			end)
			self:NewEvent(1,54.619,function()	
				self:EndExistence()								
			end)
			self:NewEvent(2,04.891,function()	
				self:EndExistenceInterrupt()
			end)
			
			self:NewEvent(2,12,function()	
				if(not scenario.player:IsDeadInGame())then				
					ActionButton_ShowOverlayGlow(scenario.brezbutton.displayobject.drawable)
					local aura=scenario.player.combatmodule:ApplyAuraByClass(XPRACTICE.LEGACY.Aura_ScenarioComplete_Cheer,scenario.player.combatmodule,scenario.localtime)
					scenario.statuslabel:SetText("Success!\n")
				end
			end)
			
			--!!!
			if(true)then return end
			
			self:NewEvent(2,12.134,function()	
				self:AbyssalBreath(1)		
			end)
			self:NewEvent(3,8.303,function()self:StunAdds()end)
			--self:NewEvent(3,12.303,function()self:StunAdds()end)
			self:NewEvent(3,38.767,function()self:StunAdds()end)
			self:NewEvent(4,22.650,function()self:StunAdds()end)
			self:NewEvent(5,21.346,function()self:StunAdds()end)
			self:NewEvent(6,56.774,function()self:StunAdds()end)
			
			
			self:NewEvent(2,17.134,function()	
				self:BossToReplayCoords(-2459.82,2038.71)
			end)						
			self:NewEvent(2,18.837,function()				
				self:DesolateBlossom(1)
			end)
			self:NewEvent(2,23.238,function()	
				self:VoidBomb(1)
			end)			
			self:NewEvent(2,26.599,function()	
				self:VoidClaws(1)
			end)						
			self:NewEvent(2,36.606,function()	
				self:InfiniteDuress(1)
			end)				
			self:NewEvent(2,43.254,function()	
				self:VoidClaws(2)
			end)
			self:NewEvent(2,54.380,function()	
				self:AbyssalBreath(2)
			end)		
			self:NewEvent(2,59.899,function()	
				self:DesolateBlossom(2)
			end)	
			self:NewEvent(3,03.249,function()	
				self:VoidClaws(3)
			end)
			self:NewEvent(3,03.000,function()	
				self:ArcaneMagesDownstairs()
			end)			

			self:NewEvent(3,04.130,function()	
				self:NewLockGate(-2473.34,2075.49,-2452.69,2071.00)
			end)							

			self:NewEvent(3,09.938,function()	
				self:InfiniteDuress(2)
			end)
			
			self:NewEvent(3,19.908,function()	
				self:VoidBomb(2)
			end)	

			self:NewEvent(3,23.271,function()	
				self:VoidClaws(4)
			end)
			
			self:NewEvent(3,25.476,function()	
				self:AbyssalBreath(3)
			end)
			
			self:NewEvent(3,35.486,function()	
				self:DesolateBlossom(3)
			end)						
			
			self:NewEvent(3,39.989,function()	
				self:InfiniteDuress(3)
			end)							
			
			self:NewEvent(3,39.989,function()	
				self:VoidClaws(5)
			end)
			
			self:NewEvent(3,51.944,function()	
				self:Intermission2Dance()
			end)			

			self:NewEvent(4,01,function()	
				scenario.pauseallmechanics=true
				self.scenario.statuslabel:SetText("End of Phase 2.",5.0)
			end)
			
			
			
			
			
			
			-- timer=timer+6.0
			-- self:NewEvent(0,timer,function()
				-- self:Wave()
			-- end)				
			-- -- if(localvortexcount%3==0)then
				-- -- print("After vortex",localvortexcount,", time is",timer)		--60,119,178
			-- -- end				

			-- timer=timer+5.0
			-- self:NewEvent(0,timer,function()			
				-- if(self.scenario.playerdowntime==0 and self.startingloop==1)then
					-- self.finalchallengequalified=true
					-- self.scenario.statuslabel:SetText("You're very good at this.\nHere comes the Surprise Final Attack!",5.0)
					-- boss.destx=0
					-- boss.desty=0
					-- boss.remainingreactiontime=0					
				-- else
					-- self.finalchallengequalified=false
				-- end
			-- end)


		end
		
		
		function class:BossToReplayCoords(x,y)	
			local boss=self.scenario.bosses[1]
			local x,y=self:ReplayCoordsToWorldCoords(x,y)
			boss:SuggestDestination(x,y,0)
		end
		
		function class:VoidEmpowerment()
			local scenario=self.scenario
			local boss=scenario.bosses[1]			
			local gate=scenario.cpulockgates[1]
			local gate2=scenario.cpulockgates[2]
			local x,y=self:ReplayCoordsToWorldCoords(-2482.44,2012.61)
			self:QuickBossJump(x,y,0)			
			scenario.voidempowermentpushback=true
			boss.facetowardsmob=scenario.cpus[1]
			for i=1,20 do
				scenario.cpus[i].portalreactiontime=math.random()*1.25+0.25								
				scenario.cpus[i].portal_TEMP=gate
				scenario.cpus[i].afterlockgatefunc=function()					
					local x,y=XPRACTICE.RandomPointInCircle(28.03,27.45,2) --purplediamond
					scenario.cpus[i].destx=x
					scenario.cpus[i].desty=y
					scenario.cpus[i].TEMP_voidx=x
					scenario.cpus[i].TEMP_voidy=y					
					scenario.cpus[i].remainingreactiontime=math.random()*0.5+0	
				end
				--print(i,scenario.cpus[i],gate)
			end
			for i=1,#scenario.allpcs do
				local pc=scenario.allpcs[i]
				if(not pc:IsDeadInGame())then
					local aura=pc.combatmodule:ApplyAuraByClass(XPRACTICE.SARKARETH2.Aura_VoidBombDebuff)
					aura.scenario=scenario
					aura.context="intermission1"
				end
			end
		end
		
		function class:VoidEmpowermentApplyOblivionStacks()			
			local scenario=self.scenario
			local player=scenario.player
			local ticker=XPRACTICE.SARKARETH2.VoidEmpowermentOblivion.new()
			ticker.scenario=scenario
			ticker:Setup(player.environment)
			
		end
		
		function class:EndExistence()
			QuickCast(XPRACTICE.SARKARETH2.Spell_EndExistence,self.scenario,self.scenario.bosses[1])			
			self.scenario.voidempowermentpushback=false
			self.scenario.bosses[1].facetowardsmob=false			
		end
		
		function class:EndExistenceInterrupt()
			local boss=self.scenario.bosses[1]
			boss.combatmodule:StopCastingCurrentSpell(boss.localtime,boss.combatmodule.castedspell)
			self.scenario.bosses[1].facetowardsmob=self.scenario.cpus[1]
			local x,y=self:ReplayCoordsToWorldCoords(-2466.80,2042.34)
			self.scenario.cpus[1]:SuggestDestination(x,y,0.1)
			self.scenario.cpus[1].remainingrolltime=0.25
			local x,y=self:ReplayCoordsToWorldCoords(-2469.30,2036.52)
			self.scenario.bosses[1]:SuggestDestination(x,y)
			self.scenario.bosses[1].facetowardsmob=self.scenario.cpus[1]
		end
				
		
		function class:AbyssalBreath(index)
			self.scenario.bosses[1].facetowardsmob=nil
			QuickCast(XPRACTICE.SARKARETH2.Spell_AbyssalBreath,self.scenario,self.scenario.bosses[1],{index})
			XPRACTICE.SARKARETH2.Choreography.ApplyAbyssalBreathDodge(self.scenario,index)			
		end
		
		function class:DesolateBlossom(index)
			QuickCast(XPRACTICE.SARKARETH2.Spell_DesolateBlossom,self.scenario,self.scenario.bosses[1],{index})
			XPRACTICE.SARKARETH2.Choreography.ApplyDesolateBlossomDodge(self.scenario,index)
		end
		
		function class:StunAdds()
			local scenario=self.scenario
			for i=1,#scenario.adds do
				scenario.adds[i]:StunMe()
			end
		end
		
		function class:VoidBomb(index)
			QuickCast(XPRACTICE.SARKARETH2.Spell_VoidBomb,self.scenario,self.scenario.bosses[1],{index})
		end
		
		function class:VoidClaws(index)
			print("NYI: VoidClaws")
		end
		
		function class:InfiniteDuress(index)
			print("NYI: InfiniteDuress")
		end
		
		function class:NewLockGate(x1,y1,x2,y2)
			XPRACTICE.LEGACY.ResetQuickGateways(self.scenario)
			print("NYI: NewLockGate",x1,y1,x2,y2)
			
		end
		
		function class:ArcaneMagesDownstairs()
			print("NYI: ArcaneMagesDownstairs")
		end
		
		function class:Intermission2Dance()
			print("NYI: Intermission2Dance")
		end
		
		function class:EbonMight()
			print("NYI: EbonMight")
		end
		
		function class:TimeWarp()
			--print("NYI: TimeWarp")
			self.scenario.timewarpmanager:DoNaiveTimeWarp()
		end
		
		function class:ScorchingBomb(index)
			print("NYI: ScorchingBomb",index)
		end
		
		function class:GlitteringSurge(index)
			print("NYI: GlitteringSurge",index)
		end		
		
		function class:RangedLockGate(startmin,startsec,endmin,endsec)
			print("NYI: RangedLockGate",startmin,startsec,endmin,endsec)
		end
		
		function class:OppressingHowl()
			print("NYI: OppressingHowl")
		end
		
		function class:BurningClaws(index,target)
			print("NYI: BurningClaws",index,target)			
		end
		
		function class:MassDisintegrate(index)
			print("NYI: MassDisintegrate",index)
		end
		
		function class:SearingBreath(index)
			print("NYI: SearingBreath",index)
		end		
		
		function class:TankStutterstepArc(startmin,startsec,endmin,endsec,tank,tankdestx,tankdesty,boss,bossdestx,bossdesty)
			print("NYI: TankStutterstepArc (many args...)")	--many args, handle it
		end
		

		
		
		-- local CENTERX=-2253.34
		-- local CENTERY=2896.98
		
		function class:Start()
			local scenario=self.scenario
			scenario.allpcs={}
			tinsert(scenario.allpcs,scenario.player)--!!!
			for i=1,20 do
				tinsert(scenario.allpcs,scenario.cpus[i])
			end
			self:GotoTime(1*60+42*1)
			self.scenario.pauseallmechanics=false
		end
		
		-- function class:StartFromLoop(loop)
			-- local timer=0.0
			-- if(loop==1)then timer=0.0 end
			-- if(loop==2)then timer=60.25-1 end
			-- if(loop==3)then timer=119.5-1 end
			-- if(loop==4)then timer=178.75-1 end
			-- self.startingloop=loop
			-- --self.startingloop=1	--(debug only)
			-- local startingvortexs=(loop-1)*3
			-- --print("startingvortexs:",startingvortexs)
			-- --timer=44.0	--(debug frontal cone check)
			-- self:GotoTime(timer)
			-- for i=1,startingvortexs do
				-- local targetarray=slampositions
				-- local vortex=self.scenario.vortexmanager:NewVortex(targetarray[i][1]-CENTERX,targetarray[i][2]-CENTERY)
				-- vortex.state=1	-- no lava waves on spawn
			-- end			
			-- self.scenario.pauseallmechanics=false
			-- self.scenario.playeruptime=0
			-- self.scenario.playerdowntime=0
			
		-- end
		
		
		function class:MobsFaceEachOther(mob1,mob2)
			local angle=math.atan2(mob2.position.y-mob1.position.y,mob2.position.x-mob1.position.x)
			mob1:FreezeOrientation(angle)
			local angle=math.atan2(mob1.position.y-mob2.position.y,mob1.position.x-mob2.position.x)
			mob2:FreezeOrientation(angle)
		end
		
		function class:MobFaceTarget(mob1,mob2)
			local angle=math.atan2(mob2.position.y-mob1.position.y,mob2.position.x-mob1.position.x)
			mob1:FreezeOrientation(angle)
		end		
		
		function class:QuickBossJump(x,y,yaw)
			local mob=self.scenario.bosses[1]
			local aura=mob.combatmodule:ApplyAuraByClass(XPRACTICE.LEGACY.Aura_DeathGrip_GhostCheat)
			aura.destination={x=x,y=y,z=0}
			aura.expirytime=mob.environment.localtime+0.75
			mob:FreezeOrientation(yaw)
		end
		
		function class:QuickMobJump(mob,x,y,yaw)
			local aura=mob.combatmodule:ApplyAuraByClass(XPRACTICE.LEGACY.Aura_DeathGrip_GhostCheat)
			aura.destination={x=x,y=y,z=0}
			aura.expirytime=mob.environment.localtime+0.75
			mob:FreezeOrientation(yaw)
		end				
		
		function class:MoveBoss(vortexcount)
			local schedule=self
			local scenario=self.scenario
			local multiplayer=scenario.multiplayer		
			local boss=scenario.bosses[1]
			local targetarray=bosspositions
			boss.destx=targetarray[vortexcount][1]-CENTERX
			boss.desty=targetarray[vortexcount][2]-CENTERY
			boss.remainingreactiontime=0
		end

		function class:Slam(vortexcount)
			local schedule=self
			local scenario=self.scenario
			local multiplayer=scenario.multiplayer		
			local boss=scenario.bosses[1]
			local spells=boss.combatmodule
			--print("Vortexcount:",vortexcount)
			local targetarray=slampositions
			x=targetarray[vortexcount][1]-CENTERX
			y=targetarray[vortexcount][2]-CENTERY			
			args={}
			args[1]=x
			args[2]=y
			self.scenario.multiplayer:FormatAndSendCustom("SEARINGSLAM",unpack(args))	
			-- can't use spell.broadcast atm as it currently doesn't take args
		end

		function class:FrontalCone()
			local schedule=self
			local scenario=self.scenario
			local multiplayer=scenario.multiplayer		
			local boss=scenario.bosses[1]
			boss.combatmodule.frontalcone:Broadcast_v2(self.scenario)
		end

		function class:Wave()
			local schedule=self
			local scenario=self.scenario
			scenario.vortexmanager:LavaWaves()
		end
		
		function class:ReplayCoordsToWorldCoords(x,y)
			local mapcenterx,mapcentery=-2482.26,2055.62
			x=x-mapcenterx
			y=y-mapcentery
			x,y=-y,x
			return x,y
		end

		function class:SetupEverything(checkpoint)
			local scenario=self.scenario			
			scenario:ResetTempVars()
			

			if(checkpoint==1)then
				local wx1,wy1=self:ReplayCoordsToWorldCoords(-2515.36,2021.30)			
				local wx2,wy2=self:ReplayCoordsToWorldCoords(-2498.37,2039.99)			
				XPRACTICE.LEGACY.QuickDemonicGateway(scenario,wx1,wy1,wx2,wy2)
				for i=1,1 do
					local wx,wy=self:ReplayCoordsToWorldCoords(-2493.06,2035.90)
					local x,y=XPRACTICE.RandomPointInCircle(wx,wy,2)
					scenario.cpus[i].position.x,scenario.cpus[i].position.y=x,y	
				end
				for i=2,9 do
					local x,y=XPRACTICE.RandomPointAlongLine(6.32,-6.04,22.32,-23.18,5)
					scenario.cpus[i].position.x,scenario.cpus[i].position.y=x,y					
				end
				for i=10,20 do
					local wx,wy=self:ReplayCoordsToWorldCoords(-2515.36,2021.30)					
					local x,y=XPRACTICE.RandomPointInCircle(wx,wy,2.0)
					scenario.cpus[i].position.x,scenario.cpus[i].position.y=x,y					
				end
				for i=1,20 do
					scenario.cpus[i]:ForceLookAtMob(scenario.bosses[1])
				end
			elseif(checkpoint==2)then
				local wx1,wy1=self:ReplayCoordsToWorldCoords(-2465.52,2066.82)				
				local wx2,wy2=self:ReplayCoordsToWorldCoords(-2453.70,2032.13)			
				XPRACTICE.LEGACY.QuickDemonicGateway(scenario,wx1,wy1,wx2,wy2)				
				local wx1,wy1=self:ReplayCoordsToWorldCoords(-2474.32,2069.02)			
				scenario.bosses[1].position.x=wx1;scenario.bosses[1].position.y=wy1
				local wx1,wy1=self:ReplayCoordsToWorldCoords(-2467.34,2068.65)			
				scenario.cpus[1].position.x=wx1;scenario.cpus[1].position.y=wy1
				self:MobsFaceEachOther(self.scenario.bosses[1],scenario.cpus[1])
				for i=2,9 do
					local x,y=XPRACTICE.RandomPointInCircle(-12.09,12.83,2.0)
					scenario.cpus[i].position.x,scenario.cpus[i].position.y=x,y					
					self:MobFaceTarget(scenario.cpus[i],scenario.bosses[1])
				end
				for i=10,20 do
					local x,y=XPRACTICE.RandomPointInCircle(-10.66,16.52,5.0)
					scenario.cpus[i].position.x,scenario.cpus[i].position.y=x,y					
					self:MobFaceTarget(scenario.cpus[i],scenario.bosses[1])
				end
			elseif(checkpoint==-1)then
				local x1,x2,y1,y2
				local panic=0
				local ok=false
				while(panic<=100 and ok==false)do
					panic=panic+1
					x1,y1=XPRACTICE.RandomPointInCircle(0,0,35)
					--local dist2=math.random()*10+15
					local dist2=math.random()*10+20
					local angle=math.random()*math.pi*2
					x2=x1+math.cos(angle)*dist2
					y2=y1+math.sin(angle)*dist2
					local distsqr=XPRACTICE.distsqr(0,0,x2,y2)
					if(distsqr<45*45)then
						ok=true
					end
				end
				if(panic>=99)then				
					local angle=math.random()*math.pi*2
					local dist1=math.random()*55-35
					x1=math.cos(angle)*dist1
					y1=math.sin(angle)*dist1
					x2=x1+math.cos(angle)*20
					y2=y1+math.sin(angle)*20
					x1,y1=XPRACTICE.Transform_Rotate2D(x1,y1,angle,0,0)
					x2,y2=XPRACTICE.Transform_Rotate2D(x2,y2,angle,0,0)
				end
							
				XPRACTICE.LEGACY.ResetQuickGateways(self.scenario)
				XPRACTICE.LEGACY.QuickDemonicGateway(scenario,x1,y1,x2,y2)	

				for i=10,#scenario.cpus do
					scenario.cpus[i].TEMP_important=true
					--print(i,"is important")
				end

				local ranged={10,11,12,13,14,15,16,17,18,19,20}
				XPRACTICE.ShuffleList(ranged)
				local i2=math.floor(math.random()*5+2)
				if(not scenario.hardmode)then i2=6 end
				for i=1,i2 do
					scenario.cpus[ranged[i]].TEMP_important=false
					--print(ranged[i],"is not important")
				end					

				for i=1,20 do
					if(scenario.hardmode)then
						scenario.cpus[i].scale=1.0
					else						
						if(not scenario.cpus[i].TEMP_important)then						
							scenario.cpus[i].scale=0.001
						else
							scenario.cpus[i].scale=1.0
						end
					end
				end
				
				for i=1,9 do
					local gateangle=math.atan2(scenario.cpulockgates[2].position.y-scenario.cpulockgates[1].position.y,scenario.cpulockgates[2].position.x-scenario.cpulockgates[1].position.x)
					local gate2x=scenario.cpulockgates[2].position.x
					local gate2y=scenario.cpulockgates[2].position.y
					local xx,yy=XPRACTICE.RandomPointInCircle(gate2x,gate2y,10)
					local x,y=XPRACTICE.RandomPointInCircle(xx,yy,5)
					local angle=math.atan2(scenario.cpulockgates[2].position.y-y,scenario.cpulockgates[2].position.x-x)
					self:QuickMobJump(scenario.cpus[i],x,y,angle)

				end
				for i=10,20 do					
					if(scenario.cpus[i].TEMP_important)then
						local gate1x=scenario.cpulockgates[1].position.x
						local gate1y=scenario.cpulockgates[1].position.y
						local gateangle=math.atan2(scenario.cpulockgates[2].position.y-scenario.cpulockgates[1].position.y,scenario.cpulockgates[2].position.x-scenario.cpulockgates[1].position.x)
						local x1=gate1x+math.cos(gateangle)*-5
						local y1=gate1y+math.sin(gateangle)*-5
						local x2=gate1x+math.cos(gateangle)*2
						local y2=gate1y+math.sin(gateangle)*2					
						
						--local x,y=XPRACTICE.RandomPointAlongLine(x1,y1,x2,y2,1)
						local x,y=XPRACTICE.RandomPointAlongLine(x1,y1,x2,y2,1.0)
						local angle=math.atan2(scenario.cpulockgates[2].position.y-y,scenario.cpulockgates[2].position.x-x)
						self:QuickMobJump(scenario.cpus[i],x,y,angle)
					else
						--print(i,"not important")
						local gate1x=scenario.cpulockgates[1].position.x
						local gate1y=scenario.cpulockgates[1].position.y
						local gateangle=math.atan2(scenario.cpulockgates[2].position.y-scenario.cpulockgates[1].position.y,scenario.cpulockgates[2].position.x-scenario.cpulockgates[1].position.x)
						--local x1=gate1x+math.cos(gateangle)*-10
						--local y1=gate1y+math.sin(gateangle)*-10
						--local x2=gate1x+math.cos(gateangle)*20
						--local y2=gate1y+math.sin(gateangle)*20					
						--local x,y=XPRACTICE.RandomPointAlongLine(x1,y1,x2,y2,5)
						local x1=gate1x+math.cos(gateangle)*-5
						local y1=gate1y+math.sin(gateangle)*-5
						local x1,y1=XPRACTICE.RandomPointInCircle(x1,y1,10)
						local x,y=XPRACTICE.RandomPointInCircle(x1,y1,10)
						local angle=math.atan2(scenario.cpulockgates[2].position.y-y,scenario.cpulockgates[2].position.x-x)
						self:QuickMobJump(scenario.cpus[i],x,y,angle)						

					end
					
				end			
			else
				print("X Practice warning: invalid checkpoint in Sarkareth\Schedule.SetupEverything")
			end
			for i=1,#scenario.cpus do
				scenario.cpus[i]:StopAI()
			end
			for i=1,#scenario.bosses do
				scenario.bosses[i]:StopAI()
			end

		end


		
		function class:Step(elapsed)
			super.Step(self,elapsed)

			local timeroundeddown=math.floor(self.time)
			-- for i,v in ipairs(self.scenario.timestamps)do
				-- local ts=self.scenario.timestamps[i]
				-- if(ts.time==timeroundeddown)then
					-- ts.button:Select(true)
				-- else
					-- ts.button:Select(false)
				-- end
			-- end

			
			if(not self.scenario.pauseallmechanics) then
				self.time=self.time+elapsed
			
				if(self.nexteventid)then
					local continue=false
					local safety=0
					repeat
						safety=safety+1
						continue=false
						local nextevent=self.events[self.nexteventid]
						if(nextevent)then
							if(nextevent.done)then
								continue=true
								self.nexteventid=self.nexteventid+1
							else
								if(nextevent.time<=self.time)then
									continue=true
									nextevent.done=true
									nextevent.func()							
								end
							end
						end
					until(continue==false or safety>100)
				end
			end
		end
				
		
		
		
		
		
		
	end
	
end