local _, addonTable = ...
local addon = addonTable.addon

local _G = _G
local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("InspectFrame")
Mixin(module, addonTable.hooks)
local color1, color2, color3

local function updatetColors(dbObj)
    local Target = {}
    local unit = INSPECTED_UNIT
    if not unit then
        return
    end
    addon:GetUnitInformation(Target, unit)
    if not Target.ClassColor then 
        return
    end
    if dbObj.classcolored1 then
        color1 = Target.ClassColor
    else
        color1 = dbObj.color1
    end
    if dbObj.classcolored2 then
        color2 = Target.ClassColor
    else
        color2 = dbObj.color2
    end
    if dbObj.classcolored3 then
        color3 = Target.ClassColor
    else
        color3 = dbObj.color3
    end
end

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["InspectFrame"]
    local useClassColors = false
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
        useClassColors = true
    else
        color1 = dbObj.color1
    end
    if dbObj.classcolored2 then
        color2 = addonTable.classColor
        useClassColors = true
    else
        color2 = dbObj.color2
    end
    if dbObj.classcolored3 then
        color3 = addonTable.classColor
        useClassColors = true
    else
        color3 = dbObj.color3
    end
    if C_AddOns.IsAddOnLoaded("Blizzard_InspectUI") then
        if useClassColors then
            updatetColors(dbObj)
            self:Recolor(color1, color2, color3, 1)
            self:HookFunc("InspectFrame_Show", function()
                updatetColors(dbObj)
                self:Recolor(color1, color2, color3, 1)
            end)
        else
            self:Recolor(color1, color2, color3, 1)
        end
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_InspectUI" then
                self:Recolor(color1, color2, color3, 1)
                self:UnregisterEvent("ADDON_LOADED")
                if useClassColors then
                    self:HookFunc("InspectFrame_Show", function()
                        updatetColors(dbObj)
                        self:Recolor(color1, color2, color3, 1)
                    end)
                end
            end
        end)
    end
end

function module:OnDisable()
    self:DisableHooks()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_InspectUI") then
        self:Recolor(color, color, color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
    self:UnregisterEvent("INSPECT_HONOR_UPDATE")
end

function module:Recolor(color1, color2, color3, desaturation)
    --reskin frames
    for _,frame in pairs({
        InspectFrame,
        InspectFrameInset,
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    local bg = InspectFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin tabs
    for _,frame in pairs({
        InspectFrameTab1,
        InspectFrameTab2,
        InspectFrameTab3,
        InspectPaperDollItemsFrame.InspectTalents
    }) do 
        addon:SkinTabs(frame, color3)
    end
    --window specific regions
    for _,frame in pairs({ 
        InspectModelFrameBorderBottom,
        InspectModelFrameBorderBottomRight,
        InspectModelFrameBorderBottomLeft,
        InspectModelFrameBorderTop,
        InspectModelFrameBorderTopLeft,
        InspectModelFrameBorderTopRight,
        InspectModelFrameBorderLeft,
        InspectModelFrameBorderRight,
        InspectFrameInset.Bg,
        InspectTrinket0SlotFrame,
        InspectTrinket1SlotFrame,
        InspectFinger0SlotFrame,
        InspectFinger1SlotFrame,
        InspectFeetSlotFrame,
        InspectLegsSlotFrame,
        InspectWaistSlotFrame,
        InspectHandsSlotFrame,
        InspectWristSlotFrame,
        InspectSecondaryHandSlotFrame,
        InspectMainHandSlotFrame,
        InspectTabardSlotFrame,
        InspectShirtSlotFrame,
        InspectChestSlotFrame,
        InspectBackSlotFrame,
        InspectShoulderSlotFrame,
        InspectNeckSlotFrame,
        InspectHeadSlotFrame
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end


