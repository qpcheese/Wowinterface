
--
-- X Practice is still undergoing construction.
-- Please don't redistribute this addon until official release.
--


--TODO LATER: print debugstack on certain OOP problems such as (but not limited to) inheritance errors
--TODO: mouse sensitivity still not airtight
	-- (maybe because we accidentally hit reload macro while mouse is down?)
	-- (if enableMouseSpeed is false, maybe store that in savedata so we don't forget after an accident)
			-- (but must be very careful not to override out-of-addon changes)

--
-- XPRACTICE "class".  Non-OOP (call methods using . notation instead of : notation)
--

XPRACTICE.AddonVersion="2023-12-01"
XPRACTICE.TitleText="X Practice "..XPRACTICE.AddonVersion

XPRACTICE.LOADED=false
XPRACTICE.TOCVersion=nil	-- WoW's GetBuildInfo, to be fetched during addon load event
XPRACTICE.games={}

-- event handler frame.  handles ADDON_LOADED and .
-- OnUpdate (step event) has been moved to gamewindow (which also handles input events).
XPRACTICE.EventHandlerFrame = CreateFrame("Frame")

function XPRACTICE.EventHandlerFrame:OnEvent(event, ...)
	if(event=="ADDON_LOADED") then
		XPRACTICE.EventHandlerFrame:OnLoad(...)
	end
end

function XPRACTICE.EventHandlerFrame:OnLoad(AddOn)		
	-- run init code only once
	if(AddOn=="XPractice" and XPRACTICE.LOADED==false) then				
		XPRACTICE.LOADED=true
		self:UnregisterEvent("ADDON_LOADED")		
		-- savedata has been loaded by now, if it exists.
		-- if it's still nil, then there was no data to load.
		if(XPRACTICE_SAVEDATA==nil) then XPRACTICE_SAVEDATA={} end				

		local v,b,d,t=GetBuildInfo()
		XPRACTICE.TOCVersion=t
			
		XPRACTICE.NewsAndUpdates()
		
	end 
end

XPRACTICE.EventHandlerFrame:RegisterEvent("ADDON_LOADED")
XPRACTICE.EventHandlerFrame:SetScript("OnEvent", XPRACTICE.EventHandlerFrame.OnEvent)




SLASH_XPRACTICE1 = "/xp"

function SlashCmdList.XPRACTICE(msg,editbox)
	if(XPRACTICE.LOADED==false)then 
		print("X Practice hasn't loaded yet.  Wait a moment and try again.")
		return 
	end
	
	local args={}
	local i=1
	for arg in string.gmatch(msg, "%S+") do	
		args[i]=arg
		i=i+1
		--print(arg)
	end	
	
	if(#args==0 and args[1]==nil)then
		if(#XPRACTICE.games==0)then
			print("Starting up X Practice...")
			XPRACTICE.alreadyattemptederrorshutdown=false
			XPRACTICE.StartNewGame()
		else
			if(XPRACTICE.DEBUG.allowmultiboxing)then
				print("Starting up X Practice (multiboxing)...")
				XPRACTICE.alreadyattemptederrorshutdown=false
				XPRACTICE.StartNewGame()				
			elseif(XPRACTICE.DEBUG.autoshutdownrestart)then
				print("Restarting X Practice...")
				XPRACTICE.EmergencyShutdown()
				XPRACTICE.alreadyattemptederrorshutdown=false
				XPRACTICE.StartNewGame()				
			else
				print("X Practice appears to be running already.  If it was shut down due to an error, try /reloading first.")
			end
		end
	elseif(args[1]=="test")then
		if(#XPRACTICE.games==0)then
			print("Starting up X Practice in playtest mode...")
			XPRACTICE.alreadyattemptederrorshutdown=false
			XPRACTICE.StartNewGame(true)		
		else
			print("X Practice appears to be running already.  If it was shut down due to an error, try /reloading first.")
		end
	elseif(args[1]=="shutdown")then
		XPRACTICE:EmergencyShutdown()
	elseif(args[1]=="size")then
		local ok=false
		if(#args==3)then
			local width=tonumber(args[2])
			local height=tonumber(args[3])				
			if(width and height and width>0 and height>0)then
				ok=true
				XPRACTICE_SAVEDATA.Config.SCREEN_SIZE="CUSTOM"
				XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=width
				XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=height				
				print("Window size set to",width,"x",height)
				--print("(Changes will take effect after the addon is restarted.)")
				
				if(#XPRACTICE.games>0)then
					XPRACTICE.games[1]:SetScreenDimensionsFromSavedata()
				end
			end
		end
		if(not ok)then
			print("Syntax: /xp size width height")
			print("Example: /xp size 1280 720")
		end
	elseif(args[1]=="restoremouse")then
		SetCVar("mouseSpeed",1.0)
		SetCVar("enableMouseSpeed",0)				
		print("Mouse sensitivity reverted to default.")
	elseif(args[1]=="reset") then		
		if(args[2]~="confirm") then
			print("To delete all X Practice saved data, type /xp reset confirm")
		else			
			XPRACTICE.EmergencyShutdown()			
			XPRACTICE_SAVEDATA={}
			print("X Practice data has been reset.")			
		end
	elseif(args[1]=="wm")then
		if(not args[2])then
			print("Syntax: /xp wm number")
			print("Example: /xp wm 1")
		end
	elseif(args[1]=="cwm")then
		if(not args[2])then
			print("Syntax: /xp cwm number")		
			print("Example: /xp cwm 1")
			print("To clear all at once: /xp cwm all")
		end
	else
		local COLOR="|cFFFFFF00"
		print("X Practice text commands:")
		print(COLOR.."/xp".."|r Open X Practice")
		--print(COLOR.."/xp test".."|r Open X Practice in playtest mode (when available)")
		print(COLOR.."/xp wm".."|r and "..COLOR.."/xp cwm".."|r Place/clear world markers")
		print(COLOR.."/xp size [width] [height]".."|r Set custom screen size (requires addon restart)")
		print(COLOR.."/xp restoremouse".."|r Revert WoW mouse sensitivity to default")
		print(COLOR.."/xp reset".."|r Clear ALL saved data")
		print(COLOR.."/xp shutdown".."|r Force quit (may not work if an error occurred; use /reload instead)")
		
	end	
	

end

-- XPRACTICE.EventHandlerFrame.OnUpdate=function(self,elapsed)
	-- if(XPRACTICE.games)then
		-- XPRACTICE.xpcall(function()XPRACTICE.games[1].MainGameLoop(XPRACTICE.games[1],elapsed)end)
	-- end
-- end


function XPRACTICE.StartNewGame(testmode)
	if(#XPRACTICE.games==0)then
		XPRACTICE.MouseWatchdog.RecordMouseInfo()
		XPRACTICE.CVars:SaveAll()
	end
	local game=XPRACTICE.Game.new()	
	if(testmode==true or XPRACTICE.DEBUG.testmode==true)then game.testmode=true end	
	game:Setup(XPRACTICE)	
	tinsert(XPRACTICE.games,game)
	
	
	--XPRACTICE.EventHandlerFrame:SetScript("OnUpdate", XPRACTICE.EventHandlerFrame.OnUpdate)
end

function XPRACTICE:EmergencyShutdown()	
	for i=#XPRACTICE.games,1,-1 do
		XPRACTICE.games[i]:Shutdown()
	end
	XPRACTICE.games={}
end

function XPRACTICE.RemoveDeadGames()
	for i=#XPRACTICE.games,1,-1 do
		if(XPRACTICE.games[i].dead)then
			tremove(XPRACTICE.games,i)
		end
	end
	if(#XPRACTICE.games==0)then
		XPRACTICE.Shutdown()
	end
end

function XPRACTICE.Shutdown()
	XPRACTICE.CVars:RestoreAll()
	--XPRACTICE.EventHandlerFrame:SetScript("OnUpdate", nil)
	XPRACTICE.Cleanup()
end

function XPRACTICE.Cleanup()
	XPRACTICE.ReusableFrames:ResetAndReport()
	print("X Practice was shut down.  Type /xp to restart.")
	XPRACTICE.MouseWatchdog.CheckMouseInfo()
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function XPRACTICE.NewsAndUpdates()	
	if(XANESHPRACTICE)then
		-- turns out all we had to do was set this to nil
		SLASH_XANESHPRACTICE1=nil
	end	
	XPRACTICE.MouseWatchdog.CheckMouseInfo()
	print("X Practice is enabled.  Type /xp to play.")
	if(XANESHPRACTICE)then
		print("You appear to be running two versions of X Practice at once.  It's safe to disable or delete the older version (\"Xanesh Practice\") from your addons folder.")
	end
end

