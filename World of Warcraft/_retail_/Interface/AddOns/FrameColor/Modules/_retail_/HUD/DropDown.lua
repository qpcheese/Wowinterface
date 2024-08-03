local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("DropDown")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["HUD"]["DropDown"]
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
        DropDownList1MenuBackdrop,
        DropDownList2MenuBackdrop,
        DropDownList3MenuBackdrop
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    for _,frame in pairs({
        DropDownList1Backdrop,
        DropDownList2Backdrop,
        DropDownList3Backdrop
    }) do 
        addon:SkinEdges(frame, color1)
    end
end


