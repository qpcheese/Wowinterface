local L = BigWigsAPI:GetLocale("BigWigs")
local LSM = LibStub("LibSharedMedia-3.0")

do
	LSM:Register(SOUND, "Pippa: Go", "Interface\\AddOns\\BigWigs_Voice_PipkinPippa\\sound\\PipkinPippa_Go.ogg")
	LSM:Register(SOUND, "Pippa: KYS", "Interface\\AddOns\\BigWigs_Voice_PipkinPippa\\sound\\PipkinPippa_KYS.ogg")
end

local heroes = {
	"PipkinPippa",
}
local key = "PipkinPippa"
local path = "Interface\\AddOns\\BigWigs_Voice_PipkinPippa\\sound\\%s_%d.ogg"

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

