--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}

petbm.PetUtil = {}

local log = petbm.Debug:new("PetUtil")

local DEAL_DAMAGE_PLUS = 1
local DEAL_DAMAGE_MINUS = 2
local RECEIVE_DAMAGE_PLUS = 3
local RECEIVE_DAMAGE_MINUS = 4

local HUMANOID = petbm.PetConstants.HUMANOID
local DRAGON = petbm.PetConstants.DRAGON
local FLYING = petbm.PetConstants.FLYING
local UNDEAD = petbm.PetConstants.UNDEAD
local CRITTER = petbm.PetConstants.CRITTER
local MAGICAL = petbm.PetConstants.MAGICAL
local ELEMENTAL = petbm.PetConstants.ELEMENTAL
local BEAST = petbm.PetConstants.BEAST
local WATER = petbm.PetConstants.WATER
local MECHANICAL = petbm.PetConstants.MECHANICAL

local MODIFIER_TABLE = {
	{DRAGON, BEAST, UNDEAD, CRITTER}, -- HUMANOID
	{MAGICAL, UNDEAD, HUMANOID, FLYING}, -- DRAGON
	{WATER, DRAGON, MAGICAL, BEAST}, -- FLYING
	{HUMANOID, WATER, CRITTER, DRAGON}, -- UNDEAD
	{UNDEAD, HUMANOID, BEAST, ELEMENTAL}, -- CRITTER
	{FLYING, MECHANICAL, DRAGON, WATER}, -- MAGICAL
	{MECHANICAL, CRITTER, WATER, MECHANICAL}, -- ELEMENTAL
	{CRITTER, FLYING, MECHANICAL, HUMANOID}, -- BEAST
	{ELEMENTAL, MAGICAL, FLYING, UNDEAD}, -- WATER
	{BEAST, ELEMENTAL, ELEMENTAL, MAGICAL} -- MECHANICAL
}

-- Returns dealDmgPlus, dealDmgMinus, receiveDmgPlus, receiveDmgMinus for the given pet type.
-- The modifiers will contain the target pet type. 
local function GetDamageModifiers(petType)
	return unpack(MODIFIER_TABLE[petType])
end

petbm.PetUtil.GetDamageModifiers = GetDamageModifiers
