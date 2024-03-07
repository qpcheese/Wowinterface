----------------------------------------------------------------------------------------------------
-- TradeSkillFluxCapacitor - Trade Skill Flux Capacitor is what makes navigating the trade skills window possible
----------------------------------------------------------------------------------------------------
-- Locale/enUS.lua - Strings for enUS
--
-- Author: Expelliarm5s / January 2024 / All Rights Reserved
--
-- Version 1.21.43
----------------------------------------------------------------------------------------------------

local addonName, _ = ...
local silent = true
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "enUS", true, silent)
if not L then return end
------------------------------------------------------------------------------

L["Loaded modules: "] = true
L["Not loaded modules: "] = true
L["Misc."] = true
L["Debug is off"] = true
L["Debug is on"] = true
L["Trade Skill Flux Capacitor v%s is to old for this game version. Try to get an update!"] = true
L["Flux Capacitor v%s now active!"] = true
L["Trade Skills Window already flux capacitored by %s."] = true
L["This addon causes the trade skills window to remember the state of collapsed headers.\nThe addon was inspired by goldgoblin.net."] = true
L["|cfffed100Selecting|r %s"] = true
L["Default view restored."] = true
L["Show Recipe Select Message"] = true
L["If checked, the recipe selection message is printed in the chat."] = true
L["Recipe Switch Speed"] = true
L["Select the Flux Capacitor Speed."] = true
L["Select %s (%s) to salvage (stack of %s)"] = true
L["Close Profession Windows to stop..."] = true
L["Mininum Stack Size"] = true
L["Select the mininum stack size for stacks to be selected for salvaging. Default: 5."] = true

-- EOF
