local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("ProfessionsBookFrame")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["ProfessionsBookFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    module:RegisterEvent("ADDON_LOADED", function(_, event)
        if event == "Blizzard_ProfessionsBook" then
            self:Recolor(color1, 1)
            module:UnregisterEvent("ADDON_LOADED")
        end
    end)
    if C_AddOns.IsAddOnLoaded("Blizzard_ProfessionsBook") then
        self:Recolor(color1, 1)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_ProfessionsBook") then
        self:Recolor(color, 0)
    else
        module:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, desaturation)
    --reskin frames
    for _,frame in pairs({
        ProfessionsBookFrame,
        ProfessionsBookFrameInset,
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
end


