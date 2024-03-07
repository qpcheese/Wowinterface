do
	XPRACTICE.MULTIPLAYER.EventHandler=function(self,event,...)	
		local prefix,text,channel,sender,sender2=...
		
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
			if(prefix==XPRACTICE.MULTIPLAYER.PREFIX)then
				if(channel=="PARTY" or channel=="RAID")then
					XPRACTICE.MULTIPLAYER.ProcessInput(text,sender)
				end
				if(string.sub(text,1,12)=="VERSIONCHECK")then
					XPRACTICE.MULTIPLAYER.ProcessVersionCheck(text,sender,channel)
				end
			end
		elseif(event=="GROUP_ROSTER_UPDATE")then
			for k,v in pairs(XPRACTICE.MULTIPLAYER.modulelist) do					
				for i=1,#v do
					local multi=v[i]
					multi.receivedpackettracker={}
					multi.sentpackettracker={}
				end
			end
		
			--print("group roster update!")
			if(IsInGroup())then
				for k,v in pairs(XPRACTICE.MULTIPLAYER.modulelist) do					
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
				for k,v in pairs(XPRACTICE.MULTIPLAYER.modulelist) do					
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
				if(prefix==XPRACTICE.MULTIPLAYER.PREFIX_SAY)then
					XPRACTICE.MULTIPLAYER.ProcessLoggedSpeech(text,sender)
				elseif(prefix==XPRACTICE.MULTIPLAYER.PREFIX_YELL)then				
					XPRACTICE.MULTIPLAYER.ProcessLoggedSpeech("\124cffff3f40"..text.."\124r",sender)
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
	
	XPRACTICE.MULTIPLAYER.ProcessInput=function(text,sender)	
		--TODO: if sender doesn't have a last name, maybe panic
		--print("Process (raw):",sender,text)
		if(string.len(text)<7)then return end
		if(string.sub(text,1,12)=="CALL_TO_ARMS")then
			XPRACTICE.MULTIPLAYER.ProcessCallToArms(text,sender)
		end
		
		local trackingcode=string.sub(text,1,1)
		local roomcode=string.sub(text,2,5)
		if(not XPRACTICE.MULTIPLAYER.modulelist[roomcode])then return end
		local msgcode=string.sub(text,6,7)		
		local argstr=string.sub(text,8)
		
		if(XPRACTICE.Config.TrackCommunicationErrors)then
			for i=1,#XPRACTICE.MULTIPLAYER.modulelist[roomcode] do
				local multiplayermodule=XPRACTICE.MULTIPLAYER.modulelist[roomcode][i]
				if(multiplayermodule)then
					if(multiplayermodule.receivedpackettracker[sender])then
						--print("Received",string.byte(trackingcode))
						--"1" code is a reset signal
						if(string.byte(trackingcode)==1) then multiplayermodule.receivedpackettracker[sender]=1 end
						
						if(multiplayermodule.receivedpackettracker[sender]==string.byte(trackingcode))then
							--do nothing
							--print("(Expected #"..multiplayermodule.receivedpackettracker[sender]..", got #"..string.byte(trackingcode)..")")
						else							
							multiplayermodule.scenario.packetlosslabel:SetText("COMMUNICATION ERROR DETECTED.  Check your chat window.",1.0)
							local diff=string.byte(trackingcode)-multiplayermodule.receivedpackettracker[sender]
							if(diff<0)then diff=diff+254 end
							if(not multiplayermodule.packeterrors[sender])then
								multiplayermodule.packeterrors[sender]=0
							end
							multiplayermodule.packeterrors[sender]=multiplayermodule.packeterrors[sender]+diff
							print("Lost something from "..sender..".  "..tostring(multiplayermodule.packeterrors[sender]).." errors so far.")
							print("(Expected #"..multiplayermodule.receivedpackettracker[sender]..", got #"..string.byte(trackingcode)..")")					
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
		
		
		if(msgcode==XPRACTICE.MULTIPLAYER.Messagetypes.CUSTOM.BCDmessagecode)then		
			--scenario custom command!
			if(string.len(text)<9)then return end
			custommsgcode=string.sub(text,8,9)
			argstr=string.sub(text,10)
			for i=1,#XPRACTICE.MULTIPLAYER.modulelist[roomcode] do
				--print("Got custom",roomcode,msgcode..custommsgcode)
				local messagetype=XPRACTICE.MULTIPLAYER["CUSTOM_"..roomcode].MessagetypesBCDPointer[custommsgcode]
				if(not messagetype)then return end
				if(messagetype:MessageIsValid(sender))then
					for i=1,#XPRACTICE.MULTIPLAYER.modulelist[roomcode] do
						local multiplayermodule=XPRACTICE.MULTIPLAYER.modulelist[roomcode][i]
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
			local messagetype=XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[msgcode]
			if(not messagetype)then return end
			--print("Validate:",GetTime(),sender,messagetype.messagename,argstr,"(length",tostring(6+string.len(argstr))..")")
			if(messagetype:MessageIsValid(sender))then	
				--print("Process:",GetTime(),sender,messagetype.messagename,argstr,"(length",tostring(6+string.len(argstr))..")")
				for i=1,#XPRACTICE.MULTIPLAYER.modulelist[roomcode] do
					local multiplayermodule=XPRACTICE.MULTIPLAYER.modulelist[roomcode][i]
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
	
	function XPRACTICE.MULTIPLAYER.ProcessLoggedSpeech(message,sender)
		for k,v in pairs(XPRACTICE.MULTIPLAYER.modulelist) do
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
	function XPRACTICE.MULTIPLAYER.Multiplayer:OverrideSendChatMessage()
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
					XPRACTICE.MULTIPLAYER.ProcessLoggedSpeech(text,name1.."-"..name2)				
				elseif(chatType=="YELL")then
					XPRACTICE.MULTIPLAYER.ProcessLoggedSpeech("\124cffff3f40"..text.."\124r",name1.."-"..name2)
				end
			end				
			local channel="PARTY"
			if(IsInRaid())then channel="RAID" end		
			if(chatType=="SAY" or chatType=="NIL" or chatType==nil)then
				C_ChatInfo.SendAddonMessageLogged(XPRACTICE.MULTIPLAYER.PREFIX_SAY,text,channel)
			elseif(chatType=="YELL")then
				C_ChatInfo.SendAddonMessageLogged(XPRACTICE.MULTIPLAYER.PREFIX_YELL,text,channel)
			end
		  else
			XPRACTICE.oSendChatMessage(msg,chatType,language,channel)
		  end
		end
	end
	
	
	--MP Session End
	function XPRACTICE.MULTIPLAYER.Multiplayer:RestoreSendChatMessage()
		if(XPRACTICE.oSendChatMessage)then
			SendChatMessage = XPRACTICE.oSendChatMessage
		end
	end
	
	
	
end