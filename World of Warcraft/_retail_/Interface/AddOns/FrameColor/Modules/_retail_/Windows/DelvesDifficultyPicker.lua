local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("DelvesDifficultyPicker")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["DelvesDifficultyPicker"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if C_AddOns.IsAddOnLoaded("Blizzard_DelvesDifficultyPicker") then
        self:Recolor(color1, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_DelvesDifficultyPicker" then
                self:Recolor(color1, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_DelvesDifficultyPicker") then
        self:Recolor(color, 0)
    else
        module:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, desaturation)
    --reskin frames
    for _,frame in pairs({
        DelvesDifficultyPickerFrame,
    })
    do 
        addon:SkinEdges(frame.Border, color1)
    end
end


