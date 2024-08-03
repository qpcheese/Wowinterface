--[=====[
		## RM InteractiveText widget ver. 1.0.1
		## rmInteractiveText.lua - code module
		InteractiveText widget for AceGUI
--]=====]

local Type, Version = "InteractiveText", 1
local AceGUI = LibStub and LibStub("AceGUI-3.0")

-- Exit if a current or newer version is loaded.
if not AceGUI or (AceGUI:GetWidgetVersion(Type) or 0) >= Version then return end

local Utils = LibStub("rmUtils-1.1")

local tinsert = table.insert
local tremove = table.remove

local CreateFrame = CreateFrame
local GameTooltip = GameTooltip
local GameTooltip_SetTitle = GameTooltip_SetTitle
local GameTooltip_AddNormalLine = GameTooltip_AddNormalLine
local GetLocale = GetLocale

-- Remove all known globals after this point
-- luacheck: std none

local L

do
	L = {
		["Copy"] = "Copy",
		["Select"] = "Select",
		["Ctrl+C"] = "Ctrl+C",
		["Esc"] = "Esc",
		["Press %s to copy"] = "Press %s to copy",
		["Press %s to cancel"] = "Press %s to cancel",
		["Click to select this text"] = "Click to select this text"
	}

	local locale = GetLocale()

	if locale == "deDE" then
	elseif locale == "esMX" or locale == "esES" then
	elseif locale == "frFR" then
	elseif locale == "itIT" then
	elseif locale == "koKR" then
	elseif locale == "ptBR" then
	elseif locale == "ruRU" then
		L = {
			["Copy"] = "Копировать",
			["Select"] = "Выделить",
			["Ctrl+C"] = "Ctrl+C",
			["Esc"] = "Esc",
			["Press %s to copy"] = "Нажмите %s, чтобы скопировать",
			["Press %s to cancel"] = "Нажмите %s, чтобы отменить",
			["Click to select this text"] = "Кликните, чтобы выделить текст"
		}
	elseif locale == "zhCN" then
	elseif locale == "zhTW" then
	end
end

do
	local function ColorKey(keyName)
		return Utils.Text.GetKey(keyName)
	end

	local CopyText = (L["Press %s to copy"]):format(ColorKey(L["Ctrl+C"]))
	local CancelText = (L["Press %s to cancel"]):format(ColorKey(L["Esc"]))

	local EditBox

	local function EditBox_OnEnter(self)
		GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
		GameTooltip_SetTitle(GameTooltip, L["Copy"])
		GameTooltip_AddNormalLine(GameTooltip, CopyText)
		GameTooltip_AddNormalLine(GameTooltip, CancelText)
		GameTooltip:Show()
	end

	local function EditBox_OnLeave(self)
		GameTooltip:Hide()
	end

	local function EditBox_OnFocusGained(self)
		self:HighlightText()
		self:SetCursorPosition(0)
	end

	local function EditBox_OnFocusLost(self)
		if self.obj then
			self.obj.info:Show()
			self.obj = nil
		end
		self:Hide()
	end

	local function EditBox_OnTextChanged(self)
		self:SetText(self:GetParent().value or "")
		EditBox_OnFocusGained(self)
	end

	local function Button_OnEnter(self)
		GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
		GameTooltip_SetTitle(GameTooltip, L["Select"])
		GameTooltip_AddNormalLine(GameTooltip, L["Click to select this text"])
		GameTooltip:Show()
	end

	local function Button_OnLeave(self)
		GameTooltip:Hide()
	end

	local function Button_OnClick(self)
		EditBox:ClearFocus()
		EditBox:SetParent(self)

		local obj = self.obj
		local text = self.value or obj:GetText() or ""

		EditBox:SetText(text)

		local info = obj.info

		EditBox:ClearAllPoints()
		EditBox:SetPoint("TOPLEFT", info, -2, 2)
		EditBox:SetPoint("BOTTOMRIGHT", info, 0, -2)

		EditBox:SetMultiLine(false)
		EditBox:Show()
		EditBox:SetFocus()
		EditBox.obj = obj

		info:Hide()
	end

	local Buttons = {}

	local function Widget_OnAcquire(self)
		self:SetDisabled(true)
		self:SetLabel()
		self:SetText()
	end

	local function Widget_OnRelease(self)
		self:SetDisabled(true)
		self.frame:ClearAllPoints()
	end

	local function Widget_SetDisabled(self, disabled)
		self.disabled = disabled
		local info = self.info
		if disabled then
			local button = self.button
			if button then
				tinsert(Buttons, button)
				button.obj = nil
				button.value = nil
				button:SetParent(nil)
				button:Hide()
				self.button = nil
			end
			info:SetTextColor(0.7, 0.7, 0.7)
		else
			if not EditBox then
				EditBox = CreateFrame("EditBox", "AceGUI-3.0_InteractiveText_EditBox", self.frame, BackdropTemplateMixin and "BackdropTemplate")
				EditBox:SetAutoFocus(true)
				EditBox:SetFontObject("GameFontHighlight")
				EditBox:SetJustifyH("LEFT")
				EditBox:SetJustifyV("TOP")
				EditBox:SetHeight(14)
				EditBox:SetBackdrop({
					bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
					edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
					tile = true, edgeSize = 0.8, tileSize = 5,
				})
				EditBox:SetBackdropColor(0, 0, 0, 0.5)
				EditBox:SetBackdropBorderColor(1, 1, 1, 0.2)
				EditBox:SetTextInsets(2, 1, 1, 1)
				EditBox:SetScript("OnEnter", EditBox_OnEnter)
				EditBox:SetScript("OnLeave", EditBox_OnLeave)
				EditBox:SetScript("OnTextChanged", EditBox_OnTextChanged)
				EditBox:SetScript("OnEnterPressed", EditBox.ClearFocus)
				EditBox:SetScript("OnEscapePressed", EditBox.ClearFocus)
				EditBox:SetScript("OnEditFocusLost", EditBox_OnFocusLost)
				EditBox:SetScript("OnEditFocusGained", EditBox_OnFocusGained)
				EditBox:Hide()
			end

			local button = self.button

			if not button then
				button = tremove(Buttons)
				if button then
					button:SetParent(self.frame)
				else
					button = CreateFrame("Button", nil, self.frame)
					button:SetScript("OnClick", Button_OnClick)
					button:SetScript("OnEnter", Button_OnEnter)
					button:SetScript("OnLeave", Button_OnLeave)
				end
			end

			button.obj = self
			button.value = self:GetText()
			button:ClearAllPoints()
			button:SetAllPoints(info)
			button:Show()

			self.button = button
			info:SetTextColor(1, 1, 1)
		end
	end

	local function Widget_SetLabel(self, text)
		if not text or text == "" then
			self.label:SetText("")
			self.label:Hide()
			self.info:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 7, 0)
			self:SetHeight(14)
			self.alignoffset = 12
		else
			self.label:SetText(text)
			self.label:Show()
			self.info:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 7, -18)
			self:SetHeight(32)
			self.alignoffset = 30
		end
	end

	local function Widget_GetText(self)
		return self.info:GetText() or ""
	end

	local function Widget_SetText(self, text)
		self.info:SetText(text or "")
	end

	local function Widget_SetWidth(self, width)
		self.frame:SetWidth(width)
	end

	local function Constructor()
		local widget = {}
		local frame = CreateFrame("Frame", nil, UIParent)

		widget.frame = frame
		frame.obj = widget

		local label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		label:SetPoint("TOPLEFT", 0, -2)
		label:SetPoint("TOPRIGHT", 0, -2)
		label:SetJustifyH("LEFT")
		label:SetHeight(18)

		widget.label = label
		label.obj = widget

		local info = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
		info:SetPoint("BOTTOMLEFT", 6, 0)
		info:SetPoint("BOTTOMRIGHT")
		info:SetJustifyH("LEFT")
		info:SetJustifyV("TOP")

		widget.info = info
		info.obj = widget

		widget.type = Type
		widget.num = AceGUI:GetNextWidgetNum(Type)
		widget.alignoffset = 30

		widget.OnAcquire = Widget_OnAcquire
		widget.OnRelease = Widget_OnRelease
		widget.SetDisabled = Widget_SetDisabled
		widget.SetLabel = Widget_SetLabel
		widget.GetText = Widget_GetText
		widget.SetText = Widget_SetText
		widget.SetWidth = Widget_SetWidth

		return AceGUI:RegisterAsWidget(widget)
	end

	AceGUI:RegisterWidgetType(Type, Constructor, Version)
end
