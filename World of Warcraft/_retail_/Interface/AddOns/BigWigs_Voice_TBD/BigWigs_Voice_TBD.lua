local L = BigWigsAPI:GetLocale("BigWigs")

local heroes = {
	"TBD",
}
local key = "TBD"
local path = "Interface\\AddOns\\BigWigs_Voice_TBD\\sound\\%s_%d.ogg"

for i = 1, #heroes do
	local hero = heroes[i]
	BigWigsAPI:RegisterCountdown(key:format(hero), {
		path:format(hero, 1), 
		path:format(hero, 2),
		path:format(hero, 3),
		path:format(hero, 4),
		path:format(hero, 5),
	})
end

