do
	function XPRACTICE.MULTIPLAYER.Send(text)
		if(not IsInGroup())then
			local name1,name2=UnitFullName("player")
			--print("Send LOCAL",text)
			XPRACTICE.MULTIPLAYER.ProcessInput(text,name1.."-"..name2)
			return
		end
		local channel="PARTY"
		if(IsInRaid())then channel="RAID" end		
		C_ChatInfo.SendAddonMessage(XPRACTICE.MULTIPLAYER.PREFIX,text,channel)
	end

	

	
end