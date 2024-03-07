do
	--TODO: volatile code reuse -- only use function in multiplayer/messagehandler.lua
	local function IAmGameHost(multiplayer)
		if(not IsInGroup("player"))then return true end
		if(multiplayer.host)then return true end
		return false		
	end

	do
		XPRACTICE.RASZAGETH.Event = {}
		local class=XPRACTICE.RASZAGETH.Event
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
		XPRACTICE.RASZAGETH.Schedule=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.Schedule
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)		
			self.events={}
			self.time=0
			self.nexteventid=nil
		end
		
		function class:NewEvent(m,s,func)
			local event=XPRACTICE.RASZAGETH.Event.new()
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
			
			-----------------------------------TANKBUSTER-----------------------------------
			self:NewEvent(0,05,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.tankbuster:Broadcast_v2(scenario)
				end				
			end)			
			
			-----------------------------------BOMBS-----------------------------------
			self:NewEvent(0,15,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.bombs:Broadcast_v2(scenario)
				end				
			end)		
			
			-----------------------------------BREATH-----------------------------------
			self:NewEvent(0,20,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.breath:Broadcast_v2(scenario)
				end				
			end)
			
			-----------------------------------SPARKS-----------------------------------
			self:NewEvent(0,28,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.sparks:Broadcast_v2(scenario)
				end				
			end)					
				
			
			-----------------------------------TANKBUSTER-----------------------------------
			self:NewEvent(0,32,function()
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.tankbuster:Broadcast_v2(scenario)
				end				
			end)	

			-----------------------------------PUSHBACK-----------------------------------
			self:NewEvent(0,35,function()
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					scenario.pushbackduration=3.0	--leader sends to other players
					spells.pushback:Broadcast_v2(scenario)
				end				
			end)	

			-----------------------------------BREATH-----------------------------------
			self:NewEvent(0,45,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.breath:Broadcast_v2(scenario)
				end				
			end)				

			-----------------------------------BOMBS-----------------------------------
			self:NewEvent(0,50,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.bombs:Broadcast_v2(scenario)
				end				
			end)				
			
			-----------------------------------TANKBUSTER-----------------------------------
			self:NewEvent(0,55,function()
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.tankbuster:Broadcast_v2(scenario)
				end				
			end)	
			
			-----------------------------------BREATH-----------------------------------
			self:NewEvent(1,03,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.breath:Broadcast_v2(scenario)
				end				
			end)				
			
			-----------------------------------PUSHBACK-----------------------------------
			self:NewEvent(1,10,function()
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					scenario.pushbackduration=3.5	--leader sends to other players
					spells.pushback:Broadcast_v2(scenario)
				end				
			end)	
			
			-----------------------------------SPARKS-----------------------------------
			self:NewEvent(1,21,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.sparks:Broadcast_v2(scenario)
				end				
			end)					
			
			
			-----------------------------------TANKBUSTER-----------------------------------
			self:NewEvent(1,25,function()
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.tankbuster:Broadcast_v2(scenario)
				end				
			end)	

			-----------------------------------BOMBS-----------------------------------
			self:NewEvent(1,27,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.bombs:Broadcast_v2(scenario)
				end				
			end)	
			
			-----------------------------------BREATH-----------------------------------
			self:NewEvent(1,30,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.breath:Broadcast_v2(scenario)
				end				
			end)				
			
			-----------------------------------TANKBUSTER-----------------------------------
			self:NewEvent(1,43,function()
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.tankbuster:Broadcast_v2(scenario)
				end				
			end)	
			
			-----------------------------------PUSHBACK-----------------------------------
			self:NewEvent(1,45,function()
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					scenario.pushbackduration=4.0	--leader sends to other players
					spells.pushback:Broadcast_v2(scenario)
				end				
			end)			

			-----------------------------------BOMBS-----------------------------------
			self:NewEvent(2,00,function()	
				--if(IAmGameHost(multiplayer))then
if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.bombs:Broadcast_v2(scenario)
				end				
			end)	

			-----------------------------------SPARKS-----------------------------------
			self:NewEvent(2,07,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.sparks:Broadcast_v2(scenario)
				end				
			end)					
			
			
			-----------------------------------TANKBUSTER-----------------------------------
			self:NewEvent(2,12,function()
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.tankbuster:Broadcast_v2(scenario)
				end				
			end)	
			
			-----------------------------------BREATH-----------------------------------
			self:NewEvent(2,14,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.breath:Broadcast_v2(scenario)
				end				
			end)				
			
			-----------------------------------PUSHBACK-----------------------------------
			self:NewEvent(2,20,function()
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					scenario.pushbackduration=4.5	--leader sends to other players
					spells.pushback:Broadcast_v2(scenario)
				end				
			end)			
			
			-----------------------------------BREATH-----------------------------------
			self:NewEvent(2,30,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.breath:Broadcast_v2(scenario)
				end				
			end)				
			
			-----------------------------------BOMBS-----------------------------------
			self:NewEvent(2,35,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.bombs:Broadcast_v2(scenario)
				end				
			end)				

			-----------------------------------TANKBUSTER-----------------------------------
			self:NewEvent(2,40,function()
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.tankbuster:Broadcast_v2(scenario)
				end				
			end)	
			
			-----------------------------------BREATH-----------------------------------
			self:NewEvent(2,48,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.breath:Broadcast_v2(scenario)
				end				
			end)				
			
			-----------------------------------PUSHBACK-----------------------------------
			self:NewEvent(2,55,function()
				scenario.statuslabel:SetText("(If you're using the fast transition strat, phase 1 ends here.)",5.0)
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					scenario.pushbackduration=5	--leader sends to other players
					spells.pushback:Broadcast_v2(scenario)
				end				
			end)
			
			-----------------------------------SPARKS-----------------------------------
			self:NewEvent(3,06,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.sparks:Broadcast_v2(scenario)
				end				
			end)			

			-----------------------------------TANKBUSTER-----------------------------------
			self:NewEvent(3,10,function()
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.tankbuster:Broadcast_v2(scenario)
				end				
			end)	
			
			-----------------------------------BOMBS-----------------------------------
			self:NewEvent(3,12,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.bombs:Broadcast_v2(scenario)
				end				
			end)			
			
			-----------------------------------BREATH-----------------------------------
			self:NewEvent(3,15,function()	
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.breath:Broadcast_v2(scenario)
				end				
			end)					
			
			-----------------------------------TANKBUSTER-----------------------------------
			self:NewEvent(3,28,function()		-- not sure on timing, nobody ever gets this far in logs anymore
				if(IAmGameHost(multiplayer))then
--if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					spells.tankbuster:Broadcast_v2(scenario)
				end				
			end)				
			
			-----------------------------------PUSHBACK-----------------------------------
			self:NewEvent(3,30,function()
				scenario.statuslabel:SetText("End of phase 1.\nPush boss to 65% within the next 6 seconds, or you probably wipe.",5.0)
			
				scenario.pauseallmechanics=true
				scenario.pausebutton:Select(true)
				scenario.playbutton:Select(false)
			end)
			
			
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