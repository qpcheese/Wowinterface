--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}

petbm.HealthBar = {}

local L = petbm.Locale.GetInstance()
local log = petbm.Debug:new("HealthBar")

-- Sets a new health value.
local function Update(self, health, maxHealth)
	if (health < 0) then
		health = 0
	end
	self.statusBar:SetMinMaxValues(0, maxHealth)
	self.statusBar:SetValue(health)
	if (self.statusText) then
		self.statusText:SetText(health.."/"..maxHealth)
	end
end

local function _InitFrame(self, parent, width, height, showText)
	local frame = CreateFrame("Frame", "petbmHealthBar"..petbm.WidgetUtil.GetNextId(), parent)
	frame:SetWidth(width)
	frame:SetHeight(height)
	frame:EnableMouse(false)
	frame.obj = self
	frame.tab = tab
	self.frame = frame
	
	local hOff = 7
	
	local statusBar = CreateFrame("StatusBar", "petbmHealthStatusBar"..petbm.WidgetUtil.GetNextId(), frame)
	statusBar:SetAllPoints(frame)
	self.statusBar = statusBar
	
	local textureLeft = frame:CreateTexture(nil, "ARTWORK")
	textureLeft:SetWidth(11)
	textureLeft:SetHeight(height + hOff)
	textureLeft:SetPoint("RIGHT", frame, "LEFT", 9, 0)
	textureLeft:SetTexture("Interface\\PetBattles\\PetJournal")
	textureLeft:SetTexCoord(0.04492188, 0.06640625, 0.00097656, 0.00781250)

	local textureRight = frame:CreateTexture(nil, "ARTWORK")
	textureRight:SetWidth(11)
	textureRight:SetHeight(height + hOff)
	textureRight:SetPoint("LEFT", frame, "RIGHT", -9, 0)
	textureRight:SetTexture("Interface\\PetBattles\\PetJournal")
	textureRight:SetTexCoord(0.07031250, 0.09179688, 0.00097656, 0.00781250)

	local textureMiddle = frame:CreateTexture(nil, "ARTWORK")
	textureMiddle:SetPoint("TOPLEFT", textureLeft, "TOPRIGHT", 0, 0)
	textureMiddle:SetPoint("BOTTOMRIGHT", textureRight, "BOTTOMLEFT", 0, 0)
	textureMiddle:SetTexture("Interface\\PetBattles\\PetJournal")
	textureMiddle:SetTexCoord(0.01953125, 0.04101563, 0.00097656, 0.00781250)

	local textureBack = frame:CreateTexture(nil, "BACKGROUND")
	textureBack:SetWidth(11)
	textureBack:SetHeight(height)
	textureBack:SetPoint("TOPLEFT", textureLeft, "TOPLEFT", 2, 0)
	textureBack:SetPoint("BOTTOMRIGHT", textureRight, "BOTTOMRIGHT", -2, 0)
	textureBack:SetTexture("Interface\\PetBattles\\PetJournal")
	textureBack:SetTexCoord(0.09570313, 0.11718750, 0.00097656, 0.00781250)
	
	statusBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	statusBar:SetStatusBarColor(0.1, 1.0, 0.1)

	if (showText) then
		local statusText = statusBar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
		statusText:SetJustifyH("CENTER")
		statusText:SetPoint("CENTER", frame, "TOP", 0, -(height / 2))
		self.statusText = statusText
	end
	
	self:Update(100, 120)
end

local function Show(self)
	self.frame:Show() 
end

local function Hide(self)
	self.frame:Hide() 
end

local function New(parent, width, height, showText)
	local instance = {}
		
	instance.Update = Update
	instance.Show = Show
	instance.Hide = Hide
	
	_InitFrame(instance, parent, width, height, showText)
	
	return instance
end

petbm.HealthBar.New = New
