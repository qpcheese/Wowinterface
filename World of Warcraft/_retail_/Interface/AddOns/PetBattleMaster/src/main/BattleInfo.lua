--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}
   
petbm.BattleInfo = petbm.PetBattleMaster:NewModule("BattleInfo", "AceEvent-3.0")
local L = petbm.Locale.GetInstance()

local log = petbm.Debug:new("BattleInfo")

local ACTIVE_ICON_SIZE = 24
local ICON_SIZE = 18

local function _UpdatePets(self)
	log:Debug("_UpdatePets")
	local n = C_PetBattles.GetNumPets(petbm.PetConstants.OWNER_OPPONENT)
	for i=1,n do
		local enemy = self.enemies[i]
		if (self.showCatchIndicator) then
			local petIndex = enemy.frame.petIndex
			enemy.catchIndicator:SetPetIndex(petIndex)
		else
			enemy.catchIndicator:SetPetIndex(nil)
		end
	end
end

local function _InitFrame(self)
	self.enemies = {}
	for i=1,3 do
		local enemy = {}
		self.enemies[i] = enemy
		
		local parent = PetBattleFrame.ActiveEnemy
		local size = ACTIVE_ICON_SIZE
		if (i == 2) then
			parent = PetBattleFrame.Enemy2
			size = ICON_SIZE
		elseif (i == 3) then
			parent = PetBattleFrame.Enemy3
			size = ICON_SIZE
		end
		enemy.frame = parent
		enemy.catchIndicator = petbm.CatchIndicator.New(parent, size)
		enemy.catchIndicator.frame:SetPoint("TOPRIGHT", parent, "TOPRIGHT", 3, 3)
	end	
end

local function PET_BATTLE_PET_CHANGED(self)
	log:Debug("PET_BATTLE_PET_CHANGED")
	_UpdatePets(self)
end

local function PETS_UPDATED(self)
	log:Debug("PETS_UPDATED")
	if (C_PetBattles.IsInBattle()) then
		_UpdatePets(self)
	end
end

local function PET_BATTLE_CLOSE(self)
	log:Debug("PET_BATTLE_CLOSE")
	-- hide all indicators
	for i=1,3 do
		local enemy = self.enemies[i]
		enemy.catchIndicator:SetPetIndex(nil)
	end
end

local function ApplyConfig(self)
	self.showCatchIndicator = petbm.PetBattleMaster.db.profile.showCatchIndicator
end

local function OnInitialize(self)
	log:Debug("OnInitialize")
end

local function OnEnable(self)
	log:Debug("OnEnable")
	_InitFrame(self)
	self:RegisterEvent("PET_BATTLE_PET_CHANGED")
	self:RegisterEvent("PET_BATTLE_CLOSE")
	self:RegisterMessage("PETS_UPDATED")
	self:ApplyConfig()
end

petbm.BattleInfo.OnInitialize = OnInitialize
petbm.BattleInfo.OnEnable = OnEnable
petbm.BattleInfo.ApplyConfig = ApplyConfig
petbm.BattleInfo.PET_BATTLE_PET_CHANGED = PET_BATTLE_PET_CHANGED
petbm.BattleInfo.PETS_UPDATED = PETS_UPDATED
petbm.BattleInfo.PET_BATTLE_CLOSE = PET_BATTLE_CLOSE