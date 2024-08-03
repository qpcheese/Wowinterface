local _, addonTable = ...
local addon = addonTable.addon

local _G = _G
local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor
local unpack = unpack

local module = addon:NewModule("ItemUpgradeFrame")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["ItemUpgradeFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if C_AddOns.IsAddOnLoaded("Blizzard_ItemUpgradeUI") then
        self:Recolor(color1, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_ItemUpgradeUI" then
                self:Recolor(color1, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end
    self:RegisterEvent("ITEM_UPGRADE_MASTER_SET_ITEM","UpdateBGColor")
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_ItemUpgradeUI") then
        self:Recolor(color, 0)
        ItemUpgradeFrame.TopBG:SetDesaturation(0)
        ItemUpgradeFrame.TopBG:SetVertexColor(1,1,1)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
    self:UnregisterEvent("ITEM_UPGRADE_MASTER_SET_ITEM")
end

function module:Recolor(color1, desaturation)
    --reskin frame
    addon:SkinNineSliced(ItemUpgradeFrame, color1, desaturation)
    --window specific regions
    for _,frame in pairs({
        ItemUpgradeFrame.BottomBG,
        ItemUpgradeFrame.UpgradeItemButton.ButtonFrame,
        ItemUpgradeFrameLeft,
        ItemUpgradeFrameMiddle,
        ItemUpgradeFrameRight,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    self:UpdateBGColor()
end

local quality = {
    [2] = {0.12,1,0},
    [3] = {0,0.44,0.87},
    [4] = {0.64,0.21,0.93},
}

function module:UpdateBGColor()
    local itemInfo = C_ItemUpgrade.GetItemUpgradeItemInfo()
    local displayQuality = itemInfo and itemInfo.displayQuality or nil
    if not displayQuality then 
        ItemUpgradeFrame.TopBG:SetVertexColor(1,1,1)
        return
    end
    if quality[displayQuality] then
        ItemUpgradeFrame.TopBG:SetVertexColor(unpack(quality[displayQuality]))
    else
        ItemUpgradeFrame.TopBG:SetVertexColor(1,1,1)
    end
end
