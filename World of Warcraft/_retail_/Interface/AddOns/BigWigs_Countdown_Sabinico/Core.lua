local _, ns = ...
local L = ns.L

local localeMap = {
	-- enUS = "English",
	-- deDE = "Deutsch",
	esES = "Español (es)",
	-- esMX = "Español (mx)",
	-- frFR = "Français",
	-- itIT = "Italiano",
	-- koKR = "한국어",
	-- ptBR = "Português",
	-- ruRU = "Русский",
	-- zhCN = "简体中文",
	-- zhTW = "繁體中文",
}
local locale = GetLocale()
if not localeMap[locale] then
	locale = "esES"
end

local sounds = {
	Pitbull = "Pitbull",
	VexionaAliento = "NYA_Vexiona_Aliento",
}

local lang = localeMap[locale]
local path = "Interface\\AddOns\\BigWigs_Countdown_Sabinico\\"..locale.."\\%s_%d.ogg"

for k, v in next, sounds do
	local id = ("%s: Sabinico: %s"):format(lang, k)
	local name = L.key:format(lang, L[k] or v)
	BigWigsAPI:RegisterCountdown(id, name, {
		path:format(k, 1),
		path:format(k, 2),
		path:format(k, 3),
		path:format(k, 4),
		path:format(k, 5),
	})
end
