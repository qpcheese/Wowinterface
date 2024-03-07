XPRACTICE.MouseWatchdog={}

function XPRACTICE.MouseWatchdog.RecordMouseInfo()
	local currentmousespeed=GetCVar("mouseSpeed")
	if(not currentmousespeed)then return end
	local currentenablemousespeed=GetCVar("enableMouseSpeed")
	if(XPRACTICE_SAVEDATA and XPRACTICE_SAVEDATA.Config)then
		XPRACTICE_SAVEDATA.Config.OriginalMouseSpeed=currentmousespeed
		XPRACTICE_SAVEDATA.Config.OriginalEnableMouseSpeed=currentenablemousespeed
	end
end

function XPRACTICE.MouseWatchdog.CheckMouseInfo()	
	local currentmousespeed=GetCVar("mouseSpeed")
	if(not currentmousespeed)then return end	
	local EPSILON=0.01	
	if(math.abs(currentmousespeed-XPRACTICE.Config.Camera.MouseSpeed)<=EPSILON)then		
		-- panic time!
		if(XPRACTICE_SAVEDATA and XPRACTICE_SAVEDATA.Config)then
			if(XPRACTICE_SAVEDATA.Config.OriginalMouseSpeed)then
				if(math.abs(currentmousespeed-XPRACTICE_SAVEDATA.Config.OriginalMouseSpeed)>EPSILON)then
					print("Mouse sensitivity is suspiciously low (was WoW shut down while X Practice was running?), attempting to restore it...")
					SetCVar("mouseSpeed",XPRACTICE_SAVEDATA.Config.OriginalMouseSpeed)
					SetCVar("enableMouseSpeed",(XPRACTICE_SAVEDATA.Config.OriginalEnableMouseSpeed or 0))		
				end
			end
		else
			--print("Mouse sensitivity is suspiciously low.  If this was not your intention, type /xp restoremouse")
		end
	end
end	
