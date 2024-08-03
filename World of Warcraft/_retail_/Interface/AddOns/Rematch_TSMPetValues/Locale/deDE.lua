--------------------------------------------------------------------------------------------
-- Rematch_TSMPetValues - Add TSM market values to the Rematch pet list
--------------------------------------------------------------------------------------------
-- Locale/deDE.lua - Strings for deDE
--
-- Author: Expelliarm5s / May 2024 / All Rights Reserved
--
-- Version 1.2.4
------------------------------------------------------------------------------
-- luacheck: max line length 350

local addonName, _ = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "deDE")

if not L then return end

L["/ no Rematch found "] = "/ Rematch nicht gefunden "
L["Loaded modules: "] = "Geladene Module: "
L["Not loaded modules: "] = "Nicht geladene Module: "

L["Price Sources"] = "Preisquellen"
L["First Price Source"] = "Erste Preisquelle"
L["Second Price Source"] = "Zweite Preisquelle"
L["Choose a TSM price source"] = "Gib eine TSM-Preisquelle ein (eine von '/tsm sources')"
L[" hooked into Rematch"] = " Rematch wurde erweitert"
L[" NOT hooked into Rematch"] = "Rematch wurde nicht erweitert"

L["Found usable data from TradeSkillMaster."] = "Brauchbare Daten von TradeSkillMaster gefunden."
L["No usable data from TradeSkillMaster found! Please check your TradeSkillMaster Desktop App."] = "Keine gültigen Daten von TradeSkillMaster gefunden. Bitte prüfe die Desktop App."
L["TradeSkillMaster not found!"] = "TradeSkillMaster wurde nicht gefunden!"

L["ON"] = "EIN"
L["OFF"] = "AUS"

L["Default is 'DBMinBuyout', one of '/tsm sources'"] = "z.B. 'DBMinBuyout', eine von '/tsm sources'"
L["Default is 'DBRegionMarketAvg', one of '/tsm sources'"] = "z.B. 'DBRegionMarketAvg', eine von '/tsm sources'"
L["Please disable 'Compact List Format' in Rematch > Options > Appearance Options."] = "Bitte 'Kompakte Listen' unter Erscheinungsoptionen in den Optionen von Rematch ausschalten."

L["Alerts"] = "Hinweise"
L["Alert Trigger"] = "Gewinnwarnung"
L["Bad Alert Trigger"] = "Ungültige Gewinnwarnung"

L["Choose the amount of gold to trigger the +/- notice. Example: '5000g' or '50% DBRegionMarketAvg'."] = "Lege den Goldbetrag fest, auf dem die +/- Hinweise vor der Preisinformation beruhen. Beispiel: '5000g' oder '50% DBRegionMarketAvg'."
L["If the difference between the first and second market value is greater than this value, an + is printed in front of a price info, up to three times. Otherwise an - is printed. Defaults to 5000."] =
	"Wenn die Differenz aus der ersten und zweiten Preisquelle größer ist als dieser Goldbetrag, dann wird bis zu dreimal ein + vor die Preisinfo vorangestellt, ansonsten bis zu dreimal ein -."

L["Example: Set the first price source to 'DBMinBuyout' and the second to 'DBRegionMarketAvg'. For every + you can expect a greater chance to gain gold, if you sell this pet on this server. For every - you can expect to gain gold, if you buy this pet on this server and sell it on an other server."] =
	"Beispiel: Wird die erste Preisquelle mit 'DBMinBuyout' und die zweite mit 'DBRegionMarketAvg' festgelegt, so steigt die Chance mit jedem + vor der Preisinfo, dass sich der Verkauf auf dem Server lohnt. Für jedes - steigt die Chance, dass es sich lohnt das Haustier auf diesem Server zu kaufen und auf einem anderen zu verkaufen."

L["check empty price source"] = "eine Preisquelle ist leer"
L["TSM API error"] = "TSM-API-Fehler"
L["invalid price source"] = "ungültige erste Preisquelle"
L["TSM price source error"] = "fehlerhafte TSM-Preisquelle"
L["can't extend the pet sort menu"] = "konnte das Sortiermenü nicht erweitern"
L["1st price source"] = "1. Preisquelle"
L["2nd price source"] = "2. Preisquelle"
L["1st minus 2nd price source"] = "1. minus 2. Preisquelle"
L["Sort by TSM price sources"] = "Nach TSM-Preisquellen sortieren"
L["You can sort by a %sfirst%s and a %ssecond price source%s, which can be configured via the %s addon settings.\n\n" ..
	"The third sorting option results from the difference between the %sfirst%s and %ssecond price source%s.\n" ..
	"If the %sfirst%s and %ssecond price source%s depends on DBMinBuyout and DBRegionMarketAvg, " ..
	"the sorted list will show the pets at the top of the list that are worth selling on your server."] =
	"Du kannst nach einer %sersten%s und einer %szweiten Preisquelle%s sortieren, die über die Addon-Einstellungen von %s konfiguriert werden können.\n\n" ..
	"Die dritte Sortieroption ergibt sich aus der Differenz von %serster%s und %szweiter Preisquelle%s.\n" ..
	"Wenn die %serste%s und %szweite Preisquelle%s von DBMinBuyout und DBRegionMarketAvg abhängt, wird die sortierte Liste die Haustiere ganz oben angezeigen, " ..
	"die sich lohnen, auf Deinem Server verkauft zu werden."

-- EOF
