local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("PlayerSpellsFrame")
local color1, color2, color3, color4

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["PlayerSpellsFrame"]
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
        if event == "Blizzard_PlayerSpells" then
            self:Recolor(color1, color2, color3, 1)
            module:UnregisterEvent("ADDON_LOADED")
        end
    end)
    if C_AddOns.IsAddOnLoaded("Blizzard_PlayerSpells") then
        self:Recolor(color1, color2, color3, 1)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_PlayerSpells") then
        self:Recolor(color, color, color, 0)
    else
        module:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, color3, desaturation)
    --reskin frames
    for _, frame in pairs({
        PlayerSpellsFrame,
        HeroTalentsSelectionDialog
    }) do
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    --reskin tabs
    for _, tab_system in pairs({
        PlayerSpellsFrame.TabSystem,
        PlayerSpellsFrame.SpellBookFrame.CategoryTabSystem,
    }) do
        for _, tab in pairs({ tab_system:GetChildren() }) do 
            for _, texture in pairs({
                tab.Left,
                tab.Middle,
                tab.Right,
            }) do 
                texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a) 
            end
        end
    end
    --window specific regions
    --normal
    for _ ,frame in pairs({
        PlayerSpellsFrame.TalentsFrame.WarmodeButton.Ring,
        --PlayerSpellsFrame.TalentsFrame.WarmodeButton.Orb,
        --PlayerSpellsFrame.TalentsFrame.ApplyButton.Middle,
        --PlayerSpellsFrame.TalentsFrame.ApplyButton.Left,
        --PlayerSpellsFrame.TalentsFrame.ApplyButton.Right,
        PlayerSpellsFrameMiddle,
        PlayerSpellsFrameLeft,
        PlayerSpellsFrameRight,
        --PlayerSpellsFrameButtonNormalTexture,
        PlayerSpellsFrame.TalentsFrame.SearchBox.Middle,
        PlayerSpellsFrame.TalentsFrame.SearchBox.Left,
        PlayerSpellsFrame.TalentsFrame.SearchBox.Right,
        PlayerSpellsFrame.TalentsFrame.SearchPreviewContainer.LeftBorder,
        PlayerSpellsFrame.TalentsFrame.SearchPreviewContainer.RightBorder,
        PlayerSpellsFrame.TalentsFrame.SearchPreviewContainer.BorderAnchor,
        PlayerSpellsFrame.TalentsFrame.SearchPreviewContainer.BotRightCorner,
        PlayerSpellsFrame.TalentsFrame.SearchPreviewContainer.BottomBorder
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    --class
    for _ ,frame in pairs({
        PlayerSpellsFrameBg,
        PlayerSpellsFrame.TalentsFrame.BottomBar,
        PlayerSpellsFrame.SpecFrame.BlackBG,
        PlayerSpellsFrame.SpecFrame.Background,
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


