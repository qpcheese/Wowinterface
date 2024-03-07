--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}

petbm.PetPortrait = {}

local L = petbm.Locale.GetInstance()
local log = petbm.Debug:new("PetPortrait")
local nextId = 0
local UNKNOWN_PET_LEVEL = "??"
local UNKNOWN_PET_ICON = "Interface\\Icons\\INV_Misc_QuestionMark"
local UNKNOWN_PET_TYPE_ICON = "Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[1]

local function _NextName()
	local id = nextId
	nextId = nextId + 1
	return "petbmPetPortrait"..id
end

local function _UpdateFrame(self, icon, level, petTypeIcon)
	--log:Debug("_UpdateFrame icon [%s] level [%s] petTypeIcon [%s]", icon, level, petType)
	self.frame:SetNormalTexture(icon)
	self.frame.level:SetText(level)
	self.frame.petType:SetTexture(petTypeIcon)
end

local function PetIconForPetType(petType)
	if not petType then
	    return UNKNOWN_PET_TYPE_ICON
	else
	    return "Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[petType]
	end
end

-- Update the pet information according to the petIndex and petOwner. 
-- Returns petType, name, level, health, maxHealth, quality, icon or nil
local function Update(self, petOwner, petIndex)
	if (not petOwner or not petIndex) then
		return
	end
	
	if (petIndex > C_PetBattles.GetNumPets(petOwner)) then
		return
	end
	
	local icon = C_PetBattles.GetIcon(petOwner, petIndex)
	local level = C_PetBattles.GetLevel(petOwner, petIndex)
	local petType = C_PetBattles.GetPetType(petOwner, petIndex)
	local quality = C_PetBattles.GetBreedQuality(petOwner, petIndex)
	local health = C_PetBattles.GetHealth(petOwner, petIndex)
	local maxHealth = C_PetBattles.GetMaxHealth(petOwner, petIndex)
	local name = C_PetBattles.GetName(petOwner, petIndex)

	_UpdateFrame(self, icon, level, PetIconForPetType(petType))		
	local isWild = C_PetBattles.IsWildBattle()
	if (petOwner == petbm.PetConstants.OWNER_OPPONENT and isWild == true) then
		self.frame.catchIndicator:SetPetIndex(petIndex)
	else
		self.frame.catchIndicator:SetPetIndex(nil)
	end

	return petType, name, level, health, maxHealth, quality, icon
end

-- Update the pet information according to the petId 
-- Returns nothing
local function UpdateByPetId(self, petId)
	self.petId = petId
	if (not petId) then
		return
	end
	local speciesID, customName, level, xp, maxXp, displayID, isFavorite, name, icon, petType, creatureId = C_PetJournal.GetPetInfoByPetID(petId)
	if (not (icon and level and petType)) then
		petTypeIcon = UNKNOWN_PET_TYPE_ICON
		icon = UNKNOWN_PET_ICON
		level = UNKNOWN_PET_LEVEL
	else
		petTypeIcon = PetIconForPetType(petType)
	end

	_UpdateFrame(self, icon, level, petTypeIcon)
end

local function _InitFrame(self, parent, size, isLeft, iconSize, iconOffset)
	local frame = CreateFrame("Button", _NextName(), parent)
	if (size and size > 0) then
		frame:SetWidth(size)
		frame:SetHeight(size)
	end
--	frame:EnableMouse(false)
	frame.obj = self
	frame.tab = tab
	frame:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
	self.frame = frame
	
	-- background
--	local texture = frame:CreateTexture(nil, "BORDER")
--	texture:SetAllPoints(frame)
--	texture:SetTexture("Interface\\PetBattles\\PetJournal")
--	texture:SetTexCoord(0.41992188, 0.52343750, 0.02246094, 0.07519531)
	
	-- portrait icon
--	local icon = frame:CreateTexture(nil, "BACKGROUND")
--	icon:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
--	icon:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
--	if (not isLeft) then
--		icon:SetTexCoord(0, 1, 0, 1)
--	end
--	frame.icon = icon
	
	-- level
	local levelBack = frame:CreateTexture(nil, "OVERLAY", "MainPet-LevelBubble")
	levelBack:SetWidth(iconSize)
	levelBack:SetHeight(iconSize)
	levelBack:ClearAllPoints()
	levelBack:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", iconOffset, -iconOffset)

	local level = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	level:SetJustifyH("CENTER")
	level:SetPoint("CENTER", levelBack, "CENTER", 0, 0)
	level:SetText(UNKOWN_PET_LEVEL)
	frame.level = level

	-- type
	local typeBack = frame:CreateTexture(nil, "OVERLAY")
	typeBack:SetWidth(iconSize)
	typeBack:SetHeight(iconSize)
	typeBack:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", -iconOffset, -iconOffset)
	typeBack:SetTexCoord(0.79687500, 0.49218750, 0.50390625, 0.65625000)
	typeBack:SetTexture(UNKNOWN_PET_TYPE_ICON)
	frame.petType = typeBack

	local catchIndicator = petbm.CatchIndicator.New(frame, iconSize)
	catchIndicator.frame:SetPoint("TOPRIGHT", frame, "TOPRIGHT", iconOffset, iconOffset)
	catchIndicator.frame:Hide()
	frame.catchIndicator = catchIndicator
end

local function New(parent, size, isLeft, iconSize, iconOffset)
	local instance = {}
		
	instance.Update = Update
	instance.UpdateByPetId = UpdateByPetId
	
	_InitFrame(instance, parent, size, isLeft, iconSize, iconOffset)
	
	return instance
end

petbm.PetPortrait.New = New