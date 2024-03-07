local addonName = ...

local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "enUS", true)

--Drpopdown Color Options
L["colorMode"] = "Color by: "
L["optionClass"] = "Class"
L["optionBlizzard"] = "Blizzard green"
L["optionCustom"] = "Custom"
L["optionClassReaction"] = "Class / Reaction"
L["optionReaction"] = "Reaction"
L["optionClassCustom"] = "Class / Custom"
L["optionClassBlizzard"] = "Class / Blizzard green"
L["optionPower"] = "Power Type"
L["hideOption"] = "Hide"
--Color Tab Labels & Color Picker names
L["classColors"] = "Class Colors"
L["reactionColors"] = "Reaction Colors"
L["powerColors"] = "Power Colors"
L["debuffColors"] = "Debuff Colors"
L["gradientStart_name"] = "Gradient Start"
L["gradientStart_desc"] = "This color is used at the beginning of a status bar."
L["gradientEnd_name"] = "Gradient End"
L["gradientEnd_desc"] =  "This color is used at the end of a status bar."
L["colorPicker_name"] = "Color"
L["colorPicker_desc"] = true
L["classColor_name"] = "Class Color"
L["singleColor_desc"] = "This color is used when the gradient color is not possible."
L["powerColor_name"] = "Power Color"
L["reactionColor_name"] = "Reaction Color"
L["debuffColor_name"] = "Debuff Color"
L["colorResetButton_name"] = "reset"
L["colorResetButton_desc"] = "Restore defaults for this specific entry only."
--Options Frame Tab labels
L["healthBars_tab_label"] = "Health Bars"
L["fonts_tab_label"] = "Fonts"
L["colors_tab_label"] = "Addon Colors"
L["modules_tab_label"] = "Modules"
L["profiles_tab_label"] = "Profiles"
--Font Options
L["nameFont"] = "Name"
L["healthFont"] = "Health"
L["powerFont"] = "Power"
L["outlineMode"] = "Outlinemode"
L["nameFontSize"] = "Name - Size"
L["healthFontSize"] = "Health - Size"
L["powerFontSize"] = "Power - Size"
--Units
L["player"] = "Player"
L["target"] = "Target"
L["targettarget"] = "Target of Target"
L["focus"] = "Focus"
L["focustarget"] = "Target of Focus"
L["pet"] = "Pet"
L["boss1"] = "Boss 1"
L["boss2"] = "Boss 2"
L["boss3"] = "Boss 3"
L["boss4"] = "Boss 4"
L["boss5"] = "Boss 5"
--Powers
L["MANA"] = "Mana"
L["RAGE"] = "Rage"
L["FOCUS"] = "Focus"
L["ENERGY"] = "Energy"
L["RUNIC_POWER"] = "Runic Power"
L["LUNAR_POWER"] = "Lunar Power"
L["MAELSTROM"] = "Maelstrom"
L["FURY"] = "Fury"
L["INSANITY"] = "Insanity"
--Classes
L["DEATHKNIGHT"] = "Death Knight"
L["DEMONHUNTER"] = "Demon Hunter"
L["DRUID"] = "Druid"
L["EVOKER"] = "Evoker"
L["HUNTER"] = "Hunter"
L["MAGE"] = "Mage"
L["MONK"] = "Monk"
L["PALADIN"] = "Paladin"
L["PRIEST"] = "Priest"
L["ROGUE"] = "Rogue"
L["SHAMAN"] = "Shaman"
L["WARLOCK"] = "Warlock"
L["WARRIOR"] = "Warrior"
--Reactions
L["Friendly"] = true
L["Neutral"] = true
L["Hostile"] = true
--Modules
L["enabledModules"] = "Enabled Modules:"
--Textures module
L["Textures_name"] = "Textures"
L["Textures_desc"] = "Use custom \"SharedMedia\" textures for health and power bars. For more textures, download the \"SharedMedia\" add-on."
L["Health Bar"] = true
L["Power Bar"] = true
L["excludePowerBar_name"] = "Exclude"
L["excludePowerBar_desc"] = "Exclude the Power Bar from getting a Texture applied to it."
--Dark Frames
L["DarkFrames_name"] = "Dark Frames"
L["DarkFrames_desc"] = "Use dark unit frame textures."
--BetterBossFrames
L["BetterBossFrames_name"] = "BetterBossFrames"
L["BetterBossFrames_desc"] = "Remove the artwork around the Boss Frames and resize their health bars for better visual clarity."
--Glow
L["Glow_name"] = "Glow"
L["Glow_desc"] = "Hide or recolor the Reputation Color (the glow beneath the unit's name)."
--BiggerHealthBar for retail
L["BiggerHealthBar_name"] = "BiggerHealthBar"
L["BiggerHealthBar_desc"] = "Resizes the player's health bar to cover the entire inner player frame."
--BiggerHealthBars for classic the plural is not a typo
L["BiggerHealthBars_name"] = "BiggerHealthBars"
L["BiggerHealthBars_desc"] = "Use larger health bars for player and target frames."
--HideClassPowerBar
L["HideClassPowerBar_name"] = "HideClassPowerBar"
L["HideClassPowerBar_desc"] = "Hide the class power bar (Monk Chi Bar, Warlock Soul Shards, Combo Points, etc.)"
--BackgroundTextures 
L["BackgroundTextures_name"] = "Background Textures"
L["BackgroundTextures_desc"] = "Create background Textures beneath health bars."
L["Texture"] = true
--DebuffColor
L["DebuffColor_name"] = "DebuffColor"
L["DebuffColor_desc"] = "Color the player health bar by debuff color if you are affected by a debuff that you can dispel."
--Fonts
L["font_module_name"] = "Fonts" 
L["font_module_desc"] = "Use custom SharedMedia fonts and customize font size and color." 
--Overabsorbs
L["Overabsorbs_name"] = "Overabsorbs"
L["Overabsorbs_desc"] = "Reanchor the absorb bar to fill from right to left if an absorb shield above max life is present."
--MinimapButton
L["MinimapButton_name"] = "Minimap Button"
L["MinimapButton_desc"] = "Create a minimap button to access the add-on settings."
--PartyColor
L["PartyColor"] = "Party Color"
--Profile Management:
L["profile_management_group_name"] = "Profile Management"
L["share_profile_title"] = "Import/Export Profile"
L["share_profile_header"] = "Share your profile or import one"
L["share_profile_desc_row1"] = "To export your current profile copy the code below."
L["share_profile_desc_row2"] = "To import a profile replace the code below and press Accept."
L["share_profile_input_name"] = "import/export from or to your current profile"
L["share_profile_input_desc"] = "Caution: Importing a profile will overwrite your current profile."
--Porfile import error handling:
L["import_empty_string_error"] = "No import string provided. Abort"
L["import_decoding_failed_error"] = "Decoding failed. Abort"
L["import_uncompression_failed_error"] = "Uncompressing failed. Abort"
L["invalid_profile_error"] = "Invalid profile. Abort"






















