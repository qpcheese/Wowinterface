--[=====[
		## RM Utils library ver. 1.1.2
		## rmUtils-version.lua - Version sub-module
		Code for WoW Version detection logic
--]=====]

local U = LibStub("rmUtils-1.1")

local select = select

local GetBuildInfo = GetBuildInfo
local WOW_PROJECT_ID = WOW_PROJECT_ID
local WOW_PROJECT_CLASSIC = WOW_PROJECT_CLASSIC
local WOW_PROJECT_BURNING_CRUSADE_CLASSIC = WOW_PROJECT_BURNING_CRUSADE_CLASSIC
local WOW_PROJECT_WRATH_CLASSIC = WOW_PROJECT_WRATH_CLASSIC
local WOW_PROJECT_CATACLYSM_CLASSIC = WOW_PROJECT_CATACLYSM_CLASSIC

-- Remove all known globals after this point
-- luacheck: std none

--[[ Classic WoW detection ]]

if WOW_PROJECT_ID and WOW_PROJECT_CLASSIC and WOW_PROJECT_BURNING_CRUSADE_CLASSIC and WOW_PROJECT_WRATH_CLASSIC and WOW_PROJECT_CATACLYSM_CLASSIC then
	U.IsClassicEra = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
	U.IsTBCClassic = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC
	U.IsWrathClassic = WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC
	U.IsCataClassic = WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC
else
	local interfaceVersion = select(4, GetBuildInfo())
	U.IsClassicEra = interfaceVersion < 20000
	U.IsTBCClassic = not U.IsClassicEra and interfaceVersion < 30000
	U.IsWrathClassic = not U.IsTBCClassic and interfaceVersion < 40000
	U.IsCataClassic = not U.IsWrathClassic and interfaceVersion < 50000
end

U.IsClassic = U.IsClassicEra or U.IsTBCClassic or U.IsWrathClassic or U.IsCataClassic
U.IsWoWClassic = U.IsClassic -- legacy name
