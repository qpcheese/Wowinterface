local L = BigWigsAPI:GetLocale("BigWigs")
local LSM = LibStub("LibSharedMedia-3.0")

do
	LSM:Register(SOUND, "Marine: Sensitive Zero", "Interface\\AddOns\\BigWigs_Voice_Marine\\sound\\Marine_ZERO.ogg")
end

local heroes = {
	"Marine",
}
local key = "Marine"
local path = "Interface\\AddOns\\BigWigs_Voice_Marine\\sound\\%s_%d.ogg"

for i = 1, #heroes do
	local hero = heroes[i]
	BigWigsAPI:RegisterCountdown(key:format(hero), {
		path:format(hero, 1), 
		path:format(hero, 2),
		path:format(hero, 3),
		path:format(hero, 4),
		path:format(hero, 5),
		path:format(hero, 6),
		path:format(hero, 7),
		path:format(hero, 8),
		path:format(hero, 9),
		path:format(hero, 10),
	})
end

