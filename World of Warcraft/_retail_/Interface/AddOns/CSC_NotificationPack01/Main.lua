local ADDON_NAME, L = ...

local path = "Interface\\AddOns\\" .. ADDON_NAME .. "\\sounds\\"

local function addSounds()
	if not LibStub then return end
	local LSM = LibStub("LibSharedMedia-3.0")
	if not LSM then return end

	for name, file in pairs(L.sounds) do
		LSM:Register(LSM.MediaType.SOUND, name, path .. file)
	end

	L.sounds = nil
end

--- Avoids creating a frame if LSM is already loaded
if LibStub and LibStub("LibSharedMedia-3.0") then
	addSounds()
else
	local frame = CreateFrame("Frame")
	frame:RegisterEvent("PLAYER_LOGIN")
	frame:SetScript("OnEvent", addSounds)
end
