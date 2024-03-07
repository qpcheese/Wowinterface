--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}

petbm.CatchIndicator = {}

local L = petbm.Locale.GetInstance()
local log = petbm.Debug:new("CatchIndicator")

local RED = {r = 1, g = 0, b = 0}
local HIGHLIGHT = {r = 248/255, g = 236/255, b = 160/255}

local HIGHLIGHT_OFF = 0.75

local function _GetOwnQualityAndLevel(enemySpeciesId)
	local quality
	local level
	for k,pet in petbm.PetStable:GetOwnPets() do
		if (enemySpeciesId == pet.speciesId) then
			if (not quality or pet.quality > quality or (pet.quality == quality and pet.level > level)) then
				quality = pet.quality
				level = pet.level
			end
		end
	end
	return quality, level
end

local function SetPetIndex(self, petIndex)
	local show = false
	if (petIndex) then
		local quality = C_PetBattles.GetBreedQuality(petbm.PetConstants.OWNER_OPPONENT, petIndex)
		local speciesId = C_PetBattles.GetPetSpeciesID(petbm.PetConstants.OWNER_OPPONENT, petIndex)
		local level = C_PetBattles.GetLevel(petbm.PetConstants.OWNER_OPPONENT, petIndex)
		if (quality and speciesId and level and petbm.PetStable:IsSpeciesIdKnown(speciesId)) then
			local isMissing = true
			local ownQuality, ownLevel = _GetOwnQualityAndLevel(speciesId)
			if (ownQuality and ownLevel) then
				if (quality < ownQuality) then
					isMissing = false
				elseif (quality == ownQuality) then
					-- info from http://www.wowwiki.com/Pet_Battle_System
					isMissing = level > ownLevel and 
						( (level < 16) or (level < 21 and level > (ownLevel + 1) ) or (level > (ownLevel + 2) ))
				end
			end
			log:Debug("isMissing [%s] petIndex [%s] level [%s] quality [%s] ownLevel [%s] ownQuality [%s]", isMissing, petIndex, level, quality, ownLevel, ownQuality)
			if (isMissing) then
				local tooltipText
				local tooltipHeader = L["Catch indicator (%s %s)"]:format(level, _G["BATTLE_PET_BREED_QUALITY"..quality])
				if (ownLevel and ownQuality) then
					self.needIcon:Hide()
					self.ownLevel:SetText(ownLevel)
					tooltipText = L["You own this pet with level %s and quality %s"]:format(ownLevel, _G["BATTLE_PET_BREED_QUALITY"..ownQuality])
				else
					self.needIcon:Show()
					tooltipText = L["You are missing this pet!"]
				end
				petbm.WidgetUtil.AddTooltip(self.frame, tooltipHeader, tooltipText)
				local color = ITEM_QUALITY_COLORS[ (ownQuality or 2) - 1]
				self.ownLevelBack:SetVertexColor(color.r, color.g, color.b, 1)
				show = true
			end
		end
	end
	log:Debug("CatchIndicator petIndex [%s] show [%s] quality [%s]", petIndex, show, quality)
	if (show) then
		self.frame:Show()
	else
		self.frame:Hide()
	end
end

local function _InitFrame(self, parent, size)
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetWidth(size)
	frame:SetHeight(size)
	frame.obj = self
	frame:Hide()
	self.frame = frame

	-- own level/quality
	local ownLevelBack = frame:CreateTexture(nil, "BORDER", "MainPet-LevelBubble")
	ownLevelBack:SetAllPoints(frame)
	self.ownLevelBack = ownLevelBack
	
	local ownLevel = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	ownLevel:SetJustifyH("CENTER")
	ownLevel:SetPoint("CENTER", ownLevelBack, "CENTER", 0, 0)
	self.ownLevel = ownLevel

	local needIcon = frame:CreateTexture(nil, "OVERLAY")
	needIcon:SetTexture("Interface\\Buttons\\UI-GroupLoot-Dice-Up")
	needIcon:SetPoint("TOPLEFT", 2, -2)
	needIcon:SetPoint("BOTTOMRIGHT", -2, 2)
	self.needIcon = needIcon
	
end

local function New(parent, size)
	local instance = {}
		
	instance.SetPetIndex = SetPetIndex
	
	_InitFrame(instance, parent, size)
	
	return instance
end

petbm.CatchIndicator.New = New