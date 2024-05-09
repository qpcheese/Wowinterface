---@class BetterBags: AceAddon
local BetterBags = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
assert(BetterBags, "BetterBags_Legendary requires BetterBags")

local addonName, root = ...;

---@class BetterBags_Tabards: AceModule
local addon = LibStub("AceAddon-3.0"):NewAddon(root, addonName, 'AceHook-3.0')

---@class Categories: AceModule
local categories = BetterBags:GetModule('Categories')
---@class Config: AceModule
local config = BetterBags:GetModule('Config')
---@class Constants: AceModule
local db = BetterBags:GetModule('Database')
---@class Events: AceModule
local events = BetterBags:GetModule('Events')
---@class Items: AceModule
local items = BetterBags:GetModule('Items')

local L = root.L;
local _G = _G

--@param itemInfo ItemData.itemInfo
--@deprecated To be deleted, renamed to IsLegendaryPlus
function addon:IsLegendary(itemInfo)
    local quality = itemInfo.itemQuality

    return quality and quality >= _G.Enum.ItemQuality.Legendary
end

--@param itemInfo ItemData.itemInfo
function addon:IsLegendaryPlus(itemInfo)
    local quality = itemInfo.itemQuality

    return quality and quality >= _G.Enum.ItemQuality.Legendary
end

if type(BetterBags_LegendaryDB) ~= "table" then
    -- clean previous version data
    categories:WipeCategory(L["CATEGORY_NAME"])

    BetterBags_LegendaryDB = {}
    BetterBags_LegendaryDB.independentLegendary = false
    BetterBags_LegendaryDB.independentArtifact = false
    BetterBags_LegendaryDB.independentHeirloom = false
    BetterBags_LegendaryDB.independentToken = false
end

categories:CreateCategory(L["CATEGORY_NAME"])

if (BetterBags_LegendaryDB.independentLegendary) then
    categories:CreateCategory(L["OPTIONS_CAT_LEGENDARY"])
end

--@param data ItemData
categories:RegisterCategoryFunction("LegendaryCategoryFilter", function(data)
	if (addon:IsLegendaryPlus(data.itemInfo)) then
        local quality = data.itemInfo.itemQuality

        if (quality) then
            if (BetterBags_LegendaryDB.independentLegendary and quality == _G.Enum.ItemQuality.Legendary) then
                return L["OPTIONS_CAT_LEGENDARY"]
            elseif (BetterBags_LegendaryDB.independentArtifact and quality == _G.Enum.ItemQuality.Artifact) then
                return L["OPTIONS_CAT_ARTIFACT"]
            elseif (BetterBags_LegendaryDB.independentHeirloom and quality == _G.Enum.ItemQuality.Heirloom) then
                return L["OPTIONS_CAT_HEIRLOOM"]
            elseif (BetterBags_LegendaryDB.independentToken and quality == _G.Enum.ItemQuality.WoWToken) then
                return L["OPTIONS_CAT_TOKEN"]
            end
        end

        return L["CATEGORY_NAME"]
    end

	return nil
end)

local legendaryConfigOptions = {
    legendaryCategory = {
        name = L["CATEGORY_NAME"],
        type = "group",
        order = 0,
        inline = true,
        args = {
            createHelp = {
                type = "description",
                name = L["OPTIONS_DESC"],
                order = 0,
            },
            space = {
                name = " ",
                type = "description",
                order = 1,
                width = "full",
            },
            categories = {
                name = L["OPTIONS_INDE_CAT"],
                type = "header",
                order = 2,
            },
            independentLegendary = {
                name = L["OPTIONS_CAT_LEGENDARY"],
                type = "toggle",
                order = 3,
                get = function()
                    return BetterBags_LegendaryDB.independentLegendary
                end,
                set = function(_, value)
                    BetterBags_LegendaryDB.independentLegendary = value

                    if (BetterBags_LegendaryDB.independentLegendary) then
                        categories:CreateCategory(L["OPTIONS_CAT_LEGENDARY"])
                        categories:WipeCategory(L["CATEGORY_NAME"])
                        categories:WipeCategory(L["OPTIONS_CAT_LEGENDARY"])
                    else
                        categories:WipeCategory(L["CATEGORY_NAME"])
                        categories:WipeCategory(L["OPTIONS_CAT_LEGENDARY"])
                        categories:DeleteCategory(L["OPTIONS_CAT_LEGENDARY"])
                    end

                    events:SendMessage('bags/FullRefreshAll')
                    items.RefreshAll()
                    canRefreshDisabled = false
                end,
            },
            independentArtifact = {
                name = L["OPTIONS_CAT_ARTIFACT"],
                type = "toggle",
                order = 4,
                get = function()
                    return BetterBags_LegendaryDB.independentArtifact
                end,
                set = function(_, value)
                    BetterBags_LegendaryDB.independentArtifact = value

                    if (BetterBags_LegendaryDB.independentArtifact) then
                        categories:CreateCategory(L["OPTIONS_CAT_ARTIFACT"])
                        categories:WipeCategory(L["CATEGORY_NAME"])
                        categories:WipeCategory(L["OPTIONS_CAT_ARTIFACT"])
                    else
                        categories:WipeCategory(L["CATEGORY_NAME"])
                        categories:WipeCategory(L["OPTIONS_CAT_ARTIFACT"])
                        categories:DeleteCategory(L["OPTIONS_CAT_ARTIFACT"])
                    end

                    events:SendMessage('bags/FullRefreshAll')
                    items.RefreshAll()
                    canRefreshDisabled = false
                end,
            },
            independentHeirloom = {
                name = L["OPTIONS_CAT_HEIRLOOM"],
                type = "toggle",
                order = 5,
                get = function()
                    return BetterBags_LegendaryDB.independentHeirloom
                end,
                set = function(_, value)
                    BetterBags_LegendaryDB.independentHeirloom = value

                    if (BetterBags_LegendaryDB.independentHeirloom) then
                        categories:CreateCategory(L["OPTIONS_CAT_HEIRLOOM"])
                        categories:WipeCategory(L["CATEGORY_NAME"])
                        categories:WipeCategory(L["OPTIONS_CAT_HEIRLOOM"])
                    else
                        categories:WipeCategory(L["CATEGORY_NAME"])
                        categories:WipeCategory(L["OPTIONS_CAT_HEIRLOOM"])
                        categories:DeleteCategory(L["OPTIONS_CAT_HEIRLOOM"])
                    end

                    events:SendMessage('bags/FullRefreshAll')
                    items.RefreshAll()
                    canRefreshDisabled = false
                end,
            },
            independentToken = {
                name = L["OPTIONS_CAT_TOKEN"],
                type = "toggle",
                order = 6,
                get = function()
                    return BetterBags_LegendaryDB.independentToken
                end,
                set = function(_, value)
                    BetterBags_LegendaryDB.independentToken = value

                    if (BetterBags_LegendaryDB.independentToken) then
                        categories:CreateCategory(L["OPTIONS_CAT_TOKEN"])
                        categories:WipeCategory(L["CATEGORY_NAME"])
                        categories:WipeCategory(L["OPTIONS_CAT_TOKEN"])
                    else
                        categories:WipeCategory(L["CATEGORY_NAME"])
                        categories:WipeCategory(L["OPTIONS_CAT_TOKEN"])
                        categories:DeleteCategory(L["OPTIONS_CAT_TOKEN"])
                    end

                    events:SendMessage('bags/FullRefreshAll')
                    items.RefreshAll()
                    canRefreshDisabled = false
                end,
            },
        },
    },
    refresh = {
        type = "execute",
        name = L["OPTIONS_REFRESH"],
        order = 1,
        width = "full",
        disabled = function() return canRefreshDisabled end,
        func = function()
            canRefreshDisabled = true
            ConsoleExec("reloadui")
        end,
    },
}

config:AddPluginConfig(L["CATEGORY_NAME"], legendaryConfigOptions)
