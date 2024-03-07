--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}
   
petbm.PetStable = petbm.PetBattleMaster:NewModule("PetStable", "AceEvent-3.0")
local L = petbm.Locale.GetInstance()
local LibPetJournal = LibStub("LibPetJournal-2.0")
local log = petbm.Debug:new("PetStable")

local IS_WILD = false -- WTF why is it false ?!

local function PetsUpdated(self)
	log:Debug("PetsUpdated")
	
	local pets = wipe(self.pets)
	local knownByName = wipe(self.knownByName)
	local ownedByName = wipe(self.ownedByName)
	local speciesIds = wipe(self.speciesIds)
	
	for i,petId in LibPetJournal:IteratePetIDs() do
        local speciesId, customName, level, xp, maxXp, displayID, isFavorite, name, icon,
            petType, creatureId = C_PetJournal.GetPetInfoByPetID(petId)
        local quality = select(5, C_PetJournal.GetPetStats(petId)) or 1
        local abilityIds, abilityLevels = C_PetJournal.GetPetAbilityList(speciesId)
       	tinsert(pets, {petId = petId, speciesId = speciesId, quality = quality, creatureId = creatureId, level = level, name = name, abilityIds = abilityIds, abilityLevels = abilityLevels})
       	ownedByName[name] = true
    end
    
    local numPets = 0
    for i,speciesId in LibPetJournal:IterateSpeciesIDs() do
    	speciesIds[speciesId] = true
    	local name = C_PetJournal.GetPetInfoBySpeciesID(speciesId)
    	knownByName[name] = true 
    	numPets = numPets + 1
	end
	
	log:Debug("PetsUpdated exit with [%s] pets and [%s] speciesIds", #pets, numPets)
	self:SendMessage("PETS_UPDATED")
end

local function GetOwnPets(self)
	return ipairs(self.pets)
end

local function IsSpeciesIdKnown(self, speciesId)
	return self.speciesIds[speciesId]
end

local function IsKnownByName(self, name)
	return self.knownByName[name]
end

local function IsOwnedByName(self, name)
	return self.ownedByName[name]
end

-- Find all stable pets, matching the given team pet. May be used if the petId
-- has been changed by Blizzard. Returns a list of stable pets.
local function FindMatches(self, pet)
	local rtn = {}
	local abilityIds = pet.abilities
	if (abilityIds) then
		for spi, stablePet in self:GetOwnPets() do
			-- check abilities
			local matches = 0
			for i=1,3 do
				if (abilityIds[i] == stablePet.abilityIds[i] or abilityIds[i] == stablePet.abilityIds[i + 3]) then
					matches = matches + 1
				end
			end
			if (matches == 3) then				
				tinsert(rtn, stablePet)	
			end	
		end
	end
	return rtn	
end

-- Finds the most appropriate matching petId for the given pet entry. 
-- Will be used for repairing teams, when the petId is no longer valid.
local function FindMatch(self, pet)
    log:Debug("FindMatch name [%s] speciesId [%s] creatureId [%s]", pet.name, pet.speciedId, pet.creatureId)
	local rtn
	local maxLevel = 0
	local abilityIds = pet.abilities
	if (abilityIds) then
		for spi, stablePet in self:GetOwnPets() do
			local matches = 0
			for i=1,3 do
				if (abilityIds[i] == stablePet.abilityIds[i] or abilityIds[i] == stablePet.abilityIds[i + 3]) then
					matches = matches + 1
				end
			end
			if (matches == 3) then
				if (stablePet.level > maxLevel) then
					-- check name and other stuff, if available
					if  ( (not pet.level or pet.level <= stablePet.level) and
					(not pet.name or pet.name == stablePet.name) and
					(not pet.speciesId or pet.speciesId == stablePet.speciesId) and
					(not pet.creatureId or pet.creatureId == stablePet.creatureId) ) then
						rtn = stablePet.petId
						maxLevel = stablePet.level
					end							
				end
			end	
		end
	end
	return rtn	
end
local function OnInitialize(self)
	self.pets = {}
	self.knownByName = {}
	self.ownedByName = {}
	self.rarityCache = {}
	self.petTypes = {}
	self.petSources = {}
	self.flags = {}
	self.speciesIds = {}
	LibPetJournal.RegisterCallback(petbm.PetStable, "PetListUpdated", "PetsUpdated")
end

petbm.PetStable.OnInitialize = OnInitialize
petbm.PetStable.OnEnable = OnEnable
petbm.PetStable.FindMatch = FindMatch
petbm.PetStable.FindMatches = FindMatches
petbm.PetStable.GetOwnPets = GetOwnPets
petbm.PetStable.PetsUpdated = PetsUpdated
petbm.PetStable.IsSpeciesIdKnown = IsSpeciesIdKnown
petbm.PetStable.IsKnownByName = IsKnownByName
petbm.PetStable.IsOwnedByName = IsOwnedByName