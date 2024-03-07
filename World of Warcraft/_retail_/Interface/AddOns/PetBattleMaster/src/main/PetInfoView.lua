--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}

petbm.PetInfoView = {}

local L = petbm.Locale.GetInstance()
local log = petbm.Debug:new("PetInfoView")

local ALLY_1 = 1
local ALLY_2 = 2
local ALLY_3 = 3
local ENEMY_1 = 4
local ENEMY_2 = 5
local ENEMY_3 = 6

local PORTRAIT_OFFSET = 11
local TAB_SIZE = 60
local PORTRAIT_ICON_SIZE = 24
local PORTRAIT_ICON_OFFSET = 14

local SMALL_TAB_SIZE = 50
local SMALL_PORTRAIT_OFFSET = 10
local SMALL_PORTRAIT_ICON_SIZE = 22
local SMALL_PORTRAIT_ICON_OFFSET = 11

local BACKDROP_COLOR = {31/255, 28/255, 38/255, 1}
local BACKDROP_BORDER_COLOR = {1, 1, 1, 1}

local BACKDROP = {
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", 
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", 
	tile = true, tileSize = 16, edgeSize = 16, 
	insets = { left = 4, right = 4, top = 4, bottom = 4 }
}

local function _UpdateModifierFrame(self, petType, modifierFrame, name, health, maxHealth)
--	log:Debug("_UpdateDamageModifiers petType [%s]", petType)

	modifierFrame.petName:SetText(name)
	modifierFrame.healthBar:Update(health, maxHealth)

	local dealDmgPlus, dealDmgMinus, receiveDmgPlus, receiveDmgMinus = petbm.PetUtil.GetDamageModifiers(petType)
	if (dealDmgPlus) then
		modifierFrame.dealDamagePlusFrame.icon:SetTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[dealDmgPlus])
		petbm.WidgetUtil.AddTooltip(modifierFrame.dealDamagePlusFrame, L["Deals damage"], L["Deals increased damage to %s"]:format(_G["BATTLE_PET_DAMAGE_NAME_"..dealDmgPlus]))
		modifierFrame.dealDamagePlusFrame:Show()
	else
		modifierFrame.dealDamagePlusFrame:Hide()
	end
	if (dealDmgMinus) then
		modifierFrame.dealDamageMinusFrame.icon:SetTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[dealDmgMinus])
		petbm.WidgetUtil.AddTooltip(modifierFrame.dealDamageMinusFrame, L["Deals damage"], L["Deals reduced damage to %s"]:format(_G["BATTLE_PET_DAMAGE_NAME_"..dealDmgMinus]))
		modifierFrame.dealDamageMinusFrame:Show()
	else
		modifierFrame.dealDamageMinusFrame:Hide()
	end
	if (receiveDmgPlus) then
		modifierFrame.receiveDamagePlusFrame.icon:SetTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[receiveDmgPlus])
		petbm.WidgetUtil.AddTooltip(modifierFrame.receiveDamagePlusFrame, L["Receives damage"], L["Receives increased damage from %s"]:format(_G["BATTLE_PET_DAMAGE_NAME_"..receiveDmgPlus]))
		modifierFrame.receiveDamagePlusFrame:Show()
	else
		modifierFrame.receiveDamagePlusFrame:Hide()
	end
	if (receiveDmgMinus) then
		modifierFrame.receiveDamageMinusFrame.icon:SetTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[receiveDmgMinus])
		petbm.WidgetUtil.AddTooltip(modifierFrame.receiveDamageMinusFrame, L["Receives damage"], L["Receives reduced damage from %s"]:format(_G["BATTLE_PET_DAMAGE_NAME_"..receiveDmgMinus]))
		modifierFrame.receiveDamageMinusFrame:Show()
	else
		modifierFrame.receiveDamageMinusFrame:Hide()
	end
end

local function _UpdateTab(self, tab, petOwner, petIndex)
	local tabFrame = self.tabs[tab]
	if (tabFrame) then
        local petType, name, level, health, maxHealth, quality, icon = tabFrame.portrait:Update(petOwner, petIndex)
        if (petType) then
            local color = ITEM_QUALITY_COLORS[1]
            if (quality) then
                color = ITEM_QUALITY_COLORS[quality-1]
            end

            tabFrame.border:SetVertexColor(color.r, color.g, color.b, 1)

            if (tab == self.allyTab) then
                _UpdateModifierFrame(self, petType, self.allyModFrame, name, health, maxHealth)
            elseif (tab == self.enemyTab) then
                _UpdateModifierFrame(self, petType, self.enemyModFrame, name, health, maxHealth)
            end

            if (health <= 0) then
                -- wait until here to update the modifier frame
                tabFrame:Hide()
            else
                tabFrame:Show()
            end
        else
            tabFrame:Hide()
        end
    end
end

local function _UpdateAllTabs(self, activeAlly, activeEnemy)
	local off = ALLY_2
	for petIdx=1, 3 do
		if (activeAlly == petIdx) then
			_UpdateTab(self, ALLY_1, petbm.PetConstants.OWNER_PLAYER, petIdx)
		else
			_UpdateTab(self, off, petbm.PetConstants.OWNER_PLAYER, petIdx)
			off = off + 1
		end
	end

	local off = ENEMY_2
	for petIdx=1, 3 do
		if (activeEnemy == petIdx) then
			_UpdateTab(self, ENEMY_1, petbm.PetConstants.OWNER_OPPONENT, petIdx)
		else
			_UpdateTab(self, off, petbm.PetConstants.OWNER_OPPONENT, petIdx)
			off = off + 1
		end
	end
end

local function _UpdateTabs(self)
--	log:Debug("_UpdateTabs allyTab [%s] enemyTab [%s]", self.allyTab, self.enemyTab)
	
	local activeAlly = C_PetBattles.GetActivePet(petbm.PetConstants.OWNER_PLAYER)
	local activeEnemy = C_PetBattles.GetActivePet(petbm.PetConstants.OWNER_OPPONENT)
	
	_UpdateAllTabs(self, activeAlly, activeEnemy)
	
	for tabIdx = ALLY_1, ALLY_3 do
		local tab = self.tabs[tabIdx]
		if (self.allyTab == tabIdx) then
			-- activate tab
			tab.background:Show()
		else
			-- deactivate tab
			tab.background:Hide()
		end
	end

	for tabIdx = ENEMY_1, ENEMY_3 do
		local tab = self.tabs[tabIdx]
		if (self.enemyTab == tabIdx) then
			-- activate tab
			tab.background:Show()
		else
			-- deactivate tab
			tab.background:Hide()
		end
	end
end

local function _SwitchTab(frame)
	local self = frame.obj
	if (frame.tab < ENEMY_1) then
		self.allyTab = frame.tab
	else
		self.enemyTab = frame.tab
	end
	_UpdateTabs(self)
end

local function _InitPetTypeFrame(self, parent, width, height)
	local frame = CreateFrame("Frame", nil, parent)
	frame.obj = self
	frame:SetWidth(width or 33)
	frame:SetHeight(height or 33)
	local texture = frame:CreateTexture(nil, "ARTWORK")
	texture:SetAllPoints(frame)
	texture:SetTexCoord(0.79687500, 0.49218750, 0.50390625, 0.65625000)
	frame.icon = texture
	return frame
end

local function _InitPetAbilityBadgeFrame(self, parent, width, height, outline, positive)
	local frame = _InitPetTypeFrame(self, parent, width, height)
	local texture = frame:CreateTexture(nil, "BORDER")
	texture:SetWidth(width + outline)
	texture:SetHeight(height + outline)
	texture:SetPoint("CENTER")
	if (positive) then
		texture:SetTexture("Interface\\Addons\\PetBattleMaster\\resources\\PositiveBadge")
	else
		texture:SetTexture("Interface\\Addons\\PetBattleMaster\\resources\\NegativeBadge")
	end
	return frame
end

local function _InitModifierFrame(self)
	local frame = CreateFrame("Frame", nil, self.frame)
	frame.obj = self
	frame:SetWidth(90)
	frame:SetHeight(115)
	petbm.MovingView.RegisterChildFrame(frame)

	-- name of the selected pet	
	local petName = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	petName:SetJustifyH("LEFT")
	petName:SetWidth(frame:GetWidth() - 10)
	petName:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -8)
	frame.petName = petName
	
	local MOD_OFF = 10
	local MOD_DIST = 10
	
	local healthBar = petbm.HealthBar.New(frame, frame:GetWidth() - 20, 12, true)
	healthBar.frame:SetPoint("TOPLEFT", frame, "TOPLEFT", MOD_OFF, -35)
	frame.healthBar = healthBar
	
	local dealDamagePlusFrame = _InitPetAbilityBadgeFrame(self, frame, 30, 30, 14, true)
	dealDamagePlusFrame:SetPoint("TOPLEFT", healthBar.frame, "BOTTOMLEFT", 0, -15)
	dealDamagePlusFrame.icon:SetTexture("Interface\\PetBattles\\PetIcon-Dragon")
	frame.dealDamagePlusFrame = dealDamagePlusFrame
	
	local dealDamageMinusFrame = _InitPetAbilityBadgeFrame(self, frame, 30, 30, 14, false)
	dealDamageMinusFrame:SetPoint("LEFT", dealDamagePlusFrame, "RIGHT", MOD_DIST, 0)
	dealDamageMinusFrame.icon:SetTexture("Interface\\PetBattles\\PetIcon-Critter")
	frame.dealDamageMinusFrame = dealDamageMinusFrame
	
	local receiveDamageMinusFrame = _InitPetAbilityBadgeFrame(self, frame, 30, 30, 14, true)
	receiveDamageMinusFrame:SetPoint("TOPLEFT", dealDamagePlusFrame, "BOTTOMLEFT", 0, -10)
	receiveDamageMinusFrame.icon:SetTexture("Interface\\PetBattles\\PetIcon-Dragon")
	frame.receiveDamageMinusFrame = receiveDamageMinusFrame
	
	local receiveDamagePlusFrame = _InitPetAbilityBadgeFrame(self, frame, 30, 30, 14, false)
	receiveDamagePlusFrame:SetPoint("LEFT", receiveDamageMinusFrame, "RIGHT", MOD_DIST, 0)
	receiveDamagePlusFrame.icon:SetTexture("Interface\\PetBattles\\PetIcon-Critter")
	frame.receiveDamagePlusFrame = receiveDamagePlusFrame
	
	return frame
end

local function _InitPortraitFrame(self, parent, tab, portraitSize, iconSize, iconOffset)
	local portrait = petbm.PetPortrait.New(parent, nil, tab < ENEMY_1, iconSize, iconOffset)
	portrait.frame:EnableMouse(false)
	return portrait
end

local function _InitTabFrame(self, parent, tab, tabSize, portraitOffset, iconSize, iconOffset)
	local frame = CreateFrame("Button", nil, parent)
	frame:SetWidth(tabSize)
	frame:SetHeight(tabSize)
	frame.obj = self
	frame.tab = tab
	frame:SetScript("OnClick", _SwitchTab)

	local background = frame:CreateTexture(nil, "BACKGROUND")
	background:SetTexture(0.7, 0.7, 1, 0.6)
	background:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -4)
	background:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -4, 4)
	background:Hide()
	frame.background = background
	
	local border = frame:CreateTexture(nil, "ARTWORK")
	border:SetTexture("Interface\\PetBattles\\PetBattleHud")
	border:SetTexCoord(0.8795, 0.953, 0.0725, 0.215)
	border:SetAllPoints(frame)
	frame.border = border
		
	frame.portrait = _InitPortraitFrame(self, frame, tab, portraitSize, iconSize, iconOffset)
	frame.portrait.frame:SetPoint("TOPLEFT", frame, "TOPLEFT", portraitOffset, -portraitOffset)
	frame.portrait.frame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -portraitOffset, portraitOffset)

	self.tabs[tab] = frame
		
	return frame
end

local function _InitFrame(self)
	local frame = CreateFrame("Frame", "petbmInfoView", UIParent, "BackdropTemplate")
	frame.obj = self
	frame:SetWidth(225)
	frame:SetHeight(145)
	frame:SetPoint("RIGHT", UIParent, "RIGHT", -50, 0)
--	frame:SetScript("OnUpdate", function(frame) frame.obj:Update() end)
	frame:SetMovable(true)
	self.frame = frame
	petbm.MovingView.RegisterFrame(frame)
	
	frame:SetBackdrop(BACKDROP)
	frame:SetBackdropColor(unpack(BACKDROP_COLOR))
	frame:SetBackdropBorderColor(unpack(BACKDROP_BORDER_COLOR))
	
	self.tabs = {}
	
	-- ally tabs
	local tab = _InitTabFrame(self, frame, ALLY_1, TAB_SIZE, PORTRAIT_OFFSET, PORTRAIT_ICON_SIZE, PORTRAIT_ICON_OFFSET)
	tab:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 5, 0)

	local tab = _InitTabFrame(self, frame, ALLY_2, SMALL_TAB_SIZE, SMALL_PORTRAIT_OFFSET, SMALL_PORTRAIT_ICON_SIZE, SMALL_PORTRAIT_ICON_OFFSET)
	tab:SetPoint("TOPRIGHT", frame, "TOPLEFT", 2, -4)

	local tab = _InitTabFrame(self, frame, ALLY_3, SMALL_TAB_SIZE, SMALL_PORTRAIT_OFFSET, SMALL_PORTRAIT_ICON_SIZE, SMALL_PORTRAIT_ICON_OFFSET)
	tab:SetPoint("TOP", self.tabs[ALLY_2], "BOTTOM", 0, 0)
	
	-- enemy tabs
	local tab = _InitTabFrame(self, frame, ENEMY_1, TAB_SIZE, PORTRAIT_OFFSET, PORTRAIT_ICON_SIZE, PORTRAIT_ICON_OFFSET)
	tab:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", -5, 0)

	local tab = _InitTabFrame(self, frame, ENEMY_2, SMALL_TAB_SIZE, SMALL_PORTRAIT_OFFSET, SMALL_PORTRAIT_ICON_SIZE, SMALL_PORTRAIT_ICON_OFFSET)
	tab:SetPoint("TOPLEFT", frame, "TOPRIGHT", -2, -4)

	local tab = _InitTabFrame(self, frame, ENEMY_3, SMALL_TAB_SIZE, SMALL_PORTRAIT_OFFSET, SMALL_PORTRAIT_ICON_SIZE, SMALL_PORTRAIT_ICON_OFFSET)
	tab:SetPoint("TOP", self.tabs[ENEMY_2], "BOTTOM", 0, 0)
	
	-- damage modifier frame
	local modifierFrame = _InitModifierFrame(self)
	modifierFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
	self.allyModFrame = modifierFrame
	
	local modifierFrame = _InitModifierFrame(self)
	modifierFrame:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
	self.enemyModFrame = modifierFrame
	
	-- vs. text
	local vsLabel = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	vsLabel:SetJustifyH("CENTER")
	vsLabel:SetWidth(40)
	vsLabel:SetPoint("CENTER", frame, "TOP", 0, -20)
	vsLabel:SetText("Vs.")

	-- health symbol
	local healthTexture = frame:CreateTexture(nil, "ARTWORK")
	healthTexture:SetPoint("CENTER", frame, "TOP", 0, -43)
	healthTexture:SetWidth(25)
	healthTexture:SetHeight(25)
	healthTexture:SetTexture("Interface\\PetBattles\\PetBattle-StatIcons")
	healthTexture:SetTexCoord(0.5, 1.0, 0.5, 1.0)

	-- attack modifier symbol
	local MOD_ICON_SIZE = 50
	local attackTexture = frame:CreateTexture(nil, "ARTWORK")
	attackTexture:SetPoint("TOP", healthTexture, "BOTTOM", 0, 2)
	attackTexture:SetWidth(MOD_ICON_SIZE)
	attackTexture:SetHeight(MOD_ICON_SIZE)
	attackTexture:SetTexture("Interface\\HELPFRAME\\HelpIcon-ItemRestoration")

	-- defense modifier symbol
	local texture = frame:CreateTexture(nil, "ARTWORK")
	texture:SetPoint("TOP", attackTexture, "BOTTOM", 0, 7)
	texture:SetWidth(MOD_ICON_SIZE)
	texture:SetHeight(MOD_ICON_SIZE)
	texture:SetTexture("Interface\\HELPFRAME\\HelpIcon-AccountSecurity")
	
	self.frame:Hide()
end

local function Update(self)
	if (C_PetBattles.IsInBattle()) then
		self.isWild = C_PetBattles.IsWildBattle()
--		log:Debug("Update isWild [%s]", self.isWild)
		_UpdateTabs(self)
	end
end

local function PetChanged(self)
	self.allyTab = ALLY_1
	self.enemyTab = ENEMY_1
	self:Update()
end

local function Open(self)
	self.frame:Show()
	self.frame:RestoreWindowPosition()
end

local function Close(self)
	self.frame:Hide()
end

local function ProfileUpdate(self)
	self.frame:RestoreWindowPosition()
end

local function New()
	local instance = {}
		
	instance.Update = Update
	instance.PetChanged = PetChanged
	instance.Open = Open
	instance.Close = Close
	instance.ProfileUpdate = ProfileUpdate
	
	_InitFrame(instance)
	
--	local tab = _InitTabFrame(instance, UIParent, ALLY_1, TAB_SIZE, PORTRAIT_OFFSET)
--	tab.border:SetVertexColor(0,1,0,1)
--	tab:SetPoint("CENTER")
		
	return instance
end

petbm.PetInfoView.New = New