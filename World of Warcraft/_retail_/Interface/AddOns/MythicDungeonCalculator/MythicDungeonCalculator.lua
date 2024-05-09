local mdc = LibStub("AceAddon-3.0"):NewAddon("MythicDungeonCalculator", "AceConsole-3.0")
local libIcon = LibStub("LibDBIcon-1.0", true)
local LibDD = LibStub:GetLibrary("LibUIDropDownMenu-4.0")
local LibBase64 = LibStub("LibBase64-1.0")
local AceSerializer = LibStub("AceSerializer-3.0")
local _, MDC = ...
local L = MDC.L
local locale = GetLocale()
local miniButton = LibStub("LibDataBroker-1.1"):NewDataObject("MythicDungeonCalculator", {
	type = "data source",
	text = "Mythic Dungeon Calculator",
	icon = "Interface\\AddOns\\MythicDungeonCalculator\\Textures\\mdc_icon",

	OnClick = function(_, buttonPressed)
		if buttonPressed == "RightButton" then
			mdc:ToggleMinimapButton()
		elseif buttonPressed == "MiddleButton" then
			mdc:ToggleAddonSize()
		else
			mdc:Togglemain()
		end
	end,

	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then return end

		tooltip:AddLine(WrapTextInColorCode(L["MDC"], "A9FFFFFF"))
		tooltip:AddLine(L["Left-Click: open/close"])
		tooltip:AddLine(L["Middle-Click: toggle size"])
		tooltip:AddLine(L["Right-Click: hide button"])
	end,
})

local addonSize = 1.2
local addonSizeBig = 1.2
local addonSizeSmall = 1.5
local normalFont
local highlightFont
local mainX = 1200
local mainY = 880
local GameTooltip = GameTooltip
local tyrannical = C_ChallengeMode.GetAffixInfo(9)
local fortified = C_ChallengeMode.GetAffixInfo(10)
local F = {}
local dungeons = {}
local calculatedAffixScores = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}}
local calculatedOverallScore = 0
local overallScore = 0
local contents = {L["Keystone"], L["Mythic Plus Rewards"], L["Great Vault Rewards"], L["Seasonal Achievements"]}

local eodItemLevel = {0, 496, 499, 499, 502, 502, 506, 506, 509, 509}
local weeklyItemLevel = {0, 509, 509, 512, 512, 515, 515, 519, 519, 522}

local savedVariables = {
	profile = {
		addonSize = 1.2,
		addonPosition = {
			anchorFrom = "CENTER",
			anchorTo = "CENTER",
			xOffset = 0,
			yOffset = 0,
		},
		autoSync = false,
		calculation = {
			affixLevel = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},
			affixTime = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},
		},
		class = "",
		currentKeystone = {"", 0},
		currentRating = 0,
		esc = false,
		frameStrata = "HIGH",
		iLvl = 0,
		lfdGroupButtons = true,
		login = nil,
		optionalBottomFrame = {
			enable = true,
			show = false,
			content = 1,
		},
		settingsPosition = {
			anchorFrom = "CENTER",
			anchorTo = "CENTER",
			xOffset = 0,
			yOffset = 0,
		},
		showMinimapIcon = true,
		showDungeonTexture = true,
		minimap = {},
		weeklyRewards = {0, 0, 0, 0},
	},
	realm = {
		weekly = {},
		loot = {},
	}
}

-- WoWGlobalFrame
_G["GlobalMDCFrame"] = CreateFrame("Frame", nil, UIParent, nil)
_G["GlobalMDCFrame"]:Hide()
-- mdcGlobalFrames
local mainFrame = "mdc.main"
local settingsFrame = mainFrame .. ".settingsFrame"
local topFrame = mainFrame .. ".topFrame"
local dungeonsFrame = mainFrame .. ".dungeonsFrame"
local charsFrame = mainFrame .. ".charsFrame"
local bottomFrame = mainFrame .. ".bottomFrame"
local optionalBottomFrame = mainFrame .. ".optionalBottomFrame"
local debugFrame = "mdc.debugFrame"

function mdc:OnInitialize()
	C_MythicPlus.RequestMapInfo()
	C_MythicPlus.RequestCurrentAffixes()

	local eventsFrame = CreateFrame("Frame")
	eventsFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	eventsFrame:SetScript("OnEvent", function(isLogin, isReload)
		if isLogin or isReload then
			if not mdc.db.profile.showMinimapIcon then
				libIcon:Hide("MythicDungeonCalculator")
			end
		end
	end)

	SLASH_MDC1 = "/mdc"
	SlashCmdList["MDC"] = CommandHandler

	mdc.db = LibStub("AceDB-3.0"):New("MDCDB", savedVariables)
	libIcon:Register("MythicDungeonCalculator", miniButton, mdc.db.profile.minimap)
end

local function mdcRound(num)
	return num >= 0 and math.floor(num + 0.5) or math.ceil(num - 0.5)
end

function mdc:OnEnable()
	mdc:LoadSavedVariables()
	normalFont = "GameFontNormal" -- A9FFD000
	highlightFont = "GameFontHighlight" -- FFFFFFFF
	C_MythicPlus.RequestMapInfo()
	mdc:CreateMain()
end

function mdc:ToggleESC()
	local isInSpecialFrames = false
	for _, v in pairs(UISpecialFrames) do
		if v == "GlobalMDCFrame" then
			isInSpecialFrames = true
		end
	end

	if mdc.db.profile.esc and not isInSpecialFrames then
		table.insert(UISpecialFrames, "GlobalMDCFrame")
	elseif not mdc.db.profile.esc and isInSpecialFrames then
		for i, v in pairs(UISpecialFrames) do
			if v == "GlobalMDCFrame" then
				table.remove(UISpecialFrames, i)
			end
		end
	end
end

function CommandHandler(msg)
	if msg == "" then
		mdc:Togglemain()
	elseif msg == "icon" then
		mdc:ToggleMinimapButton()
	elseif msg == "size" then
		mdc:ToggleAddonSize()
	elseif msg == "debug" then
		C_CVar.SetCVar("scriptErrors", 1)
		C_MythicPlus.RequestMapInfo()
		mdc:GetDungeons()
		mdc:Debug()
		mdc:Togglemain()
		mdc:Togglemain()
	end
end

function mdc:ToggleMinimapButton()
	mdc.db.profile.showMinimapIcon = not mdc.db.profile.showMinimapIcon

	if mdc.db.profile.showMinimapIcon then
		libIcon:Show("MythicDungeonCalculator")
	else
		libIcon:Hide("MythicDungeonCalculator")
	end
end

function mdc:Togglemain()
	if _G["GlobalMDCFrame"]:IsVisible() then
		_G["GlobalMDCFrame"]:Hide()
	else
		mdc:Show()
	end
end

function mdc:ToggleAddonSize()
	if addonSize == addonSizeBig then
		addonSize = addonSizeSmall
		mdc.db.profile.addonSize = addonSizeSmall
	else
		addonSize = addonSizeBig
		mdc.db.profile.addonSize = addonSizeBig
	end

	mdc:Show()
end

function mdc:ToggleSettings()
	if F[settingsFrame]:IsVisible() then
		F[settingsFrame]:Hide()
	else
		F[settingsFrame]:Show()
	end
end

function mdc:Reload()
	mdc:Togglemain()
	mdc:Togglemain()
	mdc:ToggleSettings()
end

function mdc:Show()
	_G["GlobalMDCFrame"]:Hide()
	if F[mainFrame] then
		F[mainFrame]:Hide()
		F[mainFrame]:SetParent(nil)
	end
	mdc:OnEnable()
	mdc:ToggleESC()
	mdc:GetDungeons()
	mdc:CreateDungeonFrames()

	if mdc.db.profile.optionalBottomFrame.enable then
		mdc:OptionalBottomFrame()
	end

	if mdc.db.profile.autoSync then
		mdc:Sync(false)
	end

	mdc:CreateSettingsFrame()
	_G["GlobalMDCFrame"]:Show()
end

function MDC_OnAddonCompartmentClick()
	mdc:Togglemain()
end

local function mdcFontString(fontString, parent, font, frameAnchor, anchorParent, parentAnchor, posX, posY, text, scale)
	F[parent .. "." .. fontString] = F[parent]:CreateFontString(nil, "OVERLAY", font)
	F[parent .. "." .. fontString]:SetPoint(frameAnchor, F[anchorParent], parentAnchor, posX / addonSize, posY / addonSize)
	F[parent .. "." .. fontString]:SetText(text)

	if scale then
		F[parent .. "." .. fontString]:SetTextScale(scale / addonSize)
	end
end

local function mdcButton(button, parent, template, sizeX, sizeY, buttonAnchor, anchorParent, parentAnchor, posX, posY, normalTexture)
	F[parent .. "." .. button] = CreateFrame("Button", nil, F[parent], template)
	F[parent .. "." .. button]:SetSize(sizeX / addonSize, sizeY / addonSize)
	F[parent .. "." .. button]:SetPoint(buttonAnchor, F[anchorParent], parentAnchor, posX / addonSize, posY / addonSize)

	if normalTexture then
		F[parent .. "." .. button]:SetNormalTexture("Interface\\AddOns\\MythicDungeonCalculator\\Textures\\" .. normalTexture)
		F[parent .. "." .. button]:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 0.7)
	end
end

local function mdcCheckButton(button, parent, template, sizeX, sizeY, buttonAnchor, anchorParent, parentAnchor, posX, posY, normalTexture, normalColor, checkedTexture, label, ifStatement, scriptFunction)
	F[parent .. "." .. button] = CreateFrame("CheckButton", nil, F[parent], template)
	F[parent .. "." .. button]:SetSize(sizeX / addonSize, sizeY / addonSize)
	F[parent .. "." .. button]:SetPoint(buttonAnchor, F[anchorParent], parentAnchor, posX / addonSize, posY / addonSize)
	F[parent .. "." .. button]:SetScript("OnClick", scriptFunction)

	mdcFontString("text", parent .. "." .. button, highlightFont, "LEFT", parent .. "." .. button, "RIGHT", 10, 0, label)
	F[parent .. "." .. button .. ".text"]:EnableMouse(true)
	F[parent .. "." .. button .. ".text"]:SetScript("OnMouseDown", function()
		F[parent .. "." .. button]:Click()
	end)

	if normalTexture then
		F[parent .. "." .. button]:SetNormalTexture("Interface\\AddOns\\MythicDungeonCalculator\\Textures\\" .. normalTexture)

		if normalColor then
			F[parent .. "." .. button]:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 0.7)
		end
	end

	if checkedTexture then
		F[parent .. "." .. button]:SetCheckedTexture("Interface\\AddOns\\MythicDungeonCalculator\\Textures\\" .. checkedTexture)
	end

	if ifStatement then
		F[parent .. "." .. button]:SetChecked(true)
	else
		F[parent .. "." .. button]:SetChecked(false)
	end
end

local function mdcFrame(frame, parent, sizeX, sizeY, frameAnchor, anchorParent, parentAnchor, posX, posY, template, backdrop, r, g, b, a)
	F[parent .. "." .. frame] = CreateFrame("Frame", nil, F[parent], template)
	F[parent .. "." .. frame]:SetSize(sizeX / addonSize, sizeY / addonSize)
	F[parent .. "." .. frame]:SetPoint(frameAnchor, F[anchorParent], parentAnchor, posX / addonSize, posY / addonSize)

	if backdrop then
		F[parent .. "." .. frame]:SetBackdrop({bgFile = "Interface\\AddOns\\MythicDungeonCalculator\\Textures\\" .. backdrop})
		F[parent .. "." .. frame]:SetBackdropColor(r, g, b, a)
	end
end

local function mdcLine(line, parent, r, g, b, a, startAnchor, startX, startY, endAnchor, endX, endY, thick)
	F[parent .. "." .. line] = F[parent]:CreateLine()
	F[parent .. "." .. line]:SetColorTexture(r, g, b, a)
	F[parent .. "." .. line]:SetStartPoint(startAnchor, startX / addonSize, startY / addonSize)
	F[parent .. "." .. line]:SetEndPoint(endAnchor, endX / addonSize, endY / addonSize)
	F[parent .. "." .. line]:SetThickness(thick)
end

function mdc:CreateMain()
	F[mainFrame] = CreateFrame("Frame", nil, _G["GlobalMDCFrame"], BackdropTemplateMixin and "BackdropTemplate")
	F[mainFrame]:SetSize(mainX / addonSize, mainY / addonSize)
	F[mainFrame]:SetPoint(mdc.db.profile.addonPosition.anchorFrom, UIParent, mdc.db.profile.addonPosition.anchorTo, mdc.db.profile.addonPosition.xOffset, mdc.db.profile.addonPosition.yOffset)
	F[mainFrame]:SetBackdrop({bgFile = "Interface\\AddOns\\MythicDungeonCalculator\\Textures\\dungeon_banner"})
	F[mainFrame]:SetBackdropColor(0.7, 0.7, 0.7, 0.9)
	F[mainFrame]:SetFrameStrata(mdc.db.profile.frameStrata)
	F[mainFrame]:SetMovable(true)
	F[mainFrame]:EnableMouse(true)
	F[mainFrame]:RegisterForDrag("LeftButton")
	F[mainFrame]:SetScript("OnDragStart", F[mainFrame].StartMoving)
	F[mainFrame]:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing(true)

		local from, _, to, x, y = self:GetPoint()
		mdc.db.profile.addonPosition.anchorFrom = from
		mdc.db.profile.addonPosition.anchorTo = to
		mdc.db.profile.addonPosition.xOffset = x
		mdc.db.profile.addonPosition.yOffset = y
	end)

	mdcFrame("topFrame", mainFrame, mainX, 35, "TOP", mainFrame, "TOP", 0, 0, nil)
	mdcLine("topLine", topFrame, 0.7, 0.7, 0.7, 0.7, "BOTTOMLEFT", 0, 5, "BOTTOMRIGHT", 0, 5, 2)
	mdcFontString("title", topFrame, highlightFont, "CENTER", topFrame, "CENTER", 0, 0, L["MDC"])
	mdcFontString("currentPlayerRating", topFrame, highlightFont, "CENTER", topFrame, "CENTER", -350, 0, L["Current Rating"] .. ": " .. (C_ChallengeMode.GetDungeonScoreRarityColor(overallScore):WrapTextInColorCode(overallScore) or overallScore))
	mdcFontString("calculatedPlayerRating", topFrame, highlightFont, "CENTER", topFrame, "CENTER", 350, 0, nil)

	local resetButton = mainFrame .. ".resetButton"
	mdcButton("resetButton", mainFrame, nil, 22, 24, "TOPRIGHT", topFrame, "TOPRIGHT", -84, -2, "reset")
	F[resetButton]:SetNormalFontObject(highlightFont)
	F[resetButton]:SetScript("OnClick", function()
		mdc:Sync(true)
	end)
	F[resetButton]:SetScript("OnEnter", function(self)
		self:GetNormalTexture():SetVertexColor(1, 1, 1, 1, 0.7)
		GameTooltip:SetOwner(F[resetButton], "ANCHOR_CURSOR", 0, 0)
		GameTooltip:AddLine(L["RESET"], 1, 1, 1)
		GameTooltip:Show()
	end)
	F[resetButton]:SetScript("OnLeave", function(self)
		self:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 0.7)
		GameTooltip:Hide()
	end)

	local syncButton = mainFrame .. ".syncButton"
	mdcButton("syncButton", mainFrame, nil, 22, 24, "TOPRIGHT", topFrame, "TOPRIGHT", -57, -2, "sync")
	F[syncButton]:SetNormalFontObject(highlightFont)
	F[syncButton]:SetScript("OnClick", function()
		mdc:Sync(false)
	end)
	F[syncButton]:SetScript("OnEnter", function(self)
		self:GetNormalTexture():SetVertexColor(1, 1, 1, 1, 0.7)
		GameTooltip:SetOwner(F[syncButton], "ANCHOR_CURSOR", 0, 0)
		GameTooltip:AddLine(L["SYNC"], 1, 1, 1)
		GameTooltip:Show()
	end)
	F[syncButton]:SetScript("OnLeave", function(self)
		self:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 0.7)
		GameTooltip:Hide()
	end)

	local closeButton = mainFrame .. ".closeButton"
	mdcButton("closeButton", mainFrame, nil, 22, 24, "TOPRIGHT", topFrame, "TOPRIGHT", -3, -2, "mdc_close")
	F[closeButton]:SetScript("OnClick", function()
		mdc:Togglemain()
	end)
	F[closeButton]:SetScript("OnEnter", function(self)
		self:GetNormalTexture():SetVertexColor(1, 1, 1, 1, 0.7)
	end)
	F[closeButton]:SetScript("OnLeave", function(self)
		self:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 0.7)
	end)

	local settingsButton = mainFrame .. ".settingsButton"
	mdcButton("settingsButton", mainFrame, nil, 22, 24, "TOPRIGHT", topFrame, "TOPRIGHT", -30, -2, "mdc_settings")
	F[settingsButton]:SetScript("OnClick", function()
		if F[settingsFrame]:IsVisible() then
			F[settingsFrame]:Hide()
		else
			mdc:Reload()
			F[settingsFrame]:Show()
		end
	end)
	F[settingsButton]:SetScript("OnEnter", function(self)
		self:GetNormalTexture():SetVertexColor(1, 1, 1, 1, 0.7)
	end)
	F[settingsButton]:SetScript("OnLeave", function(self)
		self:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 0.7)
	end)

	mdcFrame("dungeonsFrame", mainFrame, mainX, 800, "TOP", mainFrame, "TOP", 0, -35, nil)
	mdcFrame("charsFrame", mainFrame, mainX, 800, "TOP", mainFrame, "TOP", 0, -35, nil)
	F[charsFrame]:Hide()
	mdcFrame("bottomFrame", mainFrame, mainX, 35, "TOP", mainFrame, "TOP", 0, -820, nil)
end

function mdc:CreateSettingsFrame()
	F[settingsFrame] = CreateFrame("Frame", nil, F[mainFrame], BackdropTemplateMixin and "BackdropTemplate")
	F[settingsFrame]:SetSize(400 / addonSize, 360 / addonSize)
	F[settingsFrame]:SetPoint(mdc.db.profile.settingsPosition.anchorFrom, UIParent, mdc.db.profile.settingsPosition.anchorTo, mdc.db.profile.settingsPosition.xOffset, mdc.db.profile.settingsPosition.yOffset)
	F[settingsFrame]:SetFrameStrata(mdc.db.profile.frameStrata)
	F[settingsFrame]:SetFrameLevel(7)
	F[settingsFrame]:SetBackdrop({bgFile = "Interface\\AddOns\\MythicDungeonCalculator\\Textures\\dungeon_banner"})
	F[settingsFrame]:SetBackdropColor(0.7, 0.7, 0.7, 0.9)
	F[settingsFrame]:SetMovable(true)
	F[settingsFrame]:EnableMouse(true)
	F[settingsFrame]:RegisterForDrag("LeftButton")
	F[settingsFrame]:SetScript("OnDragStart", F[settingsFrame].StartMoving)
	F[settingsFrame]:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing(true)

		local from, _, to, x, y = self:GetPoint()
		mdc.db.profile.settingsPosition.anchorFrom = from
		mdc.db.profile.settingsPosition.anchorTo = to
		mdc.db.profile.settingsPosition.xOffset = x
		mdc.db.profile.settingsPosition.yOffset = y
	end)
	F[settingsFrame]:Hide()

	mdcFontString("title", settingsFrame, highlightFont, "TOP", settingsFrame, "TOP", 0, -6, L["Settings"])
	mdcLine("topLine", settingsFrame, 0.7, 0.7, 0.7, 0.7, "TOPLEFT", 0, -30, "TOPRIGHT", 0, -30, 2)

	local closeButton = settingsFrame .. ".closeButton"
	mdcButton("closeButton", settingsFrame, nil, 22, 24, "TOPRIGHT", settingsFrame, "TOPRIGHT", -3, -3, "mdc_close")
	F[closeButton]:SetScript("OnClick", function()
		mdc:ToggleSettings()
	end)
	F[closeButton]:SetScript("OnEnter", function(self)
		self:GetNormalTexture():SetVertexColor(1, 1, 1, 1, 0.7)
	end)
	F[closeButton]:SetScript("OnLeave", function(self)
		self:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 0.7)
	end)

	-- TODO: reuse instead of recreate (or just the data that is needed)
	mdcCheckButton("toggleESC", settingsFrame, nil, 22, 24, "TOPLEFT", settingsFrame, "TOPLEFT", 20, -40, "box_unchecked", false, "box_checked", L["Use ESC to close"], mdc.db.profile.esc, function() mdc.db.profile.esc = not mdc.db.profile.esc; mdc:ToggleESC(); end)
	mdcCheckButton("toggleAddonSize", settingsFrame, nil, 22, 24, "TOPLEFT", settingsFrame, "TOPLEFT", 20, -80, "box_unchecked", false, "box_checked", L["Smaller Window Size"], addonSize == addonSizeSmall, function() mdc:ToggleAddonSize(); mdc:Reload(); end)
	mdcCheckButton("toggleMinimapIcon", settingsFrame, nil, 22, 24, "TOPLEFT", settingsFrame, "TOPLEFT", 20, -120, "box_unchecked", false, "box_checked", L["Show Minimap Icon"], mdc.db.profile.showMinimapIcon, function() mdc:ToggleMinimapButton(); end)
	mdcCheckButton("toggleDungeonFrames", settingsFrame, nil, 22, 24, "TOPLEFT", settingsFrame, "TOPLEFT", 20, -160, "box_unchecked", false, "box_checked", L["Show Dungeon Texture"], mdc.db.profile.showDungeonTexture, function() mdc.db.profile.showDungeonTexture = not mdc.db.profile.showDungeonTexture; mdc:Reload(); end)
	mdcCheckButton("toggleOptionalBottomFrame", settingsFrame, nil, 22, 24, "TOPLEFT", settingsFrame, "TOPLEFT", 20, -200, "box_unchecked", false, "box_checked", L["Show Info Frame"], mdc.db.profile.optionalBottomFrame.enable, function() mdc.db.profile.optionalBottomFrame.enable = not mdc.db.profile.optionalBottomFrame.enable; mainY = 880; mdc:Reload(); end)
	mdcCheckButton("toggleGroupFunctions", settingsFrame, nil, 22, 24, "TOPLEFT", settingsFrame, "TOPLEFT", 20, -240, "box_unchecked", false, "box_checked", L["Enable Group Functions"], mdc.db.profile.lfdGroupButtons, function() mdc.db.profile.lfdGroupButtons = not mdc.db.profile.lfdGroupButtons; mdc:Reload(); end)
	mdcCheckButton("toggleSync", settingsFrame, nil, 22, 24, "TOPLEFT", settingsFrame, "TOPLEFT", 20, -280, "box_unchecked", false, "box_checked", L["Autosync"], mdc.db.profile.autoSync, function() mdc.db.profile.autoSync = not mdc.db.profile.autoSync; mdc:Reload(); end)

	local groupInfoFrame = settingsFrame .. ".toggleGroupFunctions.info"
	mdcFrame("info", settingsFrame .. ".toggleGroupFunctions", 22, 24, "LEFT", settingsFrame .. ".toggleGroupFunctions.text", "RIGHT", 5, 0, nil)
	mdcFontString("text", groupInfoFrame, highlightFont, "CENTER", groupInfoFrame, "CENTER", 0, 0, "(?)")
	F[groupInfoFrame]:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
	F[groupInfoFrame]:SetScript("OnEnter", function()
		GameTooltip:SetOwner(F[groupInfoFrame], "ANCHOR_CURSOR", 0, 0)
		GameTooltip:AddLine(L["Group Functions Tooltip1"], 1, 1, 1)
		GameTooltip:AddLine(L["Group Functions Tooltip2"], 1, 1, 1)
		GameTooltip:Show()
	end)

	F[settingsFrame].strataDropDown = LibDD:Create_UIDropDownMenu(nil, F[settingsFrame])
	F[settingsFrame].strataDropDown:SetPoint("TOPLEFT", F[settingsFrame], "BOTTOMLEFT", -10 / addonSize, 45 / addonSize)
	F[settingsFrame].strataDropDownText = F[settingsFrame].strataDropDown:CreateFontString(nil, "OVERLAY", highlightFont)
	F[settingsFrame].strataDropDownText:SetPoint("LEFT", F[settingsFrame].strataDropDown, "RIGHT", -10 / addonSize, 2 / addonSize)
	F[settingsFrame].strataDropDownText:SetText(L["Frame Strata"])

	LibDD:UIDropDownMenu_SetWidth(F[settingsFrame].strataDropDown, 130)
	LibDD:UIDropDownMenu_SetText(F[settingsFrame].strataDropDown, mdc.db.profile.frameStrata)

	local frameStrata = {
		[1] = "BACKGROUND",
		[2] = "LOW",
		[3] = "MEDIUM",
		[4] = "HIGH",
		[5] = "DIALOG",
		[6] = "FULLSCREEN",
		[7] = "FULLSCREEN_DIALOG",
		[8] = "TOOLTIP"
	}

	LibDD:UIDropDownMenu_Initialize(F[settingsFrame].strataDropDown, function()
		local info = LibDD:UIDropDownMenu_CreateInfo()
		info.func = function(info)
			mdc.db.profile.frameStrata = info.arg1
			LibDD:UIDropDownMenu_SetText(F[settingsFrame].strataDropDown, mdc.db.profile.frameStrata)
			mdc:Reload()
		end

		for i = 1, 8 do
			info.text = frameStrata[i]
			info.arg1 = frameStrata[i]
			info.checked = frameStrata[i] == mdc.db.profile.frameStrata

			LibDD:UIDropDownMenu_AddButton(info)
		end
	end)
end

function mdc:Sync(reset)
	for dungeon = 1, 8 do
		local backdrop = dungeonsFrame .. ".dungeon" .. dungeon .. ".backdrop"

		for affix = 1, 2 do
			local level = backdrop .. ".level" .. affix
			local minutes = "minutes" .. dungeon .. affix
			local seconds = "seconds" .. dungeon .. affix
			local inputOffsetX = affix == 1 and 120 or 225

			if dungeons[dungeon][5][affix][1] and not reset then
				F[level]:SetNumber(dungeons[dungeon][5][affix][3])
				F[minutes]:SetNumber((dungeons[dungeon][5][affix][4] - dungeons[dungeon][5][affix][4] % 60) / 60)
				F[seconds]:SetNumber(dungeons[dungeon][5][affix][4] % 60)
			else
				F[level]:SetNumber(0)
				F[minutes]:SetNumber((dungeons[dungeon][3] - dungeons[dungeon][3] % 60) / 60)
				F[seconds]:SetNumber(dungeons[dungeon][3] % 60)
			end

			F[minutes]:SetText(F[minutes]:GetNumber() < 10 and "0" .. F[minutes]:GetNumber() or F[minutes]:GetNumber())
			F[seconds]:SetText(F[seconds]:GetNumber() < 10 and "0" .. F[seconds]:GetNumber() or F[seconds]:GetNumber())

			if F[level]:GetNumber() < 10 then
				F[level]:SetPoint("CENTER", F[backdrop], inputOffsetX / addonSize, 0)
			else
				F[level]:SetPoint("CENTER", F[backdrop], (inputOffsetX - 10) / addonSize, 0)
			end

			mdc.db.profile.calculation.affixLevel[dungeon][affix] = F[level]:GetNumber()
			mdc.db.profile.calculation.affixTime[dungeon][affix] = F[minutes]:GetNumber() * 60 + F[seconds]:GetNumber()
		end
	end


end

function mdc:GetDungeons()
	local mapChallengeModeIDs = C_ChallengeMode.GetMapTable()
	local name, dungeonId, timeLimit, backgroundTexture

	dungeons = {}
	table.sort(mapChallengeModeIDs)

	for dungeon, dungeonData in pairs(mapChallengeModeIDs) do
		name, dungeonId, timeLimit, _, backgroundTexture = C_ChallengeMode.GetMapUIInfo(dungeonData)
		table.insert(dungeons, {dungeonId, name, timeLimit, backgroundTexture, {{}, {}}})

		local bestAffixScore = C_MythicPlus.GetSeasonBestAffixScoreInfoForMap(dungeonData)
		if bestAffixScore then
			for _, affixData in pairs(bestAffixScore) do
				if affixData["name"] == fortified then
					dungeons[dungeon][5][1] = {affixData["name"], affixData["score"], affixData["level"], affixData["durationSec"], affixData["overTime"]}
				elseif affixData["name"] == tyrannical then
					dungeons[dungeon][5][2] = {affixData["name"], affixData["score"], affixData["level"], affixData["durationSec"], affixData["overTime"]}
				end
			end
		end
	end
end

local function mdcCalculateAffixScore(mythicLevel, dungeonTime, affixTime)
	if mythicLevel >= 2 then
		-- baseScore lvl 2 + fort/tyr => 70+10 + level => each 7 + each affix => 10
		local baseScore = 80 + mythicLevel * 7 + math.floor((mythicLevel <= 10 and mythicLevel or 10 )/ 5) * 10
		local affixScore = 0
		if baseScore ~= 0 then
			local percentageOffset = 1 - (affixTime / dungeonTime)

			if percentageOffset >= 0.4 then
				affixScore = 5
			elseif percentageOffset >= 0 then
				affixScore = percentageOffset * 5 / 0.4
			elseif percentageOffset >= -0.4 then
				affixScore = percentageOffset * 5 / 0.4 - 5
			else
				return 0
			end
		end

		return baseScore + affixScore
	else
		return 0
	end
end

local function mdcUpdateScores(level, dungeon, minutes, seconds, backdrop, affix)
	local calculatedScore = 0

	if F[level]:GetNumber() >= 2 then
		calculatedScore = mdcCalculateAffixScore(F[level]:GetNumber(), dungeons[dungeon][3], F[minutes]:GetNumber() * 60 + F[seconds]:GetNumber())
	end

	F[backdrop .. ".calculatedScoreText" .. affix]:SetText(C_ChallengeMode.GetSpecificDungeonScoreRarityColor(mdcRound(calculatedScore)):WrapTextInColorCode(mdcRound(calculatedScore)))

	calculatedAffixScores[dungeon][affix] = calculatedScore

	local calculatetDungeonScore = math.max(calculatedAffixScores[dungeon][1], calculatedAffixScores[dungeon][2]) * 1.5 + math.min(calculatedAffixScores[dungeon][1], calculatedAffixScores[dungeon][2]) * 0.5
	F[backdrop .. ".calculatedDungeonScoreText"]:SetText("(" .. C_ChallengeMode.GetSpecificDungeonOverallScoreRarityColor(mdcRound(calculatetDungeonScore)):WrapTextInColorCode(mdcRound(calculatetDungeonScore)) .. ")")

	local calculatedPlayerRating = 0
	for _, affixScores in pairs(calculatedAffixScores) do
		calculatedPlayerRating = calculatedPlayerRating + math.max(affixScores[1], affixScores[2]) * 1.5 + math.min(affixScores[1], affixScores[2]) * 0.5
	end

	-- blizzard rounds weird :/
	if calculatedPlayerRating - overallScore >= -1 and calculatedPlayerRating - overallScore <= 1 then
		calculatedPlayerRating = overallScore
	end

	F[topFrame .. ".calculatedPlayerRating"]:SetText(L["Calculated Rating"] .. ": " .. C_ChallengeMode.GetDungeonScoreRarityColor(mdcRound(calculatedPlayerRating)):WrapTextInColorCode(mdcRound(calculatedPlayerRating)))
end

local function mdcSetTimeLimit(dungeon, affix, up)
	local timer = {}
	for i = 0, 3 do
		if i == 0 then
			i = -1
		end

		local mm = ((dungeons[dungeon][3] * (1.2 - 0.2 * i)) - (dungeons[dungeon][3] * (1.2 - 0.2 * i)) % 60) / 60
		local ss = (dungeons[dungeon][3] * (1.2 - 0.2 * i)) % 60

		-- weird rounding behaviour
		if ss > 59.99 and ss <= 60 then
			mm = mm + 1
			ss = 0
		end

		table.insert(timer, {mm, ss})
	end

	local minutes, seconds = "minutes" .. dungeon .. affix, "seconds" .. dungeon .. affix
	local currentMinutes = F[minutes]:GetNumber()
	if up then
		for i = 1, 4 do
			if currentMinutes < timer[i][1] then
				F[minutes]:SetText(timer[i][1])
				F[seconds]:SetText(timer[i][2] < 10 and "0" .. timer[i][2] or timer[i][2])
			end
		end
	else
		for i = 4, 1, -1 do
			if currentMinutes > timer[i][1] then
				F[minutes]:SetText(timer[i][1])
				F[seconds]:SetText(timer[i][2] < 10 and "0" .. timer[i][2] or timer[i][2])
			end
		end
	end

	currentMinutes = F[minutes]:GetNumber()
end

function mdc:CreateDungeonFrames()
	local offsetX = 0
	local offsetY = 200
	calculatedOverallScore = 0

	for dungeon = 1, 8 do
		if (dungeon % 2 == 0) then
			offsetX = 600
		else
			offsetX = 0
			offsetY = offsetY - 200
		end

		local dungeonFrame = dungeonsFrame .. ".dungeon" .. dungeon
		mdcFrame("dungeon" .. dungeon, dungeonsFrame, 600, 200, "TOPLEFT", dungeonsFrame, "TOPLEFT", offsetX, offsetY, nil)
		if mdc.db.profile.showDungeonTexture then
			F[dungeonFrame].showDungeonTexture = F[dungeonFrame]:CreateTexture("Texture", "BACKGROUND")
			F[dungeonFrame].showDungeonTexture:SetTexture(dungeons[dungeon][4])
			F[dungeonFrame].showDungeonTexture:SetSize(800 / addonSize, 320 / addonSize)
			F[dungeonFrame].showDungeonTexture:SetPoint("TOPLEFT", F[dungeonFrame], "TOPLEFT", -7 / addonSize, 5 / addonSize)
		end

		local backdrop = dungeonFrame .. ".backdrop"
		mdcFrame("backdrop", dungeonFrame, 534, 165, "CENTER", dungeonFrame, "CENTER", -2, 0, BackdropTemplateMixin and "BackdropTemplate", "dungeon_banner", 0.4, 0.4, 0.4, 0.6)
		mdcFontString("dungeonTime", backdrop, highlightFont, "TOPRIGHT", dungeonFrame, "TOPRIGHT", -50, -30, WrapTextInColorCode(L["Timelimit"] .. ": " .. SecondsToClock(dungeons[dungeon][3]), "DD999999"))
		local dungeonTimeInfo = dungeonFrame .. ".dungeonTimeInfo"
		mdcFrame("dungeonTimeInfo", dungeonFrame, 150, 24, "LEFT", backdrop .. ".dungeonTime", "LEFT", 0, 0)
		F[dungeonTimeInfo]:SetScript("OnLeave", function()
			GameTooltip:Hide()
		end)
		F[dungeonTimeInfo]:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, 0)
			GameTooltip:AddLine(L["Timelimit"])
			GameTooltip:AddLine("-1: " .. SecondsToClock(dungeons[dungeon][3] * 1.4), 1, 1, 1)
			GameTooltip:AddLine("+1: " .. SecondsToClock(dungeons[dungeon][3]), 1, 1, 1)
			GameTooltip:AddLine("+2: " .. SecondsToClock(dungeons[dungeon][3] * 0.8), 1, 1, 1)
			GameTooltip:AddLine("+3: " .. SecondsToClock(dungeons[dungeon][3] * 0.6), 1, 1, 1)
			GameTooltip:Show()
		end)

		mdcFontString("calculatedDungeonScoreText", backdrop, highlightFont, "CENTER", dungeonFrame, "CENTER", 157, -60, "")

		for affix = 1, 2 do
			local affixOffsetX = affix == 1 and -135 or -25
			local inputOffsetX = affix == 1 and 120 or 225

			if dungeons[dungeon][5][affix][1] then
				mdcFontString("affixName", backdrop, normalFont, "TOP", dungeonFrame, "TOP", affixOffsetX, -60, dungeons[dungeon][5][affix][1])
				mdcFontString("affixLevel", backdrop, highlightFont, "TOP", dungeonFrame, "TOP", affixOffsetX, -90, C_ChallengeMode.GetSpecificDungeonScoreRarityColor(dungeons[dungeon][5][affix][3]):WrapTextInColorCode(dungeons[dungeon][5][affix][3]))
				mdcFontString("affixTime", backdrop, highlightFont, "TOP", dungeonFrame, "TOP", affixOffsetX, -120, dungeons[dungeon][5][affix][5] and WrapTextInColorCode(SecondsToClock(dungeons[dungeon][5][affix][4]), "FFFF0000") or WrapTextInColorCode(SecondsToClock(dungeons[dungeon][5][affix][4]), "99FFFFFF"))
				mdcFontString("affixScore", backdrop, highlightFont, "TOP", dungeonFrame, "TOP", affixOffsetX, -150, C_ChallengeMode.GetSpecificDungeonScoreRarityColor(dungeons[dungeon][5][affix][2]):WrapTextInColorCode(dungeons[dungeon][5][affix][2]))
			else
				mdcFontString("noAffixName", backdrop, normalFont, "TOP", dungeonFrame, "TOP", affixOffsetX, -60, affix == 1 and fortified or tyrannical)
				mdcFontString("noAffixLevel", backdrop, highlightFont, "TOP", dungeonFrame, "TOP", affixOffsetX, -90, "---")
				mdcFontString("noAffixName", backdrop, highlightFont, "TOP", dungeonFrame, "TOP", affixOffsetX, -120, "---")
				mdcFontString("noAffixName", backdrop, highlightFont, "TOP", dungeonFrame, "TOP", affixOffsetX, -150, "---")
			end

			local level = backdrop .. ".level" .. affix
			F[level] = CreateFrame("EditBox", nil, F[backdrop], InputBoxTemplate)
			F[level]:SetMultiLine(false)
			F[level]:SetMaxLetters(2)
			F[level]:SetNumeric(true)
			F[level]:SetFontObject(highlightFont)
			F[level]:SetSize(28 / addonSize, 30 / addonSize)
			F[level]:SetAutoFocus(false)
			F[level]:SetNumber(mdc.db.profile.calculation.affixLevel[dungeon][affix])
			if F[level]:GetNumber() < 10 then
				F[level]:SetPoint("CENTER", F[backdrop], inputOffsetX / addonSize, 0)
			else
				F[level]:SetPoint("CENTER", F[backdrop], (inputOffsetX - 10) / addonSize, 0)
			end

			mdcFrame("levelBG" .. affix, dungeonFrame, 26, 30, "CENTER", backdrop, "CENTER", inputOffsetX - 12, 0, BackdropTemplateMixin and "BackdropTemplate", "box_unchecked", 0, 0, 0, 1)

			local subtractLevel = backdrop .. ".subtractLevel" .. affix
			mdcButton("subtractLevel" .. affix, backdrop, ActionBarActionButtonMixin, 24, 30, "CENTER", backdrop, "CENTER", inputOffsetX - 40, 0, nil)
			F[subtractLevel]:SetText("-")
			F[subtractLevel]:SetNormalFontObject(normalFont)
			F[subtractLevel]:SetHighlightFontObject(highlightFont)

			mdcFrame("subtractLevelBG" .. affix, dungeonFrame, 24, 30, "CENTER", subtractLevel, "CENTER", 0, 0, BackdropTemplateMixin and "BackdropTemplate", "box_unchecked", 0, 0, 0, 1)

			local addLevel = backdrop .. ".addLevel" .. affix
			mdcButton("addLevel" .. affix, backdrop, ActionBarActionButtonMixin, 24, 30, "CENTER", backdrop, "CENTER", inputOffsetX + 16, 0, nil)
			F[addLevel]:SetText("+")
			F[addLevel]:SetNormalFontObject(normalFont)
			F[addLevel]:SetHighlightFontObject(highlightFont)

			mdcFrame("addLevelBG" .. affix, dungeonFrame, 24, 30, "CENTER", addLevel, "CENTER", 0, 0, BackdropTemplateMixin and "BackdropTemplate", "box_unchecked", 0, 0, 0, 1)

			F[subtractLevel]:SetScript("OnClick", function()
				F[level]:SetNumber(F[level]:GetNumber() > 0 and F[level]:GetNumber() - 1 or F[level]:GetNumber())

				if F[level]:GetNumber() == 1 then
					F[level]:SetNumber(0)
				end

				if F[level]:GetNumber() < 10 then
					F[level]:SetPoint("CENTER", F[backdrop], inputOffsetX / addonSize, 0)
				end
			end)

			F[addLevel]:SetScript("OnClick", function()
				F[level]:SetNumber(F[level]:GetNumber() < 99 and F[level]:GetNumber() + 1 or F[level]:GetNumber())

				if F[level]:GetNumber() == 1 then
					F[level]:SetNumber(2)
				end

				if F[level]:GetNumber() > 9 then
					F[level]:SetPoint("CENTER", F[backdrop], (inputOffsetX - 10) / addonSize, 0)
				end
			end)

			local minutes = "minutes" .. dungeon .. affix
			F[minutes] = CreateFrame("EditBox", nil, F[backdrop], InputBoxTemplate)
			F[minutes]:SetMultiLine(false)
			F[minutes]:SetMaxLetters(2)
			F[minutes]:SetNumeric(true)
			F[minutes]:SetFontObject(highlightFont)
			F[minutes]:SetPoint("CENTER", F[backdrop], (inputOffsetX - 24) / addonSize, -30 / addonSize)
			F[minutes]:SetSize(28 / addonSize, 26 / addonSize)
			F[minutes]:SetAutoFocus(false)

			if mdc.db.profile.calculation.affixTime[dungeon][affix] > 0 then
				local savedMinutes = (mdc.db.profile.calculation.affixTime[dungeon][affix] - mdc.db.profile.calculation.affixTime[dungeon][affix] % 60) / 60
				F[minutes]:SetText(savedMinutes < 10 and "0" .. savedMinutes or savedMinutes)
			else
				F[minutes]:SetText(dungeons[dungeon][3] / 60)
			end

			mdcFrame("minutesBG" .. affix, dungeonFrame, 26, 26, "CENTER", backdrop, "CENTER", inputOffsetX - 27, -30, BackdropTemplateMixin and "BackdropTemplate", "box_unchecked", 0, 0, 0, 1)
			mdcFontString("dots" .. affix, backdrop, highlightFont, "CENTER", dungeonFrame, "CENTER", inputOffsetX - 14, -30, ":")

			local seconds = "seconds" .. dungeon .. affix
			F[seconds] = CreateFrame("EditBox", nil, F[backdrop], InputBoxTemplate)
			F[seconds]:SetMultiLine(true)
			F[seconds]:SetMaxLetters(2)
			F[seconds]:SetNumeric(true)
			F[seconds]:SetFontObject(highlightFont)
			F[seconds]:SetPoint("CENTER", F[backdrop], (inputOffsetX + 7) / addonSize, -30 / addonSize)
			F[seconds]:SetSize(28 / addonSize, 26 / addonSize)
			F[seconds]:SetAutoFocus(false)

			local savedSeconds = mdc.db.profile.calculation.affixTime[dungeon][affix] % 60
			F[seconds]:SetText(savedSeconds < 10 and "0" .. savedSeconds or savedSeconds)

			mdcFrame("secondsBG" .. affix, dungeonFrame, 26, 26, "CENTER", backdrop, "CENTER", inputOffsetX + 3, -30, BackdropTemplateMixin and "BackdropTemplate", "box_unchecked", 0, 0, 0, 1)
			mdcFontString("calculatedScoreText" .. affix, backdrop, highlightFont, "CENTER", dungeonFrame, "CENTER", inputOffsetX - 15, -60, "")

			F[level]:SetScript("OnTextChanged", function(self)
				if self:GetNumber() < 10 then
					self:SetPoint("CENTER", F[backdrop], inputOffsetX / addonSize, 0)
				else
					self:SetPoint("CENTER", F[backdrop], (inputOffsetX - 10) / addonSize, 0)
				end

				mdcUpdateScores(level, dungeon, minutes, seconds, backdrop, affix)
				mdc.db.profile.calculation.affixLevel[dungeon][affix] = self:GetNumber()
			end)

			F[minutes]:SetScript("OnTextChanged", function(self)
				mdcUpdateScores(level, dungeon, minutes, seconds, backdrop, affix)
				mdc.db.profile.calculation.affixTime[dungeon][affix] = self:GetNumber() * 60 + F[seconds]:GetNumber()
			end)

			F[seconds]:SetScript("OnTextChanged", function(self)
				mdcUpdateScores(level, dungeon, minutes, seconds, backdrop, affix)
				mdc.db.profile.calculation.affixTime[dungeon][affix] = F[minutes]:GetNumber() * 60 + self:GetNumber()
			end)

			mdcButton("timerDown" .. affix, backdrop, ActionBarActionButtonMixin, 20, 26, "CENTER", backdrop, "CENTER", inputOffsetX - 52, -30, nil)
			local timerDown = backdrop .. ".timerDown" .. affix
			F[timerDown]:SetText("-")
			F[timerDown]:SetNormalFontObject(normalFont)
			F[timerDown]:SetHighlightFontObject(highlightFont)
			mdcFrame("timerDownBG" .. affix, dungeonFrame, 20, 26, "CENTER", timerDown, "CENTER", 0, 0, BackdropTemplateMixin and "BackdropTemplate", "box_unchecked", 0, 0, 0, 1)

			mdcButton("timerUp" .. affix, backdrop, ActionBarActionButtonMixin, 20, 26, "CENTER", backdrop, "CENTER", inputOffsetX + 28, -30, nil)
			local timerUp = backdrop .. ".timerUp" .. affix
			F[timerUp]:SetText("+")
			F[timerUp]:SetNormalFontObject(normalFont)
			F[timerUp]:SetHighlightFontObject(highlightFont)
			mdcFrame("timerUpBG" .. affix, dungeonFrame, 20, 26, "CENTER", timerUp, "CENTER", 0, 0, BackdropTemplateMixin and "BackdropTemplate", "box_unchecked", 0, 0, 0, 1)

			F[timerDown]:SetScript("OnClick", function()
				mdcSetTimeLimit(dungeon, affix, false)
			end)
			F[timerUp]:SetScript("OnClick", function()
				mdcSetTimeLimit(dungeon, affix, true)
			end)
		end

		local fortifiedScore = dungeons[dungeon][5][1][1] and mdcCalculateAffixScore(dungeons[dungeon][5][1][3], dungeons[dungeon][3], dungeons[dungeon][5][1][4]) or 0
		local tyrannicalScore = dungeons[dungeon][5][2][1] and mdcCalculateAffixScore(dungeons[dungeon][5][2][3], dungeons[dungeon][3], dungeons[dungeon][5][2][4]) or 0
		local dungeonScore = math.max(tyrannicalScore, fortifiedScore) * 1.5 + math.min(tyrannicalScore, fortifiedScore) * 0.5
		calculatedOverallScore = calculatedOverallScore + dungeonScore

		mdcLine("separator", backdrop, 0.5, 0.5, 0.5, 0.5, "TOP", 50, -40, "BOTTOM", 50, 10, 2)
		mdcFontString("calculateText" .. dungeon, backdrop, normalFont, "CENTER", dungeonFrame, "CENTER", 165, 30, L["Score calculator"])
		mdcFontString("dungeonName", backdrop, normalFont, "TOPLEFT", dungeonFrame, "TOPLEFT", 50, -30, dungeons[dungeon][2] .. ": ")
		mdcFontString("dungeonPoints", backdrop, normalFont, "LEFT", backdrop .. ".dungeonName", "RIGHT", 4, 0, (dungeonScore > 0 and C_ChallengeMode.GetSpecificDungeonOverallScoreRarityColor(mdcRound(dungeonScore)):WrapTextInColorCode(mdcRound(dungeonScore)) or "---"))
		mdcFontString("levelText", backdrop, highlightFont, "TOPLEFT", dungeonFrame, "TOPLEFT", 50, -90, WrapTextInColorCode(L["Level"] .. ":", "A9999999"))
		mdcFontString("timeText", backdrop, highlightFont, "TOPLEFT", dungeonFrame, "TOPLEFT", 50, -120, WrapTextInColorCode(L["Time"] .. ":", "A9999999"))
		mdcFontString("scoreText", backdrop, highlightFont, "TOPLEFT", dungeonFrame, "TOPLEFT", 50, -150, WrapTextInColorCode(L["Score"] .. ":", "A9999999"))
	end
end

local function mdcCalculateAffixRatings(keystoneLevel, dungeonTime)
	local minusOne = mdcCalculateAffixScore(keystoneLevel, dungeonTime, dungeonTime * 1.4)
	local plusOne = mdcCalculateAffixScore(keystoneLevel, dungeonTime, dungeonTime)
	local plusTwo = mdcCalculateAffixScore(keystoneLevel, dungeonTime, dungeonTime * 0.8)
	local plusThree = mdcCalculateAffixScore(keystoneLevel, dungeonTime, dungeonTime * 0.6)

	return {minusOne, plusOne, plusTwo, plusThree}
end

local function mdcGetKeystoneRatings(currentAffix, keystoneID, keystoneLevel)
	local affixRatings = {0, 0, 0, 0}

	for _, dungeon in pairs(dungeons) do
		if keystoneID and dungeon[1] == keystoneID then
			local hasFortified = dungeon[5][1][1] and true or false
			local hasTyrannical = dungeon[5][2][1] and true or false
			local currentFortifiedScore = hasFortified and mdcCalculateAffixScore(dungeon[5][1][3], dungeon[3], dungeon[5][1][4]) or 0
			local currentTyrannicalScore = hasTyrannical and mdcCalculateAffixScore(dungeon[5][2][3], dungeon[3], dungeon[5][2][4]) or 0
			local currentDungeonScore = math.max(currentFortifiedScore, currentTyrannicalScore) * 1.5 + math.min(currentFortifiedScore, currentTyrannicalScore) * 0.5

			affixRatings = mdcCalculateAffixRatings(keystoneLevel, dungeon[3])
			for key, rating in pairs(affixRatings) do
				if not hasFortified and not hasTyrannical then
					affixRatings[key] = rating * 1.5
				elseif currentAffix == fortified then
					if hasFortified and not hasTyrannical then
						affixRatings[key] = math.max(currentFortifiedScore, rating) * 1.5 - currentDungeonScore
					elseif hasTyrannical then
						affixRatings[key] = math.max(rating, currentTyrannicalScore) * 1.5 + math.min(rating, currentTyrannicalScore) * 0.5 - currentDungeonScore
					end
				elseif currentAffix == tyrannical then
					if not hasFortified and hasTyrannical then
						affixRatings[key] = math.max(rating, currentTyrannicalScore) * 1.5 - currentDungeonScore
					elseif hasFortified then
						affixRatings[key] = math.max(currentFortifiedScore, rating) * 1.5 + math.min(currentFortifiedScore, rating) * 0.5 - currentDungeonScore
					end
				end

				affixRatings[key] = affixRatings[key] > 0 and affixRatings[key] or 0
			end
		end
	end

	return affixRatings
end

local function getAffixLevelData()
	local affixCount = 0
	local totalAffixLevel = 0
	local highestAffixLevel = 0

	for _, dungeon in pairs(dungeons) do
		for _, affixData in pairs(dungeon[5]) do
			if affixData[3] then
				totalAffixLevel = totalAffixLevel + affixData[3]
				affixCount = affixCount + 1

				if affixData[3] > highestAffixLevel then
					highestAffixLevel = affixData[3]
				end
			end
		end
	end

	return mdcRound(totalAffixLevel / affixCount), highestAffixLevel
end

local function getRecommendedLevel()
	local recommendedLevel = 2
	local averageAffixLevel, highestAffixLevel = getAffixLevelData()
	local _, avgItemLevelEquipped = GetAverageItemLevel()
	avgItemLevelEquipped = mdcRound(avgItemLevelEquipped)

	for i = 2, 10 do
		local greatVaultReward = C_MythicPlus.GetRewardLevelForDifficultyLevel(i)
		local itemLevel = avgItemLevelEquipped + 30 - 3 * i

		if itemLevel < greatVaultReward - 20 then
			recommendedLevel = 0
			break
		elseif itemLevel < greatVaultReward and i == 2 then
			recommendedLevel = i
			break
		elseif itemLevel < greatVaultReward then
			recommendedLevel = i
			break
		elseif itemLevel >= greatVaultReward and itemLevel < greatVaultReward + 2 then
			recommendedLevel = i + 1
			break
		elseif i == 10 then
			recommendedLevel = i
			break
		end
	end

	if highestAffixLevel > 0 then
		if recommendedLevel <= highestAffixLevel - 3 then
			recommendedLevel = highestAffixLevel - 1
		elseif recommendedLevel <= highestAffixLevel - 1 then
			recommendedLevel = highestAffixLevel
		elseif recommendedLevel == highestAffixLevel then
			recommendedLevel = highestAffixLevel + 1
		end
	end

	if recommendedLevel == 10 and averageAffixLevel >= 9 and highestAffixLevel >= 9 then
		if highestAffixLevel == averageAffixLevel then
			recommendedLevel = highestAffixLevel + 2
		elseif highestAffixLevel - averageAffixLevel <= 3 then
			recommendedLevel = highestAffixLevel
		elseif highestAffixLevel - averageAffixLevel > 3 then
			recommendedLevel = averageAffixLevel + 3
		end
	end

	return recommendedLevel
end

local function getRecommendedDungeon(currentAffix)
	local affix = currentAffix == fortified and 1 or 2
	local otherAffix = currentAffix == fortified and 2 or 1
	local rD = 0
	local missingBoth, missingCurrent, missingOther, missingNone = {}, {}, {}, {}

	for dKey, dungeon in pairs(dungeons) do
		if not dungeon[5][1][1] and not dungeon[5][2][1] then
			table.insert(missingBoth, dKey)
		elseif not dungeon[5][affix][1] and dungeon[5][otherAffix][1] then
			table.insert(missingCurrent, dKey)
		elseif dungeon[5][affix][1] and not dungeon[5][otherAffix][1] then
			table.insert(missingOther, dKey)
		elseif dungeon[5][1][1] and dungeon[5][2][1] then
			table.insert(missingNone, dKey)
		end
	end

	if #missingBoth > 0 then
		for _, d in pairs(missingBoth) do
			if rD == 0 or dungeons[d][3] < dungeons[rD][3] then -- lower time
				rD = d
			end
		end
	elseif #missingCurrent > 0 then
		for _, d in pairs(missingCurrent) do
			if
				rD == 0
				or dungeons[d][5][otherAffix][2] < dungeons[rD][5][otherAffix][2] -- lower other affix score
				or (dungeons[d][5][otherAffix][2] == dungeons[rD][5][otherAffix][2] and dungeons[d][3] < dungeons[rD][3]) -- same other affix score and lower time
			then
				rD = d
			end
		end
	elseif #missingOther > 0 then
		for _, d in pairs(missingOther) do
			if
				rD == 0
				or dungeons[d][5][affix][2] < dungeons[rD][5][affix][2] -- lower affix score
				or (dungeons[d][5][affix][2] == dungeons[rD][5][affix][2] and dungeons[d][3] < dungeons[rD][3]) -- same affix score and lower time
			then
				rD = d
			end
		end
	elseif #missingNone > 0 then
		for _, d in pairs(missingNone) do
			if
				rD == 0
				or dungeons[d][5][affix][2] < dungeons[rD][5][affix][2] -- lower affix score
				or (dungeons[d][5][affix][2] == dungeons[rD][5][affix][2] and dungeons[d][5][otherAffix][2] < dungeons[rD][5][otherAffix][2]) -- same affix score and lower other affix score
				or (dungeons[d][5][affix][2] == dungeons[rD][5][affix][2] and dungeons[d][5][otherAffix][2] == dungeons[rD][5][otherAffix][2] and dungeons[d][3] < dungeons[rD][3]) -- same score on both affix and lower time
			then
				rD = d
			end
		end
	end

	return rD > 0 and dungeons[rD] or dungeons[3]
end

local function mdcToggleDungeonFinder(sameButton)
	if _G.PVEFrame:IsVisible() and (sameButton or not mdc.db.profile.lfdGroupButtons) then
		_G.PVEFrame:Hide()

		for i, v in pairs(UISpecialFrames) do
			if v == "PVEFrame" then
				table.remove(UISpecialFrames, i)
			end
		end
	else
		table.insert(UISpecialFrames, "PVEFrame")
		_G.PVEFrame:Show()
		_G.LFGListUtil_OpenBestWindow()
	end
end

local function mdcKeystone(content)
	local cName = ""
	local cID = 0
	local cTexture = 0
	local cLevel = 0
	local pressedButton

	if C_MythicPlus.GetOwnedKeystoneChallengeMapID() then
		cName, cID, _, _, cTexture = C_ChallengeMode.GetMapUIInfo(C_MythicPlus.GetOwnedKeystoneChallengeMapID())
		cLevel = C_MythicPlus.GetOwnedKeystoneLevel()
	end

	local contentFrame = optionalBottomFrame .. ".content" .. content
	mdcFrame("content" .. content, optionalBottomFrame, mainX, 175, "TOPLEFT", optionalBottomFrame, "TOPLEFT", 0, 0, BackdropTemplateMixin and "BackdropTemplate")

	local currentAffix = ""
	for i = 1, 3 do
		local affixName, affixDescription, fileDataID = C_ChallengeMode.GetAffixInfo(C_MythicPlus.GetCurrentAffixes()[i].id)
		local affixIcon = "affix" .. i

		if i == 1 then
			currentAffix = affixName
		end

		F[affixIcon] = F[contentFrame]:CreateTexture("Texture", "BACKGROUND", nil, -7)
		F[affixIcon]:SetTexture(fileDataID)
		F[affixIcon]:SetSize(50 / addonSize, 50 / addonSize)
		F[affixIcon]:SetPoint("CENTER", F[contentFrame], "CENTER", 0, (55 - (i - 1) * 55) / addonSize)
		F[affixIcon]:SetTexCoord(0.1, 0.9, 0.1, 0.9)

		local tooltipFrame = contentFrame .. ".tooltip" .. i
		mdcFrame("tooltip" .. i, contentFrame, 50, 50, "CENTER", affixIcon, "CENTER", 0, 0)
		F[tooltipFrame]:SetScript("OnLeave", function()
			GameTooltip:Hide()
		end)
		F[tooltipFrame]:SetScript("OnEnter", function()
			GameTooltip:SetOwner(F[tooltipFrame], "ANCHOR_CURSOR", 0, 0)
			GameTooltip:AddLine(affixName)
			GameTooltip:AddLine(affixDescription, 1, 1, 1, true)
			GameTooltip:Show()
		end)
	end

	if cName ~= "" and mdc.db.profile.showDungeonTexture then
		local textureFrame = contentFrame .. "1"
		F[textureFrame] = F[contentFrame]:CreateTexture("Texture", "BACKGROUND", nil, -8)
		F[textureFrame]:SetTexture(cTexture)
		F[textureFrame]:SetSize(mainX / 2 / addonSize, 175 / addonSize - 1)
		F[textureFrame]:SetPoint("TOPLEFT", F[contentFrame], "TOPLEFT", 0, -1)
		F[textureFrame]:SetTexCoord(0.1, 0.7, 0.1, 0.5)
		F[textureFrame]:SetVertexColor(1, 1, 1, 0.33)
	end

	mdcButton("startGroup", contentFrame, SecureActionButtonTemplate, 80, 80, "LEFT", contentFrame, "LEFT", 60, 0, mdc.db.profile.lfdGroupButtons and "group_create" or "group_create_search")
	F[contentFrame .. ".startGroup"]:SetScript("OnClick", function()
		if cID ~= 0 then
			mdcToggleDungeonFinder(pressedButton == 1 and true or false)

			if mdc.db.profile.lfdGroupButtons then
				_G.LFGListCategorySelection_SelectCategory(LFGListFrame.CategorySelection, 2, 0)
				_G.LFGListFrame.CategorySelection.StartGroupButton:Click()
			end

			pressedButton = 1
		end
	end)
	F[contentFrame .. ".startGroup"]:SetScript("OnEnter", function(self)
		if cID ~= 0 then
			self:GetNormalTexture():SetVertexColor(1, 1, 1, 1, 0.7)
		end
	end)
	F[contentFrame .. ".startGroup"]:SetScript("OnLeave", function(self)
		self:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 0.7)
	end)

	local cRatings = {0, 0, 0, 0}
	local cExpectedItemLevel = 0
	if cID ~= 0 and cLevel > 0 then
		cRatings = mdcGetKeystoneRatings(currentAffix, cID, cLevel)
		_, cExpectedItemLevel = C_MythicPlus.GetRewardLevelForDifficultyLevel(cLevel)

		if cExpectedItemLevel == 0 then
			cExpectedItemLevel = eodItemLevel[math.min(cLevel, 10)]
		end
	end

	mdcFontString("cKey", contentFrame, normalFont, "LEFT", contentFrame, "LEFT", 200, 60, L["Your Keystone"], 1.6)
	mdcFontString("cKeyData", contentFrame, highlightFont, "LEFT", contentFrame, "LEFT", 200, 20, cName ~= "" and cName .. " +" .. cLevel or "---", 1.6)
	F[contentFrame .. ".cKeyData"]:SetMaxLines(2)
	F[contentFrame .. ".cKeyData"]:SetWordWrap(true)
	F[contentFrame .. ".cKeyData"]:SetJustifyH("LEFT")
	F[contentFrame .. ".cKeyData"]:SetWidth(300 / addonSize)
	mdcFontString("cExpectedRating", contentFrame, highlightFont, "LEFT", contentFrame, "LEFT", 200, -20, L["Rating"] .. (cID ~= 0 and ": +" .. mdcRound(mdcRound(cRatings[2] + calculatedOverallScore) - overallScore) .. " (" .. mdcRound(cRatings[2] + calculatedOverallScore) .. ")" or ": ---"), 1.6)
	local cExpectedRatingInfo = contentFrame .. ".cExpectedRatingInfo"
	mdcFrame("cExpectedRatingInfo", contentFrame, 200, 24, "LEFT", contentFrame .. ".cExpectedRating", "LEFT", 0, 0)
	F[cExpectedRatingInfo]:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
	F[cExpectedRatingInfo]:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, 0)
		GameTooltip:AddLine(L["Rating"])
		GameTooltip:AddLine("-1: +" .. mdcRound(mdcRound(cRatings[1] + calculatedOverallScore) - overallScore) .. " (" .. mdcRound(cRatings[1] + calculatedOverallScore) .. ")", 1, 1, 1)
		GameTooltip:AddLine("+1: +" .. mdcRound(mdcRound(cRatings[2] + calculatedOverallScore) - overallScore) .. " (" .. mdcRound(cRatings[2] + calculatedOverallScore) .. ")", 1, 1, 1)
		GameTooltip:AddLine("+2: +" .. mdcRound(mdcRound(cRatings[3] + calculatedOverallScore) - overallScore) .. " (" .. mdcRound(cRatings[3] + calculatedOverallScore) .. ")", 1, 1, 1)
		GameTooltip:AddLine("+3: +" .. mdcRound(mdcRound(cRatings[4] + calculatedOverallScore) - overallScore) .. " (" .. mdcRound(cRatings[4] + calculatedOverallScore) .. ")", 1, 1, 1)
		GameTooltip:Show()
	end)
	mdcFontString("cExpectedItemInfo", contentFrame, highlightFont, "LEFT", contentFrame, "LEFT", 200, -60, L["Item Level"] .. (cID ~= 0 and ": " .. cExpectedItemLevel or ": ---"), 1.6)

	local rLevel = getRecommendedLevel()
	local rDungeon = getRecommendedDungeon(currentAffix)
	local rRatings = {0, 0, 0, 0}
	local rExpectedItemLevel = 0

	if currentAffix == fortified and rDungeon[5][1][3] and rLevel <= rDungeon[5][1][3] then
		rLevel = rDungeon[5][1][3] + 1
	elseif currentAffix == tyrannical and rDungeon[5][2][3] and rLevel <= rDungeon[5][2][3] then
		rLevel = rDungeon[5][2][3] + 1
	end

	if rDungeon[2] ~= "" and rLevel > 0 then
		rRatings = mdcGetKeystoneRatings(currentAffix, rDungeon[1], rLevel)
		_, rExpectedItemLevel = C_MythicPlus.GetRewardLevelForDifficultyLevel(rLevel)

		if rExpectedItemLevel == 0 then
			rExpectedItemLevel = eodItemLevel[math.min(rLevel, 10)]
		end
	end

	if rDungeon[2] ~= "" and rLevel > 0 and mdc.db.profile.showDungeonTexture then
		local textureFrame = contentFrame .. "2"
		F[textureFrame] = F[contentFrame]:CreateTexture("Texture", "BACKGROUND", nil, -8)
		F[textureFrame]:SetTexture(rDungeon[4])
		F[textureFrame]:SetSize(mainX / 2 / addonSize, 175 / addonSize - 1)
		F[textureFrame]:SetPoint("TOPLEFT", F[contentFrame], "TOP", 0, -1)
		F[textureFrame]:SetTexCoord(0.1, 0.7, 0.1, 0.5)
		F[textureFrame]:SetVertexColor(1, 1, 1, 0.33)
	end

	mdcFontString("rKey", contentFrame, normalFont, "RIGHT", contentFrame, "RIGHT", -200, 60, L["Recommended Keystone"], 1.6)
	mdcFontString("rKeyData", contentFrame, highlightFont, "RIGHT", contentFrame, "RIGHT", -200, 20, (rDungeon[2] ~= "" and rLevel > 0) and rDungeon[2] .. " +" .. rLevel or "---", 1.6)
	F[contentFrame .. ".rKeyData"]:SetMaxLines(2)
	F[contentFrame .. ".rKeyData"]:SetWordWrap(true)
	F[contentFrame .. ".rKeyData"]:SetJustifyH("RIGHT")
	F[contentFrame .. ".rKeyData"]:SetWidth(300 / addonSize)
	mdcFontString("rExpectedRating", contentFrame, highlightFont, "RIGHT", contentFrame, "RIGHT", -200, -20, L["Rating"] .. (rDungeon[3] ~= 0 and ": +" .. mdcRound(mdcRound(rRatings[2] + calculatedOverallScore) - overallScore) .. " (" .. mdcRound(rRatings[2] + calculatedOverallScore) .. ")" or ": ---"), 1.6)
	local rExpectedRatingInfo = contentFrame .. ".rExpectedRatingInfo"
	mdcFrame("rExpectedRatingInfo", contentFrame, 200, 24, "LEFT", contentFrame .. ".rExpectedRating", "LEFT", 0, 0)
	F[rExpectedRatingInfo]:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
	F[rExpectedRatingInfo]:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, 0)
		GameTooltip:AddLine(L["Rating"])
		GameTooltip:AddLine("-1: +" .. mdcRound(mdcRound(rRatings[1] + calculatedOverallScore) - overallScore) .. " (" .. mdcRound(rRatings[1] + calculatedOverallScore) .. ")", 1, 1, 1)
		GameTooltip:AddLine("+1: +" .. mdcRound(mdcRound(rRatings[2] + calculatedOverallScore) - overallScore) .. " (" .. mdcRound(rRatings[2] + calculatedOverallScore) .. ")", 1, 1, 1)
		GameTooltip:AddLine("+2: +" .. mdcRound(mdcRound(rRatings[3] + calculatedOverallScore) - overallScore) .. " (" .. mdcRound(rRatings[3] + calculatedOverallScore) .. ")", 1, 1, 1)
		GameTooltip:AddLine("+3: +" .. mdcRound(mdcRound(rRatings[4] + calculatedOverallScore) - overallScore) .. " (" .. mdcRound(rRatings[4] + calculatedOverallScore) .. ")", 1, 1, 1)
		GameTooltip:Show()
	end)
	mdcFontString("rExpectedItemInfo", contentFrame, highlightFont, "RIGHT", contentFrame, "RIGHT", -200, -60, L["Item Level"] .. (rDungeon[3] and ": " .. rExpectedItemLevel or ": ---"), 1.6)

	mdcButton("findGroup", contentFrame, SecureActionButtonTemplate, 80, 80, "RIGHT", contentFrame, "RIGHT", -60, 0, mdc.db.profile.lfdGroupButtons and "group_search" or "group_create_search")
	F[contentFrame .. ".findGroup"]:SetScript("OnClick", function()
		mdcToggleDungeonFinder(pressedButton == 2 and true or false)

		if mdc.db.profile.lfdGroupButtons then
			_G.LFGListCategorySelection_SelectCategory(LFGListFrame.CategorySelection, 2, 0)
			_G.LFGListFrame.CategorySelection.FindGroupButton:Click()
			_G.LFGListFrame.SearchPanel.SearchBox:SetFocus()
		end

		pressedButton = 2
	end)
	F[contentFrame .. ".findGroup"]:SetScript("OnEnter", function(self)
		self:GetNormalTexture():SetVertexColor(1, 1, 1, 1, 0.7)
	end)
	F[contentFrame .. ".findGroup"]:SetScript("OnLeave", function(self)
		self:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 0.7)
	end)

	if not mdc.db.profile.lfdGroupButtons then
		F[contentFrame .. ".findGroup"]:GetNormalTexture():SetTexCoord(1, 0, 0, 1)
	end
end

local function mdcMythicPlusRewards(content)
	local xOffset = 100

	local contentFrame = optionalBottomFrame .. ".content" .. content
	mdcFrame("content" .. content, optionalBottomFrame, mainX, 175, "TOPLEFT", optionalBottomFrame, "TOPLEFT", 0, 0, BackdropTemplateMixin and "BackdropTemplate")
	mdcFontString("keystone", contentFrame, highlightFont, "LEFT", contentFrame, "LEFT", 14, 60, L["Keystone Level"])
	mdcFontString("upgrade", contentFrame, highlightFont, "LEFT", contentFrame, "LEFT", 14, 20, L["End of Dungeon"])
	mdcFontString("greatVault", contentFrame, highlightFont, "LEFT", contentFrame, "LEFT", 14, -20, L["Great Vault"])
	mdcFontString("itemLevel", contentFrame, highlightFont, "LEFT", contentFrame, "LEFT", 14, -60, L["Item Level"])

	local itemUpgrades = {L["Champion"] .. ": 493 - 515", L["Hero"] .. ": 506 - 522", L["Myth"] .. ": 519 - 528"}
	for i = 1, #itemUpgrades do
		local button = contentFrame .. "." .. i
		mdcButton(i, contentFrame, nil, 200, 34, "LEFT", contentFrame, "LEFT", 300 + 300 * (i - 1), -60, nil)

		mdcFontString("content", button, highlightFont, "CENTER", button, "CENTER", 0, 0, WrapTextInColorCode(itemUpgrades[i], "A9999999"))
		F[button]:SetScript("OnEnter", function()
			F[button .. ".content"]:SetText(WrapTextInColorCode(itemUpgrades[i], "C7FFFFFF"))
			F[contentFrame .. ".EODLine" .. i]:Show()
			F[contentFrame .. ".GVLine" .. i]:Show()
		end)
		F[button]:SetScript("OnLeave", function()
			F[button .. ".content"]:SetText(WrapTextInColorCode(itemUpgrades[i], "A9999999"))
			F[contentFrame .. ".EODLine" .. i]:Hide()
			F[contentFrame .. ".GVLine" .. i]:Hide()
		end)

		mdcLine("leftLine", button, 0.7, 0.7, 0.7, 0.7, "TOPLEFT", 1, 0, "BOTTOMLEFT", 1, 0, 2)
		mdcLine("rightLine", button, 0.7, 0.7, 0.7, 0.7, "TOPRIGHT", -1, 0, "BOTTOMRIGHT", -1, 0, 2)
		mdcLine("topLine", button, 0.7, 0.7, 0.7, 0.7, "TOPLEFT",  0, 0, "TOPRIGHT", 0, 0, 2)
		mdcLine("bottomLine", button, 0.7, 0.7, 0.7, 0.7, "BOTTOMLEFT", 0, 0, "BOTTOMRIGHT", 0, 0, 2)
	end

	mdcLine("EODLine1", contentFrame, 1, 1, 1, 0.5, "LEFT", 225, 20, "LEFT", 775, 20, 20)
	mdcLine("GVLine1", contentFrame, 0, 0, 0, 0, "LEFT", 0, 0, "LEFT", 0, 0, 0)
	F[contentFrame .. ".EODLine1"]:Hide()
	F[contentFrame .. ".GVLine1"]:Hide()

	mdcLine("EODLine2", contentFrame, 1, 1, 1, 0.5, "LEFT", 825, 20, "LEFT", 1175, 20, 20)
	mdcLine("GVLine2", contentFrame, 1, 1, 1, 0.5, "LEFT", 225, -20, "LEFT", 875, -20, 20)
	F[contentFrame .. ".EODLine2"]:Hide()
	F[contentFrame .. ".GVLine2"]:Hide()

	mdcLine("EODLine3", contentFrame, 0, 0, 0, 0, "LEFT", 0, 0, "LEFT", 0, 0, 0)
	mdcLine("GVLine3", contentFrame, 1, 1, 1, 0.5, "LEFT", 925, -20, "LEFT", 1175, -20, 20)
	F[contentFrame .. ".EODLine3"]:Hide()
	F[contentFrame .. ".GVLine3"]:Hide()

	mdcFontString("mythic", contentFrame, highlightFont, "CENTER", contentFrame, "LEFT", 150 + xOffset, 60, 0)
	mdcFontString("mythicEOD", contentFrame, highlightFont, "CENTER", contentFrame, "LEFT", 150 + xOffset, 20, 493)
	mdcFontString("mythicGV", contentFrame, highlightFont, "CENTER", contentFrame, "LEFT", 150 + xOffset, -20, 506)

	for i = 2, 10 do
		local weeklyRewardLevel, endOfRunRewardLevel = C_MythicPlus.GetRewardLevelForDifficultyLevel(i)

		if weeklyRewardLevel == 0 then
			weeklyRewardLevel = weeklyItemLevel[i]
		end

		if endOfRunRewardLevel == 0 then
			endOfRunRewardLevel = eodItemLevel[i]
		end

		mdcFontString("keystoneLevel" .. i, contentFrame, highlightFont, "CENTER", contentFrame, "LEFT", (150 + xOffset * i ), 60, i)
		mdcFontString("endOfDungeonReward" .. i, contentFrame, highlightFont, "CENTER", contentFrame, "LEFT", (150 + xOffset * i ), 20, endOfRunRewardLevel)
		mdcFontString("greatVaultReward" .. i, contentFrame, highlightFont, "CENTER", contentFrame, "LEFT", (150 + xOffset * i ), -20, weeklyRewardLevel)
	end
end

local function mdcGreatVaultRewards(content)
	local activities = C_WeeklyRewards.GetActivities(1)
	local heroic, mythic, mythicPlus = C_WeeklyRewards.GetNumCompletedDungeonRuns()
	local allRuns = heroic + mythic + mythicPlus
	mdc.db.profile.weeklyRewards[1] = allRuns

	local category = {}
	local completedRuns = {}
	local hcReward = 489
	local m0Reward = 506

	for _, run in pairs(C_MythicPlus.GetRunHistory(false, true)) do
		local name = C_ChallengeMode.GetMapUIInfo(run.mapChallengeModeID)
		table.insert(completedRuns, {name, run.level, run.mapChallengeModeID})
	end

	table.sort(completedRuns, function (a, b) return a[2] < b[2] or (a[3] > b[3] and a[2] == b[2]) end)

	for _, activity in pairs(activities) do
		local progress
		local threshold
		local level

		for k, v in pairs(activity) do
			if k == "progress" then
				progress = v
			end

			if k == "level" then
				level = v
			end

			if k == "threshold" then
				threshold = v
			end
		end

		table.insert(category, {progress, threshold, level})
	end

	local difficulties = {}
	for i = 1, 3 do
		if allRuns >= category[i][2] then
			difficulties[i] = "hc"

			if allRuns - heroic >= category[i][2] then
				difficulties[i] = "m"
			end

			if allRuns - heroic - mythic >= category[i][2] then
				difficulties[i] = "m+"
			end
		end
	end

	local contentFrame = optionalBottomFrame .. ".content" .. content
	mdcFrame("content" .. content, optionalBottomFrame, mainX, 175, "CENTER", optionalBottomFrame, "CENTER", 0, 0, BackdropTemplateMixin and "BackdropTemplate")

	for i = 1, 3 do
		local rewardFrame =  contentFrame .. ".reward" .. i
		mdcFrame("reward" .. i, contentFrame, 72, 72, "LEFT", contentFrame, "LEFT", (150 + 412 * (i - 1)), 10, BackdropTemplateMixin and "BackdropTemplate")

		mdcFontString("progress", rewardFrame, normalFont, "TOP", rewardFrame, "TOP", 0, 30, "")
		if category[i][1] >= category[i][2] then
			F[rewardFrame]:SetBackdrop({bgFile = "Interface\\AddOns\\MythicDungeonCalculator\\Textures\\reward_unlocked"})
			F[rewardFrame .. ".progress"]:SetText(L["Completed"] .. ": " .. (category[i][1] <= category[i][2] and category[i][1] or category[i][2]) .. " / " .. category[i][2])
		else
			F[rewardFrame]:SetBackdrop({bgFile = "Interface\\AddOns\\MythicDungeonCalculator\\Textures\\reward_locked"})
			F[rewardFrame .. ".progress"]:SetText(WrapTextInColorCode(L["Completed"] .. ": " .. (category[i][1] <= category[i][2] and category[i][1] or category[i][2]) .. " / " .. category[i][2], "A9999999"))
		end

		mdcFontString("level", rewardFrame, highlightFont, "BOTTOM", rewardFrame, "BOTTOM", 0, -30, "")
		if difficulties[i] == "hc" then
			F[rewardFrame .. ".level"]:SetText(L["Item Level"] .. ": " .. hcReward .. " (" .. L["Heroic"] .. ")")
			mdc.db.profile.weeklyRewards[1 + i] = hcReward
		elseif difficulties[i] == "m" then
			F[rewardFrame .. ".level"]:SetText(L["Item Level"] .. ": " .. m0Reward .. " (" .. L["Mythic"] .. " 0)")
			mdc.db.profile.weeklyRewards[1 + i] = m0Reward
		elseif difficulties[i] == "m+" and category[i][3] > 0 then
			local rewardLevel = C_MythicPlus.GetRewardLevelFromKeystoneLevel(category[i][3])
			F[rewardFrame .. ".level"]:SetText(L["Item Level"] .. ": " .. rewardLevel .. " (" .. L["Mythic"] .. " " .. category[i][3] .. ")")
			mdc.db.profile.weeklyRewards[1 + i] = rewardLevel
		end

		local _, nextMythicPlusLevel, itemLevel = C_WeeklyRewards.GetNextMythicPlusIncrease(category[i][3])

		mdcFontString("upgrade", rewardFrame, highlightFont, "BOTTOM", rewardFrame, "BOTTOM", 0, -55, "")
		if difficulties[i] == nil then
			F[rewardFrame .. ".upgrade"]:SetText(WrapTextInColorCode(L["Next Upgrade"] .. ": " .. hcReward .. " (" .. L["Heroic"] .. ")", "A9999999"))
		elseif difficulties[i] == "hc" then
			F[rewardFrame .. ".upgrade"]:SetText(WrapTextInColorCode(L["Next Upgrade"] .. ": " .. m0Reward .. " (" .. L["Mythic"] .. " 0)", "A9999999"))
		elseif nextMythicPlusLevel then
			F[rewardFrame .. ".upgrade"]:SetText(WrapTextInColorCode(L["Next Upgrade"] .. ": " .. itemLevel .. " (" .. L["Mythic"] .. " " .. nextMythicPlusLevel .. ")", "A9999999"))
		end

		F[rewardFrame]:SetScript("OnLeave", function()
			GameTooltip:Hide()
		end)
		F[rewardFrame]:SetScript("OnEnter", function(self)
			if allRuns > 0 then
				GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, 0)

				for j = 0, (allRuns >= category[i][2] and category[i][2] - 1 or allRuns - 1), 1 do
					if mythicPlus - j > 0 and #completedRuns > 0 then
						GameTooltip:AddLine((completedRuns[#completedRuns - j][2] > 9 and "" or "  ") .. completedRuns[#completedRuns - j][2] .. " - " .. completedRuns[#completedRuns - j][1], 1, 1, 1)
					elseif mythicPlus + mythic - j > 0 then
						GameTooltip:AddLine("  0 - " .. L["Mythic"], 1, 1, 1)
					elseif allRuns - j > 0 then
						GameTooltip:AddLine("     " .. L["Heroic"], 1, 1, 1)
					end
				end

				GameTooltip:Show()
			end
		end)
	end
end

local function mdcSeasonalAchievements(content)
	local contentFrame = optionalBottomFrame .. ".content" .. content
	mdcFrame("content" .. content, optionalBottomFrame, mainX, 175, "TOPLEFT", optionalBottomFrame, "TOPLEFT", 0, 0, BackdropTemplateMixin and "BackdropTemplate")

	local xOffset = -450
	local achievement = {"name", "desc", "reward"}
	local scale = {1.6, 1.2, 1.4}
	for i = 0, 3 do
		local _, name, _, _, _, _, _, desc, _, icon, reward, _, wasEarnedByMe = GetAchievementInfo(19780 + i) -- change every season

		for j = 1, 3 do
			mdcFontString(achievement[j] .. i, contentFrame, highlightFont, "CENTER", contentFrame, "CENTER", xOffset + 300 * i , 116 - 58 * j, "", scale[j])
			F[contentFrame .. "." .. achievement[j] .. i]:SetMaxLines(3)
			F[contentFrame .. "." .. achievement[j] .. i]:SetWordWrap(true)
			F[contentFrame .. "." .. achievement[j] .. i]:SetJustifyH("CENTER")
			F[contentFrame .. "." .. achievement[j] .. i]:SetWidth(275 / addonSize)
		end

		F[contentFrame .. ".icon"] = F[contentFrame]:CreateTexture(nil, "BACKGROUND")
		F[contentFrame .. ".icon"]:SetTexture(icon)
		F[contentFrame .. ".icon"]:SetSize(300 / addonSize, 170 / addonSize)
		F[contentFrame .. ".icon"]:SetPoint("CENTER", F[contentFrame], "CENTER", xOffset / addonSize + 300 * i / addonSize, 0)
		F[contentFrame .. ".icon"]:SetVertexColor(0.2, 0.2, 0.2, 1)
		F[contentFrame .. ".icon"]:SetTexCoord(0.1, 0.9, 0.1, 0.9)

		if wasEarnedByMe then
			F[contentFrame .. ".name" .. i]:SetText(WrapTextInColorCode(name, "A9FFD000"))
			F[contentFrame .. ".desc" .. i]:SetText(desc)
			F[contentFrame .. ".reward" .. i]:SetText(reward)
		else
			F[contentFrame .. ".name" .. i]:SetText(WrapTextInColorCode(name, "A9999999"))
			F[contentFrame .. ".desc" .. i]:SetText(WrapTextInColorCode(desc, "A9999999"))
			F[contentFrame .. ".reward" .. i]:SetText(WrapTextInColorCode(reward, "A9999999"))
		end
	end
end

local function mdcLoadOptionalBottomContents()
	mdcKeystone(1)
	mdcMythicPlusRewards(2)
	mdcGreatVaultRewards(3)
	mdcSeasonalAchievements(4)
end

local function mdcSwitchOptionalBottomContent(currentContent)
	if mdc.db.profile.optionalBottomFrame.content == currentContent then
		if F[optionalBottomFrame]:IsVisible() then
			mdc.db.profile.optionalBottomFrame.show = false
			F[optionalBottomFrame]:Hide()
		else
			mdc.db.profile.optionalBottomFrame.show = true
			F[optionalBottomFrame]:Show()
		end
	else
		mdc.db.profile.optionalBottomFrame.content = currentContent
		mdc.db.profile.optionalBottomFrame.show = true

		F[optionalBottomFrame]:Show()
	end

	for content = 1, #contents do
		if content == currentContent then
			F[optionalBottomFrame .. ".content" .. content]:Show()

			F[optionalBottomFrame .. ".separatorLeft"]:SetEndPoint("TOPLEFT", (31 + 293 * (content - 1)) / addonSize, 0)
			F[optionalBottomFrame .. ".separatorRight"]:SetStartPoint("TOPLEFT", (29 + 260 * content + 33 * (content - 1)) / addonSize, 0)
		else
			F[bottomFrame .. ".content" .. content]:SetText(WrapTextInColorCode(contents[content], "A9999999"))
			F[optionalBottomFrame .. ".content" .. content]:Hide()
		end

		if mdc.db.profile.optionalBottomFrame.content == content and mdc.db.profile.optionalBottomFrame.show then
			F[bottomFrame .. ".content" .. content]:SetText(contents[content])
		end
	end
end

function mdc:OptionalBottomFrame()
	mdcFrame("optionalBottomFrame", mainFrame, mainX, 175, "BOTTOM", bottomFrame, "BOTTOM", 0, -200, BackdropTemplateMixin and "BackdropTemplate", "dungeon_banner", 0.7, 0.7, 0.7, 0.9)
	if mdc.db.profile.optionalBottomFrame.show then
		F[optionalBottomFrame]:Show()
	else
		F[optionalBottomFrame]:Hide()
	end

	mdcLine("separatorLeft", optionalBottomFrame, 0.7, 0.7, 0.7, 0.7, "TOPLEFT", 0, 0, "TOPLEFT", 600, 0, 2)
	mdcLine("separatorRight", optionalBottomFrame, 0.7, 0.7, 0.7, 0.7, "TOPLEFT", 600, 0, "TOPLEFT", 1200, 0, 2)
	mdcLoadOptionalBottomContents()

	for content = 1, #contents do
		local posX = 30 + 293 * (content - 1)

		local switchButton = bottomFrame .. ".switch" .. content
		mdcButton("switch" .. content, bottomFrame, nil, 260, 40, "BOTTOMLEFT", bottomFrame, "BOTTOMLEFT", posX, -24, nil)
		F[switchButton]:SetScript("OnEnter", function()
			F[bottomFrame .. ".content" .. content]:SetText(WrapTextInColorCode(contents[content], "C7FFFFFF"))
		end)
		F[switchButton]:SetScript("OnLeave", function()
			if not (mdc.db.profile.optionalBottomFrame.content == content) or not F[optionalBottomFrame]:IsVisible() then
				F[bottomFrame .. ".content" .. content]:SetText(WrapTextInColorCode(contents[content], "A9999999"))
			end
		end)
		F[switchButton]:SetScript("OnClick", function()
			mdcSwitchOptionalBottomContent(content)
		end)

		mdcFontString("content" .. content, bottomFrame, highlightFont, "CENTER", switchButton, "CENTER", 0, 0, WrapTextInColorCode(contents[content], "A9999999"))
		mdcLine("leftLine", switchButton, 0.7, 0.7, 0.7, 0.7, "TOPLEFT", 0, 0, "BOTTOMLEFT", 0, 0, 2)
		mdcLine("rightLine", switchButton, 0.7, 0.7, 0.7, 0.7, "TOPRIGHT", 0, 0, "BOTTOMRIGHT", 0, 0, 2)
		mdcLine("topLine", switchButton, 0.7, 0.7, 0.7, 0.7, "TOP", -131, 0, "TOP", 131, 0, 2)
	end

	if locale == "ruRU" then
		F[bottomFrame .. ".content3"]:SetTextScale(1.4 / addonSize)  -- Great Vault Rewards Tab
	end

	if mdc.db.profile.optionalBottomFrame.show == true then
		mdcSwitchOptionalBottomContent(mdc.db.profile.optionalBottomFrame.content)
	end
end

function mdc:LoadSavedVariables()
	overallScore = C_ChallengeMode.GetOverallDungeonScore()
	mdc.db.profile.currentRating = overallScore

	addonSize = mdc.db.profile.addonSize
	_, mdc.db.profile.class = C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))

	local _, iLvl = GetAverageItemLevel()
	mdc.db.profile.iLvl = mdcRound(iLvl)

	if not mdc.db.profile.optionalBottomFrame.enable then
		mainY = 835
	end

	if C_MythicPlus.GetOwnedKeystoneChallengeMapID() then
		local cName = C_ChallengeMode.GetMapUIInfo(C_MythicPlus.GetOwnedKeystoneChallengeMapID())
		local cLevel = C_MythicPlus.GetOwnedKeystoneLevel()
		mdc.db.profile.currentKeystone = {cName, cLevel}
	else
		mdc.db.profile.currentKeystone = {"", 0}
	end

	local activities = C_WeeklyRewards.GetActivities(1)
	local heroic, mythic, mythicPlus = C_WeeklyRewards.GetNumCompletedDungeonRuns()
	local category = {}
	local hcReward = 441
	local m0Reward = 450
	mdc.db.profile.weeklyRewards[1] = heroic + mythic + mythicPlus

	for _, activity in pairs(activities) do
		local threshold
		local level

		for k, v in pairs(activity) do
			if k == "level" then
				level = v
			end

			if k == "threshold" then
				threshold = v
			end
		end

		table.insert(category, {threshold, level})
	end

	if #category > 0 then
		for i = 1, 3 do
			if heroic + mythic + mythicPlus >= category[i][1] then
				mdc.db.profile.weeklyRewards[1 + i] = hcReward

				if mythic + mythicPlus >= category[i][1] then
					mdc.db.profile.weeklyRewards[1 + i] = m0Reward
				end

				if mythicPlus >= category[i][1] then
					mdc.db.profile.weeklyRewards[1 + i] = C_MythicPlus.GetRewardLevelFromKeystoneLevel(category[i][2])
				end
			end
		end
	end
end

function mdc:Debug()
	if F[debugFrame] and F[debugFrame]:IsVisible() then
		C_CVar.SetCVar("scriptErrors", 0)
		F[debugFrame]:Hide()
	else
		local debugString = ""
		for dKey, dungeon in pairs(dungeons) do
			for key, dungeonData in pairs(dungeon) do
				if key == 1 then
					debugString = debugString .. dKey .. " " .. dungeonData .. " "
				elseif key == 5 then
					for _, affix in pairs(dungeonData) do
						for _, affixData in pairs(affix) do
							if affixData then
								if type(affixData) == "boolean" then
									affixData = tostring(affixData)
								elseif affixData == tyrannical then
									affixData = "Tyrannical"
								elseif affixData == fortified then
									affixData = "Fortified"
								end

								debugString = debugString .. affixData .. " "
							end
						end
					end
				end
			end

			debugString = debugString .. "\n"
		end

		local score = C_ChallengeMode.GetOverallDungeonScore()
		debugString = debugString .. score .. "\n"

		local _, avgItemLevelEquipped = GetAverageItemLevel()
		debugString = debugString .. mdcRound(avgItemLevelEquipped) .. "\n"

		if C_MythicPlus.GetOwnedKeystoneChallengeMapID() then
			local _, id = C_ChallengeMode.GetMapUIInfo(C_MythicPlus.GetOwnedKeystoneChallengeMapID())
			local level = C_MythicPlus.GetOwnedKeystoneLevel()

			debugString = debugString .. id .. " " ..  level .. "\n"
		end

		local affixName = C_ChallengeMode.GetAffixInfo(C_MythicPlus.GetCurrentAffixes()[1].id)
		local rLevel = getRecommendedLevel()
		local rDungeon = getRecommendedDungeon(affixName)

		if rDungeon[1] then
			debugString = debugString .. rDungeon[1] .. " " ..  rLevel .. "\n"
		end

		local save = mdc.db.profile
		debugString = debugString .. save.addonSize .. "\n"
		debugString = debugString .. tostring(save.autoSync) .. "\n"
		debugString = debugString .. tostring(save.esc) .. "\n"
		debugString = debugString .. save.frameStrata .. "\n"
		debugString = debugString .. tostring(save.lfdGroupButtons) .. "\n"
		debugString = debugString .. tostring(save.optionalBottomFrame.enable) .. tostring(save.optionalBottomFrame.show) .. save.optionalBottomFrame.content .. "\n"
		debugString = debugString .. tostring(save.showMinimapIcon) .. "\n"
		debugString = debugString .. tostring(save.showDungeonTexture) .. "\n"
		debugString = debugString .. GetCurrentRegionName() .. "\n"
		debugString = debugString .. GetRealmName() .. "\n"

		F[debugFrame] = CreateFrame("Frame", nil, UIParent, BackdropTemplateMixin and "BackdropTemplate")
		F[debugFrame]:SetSize(460, 200)
		F[debugFrame]:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
		F[debugFrame]:SetBackdrop({bgFile = "Interface\\AddOns\\MythicDungeonCalculator\\Textures\\dungeon_banner"})
		F[debugFrame]:SetBackdropColor(1, 1, 1, 1)
		F[debugFrame]:SetFrameStrata("DIALOG")
		F[debugFrame]:SetMovable(true)
		F[debugFrame]:EnableMouse(true)
		F[debugFrame]:RegisterForDrag("LeftButton")
		F[debugFrame]:SetScript("OnDragStart", F[debugFrame].StartMoving)
		F[debugFrame]:SetScript("OnDragStop", function()
			F[debugFrame]:StopMovingOrSizing(true)
		end)

		mdcFontString("debug", debugFrame, normalFont, "TOPLEFT", debugFrame, "TOPLEFT", 10, -5, "MDC DEBUG", 2)
		mdcLine("topLine", debugFrame, 0.7, 0.7, 0.7, 0.7, "TOPLEFT", 0, -32, "TOPRIGHT", 0, -32, 2)

		local closeButton = debugFrame .. ".closeButton"
		mdcButton("closeButton", debugFrame, nil, 22, 24, "TOPRIGHT", debugFrame, "TOPRIGHT", -3, -3, "mdc_close")
		F[closeButton]:SetScript("OnClick", function()
			C_CVar.SetCVar("scriptErrors", 0)
			F[debugFrame]:Hide()
			F[debugFrame]:SetParent()
		end)
		F[closeButton]:SetScript("OnEnter", function(self)
			self:GetNormalTexture():SetVertexColor(1, 1, 1, 1, 0.7)
		end)
		F[closeButton]:SetScript("OnLeave", function(self)
			self:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 0.7)
		end)

		local scrollFrame = CreateFrame("ScrollFrame", nil, F[debugFrame], "UIPanelScrollFrameTemplate")
		scrollFrame:SetSize(425, 170)
		scrollFrame:SetPoint("TOPLEFT", F[debugFrame], "TOPLEFT", 10, -25)

		local editBoxFrame = CreateFrame("EditBox", nil, scrollFrame, BackdropTemplateMixin and "BackdropTemplate")
		editBoxFrame:SetSize(425, 170)
		editBoxFrame:SetMultiLine(true)
		editBoxFrame:SetAutoFocus(false)
		editBoxFrame:SetFontObject("ChatFontNormal")
		editBoxFrame:SetPoint("CENTER", scrollFrame, "CENTER", 0, 0)
		editBoxFrame:SetText(LibBase64.Encode(AceSerializer:Serialize(debugString)))
		scrollFrame:SetScrollChild(editBoxFrame)

		save.optionalBottomFrame.enable = false
	end
end