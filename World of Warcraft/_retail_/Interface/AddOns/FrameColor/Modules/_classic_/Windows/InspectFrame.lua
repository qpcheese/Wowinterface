local _, addonTable = ...
local addon = addonTable.addon

local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("InspectFrame")
Mixin(module, addonTable.hooks)
local color1, color3

local function updatetColors(dbObj, unit)
    local Target = {}
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
    if dbObj.classcolored3 then
        color3 = addonTable.classColor
        useClassColors = true
    else
        color3 = dbObj.color3
    end
    if C_AddOns.IsAddOnLoaded("Blizzard_InspectUI") then
        if useClassColors then
            updatetColors(dbObj)
            self:Recolor(color1, color3, 1)
            self:HookFunc("InspectFrame_Show", function(unit)
                updatetColors(dbObj, unit)
                self:Recolor(color1, color3, 1)
            end)
        else
            self:Recolor(color1, color3, 1)
        end
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_InspectUI" then
                self:Recolor(color1, color3, 1)
                self:UnregisterEvent("ADDON_LOADED")
                if useClassColors then
                    self:HookFunc("InspectFrame_Show", function(unit)
                        updatetColors(dbObj, unit)
                        self:Recolor(color1, color3, 1)
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
        self:Recolor(color, color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
    self:UnregisterEvent("INSPECT_HONOR_UPDATE")
end

function module:Recolor(color1, color3, desaturation)
    --frames
    for _,frame in pairs({
        InspectPaperDollFrame,
        InspectHonorFrame,
        InspectPVPFrame,
        InspectTalentFrame,
    }) do
        for _,v in pairs({frame:GetRegions()}) do
            if v:GetObjectType() == "Texture" then
                if v:GetDrawLayer() ~= "ARTWORK" then
                    v:SetDesaturation(desaturation)
                    v:SetVertexColor(color1.r,color1.g,color1.b)
                end
            end
        end
    end
    for _,texture in pairs({
        InspectTalentFrameScrollFrameBackgroundTop,
        InspectTalentFrameScrollFrameBackgroundBottom,
        InspectTalentFramePointsBarBackground,
    }) do
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color1.r,color1.g,color1.b)
    end 
    if InspectTalentFrameScrollFrame then
        for k,v in pairs({InspectTalentFrameScrollFrame:GetRegions()}) do
            if v:GetObjectType() == "Texture" then
                v:SetDesaturation(desaturation)
                v:SetVertexColor(color1.r,color1.g,color1.b)
            end
        end
    end
    --tabs
    for k,v in pairs({
        InspectFrameTab1Left,
        InspectFrameTab1Middle,
        InspectFrameTab1Right,
        InspectFrameTab1LeftDisabled,
        InspectFrameTab1MiddleDisabled,
        InspectFrameTab1RightDisabled,
        InspectFrameTab2Left,
        InspectFrameTab2Middle,
        InspectFrameTab2Right,
        InspectFrameTab2LeftDisabled,
        InspectFrameTab2MiddleDisabled,
        InspectFrameTab2RightDisabled,
        InspectFrameTab3Left,
        InspectFrameTab3Middle,
        InspectFrameTab3Right,
        InspectFrameTab3LeftDisabled,
        InspectFrameTab3MiddleDisabled,
        InspectFrameTab3RightDisabled,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color3.r,color3.g,color3.b)
    end
end


