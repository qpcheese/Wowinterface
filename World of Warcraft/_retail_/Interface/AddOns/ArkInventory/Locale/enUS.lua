local L = LibStub( "AceLocale-3.0" ):NewLocale( "ArkInventory", "enUS", true, false )
if not L then return end

-- post updated translations at http://groups.google.com/group/wow-arkinventory (modify this file and include as an attachment)
-- note: when creating a new locale do not leave any english translations in your file, comment them out by placing -- at the start of the line


-- Translated by: <insert your name here>











--	wow zone names - must match exactly what is in game
	L["WOW_ZONE_AHNQIRAJ"] = "Ahn'Qiraj"
	L["WOW_ZONE_VASHJIR"] = "Vashj'ir"
	L["WOW_ZONE_KELPTHAR_FOREST"] = "Kelp'thar Forest"
	L["WOW_ZONE_SHIMMERING_EXPANSE"] = "Shimmering Expanse"
	L["WOW_ZONE_ABYSSAL_DEPTHS"] = "Abyssal Depths"
	
	
--	wow tooltip text - must match exactly what is in game
	L["WOW_ITEM_TOOLTIP_FOOD"] = "Must remain seated while eating"
	L["WOW_ITEM_TOOLTIP_DRINK"] = "Must remain seated while drinking"
	L["WOW_ITEM_TOOLTIP_POTION_HEAL"] = "Restores %d+ to %d+ health"
	L["WOW_ITEM_TOOLTIP_POTION_MANA"] = "Restores %d+ to %d+ mana"
	L["WOW_ITEM_TOOLTIP_ELIXIR_BATTLE"] = "Battle Elixir"
	L["WOW_ITEM_TOOLTIP_ELIXIR_GUARDIAN"] = "Guardian Elixir"
	L["WOW_ITEM_TOOLTIP_10P9S"] = "B"
	L["WOW_ITEM_TOOLTIP_10P12S"] = "T"
	
	
--	location names
	L["LOCATION_WEARING"] = "Wearing"
	
	
--	subframe names
	L["SUBFRAME_NAME_TITLE"] = "Title"
	L["SUBFRAME_NAME_BAGCHANGER"] = "Bag Changer"
	
	
--	status bar/bag text
	L["STATUS_NO_DATA"] = "No Data"
	L["STATUS_PURCHASE"] = "Buy"
	
	
--	restack
	L["RESTACK"] = "Restack"
	L["RESTACK_DESC"] = "consolidate items into as few stacks as possible and then try to fill up any empty slots in special bags where possible"
	L["RESTACK_FAIL_WAIT"] = "Already in progress please wait for completion"
	L["RESTACK_FAIL_ACCESS"] = "You don't have enough authority to tab %2$s in the %1$s" -- %1$s = guild bank, %2$s = tab number
	L["RESTACK_FAIL_CLOSED"] = "%1$s was closed" -- %1$s = location
	L["RESTACK_TYPE"] = "Which code to use when running a restack"
	L["RESTACK_CLEANUP_DEPOSIT"] = "Deposit all reagents as part of the Cleanup process"
	L["RESTACK_CLEANUP_DELAY"] = "Cleanup Delay"
	L["RESTACK_CLEANUP_DELAY_DESC"] = "Adjust the amount of time after a cleanup is triggered before continuing with the remainder of the cleanup process.\n\nSet to a higher value if you keep getting item is locked errors during the cleanup"
	L["RESTACK_TOPUP_FROM_BAGS"] = "Top Up"
	L["RESTACK_TOPUP_FROM_BAGS_DESC"] = "Top up any partial stacks with items from your bags"
	L["RESTACK_FILL_FROM_BAGS_DESC"] = "Fill any empty %1$s slots with Crafting items from your %2$s"
	L["RESTACK_FILL_PRIORITY"] = "Fill Priority"
	L["RESTACK_FILL_PRIORITY_DESC"] = "Click to toggle between filling up the %1$s or the %2$s first"
	L["RESTACK_FILL_PRIORITY_PROFESSION"] = "Profession Bags"
	L["RESTACK_REFRESH_WHEN_COMPLETE"] = "Refresh window when completed"
	
	
--	vault tab tooltips
	L["VAULT_TAB_ACCESS_NONE"] = "No Access"
	L["VAULT_TAB_NAME"] = "Tab: |cffffffff%1$s - %2$s|r" --%1$s = tab number, %2$s = tab name
	L["VAULT_TAB_ACCESS"] = "Access: |cffffffff%1$s|r"
	L["VAULT_TAB_REMAINING_WITHDRAWALS"] = "Remaining Daily Withdrawals: |cffffffff%1$s|r"
	
	
--	system category descriptions
	L["CATEGORY_SYSTEM_CORE_MATS"] = "Core Mats"
	L["CATEGORY_SYSTEM_MYTHIC_KEYSTONE"] = "Mythic Keystone"
	
	L["CATEGORY_RULE"] = "Rule"
	
--	tradegoods category descriptions
	L["CATEGORY_TRADEGOODS_METAL_AND_STONE"] = "Metal & Stone"
	
--	consumable category descriptions
	L["CATEGORY_CONSUMABLE_FOOD_PET"] = "Pet Food"
	L["CATEGORY_CONSUMABLE_POTION_HEAL"] = "Health (Potion/Stone)"
	L["CATEGORY_CONSUMABLE_POTION_MANA"] = "Mana (Potion/Gem)"
	L["CATEGORY_CONSUMABLE_ELIXIR"] = "Elixir"
	L["CATEGORY_CONSUMABLE_ELIXIR_BATTLE"] = "Elixir (Battle)"
	L["CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN"] = "Elixir (Guardian)"
	L["CATEGORY_CONSUMABLE_BANDAGE"] = "Bandage"
	L["CATEGORY_CONSUMABLE_POTION"] = "Potion"
	L["CATEGORY_CONSUMABLE_FLASK"] = "Flask"
	L["CATEGORY_CONSUMABLE_SCROLL"] = "Scroll"
	L["CATEGORY_CONSUMABLE_CHAMPION_EQUIPMENT"] = "Champion Equipment"
	L["CATEGORY_CONSUMABLE_POWER_SYSTEM_OLD"] = "Power Systems (Old)"
	L["CATEGORY_CONSUMABLE_ABILITIES_AND_ACTIONS"] = "Abilities and Actions"
	
	
--	bag names - used to name the empty slots in the status frame (and LDB)
	L["STATUS_SHORTNAME_BAG"] = "Bag"
	L["STATUS_SHORTNAME_COOKING"] = "Cook"
	L["STATUS_SHORTNAME_CRITTER"] = "Pet"
	L["STATUS_SHORTNAME_ENCHANTING"] = "Ench"
	L["STATUS_SHORTNAME_ENGINEERING"] = "Eng"
	L["STATUS_SHORTNAME_WEARING"] = "Gear"
	L["STATUS_SHORTNAME_JEWELCRAFTING"] = "Gem"
	L["STATUS_SHORTNAME_HEIRLOOM"] = "Hrlm"
	L["STATUS_SHORTNAME_HERBALISM"] = "Herb"
	L["STATUS_SHORTNAME_INSCRIPTION"] = "Insc"
	L["STATUS_SHORTNAME_KEY"] = "Key"
	L["STATUS_SHORTNAME_LEATHERWORKING"] = "Lthr"
	L["STATUS_SHORTNAME_MAILBOX"] = "Mail"
	L["STATUS_SHORTNAME_MINING"] = "Mng"
	L["STATUS_SHORTNAME_MOUNT"] = "Mnt"
	L["STATUS_SHORTNAME_REAGENT"] = "Rgt"
	L["STATUS_SHORTNAME_FISHING"] = "Fish"
	L["STATUS_SHORTNAME_TOKEN"] = "Tkn"
	L["STATUS_SHORTNAME_TOY"] = "Toy"
	L["STATUS_SHORTNAME_REPUTATION"] = "Rep"
	L["STATUS_SHORTNAME_PROJECTILE"] = "Ammo"
	L["STATUS_SHORTNAME_SOULSHARD"] = "Shrd"
	
	
--	main menu
	L["MENU"] = "Menu"
	
	L["MENU_CHARACTER_SWITCH"] = "Switch Character"
	L["MENU_CHARACTER_SWITCH_DESC"] = "Switches the display to another character"
	L["MENU_CHARACTER_SWITCH_CHOOSE_NONE"] = "no other character data to choose from"
	L["MENU_CHARACTER_SWITCH_CHOOSE_DESC"] = "Switches the current display to %1$s"
	L["MENU_CHARACTER_SWITCH_ERASE"] = "Erase %s data"
	L["MENU_CHARACTER_SWITCH_ERASE_DESC"] = "Erase %1$s data for %2$s"
	
	L["MENU_LOCATION_TOGGLE"] = "Toggle Location"
	L["MENU_LOCATION_TOGGLE_DESC"] = "toggles displaying the %1$s window"
	L["MENU_LOCATION_NOT_SUPPORTED"] = "The %1$s location is not supported in this client"
	
	
--	actions menu
	L["MENU_ACTION"] = "Actions"
	L["MENU_ACTION_REFRESH_DESC"] = "refreshes the window"
	L["MENU_ACTION_REFRESH_CLEAR_CACHE"] = "Clear Category Cache"
	L["MENU_ACTION_REFRESH_CLEAR_CACHE_DESC"] = "clears all cached category assignments"
	L["MENU_ACTION_RELOAD_DESC"] = "reloads the window. use when you change items in outfit sets"
	L["MENU_ACTION_EDITMODE"] = "Edit Mode"
	L["MENU_ACTION_EDITMODE_DESC"] = "toggles edit mode on and off so you can customise item layout"
	L["MENU_ACTION_BAGCHANGER_DESC"] = "toggles the display of the BagChanger frame so you can add or replace bags"
	
	
--	item menu
	L["MENU_ITEM_TITLE"] = "Item Information"
	L["MENU_ITEM_ASSIGN_RESET"] = "Reset to default"
	L["MENU_ITEM_ASSIGN_RESET_DESC"] = "click to reassign %1$s back to its default category %2$s"
	L["MENU_ITEM_ASSIGN_CHOICES"] = "Assignable Categories"
	L["MENU_ITEM_ASSIGN_CATEGORY"] = "Assign Category"
	L["MENU_ITEM_ASSIGN_CATEGORY_DESC"] = "click to assign %1$s to %2$s"
	L["MENU_ITEM_ASSIGN_CURRENT_DESC"] = "%1$s is currently assigned to %2$s"
	L["MENU_ITEM_ASSIGN_DISABLED_DESC"] = "This category is currently disabled.\n\nYou need to enable it before you can assign items to it."
	L["MENU_ITEM_CUSTOM_NEW"] = "Create a new custom category"
	L["MENU_ITEM_ITEMCOUNT_DESC"] = "Display item counts in tooltips for this item."
	L["MENU_ITEM_ITEMCOUNT_STATUS_DESC"] = "%s\n\nclick to %s it."
	L["MENU_ITEM_DEBUG_PET_ID"] = "Pet ID"
	L["MENU_ITEM_DEBUG_PET_SPECIES"] = "Pet Species"
	L["MENU_ITEM_DEBUG_AI_ID_SHORT"] = "Short ID"
	L["MENU_ITEM_DEBUG_CACHE"] = "Cache ID"
	L["MENU_ITEM_DEBUG_AI_ID_RULE"] = "Rule ID"
	L["MENU_ITEM_DEBUG_AI_ID_CATEGORY"] = "Category ID"
	L["MENU_ITEM_DEBUG_LVL_ITEM"] = "Item Level (Stat)"
	L["MENU_ITEM_DEBUG_LVL_USE"] = "Item Level (Use)"
	L["MENU_ITEM_DEBUG_SUBTYPE"] = "Sub Type"
	L["MENU_ITEM_DEBUG_ID"] = "Blizzard ID"
	L["MENU_ITEM_DEBUG_FAMILY"] = "Family"
	L["MENU_ITEM_DEBUG_PT"] = "PT Sets"
	L["MENU_ITEM_DEBUG_PT_DESC"] = "Lists which PT Sets this item is in"
	L["MENU_ITEM_DEBUG_PT_NONE"] = "this item is currently not in any PT set"
	L["MENU_ITEM_DEBUG_PT_TITLE"] = "PT Sets this item is in"
	L["MENU_ITEM_DEBUG_SOURCE"] = "Source ID"
	L["MENU_ITEM_DEBUG_BONUS"] = "Bonus IDs"
	L["MENU_ITEM_DEBUG_ITEMSTRING"] = "Item String"
	
	
--	bar menu
	L["MENU_BAR"] = "Bar"
	L["MENU_BAR_TITLE"] = "Bar %1$s"
	L["MENU_BAR_CATEGORY_DESC"] = "click to assign category %1$s to bar %2$s"
	L["MENU_BAR_CATEGORY_LABEL"] = "%1$s - %2$s"
	L["MENU_BAR_CATEGORY_REMOVE_DESC"] = "click to remove %1$s from bar %2$s\n\nthe category will revert to the default bar" -- 1 is the category name, 2 is the bar number
	L["MENU_BAR_CATEGORY_HIDDEN_DESC"] = "click to toggle the hidden state of this category.\n\nitems in a hidden category will not display in normal mode"
	L["MENU_BAR_CATEGORY_MOVE_START_DESC"] = "Initiates moving %1$s\n\nyou then need to click on the bar or an item in that bar where you want it to go and choose the complete option"
	L["MENU_BAR_CATEGORY_MOVE_COMPLETE_DESC"] = "Finalises moving %1$s from bar %2$s to here (bar %3$s)"
	L["MENU_BAR_CATEGORY_ENABLE_DESC"] = "Enables this rule so it can be used by this layout"
	L["MENU_BAR_CATEGORY_DISABLE_DESC"] = "Disables this rule so it is no longer used by this layout"
	L["MENU_BAR_CATEGORY_STATUS"] = "Sets whether %s will be used or not."
	L["MENU_BAR_CATEGORY_STATUS_DESC"] = "%s\n\nclick to %s it."
	L["MENU_BAR_CATEGORY_JUNK_DESC"] = "%s\n\nclick to %s it."
	L["MENU_BAR_BAG_ASSIGN_DESC"] = "assign all slots from Bag %1$s to bar %2$s"
	L["MENU_BAR_OPTIONS"] = "Bar Options"
	L["MENU_BAR_RESET_DESC"] = "Resets bar %1$s back to default.\n\nRemoves all assigned categories (except the default category)"
	L["MENU_BAR_INSERT_DESC"] = "Inserts a new empty bar in front of bar %1$s"
	L["MENU_BAR_DELETE_DESC"] = "Deletes bar %1$s\n\nAny categories assigned to bar %1$s will revert back to the default bar.\n\nIf the default category is assigned to bar %1$s it will be moved to bar 1"
	L["MENU_BAR_WIDTH_MINIMUM"] = "%1$s (%2$s)"
	L["MENU_BAR_WIDTH_MINIMUM_DESC"] = "The minimum width for bar %1$s\n\nSet to zero (0) for automatic"
	L["MENU_BAR_WIDTH_MAXIMUM"] = "%1$s (%2$s)"
	L["MENU_BAR_WIDTH_MAXIMUM_DESC"] = "The maximum width for bar %1$s\n\nSet to zero (0) for automatic"
	L["MENU_BAR_MOVE_START_DESC"] = "Initiates moving bar %1$s\n\nYou then need to click on another bar and chose the complete action to finalise the move\n\nAlternatively you can just drag this bar to another bar to move it there"
	L["MENU_BAR_MOVE_COMPLETE_DESC"] = "Finalises moving bar %1$s to here\n\nBars between here and the original location will be reordered"
	L["MENU_MOVE_FAIL_OUTSIDE"] = "move failed; you cant move the %1$s to a different window"
	L["MENU_MOVE_FAIL_SAME"] = "move aborted; the %1$s is already here"
	L["MENU_BAR_SORTKEY_DESC"] = "Assigns the %1$s sort method to bar %2$i"
	L["MENU_BAR_SORTKEY_DEFAULT_RESET_DESC"] = "Sets the sort method for bar %1$i back to the default"
	L["MENU_BAR_COLOUR_BORDER_DEFAULT_DESC"] = "use the default colour for the border of bar %1$s"
	L["MENU_BAR_COLOUR_BORDER_CUSTOM_DESC"] = "use a custom colour for the border of bar %1$s"
	L["MENU_BAR_COLOUR_BORDER_DESC"] = "set the colour to use for the border of bar %1$s"
	L["MENU_BAR_COLOUR_BACKGROUND_DEFAULT_DESC"] = "use the default colour for the background of bar %1$s"
	L["MENU_BAR_COLOUR_BACKGROUND_CUSTOM_DESC"] = "use a custom colour for the background of bar %1$s"
	L["MENU_BAR_COLOUR_BACKGROUND_DESC"] = "set the colour to use for the background of bar %1$s"
	L["MENU_BAR_COLOUR_NAME_DEFAULT_DESC"] = "use the default colour for the name of bar %1$s"
	L["MENU_BAR_COLOUR_NAME_CUSTOM_DESC"] = "use a custom colour for the name of bar %1$s"
	L["MENU_BAR_COLOUR_NAME_DESC"] = "set the colour to use for the name of bar %1$s"
	L["MENU_LOCKED_DESC"] = "This location is using a System %1$s so some of the options are hidden\n\nIf you wish to make changes please assign a non System %1$s to this location under %2$s > %3$s\n\nNote: you may need to create one first"
	L["MENU_LOCKED_LIST_DESC"] = "This location is using a list view so none of these options are configurable."
	L["MENU_BAR_TRANSFER"] = "Transfer"
	L["MENU_BAR_TRANSFER_LOCATION"] = "Transfer to %1$s"
	L["MENU_BAR_TRANSFER_LOCATION_DESC"] = "Click to move all items in this bar (%1$s) to the %2$s"
	
	
--	changer bag menu
	L["MENU_BAG_TITLE"] = "Bag Options"
	L["MENU_BAG_SHOW_DESC"] = "display the contents of this bag"
	L["MENU_BAG_ISOLATE"] = "Isolate"
	L["MENU_BAG_ISOLATE_DESC"] = "only display the contents of this bag"
	L["MENU_BAG_SHOWALL"] = "Display All"
	L["MENU_BAG_SHOWALL_DESC"] = "display the contents of all bags for this location"
	L["MENU_BAG_EMPTY_DESC"] = "moves the contents of this bag to your other bags"
	
	
--	configuration options
	L["CONFIG"] = "Config"
	L["CONFIG_DESC"] = "Configuration Options"
	L["CONFIG_IS_PER_CHARACTER"] = "\n\nNote - This option is per character so its setting only applies to %1$s."
	L["CONFIG_IS_CVAR"] = "\n\nNote - This option is a global CVAR and will apply to all characters."
	
--	configuration options > system
	L["CONFIG_GENERAL_DESC"] = "Display Options"
	
	L["CONFIG_GENERAL_FONT_DESC"] = "select the font to use"
	
	L["CONFIG_GENERAL_FRAMESTRATA"] = "Frame Strata"
	L["CONFIG_GENERAL_FRAMESTRATA_DESC"] = "select the frameStrata for the windows to be drawn on."
	
	L["CONFIG_GENERAL_REPOSITION_ONSHOW"] = "Reposition on Show"
	L["CONFIG_GENERAL_REPOSITION_ONSHOW_DESC"] = "If a window is off screen this will reposition it back on screen when it is re-opened"
	
	L["CONFIG_SORTING_WHEN_DESC"] = "When to re-sort the windows"
	L["CONFIG_SORTING_WHEN_INSTANT"] = "Instantly"
	L["CONFIG_SORTING_WHEN_INSTANT_DESC"] = "Re-Sorting will occur after every item change"
	L["CONFIG_SORTING_WHEN_OPEN"] = "On Window Open"
	L["CONFIG_SORTING_WHEN_OPEN_DESC"] = "Re-Sorting will only occur when you open the window"
	L["CONFIG_SORTING_WHEN_MANUAL"] = "Manually"
	L["CONFIG_SORTING_WHEN_MANUAL_DESC"] = "Re-Sorting will only occur when you manually refresh the window"
	
	L["CONFIG_GENERAL_TOOLTIP"] = "Tooltips"
	L["CONFIG_GENERAL_TOOLTIP_ENABLE_DESC"] = "display tooltips"
	L["CONFIG_GENERAL_TOOLTIP_EMPTY_ADD"] = "Empty Line"
	L["CONFIG_GENERAL_TOOLTIP_EMPTY_ADD_DESC"] = "add an empty line between the basic tooltip text and any custom text to be added"
	L["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT"] = "Item Count"
	L["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT_ENABLE_DESC"] = "include item counts in tooltips"
	L["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT_COLOUR_CLASS_DESC"] = "use class colours to colour player names"
	L["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT_COLOUR_TEXT_DESC"] = "set the colour of the item count tooltip text"
	L["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT_COLOUR_AMOUNTS_DESC"] = "set the colour of the item count amounts"
	L["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT_VAULT_TABS_DESC"] = "include tab numbers for items found in a %1$s" -- %1$s = vault
	L["CONFIG_GENERAL_TOOLTIP_MONEY_ENABLE_DESC"] = "include money amounts in tooltips"
	L["CONFIG_GENERAL_TOOLTIP_MONEY_COLOUR_CLASS_DESC"] = "use class colours to colour player names"
	L["CONFIG_GENERAL_TOOLTIP_MONEY_COLOUR_TEXT_DESC"] = "set the colour of the money tooltip text"
	L["CONFIG_GENERAL_TOOLTIP_MONEY_COLOUR_AMOUNTS_DESC"] = "set the colour of the money amounts"
	L["CONFIG_GENERAL_TOOLTIP_SCALE_DESC"] = "scales the game, reference and comparison tooltips (game wide)"
	L["CONFIG_GENERAL_TOOLTIP_SELF_ONLY"] = "Self only"
	L["CONFIG_GENERAL_TOOLTIP_SELF_ONLY_DESC"] = "display data only for the current character"
	L["CONFIG_GENERAL_TOOLTIP_HIGHLIGHT"] = "Self Highlight"
	L["CONFIG_GENERAL_TOOLTIP_HIGHLIGHT_DESC"] = "text to add to the front of the current characters name to make it more obvious in the list (limit of 3 characters)"
	L["CONFIG_GENERAL_TOOLTIP_ACCOUNT_ONLY"] = "Account only"
	L["CONFIG_GENERAL_TOOLTIP_ACCOUNT_ONLY_DESC"] = "display data only for the current characters account"
	L["CONFIG_GENERAL_TOOLTIP_FACTION_ONLY"] = "Faction only"
	L["CONFIG_GENERAL_TOOLTIP_FACTION_ONLY_DESC"] = "display data only for the current characters faction"
	L["CONFIG_GENERAL_TOOLTIP_REALM_ONLY"] = "Realm only"
	L["CONFIG_GENERAL_TOOLTIP_REALM_ONLY_DESC"] = "display data only for the current characters realm"
	L["CONFIG_GENERAL_TOOLTIP_CROSSREALM"] = "Connected Realms"
	L["CONFIG_GENERAL_TOOLTIP_CROSSREALM_DESC"] = "display data from realms connected to the current characters realm"
	L["CONFIG_GENERAL_TOOLTIP_LOCATION_INCLUDE_DESC"] = "include %1$s data in the item counts on tooltips" -- %1$s = location name
	L["CONFIG_GENERAL_TOOLTIP_BATTLEPET_SOURCE_DESC"] = "include source text in tooltip"
	L["CONFIG_GENERAL_TOOLTIP_BATTLEPET_DESCRIPTION_DESC"] = "include description text in tooltip"
	L["CONFIG_GENERAL_TOOLTIP_BATTLEPET_CUSTOM_ENABLE_DESC"] = "replace the in-built battlepet tooltip with custom tooltip to allow for item counts"
	L["CONFIG_GENERAL_TOOLTIP_BATTLEPET_MOUSEOVER_ENABLE_DESC"] = "include extra text in mouseover tooltips for player, npc and wild battlepets"
	L["CONFIG_GENERAL_TOOLTIP_REPUTATION_NORMAL_DESC"] = "What text you want displayed for reputation values in the reputation tooltip."
	L["CONFIG_GENERAL_TOOLTIP_REPUTATION_ITEMCOUNT"] = "Item Count"
	L["CONFIG_GENERAL_TOOLTIP_REPUTATION_ITEMCOUNT_DESC"] = "What text you want displayed for reputation values in item counts."
	L["CONFIG_GENERAL_TOOLTIP_REPUTATION_TOKEN_DESC"] = "\n\nIf you use one of the tokens below it will be replaced with the appropriate reputation information.\n\n*nn* = faction name\n*st* = standing text\n*bv* = bar value\n*bm* = bar max\n*bp* = bar percent\n*br* = bar remaining\n*rv* = rank value\n*rm* = rank max\n*pv* = paragon level (+N)\n*pr* = paragon reward icon"
	
	L["CONFIG_GENERAL_WORKAROUND"] = "Workarounds"
	L["CONFIG_GENERAL_WORKAROUND_DESC"] = "toggle the code to fix or work around this issue"
	L["CONFIG_GENERAL_WORKAROUND_FRAMELEVEL"] = "Frame Level"
	L["CONFIG_GENERAL_WORKAROUND_FRAMELEVEL_DESC"] = "A bug in the blizzard CreateFrame API which can cause a frames background to appear above the foreground, item tooltips won't appear and it's impossible to click on anything in the window."
	L["CONFIG_GENERAL_WORKAROUND_FRAMELEVEL_ALERT_DESC"] = "set how framelevel bug fix alerts are displayed"
	L["CONFIG_GENERAL_WORKAROUND_FRAMELEVEL_ALERT_STYLE0_DESC"] = "disables bug fix alerts from being displayed"
	L["CONFIG_GENERAL_WORKAROUND_FRAMELEVEL_ALERT_STYLE1_DESC"] = "displays the short text for bug fix alerts"
	L["CONFIG_GENERAL_WORKAROUND_FRAMELEVEL_ALERT_STYLE2_DESC"] = "displays the full text for bug fix alerts"
	L["CONFIG_GENERAL_WORKAROUND_ZEROSIZEBAG"] = "Zero Size Bag"
	L["CONFIG_GENERAL_WORKAROUND_ZEROSIZEBAG_DESC"] = "A potential bug where zero or nil is returned for the size of a bag instead of it's correct size."
	L["CONFIG_GENERAL_WORKAROUND_ZEROSIZEBAG_ALERT_DESC"] = "display alerts for this bug"
	L["CONFIG_GENERAL_WORKAROUND_THREAD"] = "Threads (co-routines)"
	L["CONFIG_GENERAL_WORKAROUND_THREAD_DEBUG_DESC"] = "toggle thread debug output\n\nNote: Don't turn this on unless you have a very good reason to do so."
	L["CONFIG_GENERAL_WORKAROUND_THREAD_DISABLED_DESC"] = "toggle the use of threads (co-routines) - these stop you from getting \"script ran too long\" errors.\n\nNote: Don't turn this off unless you have a very good reason to do so.\n\nThis is a per session variable and will revert back to Enabled at every UI Reload"
	L["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT"] = "Timeout (ms)"
	L["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_DESC"] = "the number of milliseconds before the code will yield so it doesnt hit the script timer limit when %1$s"
	L["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_NORMAL"] = "Out of Combat"
	L["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_COMBAT"] = "In Combat"
	L["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_TOOLTIP"] = "Building Tooltips"
	L["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_OBJECTDATA"] = "Retreiving Object Data"
	L["BUGFIX_TAINTED_ALERT_MOUSEOVER_DESC"] = "this item frame was created while you\nwere in combat which has caused\nit to be tainted and cannot\nbe used until you leave combat"
	L["BUGFIX_TAINTED_ALERT_OPEN_DESC"] = "some of the item frames for this window were created while you were in combat which has caused them to be tainted and cannot be used until you leave combat"
	
	L["CONFIG_GENERAL_MESSAGES"] = "Messages / Alerts"
	L["CONFIG_GENERAL_MESSAGES_RESTACK_DESC"] = "Show restack notification messages for the %1$s"
	L["CONFIG_GENERAL_MESSAGES_TRANSLATION"] = "Translation"
	L["CONFIG_GENERAL_MESSAGES_TRANSLATION_INTERIM"] = "Interim"
	L["CONFIG_GENERAL_MESSAGES_TRANSLATION_INTERIM_DESC"] = "Show a message for each translation attempt"
	L["CONFIG_GENERAL_MESSAGES_TRANSLATION_FINAL"] = "Final"
	L["CONFIG_GENERAL_MESSAGES_TRANSLATION_FINAL_DESC"] = "Show a message for the final/successful translation"
	L["CONFIG_GENERAL_MESSAGES_BATTLEPET_OPPONENT"] = "Opponent Details"
	L["CONFIG_GENERAL_MESSAGES_BATTLEPET_OPPONENT_DESC"] = "Display Opponent Details upon entering a pet battle"
	L["CONFIG_GENERAL_MESSAGES_BAG_UNKNOWN"] = "Unknown Bag Type"
	L["CONFIG_GENERAL_MESSAGES_BAG_UNKNOWN_DESC"] = "Show a warning message when a bag does not have a valid type and needs to be requeued for scanning"
	L["CONFIG_GENERAL_MESSAGES_RULES_STATE"] = "State"
	L["CONFIG_GENERAL_MESSAGES_RULES_STATE_DESC"] = "Show a message when rules are enabled/disabled"
	L["CONFIG_GENERAL_MESSAGES_RULES_HOOKED"] = "Hooks"
	L["CONFIG_GENERAL_MESSAGES_RULES_HOOKED_DESC"] = "Show a message when a third party mod is loaded/hooked"
	L["CONFIG_GENERAL_MESSAGES_RULES_REGISTRATION"] = "Registration"
	L["CONFIG_GENERAL_MESSAGES_RULES_REGISTRATION_DESC"] = "Show a message for each third party rule registration"
	L["CONFIG_GENERAL_MESSAGES_CROSSREALM_LOADED"] = "Loaded"
	L["CONFIG_GENERAL_MESSAGES_CROSSREALM_LOADED_DESC"] = "Show a message when connected realm data is loaded"
	L["CONFIG_GENERAL_MESSAGES_OBJECTCACHE"] = "Object Cache"
	L["CONFIG_GENERAL_MESSAGES_OBJECTCACHE_NOTFOUND"] = "Not Found"
	L["CONFIG_GENERAL_MESSAGES_OBJECTCACHE_NOTFOUND_DESC"] = "Show a message when object data is not returned from the server after five attempts"
	
	L["CONFIG_GENERAL_BUCKET"] = "Update Timers"
	L["CONFIG_GENERAL_BUCKET_DESC"] = "Adjust the update time for the %1$s\n\nUpdate timers run every X seconds allowing you to throttle window updates."
	L["CONFIG_GENERAL_BUCKET_CUSTOM_DESC"] = "use a custom value for the %1$s update timer.\n\nThe default value for this timer is %2$0.1d seconds"
	
	L["CONFIG_GENERAL_TRANSMOG"] = "transmog status icon"
	L["CONFIG_GENERAL_TRANSMOG_SHOW_DESC"] = "show transmog status icons"
	L["CONFIG_GENERAL_TRANSMOG_SECONDARY"] = "Secondary sources"
	L["CONFIG_GENERAL_TRANSMOG_SECONDARY_DESC"] = "show status icons for secondary sources. for appearances you've already learnt but not from this source"
	L["CONFIG_GENERAL_TRANSMOG_CLM"] = "Can Learn - Myself"
	L["CONFIG_GENERAL_TRANSMOG_CLM_DESC"] = "the appearance of this item is unknown, it can be learnt on this character by equipping the item"
	L["CONFIG_GENERAL_TRANSMOG_CLO"] = "Can Learn - Other"
	L["CONFIG_GENERAL_TRANSMOG_CLO_DESC"] = "the appearance of this item is unknown, it can be learnt on another character of the appropriate class if you mail the item to them"
	L["CONFIG_GENERAL_TRANSMOG_CLMS"] = "Can Learn - Myself - Secondary Source"
	L["CONFIG_GENERAL_TRANSMOG_CLMS_DESC"] = "the appearance of this item is known, but from another source.  this source can be learnt on this character by equipping the item"
	L["CONFIG_GENERAL_TRANSMOG_CLOS"] = "Can Learn - Other - Secondary Source"
	L["CONFIG_GENERAL_TRANSMOG_CLOS_DESC"] = "the appearance of this item is known, but from another source.  this source can be learnt on another character of the appropriate class if you mail the item to them"
	
	L["CONFIG_GENERAL_CONFLICT"] = "Addon Conflicts"
	L["CONFIG_GENERAL_CONFLICT_TSM_MAILBOX_DESC"] = "enable this if you have set TSM to be the mailbox window"
	L["CONFIG_GENERAL_CONFLICT_TSM_MERCHANT_DESC"] = "enable this if you have set TSM to be the merchant window"
	
	L["CONFIG_GENERAL_TRADESKILL_PRIORITY"] = "Priority"
	L["CONFIG_GENERAL_TRADESKILL_PRIORITY_DESC"] = "Select which %1$s you want items categorised for first.\n\nThis will save the slot the %1$s is in, not the actual %1$s."
	L["CONFIG_GENERAL_TRADESKILL_LOADSCAN"] = "Scan on Load"
	L["CONFIG_GENERAL_TRADESKILL_LOADSCAN_DESC"] = "Enabled: When you first enter the game the %1$s window will be opened and all of your %2$s will be loaded and scanned.\n\nDisabled: Will not do the initial scan, will only scan a %1$s when you open the %1$s window yourself."
	L["CONFIG_GENERAL_TRADESKILL_QUIET"] = "Mute"
	L["CONFIG_GENERAL_TRADESKILL_QUIET_DESC"] = "When the %1$s option is enabled the %2$s window is opened, that makes noise which may, or may not, be annoying for you.\n\nEnabled: will mute your sound when the on load scanning starts and unmute it when they are done.\n\nDisabled: Wont touch your sound settings and you will hear the windows open."
	
	L["CONFIG_GENERAL_BONUSID"] = "Bonus IDs"
	L["CONFIG_GENERAL_BONUSID_COUNT"] = "Item Count"
	L["CONFIG_GENERAL_BONUSID_SUFFIX"] = "Item Suffix"
	L["CONFIG_GENERAL_BONUSID_SUFFIX_COUNT_DESC"] = "Enabled: Generates a count for each item suffix found\n\nDisabled: Ignores any item suffix and generates a count for the base item instead"
	L["CONFIG_GENERAL_BONUSID_SEARCH"] = "Item Search"
	L["CONFIG_GENERAL_BONUSID_SUFFIX_SEARCH_DESC"] = "Enabled: Searches against the item with its suffix\n\nDisabled: Ignores any item suffix and searches against the base item instead"
	L["CONFIG_GENERAL_BONUSID_CORRUPTION"] = "Corruption"
	L["CONFIG_GENERAL_BONUSID_CORRUPTION_SEARCH_DESC"] = "Enabled: Searches against the item with its corruption\n\nDisabled: Ignores any item corruption and searches against the base item instead"
	
	
--	configuration options > auto
	L["CONFIG_AUTO"] = "Auto Open/Close"
	L["CONFIG_AUTO_SCRAP"] = "Scrapping Machine"
	L["CONFIG_AUTO_COMBAT"] = "Enter Combat"
	
	L["CONFIG_AUTO_OPEN"] = "Auto Open"
	L["CONFIG_AUTO_OPEN_DESC"] = "%3$s = The %2$s will not be opened when the %1$s is opened.\n\n%4$s = The %2$s will be opened when the %1$s is opened."
	
	L["CONFIG_AUTO_CLOSE"] = "Auto Close"
	L["CONFIG_AUTO_CLOSE_DESC"] = "%3$s = The %2$s will not be closed when the %1$s is closed.\n\n%4$s = The %2$s will be closed but only if it was opened by the %1$s.\n\n%5$s = The %2$s will always be closed when the %1$s is closed."
	L["CONFIG_AUTO_CLOSE_COMBAT_DESC"] = "%3$s = The %2$s will not be closed when you %1$s.\n\n%4$s = The %2$s will be closed when you %1$s."
	
	
--	configuration settings > control
	L["CONFIG_CONTROL_MONITOR"] = "Monitor"
	L["CONFIG_CONTROL_MONITOR_DESC"] = "monitor changes to %1$s data." -- %1$s = location name, **removed ** %2$s = chacracter name
	L["CONFIG_CONTROL_SAVE_DESC"] = "save %1$s data so that you can view it while on another character (or offline)." -- %1$s = location name, **removed ** %2$s = chacracter name
	L["CONFIG_CONTROL_NOTIFY_ERASE_DESC"] = "generate a notification when erasing %s data"
	L["CONFIG_CONTROL_OVERRIDE_DESC"] = "override the original Blizzard %2$s so that %1$s controls it instead.\n\ndisabling this option will return the standard Blizzard %2$s functionality.\n\nyou will still be able to open the %1$s %2$s when this is disabled but you will need to configure and use a keybinding instead." -- %1$s = program, %2$s = location
	L["CONFIG_CONTROL_SPECIAL_DESC"] = "whether to treat the %2$s window as special or not.\n\nall special windows are closed when the ESCAPE key is pressed.\n\nyou will need to reload the UI for this setting to take effect." -- %1$s = program, %2$s = location
	L["CONFIG_CONTROL_ANCHOR_LOCK_DESC"] = "lock the %1$s window so it can't be moved" -- %1$s = location name
	L["CONFIG_CONTROL_REPOSITION_NOW"] = "Reposition Now"
	L["CONFIG_CONTROL_REPOSITION_NOW_DESC"] = "Repositions the %1$s window back onto the screen now" -- %1$s = location name
	L["CONFIG_CONTROL_BLUEPRINT_DESC"] = "select which %2$s to use when generating the %1$s window" -- %1$s = location name
	L["CONFIG_CONTROL_WITH_ARKINV"] = "Click to override the original Blizzard %2$s so that %1$s controls it instead." -- %1$s = program, %2$s = location
	L["CONFIG_CONTROL_WITH_BLIZZARD"] = "Click to testore the original Blizzard %2$s so that %1$s no longer controls it." -- %1$s = program, %2$s = location
	
	
--	configuration settings > design/style/layout
	L["CONFIG_DESIGN"] = "Design"
	L["CONFIG_DESIGN_PLURAL"] = "Designs"
	
	L["CONFIG_BLUEPRINT"] = "Blueprint"
	L["CONFIG_BLUEPRINT_VALIDATE"] = "The %%1$s [%%2$s] being used by the %1$s location no longer exists.  Please check %2$s > %3$s > %4$s > %5$s > %6$s"
	
	L["CONFIG_STYLE"] = "Style"
	L["CONFIG_STYLE_PLURAL"] = "Styles"
	L["CONFIG_STYLE_DESCRIPTION"] = "to be done"
	
	L["CONFIG_LAYOUT"] = "Layout"
	L["CONFIG_LAYOUT_PLURAL"] = "Layouts"
	L["CONFIG_LAYOUT_DESCRIPTION"] = "Layouts contain all the data on what category goes where, along with all the custom bar data, and are the second half of a Design, Styles being the first half.  Combined with a Category Set they make up the Blueprint for the window.\n\n\nWhile the Layout options are stored here, You don't modify them directly from here, you can do that via the Edit Mode menus."
	
	L["CONFIG_DESIGN_WINDOW"] = "Window"
	L["CONFIG_DESIGN_WINDOW_SCALE_DESC"] = "set the scale, making the window larger or smaller"
	L["CONFIG_DESIGN_WINDOW_PADDING_DESC"] = "set the amount of space to add between the window edge and the bars"
	L["CONFIG_DESIGN_WINDOW_WIDTH_DESC"] = "set the maximum number of items to display in a single row"
	L["CONFIG_DESIGN_WINDOW_HEIGHT_DESC"] = "set the maximum height of the window (in pixels)\n\nif you have more items than will fit then the window will scroll, less items and it will shrink"
	L["CONFIG_DESIGN_WINDOW_BACKGROUND_COLOUR_DESC"] = "set the background colour of the window"
	L["CONFIG_DESIGN_WINDOW_SCROLLBAR"] = "Scroll Bar"
	L["CONFIG_DESIGN_WINDOW_SCROLLBAR_STYLE_DESC"] = "set the background style of the windows scroll bar"
	L["CONFIG_DESIGN_WINDOW_SCROLLBAR_COLOUR_DESC"] = "set the background colour of the windows scroll bar"
	L["CONFIG_DESIGN_WINDOW_BORDER_SHOW_DESC"] = "display a border around the window"
	L["CONFIG_DESIGN_WINDOW_BORDER_STYLE_DESC"] = "set the border style for the window"
	L["CONFIG_DESIGN_WINDOW_BORDER_COLOUR_DESC"] = "set the border colour for the window"
	L["CONFIG_DESIGN_WINDOW_LIST"] = "Display as List"
	L["CONFIG_DESIGN_WINDOW_LIST_DESC"] = "Display the window content in a list format"
	
	L["CONFIG_DESIGN_FRAME_HIDE_DESC"] = "Do not display the %s frame"
	
	L["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT"] = "Highlight Colour"
	L["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT_DESC"] = "Highlight all slots belonging to a bag when you mouseover it's icon"
	L["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT_COLOUR_DESC"] = "Sets the colour used for the highlight"
	L["CONFIG_DESIGN_FRAME_CHANGER_FREE"] = "Free Bag Slots"
	L["CONFIG_DESIGN_FRAME_CHANGER_FREE_DESC"] = "Display the number of free slots available on the bag icon"
	L["CONFIG_DESIGN_FRAME_CHANGER_FREE_COLOUR_DESC"] = "Sets the colour of the free slot count text"
	
	L["CONFIG_DESIGN_FRAME_STATUS_EMPTY"] = "Empty slot text"
	L["CONFIG_DESIGN_FRAME_STATUS_EMPTY_DESC"] = "Display the empty slot text"
	
	L["CONFIG_DESIGN_FRAME_SEARCH_LABEL_COLOUR_DESC"] = "set the colour of the search label"
	L["CONFIG_DESIGN_FRAME_SEARCH_TEXT_COLOUR_DESC"] = "set the colour fo the search text"
	
	L["CONFIG_DESIGN_FRAME_TITLE_SIZE_NORMAL"] = "Normal"
	L["CONFIG_DESIGN_FRAME_TITLE_SIZE_THIN"] = "Thin"
	L["CONFIG_DESIGN_FRAME_TITLE_ONLINE_COLOUR_DESC"] = "set the colour of the title text for online (current characters) data"
	L["CONFIG_DESIGN_FRAME_TITLE_OFFLINE_COLOUR_DESC"] = "set the colour of the title text for offline (another characters) data"
	
	L["CONFIG_DESIGN_BAR"] = "Bars"
	L["CONFIG_DESIGN_BAR_PER_ROW"] = "Per Row"
	L["CONFIG_DESIGN_BAR_PER_ROW_DESC"] = "set the number of bars to display in each row"
	L["CONFIG_DESIGN_BAR_BACKGROUND_DESC"] = "set the background colour for bars"
	L["CONFIG_DESIGN_BAR_COMPACT"] = "Compact"
	L["CONFIG_DESIGN_BAR_COMPACT_DESC"] = "display all non empty bars in sequential order"
	L["CONFIG_DESIGN_BAR_SHOW_EMPTY"] = "Show empty"
	L["CONFIG_DESIGN_BAR_SHOW_EMPTY_DESC"] = "display empty bars"
	L["CONFIG_DESIGN_BAR_PADDING_INTERNAL_DESC"] = "the amount of space to add between the bars and the items"
	L["CONFIG_DESIGN_BAR_PADDING_EXTERNAL_DESC"] = "the amount of space to add between bars"
	L["CONFIG_DESIGN_BAR_BORDER_DESC"] = "display a border around each bar"
	L["CONFIG_DESIGN_BAR_BORDER_STYLE_DESC"] = "set the border style for bars"
	L["CONFIG_DESIGN_BAR_BORDER_COLOUR_DESC"] = "set the colour for the border around the bars"
	L["CONFIG_DESIGN_BAR_NAME_DESC"] = "set the name for bar %1$s"
	L["CONFIG_DESIGN_BAR_NAME_SHOW_DESC"] = "display bar names"
	L["CONFIG_DESIGN_BAR_NAME_EDITMODE_DESC"] = "display bar names in %1$s"
	L["CONFIG_DESIGN_BAR_NAME_COLOUR_DESC"] = "set the colour of the bar name"
	L["CONFIG_DESIGN_BAR_NAME_HEIGHT_DESC"] = "set the amount of space allocated to display the bar name in"
	L["CONFIG_DESIGN_BAR_NAME_ANCHOR_DESC"] = "set the anchor point of the bar name"
	L["CONFIG_DESIGN_BAR_WIDTH_MIN_DESC"] = "set the minimum width for all bars\n\nset to zero (0) for automatic\n\ncan be overridden at the individual bar level"
	L["CONFIG_DESIGN_BAR_WIDTH_MAX_DESC"] = "set the maximum width for all bars\n\nset to zero (0) for automatic\n\ncan be overridden at the individual bar level"
	
	L["CONFIG_DESIGN_ITEM_PADDING_DESC"] = "set the amount of space to add between item slots"
	L["CONFIG_DESIGN_ITEM_HIDDEN"] = "Show hidden"
	L["CONFIG_DESIGN_ITEM_HIDDEN_DESC"] = "toggle hidden categories and stacks"
	L["CONFIG_DESIGN_ITEM_FADE"] = "Fade offline"
	L["CONFIG_DESIGN_ITEM_FADE_DESC"] = "fade offline items"
	L["CONFIG_DESIGN_ITEM_TINT_UNUSABLE"] = "Tint Unusable"
	L["CONFIG_DESIGN_ITEM_TINT_UNUSABLE_DESC"] = "tint unusable items red"
	L["CONFIG_DESIGN_ITEM_TINT_UNWEARABLE"] = "Tint Unwearable"
	L["CONFIG_DESIGN_ITEM_TINT_UNWEARABLE_DESC"] = "tint items that are not your armor class red.\n\nWhile you can wear them, you really shouldnt."
	L["CONFIG_DESIGN_ITEM_ITEMLEVEL"] = "Item Level"
	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_DESC"] = "show item level"
	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_QUALITY_DESC"] = "use the items quality colour for the item text"
	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_EQUIP_DESC"] = "show item level for equippable items"
	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_EQUIP_MINIMUM_DESC"] = "minimum item level to show"
	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_BAGS_DESC"] = "show slot count for non-equipped bags"
	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_STOCK"] = "Stock"
	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_STOCK_DESC"] = "show stock value for non-equippable items"
	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_STOCK_TOTAL_DESC"] = "enabled: show the total value for the stack\n\ndisabled: show the single value for the item"
	L["CONFIG_DESIGN_ITEM_STACKLIMIT"] = "Stack Limit"
	L["CONFIG_DESIGN_ITEM_STACKLIMIT_STACKS"] = "Stacks"
	L["CONFIG_DESIGN_ITEM_STACKLIMIT_STACKS_DESC"] = "only show this many stacks of an item and hide the rest\n\nuse show hidden items to temporarily see all stacks\n\nset to zero to always display all stacks\n\nNote: displayed stacks may not be the newest or largest"
	L["CONFIG_DESIGN_ITEM_STACKLIMIT_IDENTIFY_SHOW"] = "Add Indicator"
	L["CONFIG_DESIGN_ITEM_STACKLIMIT_IDENTIFY_SHOW_DESC"] = "add a + character to the item count to indicate there are hidden stacks for that item"
	L["CONFIG_DESIGN_ITEM_STACKLIMIT_IDENTIFY_POSITION_DESC"] = "where to add the indicator text"
	L["CONFIG_DESIGN_ITEM_ITEMCOUNT"] = "Item Count"
	L["CONFIG_DESIGN_ITEM_ITEMCOUNT_DESC"] = "show item stack counts"
	L["CONFIG_DESIGN_ITEM_STATUSICON"] = "Status Icons"
	L["CONFIG_DESIGN_ITEM_STATUSICON_TEXT"] = "%1$s icon"
	L["CONFIG_DESIGN_ITEM_STATUSICON_DESC"] = "Enabled: Show the %1$s when required.\n\nDisabled: Never show the %1$s."
	L["CONFIG_DESIGN_ITEM_STATUSICON_UPGRADE"] = UPGRADE or "Upgrade"
	L["CONFIG_DESIGN_ITEM_STATUSICON_QUEST_BANG_DESC"] = "show the quest bang (!) icon"
	L["CONFIG_DESIGN_ITEM_STATUSICON_QUEST_BORDER_DESC"] = "show the quest border"
	L["CONFIG_DESIGN_ITEM_SIZE"] = "Base Item Size"
	L["CONFIG_DESIGN_ITEM_SIZE_DESC"] = "set the size of the item icon before it is scaled (default size is %d)"
	
	L["CONFIG_DESIGN_ITEM_OVERLAY"] = "Overlays"
	L["CONFIG_DESIGN_ITEM_OVERLAY_TEXT"] = "%1$s overlay"
	L["CONFIG_DESIGN_ITEM_OVERLAY_NZOTH"] = "N'Zoth Corruption"
	L["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK"] = "Profession Quality"
	L["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK_NUMBER_DESC"] = "Enabled: Show the %1$s as a number\n\nDisabled: Show the %1$s as an icon"
	L["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK_CUSTOM_DESC"] = "Enabled: Use a custom colour for the %1$s\n\nDisabled: Use the default colours for the %1$s"
	L["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK_COLOUR_DESC"] = "Set the colour of the %1$s"
	
	L["CONFIG_DESIGN_ITEM_COOLDOWN_SHOW_DESC"] = "Display cooldowns"
	L["CONFIG_DESIGN_ITEM_COOLDOWN_NUMBER"] = COUNTDOWN_FOR_COOLDOWNS_TEXT
	L["CONFIG_DESIGN_ITEM_COOLDOWN_NUMBER_DESC"] = "Show the remaining cooldown as a number"
	L["CONFIG_DESIGN_ITEM_COOLDOWN_COMBAT"] = "Refresh in combat"
	L["CONFIG_DESIGN_ITEM_COOLDOWN_COMBAT_DESC"] = "Show cooldowns while in combat, or wait until combat has ended"
	L["CONFIG_DESIGN_ITEM_COOLDOWN_ONOPEN_DESC"] = "Refresh the window when opened to show any new cooldowns"
	
	L["CONFIG_DESIGN_ITEM_BORDER_SHOW_DESC"] = "show borders around items or not"
	L["CONFIG_DESIGN_ITEM_BORDER_STYLE_DESC"] = "set the border style for items"
	L["CONFIG_DESIGN_ITEM_BORDER_QUALITY_DESC"] = "colour the border around each item to match it's quality (Common, Rare, Epic, etc)"
	L["CONFIG_DESIGN_ITEM_BORDER_QUALITY_CUTOFF"] = "Quality Cutoff"
	L["CONFIG_DESIGN_ITEM_BORDER_QUALITY_CUTOFF_DESC"] = "only colour the item border if the item quality is equal to or above: %s%s|r"
	L["CONFIG_DESIGN_ITEM_BORDER_TEXTURE_OFFSET_DESC"] = "the number pixels from the outside of the image to the inside edge of the border itself (used to realign the border to the item texture)"
	
	L["CONFIG_DESIGN_ITEM_OVERRIDE_NEW"] = "New Items"
	L["CONFIG_DESIGN_ITEM_OVERRIDE_NEW_ENABLED_DESC"] = "temporarily reassigns new items, that are within the duration period, to the %1$s category"
	L["CONFIG_DESIGN_ITEM_OVERRIDE_NEW_CUTOFF_DESC"] = "only reassign items to the new items category if they are within this duration."
	L["CONFIG_DESIGN_ITEM_OVERRIDE_NEW_RESET_DESC"] = "reset the new item age timer"
	L["CONFIG_DESIGN_ITEM_OVERRIDE_PARTYLOOT_ENABLED_DESC"] = "reassigns party loot / tradeable items to the %1$s category"
	L["CONFIG_DESIGN_ITEM_OVERRIDE_REFUNDABLE_ENABLED_DESC"] = "reassigns refundable items to the %1$s category"
	
	L["CONFIG_DESIGN_ITEM_AGE"] = "Item Age"
	L["CONFIG_DESIGN_ITEM_AGE_SHOW_DESC"] = "toggles the display of the item age text"
	L["CONFIG_DESIGN_ITEM_AGE_COLOUR_DESC"] = "sets the colour of the item age text"
	L["CONFIG_DESIGN_ITEM_AGE_CUTOFF_DESC"] = "display the items age if they are less than this value.  use 0 to always display the age"
	
	L["CONFIG_DESIGN_ITEM_EMPTY"] = "Empty slots"
	L["CONFIG_DESIGN_ITEM_EMPTY_ICON_DESC"] = "use an icon for empty slot backgrounds"
	L["CONFIG_DESIGN_ITEM_EMPTY_CLUMP"] = "Clump"
	L["CONFIG_DESIGN_ITEM_EMPTY_CLUMP_DESC"] = "clump empty slots in with their non-empty type slots"
	L["CONFIG_DESIGN_ITEM_BORDER_COLOURED"] = "Coloured borders"
	L["CONFIG_DESIGN_ITEM_BORDER_COLOURED_DESC"] = "apply colour to slot borders"
	L["CONFIG_DESIGN_ITEM_COLOUR"] = "Slot colours"
	L["CONFIG_DESIGN_ITEM_COLOUR_DESC"] = "set the %2$s colour for %1$s slots" -- %1$s = slot name, %2$s = background/border
	L["CONFIG_DESIGN_ITEM_ALPHA_DESC"] = "set the alpha level of the slot %1$s" -- %1$s = background/border
	L["CONFIG_DESIGN_ITEM_EMPTY_STATUS"] = "Display Format"
	L["CONFIG_DESIGN_ITEM_EMPTY_FIRST"] = "First Only"
	L["CONFIG_DESIGN_ITEM_EMPTY_FIRST_DESC"] = "only show this many of each empty slot type and hide the rest\n\nuse show hidden items to temporarily see all stacks\n\nset to zero to always display all stacks"
	L["CONFIG_DESIGN_ITEM_EMPTY_POSITION"] = "Sort"
	L["CONFIG_DESIGN_ITEM_EMPTY_POSITION_DESC"] = "how empty slots should be positioned when sorted"
	
	
-- actions
	L["CONFIG_ACTION"] = "Actions"
	L["CONFIG_ACTION_TYPE"] = "%s: %s - %s"
	L["CONFIG_ACTION_TYPE_DESC"] = "Set the action type for %s to %s"
	L["CONFIG_ACTION_WHEN_DESC"] = "Set when the action for %s runs to %s"
	L["CONFIG_ACTION_ENABLE_DESC"] = "Enable the %s action"
	
	L["CONFIG_ACTION_MANUAL_RUN"] = "Manual Action (Vendor, Mail)"
	L["CONFIG_ACTION_TESTMODE"] = "Test Mode"
	
	L["CONFIG_ACTION_VENDOR_SELL"] = "Vendor items"
	L["CONFIG_ACTION_VENDOR_AUTOMATIC_DESC"] = "Process automatic junk action items when you open a vendor"
	L["CONFIG_ACTION_VENDOR_MANUAL_DESC"] = "Process all junk action items when you press the manual action keybinding at a vendor"
	L["CONFIG_ACTION_VENDOR_LIMIT"] = "Limit to Buyback"
	L["CONFIG_ACTION_VENDOR_LIMIT_DESC"] = "As a safety precaution stop selling your junk items when the buyback limit (%i) is reached"
	L["CONFIG_ACTION_VENDOR_LIMIT_ABORT"] = "Processing aborted due to buyback limit (%s) being reached."
	L["CONFIG_ACTION_VENDOR_SOLD"] = "Sold your junk items for %s."
	L["CONFIG_ACTION_VENDOR_SOLD_DESC"] = "Display a notification about how much gold you sold your items for"
	L["CONFIG_ACTION_VENDOR_QUALITY_CUTOFF_DESC"] = "Only sell/destroy an item if its quality is at or below: %s%s|r"
	L["CONFIG_ACTION_VENDOR_LIST_DESC"] = "Display a notification for each item that is sold or destroyed."
	L["CONFIG_ACTION_VENDOR_LIST_SELL_DESC"] = "Sold: %s x %s for %s"
	L["CONFIG_ACTION_VENDOR_TIMER_DESC"] = "the number of millseconds to wait before processing the next item"
	L["CONFIG_ACTION_VENDOR_COMBAT_DESC"] = "If enabled will keep selling/destroying items while in combat"
	
	L["CONFIG_ACTION_VENDOR_DESTROY"] = "Destroy junk items"
	L["CONFIG_ACTION_VENDOR_DESTROY_DESC"] = "Delete items that cannot be vendored (have no sell price)\n\nnote - you can only delete items via the keybinding, and only one item at a time, or by right clicking on the item when at a vendor."
	L["CONFIG_ACTION_VENDOR_DESTROY_LIST"] = "Destroyed: %s x %s"
	L["CONFIG_ACTION_VENDOR_DESTROY_MORE"] = "You have %s more item(s) that can be destroyed."
	L["CONFIG_ACTION_VENDOR_DESTROY_TEST"] = "Test mode is enabled, no items were actually destroyed."
	
	L["CONFIG_ACTION_VENDOR_TESTMODE"] = "Test mode is enabled, no items were actually sold."
	L["CONFIG_ACTION_VENDOR_TESTMODE_DESC"] = "When this option is enabled no items are actually sold or destroyed.\n\nUse with the List option to see what would normally get sold or destroyed."
	L["CONFIG_ACTION_VENDOR_PROCESSING_DISABLED_DESC"] = "All junk selling options have been disabled due to the %s addon being loaded"
	
	L["CONFIG_ACTION_VENDOR_SOULBOUND_ALREADY_KNOWN_DESC"] = "Categorise any soulbound item (typically recipes), that you already know, as junk"
	L["CONFIG_ACTION_VENDOR_SOULBOUND_EQUIPMENT_DESC"] = "Categorise soulbound equipable items, that you cannot use, as junk"
	L["CONFIG_ACTION_VENDOR_SOULBOUND_ITEMLEVEL_DESC"] = "Ignore the item level requirement when categorising soulbound equipable items, that you cannot use, as junk"
	
	L["CONFIG_ACTION_MAIL_SEND"] = "Send items"
	L["CONFIG_ACTION_MAIL_AUTOMATIC_DESC"] = "Process automatic mail action items when you open a mailbox"
	L["CONFIG_ACTION_MAIL_MANUAL_DESC"] = "Process all mail action items when you press the manual action keybinding at a mailbox"
	L["CONFIG_ACTION_MAIL_TESTMODE"] = "Test mode is enabled, no items were actually sent."
	L["CONFIG_ACTION_MAIL_TESTMODE_DESC"] = "When this option is enabled no items are actually sent.\n\nUse with the List option to see what would normally get sent."
	L["CONFIG_ACTION_MAIL_QUALITY_CUTOFF_DESC"] = "Only send an item if its quality is at or below: %s%s|r"
	L["CONFIG_ACTION_MAIL_LIST_DESC"] = "Display a notification for each item that is sent."
	L["CONFIG_ACTION_MAIL_TIMER_DESC"] = "the number of millseconds (approx) to wait before treating the send as failed"
	
	
	
-- sorting
	L["CONFIG_SORTING"] = "Sorting"
	
	L["CONFIG_SORTING_SORT"] = "Sorting"
	
	L["CONFIG_SORTING_METHOD"] = "Sorting Method"
	L["CONFIG_SORTING_METHOD_PLURAL"] = "Sorting Methods"
	L["CONFIG_SORTING_METHOD_DESC"] = "choose how you want your items sorted"
	L["CONFIG_SORTING_METHOD_BAGSLOT"] = "Bag / Slot"
	L["CONFIG_SORTING_METHOD_BAGSLOT_DESC"] = "sorts your items by bag and slot numbers"
	L["CONFIG_SORTING_METHOD_USER"] = "User Defined"
	L["CONFIG_SORTING_METHOD_USER_DESC"] = "sorts your items the way you want"
	
	L["CONFIG_SORTING_BAG"] = "Bag Assignment"
	L["CONFIG_SORTING_BAGS"] = "Bag Assignments"
	L["CONFIG_SORTING_BAG_DESC"] = "choose a Bag Assignment.\n\nAssigns all slots from a bag to a specific bar over-riding the item assignment"
	
	L["CONFIG_SORTING_INCLUDE_NAME"] = "item name"
	L["CONFIG_SORTING_INCLUDE_NAME_DESC"] = "include item name when sorting"
	L["CONFIG_SORTING_INCLUDE_NAME_REVERSE"] = "Use reversed names"
	L["CONFIG_SORTING_INCLUDE_NAME_REVERSE_DESC"] = "use reversed names when sorting.\n\neg Super Mana Potion becomes Potion Mana Super"
	L["CONFIG_SORTING_INCLUDE_QUALITY"] = "item quality"
	L["CONFIG_SORTING_INCLUDE_QUALITY_DESC"] = "include item quality when sorting"
	L["CONFIG_SORTING_INCLUDE_LOCATION"] = "item equip location"
	L["CONFIG_SORTING_INCLUDE_LOCATION_DESC"] = "include item equip locations when sorting.\n\nnote: only affects items that can be equipped"
	L["CONFIG_SORTING_INCLUDE_ITEMTYPE"] = "item type and subtype"
	L["CONFIG_SORTING_INCLUDE_ITEMTYPE_DESC"] = "include item type and subtype when sorting."
	L["CONFIG_SORTING_INCLUDE_CATEGORY"] = "category id"
	L["CONFIG_SORTING_INCLUDE_CATEGORY_DESC"] = "include category id in sorting your inventory"
	L["CONFIG_SORTING_INCLUDE_CATNAME"] = "category name"
	L["CONFIG_SORTING_INCLUDE_CATNAME_DESC"] = "include category name in sorting your inventory"
	L["CONFIG_SORTING_INCLUDE_ITEMUSELEVEL"] = "item (use) level"
	L["CONFIG_SORTING_INCLUDE_ITEMUSELEVEL_DESC"] = "include item (use) level when sorting."
	L["CONFIG_SORTING_INCLUDE_ITEMSTATLEVEL"] = "item (stat) level"
	L["CONFIG_SORTING_INCLUDE_ITEMSTATLEVEL_DESC"] = "include item (stat) level when sorting."
	L["CONFIG_SORTING_INCLUDE_ITEMAGE"] = "item age"
	L["CONFIG_SORTING_INCLUDE_ITEMAGE_DESC"] = "include item age when sorting."
	L["CONFIG_SORTING_INCLUDE_VENDORPRICE"] = "vendor price"
	L["CONFIG_SORTING_INCLUDE_VENDORPRICE_DESC"] = "include vendor price (per current stack size) when sorting."
	L["CONFIG_SORTING_INCLUDE_ID"] = "id"
	L["CONFIG_SORTING_INCLUDE_ID_DESC"] = "include id when sorting."
	L["CONFIG_SORTING_INCLUDE_SLOTTYPE"] = "slot type"
	L["CONFIG_SORTING_INCLUDE_SLOTTYPE_DESC"] = "include slot type when sorting."
	L["CONFIG_SORTING_INCLUDE_EXPANSION"] = "expansion"
	L["CONFIG_SORTING_INCLUDE_EXPANSION_DESC"] = "include expansion the item is from when sorting."
	L["CONFIG_SORTING_INCLUDE_BAGID"] = "bag id"
	L["CONFIG_SORTING_INCLUDE_BAGID_DESC"] = "include bag id when sorting."
	L["CONFIG_SORTING_INCLUDE_SLOTID"] = "slot id"
	L["CONFIG_SORTING_INCLUDE_SLOTID_DESC"] = "include slot id when sorting."
	L["CONFIG_SORTING_INCLUDE_COUNT"] = "item count"
	L["CONFIG_SORTING_INCLUDE_COUNT_DESC"] = "include item count when sorting."
	L["CONFIG_SORTING_INCLUDE_RANK"] = "profession quality"
	L["CONFIG_SORTING_INCLUDE_RANK_DESC"] = "include the profession quality when sorting."
	
	L["CONFIG_SORTING_DIRECTION_DESC"] = "if this is ticked then %1$s will be sorted in descending order\n\nif this is not ticked %1$s will be sorted in ascending order"
	L["CONFIG_SORTING_ORDER"] = "Sort Order"
	L["CONFIG_SORTING_MOVE_UP"] = REALM_STATUS_UP
	L["CONFIG_SORTING_MOVE_UP_DESC"] = "moves %1$s up in the sort order"
	L["CONFIG_SORTING_MOVE_DOWN"] = REALM_STATUS_DOWN
	L["CONFIG_SORTING_MOVE_DOWN_DESC"] = "moves %1$s down in the sort order"
	L["CONFIG_SORTING_NOT_INCLUDED"] = "* not currently included in sort*"
	
	L["CONFIG_LIST_ADD_DESC"] = "add a new %1$s"
	L["CONFIG_LIST_ADD_LIMIT_DESC"] = "the maximum number of %1$s has been reached"
	L["CONFIG_LIST_ADD_UPGRADE_DESC"] = "your data was recently upgraded, a ui reload is required before you can add a %1$s"
	L["CONFIG_LIST_ACTIVATE_DESC"] = "make this the active %1$s"
	L["CONFIG_LIST_DELETE_DESC"] = "delete this %1$s"
	L["CONFIG_LIST_REMOVE_DESC"] = "remove this %1$s"
	L["CONFIG_LIST_RESTORE_DESC"] = "restore this deleted %1$s"
	L["CONFIG_LIST_NAME_DESC"] = "set the name for this %1$s"
	L["CONFIG_LIST_COPY_DESC"] = "copy all values from the selected %1$s to this %1$s"
	L["CONFIG_LIST_PURGE_DESC"] = "purge this deleted %1$s"
	L["CONFIG_LIST_IMPORT_DESC"] = "import a %1$s"
	L["CONFIG_LIST_EXPORT_DESC"] = "export this %1$s"
	
	L["CONFIG_CATEGORY_CUSTOM"] = "Custom Category"
	L["CONFIG_CATEGORY_CUSTOM_PLURAL"] = "Custom Categories"
	
	L["CONFIG_CATEGORY_SYSTEM"] = "System Category"
	L["CONFIG_CATEGORY_SYSTEM_PLURAL"] = "System Categories"
	
	L["CONFIG_RULE_SHOWDISABLED"] = "Show Disabled Rules"
	L["CONFIG_RULE_SHOWDISABLED_DESC"] = "toggles the display of disabled rules"
	L["CONFIG_LIST_WIDTH_DESC"] = "the width of the window"
	L["CONFIG_LIST_ROWS_DESC"] = "the number of entries to display in the list"
	
	L["CONFIG_CATEGORY_SET"] = "Category Set"
	L["CONFIG_CATEGORY_SET_PLURAL"] = "Category Sets"
	L["CONFIG_CATEGORY_SET_DESCRIPTION"] = "Category Sets contain all the data on which categories are enabled/disabled, along with which category an item has been assigned.  Combined with a Design (the Style and Layout) they make up the Blueprint for the window.\n\n\nWhile the Category Set options are stored here, You don't modify them directly from here, you can do that via the Edit Mode menus."
	
	L["CONFIG_PROFILE"] = "Profile"
	L["CONFIG_PROFILE_PLURAL"] = "Profiles"
	L["CONFIG_PROFILE_CURRENT"] = "Current Profile"
	
	L["CONFIG_OBJECT_DELETED"] = "** Deleted %1$s [%2$s] **"
	
	L["CONFIG_UI_MAIN_RETRY"] = "Retry"
	L["CONFIG_UI_MAIN_RETRY_DESC"] = "How many times to attempt building the window while item data is not ready"
	L["CONFIG_UI_MAIN_LOCATIONSORT"] = "Location Sorting"
	L["CONFIG_UI_MAIN_LOCATIONSORT_DESC"] = "How locations should be sorted\n\nEnabled = Sorted alphabetically.\n\nDisabled = Sorted numerically."
	
	
--	configuration options > debug
	L["CONFIG_DEBUG"] = "Debug Mode"
	L["CONFIG_DEBUG_DESC"] = "toggles whether debugging code is enabled or not"
	
	
--	configuration options > generic
	L["CONFIG_BORDER_SCALE_DESC"] = "set the scale for the border texture"
	L["CONFIG_BORDER_TEXTURE_DESC"] = "border texture options"
	L["CONFIG_BORDER_TEXTURE_FILE_DESC"] = "the texture to use for the border"
	L["CONFIG_BORDER_TEXTURE_HEIGHT_DESC"] = "the height (in pixels) of the texture"
	
	
--	main frame
	L["FRAME_ONENTER_DRAG_BAR"] = "release the mouse button to move bar %1$s in front of this bar (%2$s)"
	L["FRAME_ONENTER_DRAG_BAR_ALT"] = "\n\nhold ALT and release the mouse button, to move all categories assigned to bar %1$s to this bar (%2$s)"
	L["FRAME_ONENTER_DRAG_CATEGORY"] = "release the mouse button to assign %1$s to this bar (%2$s)"
	L["FRAME_ONENTER_DRAG_CATEGORY_ALT"] = "\n\nhold ALT and release the mouse button, to assign %1$s to the item being dragged here (%2$s)"
	
	
--	rules frame
	L["RULE_HIDDEN"] = "Hidden"
	L["RULE_FORMULA"] = "Formula"
	L["RULE_LIST_ENABLED"] = "Use"
	L["RULE_LIST_DAMAGED"] = "Dmg"
	L["RULE_LIST_ID"] = "Rule"
	
	L["RULE_DAMAGED"] = "Rule %s is now flagged as damaged and will no longer be used until repaired"
	L["RULE_DAMAGED_DESC"] = "This formula is flagged as damaged.  The rule cannot be used until it is corrected"
	L["RULE_FAILED"] = "Error validating rule %s"
	L["RULE_FAILED_KEY_NIL"] = "id is nil"
	L["RULE_FAILED_DATA_NIL"] = "data is nil"
	L["RULE_FAILED_DESCRIPTION_NIL"] = "description is missing"
	L["RULE_FAILED_FORMULA_NIL"] = "formula is missing"
	L["RULE_FAILED_FORMULA_BAD"] = "invalid formula"
	L["RULE_FAILED_ARGUMENT_IS_NIL"] = "%1$s( ... ), argument %2$i is nil"
	L["RULE_FAILED_ARGUMENT_IS_NOT"] = "%1$s( ... ), argument %2$i is not %3$s"
	L["RULE_FAILED_ARGUMENT_IS_INVALID"] = "%1$s( ... ), argument %2$i is invalid"
	L["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"] = "%1$s( ... ), no arguments specified"
	
	
--	new item indicators
	L["NEW_ITEM_INCREASE"] = "+++"
	L["NEW_ITEM_DECREASE"] = "- - -"
	L["NEW_ITEM_GLOW"] = "New Item Glow"
	L["NEW_ITEM_GLOW_CLEAR_DESC"] = "Clear the New Item Glow when the window is closed"
	
	
--	slash commands
	L["SLASH_UI"] = "ui"
	L["SLASH_UI_DESC"] = "ui options"
	L["SLASH_UI_RESET"] = "reset"
	L["SLASH_UI_RESET_DESC"] = "centers the interface on the screen"
	L["SLASH_UI_RESET_COMPLETE_DESC"] = "all ui windows reset to center of screen"
	L["SLASH_DB"] = "db"
	L["SLASH_DB_DESC"] = "db options"
	L["SLASH_DB_RESET"] = "reset"
	L["SLASH_DB_RESET_DESC"] = "resets all options back to the defaults"
	L["SLASH_DB_RESET_CONFIRM"] = "confirm"
	L["SLASH_DB_RESET_CONFIRM_DESC"] = "confirms the database reset"
	L["SLASH_DB_RESET_COMPLETE_DESC"] = "Profile has been reset.  All options are now back to defaults."
	L["SLASH_CACHE"] = "cache"
	L["SLASH_CACHE_DESC"] = "cache options"
	L["SLASH_CACHE_ERASE"] = "erase"
	L["SLASH_CACHE_ERASE_DESC"] = "erases all cached data"
	L["SLASH_CACHE_ERASE_CONFIRM"] = "confirm"
	L["SLASH_CACHE_ERASE_CONFIRM_DESC"] = "confirms the cache erase"
	L["SLASH_CACHE_ERASE_COMPLETE_DESC"] = "Erase All data for All Characters"
	L["SLASH_MISC"] = "misc"
	L["SLASH_MISC_DESC"] = "misc options"
	L["SLASH_TRACK"] = "track"
	L["SLASH_TRACK_DESC"] = "adds or removes an item from the tracking list"
	L["SLASH_TRACK_ADD_DESC"] = "Added %1$s to the tracking list"
	L["SLASH_TRACK_REMOVE_DESC"] = "Removed %1$s from the tracking list"
	
	
--	misc chat stuff
	L["UPGRADE_PROFILE"] = "Upgrading profile data for [%1$s] to v%2$s" -- profile name, version
	L["UPGRADE_GLOBAL"] = "Upgrading global %1$s data to v%2$s" -- profile type, version
	L["UPGRADE_CHAR"] = "Upgrading character data for %1$s to v%2$s" -- character, version
	
	L["MISC_ALERT"] = "Alert!"
	L["MISC_ALERT_FRAMELEVEL_1"] = "Bug fix complete."
	L["MISC_ALERT_FRAMELEVEL_2"] = "The FrameLevel for the %1$s window is currently at %2$s and has been reset to %3$s to ensure that it remains functional.  Sorry for the lag spike caused by the fix."
	L["MISC_ALERT_SEARCH_NOT_LOADED"] = "Please load and/or enable a search add-on first."
	
	L["BATTLEPET_OPPONENT_IMMUNE"] = "Cannot be Captured"
	L["BATTLEPET_OPPONENT_KNOWN_MAX"] = "Limit Reached"
	L["BATTLEPET_OPPONENT_UPGRADE"] = "Upgrade?"
	L["BATTLEPET_OPPONENT_FORMAT_STRONG"] = "%1$s (%2$s) Strengths" -- 1 = pet type, 2 = pet level
	L["BATTLEPET_OPPONENT_FORMAT_WEAK"] = "%1$s (%2$s) Weaknesses" -- 1 = pet type, 2 = pet level
	L["BATTLEPET_OPPONENT_FORMAT_ABILITY1"] = "%s or %s"
	L["BATTLEPET_OPPONENT_FORMAT_ABILITY2"] = "%s, %s"
	
	
--	item count tooltip
	L["TOOLTIP_VAULT_TABS"] = "Tab"
	L["TOOLTIP_GOLD_AMOUNT"] = "Amount"
	
	
--	generic text
	L["AUTOMATIC"] = "Automatic"
	L["BOTTOMLEFT"] = "Bottom Left"
	L["BOTTOMRIGHT"] = "Bottom Right"
	L["TOPLEFT"] = "Top Left"
	L["TOPRIGHT"] = "Top Right"
	L["BOTTOM"] = "Bottom"
	L["LEFT"] = "Left"
	L["RIGHT"] = "Right"
	L["HORIZONTAL"] = "Horizontal"
	L["VERTICAL"] = "Vertical"
	L["CLOSE_MENU"] = "Close Menu"
	L["ANCHOR"] = "Anchor Point"
	L["ANCHOR_TEXT1"] = "set the anchor point for the %1$s window" -- window name  (bags, bank, vault)
	L["ANCHOR_TEXT2"] = "set the anchor point for the %1$s" -- object name (bars, items)
	L["ANCHOR_TEXT3"] = "set which corner of the %1$s the %2$s should start from" -- object parent name (window, bar), object name (bars, items)
	L["BORDER_DESC"] = "border options"
	L["FILE"] = "File"
	L["HEIGHT"] = "Height"
	L["SCALE"] = "Scale"
	L["TEXTURE"] = "Texture"
	L["FONT"] = "Font"
	L["BACKGROUND_COLOUR"] = "Background Colour"
	L["STYLE"] = "Style"
	L["ALERT"] = "Alert"
	L["PADDING"] = "Padding"
	L["INTERNAL"] = "Internal"
	L["EXTERNAL"] = "External"
	L["WIDTH"] = "Width"
	L["DIRECTION"] = "Direction"
	L["ASCENDING"] = "Ascending"
	L["DESCENDING"] = "Descending"
	L["LOCATION"] = "Location"
	L["LOCATIONS"] = "Locations"
	L["DHMS"] = "dhms"
	L["RANDOM"] = "Random"
	L["RELOAD"] = "Reload"
	L["INSERT"] = "Insert"
	L["OFFSET"] = "Offset"
	L["NUMBER"] = "Number"
	L["STRING"] = "String"
	L["COOLDOWN"] = "Cooldown"
	L["FRAMES"] = "Frames"
	L["CLICK_TO_SELECT"] = "Click to select"
	L["CLICK_TO_DESELECT"] = "Click to deselect"
	L["CLICK_TO_IGNORE"] = "Click to ignore"
	L["ORDER"] = "Order"
	L["MOUSEOVER"] = "Mouse Over"
	L["NO_DATA_AVAILABLE"] = "No Data Available"
	L["TOOLTIP_PURCHASE_BANK_BAG_SLOT"] = "Click to purchase the next available bank bag slot."
	L["TOOLTIP_PURCHASE_BANK_TAB_REAGENT"] = "Click to purchase the reagent bank tab."
	L["LABEL"] = "Label"
	L["ABORTED"] = "Aborted"
	L["RESTORE"] = "Restore"
	L["PURGE"] = "Purge"
	L["COPY_FROM"] = "Copy From"
	L["DELETED"] = "Deleted"
	L["IMPORT"] = "Import"
	L["EXPORT"] = "Export"
	L["NOTIFY"] = "Notify"
	L["ACTION"] = "Action"
	L["FIRST"] = "First"
	L["LAST"] = "Last"
	L["NONE_USABLE"] = "None of your %1$s are usable here"
	L["NONE_OWNED"] = "No don't own any %1$s"
	L["LIST"] = "List"
	L["SEQUENTIAL"] = "Sequential"
	L["USE_ALL"] = "Use All"
	L["SELECTION"] = "Selection"
	L["PARAGON"] = "Paragon"
	L["SLOT"] = "Slot"
	L["TOOLTIP"] = "Tooltip"
	L["POSITION"] = "Position"
	L["CENTER"] = "Center"
	L["ALIGNMENT"] = "Alignment"
	L["ACCOUNT"] = "Account"
	L["ACCOUNTS"] = "Accounts"
	L["REALM"] = "Realm"
	L["UNASSIGNED"] = "Unassigned"
	L["AMOUNTS"] = "Amounts"
	L["VAULT_TABS"] = "Tabs"
	L["BOUND"] = "Bound"
	L["ADD_CLICK_TO_ACTION"] = "%s\n\nClick to %s it."
	L["EXPAND"] = "Expand"
	L["COLLAPSE"] = "Collapse"
	L["SET"] = "Set"
	L["ITEM_BIND_PARTYLOOT"] = "Party Loot"
	L["ITEM_BIND_REFUNDABLE"] = "Refundable"
	L["CONDUITS"] = "Conduits"
	L["COVENANT"] = "Covenant"
	L["ALPHA"] = "Alpha"
	L["BAGS"] = "Bags"
	L["OPTION_NOT_AVILABLE_EXPANSION"] = "This option is not available in this expansion"
	L["SIZE"] = "Size"
	L["AZERITE"] = "Azerite"
	L["COSMETIC"] = COSMETIC or ITEM_COSMETIC or "Cosmetic"
	L["WHEN"] = "When"
	L["RECIPIENT"] = "Recipient"
	L["ACTIONS"] = "Actions"
	L["ROWS"] = "Rows"
	L["DESTINATION"] = "Destination"
	L["ASSIGNED"] = "Assigned"
	L["ASSIGNABLE"] = "Assignable"
	L["OVERRIDE"] = "Override"
	L["SELECTED"] = "Selected"
	L["UNSELECTED"] = "Unselected"
	
	
-- libdatabroker
	L["LDB"] = "LDB"
	L["LDB_OBJECT_TEXT_SET"] = "Set as Text"
	L["LDB_OBJECT_TEXT_SET_DESC"] = "Set this %1$s as the LDB object text"
	L["LDB_OBJECT_TEXT_INCLUDE"] = "Include in Text"
	L["LDB_OBJECT_TEXT_INCLUDE_DESC"] = "Include the icon and count for this %1$s in the LDB object text"
	L["LDB_OBJECT_TEXT_FORMAT_DESC"] = "What format do you want to use to build the values in the LDB object text"
	L["LDB_OBJECT_TOOLTIP_INCLUDE"] = "Include in Tooltip"
	L["LDB_OBJECT_TOOLTIP_INCLUDE_DESC"] = "Include the icon and count for this %1$s in the LDB object tooltip"
	L["LDB_OBJECT_TOOLTIP_FORMAT_DESC"] = "What format do you want to use to build the values in the LDB object tooltip"
	
	L["LDB_ITEMS_SHOWZERO"] = "Show Zero"
	L["LDB_ITEMS_SHOWZERO_DESC"] = "Show items that have a count of zero"
	
	L["LDB_TRACKED_NONE"] = "no %1$s is currently being tracked"
	L["LDB_LOCATION_NOT_READY"] = "%1$s data is not ready"
	L["LDB_LOCATION_NOT_MONITORED"] = "The %1$s location is not being monitored"
	
	L["LDB_BAGS_COLOUR_USE"] = "Use colour"
	L["LDB_BAGS_COLOUR_USE_DESC"] = "Uses empty slot colours to colour the text"
	L["LDB_BAGS_STYLE"] = "Full display"
	L["LDB_BAGS_STYLE_DESC"] = "Displays both used and total slot counts"
	L["LDB_BAGS_INCLUDE_TYPE"] = "Bag type"
	L["LDB_BAGS_INCLUDE_TYPE_DESC"] = "Displays the type of bag in the text"
	
	L["LDB_MOUNTS_TYPE_L"] = "Land"
	L["LDB_MOUNTS_TYPE_U"] = "Underwater"
	L["LDB_MOUNTS_TYPE_S"] = "Water Surface"
	L["LDB_MOUNTS_TYPE_X"] = "Customised / Unknown"
	L["LDB_MOUNTS_USEFORLAND"] = "Include as %1$s mount selections"
	L["LDB_MOUNTS_USEFORLAND_DESC"] = "adds your %1$s mounts to your %2$s mount selections"
	L["LDB_MOUNTS_FLYING_DISMOUNT_DESC"] = "Enabled = allows you to dismount while flying.\n\nDisabled = you need to land before you can dismount\n\nnote: does not effect spell casting while flying, use the interface options to set that"
	L["LDB_MOUNTS_FLYING_DISMOUNT_WARNING"] = "You are currently flying, please land to select another mount"
	L["LDB_MOUNTS_FLYING_DRAGONRIDING_DESC"] = "which mounts to use by default in dragonriding capable zones\n\nEnabled = Dragonriding mounts\n\nDisabled = Normal flying mounts\n\nholding CTRL will use the other type when using the mount macro or clicking on the mount icon"
	L["LDB_MOUNTS_SUMMON"] = "Summon Mount"
	L["LDB_MOUNTS_NODATA"] = "Unknown / Changed"
	L["LDB_MOUNTS_TRAVEL_FORM"] = "Use %1$s"
	L["LDB_MOUNTS_TRAVEL_FORM_DESC"] = "Use %1$s instead of a mount."
	
	L["LDB_COMPANION_SUMMON"] = "Summon Pet"
	L["LDB_COMPANION_MISSING"] = "You seem to have misplaced your selected companion, resetting to random"
	L["LDB_COMPANION_NONE"] = "None available"
	L["LDB_COMPANION_RESTRICTED"] = "%s\n%s\n\nYou may or may not meet the requirements to summon this companion|r"
	L["LDB_COMPANION_RESTRICTED_ZONE"] = "Requires you to be in a specific zone"
	L["LDB_COMPANION_RESTRICTED_ITEM"] = "Requires certain reagents"
	L["LDB_COMPANION_RESTRICTED_EVENT"] = "Requires a specific event to be in progress"
	L["LDB_COMPANION_RESTRICTED_UNKNOWN"] = "Unknown restriction"
	L["LDB_COMPANION_NODATA_DESC"] = "\nNo data for companion %s [%s] was found.\n\nPlease let the author know both of the above values so they can update the code."
	L["LDB_COMPANION_SELECT"] = "\nAdd the %s to the selection pool"
	L["LDB_COMPANION_DESELECT"] = "\nRemove the %s from the selection pool"
	L["LDB_COMPANION_IGNORE"] = "\nNever summon the %s"
	L["LDB_COMPANION_USEALL_DESC"] = "Overrides your selections and uses all available %s, except those marked as ignore"
	L["LDB_COMPANION_RANDOMISE_DESC"] = "Disabled = Summon the next %1$s sequentially from your list of selections.\n\nEnabled = Summon the next %1$s randomly from your list of selections.\n\nnote: if you have 3 or less usabe %2$s it will always be sequential."
	
	L["LDB_REPUTATION_NONE"] = "You dont know any factions"
	
	L["LDB_CURRENCY_NONE"] = "You dont know any currencies"
