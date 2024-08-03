local Addon = (...)
local Version = "10.2.7"
BINDING_HEADER_STACKPACK = Addon
Stackpack = { Version=Version }

--[[ Stackpack

   - combines partial stacks for you so you don't have to - in scenarios where the base ui doesn't.
   - does not combine things if you just split them up.
   - does not combine things in your bags if you have mail, AH, bank, or guild bank open,
	so you can stage specific quantities of items in separate stacks for ease in moving elsewhere
   - WILL combine things in your bags when you close mail, AH, bank, or guild bank.
	(but you can "/stackpack off" to disable Stackpack until you turn it back on, or reload your UI)
   - will combine things in your current guild bank tab if open, unless you have disabled this (see help)
   - will combine things in your bank if it is open
   - handles special bags, reagent bag, and reagent bank tab

--]]



--------------------------------------------------------
-- What's New popup (use sparingly for important info --
--------------------------------------------------------

local Normal = "|cffbcbc5c"
local Bold   = "|cffffff80"
local Dim    = "|cffa0a080"
local Guild  = "|cff3ce13f"
local Warn   = "|cffff0000"
local White  = "|cffffffff"

local OlderThan
local function WhatsNew(n)
	local prevVersion = StackpackGlobalSettings["Version"] or StackpackSettings["Version"] or ""
	StackpackGlobalSettings["Version"] = Version
	StackpackSettings["Version"] = nil
	local versionCheck = function(v) if n then n = (n-1 > 0) and (n-1) or nil; return true
						 else return OlderThan(prevVersion,v) end end
	local text = ""
	-- (note only the first 8 color changes will be honored)
	if versionCheck("10.2.7") then
		text = text .. "\n\n" .. White .. "[10.2.7]\n" .. Dim ..
			"This is a prepatch compatibility release -\n" ..
			"Warbands bank not yet supported (coming soon)."
	end
	if versionCheck("10.2.0a") then
		text = text .. "\n\n" .. White .. "[10.2.0a]\n" .. Dim ..
			"Stackpack now works on Classic versions!\n" ..
			"More bug fixes have been made, along with" ..
			" improvements and optimizations to the filtering code."
	end
	if versionCheck("10.2.0") then
		text = text .. "\n\n" .. White .. "[10.2.0]\n" .. Dim ..
			"Item move logic has been overhauled to make it more" ..
			" efficient and to fix a long-standing issue which could" ..
			" cause Stackpack to get stuck in a loop.\n\n" ..
			"When opening a guild bank for the first time, there is now" ..
			" a confirmation box before the guild bank stacking setting" ..
			" fully activates.\n\n" ..
			"Several other bug fixes and internal code changes have" ..
			" been made to enhance future maintainability."
	end
	if versionCheck("10.0.2a") then
		text = text .. "\n\n" .. White .. "[10.0.2a]\n" ..
			Bold .. "Due to changes in how settings are stored,\n" ..
			"Stackpack settings were reset to defaults.\n" .. Dim ..
			"Please check and update your settings -\n" ..
			"use " .. White .. "/stackpack " .. Dim .. "for more info!\n\n" ..
			"By popular demand, the search button is now movable! (SHIFT-drag it!)\n\n" ..
			"Stack sizes are now available in tooltips!"
	end
	if (text == "") then return end

	StaticPopupDialogs["STACKPACK_WHATS_NEW"] = {
		text = "What's New in Stackpack" .. text .. "\n",
		subText = Dim .. "___\n\nSee the 'README.txt' file in the addon folder for more/older info",
		button1 = "Got It!",
		timeout = 0,
		whileDead = 1,
		hideOnEscape = 1,
		wide = 1,
		wideText = 1,
	}
	StaticPopup_Show("STACKPACK_WHATS_NEW")
end



-----------------------------------------------
-- Settings, tunables, and state information --
-----------------------------------------------

local DefaultGlobalSettings = {}
local DefaultSettings = {
	["StackGuildBank"] = true,
	["UseInventorySearch"] = true,
	["ShowItemIDs"] = false,
	["ShowIlvls"] = false,
	["ShowStacksizes"] = true,
	["ShowDebug"] = false
}

-- modern API stack move will already fill target stack as possible; no need to pre-split.
-- also avoids ERR_SPLIT_FAILED after, e.g., depleting a full stack by using an item from it.
local SKIP_SPLIT = true

-- other internal settings that calibrate the addon's operation. these are valid for 10.x
-- and should not be adjusted without good cause and plenty of testing.
local MAX_WAIT_FOR_MOVE = 200
local GB_QUIESCE = 80
local GB_EVENTS_NEEDED = 3
local BAG_EVENTS_NEEDED = 2
local BAG_UPDATE_DELAYED_VAL = BAG_EVENTS_NEEDED
local CAGED_ITEM_ID = 82800
local ADVISE_GB_PETS_BROKEN = true
local TRIGGER_EVENT = (LE_EXPANSION_LEVEL_CURRENT > 9) and "ITEM_COUNT_CHANGED" or "BAG_UPDATE_DELAYED"

-- These used to be global from Blizzard_GuildBankUI.lua but are now "local" there as of 9.1.5
local MAX_GUILDBANK_SLOTS_PER_TAB = MAX_GUILDBANK_SLOTS_PER_TAB or 98
local NUM_SLOTS_PER_GUILDBANK_GROUP = NUM_SLOTS_PER_GUILDBANK_GROUP or 14

-- Get some inventory management constants
local _IC = Constants and Constants.InventoryConstants or {}
--local NUM_ACCOUNTBANK_SLOTS = _IC.NumAccountBankSlots or 0
--local NUM_BANK_BAG_SLOTS = _IC.NumBankBagSlots or 7

-- Use official (as of TWW) names for things where known.
-- (do NOT use Enum.BagIndex - it is incorrect for non-Retail versions)
local REAGENTBANK_CONTAINER = REAGENTBANK_CONTAINER or -3
local BANK_CONTAINER = BANK_CONTAINER or -1
local BACKPACK_CONTAINER = BACKPACK_CONTAINER or 0
local NUM_CONTAINER_FRAMES = NUM_CONTAINER_FRAMES or 13
local NUM_BANKGENERIC_SLOTS = NUM_BANKGENERIC_SLOTS or _IC.NumGenericBankSlots or 28
local NUM_BAG_SLOTS = NUM_BAG_SLOTS or _IC.NumBagSlots or 4
local NUM_REAGENTBAG_SLOTS = NUM_REAGENTBAG_SLOTS or _IC.NumReagentBagSlots or 0
local NUM_TOTAL_EQUIPPED_BAG_SLOTS = NUM_TOTAL_EQUIPPED_BAG_SLOTS or (NUM_BAG_SLOTS + NUM_REAGENTBAG_SLOTS)

-- Starting and ending bag slot numbers for bank bags
local BANK_BAG_1 = NUM_TOTAL_EQUIPPED_BAG_SLOTS + 1
local BANK_BAG_N

-- Misc constants
local NOW = -1
local SEARCHTXT = Addon .. " Search..."
local TT_ITEM_LEVEL_FIND = "^" .. ITEM_LEVEL .. "+[+(0-9) ]*$"
local TT_ITEM_LEVEL_PARSE = " %(*(%d+)[)+]*$"

-- state variables
local Enabled = true
local Queued = -1
local ForceScan = false
local Stacking = 0
local SPCycle = 0
local SPToggle = false
local BankOpen = false
local GuildBankOpen = false
local GuildBankStackAll = false
local ReadyID = 0
local lastReady = -1
local WaitForMove = 0
local State = 0
local Queue = {}
local Ready = {}
local StackHook = nil
local SplitStack = false
local WFrame = getglobal("WorldFrame")
local GuildBankStackButton = nil
local isLooting = false
local TTHooked = false
local LastQuery = ""

-- forward function declarations
local StackItem
local StackGuild_Prompt
local RefreshFilter



-----------------------------------------------
-- Chat messaging and debug message handling --
-----------------------------------------------

local function Push(msg,r,g,b)
	if (r == nil) or (g == nil) or (b == nil) then
		r = 0.74
		g = 0.74	-- "Normal"
		b = 0.36
	end
	DEFAULT_CHAT_FRAME:AddMessage(msg,r,g,b)
end

-- debug outer frame
local DebugFrame = CreateFrame("Frame", Addon.."DebugFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate")
DebugFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
DebugFrame:SetSize(750, 400)
DebugFrame:SetBackdrop({
	bgFile = "Interface/Tooltips/UI-Tooltip-Background",
	edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
	tile = true,
	tileSize = 16,
	edgeSize = 16,
	insets = {left = 4, right = 4, top = 4, bottom = 4}}
)
DebugFrame:SetBackdropColor(0, 0, 0, 0.5)
DebugFrame:EnableMouse(true)
DebugFrame:SetMovable(true)
DebugFrame:SetUserPlaced(true)
DebugFrame:SetClampedToScreen(true)
DebugFrame:RegisterForDrag("LeftButton")
DebugFrame:SetScript("OnDragStart", DebugFrame.StartMoving)
DebugFrame:SetScript("OnDragStop", DebugFrame.StopMovingOrSizing)
DebugFrame:SetResizable(true)
if DebugFrame.SetResizeBounds then DebugFrame:SetResizeBounds(150, 100, nil, nil)
elseif DebugFrame.SetMinResize then DebugFrame:SetMinResize(150, 100) end

-- debug frame title
DebugFrame.title = DebugFrame:CreateFontString(nil, "OVERLAY")
DebugFrame.title:SetPoint("TOPLEFT", DebugFrame, "TOPLEFT", 7, -5)
DebugFrame.title:SetJustifyH("LEFT")
DebugFrame.title:SetFontObject(ChatFontNormal)
--DebugFrame.title:SetTextHeight(18)
DebugFrame.title:SetScale(1.2)
DebugFrame.title:SetTextColor(.74,.74,.36)
DebugFrame.title:SetText(Addon.." "..Version.." - Debug Dump")

-- debug frame close button
DebugFrame.closeButton = CreateFrame("Button", "$parentClose", DebugFrame)
DebugFrame.closeButton:SetSize(32, 32)
DebugFrame.closeButton:SetPoint("TOPRIGHT")
DebugFrame.closeButton:SetNormalTexture("Interface/Buttons/UI-Panel-MinimizeButton-Up")
DebugFrame.closeButton:SetPushedTexture("Interface/Buttons/UI-Panel-MinimizeButton-Down")
DebugFrame.closeButton:SetHighlightTexture("Interface/Buttons/UI-Panel-MinimizeButton-Highlight", "ADD")
DebugFrame.closeButton:SetScript("OnClick", function() DebugFrame:Hide() end)

-- debug scroll frame
DebugFrame.scrollFrame = CreateFrame("ScrollFrame", "$parentScrollFrame", DebugFrame, "UIPanelScrollFrameTemplate")
DebugFrame.scrollFrame:SetPoint("LEFT", 16, 0)
DebugFrame.scrollFrame:SetPoint("TOPRIGHT", DebugFrame.closeButton, "BOTTOMLEFT", 0, 0)
DebugFrame.scrollFrame:SetPoint("BOTTOM", 0, 32)

-- debug frame edit box
DebugFrame.editBox = CreateFrame("EditBox", "$parentEditBox", DebugFrame.scrollFrame)
DebugFrame.editBox:SetSize(DebugFrame.scrollFrame:GetSize())
DebugFrame.editBox:SetMultiLine(true)
DebugFrame.editBox:SetAutoFocus(false)
DebugFrame.editBox:SetFontObject("ChatFontNormal")
DebugFrame.editBox:SetScript("OnEscapePressed", function() DebugFrame:Hide() end)
DebugFrame.scrollFrame:SetScrollChild(DebugFrame.editBox)

-- debug frame clear button
DebugFrame.clearButton = CreateFrame("Button", "$parentClear", DebugFrame, "UIPanelButtonTemplate")
DebugFrame.clearButton:SetSize(60, 18)
DebugFrame.clearButton:SetPoint("TOPRIGHT", DebugFrame.closeButton, "TOPLEFT", 0, -7)
DebugFrame.clearButton:SetText("Clear")
DebugFrame.clearButton:SetScript("OnClick", function() DebugFrame.editBox:SetText("") end)

-- resize button
DebugFrame.resizeButton = CreateFrame("Button", "$parentResizeButton", DebugFrame)
DebugFrame.resizeButton:SetPoint("BOTTOMRIGHT", -6, 7)
DebugFrame.resizeButton:SetSize(16, 16)
DebugFrame.resizeButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
DebugFrame.resizeButton:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
DebugFrame.resizeButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
DebugFrame.resizeButton:SetScript("OnMouseDown", function(self, button)
	if button ~= "LeftButton" then return end
	DebugFrame:StartSizing("BOTTOMRIGHT")
	self:GetHighlightTexture():Hide()
end)
DebugFrame.resizeButton:SetScript("OnMouseUp", function(self)
	DebugFrame:StopMovingOrSizing()
	self:GetHighlightTexture():Show()
	DebugFrame.editBox:SetWidth(DebugFrame.scrollFrame:GetWidth())
end)
DebugFrame:Hide()

-- add text to debug frame
local function AddToDebugFrame(text)
	-- if we're at the bottom of the text already, scroll with new text
	local scrollpos = DebugFrame.scrollFrame:GetVerticalScroll()
	local scrollrange = DebugFrame.scrollFrame:GetVerticalScrollRange()
	local scroll = (scrollpos+1 >= scrollrange)

	-- add new text to already open debug frame, or reset text and open it
	if not DebugFrame:IsShown() then DebugFrame.editBox:SetText(""); scroll=true end
	DebugFrame.editBox:SetText(DebugFrame.editBox:GetText() .. text .. "\n")

	if DebugFrame.timer then scroll = true end
	if scroll then
		DebugFrame.scrollFrame:SetVerticalScroll(DebugFrame.scrollFrame:GetVerticalScrollRange()+1)
		if DebugFrame.timer then DebugFrame.timer:Cancel() end
		DebugFrame.timer = C_Timer.NewTicker(0.2, function()
			DebugFrame.scrollFrame:SetVerticalScroll(DebugFrame.scrollFrame:GetVerticalScrollRange()+1)
			DebugFrame.timer = nil
		end, 1)
	end
end

local function dump(...)
	if (select("#", ...) > 1) then
		local t=""
		for i=1,select("#", ...) do
			local o = select(i, ...)
			t = t .. " ["..i.."] = " .. dump(o) .. "\n"
		end
		return t
	end
	local o = ...
	if (type(o) == "table") then
		local s
		for k,v in pairs(o) do
			if (type(k) == "string") then k = string.format("%q",k) end
			s = (s and (s .. ", ") or "") .. "["..k.."]=" .. dump(v)
		end
		return "{"..(s or "").."}"
	elseif (type(o) == "string") then return string.format("%q",o)
	else return tostring(o)
	end
end

-- capture debugging information internally; also send to debug frame if active, and/or to chat if ShowDebug is on
local DebugInfo = {}
local function Debug(...)
	local msg = ""
	for i=1,select("#", ...) do
		local arg = select(i, ...)
		msg = msg .. ((type(arg)=="table") and dump(arg) or tostring(arg))
	end
	if StackpackSettings and StackpackSettings["ShowDebug"] then
		 Push("% "..Addon..": "..tostring(msg),0.8,0.8,0.8)
	end
	local dateString = date("%Y-%m-%d %H:%M:%S")
	local debugMessage = dateString .. ": " .. msg
	table.insert(DebugInfo, debugMessage)
	if DebugFrame and DebugFrame:IsShown() then AddToDebugFrame(debugMessage) end
	if (#DebugInfo > 200) then table.remove(DebugInfo, 1) end
end

-- dump captured debugging info to debug frame
local function DebugDump()
	if DebugFrame and DebugFrame:IsShown() then return end
	DebugFrame:Show()
	for _, msg in ipairs(DebugInfo) do AddToDebugFrame(msg) end
end



-------------------------------------------------
-- ttscanner - scan tooltips for specific text --
-------------------------------------------------

local ttscanmax = 8	-- only search this many lines at most for text
local ttscanner = {}

-- legacy gametooltip setup (pre-10.0.2) - needed for Classic versions
local function ttcreate()
	local tip = CreateFrame("GameTooltip", Addon.."_ttscantip")
	tip.L = {}
	tip.R = {}
	for i = 1, ttscanmax do
		tip.L[i] = tip:CreateFontString()
		tip.R[i] = tip:CreateFontString()
		tip.L[i]:SetFontObject(GameFontNormal)
		tip.R[i]:SetFontObject(GameFontNormal)
		tip:AddFontStrings(tip.L[i], tip.R[i])
	end
	return tip
end

-- ttscan version selector
ttscanner.init = function()
	if C_TooltipInfo then
		-- configure to use modern tooltip scanning
		local ttset = function(x) ttscanner.ttdata = x and x or {["lines"]={}} end
		ttscanner.GetBagItem = function(...) ttset(C_TooltipInfo.GetBagItem(...)) end
		ttscanner.GetGuildBankItem = function(...) ttset(C_TooltipInfo.GetGuildBankItem(...)) end
		ttscanner.GetHyperlink = function(...) ttset(C_TooltipInfo.GetHyperlink(...)) end
		ttscanner.GetLine = function(n) return ttscanner.ttdata.lines[n] end
		ttscanner.GetLeft = function(n) local line=ttscanner.GetLine(n); return line and line.leftText end
		ttscanner.GetRight = function(n) local line=ttscanner.GetLine(n); return line and line.rightText end
		ttscanner.done = function() end
		ttscanner.init = function() end

	else
		-- configure to use legacy tooltip scanning
		ttscanner.ttscantip = ttscanner.ttscantip or ttcreate()
		ttscanner.GetBagItem = function(...) ttscanner.ttscantip:SetBagItem(...) end
		ttscanner.GetGuildBankItem = function(...) ttscanner.ttscantip:SetGuildBankBagItem(...) end
		ttscanner.GetHyperlink = function(...) ttscanner.ttscantip:SetHyperlink(...) end
		ttscanner.GetLine = function(n) return ttscanner.ttscantip.L[n] end
		ttscanner.GetLeft = function(n) return ttscanner.ttscantip.L[n]:GetText() end
		ttscanner.GetRight = function(n) return ttscanner.ttscantip.R[n]:GetText() end
		ttscanner.done = function() ttscanner.ttscantip:Show() end
		ttscanner.init = function() ttscanner.ttscantip:SetOwner(UIParent, "ANCHOR_NONE") end
	end
end

local function ttscan(item, text, where)
	local found = nil
	if not item then return nil end
	ttscanner.init()
	if (type(item) == "table") then
		local IN = tostring(item[1]):lower()
		if (IN == "bag") then
			ttscanner.GetBagItem(item[2],item[3])
		elseif (IN == "gbank") or (IN == "guild") then
			ttscanner.GetGuildBankItem(item[2],item[3])
		end
	else
		ttscanner.GetHyperlink(item)
	end
	for i = 1, ttscanmax do
		if not ttscanner.GetLine(i) then break end
		if not where or (where:lower() ~= "right") then
			local t = ttscanner.GetLeft(i)
			  -- look only at patterns, not at what they make:
			if not t or (t == "") then break end
			if t:find(text) then found=t; break end
		end
		if not where or (where:lower() ~= "left") then
			local t = ttscanner.GetRight(i)
			if t and t:find(text) then found=t; break end
		end
	end
	return found
end



-------------------------------------
-- Miscellaneous utility functions --
-------------------------------------

local function vercmp(a,b)
	if (a == b) then return 0 end
	local A = { a:match("(%d*)(%D*)%.(%d*)(%D*)%.(%d*)(%D*)") }
	local B = { b:match("(%d*)(%D*)%.(%d*)(%D*)%.(%d*)(%D*)") }
	local i = 0
	while true do
		i = i + 1
		if not A[i] and not B[i] then return 0 end
		if (i % 2 > 0) then local d = (A[i] or 0) - (B[i] or 0); if (d ~= 0) then return d end end
		if ((A[i] or "") > (B[i] or "")) then return  1 end
		if ((A[i] or "") < (B[i] or "")) then return -1 end
	end
end

function OlderThan(v,x)	-- is local (forward declared)
	return vercmp(v,x) < 0
end

local function P(str,n)
	-- trivial pluralizer. does not handle ANY exceptions, including adding "-es".
	return (n > 1) and (str .. "s") or str
end

local function which(what,where)
	-- given 'what' to look for - a table of strings,
	-- look in 'where' - a table to search in,
	-- and return key,where[key] for the first entry in 'what' *which* is a key in 'where'
	if where then
		for _,e in ipairs(what) do
			if where[e] then return e,where[e] end
		end
	end
	return nil
end

local function GetItemID(itemLink)
	if (itemLink == nil) then return nil end
	local id = itemLink:match("item:(%d+):")
	return tonumber(id)
end

local function GetItemLvl(itemLink)
	if (itemLink == nil) then return nil end
	-- itemLevel is available as 4th field of GetItemInfo() - but often is a base ilvl.
	-- actual itemLevel is available as 1st field of GetDetailedItemLevelInfo() - if available -
	--     but this is actually wrong for a few items (e.g. heirlooms or itemid 102246).
	-- If we find an item level in a tooltip, it should be reliable; try that first.
	-- failing that, fall back on GetDetailedItemLevelInfo() if we have that, or GetItemInfo otherwise.
	local ilvl = ttscan(itemLink, TT_ITEM_LEVEL_FIND, "left")
	if ilvl then ilvl = tonumber(ilvl:match(TT_ITEM_LEVEL_PARSE)) end
	ilvl =  ilvl
		or (C_Item.GetDetailedItemLevelInfo and C_Item.GetDetailedItemLevelInfo(itemLink))
		or select(4, C_Item.GetItemInfo(itemLink))
	return ilvl
end

local function GetItemOrPetInfo(link)
	if not link or (link == "") then return end
	local ID = GetItemID(link)
	if ID then return C_Item.GetItemInfo(link) end
	local speciesID, petLevel, quality, health, power, speed =
		link:match(".*battlepet:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):%d+:")
	if speciesID then
		if not link then speciesID = (health or 0) + (power or 0) + (speed or 0) end -- luacheck
		speciesID = tonumber(speciesID)
		petLevel = tonumber(petLevel)
		quality = tonumber(quality)
		local petName, petIcon, petType = C_PetJournal.GetPetInfoBySpeciesID(speciesID)
		local petInfo = { petName, link, quality, petLevel, select(5, C_Item.GetItemInfo(CAGED_ITEM_ID)) }
		petInfo[10] = petIcon	-- itemTexture
		petInfo[13] = petType	-- subclassID
		return unpack(petInfo)
	end
end

local function GetBaseItemLink(item)
	local id = GetItemID(item)
	local baseItemLink = id and select(2, C_Item.GetItemInfo(id)) or item
	return baseItemLink
end

local function HoldingItem()
	return (GetCursorInfo()=="item") or CursorHasItem()
end

local function HoldingSomething()
	return HoldingItem() or CursorHasMoney() or CursorHasSpell()
end

local function CheckFrame(frame)
	local visible = frame and frame.IsVisible and frame:IsVisible()
	return (visible and (visible ~= 0))
end

local function AHOpen()	return CheckFrame(AuctionHouseFrame) or CheckFrame(AuctionFrame) end
local function TradeOpen() return CheckFrame(TradeFrame) end
local function CTMailOpen() return CheckFrame(CT_MailFrame) end
local function SendMailOpen() return CheckFrame(SendMailFrame) end



------------------------------------------------
-- Helper functions for Containers and Frames --
------------------------------------------------

local _c_id = {
	-- as of 12/23 there is a global Enum.BagIndex with similar data available in all game versions
	-- but its information is only valid in retail.  do not use it until/unless the lack of reagentbag
	-- in classic versions is accounted for in the enum values.
	-- We use here the names given in Enum.BagIndex (plus "Equipped" which is not listed there).

	["Equipped"]		= -6,			-- -6  any number below -5 gives player equipment as a container
	["Accountbanktab"]	= -5,			-- -5  Warband Bank tab frame
	["Bankbag"]		= -4,			-- -4  Bank Bag Slots frame
	["Reagentbank"]		= REAGENTBANK_CONTAINER,-- -3
	["Keyring"]		= -2,			-- -2  not used in Retail
	["Bank"]		= BANK_CONTAINER,	-- -1
	["Backpack"]		= BACKPACK_CONTAINER,	--  0
	["Bag_1"]		= BACKPACK_CONTAINER+1,	--  1
	["Bag_2"]		= BACKPACK_CONTAINER+2,	--  2
	["Bag_3"]		= BACKPACK_CONTAINER+3,	--  3
	["Bag_4"]		= BACKPACK_CONTAINER+4,	--  4
	["ReagentBag"]		= NUM_REAGENTBAG_SLOTS
				  and NUM_BAG_SLOTS+1,	--  5 in retail (undef in classic)
	["BankBag_1"]		= BANK_BAG_1+0,		--  6 in retail ( 5 in classic)
	["BankBag_2"]		= BANK_BAG_1+1,		--  7 in retail ( 6 in classic)
	["BankBag_3"]		= BANK_BAG_1+2,		--  8 in retail ( 7 in classic)
	["BankBag_4"]		= BANK_BAG_1+3,		--  9 in retail ( 8 in classic)
	["BankBag_5"]		= BANK_BAG_1+4,		-- 10 in retail ( 9 in classic)
	["BankBag_6"]		= BANK_BAG_1+5,		-- 11 in retail (10 in classic)
	["BankBag_7"]		= BANK_BAG_1+6,		-- 12 in retail (11 in classic, but only avail in BC onward)
	["AccountBankTab_1"]	= BANK_BAG_1+6,		-- 12 in retail (11 in classic, but only avail in BC onward)
}
local _c_name = {
	-- map container ids to display names we want to use
	[-6] = "Equipment",
	[-5] = "Warband Bank Tabs",
	[-4] = "Bank Bag Slots",
	[-3] = "ReagentBank",
	[-2] = "Keyring",
	[-1] = "Bank",
	[ 0] = "Backpack",
	[ 1] = "Bag1",
	[ 2] = "Bag2",
	[ 3] = "Bag3",
	[ 4] = "Bag4",
	[ 5] = NUM_REAGENTBAG_SLOTS and "ReagentBag" or "BankBag1",
	[ 6] = NUM_REAGENTBAG_SLOTS and "BankBag1" or "BankBag2",
	[ 7] = NUM_REAGENTBAG_SLOTS and "BankBag2" or "BankBag3",
	[ 8] = NUM_REAGENTBAG_SLOTS and "BankBag3" or "BankBag4",
	[ 9] = NUM_REAGENTBAG_SLOTS and "BankBag4" or "BankBag5",
	[10] = NUM_REAGENTBAG_SLOTS and "BankBag5" or "BankBag6",
	[11] = NUM_REAGENTBAG_SLOTS and "BankBag6" or "BankBag7",
	[12] = NUM_REAGENTBAG_SLOTS and "BankBag7",
}
for id,name in pairs(_c_name) do _c_id[name] = id; _c_id[name:lower()] = id ; _c_id[id] = id end

local function isGuildTab(where)
	local guildtab;
	if (type(where) ~= "string") or (where:sub(1,1):lower() ~= "g") then return end
	for _,s in ipairs({"guildtab","gbank","gb","guildbank","guild"}) do
		guildtab = where:lower():match("^"..s.."(%d+)$")
		if guildtab then return tonumber(guildtab) end
	end
end

local function GetNumSlots(where)
	local container = _c_id[where] or _c_id[where:lower()]
	if container then return C_Container.GetContainerNumSlots(container) end
	if isGuildTab(where) then return MAX_GUILDBANK_SLOTS_PER_TAB end
end

local function GetLink(where,slot)
	local container = _c_id[where] or _c_id[where:lower()]
	if container then return C_Container.GetContainerItemLink(container,slot) end
	local guildtab = isGuildTab(where)
	if guildtab then return GetGuildBankItemLink(guildtab,slot) end
end

local ContainerFrameMap
local function ResetContainerFrameMap() ContainerFrameMap = nil end

local function GetContainerFrameName(where)
	local guildtab = isGuildTab(where)
	if guildtab then
		if (guildtab == GetCurrentGuildBankTab()) then return "GuildBankFrame" end
		return
	end
	if not ContainerFrameMap then
		ContainerFrameMap = {}			-- rebuild ContainerFrameMap
		for n=1,NUM_CONTAINER_FRAMES do
			local frameName = "ContainerFrame"..n
			local frame = _G[frameName]
			if CheckFrame(frame) then
				local ID = frame:GetID()
				ContainerFrameMap[ID] = frameName
			end
		end
		ContainerFrameMap[BANK_CONTAINER] = "BankFrame"
		ContainerFrameMap[REAGENTBANK_CONTAINER] = "ReagentBankFrame"
	end
	local container = _c_id[where] or _c_id[where:lower()]
	if container then return ContainerFrameMap[container] end
end

local function GetButtonFor(where,slot)
	-- guild bank tab frame
	local guildtab = isGuildTab(where)
	if guildtab then
		-- return nothing for a not-shown guild tab
		if (guildtab ~= GetCurrentGuildBankTab()) then return end
		-- guild tab layout is weird; handle it
		local index = mod(slot-1, NUM_SLOTS_PER_GUILDBANK_GROUP) + 1
		local column = ceil((slot-0.5)/NUM_SLOTS_PER_GUILDBANK_GROUP)
		return _G["GuildBankFrame"].Columns[column].Buttons[index]
	end
	-- treat everything not in a guild bank as a container
	local container = _c_id[where] or _c_id[where:lower()]
	local frameName = GetContainerFrameName(where)
	if not frameName then return end	-- return nothing for a not-shown container
	-- special containers map slot directly to button number, but
	-- backpack/bags/reagent-bags are reversed. handle it.
	local itemNum = (container <  BACKPACK_CONTAINER) and slot or
		(GetNumSlots(container) - slot + 1)
	return _G[frameName.."Item"..itemNum]
end

local function BagButtonName(bag)
	if (bag == BACKPACK_CONTAINER) then return "MainMenuBarBackpackButton" end
	if (bag <= NUM_BAG_SLOTS) then return "CharacterBag"..(bag-1).."Slot" end
	return "CharacterReagentBag"..(bag-NUM_BAG_SLOTS-1).."Slot"
end



------------------------
-- Stackpack Tooltips --
------------------------

local function ModifyTooltip(tooltip, data)
	local itemLink = tooltip and tooltip.GetItem and select(2, tooltip:GetItem())
	if not itemLink then return end
	local itemID = GetItemID(itemLink)
	if itemID and data and data["id"] and (itemID ~= data["id"]) then
Debug("% tooltip: GetItem said id=",itemID,", data said id=",data["id"]," - activating countermeasures")
		local actualID = data["id"]
		local actualLink = select(2, C_Item.GetItemInfo(actualID))
		if actualLink then
			itemID = actualID
			itemLink = actualLink
Debug("% tooltip: replaced itemid/link with ",actualID,"/",actualLink)
		end
	end
	local id = StackpackSettings["ShowItemIDs"] and itemID
	local ilvl = StackpackSettings["ShowIlvls"] and GetItemLvl(itemLink)
	local stacksize = StackpackSettings["ShowStacksizes"] and select(8, C_Item.GetItemInfo(itemLink))
	if id or ilvl then
		id = id and "Item ID: " .. White .. id
		ilvl = ilvl and "Item Lvl: " .. White .. ilvl
		if id and ilvl then
			tooltip:AddDoubleLine(id, ilvl, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
		else
			local what = id or ilvl
			tooltip:AddLine(what, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
		end
		tooltip:Show()
	end
	if stacksize and (stacksize > 1) then
		stacksize = "Stack Size: " .. White .. stacksize
		tooltip:AddLine(stacksize, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
		tooltip:Show()
	end
end

local function HookTooltips()
	if TTHooked then return end
	if TooltipDataProcessor and TooltipDataProcessor.AddTooltipPostCall then
		TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, ModifyTooltip)
	else
		GameTooltip:HookScript("OnTooltipSetItem", ModifyTooltip)
	end
	TTHooked = true
end



--------------------------------
-- Stackpack Search Filtering --
--------------------------------

local cantDE = { -- not disenchantable item list. horribly out of date.
	["5004"] = 1,["11287"] = 1,["11288"] = 1,["11289"] = 1,["11290"] = 1,["12772"] = 1,
	["14812"] = 1,["18665"] = 1,["20406"] = 1,["20407"] = 1,["20408"] = 1,["21766"] = 1,
	["29378"] = 1,["31336"] = 1,["32540"] = 1,["32541"] = 1,["32660"] = 1,["32662"] = 1,
	["49121"] = 1,["49123"] = 1,["49124"] = 1,["49126"] = 1
}
local cantDESet = {
	-- Alliance sets missing
	-- WOW these need to be updated! ;)
	"Warlord's","Blood Guard's","General's","Sergeant's","Guardian's","Vindicator's","Gladiator's",
	" of the Horde"
}
local cantDF = function(ID)
	local Item = C_Item.GetItemInfo(ID)
	for n=1, #cantDESet do
		if Item:find(cantDESet[n]) then return 1 end
	end
	return 0
end

local function compare(value,query)
	local p, n
	p=query:find(">="); if p then n=tonumber(query:sub(p+2)); return n and (value >= n); end
	p=query:find("<="); if p then n=tonumber(query:sub(p+2)); return n and (value <= n); end
	p=query:find("=="); if p then n=tonumber(query:sub(p+2)); return n and (value == n); end
	p=query:find("!="); if p then n=tonumber(query:sub(p+2)); return n and (value ~= n); end
	p=query:find("~="); if p then n=tonumber(query:sub(p+2)); return n and (value ~= n); end
	p=query:find("<>"); if p then n=tonumber(query:sub(p+2)); return n and (value ~= n); end
	p=query:find(">" ); if p then n=tonumber(query:sub(p+1)); return n and (value >  n); end
	p=query:find("<" ); if p then n=tonumber(query:sub(p+1)); return n and (value <  n); end
	p=query:find("=" ); if p then n=tonumber(query:sub(p+1)); return n and (value == n); end
	return (value > 0)
end

local function ttscanloc(where,slot)
	local guildtab = isGuildTab(where)
	if guildtab then return {"gbank",guildtab,slot} end
	local container = _c_id[where] or _c_id[where:lower()]
	return {"bag",container,slot}
end

local FilterTypes = {
	{
		Type = "eq,equip,equippable",
		Require = function(itemLink)
			local _, _, _, _, _, itemType = C_Item.GetItemInfo(itemLink)
			return (itemType == WEAPON) or (itemType == ARMOR)
		end
	},
	{
		Type = "weap,weapon,weapons",
		Require = function(itemLink)
			local _, _, _, _, _, itemType = C_Item.GetItemInfo(itemLink)
			return (itemType == WEAPON)
		end
	},
	{
		Type = "arm,armor",
		Require = function(itemLink)
			local _, _, _, _, _, itemType = C_Item.GetItemInfo(itemLink)
			return (itemType == ARMOR)
		end
	},
	{
		Type = "boex,bindonequip,  (BoE when acquired)",
		Require = function(itemLink,where,slot)
			return (not not ttscan(GetBaseItemLink(itemLink), ITEM_BIND_ON_EQUIP, "left"))
			    or (not not ttscan(GetBaseItemLink(itemLink), ITEM_BIND_ON_USE, "left"))
		end
	},
	{
		Type = "boe,  (BoE that has not been equipped)",
		Require = function(itemLink,where,slot)
			return (not not ttscan(ttscanloc(where,slot), ITEM_BIND_ON_EQUIP, "left"))
			    or (not not ttscan(ttscanloc(where,slot), ITEM_BIND_ON_USE, "left"))
		end
	},
	{
		Type = "bopx,bindonpickup,  (BoP when acquired)",
		Require = function(itemLink,where,slot)
			if isGuildTab(where) then return false end	-- bop can't be in a guild bank
			return not not ttscan(GetBaseItemLink(itemLink), ITEM_BIND_ON_PICKUP, "left")
		end
	},
	{
		Type = "bop,soulbound,sb,  (currently soulbound)",
		Require = function(itemLink,where,slot)
			if isGuildTab(where) then return false end	-- bop can't be in a guild bank
			return not not ttscan(ttscanloc(where,slot), ITEM_SOULBOUND, "left")
		end
	},
	{
		Type = "boa,accountbound,account",
		Require = function(itemLink,where,slot)
			if isGuildTab(where) then return false end	-- boa can't be in a guild bank
			local loc = ttscanloc(where,slot)
			return (not not ttscan(loc, ITEM_BNETACCOUNTBOUND, "left"))
			    or (not not ttscan(loc, ITEM_ACCOUNTBOUND, "left"))
		end
	},
	{
		Type = "gr[ae]y,junk,vendor,trash,poor",
		Require = function(itemLink)
			local _, _, Quality = GetItemOrPetInfo(itemLink)
			return (Quality == 0)
		end
	},
	{
		Type = "W,C,white,common",
		Require = function(itemLink)
			local _, _, Quality = GetItemOrPetInfo(itemLink)
			return (Quality == 1)
		end
	},
	{
		Type = "G,U,green,uncommon",
		Require = function(itemLink)
			local _, _, Quality = GetItemOrPetInfo(itemLink)
			return (Quality == 2)
		end
	},
	{
		Type = "B,R,blue,rare",
		Require = function(itemLink)
			local _, _, Quality = GetItemOrPetInfo(itemLink)
			return (Quality == 3)
		end
	},
	{
		Type = "P,E,purple,epic",
		Require = function(itemLink)
			local _, _, Quality = GetItemOrPetInfo(itemLink)
			return (Quality == 4)
		end
	},
	{
		Type = "O,L,orange,leg,legend,legendary",
		Require = function(itemLink)
			local _, _, Quality = GetItemOrPetInfo(itemLink)
			return (Quality == 5)
		end
	},
	{
		Type = "A,art,artifact",
		Require = function(itemLink)
			local _, _, Quality = GetItemOrPetInfo(itemLink)
			return (Quality == 6)
		end
	},
	{
		Type = "H,heir,loom,heirloom",
		Require = function(itemLink)
			local _, _, Quality = GetItemOrPetInfo(itemLink)
			return (Quality == 7)
		end
	},
	{
		Type = "gold",
		Require = function(itemLink)
			local _, _, Quality = GetItemOrPetInfo(itemLink)
			return (Quality == 6) or (Quality == 7)
		end
	},
	{
		Type = "de,deable,disenchant,disenchantable",
		Require = function(itemLink)
			local ID = GetItemID(itemLink)
			if not ID or (cantDE[tostring(ID)] == 1) or (cantDF(ID) == 1) then return false end
			local _, _, Quality, _, _, itemType = C_Item.GetItemInfo(itemLink)
			if ((itemType == ARMOR) or (itemType == WEAPON)) and (Quality > 1) and (Quality < 5) then
				return true
			end
			return false
		end
	},
	{	Type = "ilvl,il,  or ilvl query: e.g. ilvl<=200 (all comparisons supported)",
		Require = function(itemLink,where,slot,query)
			local ilvl = GetItemLvl(itemLink)
			if (ilvl == nil) then return false end
			return compare(ilvl,query)
		end
	},
	{	Type = "pet,battlepet,  or pet level query: e.g. pet<25",
		Require = function(itemLink,where,slot,query)
			if GuildBankOpen and ADVISE_GB_PETS_BROKEN and (query:len()>3) then
				Push("Note, pet level queries do not work in guild banks (blame Blizzard)")
				ADVISE_GB_PETS_BROKEN = false -- only show this once per session
			end
			if Enum and Enum.ItemClass and Enum.ItemClass.Battlepet then
				local _, _, _, petLevel, _, _, _, _, _, _, _, classID = GetItemOrPetInfo(itemLink)
				if (classID == Enum.ItemClass.Battlepet) then return compare(petLevel,query) end
			end
			return false
		end
	},
}

local filtercache = {}
local function FindFilterType(filter)
	if not filtercache[filter] then
		filtercache[filter]={nil}
		local filt = filter
		local wanted = true
		if filt:find("^[!~]") then
			filt = filt:sub(2)
			wanted = false
		end
		local triggerFound = nil
		for t=1, #FilterTypes do
			local triggers = { strsplit(",",FilterTypes[t].Type) }
			for w=1, #triggers do
				if filt:find("^"..triggers[w]) then
					triggerFound = t
					break
				end
			end
			if triggerFound then break end
		end
		if triggerFound then filtercache[filter] = {triggerFound,wanted} end
	end
	return unpack(filtercache[filter])
end

local function ApplyFilters(itemLink,filters,where,slot)
	if (itemLink == nil) or (filters == nil) or (#filters == 0) then return true end
	local triggerFound = false
	for _,filter in ipairs(filters) do
		local t, wanted = FindFilterType(filter)
		if not t then return false end
		local filterOK = FilterTypes[t].Require(itemLink,where,slot,filter)
		if (filterOK ~= wanted) then return false end
		triggerFound = true
	end
	return triggerFound
end

local function ParseFilters(text)
	local filters = {}
	while (1) do
		local a, filter, b = text:match("^([^%%]*)%%([^%%]+)%%(.*)$")
		if not filter then break end
		local iter = filter:gmatch("[^;,]+")
		for f in iter do table.insert(filters,f) end
		text = a..b
	end
	text = text:gsub("%%",""):trim()
	return filters, text
end

local function GetFilterMatches(filters,text,where)
	local matches = 0
	where = _c_name[where] or where
	local slots = GetNumSlots(where)
	local matched = {}
	local dataMissing = 0
	Debug("GetFilterMatches(",filters,",\"",text,"\",",where,"): walking ",slots," slots")
	for slot=1,slots do
		local itemLink = GetLink(where,slot)
		local itemName = itemLink and GetItemOrPetInfo(itemLink)
		if (itemLink and not itemName) then dataMissing = dataMissing + 1 end
		local filterOK = false
		if itemName and itemName:lower():find(text:lower()) then
			filterOK = ApplyFilters(itemLink,filters,where,slot)
			-- Debug("GetFilterMatches: ApplyFilters(",itemLink,",...,",slot,") -> ",filterOK)
		end
		if (filterOK) then
			matched[slot] = 1
			matches = matches + 1
		end
	end
	-- iff this container is visible, set alphas according to match state
	if GetContainerFrameName(where) then
		for slot=1,slots do
			local button = GetButtonFor(where,slot)
			if button then button:SetAlpha(matched[slot] and 1 or 0.15) end
		end
	end
	Debug("GetFilterMatches(",filters,",\"",text,"\",",where,"): -> ",matches)
	if (dataMissing > 0) then
		Debug(" - missing item info for ",dataMissing," slot(s)")
		C_Timer.After(0.1, function() RefreshFilter() end)
	end
	return matches
end

local function UpdateCounter(to,on,point,...)
	if not on then return end
	if not on.matches then
		if not to or (to == 0) or (to == "") then return end
		on.matches = on:CreateFontString(nil, "OVERLAY")
		on.matches:SetPoint(point, on, ...)
		on.matches:SetJustifyH("LEFT")
		on.matches:SetFontObject(GameFontNormal)
		on.matches:SetTextHeight(24)
		on.matches:SetTextColor(0,1,0)
	end
	if (to == 0) then to = "" end
	on.matches:SetText(to)
end

local function ResetAlpha(where)
	local slots = GetNumSlots(where)
	for slot=1,slots do
		local button = GetButtonFor(where,slot)
		if button then button:SetAlpha(1) end
	end
end

local STANDARD_BANK_BG = BANK_BAG_BACKGROUND_COLOR
local function UnfilterBank()
	ResetAlpha(BANK_CONTAINER)
	for c=BANK_BAG_1,BANK_BAG_N do
		ResetAlpha(c)
		if BANK_BAG_BACKGROUND_COLOR and PANEL_BACKGROUND_COLOR then
			local frameName = GetContainerFrameName(c)
			local frame = frameName and _G[frameName]
			if frame and frame.UpdateBackground then
				BANK_BAG_BACKGROUND_COLOR = STANDARD_BANK_BG
				frame:UpdateBackground()
			end
		end
	end
	for n=1,GetNumBankSlots() do
		local bag = _G["BankSlotsFrame"]["Bag"..n]
		UpdateCounter(0,bag)
	end
	if IsReagentBankUnlocked and IsReagentBankUnlocked() then
		for t=1,2 do
			local banktab = _G["BankFrameTab"..t]
			UpdateCounter(0,banktab)
		end
		ResetAlpha(REAGENTBANK_CONTAINER)
	end
end

local function EditBoxFocused(frame)
	return function()
		frame.StackpackSearchText:HighlightText();
		if (frame.StackpackSearchText:GetText() == SEARCHTXT) then
			frame.StackpackSearchText:SetCursorPosition(0)
			frame.StackpackSearchText:SetFocus()
		end
	end
end

local function EditBoxUnfocused(frame)
	return function()
		if (frame.StackpackSearchText:GetText() == "") then
			frame.StackpackSearchText:SetText(SEARCHTXT)
		end
		frame.StackpackSearchText:HighlightText(0,0);
		frame.StackpackSearchText:ClearFocus()
	end
end

local function EditBoxChanged(frame, handler)
	return function()
		if (frame.StackpackSearchText:GetText() == SEARCHTXT) then
			frame.StackpackSearchText:SetAlpha(0.5)
		else
			frame.StackpackSearchText:SetAlpha(1.0)
			handler()
		end
	end
end

local function CreateSearchEditBox(name,frame,handler)
	frame.StackpackSearchText = CreateFrame("EditBox",Addon..name.."SearchText",frame,"InputBoxTemplate")
	frame.StackpackSearchText:SetWidth(130)
	frame.StackpackSearchText:SetHeight(13)
	frame.StackpackSearchText:SetAutoFocus(false)
	frame.StackpackSearchText:SetScript("OnTextChanged",EditBoxChanged(frame,handler))
	frame.StackpackSearchText:SetScript("OnEditFocusGained",EditBoxFocused(frame))
	frame.StackpackSearchText:SetScript("OnEditFocusLost",EditBoxUnfocused(frame))
	frame.StackpackSearchText:SetScript("OnEnterPressed",EditBoxUnfocused(frame))
	return frame.StackpackSearchText
end

local function FilterBank(query,other_matches)
	if not BankOpen or not BankFrame or not BankFrame.StackpackSearchText then return 0 end
	BANK_BAG_N = BANK_BAG_1 + GetNumBankSlots() - 1
	local ReagentBank = IsReagentBankUnlocked and IsReagentBankUnlocked()
	local text = BankFrame.StackpackSearchText:GetText()
	query = (type(query) == "string") and query or nil
	if not query and RefreshFilter(true) then return 0 end
	if not query then ResetContainerFrameMap() end
	if (text == nil) or (text == SEARCHTXT) then text="" end
	if (text == "") and query then text=query end
	if (text:len() < 3) then
		if (text ~= "") and not ReagentBank then
			BankFrame.StackpackMatches:SetText("Search too narrow")
		else
			BankFrame.StackpackMatches:SetText("")
		end
		UnfilterBank()
		return 0
	end
	local filters, rest = ParseFilters(text)
	-- main bank frame
	local matches = GetFilterMatches(filters,rest,BANK_CONTAINER)
	-- bags in the bank
	for c=BANK_BAG_1,BANK_BAG_N do
		local bagMatches = GetFilterMatches(filters,rest,c)
		local bag = _G["BankSlotsFrame"]["Bag"..(c-BANK_BAG_1+1)]
		UpdateCounter(bagMatches, bag,"CENTER",0,14)
		matches = matches + bagMatches
	end
	-- reagent bank
	if ReagentBank then
		-- if we have a reagent bank, put counter on the bank tab ...
		local bankTab = _G["BankFrameTab1"]
		UpdateCounter(matches, bankTab,"CENTER",0,-17)
		-- ... then filter reagent bank and put a counter on its tab
		local reagentMatches = GetFilterMatches(filters,rest,REAGENTBANK_CONTAINER)
		local reagentTab = _G["BankFrameTab2"]
		UpdateCounter(reagentMatches, reagentTab,"CENTER",0,-17)
		matches = matches + reagentMatches
	else
		-- otherwise use the text status indicator
		local results = (matches > 0) and P(matches.." result", matches) or "No results"
		BankFrame.StackpackMatches:SetText(results)
	end
	-- no matches, clean up filtering and bail out
	if (matches == 0) and not other_matches then
		UnfilterBank()
		return 0
	end
	-- otherwise, retail bank container frames have weird backdrop that makes low alpha
	-- buttons look stupid. set their backgrounds to the same thing inventory bags use.
	if BANK_BAG_BACKGROUND_COLOR and PANEL_BACKGROUND_COLOR then
		for c=BANK_BAG_1,BANK_BAG_N do
			local frame = _G[ContainerFrameMap[c]]
			if frame and frame.UpdateBackground then
				BANK_BAG_BACKGROUND_COLOR = PANEL_BACKGROUND_COLOR
				frame:UpdateBackground()
			end
		end
	end
	-- pass results back to search dialog, IF we aren't using our own query
	return (query == text) and matches or 0
end

local function UnfilterGuildBank()
	if not GuildBankFrame then return end
	local guildtab = "guildtab"..tostring(GetCurrentGuildBankTab())
	for slot=1,MAX_GUILDBANK_SLOTS_PER_TAB do
		local button = GetButtonFor(guildtab,slot)
		if button then button:SetAlpha(1) end
	end
	local tabs = GetNumGuildBankTabs()
	for t=1,tabs do
		local tab = _G["GuildBankTab"..t].Button
		UpdateCounter(0,tab)
	end
end

local function FilterGuildBank(query,other_matches)
	if not GuildBankOpen or not GuildBankFrame or not GuildBankFrame.StackpackSearchText then return 0 end
	local text = GuildBankFrame.StackpackSearchText:GetText()
	query = (type(query) == "string") and query or nil
	if not query and RefreshFilter(true) then return 0 end
	if not query then ResetContainerFrameMap() end
	if (text == nil) or (text == SEARCHTXT) then text="" end
	if (text == "") and query then text=query end
	if (text:len() < 3) then
		if (text ~= "") then
			GuildBankFrame.StackpackMatches:SetText("Search too narrow")
		else
			GuildBankFrame.StackpackMatches:SetText("")
		end
		UnfilterGuildBank()
		return 0
	end
	local filters, rest = ParseFilters(text)
	local tabs = GetNumGuildBankTabs()
	local matches = 0
	for t=1,tabs do
		local tabMatches = GetFilterMatches(filters,rest,"guildtab"..t)
		local tab = _G["GuildBankTab"..t].Button
		UpdateCounter(tabMatches, tab,"TOPLEFT","TOPRIGHT",2,-5)
		matches = matches + tabMatches
	end
	local results = (matches > 0) and P(matches.." result", matches) or "No results"
	GuildBankFrame.StackpackMatches:SetText(results)
	if (matches == 0) and not other_matches then
		UnfilterGuildBank()
		return 0
	end
	return (query == text) and matches or 0
end

local function UnfilterBags()
	ResetContainerFrameMap()
	for c=BACKPACK_CONTAINER,NUM_TOTAL_EQUIPPED_BAG_SLOTS do
		ResetAlpha(c)
		local bag = _G[BagButtonName(c)]
		UpdateCounter(0,bag)
	end
	if BankOpen then FilterBank("",false) end
	if GuildBankOpen then FilterGuildBank("",false) end
	local dialog = StaticPopup_FindVisible("STACKPACK_SEARCH_BAGS")
	if dialog then dialog.text:SetText("Enter a query of 3 or more characters in length") end
end

local function FilterBags(query)
	local text = query
	if (text == SEARCHTXT) or (text:len() < 3) then
		UnfilterBags()
		return
	end
	ResetContainerFrameMap()
	local filters, rest = ParseFilters(text)
	local matches = 0
	for c=BACKPACK_CONTAINER,NUM_TOTAL_EQUIPPED_BAG_SLOTS do
		local bagMatches = GetFilterMatches(filters,rest,c)
		local bag = _G[BagButtonName(c)]
		UpdateCounter(bagMatches, bag,"CENTER",0,-13)
		matches = matches + bagMatches
	end
	if BankOpen then matches = matches + FilterBank(query,(matches>0)) end
	if GuildBankOpen then matches = matches + FilterGuildBank(query,(matches>0)) end
	local dialog = StaticPopup_FindVisible("STACKPACK_SEARCH_BAGS")
	if (matches == 0) then
		UnfilterBags()
		dialog.text:SetText("Nothing found for '"..query.."'")
		return
	end
	dialog.text:SetText(P("Found "..matches.." item", matches))
end

StaticPopupDialogs["STACKPACK_SEARCH_BAGS"] = {
	text = "Enter a query of 3 or more characters in length",
	button1 = DONE,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1,
	hasEditBox = 1,
	OnShow = function(self)
		_G[self:GetName().."EditBox"]:SetAutoFocus(false);
		_G[self:GetName().."EditBox"]:SetText(LastQuery)
		_G[self:GetName().."EditBox"]:HighlightText()
		_G[self:GetName().."EditBox"]:SetFocus()
	end,
	OnAccept = function()
		UnfilterBags()
	end,
	EditBoxOnTextChanged = function(self)
		local query = _G[self:GetParent():GetName().."EditBox"]:GetText()
		LastQuery = query
		FilterBags(query)
	end,
	EditBoxOnEnterPressed = function(self)
		UnfilterBags()
		self:GetParent():Hide()
	end,
	EditBoxOnEscapePressed = function(self)
		UnfilterBags()
		self:GetParent():Hide()
	end
}

local RefreshCooldown
function RefreshFilter(when,dialogOnly)	-- is local (forward declared)
	-- if <true> then when must be NOW.
	if (when == true) or dialogOnly then when=NOW; dialogOnly=true end
	-- if when==0 then trigger a NOW call on the next frame refresh.
	if (when == 0) then return C_Timer.After(0, function() RefreshFilter(NOW) end) end
	-- if we're already on cooldown, reset the cooldown (and use it to schedule a call at cooldown's end).
	local cd = (((when ~= NOW) and (type(when)=="number")) and when or 0.2)
	local onCooldown = not not RefreshCooldown
	if onCooldown then
		RefreshCooldown:Cancel()
		RefreshCooldown = C_Timer.NewTicker(cd, function() RefreshCooldown = nil ; RefreshFilter() end, 1)
	end
	-- "defer" calls during cooldown: they get "merged" into the (single) call we make at cooldown's end.
	if onCooldown and (when ~= NOW) then return end
	-- otherwise, run immediately.   set (noop) cooldown if we didn't already have one ...
	if not onCooldown then RefreshCooldown = C_Timer.NewTicker(cd, function() RefreshCooldown = nil end, 1) end
	-- ... and actually do what we're here to do.
	local dialog = StaticPopup_FindVisible("STACKPACK_SEARCH_BAGS")
	Debug("RefreshFilter(",when,",",dialogOnly,"): dialog=",not not dialog)
	if dialog then StaticPopupDialogs["STACKPACK_SEARCH_BAGS"].EditBoxOnTextChanged(dialog.editBox); return true
	elseif (dialogOnly == true) then return false
	else UnfilterBags()
	end
end

function Stackpack.SearchDialog(query)
	if query and (query ~= "") then LastQuery = query end
	StaticPopup_Show("STACKPACK_SEARCH_BAGS")
end



---------------------------------------------------
-- Scanning: find partial stacks needing filling --
---------------------------------------------------

local function Organize()
	local SpecialBags = {}
	for c=1,NUM_BAG_SLOTS do
		if (C_Container.GetContainerNumSlots(c) > 0) and (C_Container.GetContainerNumFreeSlots(c) > 0) then
			local BagID = C_Container.ContainerIDToInventoryID(c)
			local BagLink = GetInventoryItemLink("player",BagID)
			if BagLink then
				local BagType = select(2, C_Container.GetContainerNumFreeSlots(c))
				if (BagType > 0) then
					local n = #SpecialBags + 1
					SpecialBags[n] = { ["Type"]=BagType, ["Index"]=c, ["BagID"]=BagID }
				end
			end
		end
	end
	if (#SpecialBags == 0) then return end
	for j=1,#SpecialBags do
		for c=BACKPACK_CONTAINER,NUM_TOTAL_EQUIPPED_BAG_SLOTS do
			if (c ~= SpecialBags[j].Index) then
				local i = SpecialBags[j].Index
				local BagType = ""
				if (c > 0) then
					local BagID = C_Container.ContainerIDToInventoryID(c)
					local BagLink = GetInventoryItemLink("player",BagID)
					if BagLink then
						BagType = select(2, C_Container.GetContainerNumFreeSlots(c))
					end
				end
				if (SpecialBags[j].Type ~= BagType) then
					local slots = C_Container.GetContainerNumSlots(c)
					for s=1,slots do
						local ID = GetItemID(C_Container.GetContainerItemLink(c,s))
						if ID then
							local ItemFamily = C_Item.GetItemFamily(ID)
							if ItemFamily and (ItemFamily > 0) then
								local FreeSpace = C_Container.GetContainerNumFreeSlots(i)
								if (ItemFamily == SpecialBags[j].Type) then
									C_Container.PickupContainerItem(c,s)
									PutItemInBag(SpecialBags[j].BagID)
									FreeSpace = FreeSpace - 1
								end
								if (FreeSpace <= 0) then break end
							end
						end
					end
				end
			end
		end
	end
end

local function FindStacks(where,slot)
	local itemCount = 0
	local itemStack = 0
	local itemID
	local itemName
	if GuildBankOpen then
		if StackpackSettings["StackGuildBank"] or GuildBankStackAll then
			local Count = select(2, GetGuildBankItemInfo(where,slot))
			if (Count > 0) then
				local ID = GetItemID(GetGuildBankItemLink(where,slot))
				if (ID == nil) then return end
				local Item, _, _, _, _, _, _, Stack = C_Item.GetItemInfo(ID)
				itemCount = Count
				itemStack = Stack
				itemID = ID
				itemName = Item
			end
		end
	else
		local cInfo = C_Container.GetContainerItemInfo(where,slot)
		if cInfo and ((cInfo.quality == -1) or (cInfo.stackCount ~= nil)) then
			local ID = GetItemID(C_Container.GetContainerItemLink(where,slot))
			if ID then
				local Item, _, _, _, _, _, _, Stack = C_Item.GetItemInfo(ID)
				itemCount = cInfo.stackCount
				itemStack = Stack
				itemID = ID
				itemName = Item
				if (tostring(StackpackDebugID)==tostring(ID)) then Debug("ID:",ID," Item:",Item," Stack:",Stack," stackCount:",cInfo.stackCount," ...  itemCount now:",itemCount) end
			end
		end
	end
	if itemStack then
		if (itemCount < itemStack) then
			Queued = Queued + 1
			Queue[Queued] = { ["Item"]=itemName,["Bag"]=where,["Slot"]=slot,["ID"]=itemID,["Stack"]=itemStack,["Count"]=itemCount,["Need"]=itemStack-itemCount }
		end
	end
end

local function ScanBag(where)
	if not Enabled and not ForceScan then return end
	local slots = GuildBankOpen and MAX_GUILDBANK_SLOTS_PER_TAB or C_Container.GetContainerNumSlots(where)
	for slot=1,slots do
		FindStacks(where,slot)
	end
end



--------------------------------------------------------------------
-- InitScan: trigger scan, identify moves to make, and queue them --
--------------------------------------------------------------------

local function InitScan()
	local Bags = -1
	local FirstBag = 0
	local StackID = -1
	local DropBag
	local DropSlot
	local OpenBag
	local OpenSlot
	local BagPosition = {}
	local AvailSlots = 0
	Ready = {}
	Queue = {}
	Queued = -1
	Debug("InitScan start")
	if BankOpen then
		-- bank bags' AvailSlots
		BANK_BAG_N = BANK_BAG_1 + GetNumBankSlots() - 1
		FirstBag = BANK_BAG_1
		for c=BANK_BAG_1,BANK_BAG_N do
			if (C_Container.GetContainerNumSlots(c) > 0) then
				Bags = Bags + 1
				BagPosition[Bags+BANK_BAG_1] = c
				local slots = C_Container.GetContainerNumSlots(c)
				for s=1,slots do
					local cInfo = C_Container.GetContainerItemInfo(c,s)
					if (cInfo == nil) then
						AvailSlots = AvailSlots + 1
					end
				end
			end
		end
		if (Bags > -1) then
			Bags = Bags + BANK_BAG_1
			if IsReagentBankUnlocked and IsReagentBankUnlocked() then
				Bags = Bags + 1
				BagPosition[Bags] = REAGENTBANK_CONTAINER
				if ReagentBankFrame and ReagentBankFrame_OnShow then
					ReagentBankFrame_OnShow(ReagentBankFrame)
				end
			end
		end
	elseif GuildBankOpen then
		local guildname = GetGuildInfo("player")
		if (StackpackSettings["StackGuildBank"] == guildname) or GuildBankStackAll then
			local tab = GetCurrentGuildBankTab()
			if (tab == nil) then
				GuildBankOpen = false
				return
			end
			local canDeposit = select(4, GetGuildBankTabInfo(tab))
			if IsGuildLeader(UnitName("player")) then canDeposit = 1 end
			if not canDeposit then return end
			if not GuildBankStackAll then
				FirstBag = tab
				Bags = tab
				BagPosition[tab] = tab
			else
				local tabs = GetNumGuildBankTabs()
				FirstBag = 1
				Bags = tabs
				for t=1,tabs do BagPosition[t]=t end
			end
		elseif StackpackSettings["StackGuildBank"] then
			StackGuild_Prompt()
		end
	else
		Organize()
		FirstBag = 0
		for c=BACKPACK_CONTAINER,NUM_TOTAL_EQUIPPED_BAG_SLOTS do
			if (C_Container.GetContainerNumSlots(c) > 0) then
				Bags = Bags + 1
				BagPosition[Bags] = c
			end
		end
	end
	if (Bags > -1) or BankOpen or GuildBankOpen then
		for c=FirstBag,Bags do ScanBag(BagPosition[c]) end
		if BankOpen then
			-- AvailSlots for the "Bank" tab's "Item Slots" section
			for slot=1,NUM_BANKGENERIC_SLOTS do
				local cInfo = C_Container.GetContainerItemInfo(BANK_CONTAINER,slot)
				if (cInfo == nil) then
					AvailSlots = AvailSlots + 1
				end
				FindStacks(BANK_CONTAINER,slot)
			end
			local npc = UnitName("npc")
			npc = npc and (npc .. " ") or ""
			BankFrameTitleText:SetText(npc.."("..AvailSlots.." Free Slots)")
		end
		if (Queued > 0) then
			for c=0,Queued do
				for n=0,Queued do
					if (n ~= c) then
						if (Queue[n].ID == Queue[c].ID) and (Queue[c].ID ~= -1) and (Queue[n].ID ~= -1) then
							if (Queue[c].Need <= Queue[n].Need) then
								if (Queue[n].Count < Queue[c].Need) then
									StackID = StackID + 1
									DropBag = Queue[c].Bag
									DropSlot = Queue[c].Slot
									OpenBag = Queue[n].Bag
									OpenSlot = Queue[n].Slot
									Ready[StackID] = { ["Mode"]="All", ["Count"]=Queue[n].Count, ["OpenBag"]=OpenBag, ["OpenSlot"]=OpenSlot, ["DropBag"]=DropBag, ["DropSlot"]=DropSlot }
									Queue[c].Count = Queue[c].Count + Queue[n].Count
									Queue[c].Need = Queue[c].Stack - Queue[c].Count
									Queue[n] = { ["Item"]="",["Bag"]=-1,["Slot"]=-1,["ID"]=-1,["Stack"]=0,["Count"]=0,["Need"]=0 }
								elseif (Queue[n].Count == Queue[c].Need) then
									StackID = StackID + 1
									DropBag = Queue[c].Bag
									DropSlot = Queue[c].Slot
									OpenBag = Queue[n].Bag
									OpenSlot = Queue[n].Slot
									Ready[StackID] = { ["Mode"]="All", ["Count"]=Queue[n].Count, ["OpenBag"]=OpenBag, ["OpenSlot"]=OpenSlot, ["DropBag"]=DropBag, ["DropSlot"]=DropSlot }
									Queue[c] = { ["Item"]="",["Bag"]=-1,["Slot"]=-1,["ID"]=-1,["Stack"]=0,["Count"]=0,["Need"]=0 }
									Queue[n] = { ["Item"]="",["Bag"]=-1,["Slot"]=-1,["ID"]=-1,["Stack"]=0,["Count"]=0,["Need"]=0 }
								elseif (Queue[n].Count > Queue[c].Need) then
									StackID = StackID + 1
									DropBag = Queue[c].Bag
									DropSlot = Queue[c].Slot
									OpenBag = Queue[n].Bag
									OpenSlot = Queue[n].Slot
									Ready[StackID] = { ["Mode"]="Split", ["Count"]=Queue[c].Need, ["OpenBag"]=OpenBag, ["OpenSlot"]=OpenSlot, ["DropBag"]=DropBag, ["DropSlot"]=DropSlot }
									Queue[n].Count = Queue[n].Count - Queue[c].Need
									Queue[n].Need = Queue[n].Stack - Queue[n].Count
									Queue[c] = { ["Item"]="",["Bag"]=-1,["Slot"]=-1,["ID"]=-1,["Stack"]=0,["Count"]=0,["Need"]=0 }
								end
							end
						end
					end
				end
			end
		end
	end
	if (StackID == -1) then
		ForceScan = false
		if (lastReady > -1) then Push("Stackpack finished") end
		lastReady = StackID
	else
		Stacking = 1
		ReadyID = 0
		State = 0
		if (lastReady > StackID) or ((lastReady < 0) and (StackID > (GuildBankOpen and 2 or 5))) then
			Push("Stackpack is busy ("..StackID..")")
			lastReady = StackID	-- if below threshold this won't be set
		end
		WFrame:SetScript("OnUpdate", StackItem)
	end
	Debug("InitScan exiting with Ready count ",StackID)
end



------------------------------------------------------------------------
-- StackItem: the queued moves queue-runner that actually moves items --
------------------------------------------------------------------------

function StackItem()	-- is local (forward declared)
	if isLooting then return end
	if (ReadyID < 0) then return end
	WaitForMove = WaitForMove + 1
	local pick="("..tostring(Ready[ReadyID].OpenBag)..","..tostring(Ready[ReadyID].OpenSlot)..")"
	local drop="("..tostring(Ready[ReadyID].DropBag)..","..tostring(Ready[ReadyID].DropSlot)..")"
	local move=pick.."->"..drop.." x"..tostring(Ready[ReadyID].Count)
	local info="["..tostring(WaitForMove).."]  "..tostring(ReadyID)..": "..move

	if select(3, C_Container.GetContainerItemInfo(Ready[ReadyID].OpenBag, Ready[ReadyID].OpenSlot)) then Debug("pick location ",pick," locked ?!"); State = 3 end
	if select(3, C_Container.GetContainerItemInfo(Ready[ReadyID].DropBag, Ready[ReadyID].DropSlot)) then Debug("drop location ",drop," locked ?!"); State = 3 end
	if (WaitForMove > MAX_WAIT_FOR_MOVE) then Debug(info,": wait exceeded, forcing to State=3"); State = 3 end

	if (State == 0) then	-- starting a new ReadyID. should not be holding anything.  pick the source item(s) up.
		if (WaitForMove < 0) then return end		-- idle until quiesce timer elapses
		if (WaitForMove < 1) then return InitScan() end	-- rescan when timer reaches 0
		Debug(info,": State=0: pick up item(s)")
		if not HoldingItem() then
			if GuildBankOpen then
				if SKIP_SPLIT or (Ready[ReadyID].Mode == "All") then
					Debug("PickupGuildBankItem",pick)
					PickupGuildBankItem(Ready[ReadyID].OpenBag, Ready[ReadyID].OpenSlot)
				elseif (Ready[ReadyID].Mode == "Split") then
					Debug("SplitGuildBankItem",gsub(pick,"%)",","..tostring(Ready[ReadyID].Count)..")"))
					SplitGuildBankItem(Ready[ReadyID].OpenBag, Ready[ReadyID].OpenSlot, Ready[ReadyID].Count)
				end
			else
				if SKIP_SPLIT or (Ready[ReadyID].Mode == "All") then
					Debug("PickupContainerItem",pick)
					C_Container.PickupContainerItem(Ready[ReadyID].OpenBag, Ready[ReadyID].OpenSlot)
				elseif (Ready[ReadyID].Mode == "Split") then
					Debug("SplitContainerItem",gsub(pick,"%)",","..tostring(Ready[ReadyID].Count)..")"))
					C_Container.SplitContainerItem(Ready[ReadyID].OpenBag, Ready[ReadyID].OpenSlot, Ready[ReadyID].Count)
				end
			end
		end
		State = 1

	elseif (State == 1) then	-- wait until we are holding something, then put in the target location
		if ((WaitForMove % 25) == 1) then Debug(info,": State=1: wait until holding item(s)") end
		if not HoldingItem() then return end
		WaitForMove = 0
		State = 2
		Debug(info,": State=1: put down held item(s)")
		if GuildBankOpen then
			Stacking = 1
			Debug("PickupGuildBankItem",drop)
			PickupGuildBankItem(Ready[ReadyID].DropBag, Ready[ReadyID].DropSlot)
		else
			Stacking = 1
			Debug("PickupContainerItem",drop)
			C_Container.PickupContainerItem(Ready[ReadyID].DropBag, Ready[ReadyID].DropSlot)
		end

	elseif (State == 2) then	-- put item(s) down in target location
		if ((WaitForMove % 25) == 1) then Debug(info,": State=2/",Stacking,": wait for item(s) to be put down") end
		if not HoldingItem() then
			if (Stacking > (GuildBankOpen and GB_EVENTS_NEEDED or BAG_EVENTS_NEEDED)) then
				WaitForMove = 0
				State = 3
			end
		end

	elseif (State == 3) then	-- finish current ReadyID and clean up if that was the last one
		Debug(info,": State=3: done with this move")
		ReadyID = ReadyID + 1
		State = 0
		WaitForMove = 0
		if (Ready[ReadyID] == nil) then
			WFrame:SetScript("OnUpdate", nil)
			Ready = {}
			ReadyID = 0
			Stacking = 0
			GuildBankStackAll = false
			Organize()
			InitScan()
		end
	end
end



----------------------------------------------------------------------------------
-- Handle Stackpack toggling (by direct user input or passively on stack splits --
----------------------------------------------------------------------------------

function Stackpack.Toggle()
	if not SPToggle then
		SplitStack = false
		SPToggle = true
		SPCycle = 0
		Push("Stackpack will ignore the next inventory change.")
	else
		SPToggle = false
		SPCycle = 0
		Push("Stackpack will now resume stacking.")
	end
	Debug("Stackpack.Toggle: SPToggle set to ",SPToggle)
end

local function doSPcycle(event)
	SPCycle = SPCycle + 1
	Debug("doSPcycle: SPCycle now ",SPCycle,", SplitStack=",SplitStack)
	if not SplitStack then
		if (SPCycle >= 2) then
			SPCycle = 0
			SPToggle = false
			Push("Stackpack will now resume stacking.")
		end
	else
		if (event == "BAG_UPDATE_DELAYED") or (event == "ITEM_COUNT_CHANGED") or (SPCycle >= 3) then
			SPCycle = 0
			SPToggle = false
		end
	end
	Debug("doSPcycle returning with SPToggle=",SPToggle)
end

local function OnStackSplit()
	if StackHook then StackHook() end
	SplitStack = true
	SPCycle = 0
	SPToggle = true
	Debug("OnStackSplit: set SplitStack=",SplitStack)
end

local function HookSplit()
	local split_func = {
		"StackSplitOkayButton_OnClick", -- retail
		"StackSplitFrameOkay_Click"	-- classic era, wrath classic
	}
	local split_button = {
		"OkayButton",			-- retail
		"StackSplitOkayButton"		-- classic era, wrath classic
	}
	local split = which(split_func,_G)
	local buttonname,button = which(split_button,StackSplitFrame)
	if not button then buttonname,button = which(split_button,_G) end
	if split then
		StackHook = _G[split]
		_G[split] = OnStackSplit
		if button then button:SetScript("OnClick", OnStackSplit) end
		Debug("Hooked: ",split," (",buttonname,")")
	end
end



---------------------------------------------------------------------
-- TriggerStacking: handle stacking-triggering events and commands --
---------------------------------------------------------------------

local function TriggerStacking(trigger)
	local ci = GetCursorInfo()
	Debug("TriggerStacking(",trigger,"): cursor has ",ci,", Stacking=",Stacking,", SPToggle=",SPToggle,", Enabled=",Enabled,", ForceScan=",ForceScan)
	if HoldingSomething() then return end
	local OpenOrClose = trigger:find("_OPENED$") or trigger:find("_CLOSED$")
	if (Stacking == 0) then
		-- not currently running the stacking queue
		if (not SPToggle and Enabled) or ForceScan then
			InitScan()
			if (Stacking > 0) and GuildBankOpen then WaitForMove = -GB_QUIESCE end
		elseif SPToggle and not OpenOrClose then
			-- ignore _OPENED and _CLOSED events; advance toggle cycle on anything else
			doSPcycle(trigger)
		end
	-- StackItem triggered item moves generate events we need to wait for to keep moves from looping or stalling; these events get routed here.
	-- Always ignore _OPENED/_CLOSED events for purposes of event counting
	-- Only count guild bank bag slot events if guild bank is open.  otherwise count anything, and make BAG_UPDATE_DELAYED worth the tunable value,
	-- StackItem will then use the counter to help keep track of its state.
	elseif not OpenOrClose then
		Stacking = Stacking + (GuildBankOpen and ((trigger=="GUILDBANKBAGSLOTS_CHANGED") and 1 or 0)
					or ((trigger==TRIGGER_EVENT) and (trigger~="BAG_UPDATE") and BAG_UPDATE_DELAYED_VAL or 1))
	end
end



---------------------------------------------------
-- Handle user commands and confirmation dialogs --
---------------------------------------------------

local function G(setting,style)
	local value = StackpackSettings[setting]
	if (style == 1) then return value and "will" or "will not" end
	if (style == 2) then value = value and "on" or "off"; return "(currently " .. White .. value .. Normal .. ")" end
	return tostring(value)
end
local function S(cmd,verb,setting)
	local current = StackpackSettings[setting] or false
	local new = not current	-- toggle by default
	-- for a verb of e.g. "ilvl", handle cmds of any sane variant
	-- e.g. "ilvl", "ilvls" to toggle,
	--	"ilvlon", "ilvlson", "ilvl on", "ilvls on" to turn on,
	--	"ilvloff", "ilvlsoff", "ilvl off", "ilvls off" to turn off
	local values = {
		["0"] = false, ["off"] = false, ["no"]  = false, ["false"] = false,
		["1"] = true,  ["on"]  = true,  ["yes"] = true,  ["true"]  = true
	}
	if (cmd:sub(1,verb:len()) ~= verb) then return false end
	local pos = verb:len() + 1
	if (cmd:sub(pos,pos) == "s") then pos = pos + 1 end
	if (cmd:sub(pos,pos) == " ") then pos = pos + 1 end
	local value = cmd:sub(pos)
	if (value:len() > 0) then
		new = values[value:lower()]
		if (new == nil) then
			Push("Bad value "..tostring(value).." for "..verb)
			return true
		end
	end
	StackpackSettings[setting] = new
	return true
end

local function StackGuild_Command(cmd)
	cmd = cmd:lower()
	local guildname = GetGuildInfo("player")
	if (cmd == "off") then
		StackpackSettings["StackGuildBank"] = false
		Push("Stackpack will not stack the guild bank.")
	elseif (cmd == "on") then
		StackpackSettings["StackGuildBank"] = guildname or true
		Push("Stackpack will stack the guild bank.")
		if GuildBankOpen then
			if not SPToggle then
				TriggerStacking("cmd:stackguild on")
			else
				Push("Move an item to begin guild bank stacking.")
			end
		end
	elseif (cmd == "help") or (cmd == "") then
		Push("/stackguild <on/off> or /stackgb <on/off> - Toggle stacking of the guild bank "..G("StackGuildBank",2))
	end
end

function StackGuild_Prompt()	-- is local (forward declared)
	local guildname = GetGuildInfo("player")
	local text = Guild .. "Stackpack - Guild Bank Stacking\n\n" ..
			"Guild bank stacking is turned on for this character, and this is" ..
			" your first time opening the guild bank for\n" ..
			White .. tostring(guildname) .. Guild .. "\n\n" ..
			"Please confirm stacking for this guild bank!\n\n" ..
			"You can change this setting later -\n" ..
			"use " .. White .. "/stackguild" .. Guild .. " for more info"
	StaticPopupDialogs["STACKPACK_CONFIRM_GUILDSTACK"] = {
		text = text,
		button1 = YES,
		button2 = NO,
		timeout = 0,
		whileDead = 0,
		hideOnEscape = 1,
		wide = 1,
		OnAccept = function()
			StackGuild_Command("on")
		end,
		OnCancel = function()
			StackGuild_Command("off")
		end
	}
	StaticPopup_Show("STACKPACK_CONFIRM_GUILDSTACK")
end

local function showStackWarning()
	StaticPopupDialogs["STACKPACK_STACK_GUILD_BANK"] = {
		text = Warn .. "WARNING!" .. White .. "\n\nIf you continue, your ENTIRE guild bank will be stacked. That means tabs 1-"..GetNumGuildBankTabs().." will have their contents combined.\n\nAre you absolutely sure you want to do this?",
		button1 = YES,
		button2 = NO,
		timeout = 0,
		whileDead = 0,
		hideOnEscape = 1,
		OnAccept = function()
			GuildBankOpen = true
			GuildBankStackAll = true
			TriggerStacking("showStackWarning")
		end,
		OnCancel = function()
			GuildBankOpen = true
			GuildBankStackAll = false
		end
	}
	StaticPopup_Show("STACKPACK_STACK_GUILD_BANK")
end

local function Stackpack_Command(command)
	command = command or ""
	local verb, rest = command:trim():match("^(%S+)%s*(.*)")
	local cmd = verb and verb:lower() or ""
	local lcrest = rest and rest:lower() or ""
	local lc = (lcrest ~= "") and strjoin(" ",cmd,lcrest) or cmd
	Debug("COMMAND: [",cmd,"] [",lcrest,"]")

	if (cmd == "on") then
		Enabled = true
		Push("Stackpack is on.")
	elseif (cmd == "off") then
		Enabled = false
		Push("Stackpack is off.")
	elseif (cmd == "scan") or (cmd == "start") or (cmd == "go") or (cmd == "stack") then
		if HoldingSomething() then
			Push("Stackpack tells you, \"Please remove the object from your cursor first.\"",2,0.28,2)
		elseif (Stacking == 1) then
			Push("Stackpack tells you, \"I'm busy.. please try again in a few.\"",2,0.28,2)
		else
			ForceScan = true
			TriggerStacking("cmd:"..cmd)
		end
	elseif (cmd == "toggle") then
		Stackpack.Toggle()
	elseif (cmd == "searchoff") then
		StackpackSettings["UseInventorySearch"] = false
		Stackpack_SearchButton:Hide()
		Push("Inventory search disabled.")
	elseif (cmd == "searchon") then
		StackpackSettings["UseInventorySearch"] = true
		Stackpack_SearchButton:Show()
		Push("Inventory search enabled.")
	elseif (cmd == "search") then
		Stackpack.SearchDialog(rest)
	elseif (cmd == "dump") then
		DebugDump()
	elseif S(lc, "itemid", "ShowItemIDs") then
		Push("Item IDs "..G("ShowItemIDs",1).." be shown in tooltips.")
	elseif S(lc, "ilvl", "ShowIlvls") then
		Push("Item levels "..G("ShowIlvls",1).." be shown in tooltips.")
	elseif S(lc, "stacksize", "ShowStacksize") then
		Push("Stack sizes "..G("ShowStacksize",1).." be shown in tooltips.")
	elseif S(lc, "debug", "ShowDebug") then
		Push("Debugging messages "..G("ShowDebug",1).." be shown.")
	elseif (cmd == "searchhelp") then
		Push("To search the inventory, click the search button (magnifying glass icon) next to your main action bars.")
		Push("If the search button is not visible, try typing /stp searchon to enable inventory searching")
		Push("You can perform filtered searches by entering %SOME_FILTER% in the search box")
		Push("Stackpack supports the following filters:")
		for n=1, #FilterTypes do
			Push("    " .. White .. FilterTypes[n].Type)
		end
		Push("Multiple filters can be given; all must match.")
	elseif (cmd == "new") or (cmd == "news") then
		WhatsNew(rest and tonumber(rest) or 999)
	elseif (cmd == "help") or (cmd == "") then
		Push("Stackpack "..Version.." Help",1,1,0)
		if not Enabled then Push("Stackpack is currently " .. Warn .. "off" .. Normal .. " - enable it again with " .. White .. "/stackpack on", 1,1,.5) end
		Push("Use /stackpack or /stp to run a command")
		Push("   <on/off> - Turn Stackpack on or off")
		Push("   <go/scan/stack/start> - Tell Stackpack to try and stack items")
		Push("   toggle - Toggle Stackpack on or off momentarily")
		Push("   search [query] - Open the inventory search dialog")
		Push("   searchhelp - Display help for inventory searching")
		Push("   searchon - Turn on inventory searching")
		Push("   searchoff - Turn off inventory searching")
		Push("   itemids [on|off] - Turn on/off item IDs in tooltips "..G("ShowItemIDs",2))
		Push("   ilvls [on|off] - Turn on/off item levels in tooltips "..G("ShowIlvls",2))
		Push("   stacksizes [on|off] - Turn on/off stack sizes in tooltips "..G("ShowStacksizes",2))
		Push("   news [n] - Show [n most recent] What's New entries")
		Push("/stackguild or /stackgb <on/off> - Toggle stacking of the guild bank "..G("StackGuildBank",2))
	else	Push("Unknown command '"..cmd.."' - for valid commands use /stackpack help")
	end
end



-------------------
-- Event Handler --
-------------------

function Stackpack.OnEvent(self, event, ...)
	local param1,param2 = select(1,...)
	Debug("EVENT:",event," ",param1," ",param2)
	if (event == "PLAYER_INTERACTION_MANAGER_FRAME_HIDE") then
		if	(param1 == Enum.PlayerInteractionType.TradePartner)	then event = "TRADE_CLOSED"
		elseif	(param1 == Enum.PlayerInteractionType.MailInfo)		then event = "MAIL_CLOSED"
		elseif	(param1 == Enum.PlayerInteractionType.Auctioneer)	then event = "AUCTION_HOUSE_CLOSED"
		elseif	(param1 == Enum.PlayerInteractionType.Banker)		then event = "BANKFRAME_CLOSED"
		elseif	(param1 == Enum.PlayerInteractionType.GuildBanker)	then event = "GUILDBANKFRAME_CLOSED"
		end
	elseif (event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW") then
		if	(param1 == Enum.PlayerInteractionType.Banker)		then event = "BANKFRAME_OPENED"
		elseif	(param1 == Enum.PlayerInteractionType.GuildBanker)	then event = "GUILDBANKFRAME_OPENED"
		end
	end

	if (event == "PLAYER_ENTERING_WORLD") then
		if (StackpackGlobalSettings == nil) then StackpackGlobalSettings = DefaultGlobalSettings end
		if (StackpackSettings == nil) then StackpackSettings = DefaultSettings end
		if (param1 or param2) then StackpackSettings["ShowDebug"] = false end -- don't persist debugging across sessions
		if not StackpackSettings["UseInventorySearch"] then Stackpack_SearchButton:Hide() end
		hooksecurefunc("OpenBag", function() RefreshFilter() end)
		hooksecurefunc("ToggleBag", function() RefreshFilter() end)
		C_Timer.After(2, HookTooltips)	-- try to be last thing in tooltips
		_G["dump"] = dump
		WhatsNew()
	elseif (event == TRIGGER_EVENT) then
		if isLooting then return end
		if not AHOpen() and not TradeOpen() and not SendMailOpen() and not CTMailOpen() then
			TriggerStacking(event)
		else
			Debug("NOT triggering stacking: SPToggle=",SPToggle," AHOpen=",AHOpen()," TradeOpen=",TradeOpen()," SendMailOpen=",SendMailOpen()," CTMailOpen=",CTMailOpen())
		end
		RefreshFilter()
	elseif (event == "TRADE_CLOSED") or (event == "MAIL_CLOSED") or (event == "AUCTION_HOUSE_CLOSED") then
		TriggerStacking(event)
	elseif (event == "PLAYERBANKSLOTS_CHANGED") or (event == "PLAYERREAGENTBANKSLOTS_CHANGED") then
		TriggerStacking(event)
		RefreshFilter()
	elseif (event == "BANKFRAME_OPENED") then
		BankOpen = true
		TriggerStacking(event)
		if not BankFrame.StackpackSearchText then
			local right = BankSlotsFrame.Bag7 and BankSlotsFrame.Bag7 or BankSlotsFrame.Bag6
			local y1 = BankFrameMoneyFrameCopperButton:GetTop()
			local y2 = right:GetBottom()
			if y1 and y2 then
				local yoff = y1 - y2 + 8
				_G["BankFramePurchaseButton"]:ClearAllPoints()
				_G["BankFramePurchaseButton"]:SetPoint("BOTTOMRIGHT",right,"BOTTOMRIGHT",0,yoff)
				_G["BankFrameSlotCost"]:ClearAllPoints()
				_G["BankFrameSlotCost"]:SetPoint("CENTER","BankFramePurchaseButton","CENTER",-15,19)
				CreateSearchEditBox("Bank", BankFrame, FilterBank):SetPoint("BOTTOMLEFT",BankSlotsFrame.Bag1,"BOTTOMLEFT",0,yoff+2)
				if not BankFrame.StackpackMatches then
					BankFrame.StackpackMatches = BankFrame:CreateFontString(nil, "OVERLAY")
					BankFrame.StackpackMatches:SetPoint("BOTTOMLEFT",BankFrame.StackpackSearchText,0,19)
					BankFrame.StackpackMatches:SetJustifyH("LEFT")
					BankFrame.StackpackMatches:SetFontObject(GameFontNormal)
					BankFrame.StackpackMatches:SetTextHeight(12)
					BankFrame.StackpackMatches:SetTextColor(0,1,0)
					BankFrame.StackpackMatches:SetText("")
				end
			end
		end
		if BankFrame.StackpackSearchText then
			BankFrame.StackpackSearchText:SetText(SEARCHTXT)
		end
		RefreshFilter(0) -- must be >=0
	elseif (event == "BANKFRAME_CLOSED") then
		BankOpen = false
		TriggerStacking(event)
		RefreshFilter(NOW)
	elseif (event == "GUILDBANKFRAME_OPENED") then
		GuildBankOpen = true
		TriggerStacking(event)
		if GuildBankFrame then
			if not GuildBankFrame.StackpackSearchText then
				CreateSearchEditBox("GuildBank", GuildBankFrame, FilterGuildBank):SetPoint("TOPLEFT",GuildBankFrame,31,-40)
			end
			if not GuildBankFrame.StackpackMatches then
				GuildBankFrame.StackpackMatches = GuildBankFrame:CreateFontString(nil, "OVERLAY")
				GuildBankFrame.StackpackMatches:SetPoint("TOPLEFT",GuildBankFrame.StackpackSearchText,135,0)
				GuildBankFrame.StackpackMatches:SetJustifyH("LEFT")
				GuildBankFrame.StackpackMatches:SetFontObject(GameFontNormal)
				GuildBankFrame.StackpackMatches:SetTextHeight(12)
				GuildBankFrame.StackpackMatches:SetTextColor(0,1,0)
				GuildBankFrame.StackpackMatches:SetText("")
				C_Timer.NewTicker(15, function() FilterGuildBank("%GBFORCELOAD,ilvl<0%",false); RefreshFilter() end, 1)
			end
			GuildBankFrame.StackpackSearchText:SetText(SEARCHTXT)
		end
		local tabs = GetNumGuildBankTabs()
		if tabs then
			for tab=1,tabs do
				local isViewable = select(3,GetGuildBankTabInfo(tab))
				if isViewable then QueryGuildBankTab(tab) end
			end
			if (tabs > 1) and not GuildBankStackButton then
				local HostFrame = GuildBankFrame or _G["BagnonFrameguildbank"]
				if HostFrame then
					GuildBankStackButton = CreateFrame("Button", "StackButton", HostFrame, "UIPanelButtonTemplate")
					GuildBankStackButton:SetWidth(130)
					GuildBankStackButton:SetText("Stack Entire Bank")
					if Bagnon then
						GuildBankStackButton:SetPoint("BOTTOMLEFT", _G["BagnonGuildTab8"], 33, 5)
					else
						GuildBankStackButton:SetPoint("BOTTOMLEFT", GuildBankFrame, 23, 37)
					end
					GuildBankStackButton:SetScript("OnClick", showStackWarning)
					for tab=1, tabs do
						local button = _G["GuildBankTab"..tab].Button
						if Bagnon then
							button = _G["BagnonGuildTab"..tab]
						end
						if button then
							button:HookScript("OnClick",function() GuildBankStackButton:Show(); RefreshFilter(NOW) end)
						end
					end
				end
			end
		end
		RefreshFilter(NOW)
	elseif (event == "GUILDBANKFRAME_CLOSED") then
		GuildBankOpen = false
		TriggerStacking(event)
		RefreshFilter(NOW)
	elseif (event == "GUILDBANKBAGSLOTS_CHANGED") then
		TriggerStacking(event)
		RefreshFilter(0.25)
	elseif (event == "LOOT_OPENED") then
		isLooting = true
	elseif (event == "LOOT_CLOSED") then
		isLooting = false
		TriggerStacking(event)
	end
end



-------------
-- Startup --
-------------

function Stackpack.OnLoad(self)
	Debug(Addon," Version ",Version,": Startup")
	Debug("Triggering on ", TRIGGER_EVENT)
	self:RegisterEvent(TRIGGER_EVENT)
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYERBANKSLOTS_CHANGED")
	self:RegisterEvent("TRADE_CLOSED")
	self:RegisterEvent("MAIL_CLOSED")
	self:RegisterEvent("AUCTION_HOUSE_CLOSED")
	self:RegisterEvent("BANKFRAME_OPENED")
	self:RegisterEvent("BANKFRAME_CLOSED")
	self:RegisterEvent("GUILDBANKFRAME_OPENED")
	self:RegisterEvent("GUILDBANKFRAME_CLOSED")
	self:RegisterEvent("GUILDBANKBAGSLOTS_CHANGED")
	self:RegisterEvent("LOOT_OPENED")
	self:RegisterEvent("LOOT_CLOSED")
	self:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_HIDE")
	self:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
	if IsReagentBankUnlocked then self:RegisterEvent("PLAYERREAGENTBANKSLOTS_CHANGED") end
	SLASH_STACK1 = "/stackpack"
	SLASH_STACK2 = "/stp"
	SLASH_STACKGUILD1 = "/stackguild"
	SLASH_STACKGUILD2 = "/stackgb"
	SlashCmdList["STACK"] = Stackpack_Command
	SlashCmdList["STACKGUILD"] = StackGuild_Command
	HookSplit()
	Push(Addon .. " " .. Bold .. Version .. Normal .. " loaded. Type " .. White .. "/stackpack help" .. Normal .. " for options.",1,1,0)
end
