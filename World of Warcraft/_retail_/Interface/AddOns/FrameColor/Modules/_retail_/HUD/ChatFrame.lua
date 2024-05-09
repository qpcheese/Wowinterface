local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("ChatFrame")
local color1, color4

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
    self:Recolor(color1, color4, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, 0)
end

function module:Recolor(color1, color4, desaturation)
    --recolor frames
    for _ ,v in pairs({
        ChatFrame1EditBoxLeft,
        ChatFrame1EditBoxRight,
        ChatFrame1EditBoxMid,
        QuickJoinToastButton.FriendsButton,
    }) do 
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    addon:SkinTextures("ChatFrame1ButtonFrame",color1)
    for i=1, NUM_CHAT_WINDOWS do
        --borders
        addon:SkinTextures("ChatFrame"..i, color1)
        --scrollbars
        local scrollframe = _G["ChatFrame"..i]
        addon:SkinScrollBar(scrollframe, color4)
        for _, v in pairs({ scrollframe.ScrollToBottomButton:GetRegions() }) do 
            v:SetDesaturation(desaturation)
            v:SetVertexColor(color4.r,color4.g,color4.b,color4.a)
        end
        scrollframe.ScrollToBottomButton.Flash:SetDesaturation(desaturation)
        scrollframe.ScrollToBottomButton.Flash:SetVertexColor(color4.r,color4.g,color4.b,color4.a)
        --button frames
        addon:SkinTextures("ChatFrame"..i.."ButtonFrame", color1)
        --chat tabs
        addon:SkinTabs(_G["ChatFrame"..i.."Tab"], color1)
    end 
    for _, v in pairs({ ChatFrameMenuButton:GetRegions() }) do 
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    for _, v in pairs({ ChatFrameChannelButton:GetRegions() }) do 
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end

end


