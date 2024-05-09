local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("ChatFrame")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["HUD"]["ChatFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if dbObj.classcolored4 then
        color4 = addonTable.classColor
    else
        color4 = dbObj.color4
    end
    self:Recolor(color1, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
    for _,button in pairs({
        ChatFrameChannelButton,
        ChatFrameMenuButton,
    }) do
        local texture = button:GetNormalTexture()
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color1.r,color1.g,color1.b)
    end
    for i=1, NUM_CHAT_WINDOWS do
        for k,v in pairs({
            _G["ChatFrame" ..i.. "TabLeft"],
            _G["ChatFrame" ..i.. "TabMiddle"],
            _G["ChatFrame" ..i.. "TabRight"],
            _G["ChatFrame" ..i.. "EditBoxLeft"],
            _G["ChatFrame" ..i.. "EditBoxMid"],
            _G["ChatFrame" ..i.. "EditBoxRight"],
            _G["ChatFrame" ..i.. "ResizeButton"]:GetNormalTexture(),
            _G["ChatFrame" ..i.. "ButtonFrameUpButton"]:GetNormalTexture(),
            _G["ChatFrame" ..i.. "ButtonFrameDownButton"]:GetNormalTexture(),
            _G["ChatFrame" ..i.. "ButtonFrameBottomButton"]:GetNormalTexture(),
        }) do
            v:SetDesaturation(desaturation)
            v:SetVertexColor(color1.r,color1.g,color1.b)
        end
    end 
    for _,texture in pairs({
        ChatConfigFrame.TopRightCorner,
        ChatConfigFrame.RightEdge,
        ChatConfigFrame.BottomRightCorner,
        ChatConfigFrame.BottomEdge,
        ChatConfigFrame.BottomLeftCorner,
        ChatConfigFrame.LeftEdge,
        ChatConfigFrame.TopLeftCorner,
        ChatConfigFrame.TopEdge,
        ChatConfigFrameHeader
    }) do
        texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end


