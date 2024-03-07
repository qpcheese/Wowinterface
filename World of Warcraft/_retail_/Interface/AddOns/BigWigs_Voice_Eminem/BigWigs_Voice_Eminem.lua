local L = BigWigsAPI:GetLocale("BigWigs")
local LSM = LibStub("LibSharedMedia-3.0")

do
	LSM:Register(SOUND, "Eminem: Blast", "Interface\\AddOns\\BigWigs_Voice_Eminem\\sound\\Eminem_Blast.ogg")
	LSM:Register(SOUND, "Eminem: Lets Go", "Interface\\AddOns\\BigWigs_Voice_Eminem\\sound\\Eminem_Lets_Go.ogg")
end


local heroes = {
	"Eminem",
}
local key = "Eminem"
local path = "Interface\\AddOns\\BigWigs_Voice_Eminem\\sound\\%s_%d.ogg"

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

