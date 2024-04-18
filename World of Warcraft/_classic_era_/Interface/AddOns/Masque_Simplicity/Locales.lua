--[[

	This file is part of 'Masque: Simplicity', an add-on for World of Warcraft.
	
	* File...: Masque_Simplicity/Locales.lua
	* Author.: Epix, StormFX
	
]]

-- GLOBALS: GetLocale, setmetatable

local _, Core = ...

----------------------------------------
-- Locales
---

local L = {}

Core.Locale = setmetatable(L, {
	__index = function(self, k)
		self[k] = k
		return k
	end
})

local Locale = GetLocale()

if Locale == "enGB" or Locale == "enUS" then
	-- enUS/enGB for Reference
	--L["A clean skin with a simple vignette."] = "A clean skin with a simple vignette."
	return
--elseif Locale == "deDE" then
--elseif Locale == "esES" or Locale == "esMX" then
elseif Locale == "frFR" then
	L["A clean skin with a simple vignette."] = "Une peau propre avec une simple vignette."
elseif Locale == "itIT" then
	L["A clean skin with a simple vignette."] = "Una pelle pulita con una vignettatura semplice."
--elseif Locale == "koKR" then
--elseif Locale == "ptBR" then
--elseif Locale == "ruRU" then
--elseif Locale == "zhCN" then
elseif Locale == "zhTW" then
	L["A clean skin with a simple vignette."] = "一個乾淨的皮膚，一個簡單的小插曲。"
end
