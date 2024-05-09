local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("GameMenuFrame")
local color1, color2
local bgColor = {}

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["GameMenuFrame"]
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
    bgColor = {r=0.16,g=0.16,b=0.16,a=0.6}
    self:Recolor(color1, color2, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    bgColor = {r=0,g=0,b=0,a=0.6}
    self:Recolor(color, color, 0)
end

function module:Recolor(color1, color2, desaturation)
    for _,texture in pairs({
        GameMenuFrame.Border.TopRightCorner,
        GameMenuFrame.Border.RightEdge,
        GameMenuFrame.Border.BottomRightCorner,
        GameMenuFrame.Border.BottomEdge,
        GameMenuFrame.Border.BottomLeftCorner,
        GameMenuFrame.Border.LeftEdge,
        GameMenuFrame.Border.TopLeftCorner,
        GameMenuFrame.Border.TopEdge,
        GameMenuFrame.Header.CenterBG,
        GameMenuFrame.Header.LeftBG,
        GameMenuFrame.Header.RightBG,
    }) do
        texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    local bg = GameMenuFrame.Border.Bg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetColorTexture(bgColor.r,bgColor.g,bgColor.b,bgColor.a)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    for _,button in pairs({
        GameMenuButtonHelp,
        GameMenuButtonStore,
        GameMenuButtonWhatsNew,
        GameMenuButtonSettings,
        GameMenuButtonEditMode,
        GameMenuButtonMacros,
        GameMenuButtonAddons,
        GameMenuButtonLogout,
        GameMenuButtonQuit,
        GameMenuButtonContinue,
        --GameMenuButtonRatings for korean clients
        GameMenuButtonRatings
    }) do
        if not button then return end
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


