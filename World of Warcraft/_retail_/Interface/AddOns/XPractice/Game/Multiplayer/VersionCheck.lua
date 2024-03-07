XPRACTICE.MULTIPLAYER.versioncheckcooldown=GetTime()
function XPRACTICE.MULTIPLAYER.ProcessVersionCheck(text,sender,channel)
	if(string.sub(text,1,12)=="VERSIONCHECK")then
		if(string.len(text)==12)then
			if(GetTime()>XPRACTICE.MULTIPLAYER.versioncheckcooldown)then
				C_ChatInfo.SendAddonMessage(XPRACTICE.MULTIPLAYER.PREFIX,"VERSIONCHECK "..XPRACTICE.AddonVersion,channel)
				XPRACTICE.MULTIPLAYER.versioncheckcooldown=GetTime()+5.0
			end
		else
			if(XPRACTICE.DEBUG.show_version_checks)then
				print(sender..":  XP "..text)
			end
		end
	end
end