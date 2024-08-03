local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("AddonList")
local color1, color2

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["AddonList"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if dbObj.classcolored2 then
        color2 = addonTable.classColor
    else
        color2 = dbObj.color2
    end
    self:Recolor(color1, color2, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color,  0)
end

function module:Recolor(color1, color2, desaturation)
    for k,v in pairs({
        AddonListTopBorder,
        AddonListTopRightCorner,
        AddonListRightBorder,
        AddonListBotRightCorner,
        AddonListBtnCornerRight,
        AddonListBotLeftCorner,
        AddonListBtnCornerLeft,
        AddonListLeftBorder,
        AddonListTopLeftCorner,
        AddonListBottomBorder,
        AddonListButtonBottomBorder,

        AddonListInsetInsetTopBorder,
        AddonListInsetInsetTopRightCorner,
        AddonListInsetInsetRightBorder,
        AddonListInsetInsetBotRightCorner,
        AddonListInsetInsetBottomBorder,
        AddonListInsetInsetBotLeftCorner,
        AddonListInsetInsetLeftBorder,

        AddonListEnableAllButton_RightSeparator,
        AddonListDisableAllButton_RightSeparator,
        AddonListOkayButton_LeftSeparator,
        AddonListCancelButton_LeftSeparator,

        AddonCharacterDropDownLeft,
        AddonCharacterDropDownMiddle,
        AddonCharacterDropDownRight,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    local bg = AddonListBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
end


