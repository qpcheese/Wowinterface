
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
--
-- User-editable settings have been moved to the in-game options menu.
-- CHANGE THE FOLLOWING LINES AT YOUR OWN RISK
--
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------


XPRACTICE={}

XPRACTICE.Config={}
XPRACTICE.Config.Keybinds={}
XPRACTICE.Config.Camera={}

-- Default settings if /xp size savedata is not found.
XPRACTICE.Config.SCREEN_SIZE="1280"
XPRACTICE.Config.SCREEN_WIDTH=1280
XPRACTICE.Config.SCREEN_HEIGHT=720

-- Default "W".  Your movement speed is normally 7 yards per second.
XPRACTICE.Config.Keybinds.MoveForward="W"

-- Default "S".  Backtracking will cause you to move at reduced speed.
XPRACTICE.Config.Keybinds.MoveBackward="S"

-- Default "A".  Walk left while facing forward.
XPRACTICE.Config.Keybinds.StrafeLeft="A"

-- Default "D".  Walk right while facing forward.
XPRACTICE.Config.Keybinds.StrafeRight="D"

-- Default "Q".
XPRACTICE.Config.Keybinds.TurnLeft="Q"

-- Default "E".
XPRACTICE.Config.Keybinds.TurnRight="E"

-- Default "SPACE".
XPRACTICE.Config.Keybinds.Jump="SPACE"

-- Default "NUMPADDIVIDE".
XPRACTICE.Config.Keybinds.ToggleRunWalk="NUMPADDIVIDE"

-- Default "HIGH".
-- Valid options are BACKGROUND, LOW, MEDIUM, HIGH, DIALOG, FULLSCREEN, FULLSCREEN_DIALOG, TOOLTIP.
-- Always remember the double quotes.
-- Note that higher frame strata may cause bossemote text to be hidden underneath the game window.
XPRACTICE.Config.FrameStrata="HIGH"

-- You can uncomment this line if you need to see the chat window, but it might overlap the scenario control buttons by default.
--XPRACTICE.Config.ChatFrameStrata="DIALOG"

-- Default 9.0.  Affects how quickly the 3D camera rotates as you move the mouse.
-- Adjust this value to match World of Warcraft.  Camera speed is also affected by screen size;
-- the smaller your screen, the faster the camera rotates.		-- TODO: account for this somewhere			
XPRACTICE.Config.Camera.CameraSpeed=9.0

-- Default 0.35.  Affects how quickly the cursor drifts as you move the 3D camera.
-- Since this value directly affects mouse speed, it also acts as a multiplier to camera speed.
XPRACTICE.Config.Camera.MouseSpeed=0.35

-- Mouse inversion settings have been removed.
-- The game will now attempt to auto-detect whether you have enabled mouse inversion 
-- in World of Warcraft's Interface menu and mimic your settings appropriately.

XPRACTICE.DEBUG={}

-- ALWAYS CHANGE THIS LINE TO FALSE BEFORE PUBLISHING
	-- (TODO: maybe remove completely; we're moving debug functionality to a separate dev plugin)
if(false)then --!!!
	XPRACTICE.DEBUG.debugprint=true
	XPRACTICE.DEBUG.extraslashcommands=true	
		
	XPRACTICE.DEBUG.quickloadscenario=true
	XPRACTICE.DEBUG.testmode=false
	
	-- when true, bringing up the game menu will immediately exit to World of Warcraft.
	-- (Pressing Esc will behave as usual if the menu would not be brought up -- e.g. deselecting a mob.)
	XPRACTICE.DEBUG.escquit=true
	
	-- when true, several additional testing buttons will be visible.
	-- (may not work in the current version. use at your own risk.)
	XPRACTICE.DEBUG.visiblebosscontrolbuttons=true
	
	--TODO: replace with "force singleplayer mode" feature
	--XPRACTICE.DEBUG.alwaysofficer=true
	
	-- when true, /xp can open multiple games at once
	-- XPRACTICE.DEBUG.allowmultiboxing=false
	
	-- when true, /xp while the game is running will shutdown and restart instead of displaying an error message
	-- XPRACTICE.DEBUG.autoshutdownrestart=false
	
	-- change this key to whatever our /reload macro is set to (e.g. "R")
	-- change to nil (not "false") to disable
	XPRACTICE.DEBUG.extrapassthrukeycode="R"
	--XPRACTICE.DEBUG.extrapassthrukeycode="V" -- for ctrl+V
	
	XPRACTICE.DEBUG.visiblemobclickzones=false
	
end

function XPRACTICE.debugprint(str)
	if(XPRACTICE.DEBUG.debugprint)then
		print(str)
	end
end

function XPRACTICE.FrameVisibilityCheck(frame)
	if(not XPRACTICE)then local XPRACTICE=self.XPRACTICE end	--TODO: wait, what?  did this line make any sense in a previous version?
	print("Checking frame",tostring(frame))
	print("Name:",tostring(frame.name))
	print("Parent:",tostring(frame:GetParent()))
	print("Width:",frame:GetWidth())
	print("Height:",frame:GetHeight())	
	print("Framelevel:",frame:GetFrameLevel())	
	print("Shown:",frame:IsShown())
	print("Alpha:",frame:GetAlpha())	-- GetAlpha() does not actually grant alpha access.  I've tried.
	
	--LoadAddOn("Blizzard_DebugTools")	--TODO: LoadAddOn probably needs time to execute
	--DevTools_Dump(frame:GetAllPoints())	
end

