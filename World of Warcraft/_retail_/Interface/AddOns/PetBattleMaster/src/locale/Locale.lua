--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}
petbm.Locale = {}

--[[
	Returns a handle for localizating messages. This will
	decouple from the concrete implementation.
--]]
function petbm.Locale.GetInstance()
	return LibStub("AceLocale-3.0"):GetLocale("PetBattleMaster", true)
end
