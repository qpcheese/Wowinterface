do
	function XPRACTICE.MULTIPLAYERV2.Send(text)
		if(not IsInGroup())then
			XPRACTICE.MULTIPLAYERV2.FakeSend(text)
			return
		end
		local channel="PARTY"
		if(IsInRaid())then channel="RAID" end		
											-- use MULTIPLAYER.PREFIX, not MULTIPLAYERV2.PREFIX
		XPRACTICE.MULTIPLAYERV2.ActuallySend(text,channel)
	end


	function XPRACTICE.MULTIPLAYERV2.FakeSend(text)
		local name1,name2=UnitFullName("player")
		--print("Send LOCAL",text)
		XPRACTICE.MULTIPLAYERV2.ProcessInput(text,name1.."-"..name2,true)
		return
	end

	function XPRACTICE.MULTIPLAYERV2.ActuallySend(text,channel)
		C_ChatInfo.SendAddonMessage(XPRACTICE.MULTIPLAYER.PREFIX,text,channel)
	end
	

	
end	