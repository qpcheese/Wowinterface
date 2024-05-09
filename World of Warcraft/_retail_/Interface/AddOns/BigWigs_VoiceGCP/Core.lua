local _, addon = ...
addon.SendMessage = BigWigsLoader.SendMessage
local SOUND_TEMPLATE = "Interface\\AddOns\\BigWigs_VoiceGCP\\Sounds\\%s.ogg"
local SOUND_TEMPLATE_SELF = "Interface\\AddOns\\BigWigs_VoiceGCP\\Sounds\\%sy.ogg"
local function handler(_, module, key, sound, isOnMe)
    local success = PlaySoundFile(
        format(
            isOnMe and SOUND_TEMPLATE_SELF or SOUND_TEMPLATE,
            tostring(key)
        ),
        "Master"
    )
    if not success then
        addon.SendMessage("BigWigs_Sound", module, key, sound)
    end
end
BigWigsLoader.RegisterMessage(addon, "BigWigs_Voice", handler)
BigWigsAPI.RegisterVoicePack("temp")
