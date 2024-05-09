local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("ReadyCheckListenerFrame")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["ReadyCheckListenerFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    self:Recolor(color1, color2, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, 0)
end

function module:Recolor(color1, color2, desaturation)
    --reskin frame 
    addon:SkinNineSliced(ReadyCheckListenerFrame, color1, desaturation)
end


