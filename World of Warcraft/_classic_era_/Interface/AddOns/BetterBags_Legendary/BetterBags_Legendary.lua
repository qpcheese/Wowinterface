---@class BetterBags: AceAddon
local BetterBags = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
---@class Categories: AceModule
local categories = BetterBags:GetModule('Categories')
---@class Config: AceModule
local config = BetterBags:GetModule('Config')
---@class Constants: AceModule
local const = BetterBags:GetModule('Constants')
---@class Constants: AceModule
local db = BetterBags:GetModule('Database')

local _, ns = ...;
local L = ns.L;
local _G = _G

categories:CreateCategory(L["CATEGORY_NAME"])

--@param data ItemData
categories:RegisterCategoryFunction("LegendaryCategoryFilter", function(data)
	local quality = data.itemInfo.itemQuality

	if (quality and quality >= _G.Enum.ItemQuality.Legendary and db.GetItemCategoryByItemID(data.itemInfo.itemID) ~= nil) then
        categories:AddItemToCategory(data.itemInfo.itemID, L["CATEGORY_NAME"])
        config:GetBag(const.BAG_KIND.BACKPACK):Refresh()
        config:GetBag(const.BAG_KIND.BANK):Refresh()
    end

	return nil
end)
