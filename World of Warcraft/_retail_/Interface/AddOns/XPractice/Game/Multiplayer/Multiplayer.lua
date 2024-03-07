--TODO: local ok=C_ChatInfo.IsAddonMessagePrefixRegistered("XP")

--TODO: maybe move this function somewhere else
function XPRACTICE.MULTIPLAYER.IsRealOfficer(unit)
	unit=strsplit("-",unit)
	return ((UnitIsGroupLeader(unit)==true) or (UnitIsGroupAssistant(unit)==true) or not IsInGroup(unit) or XPRACTICE.DEBUG.alwaysofficer)
end


do
	local super=XPRACTICE.GameObject
	XPRACTICE.MULTIPLAYER.Multiplayer=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.MULTIPLAYER.Multiplayer
	
	function class:Setup(roomnumber,scenario,environment)
		super.Setup(self,environment)
		self.joinedsolo=not IsInGroup() --TODO NEXT:
		self.joinedgameinprogress=false
		self.dead=false
		self:ChangeRooms(roomnumber)
		self.scenario=scenario		
		self.messages={}
		self.newmessages={}
		self.sentpackettracker={}
		self.receivedpackettracker={}
		self.packeterrors={}
		if(not XPRACTICE.MULTIPLAYER.modulelist[self.roomBCD])then
			XPRACTICE.MULTIPLAYER.modulelist[self.roomBCD]={}
		end
		tinsert(XPRACTICE.MULTIPLAYER.modulelist[self.roomBCD],self)	
		self.allplayers={}		
		self.previousplayerghosts={}	-- to preserve player ghosts between rooms
		self.groupmembers={}	-- to track when players join or leave the group (mostly to leave the group)
		local name1,name2=UnitFullName("player")
		local myfullname=name1.."-"..name2
		self.allplayers[myfullname]=self.scenario.player
		self.guidpointers={}
		local mypaddedunitguid=self:GetPaddedUnitGUID(myfullname)
		if(mypaddedunitguid)then
			self.guidpointers[mypaddedunitguid]=self.allplayers[myfullname]
			self.allplayers[myfullname].paddedguid=mypaddedunitguid
		end
		self.sortedguidpointers={}
		self.host=false
		self.hostname=""
		self.officer=false
		self.roomlocked=false
		self.roomlockpending=false
		self.rollcallinprogress=false
		self.nextrollcallindex=1
		self.rollcallnames={}
		self.rollcallpointers={}		
		--so it turns out that rapidly-sent messages will be received precisely 200 milliseconds apart.
		-- messages can be queued faster than this, but they will be batched together for the next tick.
		-- unknown whether this process takes place send-side, receive-side, or both.
		self.throttletimer=0
		--self.throttlerate=0.500	-- throttlerate went as low as 0.250 in testing but let's get someone important to weigh in on this first
		self.throttlerate=1.000	-- system now limits messages to about 1 per sec.  temporary patch while we work on something more robust
		self.prevmoving=false
		self.prevbackpedal=false
		self.prevmidair=false
		self.extraobjectstimer=nil
		self.prevfloorbelow=false
		self.prevwallchecking=false
		self.nextwallcheckupdate=0		
	end
	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		for i=1,#self.newmessages do
			tinsert(self.messages,self.newmessages[i])
			self.newmessages[i]=nil
		end
		
		for i=1,#self.messages do
			--print("??!?",i,#self.messages,self.messages[i])
			--DevTools_Dump(self.messages[i])
			--print("1")
			local messagetype=self.messages[i][1]
			--print("2")
			local sender=self.messages[i][2]
			--print("3")
			local args=messagetype:StringToArgs(self.messages[i][3])		
			-- empty args = {}.
			-- if args is nil, an error was detected
			if(args==nil)then			
				if(not self.packeterrors[sender])then
					self.packeterrors[sender]=0
				end
				self.packeterrors[sender]=self.packeterrors[sender]+1
				if(XPRACTICE.Config.TrackCommunicationErrors)then
					self.scenario.packetlosslabel:SetText("COMMUNICATION ERROR DETECTED.  Check your chat window.",1.0)
					print("Malformed message from "..sender..".  "..tostring(self.packeterrors[sender]).." errors so far.")
				end
			end			
			--print("4")
			local custom=self.messages[i][4]
			local roomcode=self.messages[i][5]
			-- colon notation doesn't work here
			if(custom)then				
				if(self["HandleCustom_"..messagetype.messagename])then
					self["HandleCustom_"..messagetype.messagename](self,sender,args)
				else
					--TODO: complain very loudly if debug messages are on
					print("WARNING: X Practice attempted to handle undefined message \""..messagetype.messagename.."\".  (You should never see this message.  If you are seeing this message, something went horribly wrong.)")
				end
			else
				--print("??","Handle_"..messagetype.messagename)
				if(self["Handle_"..messagetype.messagename])then
					self["Handle_"..messagetype.messagename](self,sender,args)
				else
					--TODO: complain very loudly if debug messages are on
					print("WARNING: X Practice attempted to handle undefined message \""..messagetype.messagename.."\".  (You should never see this message.  If you are seeing this message, something went horribly wrong.)")
				end				
			end
			--print("5")
			--print("Room:",roomcode,"Msgtype:",messagetype.messagename)
			self.messages[i]=nil
			--print("6")
			--print("nilled",i)
		end		
		
		if(self.throttletimer>0)then
			self.throttletimer=self.throttletimer-elapsed
		end
		
		self:ExtraObjectsCheck(elapsed)
		
		local player=self.scenario.player
		if(player)then
			local midair=(player.position.z>0 or player.velocity.z~=0)
			local moving=(player.velocity.x~=0 or player.velocity.y~=0)	
			local backpedal=(player.backpedal)
			local walking=(player.walking)
			if(backpedal and not self.prevbackpedal)then
				self:SendBackpedalStart()
			elseif(self.prevbackpedal and not backpedal)then
				self:SendBackpedalStop()
			end
			if(walking and not self.prevwalking)then
				self:SendWalkStart()
			elseif(self.prevwalking and not walking)then
				self:SendWalkStop()
			end			
			
			if(midair and not self.prevmidair)then
				self:SendMidair()
			elseif(moving and not self.prevmoving)then
				self:SendRun()
			elseif(self.prevmoving and not moving)then
				--self:SendIExist() --TODO: StopMoving instead?
				self:SendRun()
			elseif(moving)then				
				if(self.throttletimer<=0)then
					--TODO: check for forced movement (don't need to send run if rolling, for instance)
					--print("!")
					self:SendRun()
				end
			elseif(not moving and (player.orientation.yaw~=player.orientation_displayed.yaw))then
				if(self.throttletimer<=0)then
					self:SendTurnInPlace()
				end
			end
			
			self.prevmoving=moving
			self.prevmidair=midair
			self.prevbackpedal=backpedal
			self.prevwalking=walking
			
			local floorbelow=(player.floorbelow)
			if(floorbelow ~= self.prevfloorbelow)then
				self:SendFloorBelow()
			end
			self.prevfloorbelow=floorbelow
			local wallchecking=(player.wallchecking)
			if(wallchecking ~= self.prevwallchecking)then
				self:SendWallChecking()
				self.nextwallcheckupdate=self.environment.localtime+1.0
			end				
			self.prevwallchecking=wallchecking
			if(wallchecking)then
				if(self.environment.localtime>=self.nextwallcheckupdate)then
					self:SendWallChecking()
					self.nextwallcheckupdate=self.environment.localtime+1.0
				end
			end			
		end
		
		
	end	
	
	function class:ChangeRooms(roomnumber)
		self.roomnumber=roomnumber
		self.roomBCD=XPRACTICE.MULTIPLAYER.Datatypes.BCD.ToString(roomnumber)		
	end
	
	
	function class:GetPaddedUnitGUID(sender)
		local unitguid=UnitGUID(sender)
		if(not unitguid)then
			local name,server=strsplit("-",sender)
			unitguid=UnitGUID(name)
		end
		if(not unitguid)then
			--print("UnitGUID missing from sender \""..sender.."\"; please tell the author about this.")
			return nil
		end
		if(string.sub(unitguid,1,7)~="Player-")then
			--print("Malformed UnitGUID \""..unitguid.."\" from sender \""..sender.."\"; please tell the author about this.")
			return nil	
		end
		local guid=string.sub(unitguid,8)	-- remove "Player-" tag
		return string.format("%-16s",guid)
	end
	
	function class:FormatAndSend(messagetype,...)
		local name1,name2=UnitFullName("player")
		local myfullname=name1.."-"..name2	
		if(not self.sentpackettracker[myfullname])then
			-- Send "1" if the sender believes this is their first message.
			-- This prompts the receivers to reset the tracker ID, even if they have previously received messages.
			self.sentpackettracker[myfullname]=1
		else
			self.sentpackettracker[myfullname]=self.sentpackettracker[myfullname]+1
			if(self.sentpackettracker[myfullname]>255)then self.sentpackettracker[myfullname]=2 end
		end
		local packetid=string.char(self.sentpackettracker[myfullname])
		--print("Send",self.sentpackettracker[myfullname],messagetype)
		self.throttletimer=self.throttlerate
		local msgclass=XPRACTICE.MULTIPLAYER.Messagetypes[messagetype]
		local msgtypestr=msgclass.BCDmessagecode
		local argsstr=msgclass:ArgsToString(...)
		local text=packetid..self.roomBCD..msgtypestr..argsstr		
		XPRACTICE.MULTIPLAYER.Send(text)
	end
	
	function class:FormatAndSendCustom(messagetype,...)
		-- if(messagetype=="BOSS_EXPLOSIVERUNES")then
			-- print("!")
			-- print(...)
		-- end
		local name1,name2=UnitFullName("player")
		local myfullname=name1.."-"..name2	
		if(not self.sentpackettracker[myfullname])then
			self.sentpackettracker[myfullname]=1
		else
			self.sentpackettracker[myfullname]=self.sentpackettracker[myfullname]+1
			if(self.sentpackettracker[myfullname]>255)then self.sentpackettracker[myfullname]=2 end
		end
		local packetid=string.char(self.sentpackettracker[myfullname])
		--print("Send",self.sentpackettracker[myfullname],messagetype)
		self.throttletimer=self.throttlerate
		local msgclass=XPRACTICE.MULTIPLAYER["CUSTOM_"..self.roomBCD].Messagetypes[messagetype]
		local msgtypestr=XPRACTICE.MULTIPLAYER.Messagetypes.CUSTOM.BCDmessagecode..msgclass.BCDmessagecode
		local argsstr=msgclass:ArgsToString(...)
		local text=packetid..self.roomBCD..msgtypestr..argsstr		
		XPRACTICE.MULTIPLAYER.Send(text)
	end
	

	
	function class:Cleanup()
		self:SendGoodbye()
		
		super.Cleanup(self)

		local modules=XPRACTICE.MULTIPLAYER.modulelist[self.roomBCD]
		if(modules)then
			for i=#modules,1,-1 do
				if(modules[i].dead)then
					tremove(modules,i)
				end
			end
			if(#modules==0)then
				XPRACTICE.MULTIPLAYER.modulelist[self.roomBCD]=nil
			end
		end
	end


	
	function class:FakeCombatLogMessage(message)
		--print(XPRACTICE.MULTIPLAYER.PREFIX,message,channel)
		local channel="PARTY"
		if(IsInRaid())then channel="RAID" end		
		C_ChatInfo.SendAddonMessage(XPRACTICE.MULTIPLAYER.PREFIX,message,channel)
		
	end
	
	function class:ExtraObjectsCheck(elapsed)	
		if(self.extraobjectstimer)then			
			self.extraobjectstimer=self.extraobjectstimer-elapsed
			if(self.extraobjectstimer<=0)then
				self.extraobjectstimer=nil
				local player=self.scenario.player
				local i=0
				local args={}
				for k,v in pairs(player.extraobjects) do
					if(not v.dead)then
						local objtype
						if(k=="demoniccircle")then objtype="1"
						elseif(k=="transcendence")then objtype="2"
						elseif(k=="lockgate1")then objtype="3"
						elseif(k=="lockgate2")then objtype="4"
						else objtype="X"
						end
						i=i+1
						tinsert(args,objtype)
						tinsert(args,v.position.x)
						tinsert(args,v.position.y)
						tinsert(args,v.position.z)
						tinsert(args,v.orientation_displayed.yaw)
					end
				end
				for j=i+1,5 do
					tinsert(args,"X")
					tinsert(args,0)
					tinsert(args,0)
					tinsert(args,0)
					tinsert(args,0)
				end
				
				self:FormatAndSend("EXTRAOBJECTS",unpack(args))
			end
		end	
	end	
	
	
end

do
	XPRACTICE.MULTIPLAYER.modulelist={}
end


