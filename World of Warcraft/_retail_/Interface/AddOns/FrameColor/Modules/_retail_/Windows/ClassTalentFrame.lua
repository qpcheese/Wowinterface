local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("ClassTalentFrame")
local color1, color2, color3, color4

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["ClassTalentFrame"]
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
    if dbObj.classcolored3 then
        color3 = addonTable.classColor
    else
        color3 = dbObj.color3
    end
    module:RegisterEvent("ADDON_LOADED", function(_, event)
        if event == "Blizzard_ClassTalentUI" then
            self:Recolor(color1, color2, color3, 1)
            module:UnregisterEvent("ADDON_LOADED")
        end
    end)
    if IsAddOnLoaded("Blizzard_ClassTalentUI") then
        self:Recolor(color1, color2, color3, 1)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if IsAddOnLoaded("Blizzard_ClassTalentUI") then
        self:Recolor(color, color, color, 0)
    else
        module:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, color3, desaturation)
    --reskin frames
    addon:SkinNineSliced(ClassTalentFrame, color1, desaturation)
    --reskin tabs
    addon:SkinTabs(ClassTalentFrame, color3)   
    --window specific regions
    --normal
    for _ ,frame in pairs({
        ClassTalentFrame.TalentsTab.WarmodeButton.Ring,
        --ClassTalentFrame.TalentsTab.WarmodeButton.Orb,
        --ClassTalentFrame.TalentsTab.ApplyButton.Middle,
        --ClassTalentFrame.TalentsTab.ApplyButton.Left,
        --ClassTalentFrame.TalentsTab.ApplyButton.Right,
        ClassTalentFrameMiddle,
        ClassTalentFrameLeft,
        ClassTalentFrameRight,
        --ClassTalentFrameButtonNormalTexture,
        ClassTalentFrame.TalentsTab.SearchBox.Middle,
        ClassTalentFrame.TalentsTab.SearchBox.Left,
        ClassTalentFrame.TalentsTab.SearchBox.Right,
        ClassTalentFrame.TalentsTab.SearchPreviewContainer.LeftBorder,
        ClassTalentFrame.TalentsTab.SearchPreviewContainer.RightBorder,
        ClassTalentFrame.TalentsTab.SearchPreviewContainer.BorderAnchor,
        ClassTalentFrame.TalentsTab.SearchPreviewContainer.BotRightCorner,
        ClassTalentFrame.TalentsTab.SearchPreviewContainer.BottomBorder
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    --class
    for _ ,frame in pairs({
        ClassTalentFrameBg,
        ClassTalentFrame.TalentsTab.BottomBar,
        ClassTalentFrame.SpecTab.BlackBG,
        ClassTalentFrame.SpecTab.Background,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin edges
    for _, frame in pairs({
        ClassTalentLoadoutEditDialog,
        ClassTalentLoadoutImportDialog,
        ClassTalentLoadoutCreateDialog,
    }) do
        addon:SkinEdges(frame.Border, color1)
    end    
end


