do
	XPRACTICE.MULTIPLAYERV2.EventHandler=function(self,event,...)	
		local prefix,text,channel,sender,sender2=...
		
		if(self.forcesingleplayer)then return end
				
		--quick workaround for blizzard arg swap incident
		if(sender)then
			if(not string.find(sender,"-"))then
				sender=sender2
			end
			if(not string.find(sender,"-"))then
				local name1,name2=UnitFullName("player")
				sender=sender.."-"..name2
			end
		end
		
		
		if(event=="CHAT_MSG_ADDON")then
			if(prefix==XPRACTICE.MULTIPLAYERV2.PREFIX)then
				--print("CHAT_MSG_ADDON:",text,sender)
				if(channel=="PARTY" or channel=="RAID")then
					XPRACTICE.MULTIPLAYERV2.ProcessInput(text,sender)
				end
			end
		elseif(event=="GROUP_ROSTER_UPDATE")then
			for k,v in pairs(XPRACTICE.MULTIPLAYERV2.modulelist) do					
				for i=1,#v do
					local multi=v[i]
					multi.receivedpackettracker={}
					multi.sentpackettracker={}
				end
			end
		
			--print("group roster update!")
			if(IsInGroup())then
				for k,v in pairs(XPRACTICE.MULTIPLAYERV2.modulelist) do					
					for i=1,#v do
						local multi=v[i]
						if(multi.joinedsolo and GetNumGroupMembers()>1)then
							multi.scenario.statuslabel:SetText("Multiplayer features are now enabled!",3.0)							
							multi:SendHello() -- reminder: if a solo player joins a solo player, the player that invited will already be part of a (solo) group when player 2 accepts the group invite
						end
						if(multi.roomlocked)then											
							if(multi.host)then		
								multi:FormatAndSend("ALREADYINPROGRESS")
							end
						else
							multi:SendIExist()
						end
						if(GetNumGroupMembers()>1)then
							multi.joinedsolo=false
						else
							multi.joinedsolo=true
							multi.scenario.statuslabel:SetText("You are not in a group!\nJoin a group to enable multiplayer features.",nil)
						end
					end	
				end
			else
				for k,v in pairs(XPRACTICE.MULTIPLAYERV2.modulelist) do					
					for i=1,#v do
						local multi=v[i]
						multi.joinedsolo=true
						multi.scenario.statuslabel:SetText("You are not in a group!\nJoin a group to enable multiplayer features.",nil)
					end
				end
			end
		
		elseif(event=="CHAT_MSG_ADDON_LOGGED")then
			if(channel=="PARTY" or channel=="RAID")then
				--TODO: if sender doesn't have a last name, maybe panic
				if(prefix==XPRACTICE.MULTIPLAYERV2.PREFIX_SAY)then
					XPRACTICE.MULTIPLAYERV2.ProcessLoggedSpeech(text,sender)
				elseif(prefix==XPRACTICE.MULTIPLAYERV2.PREFIX_YELL)then				
					XPRACTICE.MULTIPLAYERV2.ProcessLoggedSpeech("\124cffff3f40"..text.."\124r",sender)
				end
			end
		end
	end
	
	--TODO: move to message base class
	local function MessageHostCheck(messagetype,multiplayermodule,sender)
		if(messagetype.requirehost)then
			local name,server=strsplit("-",sender)
			--local officer=IsRealOfficer(name)
			local ghost=multiplayermodule.allplayers[sender]
			if(not ghost)then return false end
			if(multiplayermodule.hostname~=sender)then 
				return false 
			end
		end	
		return true		
	end	
	
	
	local function FindNullByte(str)
		local str2=strsplit(string.char(0),str)
		if(str==str2)then return false end
		return #str2+1
	end
	
	XPRACTICE.MULTIPLAYERV2.ProcessInput=function(text,sender,selfcomms)		
		
		--TODO: if sender doesn't have a last name, maybe panic
		--print("Process (raw):",sender,text)		
		if(string.len(text)<7)then return end
		local trackingcode=string.sub(text,1,1)
		local roomcode=string.sub(text,2,5)		
		if(not XPRACTICE.MULTIPLAYERV2.modulelist[roomcode])then return end		
		local msgstart=string.byte(string.sub(text,6,6))
		local msglen=string.sub(text,7,8)		
		local msgcode=string.sub(text,9,10)		
		local argstr=string.sub(text,11)
		
		--if(XPRACTICE.Config.TrackCommunicationErrors)then
		if(true)then
			for i=1,#XPRACTICE.MULTIPLAYERV2.modulelist[roomcode] do
				local multiplayermodule=XPRACTICE.MULTIPLAYERV2.modulelist[roomcode][i]
				if(multiplayermodule)then
					if(multiplayermodule.forcesingleplayer and not selfcomms)then return end
					if(multiplayermodule.receivedpackettracker[sender])then
						--print("Received",string.byte(trackingcode))
						--"1" code is a reset signal
						if(string.byte(trackingcode)==1) then multiplayermodule.receivedpackettracker[sender]=1 end
						
						if(multiplayermodule.receivedpackettracker[sender]==string.byte(trackingcode))then
							--do nothing
							--print("(Expected #"..multiplayermodule.receivedpackettracker[sender]..", got #"..string.byte(trackingcode)..")")
						else							
							-- multiplayermodule.scenario.packetlosslabel:SetText("COMMUNICATION ERROR DETECTED.  Check your chat window.",1.0)
							-- local diff=string.byte(trackingcode)-multiplayermodule.receivedpackettracker[sender]
							-- if(diff<0)then diff=diff+254 end
							-- if(not multiplayermodule.packeterrors[sender])then
								-- multiplayermodule.packeterrors[sender]=0
							-- end
							-- multiplayermodule.packeterrors[sender]=multiplayermodule.packeterrors[sender]+diff
							-- print("Lost something from "..sender..".  "..tostring(multiplayermodule.packeterrors[sender]).." errors so far.")
							-- print("(Expected #"..multiplayermodule.receivedpackettracker[sender]..", got #"..string.byte(trackingcode)..")")					
						end				
					else
						multiplayermodule.receivedpackettracker[sender]=string.byte(trackingcode)
					end
					multiplayermodule.receivedpackettracker[sender]=string.byte(trackingcode)+1
					
					if(multiplayermodule.receivedpackettracker[sender]>255)then multiplayermodule.receivedpackettracker[sender]=2 end
					--print("Next:",multiplayermodule.receivedpackettracker[sender])
				end
			end
		end
		
		
		
		for i=1,#XPRACTICE.MULTIPLAYERV2.modulelist[roomcode] do
			local multiplayermodule=XPRACTICE.MULTIPLAYERV2.modulelist[roomcode][i]
			if(multiplayermodule)then		
				local message=string.sub(text,7)
				
				--print("Packet #",string.byte(trackingcode),"from",sender,"length",#message)
				--print("ID",string.byte(trackingcode),"room",roomcode,"msgstart",msgstart)
				
				local expectednextmsgstart=1
				
				if(not multiplayermodule.incomingmessagebuffer[sender])then 			
					multiplayermodule.incomingmessagebuffer[sender]=""
					-- if this is the first packet received from sender, discard any message leftovers and skip to the start of the next message
					message=string.sub(message,msgstart)
					if(msgstart==255)then 
						-- if this is continuing a very long message, discard it entirely
						return 
					end			
				else
					-- mark the start of the next message with null byte (which can't be sent over comms) so we can check for comms errors
					if(msgstart~=255)then
						--print("Insert 0 at msgstart:",msgstart)
						message=string.sub(message,1,msgstart-1)..string.char(0)..string.sub(message,msgstart)
					end
				end

				
				multiplayermodule.incomingmessagebuffer[sender]=multiplayermodule.incomingmessagebuffer[sender]..message
				--print("Incoming buffer contents:",multiplayermodule.incomingmessagebuffer[sender])	-- won't display correctly now that we're using null byte
				--print("Current incoming buffer length:",#multiplayermodule.incomingmessagebuffer[sender])
				
				local safety=100
				while(safety>0 and #multiplayermodule.incomingmessagebuffer[sender]>0)do
					safety=safety-1
					local incoming=multiplayermodule.incomingmessagebuffer[sender]
					if(string.sub(incoming,1,1)==string.char(0))then
						--if we're here, then there were probably no communication errors.  remove the nullbyte and continue
						--print("Found a zero.  Remove it and continue")
						multiplayermodule.incomingmessagebuffer[sender]=string.sub(multiplayermodule.incomingmessagebuffer[sender],2)
					else
						--print("Current buffer length:",#incoming)					
						-- at this point, incoming should include at least the start of the next message (if not the whole thing)
						local highbit=string.byte(string.sub(incoming,1,1))
						local lowbit=string.byte(string.sub(incoming,2,2))
						-- reminder: base 255
						if(highbit==255)then highbit=0 end
						if(lowbit==255)then lowbit=0 end									
						local msglength=nil
						if(highbit~=nil and lowbit~=nil)then --OOPS.  FIXED NOW, HOPEFULLY
							msglength=highbit*255+lowbit 
						end	
						--print("Expected message length:",msglength,highbit,lowbit)
						if(msglength==nil or #incoming<msglength or msglength==0)then
							-- message isn't complete yet; exit and wait for next packet
							-- ...but first, check if buffer contains 0byte.  if it does, there was a comms error somewhere
							local nullbyte=FindNullByte(incoming)
							if(nullbyte)then
								--print("Panic! Buffer contains unhandled zero byte, meaning the previous message's length was sent or received incorrectly.")
								-- discard everything in the buffer up to the marked start-of-next-message and continue from there
								multiplayermodule.incomingmessagebuffer[sender]=string.sub(multiplayermodule.incomingmessagebuffer[sender],nullbyte+1)
								--print("Truncate at 0 byte:",nullbyte+1)
							else
								--print("End of buffer contains incomplete message; break and wait for next packet")						
								safety=-1
							end
						else
							local completemessage=string.sub(incoming,1,msglength)
							local nullbyte=FindNullByte(completemessage)
							if(nullbyte)then
								--print("Panic! \"Complete\" message contains unhandled zero byte, meaning the previous message's length was sent or received incorrectly.")
								multiplayermodule.incomingmessagebuffer[sender]=string.sub(multiplayermodule.incomingmessagebuffer[sender],nullbyte+1)
								print("Truncate at 0 byte:",nullbyte+1)
							else
								--success!
								--print("Process: ",completemessage)
								XPRACTICE.MULTIPLAYERV2.ProcessMessage(roomcode,sender,completemessage)
								-- truncate at msglength
								multiplayermodule.incomingmessagebuffer[sender]=string.sub(multiplayermodule.incomingmessagebuffer[sender],msglength+1)
								--print("Truncate at message length:",msglength+1)
							end
							--print("Remaining buffer:",#multiplayermodule.incomingmessagebuffer[sender])
						end
					end
				end
			end
		end
		
	end	
	
	XPRACTICE.MULTIPLAYERV2.ProcessMessage=function(roomcode,sender,text)
		if(string.len(text)<4)then return end
		local msglen=string.sub(text,1,2)
		--print("Msg length:",string.byte(string.sub(msglen,1,1)),string.byte(string.sub(msglen,2,2)))
		local msgcode=string.sub(text,3,4)
		--print("Msgcode low:",string.byte(string.sub(text,4,4)))
		local argstr=string.sub(text,5)
		--print("Process:",msgcode,argstr)
		

		if(msgcode==XPRACTICE.MULTIPLAYERV2.Messagetypes.CUSTOM.BCDmessagecode)then		
			--print("msgcode is custom")
			if(string.len(text)<6)then return end
			local custommsgcode=string.sub(text,5,6)
			local argstr=string.sub(text,7)
		
			--scenario custom command!
			for i=1,#XPRACTICE.MULTIPLAYERV2.modulelist[roomcode] do
				local messagetype=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomcode].MessagetypesBCDPointer[custommsgcode]				
				if(not messagetype)then return end				
				if(messagetype:MessageIsValid(sender))then
					
					for i=1,#XPRACTICE.MULTIPLAYERV2.modulelist[roomcode] do
						local multiplayermodule=XPRACTICE.MULTIPLAYERV2.modulelist[roomcode][i]
						if(multiplayermodule)then	
							if(MessageHostCheck(messagetype,multiplayermodule,sender))then
								tinsert(multiplayermodule.newmessages,{messagetype,sender,argstr,true,roomcode})
							end
						end
					end
				end
			end
		else
			-- generic command
			local messagetype=XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[msgcode]
			--print("Messagetype:",messagetype)
			if(not messagetype)then return end
			--print("Validate:",GetTime(),sender,messagetype.messagename,argstr,"(length",tostring(6+string.len(argstr))..")")
			if(messagetype:MessageIsValid(sender))then
			
				--print("Process:",GetTime(),sender,messagetype.messagename,argstr,"(length",tostring(6+string.len(argstr))..")")
				for i=1,#XPRACTICE.MULTIPLAYERV2.modulelist[roomcode] do
					local multiplayermodule=XPRACTICE.MULTIPLAYERV2.modulelist[roomcode][i]
					if(multiplayermodule)then	
						if(MessageHostCheck(messagetype,multiplayermodule,sender))then
							--print("queue up",messagetype,sender,"-"..argstr.."-")
							tinsert(multiplayermodule.newmessages,{messagetype,sender,argstr,false,roomcode})
						end
					end
				end
			end
		end
	end
	
	function XPRACTICE.MULTIPLAYERV2.ProcessLoggedSpeech(message,sender)
		for k,v in pairs(XPRACTICE.MULTIPLAYERV2.modulelist) do
			for i=1,#v do
				local multiplayermodule=v[i]
				if(multiplayermodule)then
					local player=multiplayermodule.allplayers[sender]
					if(player)then
						if(not player:IsDeadInGame())then
							player:CreateSpeechBubble(message)
						end
					end
				end
			end
		end	
	end
	

	
	--MP Session start
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2:OverrideSendChatMessage()
		XPRACTICE.oSendChatMessage = SendChatMessage;
		SendChatMessage=function(msg,chatType,language,channel)
			--print("SCM",msg,chatType,language,channel)
		  if(chatType == nil or chatType=="NIL" or chatType == "SAY" or chatType == "YELL")then
			--XP syncing smt smt
			local text=msg
			if(text=="")then return end		
			if(not IsInGroup() or GetNumGroupMembers()<2)then	--TODO: GetNumGroupMembers check should be baseline
				local name1,name2=UnitFullName("player")
				--print("Send LOCAL",text)
				if(chatType=="SAY" or chatType=="NIL" or chatType==nil)then
					XPRACTICE.MULTIPLAYERV2.ProcessLoggedSpeech(text,name1.."-"..name2)				
				elseif(chatType=="YELL")then
					XPRACTICE.MULTIPLAYERV2.ProcessLoggedSpeech("\124cffff3f40"..text.."\124r",name1.."-"..name2)
				end
			end				
			local channel="PARTY"
			if(IsInRaid())then channel="RAID" end		
			if(chatType=="SAY" or chatType=="NIL" or chatType==nil)then
				C_ChatInfo.SendAddonMessageLogged(XPRACTICE.MULTIPLAYERV2.PREFIX_SAY,text,channel)
			elseif(chatType=="YELL")then
				C_ChatInfo.SendAddonMessageLogged(XPRACTICE.MULTIPLAYERV2.PREFIX_YELL,text,channel)
			end
		  else
			XPRACTICE.oSendChatMessage(msg,chatType,language,channel)
		  end
		end
	end
	
	
	--MP Session End
	function XPRACTICE.MULTIPLAYERV2.Multiplayerv2:RestoreSendChatMessage()
		if(XPRACTICE.oSendChatMessage)then
			SendChatMessage = XPRACTICE.oSendChatMessage
		end
	end
	
	
	
end