--localization file for English (United States)
local L = LibStub("AceLocale-3.0"):NewLocale("UltraSquirt", "enUS", true)

if not L then return end

L["Keybind Missing"] = "The keybind is not set"
L["Cannot Modify In Battle"] = "Cannot modify target pet battle NPC during a pet battle - please try again when the battle is over"
L["Invalid Target"] = "Invalid target - please select a valid repeatable pet battle NPC and try again"
L["Addon Enabled"] = "Addon enabled"
L["Addon Disabled"] = "Addon disabled"
L["Resetting Options"] = "Resetting addon options and window position"
L["Resetting Options OOC"] = "Options will be reset when combat ends"
L["General Settings Group"] = "General Settings"
L["Delay Settings Group"] = "Delay Settings"
L["Delay Settings Description"] = "The below settings allow you to customise the delay timers used.  The defaults should work in the vast majority of cases.  If you have high latency, or otherwise run into issues where the addon heals unexpectedly, then try increasing the times slightly."
L["Rematch Load Team Delay Setting"] = "Rematch Load Team Delay"
L["Rematch Load Team Delay Description"] = "While using the Rematch options \"Load Healthiest Pets\" and \"After Pet Battles Too\", after a Pet Battle completes, the addon will pause any further actions while Rematch loads a new team.  This should take 1 or 2 seconds at most.  Adjusting this setting will change the maximum delay allowed."
L["Pet Battle Close Delay Setting"] = "Pet Battle Close Delay"
L["Pet Battle Close Delay Description"] = "After a Pet Battle completes, the addon will delay for a short period to allow the game to update the status and health of loaded pets.  Change this value to increase or decrease the maximum delay.  This only applies while not using the Rematch options \"Load Healthiest Pets\" and \"After Pet Battles Too\"."
L["Heal Delay Setting"] = "Heal Delay"
L["Heal Delay Description"] = "After healing your pets with a Bandage, or Revice Battle Pets, the addon will delay for a short period to allow the game to update.  Change this value to increase or decrease the maximum delay."
L["Help Header"] = "Available slash commands:"
L["Help Default"] = "Toggle the main UltraSquirt window."
L["Help Config"] = "Display config panel."
L["Help Advanced"] = "Display Advanced Teams panel."
L["Help Reset"] = "Reset all UltraSquirt settings and window positions to default."
L["Help Help"] = "Display this list of available commands."
L["Invalid Command"] = "Invalid command."
L["Team Name"] = "Team Name"
L["Mute Addon Enabled and Disabled Messages"] = "Mute Addon Enabled and Disabled Messages"
