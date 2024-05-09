local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("Tooltips")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["HUD"]["Tooltips"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    self:Recolor(color1, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
    --reskin frames
    for _,frame in pairs({
        GameTooltip,
        ItemRefTooltip
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
end


