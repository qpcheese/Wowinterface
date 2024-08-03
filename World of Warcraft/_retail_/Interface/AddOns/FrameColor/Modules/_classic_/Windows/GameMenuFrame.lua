local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("GameMenuFrame")
local color1


function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["GameMenuFrame"]
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
    for _,texture in pairs({
        GameMenuFrame.TopRightCorner,
        GameMenuFrame.RightEdge,
        GameMenuFrame.BottomRightCorner,
        GameMenuFrame.BottomEdge,
        GameMenuFrame.BottomLeftCorner,
        GameMenuFrame.LeftEdge,
        GameMenuFrame.TopLeftCorner,
        GameMenuFrame.TopEdge,
        GameMenuFrameHeader
    }) do
        texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    for _,button in pairs({
        GameMenuButtonHelp,
        GameMenuButtonStore,
        GameMenuButtonOptions,
        GameMenuButtonMacros,
        GameMenuButtonAddons,
        GameMenuButtonLogout,
        GameMenuButtonQuit,
        GameMenuButtonContinue,
        --GameMenuButtonRatings for korean clients
        GameMenuButtonRatings
    }) do
        for _, texture in pairs({
            button.Left,
            button.Middle,
            button.Right
        }) do
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end
end


