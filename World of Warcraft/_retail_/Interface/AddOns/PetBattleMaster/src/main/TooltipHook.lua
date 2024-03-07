--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}
   
petbm.TooltipHook = petbm.PetBattleMaster:NewModule("TooltipHook", "AceHook-3.0")
local L = petbm.Locale.GetInstance()

local log = petbm.Debug:new("TooltipHook")

local BACKDROP_COLOR = {0, 0, 0, 1}
local BACKDROP_BORDER_COLOR = {1, 1, 1, 1}
local BACKDROP = {
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", 
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", 
	tile = true, tileSize = 16, edgeSize = 16, 
	insets = { left = 4, right = 4, top = 4, bottom = 4 }
}

local function _ColorizeQuality(text, quality)
	local color = "|C"..select(4, GetItemQualityColor(quality))
	return color..text..FONT_COLOR_CODE_CLOSE;
end

local function _CreateMessage(arg, func)
	local msg
	for k, pet in petbm.PetStable:GetOwnPets() do
		if (func(pet, arg)) then
			if (not msg) then
				msg = L["Owned pet: "]
			else
				msg = msg..", "
			end
			local level = select(3, C_PetJournal.GetPetInfoByPetID(pet.petId)) or "?"
			local qstr = _ColorizeQuality(_G["BATTLE_PET_BREED_QUALITY"..pet.quality], pet.quality - 1)
			msg = msg..qstr..L["TOOLTIP_LEVEL"]:format(level)
		end
	end
	if (msg) then
		return HIGHLIGHT_FONT_COLOR_CODE..msg..FONT_COLOR_CODE_CLOSE
	end
	return ORANGE_FONT_COLOR_CODE..L["Missing pet. Go and catch it!"]..FONT_COLOR_CODE_CLOSE
end

local function OnShow(self, tooltip)
	
	if (self.isShowing or not self.attach) then
		-- avoid self-call
		return
	end
	self.isShowing = true
	
	if (tooltip and tooltip.GetUnit) then
		local name, unit = tooltip:GetUnit()
		if (unit and UnitIsWildBattlePet(unit)) then
			local guid = UnitGUID(unit)
			local creatureId = tonumber(strsub(guid, 6, 10), 16)
			local msg = _CreateMessage(creatureId, function(pet, arg)
				return pet.creatureId == arg
			end)
			tooltip:AddLine(msg)
			tooltip:Show() -- update tooltip
		end
	end
	self.isShowing = nil
end

local function encode(text)
	if (not text) then
		return "nil"
	end
	return gsub(text, "\124", "\124\124")
end

local function OnUpdate(self, tooltip)

	if (tooltip:GetOwner() ~= Minimap or not self.attach) then
		return
    end
    
    -- Minimap integration
    local text = GameTooltipTextLeft1:GetText()
    if (text and text ~= self.minimapText) then
		self.minimapText = string.gsub(text, "([^\n]+)", function(match)
			local prefix = ""
			local idx, _, name = string.find(match, "|t(.*)$")
			if (idx and name) then
				log:Debug("name [%s] len [%s]", name, #name)
				prefix = string.sub(match, 1, idx + 1)
			else
				name = match
			end
			
			if (petbm.PetStable:IsOwnedByName(name)) then
				return prefix.."|TInterface\\RAIDFRAME\\ReadyCheck-Ready:16|t"..name
			elseif (petbm.PetStable:IsKnownByName(name)) then
				return prefix.."|TInterface\\Buttons\\UI-GroupLoot-Dice-Up:16|t"..name
			end
			return match
		end)
		GameTooltipTextLeft1:SetText(self.minimapText)
		tooltip:Show()
    end
end

-- Adds our own frame to the battle pet tooltip
local function _InitBattleTooltipFrame(self, tooltip)
 	local frame = CreateFrame("Frame", nil, tooltip, BackdropTemplateMixin and "BackdropTemplate")
 	frame:SetHeight(50)
    frame:SetPoint("TOPLEFT", tooltip, "BOTTOMLEFT", 0, 3)
    frame:SetPoint("TOPRIGHT", tooltip, "BOTTOMRIGHT", 0, 3)
    frame:SetBackdrop(BACKDROP)
	frame:SetBackdropColor(unpack(BACKDROP_COLOR))
    frame:SetBackdropBorderColor(unpack(BACKDROP_BORDER_COLOR))
    
	local text = frame:CreateFontString("ARTWORK")
    text:SetFontObject(GameTooltipText)
    text:SetPoint("TOPLEFT", frame, 6, -6)
    text:SetWidth(frame:GetWidth())
    text:SetJustifyV("TOP")
    text:SetText("Hello world")
    frame.text = text
    
    return frame
end

local function BattlePetTooltipTemplate_SetBattlePet(self, tooltip)
	if (not self.tooltipFrame) then
		self.tooltipFrame = _InitBattleTooltipFrame(self, tooltip)
	end
	local speciesId = tooltip.speciesID
	if (speciesId and petbm.PetStable:IsSpeciesIdKnown(speciesId)) then
		local msg = _CreateMessage(speciesId, function(pet, arg)
			return pet.speciesId == arg
		end)
		self.tooltipFrame.text:SetText(msg)
		self.tooltipFrame:SetHeight(self.tooltipFrame.text:GetHeight() + 12)
	end
end

local function ApplyConfig(self)
	self.attach = petbm.PetBattleMaster.db.profile.tooltipAttachment
	if (self.attach and not self.hooked) then
		self:SecureHook("BattlePetTooltipTemplate_SetBattlePet")
		self.hooked = true
	elseif (not self.attach and self.hooked) then
		self:Unhook("BattlePetTooltipTemplate_SetBattlePet")
		self.hooked = nil
	end
end
 
local function OnInitialize(self)
end

local function OnEnable(self)
	log:Debug("OnEnable")
	ApplyConfig(self)
	self:SecureHookScript(GameTooltip, "OnShow")
	self:SecureHookScript(GameTooltip, "OnUpdate")
end

petbm.TooltipHook.OnInitialize = OnInitialize
petbm.TooltipHook.OnEnable = OnEnable
petbm.TooltipHook.OnShow = OnShow
petbm.TooltipHook.OnUpdate = OnUpdate
petbm.TooltipHook.BattlePetTooltipTemplate_SetBattlePet = BattlePetTooltipTemplate_SetBattlePet
petbm.TooltipHook.ApplyConfig = ApplyConfig