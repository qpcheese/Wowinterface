do
	--TODO: volatile code reuse -- only use function in multiplayer/messagehandler.lua
	local function IAmGameHost(multiplayer)
		if(not IsInGroup("player"))then return true end
		if(multiplayer.host)then return true end
		return false		
	end

	do
		XPRACTICE.RASHOK.Event = {}
		local class=XPRACTICE.RASHOK.Event
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
		XPRACTICE.RASHOK.Schedule=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.Schedule
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)		
			self.events={}
			self.time=0
			self.nexteventid=nil
		end
		
		function class:NewEvent(m,s,func)
			local event=XPRACTICE.RASHOK.Event.new()
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
			local spells=boss.combatmodule
			
			self.events={}
			self.nexteventid=1
			

			local timer=1.0
			local vortexcount=0
			for i=1,9 do
				local localvortexcount=i
				self:NewEvent(0,timer,function()	
					--print("Vortex count:",localvortexcount)
					self:Slam(localvortexcount)
				end)
				timer=timer+7.75	--cast time + jump time + landing animation
				if(localvortexcount%3==0)then
					self:NewEvent(0,timer,function()
						self:FrontalCone()
					end)			
					timer=timer+5+1.0
					self:NewEvent(0,timer,function()
						self:MoveBoss(localvortexcount)
					end)
					self:NewEvent(0,timer,function()					
						self:Wave()
					end)					
				else
					self:NewEvent(0,timer,function()
						self:MoveBoss(localvortexcount)
					end)
					timer=timer+6.0
					self:NewEvent(0,timer,function()					
						self:Wave()
					end)	
				end
				timer=timer+6.0
				self:NewEvent(0,timer,function()
					self:Wave()
				end)				
				-- if(localvortexcount%3==0)then
					-- print("After vortex",localvortexcount,", time is",timer)		--60,119,178
				-- end				
			end
			timer=timer+5.0
			self:NewEvent(0,timer,function()			
				if(self.scenario.playerdowntime==0 and self.startingloop==1)then
					self.finalchallengequalified=true
					self.scenario.statuslabel:SetText("You're very good at this.\nHere comes the Surprise Final Attack!",5.0)
					boss.destx=0
					boss.desty=0
					boss.remainingreactiontime=0					
				else
					self.finalchallengequalified=false
				end
			end)
			timer=timer+2.0
			self:NewEvent(0,timer,function()
				if(self.finalchallengequalified)then
					local offset=math.random()*math.pi*2
					for t=1,8 do						
						for i=-10,10 do	--some of these waves are OOB and removed immediately
							--local x,y=XPRACTICE.Transform_Rotate2D(-80,i*16+4,math.pi*2*t/8,0,0)
							local angle=math.pi*2*t/8+offset
							local x,y=XPRACTICE.Transform_Rotate2D(-80,i*24+6,angle,0,0)
							local wave=self.scenario.wavemanager:NewWave(x,y,angle)
							wave.vx=math.cos(angle)*7*2
							wave.vy=math.sin(angle)*7*2								
						end
					end
				end
			end)			
			timer=timer+4.0
			self:NewEvent(0,timer,function()			
				if(self.finalchallengequalified==false)then
					self.scenario.pauseallmechanics=true
					self.scenario:SetupNormalButtons()
					if(self.scenario.playerdowntime>0)then
						local percentage=math.floor(100*self.scenario.playeruptime/(self.scenario.playeruptime+self.scenario.playerdowntime))
						self.scenario.statuslabel:SetText("That's all the waves!\nYou were alive for "..tostring(percentage).."% of the challenge.",10.0)
					elseif(self.startingloop>1)then
						self.scenario.statuslabel:SetText("That's all the waves!\nCan you survive from loop 1?",10.0)						
					end
				end
				if(self.finalchallengequalified==true)then
					self:FrontalCone()
				end
			end)
			timer=timer+7.0
			self:NewEvent(0,timer,function()	
				self.scenario.pauseallmechanics=true
				self.scenario:SetupNormalButtons()
				if(self.finalchallengequalified==true)then
					if(self.scenario.playerdowntime==0)then
						self.scenario.statuslabel:SetText("Spectacular!\n(Of course, the real encounter has additional mechanics...)",10.0)
						local aura=self.scenario.player.combatmodule:ApplyAuraByClass(XPRACTICE.LEGACY.Aura_ScenarioComplete_Cheer,self.scenario.player.combatmodule,self.scenario.localtime)
						return
					end
				end
				self.scenario.statuslabel:SetText("")
			end)

		end
		
		
		local CENTERX=-2253.34
		local CENTERY=2896.98
		
		function class:StartFromLoop(loop)
			if(loop==1)then timer=0.0 end
			if(loop==2)then timer=60.25-1 end
			if(loop==3)then timer=119.5-1 end
			if(loop==4)then timer=178.75-1 end
			self.startingloop=loop
			--self.startingloop=1	--(debug only)
			local startingvortexs=(loop-1)*3
			--print("startingvortexs:",startingvortexs)
			--timer=44.0	--(debug frontal cone check)
			self:GotoTime(timer)
			for i=1,startingvortexs do
				local targetarray=slampositions
				local vortex=self.scenario.vortexmanager:NewVortex(targetarray[i][1]-CENTERX,targetarray[i][2]-CENTERY)
				vortex.state=1	-- no lava waves on spawn
			end			
			self.scenario.pauseallmechanics=false
			self.scenario.playeruptime=0
			self.scenario.playerdowntime=0
			
		end
		
		

		
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