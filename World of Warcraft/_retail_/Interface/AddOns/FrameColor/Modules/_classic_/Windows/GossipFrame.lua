local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("GossipFrame")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["GossipFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if not GossipFrame.ParchmentFrame then
        GossipFrame.ParchmentFrame = GossipFrame.GreetingPanel:CreateTexture(nil, "BACKGROUND", nil, 1)
        GossipFrame.ParchmentFrame:SetTexture(addonTable.texturePaths.ParchmentFrame)
        GossipFrame.ParchmentFrame:SetAllPoints(GossipFrame.GreetingPanel.ScrollBox)
        GossipFrame.ParchmentFrame:SetPoint("BOTTOM", GossipFrame, "BOTTOM", 0,95)
    end
    self:Recolor(color1, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
    for _,v in pairs({GossipFrame.GreetingPanel:GetRegions()}) do
        if v:GetObjectType() == "Texture" then
            if v ~= GossipFrame.ParchmentFrame then
                v:SetDesaturation(desaturation)
                v:SetVertexColor(color1.r,color1.g,color1.b)
            end
        end
    end
    for k,v in pairs({
        GossipFrame.GreetingPanel.ScrollBar.Background.Begin,
        GossipFrame.GreetingPanel.ScrollBar.Background.Middle,
        GossipFrame.GreetingPanel.ScrollBar.Background.End,
        GossipFrameMaterialBotLeft
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
end


