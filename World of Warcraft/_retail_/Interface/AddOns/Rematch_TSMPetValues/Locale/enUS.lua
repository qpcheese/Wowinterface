--------------------------------------------------------------------------------------------
-- Rematch_TSMPetValues - Add TSM market values to the Rematch pet list
--------------------------------------------------------------------------------------------
-- Locale/enUS.lua - Strings for enUS
--
-- Author: Expelliarm5s / May 2024 / All Rights Reserved
--
-- Version 1.2.4
------------------------------------------------------------------------------
-- luacheck: max line length 350

local addonName, _ = ...
local silent = true
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "enUS", true, silent)
if not L then return end

L["/ no Rematch found "] = true
L["Loaded modules: "] = true
L["Not loaded modules: "] = true

L["Price Sources"] = true
L["First Price Source"] = true
L["Second Price Source"] = true
L["Choose a TSM price source"] = true
L[" hooked into Rematch"] = true
L[" NOT hooked into Rematch"] = true

L["Found usable data from TradeSkillMaster."] = true
L["No usable data from TradeSkillMaster found! Please check your TradeSkillMaster Desktop App."] = true
L["TradeSkillMaster not found!"] = true

L["ON"] = true
L["OFF"] = true

L["Default is 'DBMinBuyout', one of '/tsm sources'"] = true
L["Default is 'DBRegionMarketAvg', one of '/tsm sources'"] = true
L["Please disable 'Compact List Format' in Rematch > Options > Appearance Options."] = true

L["Alerts"] = true
L["Alert Trigger"] = true
L["Bad Alert Trigger"] = true
L["Choose the amount of gold to trigger the +/- notice. Example: '5000g' or '50% DBRegionMarketAvg'."] = true
L["If the difference between the first and second market value is greater than this value, an + is printed in front of a price info, up to three times. Otherwise an - is printed. Defaults to 5000."] = true
L["Example: Set the first price source to 'DBMinBuyout' and the second to 'DBRegionMarketAvg'. For every + you can expect a greater chance to gain gold, if you sell this pet on this server. For every - you can expect to gain gold, if you buy this pet on this server and sell it on an other server."] = true

L["check empty price source"] = true
L["TSM API error"] = true
L["invalid price source"] = true
L["TSM price source error"] = true
L["can't extend the pet sort menu"] = true
L["1st price source"] = true
L["2nd price source"] = true
L["1st minus 2nd price source"] = true
L["Sort by TSM price sources"] = true
L["You can sort by a %sfirst%s and a %ssecond price source%s, which can be configured via the %s addon settings.\n\n" ..
	"The third sorting option results from the difference between the %sfirst%s and %ssecond price source%s.\n" ..
	"If the %sfirst%s and %ssecond price source%s depends on DBMinBuyout and DBRegionMarketAvg, " ..
	"the sorted list will show the pets at the top of the list that are worth selling on your server."] = true

-- EOF
