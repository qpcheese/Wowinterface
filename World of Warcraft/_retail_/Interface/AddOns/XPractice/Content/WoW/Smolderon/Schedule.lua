local PATTERNS={	
	{"13","24","35","12","45","234","15"},	
	{"23","14","25","12","2345","1234","345"},
	{"13","24","135","24","15","234","15","24","135"}
	}

--[[
	always 30sec channel
	patterns 1+2:
		tick resolves every 4 seconds starting at 25.0 (ending at 1.0)
		(telegraph spawns every 4 seconds starting at 29.0)
	pattern 3:
		tick resolves every 3 seconds, still starting at 25.0 (ending at 1.0)
		(telegraph spawns every 3 seconds, still starting at 29.0)
		telegraph has same duration, so there's some overlap
	pattern 4 is identical to pattern two (2)
	
	
	one(1)-indexed patterns: (1 is center)
	Pattern 1
	1 3
	 2 4
	  3 5
	12
	   45
	 234
	1   5
	
	Pattern 2
	 23
	1  4
	 2  5
	12
	 2345
	1234
	  345
	  
	Pattern 3
	1 3
	 2 4
	1 3 5
	 2 4
	1   5
	 234
	1   5
	 2 4
	1 3 5

	Distance to edge of platform is 56.32


]]--


do



	--TODO: volatile code reuse -- only use function in multiplayer/messagehandler.lua
	local function IAmGameHost(multiplayer)
		if(not IsInGroup("player"))then return true end
		if(multiplayer.host)then return true end
		return false		
	end

	do
		XPRACTICE.SMOLDERON.Event = {}
		local class=XPRACTICE.SMOLDERON.Event
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
		XPRACTICE.SMOLDERON.Schedule=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SMOLDERON.Schedule
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)		
			self.events={}
			self.time=0
			self.nexteventid=nil
		end
		
		function class:NewEvent(m,s,func)
			local event=XPRACTICE.SMOLDERON.Event.new()
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
		

		
				
		function class:CreateAssociatedObjects()
			local schedule=self
			local scenario=self.scenario
			local multiplayer=scenario.multiplayer		
			local boss=scenario.bosses[1]
			local spells=boss.combatmodule
			
			self.events={}
			self.nexteventid=1

		end
		
		

		function class:SetupEverything(index)		
			if(WeakAuras)then WeakAuras.ScanEvents("XP_SMOLDERON_PATTERN",index) end
		
			local scenario=self.scenario			
			
			scenario:ResetTempVars()
			
			self.currentpattern=PATTERNS[index]
			self:NewEvent(0,0,function() 
				scenario.spellfxmanager:Reset() 
				-- ultimately this was easier than using cast/channel
				scenario.bosses[1].animationmodule:PlayAnimation(XPRACTICE.SMOLDERON.AnimationList.SpecialAttackCast1)
				scenario.bosses[1].position.x=0
				scenario.bosses[1].position.y=0
				XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.StopAI(scenario.bosses[1])
			end)
			self:NewEvent(0,1.5,function() 
				-- TODO: cast cosmetic spell
				if(WeakAuras)then WeakAuras.ScanEvents("XP_SMOLDERON_SPELL_CAST",index) end
			end)
			self:NewEvent(0,3.5,function() 
				-- knockback
				local angle=math.atan2(scenario.player.position.y,scenario.player.position.x)
				if(WeakAuras)then WeakAuras.ScanEvents("XP_SMOLDERON_SPELL_CHANNEL",index) end
				scenario.player.velocity.x=math.cos(angle)*XPRACTICE.SMOLDERON.KNOCKBACK_HZ_VELOCITY
				scenario.player.velocity.y=math.sin(angle)*XPRACTICE.SMOLDERON.KNOCKBACK_HZ_VELOCITY
				scenario.player.velocity.z=XPRACTICE.SMOLDERON.KNOCKBACK_VT_VELOCITY
			end)

			self:NewEvent(0,3.5+XPRACTICE.SMOLDERON.MOTE_SPAWN_DELAY,function() 
				-- TODO: spawn motes
				-- TODO: only if player is not deadingame
				if(not scenario.player:IsDeadInGame())then
					scenario.spellfxmanager:Motes(scenario.player)
				end
			end)
			
			local offset=3.5+1.0
			for i=1,#self.currentpattern do			
				--print("?",offset)
				self:NewEvent(0,offset,function()
						for j=1,#self.currentpattern[i] do
							--print("Telegraph:",tonumber(string.sub(self.currentpattern[i],j,j)))
							scenario.spellfxmanager:CreateTelegraph(tonumber(string.sub(self.currentpattern[i],j,j)),i)
						end
					end)
				if(i~=#self.currentpattern)then
					if(index==3)then offset=offset+3.0 else offset=offset+4.0 end
				else
					offset=offset+4.0+1
				end
			end
			
			self:NewEvent(0,offset,function()
					if(WeakAuras)then WeakAuras.ScanEvents("XP_SMOLDERON_DONE",index) end
					scenario.multiplayer:FormatAndSend("UNLOCK")
					scenario.pauseallmechanics=true
				end)

		end


		
		function class:Step(elapsed)
			super.Step(self,elapsed)

			
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
								--print("?",nextevent.time,self.time)							
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

-- for debug only:
-- /run WeakAuras.ScanEvents=function(...)print(...)end