-----------------------------------------------------------------------------------------------------------------------
--  Title:   TooltipUI                                                                                               --
--  Author:  Zaazu                                                                                                   --
--  Date:    November 2021                                                                                           --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that initialises tooltips.                                                                  --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class TooltipUI : AceConsole, AceEvent
local TooltipUI = BTools:NewModule("TooltipUI", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

---@type Frame
local FrameTooltip = nil
---@type GameTooltip
local RichTooltip = nil

local function DrawRichTooltip()
    RichTooltip = StdUi:Tooltip(UIParent, "BTOOLS_RichTooltip", "BTOOLS_RichTooltip", "TOPRIGHT", false)
    RichTooltip:Hide()
end

local function DrawFrameTooltip()
    FrameTooltip = StdUi:FrameTooltip(UIParent, "BTOOLS_FrameTooltip", "BTOOLS_FrameTooltip", "TOPRIGHT", false)
    FrameTooltip:Hide()
end

---StdUi Frame tooltip
---@return Frame
function TooltipUI:GetFrameTooltip()
    if (not FrameTooltip) then
        DrawFrameTooltip()
    end

    return FrameTooltip
end

---Blizzard Tooltip
---@return GameTooltip
function TooltipUI:GetRichTooltip()
    if (not RichTooltip) then
        DrawRichTooltip()
    end

    return RichTooltip
end

--- Called when the module is enabled
function TooltipUI:OnEnable()
    StdUi = BTools:GetStdUiInstance()
end
