----------------------------------------------------------------------------------------------------
-- TradeSkillFluxCapacitor - Trade Skill Flux Capacitor is what makes navigating the trade skills window possible
----------------------------------------------------------------------------------------------------
-- Locale/deDE.lua - Strings for deDE
--
-- Author: Expelliarm5s / June 2024 / All Rights Reserved
--
-- Version 1.21.45
----------------------------------------------------------------------------------------------------

local addonName, _ = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "deDE")
if not L then return end
------------------------------------------------------------------------------
-- luacheck: max_line_length 280

L["Loaded modules: "] = "Geladene Module: "
L["Not loaded modules: "] = "Nicht geladene Module: "
L["Misc."] = "Verschiedenes"
L["Debug is off"] = "Fehlersuche an"
L["Debug is on"] = "Fehlersuche aus"
L["Trade Skill Flux Capacitor v%s is to old for this game version. Try to get an update!"] = "Trade Skill Flux Capacitor v%s ist zu alt für diese Spielversion. Hol Dir ein Update!"
L["Flux Capacitor v%s now active!"] = "Der Fluxkompensator v%s jetzt aktiv!"
L["Trade Skills Window already flux capacitored by %s."] = "Handwerksfenster bereits fluxkompensiert durch %s."
L["This addon causes the trade skills window to remember the state of collapsed headers.\nThe addon was inspired by goldgoblin.net."] = "Durch dieses Addon merkt sich das Handwerksfenster den Zustand eingeklappter Kopfzeilen.\nDie Idee zu diesem Addon hatte goldgoblin.net."
L["|cfffed100Selecting|r %s"] = "|cfffed100Wähle|r %s"
L["Default view restored."] = "Ansicht zurückgesetzt."
L["Show Recipe Select Message"] = "Rezeptwechsel anzeigen"
L["If checked, the recipe selection message is printed in the chat."] = "Wenn ausgewählt, wird der Rezeptwechsel im Chat angezeigt."
L["Recipe Switch Speed"] = "Rezeptwechselgeschwindigkeit"
L["Select the Flux Capacitor Speed."] = "Wähle die Rezeptwechselgeschwindigkeit"
L["Select %s (%s) to salvage (stack of %s)"] = "Wähle %s (%s) zum Verwursten aus (Stack mit %s)"
L["Close Profession Windows to stop..."] = "Schließe das Berufefenster zum Stoppen..."
L["Mininum Stack Size"] = "Minimale Stackgröße"
L["Select the mininum stack size for stacks to be selected for salvaging. Default: 5."] = "Wähle die minimale Stackgröße, die zum Verwursten ausgewählt werden soll. Normal: 5."

-- EOF
