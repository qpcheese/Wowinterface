do
	--TODO: volatile code reuse -- only use function in multiplayer/messagehandler.lua
	local function IAmGameHost(multiplayer)
		if(not IsInGroup("player"))then return true end
		if(multiplayer.host)then return true end
		return false		
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
			tinsert(self.events,event)
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
		

		local slampositions={{-2297.77, 2873.62},
							{-2311.19, 2897.65},
							{-2291.60, 2892.41},
							{-2282.70, 2911.91},
							{-2263.56, 2953.42},
							{-2288.07, 2931.95},
							{-2259.73, 2923.73},
							{-2198.13, 2903.93},
							{-2222.39, 2913.65}}

		local bosspositions={{-2274.44,2896.56},		--based on where boss goes after slam -- charged smash/center
							{-2273.48,2906.33},
							{-2257.85,2901.35},
							{-2261.98,2918.95},
							{-2256.50,2923.46},
							{-2253.67,2906.55},
							{-2233.94,2904.05},
							{-2220.40,2894.59},
							{-2221.17,2895.19}}
		
			-- ah oops this is where we discovered that our maps are incorrectly rotated by 90 degrees.  TODO NEXT: fix
		
		-- local slampositions2={{-2310.27, 2917.25},		
							-- {-2263.10, 2952.28},
							-- {-2270.26, 2932.97},
							-- {-2283.19,2912.80},
							-- {-2302.81,2884.41},
							-- {-2269.86,2849.82},
							-- {-2253.11,2847.43},
							-- {-2258.30,2867.46},
							-- {-2221.64,2860.50}}
		
		-- local bosspositions2={{-2278.35,2912.15},
							-- {-2267.61,2922.25},
							-- {-2257.54,2897.36},
							-- {-2269.14,2886.61},
							-- {-2268.46,2881.51},
							-- {-2249.59,2893.37},
							-- {-2232.10,2871.92},							
							-- {-2228.98,2884.93},
							-- {-2223.11,2883.76}}
				

		
		
				
		function class:CreateAssociatedObjects()
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

			self:NewEvent(0,00,function()	
				self:BossToReplayCoords(-2489.92,2028.86)
				boss:NaiveSwitchAggro(scenario.player)
			end)			
			self:NewEvent(0,00.401,function()	
				self:TimeWarp()
			end)

			self:NewEvent(0,00.925,function()	
				self:ScorchingBomb(1)
			end)

			self:NewEvent(0,02.936,function()	
				self:GlitteringSurge(1)
			end)
			
			self:NewEvent(0,04.909,function()	
				self:RangedLockGate(0,04.909,0,05.470)
			end)
			
			self:NewEvent(0,12.970,function()
				self:OppressingHowl()
			end)

			self:NewEvent(0,15,function()	
				self:BossToReplayCoords(-2496.17,2041.57)
			end)
			
			self:NewEvent(0,17.941,function()	
				self:BurningClaws(1,cpus[1])
			end)
			--TODO NEXT: check logs for tank taunts (just phase 1 for now)
			
			self:NewEvent(0,20.957,function()
				self:MassDisintegrate(1)
			end)
			
			self:NewEvent(0,25.465,function()
				self:SearingBreath(1)
			end)
					
			--at 0:30, boss starts stutterstepping around inner circle following tank2
			self:NewEvent(0,30,function()			
				self:TankStutterstepArc(0,30,0,36,cpus[2],-2499.20,2065.13,boss,-2501.12,2057.87)
			end)
			
			self:NewEvent(0,30.520,function()
				self:ScorchingBomb(2)
			end)
			
			self:NewEvent(0,35.939,function()
				self:BurningClaws(2,cpus[2])
			end)

			self:NewEvent(0,37.972,function()
				self:SearingBreath(2)
			end)
			
			self:NewEvent(0,43.080,function()
				self:MassDisintegrate(2)
			end)
			
			--at 0:50, boss starts stutterstepping "around inner circle" (but mostly north) following tank1
			self:NewEvent(0,50,function()
				self:TankStutterstepArc(0,50,0,56,cpus[1],-2494.84,2072.19,boss,-2497.67,2067.94)
			end)			
			
			self:NewEvent(0,51.947,function()
				self:BurningClaws(3,cpus[1])
			end)
			
			self:NewEvent(0,53.939,function()
				self:ScorchingBomb(3)
			end)
			
			self:NewEvent(0,55.952,function()
				self:SearingBreath(3)
			end)
			
			self:NewEvent(1,02,function()
				--boss starts moving at 1:02 and arrives at 1:11
				self:TankStutterstepArc(1,02,1,11,cpus[1],-2483.97,2072.31,boss,-2489.87,2071.96)				
			end)
			
			self:NewEvent(1,02.955,function()
				self:MassDisintegrate(3)
			end)
			
			self:NewEvent(1,06.940,function()
				self:BurningClaws(4,cpus[2])
			end)
			
			self:NewEvent(1,10.956,function()
				self:ScorchingBomb(4)
			end)
			
			self:NewEvent(1,21.955,function()
				self:MassDisintegrate(4)
			end)
			
			self:NewEvent(1,27.714,function()
				self:NewLockGate(-2465.52,2066.82 , -2453.70,2032.13)
			end)
			
			self:NewEvent(1,30.971,function()
				self:GlitteringSurge(2)
			end)
			
			self:NewEvent(1,42.965,function()
				self:VoidEmpowerment()
			end)
			
			self:NewEvent(1,43,timer,function()	
				scenario.pauseallmechanics=true
				self.scenario.statuslabel:SetText("End of Phase 1.  Start of intermission.",5.0)
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
		
		function class:NewLockGate(x1,y1,x2,y2)
			print("NYI: NewLockGate",x1,y1,x2,y2)
		end
		
		function class:VoidEmpowerment()
			print("NYI: VoidEmpowerment")
		end
		
		
		
		-- local CENTERX=-2253.34
		-- local CENTERY=2896.98
		
		function class:Start()
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
		
		

		
		function class:QuickBossJump(x,y)
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
			else
				print("X Practice warning: invalid checkpoint in Sarkareth\Schedule.SetupEverything")
			end
		end


		
		function class:Step(elapsed)
			super.Step(self,elapsed)

			local timeroundeddown=math.floor(self.time)
			for i,v in ipairs(self.scenario.timestamps)do
				local ts=self.scenario.timestamps[i]
				if(ts.time==timeroundeddown)then
					ts.button:Select(true)
				else
					ts.button:Select(false)
				end
			end

			
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