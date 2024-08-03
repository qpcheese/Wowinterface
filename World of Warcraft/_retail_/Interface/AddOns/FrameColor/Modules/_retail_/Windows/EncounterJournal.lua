local _, addonTable = ...
local addon = addonTable.addon

local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("EncounterJournal")
local color1, color2, color3, color4

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["EncounterJournal"]
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
    if dbObj.classcolored4 then
        color4 = addonTable.classColor
    else
        color4 = dbObj.color4
    end
    module:RegisterEvent("ADDON_LOADED", function(_, event)
        if event == "Blizzard_EncounterJournal" then
            self:Recolor(color1, color2, color3, color4, 1)
            module:UnregisterEvent("ADDON_LOADED")
        end
    end)
    if C_AddOns.IsAddOnLoaded("Blizzard_EncounterJournal") then
        self:Recolor(color1, color2, color3, color4, 1)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_EncounterJournal") then
        self:Recolor(color, color, color, color, 0)
    else
        module:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, color3, color4, desaturation)
    --reskin frames
    for _ ,frame in pairs({
        EncounterJournal,
        EncounterJournalInset
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    local bg = EncounterJournalBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin tabs
    for _ ,frame in pairs({
        EncounterJournalDungeonTab,
        EncounterJournalRaidTab,
        EncounterJournalSuggestTab,
        EncounterJournalLootJournalTab,
        EncounterJournalMonthlyActivitiesTab,
    }) do 
        addon:SkinTabs(frame, color3)
    end
    --reskin scrollbars
    for _ ,frame in pairs({
        EncounterJournalMonthlyActivitiesFrame,
        EncounterJournalInstanceSelect,
        EncounterJournal.LootJournalItems.ItemSetsFrame,
        EncounterJournalEncounterFrameInfo.LootContainer,
        EncounterJournalEncounterFrameInfoDetailsScrollFrame,
        EncounterJournalEncounterFrameInfoOverviewScrollFrame,
    }) do 
        addon:SkinScrollBar(frame, color4)
    end
    for _, texture in pairs({
        EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Thumb.Begin,
        EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Thumb.Middle,
        EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Thumb.End,
        EncounterJournalEncounterFrameInfo.BossesScrollBar.Back.Texture,
        EncounterJournalEncounterFrameInfo.BossesScrollBar.Forward.Texture,
    }) do
        texture:SetVertexColor(color4.r,color4.g,color4.b,color4.a) 
    end
    --window specific regions
    --normal
    for _ ,frame in pairs({
        EncounterJournalNavBarInsetBottomBorder,
        EncounterJournalNavBarInsetRightBorder,
        EncounterJournalNavBarInsetLeftBorder,
        EncounterJournalNavBarInsetBotRightCorner,
        EncounterJournalNavBarInsetBotLeftCorner,
        EncounterJournalSearchBox.Left,
        EncounterJournalSearchBox.Right,
        EncounterJournalSearchBox.Middle,
        EncounterJournalInstanceSelectTierDropDownMiddle,
        EncounterJournalInstanceSelectTierDropDownRight,
        EncounterJournalInstanceSelectTierDropDownLeft,
        EncounterJournalLootJournalViewDropDownLeft,
        EncounterJournalLootJournalViewDropDownMiddle,
        EncounterJournalLootJournalViewDropDownRight,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end
