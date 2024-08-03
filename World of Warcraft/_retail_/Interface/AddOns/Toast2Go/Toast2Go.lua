--[[
*******************************************************************************************
** Toast2Go is written and maintained by Spinalcrack on US-Mal'Ganis - Spinalcrack#1469  **
**        Free to use and distribute, but All Rights are Reserved by Spinalcrack         **
**                                                                                       **
**                              FOR THE HORDE!!! Sry Alliance :P                         **
**                                                                                       **
*******************************************************************************************
]]

local AppName, Toast2Go= ...
--local OptionsAppName = AppName .. "_Options"
local VERSION = AppName .. "-v1.5.4"

-- Setup some variables
local _G = _G
BNTCF_Width = BNToastFrame:GetWidth()
BNTCF_Width = BNTCF_Width + 2
BNTCF_Height = BNToastFrame:GetHeight()
BNTCF_Height = BNTCF_Height + 2

T2G_xOfs = 0
T2G_yOfs = 0
T2G_Lock_Status = "Locked"
T2G_LockUnlock_Flag = 0

-- Register some events
local T2G_VAR_frame = CreateFrame("FRAME"); -- Need a frame to respond to events
T2G_VAR_frame:RegisterEvent("ADDON_LOADED"); -- Fired when saved variables are loaded
T2G_VAR_frame:RegisterEvent("PLAYER_LOGOUT"); -- Fired when logging out or reloadingUI
T2G_VAR_frame:RegisterEvent("PLAYER_LEAVING_WORLD"); -- Fired when leaving instances

T2G_VAR_frame:SetScript("OnEvent", function(self, event, arg1)

	if event == "ADDON_LOADED" and arg1 == "Toast2Go" then
		
		--T2G_f:ClearAllPoints()
		
	elseif event == "PLAYER_LOGOUT" or event == "PLAYER_LEAVING_WORLD" then
		
		T2G_GetPosition()
		
	end

end)

function Toast2Go_OnLoad(self)

-- Creates message frame for locking and unlocking
	T2G_LockUnLock_Msg = CreateFrame("Frame", "T2G_LockUnLock_Msg", UIParent)
	T2G_LockUnLock_Msg:SetAllPoints()
	T2G_LockUnLock_Msg = T2G_LockUnLock_Msg:CreateFontString(nil, 'OVERLAY')
	T2G_LockUnLock_Msg:SetFont(STANDARD_TEXT_FONT, 32, "OUTLINE")
	T2G_LockUnLock_Msg:SetPoint('CENTER',0,150)
	T2G_LockUnLock_Msg:SetAlpha(0)

-- Creates new movable Toast2Go frame
	T2G_f = CreateFrame("Frame","Toast2Go_MainFrame",UIParent)
	--T2G_f:SetFrameLevel(502)
	T2G_f:SetMovable(true)
	T2G_f:SetResizable(true)
	T2G_f:SetClampedToScreen(true)
	T2G_f:EnableMouse(true)
	T2G_f:EnableKeyboard(true)
	T2G_f:EnableMouseWheel(true)
	T2G_f:SetUserPlaced(true)
	T2G_f:RegisterForDrag("LeftButton")
	T2G_f:SetScript("OnDragStart", T2G_f.StartMoving)
	T2G_f:SetScript('OnDragStop', function(self)
		T2G_f:StopMovingOrSizing()
		T2G_GetPosition()
		T2G_SetPosition()
	end)

-- Give moveable Toast2Go frame a background to actually see it
	T2G_f:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
		tile = true, tileSize = 16, edgeSize = 16, 
		insets = { left = 4, right = 4, top = 4, bottom = 4 }});
	T2G_f:SetBackdropColor(0,0,0,1);
	T2G_f:SetAlpha(0)
	
-- Create message frame for our Toast2Go frame
	T2G_f_Msg = CreateFrame("Frame", "T2G_f_Msg", T2G_f)
	T2G_f_Msg:SetAllPoints()
	T2G_f_Msg = T2G_f_Msg:CreateFontString(nil, 'OVERLAY')
	T2G_f_Msg:SetFont(STANDARD_TEXT_FONT, 18, "OUTLINE")
	T2G_f_Msg:SetText('|cFFFFFF00Toast2Go is Unlocked!')
	T2G_f_Msg:SetPoint('CENTER',0,0)
	T2G_f_Msg:SetAlpha(1)
	
-- Create Button to lock frame 
	T2G_Lock_But = "Lock T2G"
	template = "UIPanelButtonTemplate"
	T2G_Lock_Button = CreateFrame("Button",T2G_Lock_But,T2G_f,template)
	T2G_Lock_Button:SetPoint("TOPRIGHT",0,25)
	T2G_Lock_Button:SetWidth(80)
	T2G_Lock_Button:SetText("Lock T2G")
	T2G_Lock_Button:SetButtonState("NORMAL")

-- Handler for when Lock Button is Clicked
	T2G_Lock_Button:SetScript("OnClick", function(self)
		T2G_Lock_Button:SetButtonState("PUSHED")
		T2G_Lock()
	end)
	
-- Get lastedt postion of Toast2Go Frame and set toast window
	T2G_GetPosition()
	T2G_SetPosition()
	
end

-- Get the position of the movable Toast2Go frame 
function T2G_GetPosition()
	
	local point, relativeTo, relativePoint, xOfs, yOfs = T2G_f:GetPoint()
	
	T2G_xOfs = xOfs
	T2G_yOfs = yOfs
	
	
	
end

-- Set the position of the movable Toast2Go frame 	
function T2G_SetPosition()

	T2G_f:SetWidth(BNTCF_Width)
	T2G_f:SetHeight(BNTCF_Height)
	
	T2G_f:SetPoint("CENTER",T2G_xOfs,T2G_yOfs)
	
	-- Anchors BNTOASTCLICKFRAME to T2G frame and sets some options
	BNToastFrame:ClearAllPoints()
	BNToastFrame:SetPoint("CENTER", T2G_f, "CENTER")
	
	--print("T2G now in position")

end

-- Stop toast window from moving
function T2G_Lock()
	T2G_f:EnableMouse(false)
	T2G_f:EnableKeyboard(false)
	T2G_f:SetAlpha(0)
		
	T2G_Lock_Status = "Locked"
	if T2G_LockUnlock_Flag == 1 then
		T2G_LockUnlock_Flag = 0
		T2G_Fade_Msg()
	end
end

-- Enable the toast window frame to move
function T2G_Unlock()
	T2G_Lock_Button:SetButtonState("NORMAL")
	T2G_f:EnableMouse(true)
	T2G_f:EnableKeyboard(true)
	T2G_f:SetAlpha(1)
			
	T2G_Lock_Status = "Unlocked"
	T2G_Fade_Msg()
end

-- Message when locking and unlocking
function T2G_Fade_Msg(UIParent)
	T2G_LockUnLock_Msg:SetText('|cffff0000Toast2Go is now '..T2G_Lock_Status..'!')
	UIFrameFadeOut(T2G_LockUnLock_Msg, 4, 1, 0)
end

do
	hooksecurefunc("BNToastFrame_Show", function()
		T2G_Lock()
		BNToastFrame:ClearAllPoints()
		BNToastFrame:SetPoint("CENTER", T2G_f, "CENTER")
	end)
end

-- Slash command setup
SLASH_Toast2Go1, SLASH_Toast2Go2 = '/t2g', '/toast2go';
function SlashCmdList.Toast2Go(msg, editbox)
	local command, rest = msg:match("^(%S*)%s*(.-)$")
	if msg == 'unlock'	then
		T2G_Unlock()
	elseif msg == 'lock' then
		T2G_LockUnlock_Flag = 1
		T2G_Lock()
	else
		print(" ")
		print("-----------------------------------------------------------")
		print(" ")
		print("/t2g or /toast2go options...")
		print(" ")
		print(" 'unlock' - unlocks Toast window allowing it to be moved")
		print(" 'lock' - locks Toast window stopping if from being moved")
		print(" ")
		print("-----------------------------------------------------------")
	end
end
