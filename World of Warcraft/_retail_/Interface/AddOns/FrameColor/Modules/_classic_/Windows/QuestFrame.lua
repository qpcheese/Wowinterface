local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("QuestFrame")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["QuestFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if not QuestFrameDetailPanel.ParchmentFrame then
        QuestFrameDetailPanel.ParchmentFrame = QuestFrameDetailPanel:CreateTexture(nil, "OVERLAY", nil, 1)
        QuestFrameDetailPanel.ParchmentFrame:SetTexture(addonTable.texturePaths.ParchmentFrame)
        QuestFrameDetailPanel.ParchmentFrame:SetAllPoints(QuestDetailScrollFrame)
    end
    if not QuestFrameRewardPanel.ParchmentFrame then
        QuestFrameRewardPanel.ParchmentFrame = QuestFrameRewardPanel:CreateTexture(nil, "OVERLAY", nil, 1)
        QuestFrameRewardPanel.ParchmentFrame:SetTexture(addonTable.texturePaths.ParchmentFrame)
        QuestFrameRewardPanel.ParchmentFrame:SetAllPoints(QuestRewardScrollFrame)
    end
    if not QuestFrameProgressPanel.ParchmentFrame then
        QuestFrameProgressPanel.ParchmentFrame = QuestFrameProgressPanel:CreateTexture(nil, "OVERLAY", nil, 1)
        QuestFrameProgressPanel.ParchmentFrame:SetTexture(addonTable.texturePaths.ParchmentFrame)
        QuestFrameProgressPanel.ParchmentFrame:SetAllPoints(QuestProgressScrollFrame)
    end
    if not QuestFrameGreetingPanel.ParchmentFrame then
        QuestFrameGreetingPanel.ParchmentFrame = QuestFrameGreetingPanel:CreateTexture(nil, "OVERLAY", nil, 1)
        QuestFrameGreetingPanel.ParchmentFrame:SetTexture(addonTable.texturePaths.ParchmentFrame)
        QuestFrameGreetingPanel.ParchmentFrame:SetAllPoints(QuestGreetingScrollChildFrame)
    end
    self:Recolor(color1, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
    for _,frame in pairs({
        QuestFrameDetailPanel,
        QuestFrameRewardPanel,
        QuestFrameProgressPanel,
        QuestFrameGreetingPanel
    }) do
        for _,v in pairs({frame:GetRegions()}) do
            if v:GetObjectType() == "Texture" then
                local drawLayer = v:GetDrawLayer()
                if drawLayer == "BACKGROUND" or drawLayer == "ARTWORK" then
                    v:SetDesaturation(desaturation)
                    v:SetVertexColor(color1.r,color1.g,color1.b)
                end
            end
        end
    end
    for k,v in pairs({
        QuestDetailScrollFrameTop,
        QuestDetailScrollFrameMiddle,
        QuestDetailScrollFrameBottom,
        QuestRewardScrollFrameTop,
        QuestRewardScrollFrameMiddle,
        QuestRewardScrollFrameBottom,
        QuestProgressScrollFrameTop,
        QuestProgressScrollFrameMiddle,
        QuestProgressScrollFrameBottom,
        QuestGreetingScrollFrameTop,
        QuestGreetingScrollFrameMiddle,
        QuestGreetingScrollFrameBottom, 
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
end



