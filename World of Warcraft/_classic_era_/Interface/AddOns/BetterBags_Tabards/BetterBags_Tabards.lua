---@class BetterBags: AceAddon
local BetterBags = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
assert(BetterBags, "BetterBags_Tabards requires BetterBags")

local addonName, root = ...;

---@class BetterBags_Tabards: AceModule
local addon = LibStub("AceAddon-3.0"):NewAddon(root, addonName, 'AceHook-3.0')

---@class Categories: AceModule
local categories = BetterBags:GetModule('Categories')
---@class Constants: AceModule
local db = BetterBags:GetModule('Database')

local L = root.L;

--@param itemInfo ItemData.itemInfo
function addon:IsTabard(itemInfo)
    return itemInfo.itemEquipLoc == "INVTYPE_TABARD"
end

categories:CreateCategory(L["CATEGORY_NAME"])

--@param data ItemData
categories:RegisterCategoryFunction("TabardsCategoryFilter", function(data)
	if (addon:IsTabard(data.itemInfo)) then
        return L["CATEGORY_NAME"]
    end

	return nil
end)
