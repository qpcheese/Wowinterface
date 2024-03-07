
local _AddonName, _EchoRaidTools = ...;

local journal = _EchoRaidTools:GetModule("waJournal");

-- 5. export data

journal:AddImportData({["5. [DODGE + ORBS] - Blazing Thorns Cast - Larodar, Keeper of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = 0,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "134337",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "5. Bars - Larodar, Keeper of the Flame",["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "UNbe(Cbc2cv",["textSize"] = 12,["sparkRotationMode"] = "AUTO",["customTextUpdate"] = "update",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {426206,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["event"] = "Cast",["subeventPrefix"] = "SPELL",["use_spellNames"] = true,["spellIds"] = {},["unit"] = "boss",["names"] = {},["use_unit"] = true,["use_exact_spellId"] = false,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["internalVersion"] = 70,["config"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["stacksFlags"] = "None",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["timer"] = true,["borderInset"] = 11,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "DODGE + ORBS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["icon"] = true,["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["authorOptions"] = {},["color"] = {},["anchorFrameParent"] = false,["textFlags"] = "None",["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["zoom"] = 0,["id"] = "5. [DODGE + ORBS] - Blazing Thorns Cast - Larodar, Keeper of the Flame",["adjustedMin"] = "4",["frameStrata"] = 1,["width"] = 240,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["inverse"] = false,["borderOffset"] = 5,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",},["5. [CHARGE] - Furious Charge Cast - Larodar, Keeper of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.96078437566757,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "2403541",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "5. Bars - Larodar, Keeper of the Flame",["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",["zoom"] = 0,["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {418637,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["subeventPrefix"] = "SPELL",["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "CHARGE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["border_anchor"] = "bar",["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "5. [CHARGE] - Furious Charge Cast - Larodar, Keeper of the Flame",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["borderOffset"] = 5,["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["backdropColor"] = {1,1,1,0.5,},["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["rotateText"] = "NONE",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "bpN4AoLIi(K",},["5. Blazing Coalescence Simple Glow"] = {["outline"] = "OUTLINE",["parent"] = "5. Simple Healer Glows",["displayText"] = "",["yOffset"] = 2000,["anchorPoint"] = "CENTER",["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["glow_color"] = {1,0.91764712333679,0.1803921610117,1,},["glow_YOffset"] = 1,["glow_XOffset"] = 1,["glow_frame_type"] = "UNITFRAME",["do_glow"] = true,["glow_lines"] = 12,["glow_type"] = "Pixel",["glow_frequency"] = 0.1,["use_glow_color"] = true,["glow_thickness"] = 2,["glow_action"] = "show",},["finish"] = {["hide_all_glows"] = true,},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["showClones"] = true,["useName"] = true,["auranames"] = {"426249",},["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["unit"] = "group",["type"] = "aura2",["names"] = {},["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["selfPoint"] = "BOTTOM",["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["subRegions"] = {{["type"] = "subbackground",},},["height"] = 1,["rotate"] = false,["load"] = {["size"] = {["multi"] = {},},["role"] = {["single"] = "HEALER",},["spec"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["use_role"] = true,["encounterid"] = "2731",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["displayText_format_p_time_mod_rate"] = true,["internalVersion"] = 70,["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["source"] = "import",["conditions"] = {},["shadowXOffset"] = 1,["automaticWidth"] = "Auto",["mirror"] = false,["preferToUpdate"] = false,["regionType"] = "texture",["shadowYOffset"] = -1,["blendMode"] = "BLEND",["config"] = {},["fontSize"] = 12,["width"] = 1,["displayText_format_p_time_precision"] = 1,["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["alpha"] = 1,["color"] = {1,0.91764712333679,0.1803921610117,1,},["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "5. Blazing Coalescence Simple Glow",["xOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "QN3M170diZe",["authorOptions"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["wordWrap"] = "WordWrap",},["5. [FRONTAL] - Smoldering Backdraft Cast - Larodar, Keeper of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.50980395078659,0.23529413342476,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "366938",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "5. Bars - Larodar, Keeper of the Flame",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",["zoom"] = 0,["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {421318,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["subeventPrefix"] = "SPELL",["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["width"] = 240,["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FRONTAL",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["border_anchor"] = "bar",["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "5. [FRONTAL] - Smoldering Backdraft Cast - Larodar, Keeper of the Flame",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["borderOffset"] = 5,["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["rotateText"] = "NONE",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "AYziMtzTz3A",},["5. [POOPIN] - Igniting Growth Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"425889",},["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "POOPIN'",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",["desaturate"] = false,["uid"] = "4UUR1RTGeiO",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [POOPIN] - Igniting Growth Debuff - Larodar, Keeper of the Flame",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},["5. [STUN] - Encased in Ash Debuff -  Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["spellIds"] = {},["type"] = "aura2",["auranames"] = {"421463",},["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "STUN",["text_text_format_toooltip1_format"] = "none",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_toooltip3_format"] = "none",["text_anchorYOffset"] = 0,["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "BigNumber",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip2_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["xOffset"] = 0,["stickyDuration"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [STUN] - Encased in Ash Debuff -  Larodar, Keeper of the Flame",["frameStrata"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "9jkLbnC8dNN",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["authorOptions"] = {},},["5. Bars - Larodar, Keeper of the Flame"] = {["arcLength"] = 360,["controlledChildren"] = {"5. [TREANTS] - Ashen Call Cast - Larodar","5. [TREANTS] - Fiery Force of Nature Cast - Larodar","5. [SOAKS INC] - Falling Embers Cast -  Larodar","5. [SOAK] - Falling Embers Cast - Larodar","5. [ROOTS] - Scorching Roots Cast - Larodar","5. [POOPING INC] - Igniting Growth Cast - Larodar, Keeper of the Flame","5. [POOP] - Igniting Growth Debuff - Larodar, Keeper of the Flame","5. [CHARGE] - Furious Charge Cast - Larodar, Keeper of the Flame","5. [DODGE + ORBS] - Blazing Thorns Cast - Larodar, Keeper of the Flame","5. [GET SAFE] - Raging Inferno Cast - Larodar, Keeper of the Flame","5. [INTERMISSION] - Consuming Flame Cast - Larodar, Keeper of the Flame","5. [FRONTAL] - Smoldering Backdraft Cast - Larodar, Keeper of the Flame","5. [BOMBS] - BOMB TIMER - Larodar, Keeper of the Flame",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["selfPoint"] = "TOP",["align"] = "CENTER",["stagger"] = 0,["space"] = 2,["rotation"] = 0,["subRegions"] = {},["useLimit"] = false,["sortHybridTable"] = {["5. [BOMBS] - BOMB TIMER - Larodar, Keeper of the Flame"] = false,["5. [CHARGE] - Furious Charge Cast - Larodar, Keeper of the Flame"] = false,["5. [POOP] - Igniting Growth Debuff - Larodar, Keeper of the Flame"] = false,["5. [TREANTS] - Ashen Call Cast - Larodar"] = false,["5. [FRONTAL] - Smoldering Backdraft Cast - Larodar, Keeper of the Flame"] = false,["5. [INTERMISSION] - Consuming Flame Cast - Larodar, Keeper of the Flame"] = false,["5. [TREANTS] - Fiery Force of Nature Cast - Larodar"] = false,["5. [ROOTS] - Scorching Roots Cast - Larodar"] = false,["5. [DODGE + ORBS] - Blazing Thorns Cast - Larodar, Keeper of the Flame"] = false,["5. [POOPING INC] - Igniting Growth Cast - Larodar, Keeper of the Flame"] = false,["5. [SOAK] - Falling Embers Cast - Larodar"] = false,["5. [SOAKS INC] - Falling Embers Cast -  Larodar"] = false,["5. [GET SAFE] - Raging Inferno Cast - Larodar, Keeper of the Flame"] = false,},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["parent"] = "5. Larodar, Keeper of the Flame",["backdropColor"] = {1,1,1,0.5,},["borderInset"] = 1,["animate"] = false,["source"] = "import",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["anchorFrameFrame"] = "WeakAuras:Bars - Anchor [AMIR]",["frameStrata"] = 1,["grow"] = "DOWN",["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["authorOptions"] = {},["tocversion"] = 100200,["id"] = "5. Bars - Larodar, Keeper of the Flame",["regionType"] = "dynamicgroup",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["gridType"] = "RD",["uid"] = "NEg8usdAMr7",["fullCircle"] = true,["internalVersion"] = 70,["config"] = {},["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["5. [FIREMAN] - Dream Blossom Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["auranames"] = {"425249",},["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "FIREMAN",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip2_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",["stickyDuration"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [FIREMAN] - Dream Blossom Debuff - Larodar, Keeper of the Flame",["frameStrata"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "0utt)ayd8bj",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {["message"] = "CLICKED",["do_sound"] = true,["message_type"] = "SAY",["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Glass.mp3",["do_message"] = true,},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["authorOptions"] = {},},["5. Smart Healer Glows"] = {["controlledChildren"] = {"5. [GRIP] Raging inferno without Nature's Bulwark Simple Glow","5. Assign healers to absorbs - Larodar",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "5. Smart Healer Glows",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "5. Singles - Larodar, Keeper of the Flame",["uid"] = "ntSlorG1XDj",["borderInset"] = 1,["authorOptions"] = {},["selfPoint"] = "CENTER",["conditions"] = {},["information"] = {},["config"] = {},},["5. [FIXATE] - Scorching Pursuit Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"420544",},["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["useName"] = true,["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "FIXATE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip3_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["color"] = {1,1,1,1,},["stickyDuration"] = false,["config"] = {},["zoom"] = 0,["anchorFrameParent"] = false,["width"] = 55,["useCooldownModRate"] = true,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [FIXATE] - Scorching Pursuit Debuff - Larodar, Keeper of the Flame",["frameStrata"] = 1,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["uid"] = "tNwhq3AlVbI",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = true,},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["xOffset"] = 0,},["5. [BOMB] - Ashen Devastation Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["auranames"] = {"428896",},["subeventPrefix"] = "SPELL",["unit"] = "player",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "BOMB",["text_text_format_toooltip3_format"] = "none",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_toooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "BigNumber",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["config"] = {},["useCooldownModRate"] = true,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [BOMB] - Ashen Devastation Debuff - Larodar, Keeper of the Flame",["zoom"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["uid"] = "jHxA48YNmDp",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["xOffset"] = 0,},["5. Singles - Larodar, Keeper of the Flame"] = {["controlledChildren"] = {"5. Smart Healer Glows","5. Simple Healer Glows","5. Flash Fire Heal Absorb - Larodar","5. Everlasting Blaze when boss casts - Larodar","5. Private Aura Holder 1 (singles) - Larodar","5. Private Aura Holder 2 (singles) - Larodar","5. [HS] - Flash Fire Debuff - Larodar",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "5. Larodar, Keeper of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "5. Singles - Larodar, Keeper of the Flame",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "M6avnyCLEZK",["config"] = {},["authorOptions"] = {},["borderInset"] = 1,["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["5. [GRIP] Raging inferno without Nature's Bulwark Simple Glow"] = {["outline"] = "OUTLINE",["xOffset"] = 0,["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["glow_color"] = {1,1,1,1,},["glow_YOffset"] = 1,["glow_action"] = "show",["glow_XOffset"] = 1,["glow_frequency"] = 0.1,["glow_lines"] = 12,["use_glow_color"] = true,["do_glow"] = true,["glow_type"] = "Pixel",["glow_thickness"] = 2,["glow_frame_type"] = "UNITFRAME",},["init"] = {},["finish"] = {["hide_all_glows"] = true,},},["triggers"] = {[1] = {["trigger"] = {["showClones"] = true,["type"] = "aura2",["auranames"] = {"419485",},["perUnitMode"] = "unaffected",["event"] = "Health",["names"] = {},["useName"] = true,["spellIds"] = {},["unit"] = "group",["combinePerUnit"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["spellNames"] = {"419343",},["type"] = "unit",["use_absorbHealMode"] = true,["use_absorbMode"] = true,["use_spellNames"] = true,["use_unit"] = true,["event"] = "Cast",["use_spellIds"] = false,["unit"] = "boss",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["type"] = "unit",["use_absorbHealMode"] = true,["unit"] = "player",["use_unit"] = true,["use_absorbMode"] = true,["event"] = "Unit Characteristics",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["wordWrap"] = "WordWrap",["desc"] = "Glows frames of anyone not yet safe, for Priests and Evokers. \
",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["class_and_spec"] = {["multi"] = {[256] = true,[257] = true,[258] = true,[1473] = true,[1467] = true,[1468] = true,},},["talent"] = {["multi"] = {},},["encounterid"] = "2731",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["role"] = {["single"] = "HEALER",["multi"] = {["HEALER"] = true,},},["use_class_and_spec"] = false,["spec"] = {["multi"] = {},},["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 25,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_time_mod_rate"] = true,["selfPoint"] = "BOTTOM",["fixedWidth"] = 200,["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["displayText_format_p_time_precision"] = 1,["url"] = "https://echoesports.gg",["uid"] = "4gGIszIEapp",["color"] = {1,1,1,1,},["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "5. [GRIP] Raging inferno without Nature's Bulwark Simple Glow",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["config"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["parent"] = "5. Smart Healer Glows",["shadowColor"] = {0,0,0,1,},["conditions"] = {{["check"] = {["trigger"] = 3,["variable"] = "class",["value"] = "EVOKER",["op"] = "==",},["changes"] = {{["value"] = "RESCUE",["property"] = "displayText",},},},},["information"] = {},["displayText"] = "GRIP",},["5. [ROOT] - Scorching Bramblethorn  Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"426387",},["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "ROOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["authorOptions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "x2S3v29pobj",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [ROOT] - Scorching Bramblethorn  Debuff - Larodar, Keeper of the Flame",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",},["5. ROOTS HEALABLE - Larodar"] = {["outline"] = "OUTLINE",["authorOptions"] = {},["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["spellId"] = "418655",["use_absorbMode"] = true,["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",["type"] = "addons",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["percenthealth"] = "40",["event"] = "Boss Mod Announce",["unit"] = "boss1",["use_unit"] = true,["use_spellId"] = true,["spellIds"] = {},["use_specific_unit"] = true,["duration"] = "5",["use_percenthealth"] = true,["percenthealth_operator"] = ">=",["names"] = {},},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["talent"] = {["multi"] = {},},["use_role"] = true,["class"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["role"] = {["single"] = "HEALER",},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["encounterid"] = "2731",["size"] = {["multi"] = {},},},["fontSize"] = 20,["source"] = "import",["shadowXOffset"] = 1,["parent"] = "5. Texts - Larodar, Keeper of the Flame",["regionType"] = "text",["wordWrap"] = "WordWrap",["fixedWidth"] = 200,["displayText_format_p_time_mod_rate"] = true,["internalVersion"] = 70,["anchorFrameParent"] = false,["displayText_format_p_time_precision"] = 1,["uid"] = "EUmsAbfzLqZ",["yOffset"] = 0,["displayText"] = "ROOTS HEALABLE!",["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "5. ROOTS HEALABLE - Larodar",["xOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["color"] = {0.258823543787,1,0,1,},["config"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["url"] = "https://echoesports.gg",["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["selfPoint"] = "BOTTOM",},["5. [ROOTS] - Scorching Roots Cast - Larodar"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.8117647767067,0.57647061347961,0.19607844948769,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["use_zoneIds"] = false,["class"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["encounterid"] = "2731",["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "5351065",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "5. Bars - Larodar, Keeper of the Flame",["preferToUpdate"] = false,["adjustedMin"] = "4",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["uid"] = "dt8FLxGub3z",["sparkColor"] = {1,1,1,1,},["stacksFont"] = "Friz Quadrata TT",["sparkRotationMode"] = "AUTO",["displayTextLeft"] = "%n",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["auranames"] = {"364963","Core Overload",},["use_genericShowOn"] = true,["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = false,["fetchTooltip"] = true,["use_spellNames"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["spellNames"] = {422614,},["event"] = "Cast",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["unit"] = "boss",["names"] = {"Sacred Blade",},["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["matchesShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["use_absorbHealMode"] = true,["type"] = "unit",["unevent"] = "auto",["auraspellids"] = {},["duration"] = "3",["buffShowOn"] = "showOnActive",["use_onUpdateUnitTarget"] = true,["useName"] = true,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["subeventPrefix"] = "SPELL",["remOperator"] = "<",["spellName"] = 0,["subeventSuffix"] = "_CAST_SUCCESS",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["customTextUpdate"] = "update",["internalVersion"] = 70,["width"] = 240,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderColor"] = {1,1,1,0.5,},["stickyDuration"] = false,["xOffset"] = 0,["sparkHidden"] = "NEVER",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "ROOTS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["semver"] = "1.0.5",["source"] = "import",["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["borderOffset"] = 5,["zoom"] = 0,["border"] = false,["borderEdge"] = "None",["sparkHeight"] = 14,["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["borderBackdrop"] = "Blizzard Tooltip",["sparkWidth"] = 3,["anchorFrameParent"] = false,["backgroundColor"] = {0,0,0,0.33132427930832,},["displayTextRight"] = "%p",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["backdropColor"] = {1,1,1,0.5,},["id"] = "5. [ROOTS] - Scorching Roots Cast - Larodar",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["inverse"] = false,["spark"] = false,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderInset"] = 11,},["5. [TANK] - Nature's Fury  Debuff - Tank - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["spellIds"] = {},["type"] = "aura2",["auranames"] = {"423719",},["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%tooltip1%%",["text_text_format_toooltip1_format"] = "none",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_toooltip3_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",["selfPoint"] = "CENTER",["uid"] = "0Vys7drnAPT",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [TANK] - Nature's Fury  Debuff - Tank - Larodar, Keeper of the Flame",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["authorOptions"] = {},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},["5. [POOPING INC] - Igniting Growth Cast - Larodar, Keeper of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.56078433990479,0.84705889225006,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["difficulty"] = {["single"] = "mythic",["multi"] = {["mythic"] = true,},},["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "jRnQ5LhZKKg",["displayIcon"] = "",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "5. Bars - Larodar, Keeper of the Flame",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["config"] = {},["customTextUpdate"] = "update",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {425889,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["use_unit"] = true,["subeventPrefix"] = "SPELL",["unit"] = "boss",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["sparkRotationMode"] = "AUTO",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["auto"] = true,["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "POOPING INC",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["zoom"] = 0,["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["authorOptions"] = {},["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["color"] = {},["textFlags"] = "None",["anchorFrameParent"] = false,["stacksFont"] = "Friz Quadrata TT",["icon"] = true,["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["useAdjustededMax"] = false,["id"] = "5. [POOPING INC] - Igniting Growth Cast - Larodar, Keeper of the Flame",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["5. Flash fire TIMER bar - Larodar"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["user_x"] = 0,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["sameTexture"] = true,["url"] = "https://echoesports.gg",["icon"] = false,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.81960791349411,0.82352948188782,0.85098046064377,1,},["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["difficulty"] = {["single"] = "mythic",},["use_encounterid"] = true,["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["use_difficulty"] = true,["size"] = {["multi"] = {},},},["preferToUpdate"] = false,["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["cooldown"] = true,["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_10px.tga",["conditions"] = {},["cooldownTextDisabled"] = false,["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["blendMode"] = "BLEND",["borderOffset"] = 5,["config"] = {},["slantMode"] = "INSIDE",["tocversion"] = 100200,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["auto"] = true,["compress"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["width"] = 240,["frameStrata"] = 1,["sparkColor"] = {1,1,1,1,},["auraRotation"] = 0,["sparkHidden"] = "NEVER",["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["displayIcon"] = "",["displayTextRight"] = "%p",["textColor"] = {1,1,1,1,},["borderColor"] = {1,1,1,0.5,},["startAngle"] = 0,["borderBackdrop"] = "Blizzard Tooltip",["rotateText"] = "NONE",["color"] = {},["sparkWidth"] = 3,["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["foregroundColor"] = {0,0.98823535442352,1,0.27000004053116,},["user_y"] = 0,["desaturateBackground"] = false,["cooldownSwipe"] = true,["displayTextLeft"] = "%n",["customTextUpdate"] = "update",["cooldownEdge"] = false,["desaturateForeground"] = false,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["useExactSpellId"] = false,["fetchTooltip"] = false,["event"] = "Health",["unit"] = "player",["auraspellids"] = {"427299",},["subeventSuffix"] = "_CAST_START",["spellIds"] = {},["subeventPrefix"] = "SPELL",["auranames"] = {"421326",},["useName"] = true,["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 70,["uid"] = "rDbZGkWrjJs",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderInFront"] = false,["stickyDuration"] = false,["adjustedMax"] = "4",["backgroundOffset"] = 0,["border"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "CENTER",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_format"] = "timed",["anchorXOffset"] = 0,["type"] = "subtext",["text_shadowColor"] = {0,0,0,1,},["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_time_precision"] = 1,["text_shadowYOffset"] = -1,["text_fontType"] = "None",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_CENTER",["text_text_format_p_time_format"] = 0,["text_text_format_n_format"] = "none",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = false,},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",["source"] = "import",["fontSize"] = 12,["backdropColor"] = {1,1,1,0.5,},["sparkOffsetX"] = 0,["mirror"] = false,["borderEdge"] = "None",["zoom"] = 0,["borderSize"] = 16,["parent"] = "5. Flash Fire Heal Absorb - Larodar",["icon_side"] = "LEFT",["sparkRotationMode"] = "AUTO",["textSize"] = 12,["sparkHeight"] = 14,["authorOptions"] = {},["adjustedMin"] = "4",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["backgroundColor"] = {0,0,0,0.33132427930832,},["id"] = "5. Flash fire TIMER bar - Larodar",["crop_y"] = 0.41,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["timerColor"] = {1,1,1,1,},["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["crop_x"] = 0.41,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["spark"] = false,},["5. [SOAK] - Falling Embers Cast - Larodar"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.98039221763611,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["use_never"] = false,["class"] = {["multi"] = {},},["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["encounterid"] = "2731",["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "1035051",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "5. Bars - Larodar, Keeper of the Flame",["preferToUpdate"] = false,["adjustedMin"] = "4",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["uid"] = "1aAzGYO5oPB",["sparkColor"] = {1,1,1,1,},["stacksFont"] = "Friz Quadrata TT",["customTextUpdate"] = "update",["displayTextLeft"] = "%n",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = {"427252",},["auranames"] = {"364963","Core Overload",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["spellName"] = {0,},["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["fetchTooltip"] = true,["event"] = "Combat Log",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["use_debuffClass"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["names"] = {"Sacred Blade",},["unit"] = "boss",["use_unit"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["custom_type"] = "event",["type"] = "combatlog",["useName"] = true,["auraspellids"] = {},["unevent"] = "auto",["buffShowOn"] = "showOnActive",["use_onUpdateUnitTarget"] = true,["duration"] = "8",["realSpellName"] = 0,["use_spellName"] = false,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["useExactSpellId"] = false,["group_countOperator"] = ">",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["sparkRotationMode"] = "AUTO",["internalVersion"] = 70,["width"] = 240,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["easeStrength"] = 3,["rotate"] = 0,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderColor"] = {1,1,1,0.5,},["stickyDuration"] = false,["authorOptions"] = {},["sparkHidden"] = "NEVER",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SOAK",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["timer"] = true,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["semver"] = "1.0.5",["source"] = "import",["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["borderOffset"] = 5,["zoom"] = 0,["border"] = false,["borderEdge"] = "None",["sparkHeight"] = 14,["borderSize"] = 16,["borderInFront"] = false,["icon_side"] = "LEFT",["borderBackdrop"] = "Blizzard Tooltip",["sparkWidth"] = 3,["anchorFrameParent"] = false,["backgroundColor"] = {0,0,0,0.33132427930832,},["displayTextRight"] = "%p",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["useAdjustededMax"] = false,["id"] = "5. [SOAK] - Falling Embers Cast - Larodar",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["rotateText"] = "NONE",["icon"] = true,["inverse"] = false,["spark"] = false,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["config"] = {},},["5. [CAN'T CLICK] - Dream Fatigue Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["auranames"] = {"425531",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "CAN'T\\nCLICK",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip2_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",["stickyDuration"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [CAN'T CLICK] - Dream Fatigue Debuff - Larodar, Keeper of the Flame",["frameStrata"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "Ab7O(WkmjAW",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["authorOptions"] = {},},["5. [DOT] - Blistering Splinters Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["useName"] = true,["unit"] = "player",["auranames"] = {"418522",},["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["selfPoint"] = "CENTER",["uid"] = "ImgdH8ws6gw",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [DOT] - Blistering Splinters Debuff - Larodar, Keeper of the Flame",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["authorOptions"] = {},},["5. [250%] - Everlasting Blaze Debuff (2 stracks) - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["useStacks"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["subeventPrefix"] = "SPELL",["stacksOperator"] = ">=",["stacks"] = "2",["spellIds"] = {},["names"] = {},["unit"] = "player",["auranames"] = {"429032",},["type"] = "aura2",["debuffType"] = "HARMFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["debuffType"] = "HELPFUL",["use_stage"] = true,["stage"] = "1",["stage_operator"] = "==",["event"] = "Boss Mod Stage",["unit"] = "player",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "BIG DOT\\n%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 3,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["use_encounterid"] = true,},["source"] = "import",["authorOptions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["desaturate"] = false,["selfPoint"] = "CENTER",["uid"] = "4OZAmsl9Gpk",["useCooldownModRate"] = true,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [250%] - Everlasting Blaze Debuff (2 stracks) - Larodar, Keeper of the Flame",["cooldownTextDisabled"] = false,["alpha"] = 1,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},["5. [POOP] - Igniting Growth Debuff - Larodar, Keeper of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.94117653369904,0.58039218187332,0.11764706671238,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["class"] = {["multi"] = {},},["use_difficulty"] = true,["encounterid"] = "2731",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "5351065",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "5. Bars - Larodar, Keeper of the Flame",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "kHUf3DRs(u3",["config"] = {},["sparkRotationMode"] = "AUTO",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellId"] = {425889,},["useName"] = true,["use_absorbHealMode"] = true,["auranames"] = {"425889",},["names"] = {},["use_absorbMode"] = true,["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["duration"] = "15",["use_spellId"] = true,["spellIds"] = {},["type"] = "combatlog",["unit"] = "player",["subeventSuffix"] = "_CAST_SUCCESS",["use_unit"] = true,["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["actions"] = {["start"] = {},["finish"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\shot.ogg",["do_sound"] = true,},["init"] = {},},["internalVersion"] = 70,["rotateText"] = "NONE",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["auto"] = true,["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["borderInset"] = 11,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "POOPIN'",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["authorOptions"] = {},["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["color"] = {},["textFlags"] = "None",["anchorFrameParent"] = false,["stacksFont"] = "Friz Quadrata TT",["icon"] = true,["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["zoom"] = 0,["id"] = "5. [POOP] - Igniting Growth Debuff - Larodar, Keeper of the Flame",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 240,["sparkRotation"] = 0,["customTextUpdate"] = "update",["inverse"] = false,["height"] = 23,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",},["5. Texts - Larodar, Keeper of the Flame"] = {["grow"] = "DOWN",["controlledChildren"] = {"5. Intermission Soon - Larodar","5. ROOTS HEALABLE - Larodar","5. Fireman Assigner - Larodar","5. CATCHER Assigner - Larodar",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["fullCircle"] = true,["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["useLimit"] = false,["align"] = "CENTER",["rotation"] = 0,["xOffset"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["radius"] = 200,["rowSpace"] = 1,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["gridType"] = "RD",["backdropColor"] = {1,1,1,0.5,},["borderInset"] = 1,["animate"] = false,["parent"] = "5. Larodar, Keeper of the Flame",["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Texts - Anchor [AMIR]",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["borderEdge"] = "Square Full White",["frameStrata"] = 1,["arcLength"] = 360,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["selfPoint"] = "TOP",["tocversion"] = 100200,["id"] = "5. Texts - Larodar, Keeper of the Flame",["regionType"] = "dynamicgroup",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["config"] = {},["uid"] = "g5yR9a4JeOB",["sortHybridTable"] = {["5. Fireman Assigner - Larodar"] = false,["5. Intermission Soon - Larodar"] = false,["5. CATCHER Assigner - Larodar"] = false,["5. ROOTS HEALABLE - Larodar"] = false,},["source"] = "import",["borderColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["stagger"] = 0,},["5. Simple Healer Glows"] = {["controlledChildren"] = {"5. Blazing Coalescence Simple Glow",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "5. Singles - Larodar, Keeper of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "5. Simple Healer Glows",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["selfPoint"] = "CENTER",["borderInset"] = 1,["uid"] = "tL2v(3k)fjb",["xOffset"] = 0,["authorOptions"] = {},["conditions"] = {},["information"] = {},["config"] = {},},["5. Icons (high) - Larodar, Keeper of the Flame"] = {["arcLength"] = 360,["controlledChildren"] = {"5. [POOPIN] - Igniting Growth Debuff - Larodar, Keeper of the Flame","5. [FIREMAN] - Dream Blossom Debuff - Larodar, Keeper of the Flame","5. [FIXATE] - Scorching Pursuit Debuff - Larodar, Keeper of the Flame","5. [BOMB] - Ashen Devastation Debuff - Larodar, Keeper of the Flame","5. [ROOT] - Scorching Bramblethorn  Debuff - Larodar, Keeper of the Flame","5. [TANK] - Nature's Fury  Debuff - Tank - Larodar, Keeper of the Flame","5. [HEAL ABSORB] - Flash Fire Debuff - Larodar, Keeper of the Flame","5. [LEECH] - Smoldering Suffocation Debuff - Larodar, Keeper of the Flame","5. [250%] - Everlasting Blaze Debuff (2 stracks) - Larodar, Keeper of the Flame",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["5. [POOPIN] - Igniting Growth Debuff - Larodar, Keeper of the Flame"] = false,["5. [250%] - Everlasting Blaze Debuff (2 stracks) - Larodar, Keeper of the Flame"] = false,["5. [HEAL ABSORB] - Flash Fire Debuff - Larodar, Keeper of the Flame"] = false,["5. [FIXATE] - Scorching Pursuit Debuff - Larodar, Keeper of the Flame"] = false,["5. [FIREMAN] - Dream Blossom Debuff - Larodar, Keeper of the Flame"] = false,["5. [LEECH] - Smoldering Suffocation Debuff - Larodar, Keeper of the Flame"] = false,["5. [BOMB] - Ashen Devastation Debuff - Larodar, Keeper of the Flame"] = false,["5. [TANK] - Nature's Fury  Debuff - Tank - Larodar, Keeper of the Flame"] = false,["5. [ROOT] - Scorching Bramblethorn  Debuff - Larodar, Keeper of the Flame"] = false,},["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["rotation"] = 0,["selfPoint"] = "RIGHT",["stagger"] = 0,["subRegions"] = {},["radius"] = 200,["anchorPoint"] = "CENTER",["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["source"] = "import",["backdropColor"] = {1,1,1,0.5,},["borderInset"] = 1,["animate"] = false,["borderEdge"] = "Square Full White",["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Icon - High Priority - Anchor [AMIR]",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["grow"] = "LEFT",["frameStrata"] = 1,["parent"] = "5. Larodar, Keeper of the Flame",["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["config"] = {},["tocversion"] = 100200,["id"] = "5. Icons (high) - Larodar, Keeper of the Flame",["regionType"] = "dynamicgroup",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["authorOptions"] = {},["uid"] = "tVuZmaAqWSp",["gridType"] = "RD",["fullCircle"] = true,["rowSpace"] = 1,["conditions"] = {},["information"] = {},["useLimit"] = false,},["5. [HS] - Flash Fire Debuff - Larodar"] = {["sparkWidth"] = 10,["iconSource"] = 0,["xOffset"] = 273,["displayText_format_p_time_dynamic_threshold"] = 60,["yOffset"] = 22,["anchorPoint"] = "CENTER",["echoVersion"] = 7,["displayText_format_p_time_format"] = 0,["url"] = "https://echoesports.gg",["icon"] = true,["displayText_format_p_time_mod_rate"] = true,["keepAspectRatio"] = false,["wordWrap"] = "WordWrap",["barColor"] = {0.258823543787,0,1,1,},["desaturate"] = false,["font"] = "Friz Quadrata TT",["sparkOffsetY"] = 0,["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["use_spellknown"] = false,["class"] = {["multi"] = {},},["encounterid"] = "2731",["use_difficulty"] = true,["spellknown"] = 116841,["size"] = {["multi"] = {},},},["shadowXOffset"] = 1,["useAdjustededMin"] = false,["regionType"] = "icon",["displayText_format_unit_color"] = "class",["texture"] = "Minimalist",["displayText_format_spell_format"] = "none",["cooldownTextDisabled"] = false,["spark"] = false,["tocversion"] = 100200,["displayText_format_unit_format"] = "Unit",["alpha"] = 1,["config"] = {},["displayIcon"] = "4497595",["outline"] = "OUTLINE",["sparkOffsetX"] = 0,["parent"] = "5. Singles - Larodar, Keeper of the Flame",["shadowYOffset"] = -1,["displayText_format_unit_abbreviate_max"] = 8,["cooldownSwipe"] = true,["sparkRotationMode"] = "AUTO",["cooldownEdge"] = false,["triggers"] = {[1] = {["trigger"] = {["itemName"] = 5512,["subeventSuffix"] = "_CAST_START",["use_genericShowOn"] = true,["genericShowOn"] = "showOnReady",["names"] = {},["event"] = "Cooldown Progress (Item)",["spellIds"] = {},["type"] = "item",["use_itemName"] = true,["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "item",["subeventSuffix"] = "_CAST_START",["use_genericShowOn"] = true,["genericShowOn"] = "showOnReady",["names"] = {},["event"] = "Cooldown Progress (Item)",["spellIds"] = {},["unit"] = "player",["use_itemName"] = true,["subeventPrefix"] = "SPELL",["itemName"] = 191380,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["spellName"] = 109304,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["use_itemName"] = true,["unit"] = "player",["realSpellName"] = "Exhilaration",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["names"] = {},["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[4] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["names"] = {},["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["realSpellName"] = "Desperate Prayer",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["unit"] = "player",["type"] = "spell",["use_track"] = true,["spellName"] = 19236,},["untrigger"] = {},},[5] = {["trigger"] = {["spellName"] = 202168,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_genericShowOn"] = true,["use_itemName"] = true,["names"] = {},["realSpellName"] = "Impending Victory",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[6] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["realSpellName"] = "Crimson Vial",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["names"] = {},["type"] = "spell",["use_track"] = true,["spellName"] = 185311,},["untrigger"] = {},},[7] = {["trigger"] = {["spellName"] = 6789,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["names"] = {},["use_genericShowOn"] = true,["use_itemName"] = true,["subeventPrefix"] = "SPELL",["realSpellName"] = "Mortal Coil",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[8] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["names"] = {},["realSpellName"] = "Lay on Hands",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["subeventPrefix"] = "SPELL",["type"] = "spell",["use_track"] = true,["spellName"] = 633,},["untrigger"] = {},},[9] = {["trigger"] = {["spellName"] = 2061,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["use_itemName"] = true,["unit"] = "player",["realSpellName"] = "Flash Heal",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["names"] = {},["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[10] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["names"] = {},["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["realSpellName"] = "Vivify",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["unit"] = "player",["type"] = "spell",["use_track"] = true,["spellName"] = 116670,},["untrigger"] = {},},[11] = {["trigger"] = {["spellName"] = 108238,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_genericShowOn"] = true,["use_itemName"] = true,["names"] = {},["realSpellName"] = "Renewal",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[12] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["realSpellName"] = "Regrowth",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["names"] = {},["type"] = "spell",["use_track"] = true,["spellName"] = 8936,},["untrigger"] = {},},[13] = {["trigger"] = {["spellName"] = 8004,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["names"] = {},["use_genericShowOn"] = true,["use_itemName"] = true,["subeventPrefix"] = "SPELL",["realSpellName"] = "Healing Surge",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[14] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["names"] = {},["realSpellName"] = "Death Pact",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["subeventPrefix"] = "SPELL",["type"] = "spell",["use_track"] = true,["spellName"] = 48743,},["untrigger"] = {},},[15] = {["trigger"] = {["spellName"] = 49998,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["use_itemName"] = true,["unit"] = "player",["realSpellName"] = "Death Strike",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["names"] = {},["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[16] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["names"] = {},["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["realSpellName"] = "Verdant Embrace",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["unit"] = "player",["type"] = "spell",["use_track"] = true,["spellName"] = 360995,},["untrigger"] = {},},[17] = {["trigger"] = {["spellName"] = 355913,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_genericShowOn"] = true,["use_itemName"] = true,["names"] = {},["realSpellName"] = "Emerald Blossom",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[18] = {["trigger"] = {["rem"] = "1",["auranames"] = {"Frozen Shroud",},["subeventPrefix"] = "SPELL",["group_count"] = "0",["group_countOperator"] = ">",["debuffType"] = "HARMFUL",["type"] = "aura2",["names"] = {},["auraspellids"] = {"427299",},["useExactSpellId"] = true,["remOperator"] = "<=",["event"] = "Health",["useGroup_count"] = true,["spellIds"] = {},["useName"] = false,["events"] = "CLEU_SPELL_AURA_APPLIED ECHO_FULMINATING_FREEDOM_ASSIGN",["subeventSuffix"] = "_CAST_START",["check"] = "event",["custom_type"] = "stateupdate",["unit"] = "player",["useRem"] = true,},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) \
    if t[18] then\
        for i = 1, 17 do\
            if t[i] then\
                return true\
            end\
        end\
    end\
end\
\
\
",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "preset",["easeType"] = "none",["duration_type"] = "seconds",["easeStrength"] = 3,["preset"] = "alphaPulse",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,},["actions"] = {["start"] = {},["init"] = {["do_custom"] = false,},["finish"] = {},},["orientation"] = "HORIZONTAL",["subRegions"] = {{["type"] = "subbackground",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Proc",["glowLength"] = 10,["glow"] = true,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowStartAnim"] = true,["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowDuration"] = 0.4,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 200,["icon_color"] = {1,1,1,1,},["displayText_format_unit_abbreviate"] = false,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["fontSize"] = 30,["source"] = "import",["customTextUpdate"] = "event",["sparkRotation"] = 0,["width"] = 200,["frameStrata"] = 1,["color"] = {1,1,1,1,},["id"] = "5. [HS] - Flash Fire Debuff - Larodar",["zoom"] = 0,["automaticWidth"] = "Auto",["icon_side"] = "RIGHT",["uid"] = "S3OTrDV2N4Z",["displayText_format_p_time_legacy_floor"] = false,["sparkHeight"] = 30,["displayText_format_p_time_precision"] = 1,["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["fixedWidth"] = 200,["justify"] = "LEFT",["authorOptions"] = {},["sparkHidden"] = "NEVER",["displayText"] = "HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT",["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["backgroundColor"] = {0,0,0,0.5,},["displayText_format_unit_realm_name"] = "never",["inverse"] = false,["selfPoint"] = "CENTER",["shadowColor"] = {0,0,0,1,},["conditions"] = {},["cooldown"] = true,["sparkColor"] = {1,1,1,1,},},["5. Private Aura Holder 2 (singles) - Larodar"] = {["iconSource"] = -1,["wagoID"] = "n3lAhBYxn",["xOffset"] = 450,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["custom_type"] = "stateupdate",["type"] = "custom",["use_alwaystrue"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_absorbMode"] = true,["event"] = "Conditions",["use_unit"] = true,["use_absorbHealMode"] = true,["custom"] = "function(a)\
    for k, v in pairs(a) do\
        v.show = false\
        v.changed = true\
    end\
    a[2] = {\
        show = true,\
        changed = true,\
        index = 2\
    } \
    return true\
end",["spellIds"] = {},["events"] = "",["check"] = "event",["names"] = {},["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text"] = "%index",["text_text_format_p_format"] = "timed",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_format"] = 0,["anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_p_time_precision"] = 1,["text_shadowYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorYOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_fontSize"] = 40,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},},["height"] = 100,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["regionType"] = "icon",["parent"] = "5. Singles - Larodar, Keeper of the Flame",["cooldown"] = false,["color"] = {1,1,1,1,},["cooldownEdge"] = false,["cooldownTextDisabled"] = true,["anchorFrameParent"] = false,["uid"] = "NDZK4aHbPNK",["frameStrata"] = 1,["zoom"] = 0,["semver"] = "1.0.5",["tocversion"] = 100200,["id"] = "5. Private Aura Holder 2 (singles) - Larodar",["width"] = 100,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["config"] = {},["inverse"] = false,["authorOptions"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "customcheck",["value"] = "function()\
    return not WeakAuras.IsOptionsOpen()\
end",},["changes"] = {{["value"] = {1,1,1,0,},["property"] = "color",},{["property"] = "sub.2.text_visible",},},},},["information"] = {},["actions"] = {["start"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
if anchorID then\
    C_UnitAuras.RemovePrivateAuraAnchor(anchorID)\
end\
\
local self = aura_env.region\
local privateAnchorArgs = {\
    unitToken = \"player\",\
    auraIndex = 2,\
    parent = self,\
    showCountdownFrame = true,\
    showCountdownNumbers = true,\
    iconInfo = {\
        iconAnchor = {\
            point = \"CENTER\",\
            relativeTo = self,\
            relativePoint = \"CENTER\",\
            offsetX = 0,\
            offsetY = 0\
        },\
        iconWidth = self:GetWidth(),\
        iconHeight = self:GetHeight()\
    }\
}\
\
aura_env.region.anchorID = C_UnitAuras.AddPrivateAuraAnchor(privateAnchorArgs)",["do_custom"] = true,},["init"] = {["do_custom"] = false,},["finish"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
if anchorID then\
    C_UnitAuras.RemovePrivateAuraAnchor(anchorID)\
end",["do_custom"] = true,},},},["5. [HEAL ABSORB] - Flash Fire Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["useExactSpellId"] = false,["fetchTooltip"] = false,["event"] = "Health",["subeventPrefix"] = "SPELL",["auraspellids"] = {"427299",},["auranames"] = {"421326",},["spellIds"] = {},["names"] = {},["subeventSuffix"] = "_CAST_START",["useName"] = true,["unit"] = "player",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "HEAL\\nABSORB",["text_text_format_toooltip1_format"] = "none",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_toooltip3_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["xOffset"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "6w9Hf5KcGj0",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [HEAL ABSORB] - Flash Fire Debuff - Larodar, Keeper of the Flame",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 55,["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["color"] = {1,1,1,1,},},["5. Private Aura Holder 1 (singles) - Larodar"] = {["iconSource"] = -1,["wagoID"] = "n3lAhBYxn",["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["custom_type"] = "stateupdate",["type"] = "custom",["use_alwaystrue"] = true,["subeventSuffix"] = "_CAST_START",["use_unit"] = true,["use_absorbMode"] = true,["event"] = "Conditions",["subeventPrefix"] = "SPELL",["names"] = {},["spellIds"] = {},["custom"] = "function(a)\
    for k, v in pairs(a) do\
        v.show = false\
        v.changed = true\
    end\
    a[1] = {\
        show = true,\
        changed = true,\
        index = 1\
    } \
    return true\
end",["events"] = "",["check"] = "event",["use_absorbHealMode"] = true,["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text"] = "%index",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_format"] = "timed",["text_text_format_p_time_dynamic_threshold"] = 60,["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_p_time_format"] = 0,["text_shadowYOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 40,["anchorXOffset"] = 0,["text_text_format_p_time_precision"] = 1,},},["height"] = 100,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["regionType"] = "icon",["parent"] = "5. Singles - Larodar, Keeper of the Flame",["information"] = {},["actions"] = {["start"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
if anchorID then\
    C_UnitAuras.RemovePrivateAuraAnchor(anchorID)\
end\
\
local self = aura_env.region\
local privateAnchorArgs = {\
    unitToken = \"player\",\
    auraIndex = 1,\
    parent = self,\
    showCountdownFrame = true,\
    showCountdownNumbers = true,\
    iconInfo = {\
        iconAnchor = {\
            point = \"CENTER\",\
            relativeTo = self,\
            relativePoint = \"CENTER\",\
            offsetX = 0,\
            offsetY = 0\
        },\
        iconWidth = self:GetWidth(),\
        iconHeight = self:GetHeight()\
    }\
}\
\
aura_env.region.anchorID = C_UnitAuras.AddPrivateAuraAnchor(privateAnchorArgs)",["do_custom"] = true,},["finish"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
if anchorID then\
    C_UnitAuras.RemovePrivateAuraAnchor(anchorID)\
end",["do_custom"] = true,},["init"] = {["do_custom"] = false,},},["url"] = "https://echoesports.gg",["zoom"] = 0,["anchorFrameParent"] = false,["config"] = {},["alpha"] = 1,["cooldownTextDisabled"] = true,["semver"] = "1.0.5",["tocversion"] = 100200,["id"] = "5. Private Aura Holder 1 (singles) - Larodar",["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["width"] = 100,["frameStrata"] = 1,["uid"] = "kMGKDQr8oM1",["inverse"] = false,["xOffset"] = 340,["authorOptions"] = {},["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "customcheck",["value"] = "function()\
    return not WeakAuras.IsOptionsOpen()\
end",},["changes"] = {{["value"] = {1,1,1,0,},["property"] = "color",},{["property"] = "sub.2.text_visible",},},},},["cooldown"] = false,["selfPoint"] = "CENTER",},["5. [TREANTS] - Fiery Force of Nature Cast - Larodar"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,1,0.05882353335619,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["use_zoneIds"] = false,["encounterid"] = "2731",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["class"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "5351065",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "5. Bars - Larodar, Keeper of the Flame",["preferToUpdate"] = false,["adjustedMin"] = "4",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["borderInset"] = 11,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["config"] = {},["timer"] = true,["sparkRotationMode"] = "AUTO",["displayTextLeft"] = "%n",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["auranames"] = {"364963","Core Overload",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["spellNames"] = {422611,},["use_spellNames"] = true,["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["names"] = {"Sacred Blade",},["unit"] = "boss",["spellIds"] = {283573,},["duration"] = "3",["debuffType"] = "HARMFUL",["custom_hide"] = "timed",["useName"] = true,["auraspellids"] = {},["unevent"] = "auto",["use_genericShowOn"] = true,["buffShowOn"] = "showOnActive",["use_onUpdateUnitTarget"] = true,["type"] = "unit",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["subeventPrefix"] = "SPELL",["remOperator"] = "<",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["customTextUpdate"] = "update",["internalVersion"] = 70,["width"] = 240,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["easeStrength"] = 3,["rotate"] = 0,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkRotation"] = 0,["stickyDuration"] = false,["xOffset"] = 0,["sparkHidden"] = "NEVER",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "TREANTS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["useAdjustededMax"] = false,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["semver"] = "1.0.5",["source"] = "import",["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["borderOffset"] = 5,["zoom"] = 0,["border"] = false,["borderEdge"] = "None",["sparkHeight"] = 14,["borderSize"] = 16,["borderInFront"] = false,["icon_side"] = "LEFT",["borderBackdrop"] = "Blizzard Tooltip",["sparkWidth"] = 3,["anchorFrameParent"] = false,["backgroundColor"] = {0,0,0,0.33132427930832,},["displayTextRight"] = "%p",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["uid"] = "MZfmfsXzYIY",["id"] = "5. [TREANTS] - Fiery Force of Nature Cast - Larodar",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["url"] = "https://echoesports.gg",["icon"] = true,["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["color"] = {},},["5. [STACKS] - Ashen Asphyxiation  Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["spellIds"] = {},["type"] = "aura2",["auranames"] = {"428946",},["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 3,["text_visible"] = true,["text_fontSize"] = 19,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["desaturate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "stacks",["value"] = "10",["op"] = ">=",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\David\\10.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},},["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "6K9shVSJ6lo",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [STACKS] - Ashen Asphyxiation  Debuff - Larodar, Keeper of the Flame",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 55,["xOffset"] = 0,["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["color"] = {1,1,1,1,},},["5. [LEECH] - Smoldering Suffocation Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Health",["names"] = {},["spellIds"] = {},["type"] = "aura2",["auranames"] = {"421594",},["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "LEECH",["text_text_format_toooltip1_format"] = "none",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_anchorPoint"] = "OUTER_BOTTOM",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_text_format_tooltip1_format"] = "BigNumber",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_toooltip3_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["selfPoint"] = "CENTER",["uid"] = "oxA1YKro8XC",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [LEECH] - Smoldering Suffocation Debuff - Larodar, Keeper of the Flame",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["xOffset"] = 0,["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",},["5. [INTERMISSION] - Consuming Flame Cast - Larodar, Keeper of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.039215687662363,1,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "hrgJV4MaaQT",["displayIcon"] = "236207",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "5. Bars - Larodar, Keeper of the Flame",["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["textSize"] = 12,["customTextUpdate"] = "update",["sparkRotationMode"] = "AUTO",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {421316,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["use_unit"] = true,["subeventPrefix"] = "SPELL",["unit"] = "boss",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["config"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["adjustedMax"] = "4",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["height"] = 23,["borderInset"] = 11,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "INTERMISSION",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["icon"] = true,["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["authorOptions"] = {},["color"] = {},["anchorFrameParent"] = false,["textFlags"] = "None",["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["zoom"] = 0,["id"] = "5. [INTERMISSION] - Consuming Flame Cast - Larodar, Keeper of the Flame",["adjustedMin"] = "4",["frameStrata"] = 1,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["inverse"] = false,["borderOffset"] = 5,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["5. [DOT] - Searing Ash Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["useName"] = true,["unit"] = "player",["auranames"] = {"421323",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 3,["text_visible"] = true,["text_fontSize"] = 19,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["selfPoint"] = "CENTER",["uid"] = "uP9f8SJOf9i",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [DOT] - Searing Ash Debuff - Larodar, Keeper of the Flame",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["authorOptions"] = {},},["5. [GET SAFE] - Raging Inferno Cast - Larodar, Keeper of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 4,["sparkRotation"] = 0,["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "I6avirGoOKC",["displayIcon"] = "236215",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "5. Bars - Larodar, Keeper of the Flame",["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["config"] = {},["customTextUpdate"] = "update",["zoom"] = 0,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {417634,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["subeventPrefix"] = "SPELL",["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"419485",},["debuffType"] = "BOTH",["matchesShowOn"] = "showOnMissing",["useName"] = true,["unit"] = "player",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {},["finish"] = {},},["internalVersion"] = 70,["sparkRotationMode"] = "AUTO",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["displayTextLeft"] = "%n",["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "GET SAFE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["border_anchor"] = "bar",["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["id"] = "5. [GET SAFE] - Raging Inferno Cast - Larodar, Keeper of the Flame",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["borderInset"] = 11,["source"] = "import",["timerSize"] = 12,["auto"] = true,["textFlags"] = "None",["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["color"] = {},["authorOptions"] = {},["anchorFrameParent"] = false,["icon"] = true,["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["backdropColor"] = {1,1,1,0.5,},["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["inverse"] = false,["borderOffset"] = 5,["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 2,["variable"] = "show",["value"] = 1,},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["5. [250%] - Everlasting Blaze Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["stacksOperator"] = "==",["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["unit"] = "player",["useStacks"] = true,["stacks"] = "1",["spellIds"] = {},["names"] = {},["subeventPrefix"] = "SPELL",["auranames"] = {"429032",},["type"] = "aura2",["debuffType"] = "HARMFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["unit"] = "player",["use_stage"] = true,["event"] = "Boss Mod Stage",["stage_operator"] = "==",["stage"] = "1",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 19,["anchorXOffset"] = 0,["text_anchorYOffset"] = 3,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["authorOptions"] = {},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["config"] = {},["useCooldownModRate"] = true,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [250%] - Everlasting Blaze Debuff - Larodar, Keeper of the Flame",["zoom"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "pkHDiAw6Lcj",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",},["5. [BUFF] - Blazing Coalescence Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["stacksOperator"] = "==",["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["unit"] = "player",["useStacks"] = false,["stacks"] = "1",["spellIds"] = {},["names"] = {},["subeventPrefix"] = "SPELL",["auranames"] = {"426249",},["useName"] = true,["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "BUFF",["text_text_format_toooltip1_format"] = "none",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_toooltip3_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["desaturate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "t9He3(wJclt",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [BUFF] - Blazing Coalescence Debuff - Larodar, Keeper of the Flame",["frameStrata"] = 1,["useCooldownModRate"] = true,["width"] = 55,["authorOptions"] = {},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\RobotBlip.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["color"] = {1,1,1,1,},},["5. [SAFE] - Nature's Bulwark  Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["auranames"] = {"419485",},["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SAFE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip2_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["authorOptions"] = {},["stickyDuration"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [SAFE] - Nature's Bulwark  Debuff - Larodar, Keeper of the Flame",["frameStrata"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",["uid"] = "wS8GRTTaOg5",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["xOffset"] = 0,},["5. Flash Fire ABSORB bar - Larodar"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["user_x"] = 0,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 23,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["sparkRotation"] = 0,["sameTexture"] = true,["url"] = "https://echoesports.gg",["icon"] = false,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["crop_y"] = 0.41,["preferToUpdate"] = false,["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["startAngle"] = 0,["crop_x"] = 0.41,["compress"] = false,["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["blendMode"] = "BLEND",["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_10px.tga",["borderInset"] = 11,["slantMode"] = "INSIDE",["spark"] = false,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["tocversion"] = 100200,["cooldown"] = true,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["sparkColor"] = {1,1,1,1,},["uid"] = "UnnZlFy)pkO",["sparkHidden"] = "NEVER",["load"] = {["difficulty"] = {["single"] = "mythic",},["use_encounterid"] = true,["spec"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["use_difficulty"] = true,["size"] = {["multi"] = {},},},["displayIcon"] = "",["displayTextRight"] = "%p",["backgroundOffset"] = 0,["borderColor"] = {1,1,1,0.5,},["timerColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["textFlags"] = "None",["color"] = {},["stacksFlags"] = "None",["adjustedMin"] = "4",["authorOptions"] = {},["user_y"] = 0,["desaturateBackground"] = false,["cooldownSwipe"] = true,["desaturateForeground"] = false,["customTextUpdate"] = "event",["cooldownEdge"] = false,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["useName"] = false,["useExactSpellId"] = true,["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["auraspellids"] = {"427299",},["subeventSuffix"] = "_CAST_START",["spellIds"] = {},["subeventPrefix"] = "SPELL",["auranames"] = {"421326",},["type"] = "aura2",["unit"] = "player",["debuffType"] = "HARMFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["use_showAbsorb"] = false,["type"] = "unit",["use_absorbHealMode"] = true,["use_absorbMode"] = true,["event"] = "Health",["use_unit"] = true,["use_showHealAbsorb"] = true,["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 70,["textColor"] = {1,1,1,1,},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderSize"] = 16,["stickyDuration"] = false,["auraRotation"] = 0,["zoom"] = 0,["border"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_text"] = "",["border_offset"] = 0,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},{["text_shadowXOffset"] = 1,["text_text"] = "%c",["text_text_format_c_big_number_format"] = "AbbreviateNumbers",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "CENTER",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_text_format_tooltip1_format"] = "BigNumber",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_CENTER",["text_text_format_c_format"] = "BigNumber",["text_text_format_n_format"] = "none",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_visible"] = true,},},["height"] = 23,["timerFlags"] = "None",["backdropColor"] = {1,1,1,0.5,},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["fontSize"] = 12,["source"] = "import",["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",["timer"] = true,["sparkOffsetX"] = 0,["mirror"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderInFront"] = false,["parent"] = "5. Flash Fire Heal Absorb - Larodar",["icon_side"] = "LEFT",["sparkRotationMode"] = "AUTO",["displayTextLeft"] = "%n",["sparkHeight"] = 14,["customText"] = "function()\
    if WeakAuras.IsOptionsOpen() then\
        aura_env.region:SetDurationInfo(123123, 321321, true)\
        return 123123\
    end\
    if aura_env.states[1].show and aura_env.states[2].show and aura_env.states[2].healabsorb then\
        if not aura_env.last or GetTime() - aura_env.last > 20 then\
            aura_env.max = aura_env.states[2].healabsorb\
            aura_env.last = GetTime()\
        end\
        \
        --elog(\"absorb\", aura_env.states[1].tooltip1)\
        aura_env.region:SetDurationInfo(aura_env.states[2].healabsorb, aura_env.max, true)\
        return aura_env.states[2].healabsorb\
    end\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["foregroundColor"] = {0,1,0.4078431725502,0.27108365297318,},["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["rotateText"] = "NONE",["id"] = "5. Flash Fire ABSORB bar - Larodar",["backgroundColor"] = {0,0,0,0.33132427930832,},["useCooldownModRate"] = true,["width"] = 240,["actions"] = {["start"] = {},["init"] = {},["finish"] = {["do_custom"] = true,["custom"] = "aura_env.max = nil",},},["config"] = {},["inverse"] = false,["cooldownTextDisabled"] = false,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderOffset"] = 5,},["5. Larodar, Keeper of the Flame"] = {["controlledChildren"] = {"5. Icons (high) - Larodar, Keeper of the Flame","5. Icons (low) - Larodar, Keeper of the Flame","5. Bars - Larodar, Keeper of the Flame","5. Texts - Larodar, Keeper of the Flame","5. Singles - Larodar, Keeper of the Flame",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["groupIcon"] = "5342927",["anchorPoint"] = "CENTER",["echoVersion"] = 4,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "5. Larodar, Keeper of the Flame",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["yOffset"] = 0,["config"] = {},["parent"] = " Echo - Amirdrassil",["selfPoint"] = "CENTER",["uid"] = "6so6tL4vSnd",["conditions"] = {},["information"] = {},["borderInset"] = 1,},["5. [TREANTS] - Ashen Call Cast - Larodar"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.039215687662363,1,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["use_zoneIds"] = false,["class"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["encounterid"] = "2731",["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "5351065",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "5. Bars - Larodar, Keeper of the Flame",["preferToUpdate"] = false,["adjustedMin"] = "4",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["uid"] = "LF1LlKsMos3",["sparkColor"] = {1,1,1,1,},["stacksFont"] = "Friz Quadrata TT",["sparkRotationMode"] = "AUTO",["displayTextLeft"] = "%n",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["auranames"] = {"364963","Core Overload",},["use_genericShowOn"] = true,["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = false,["fetchTooltip"] = true,["use_spellNames"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["spellNames"] = {421325,},["event"] = "Cast",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["unit"] = "boss",["names"] = {"Sacred Blade",},["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["matchesShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["use_absorbHealMode"] = true,["type"] = "unit",["unevent"] = "auto",["auraspellids"] = {},["duration"] = "3",["buffShowOn"] = "showOnActive",["use_onUpdateUnitTarget"] = true,["useName"] = true,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["subeventPrefix"] = "SPELL",["remOperator"] = "<",["spellName"] = 0,["subeventSuffix"] = "_CAST_SUCCESS",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["customTextUpdate"] = "update",["internalVersion"] = 70,["width"] = 240,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderColor"] = {1,1,1,0.5,},["stickyDuration"] = false,["xOffset"] = 0,["sparkHidden"] = "NEVER",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "TREANTS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["semver"] = "1.0.5",["source"] = "import",["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["borderOffset"] = 5,["zoom"] = 0,["border"] = false,["borderEdge"] = "None",["sparkHeight"] = 14,["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["borderBackdrop"] = "Blizzard Tooltip",["sparkWidth"] = 3,["anchorFrameParent"] = false,["backgroundColor"] = {0,0,0,0.33132427930832,},["displayTextRight"] = "%p",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["backdropColor"] = {1,1,1,0.5,},["id"] = "5. [TREANTS] - Ashen Call Cast - Larodar",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["inverse"] = false,["spark"] = false,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderInset"] = 11,},["5. CATCHER Assigner - Larodar"] = {["outline"] = "OUTLINE",["displayText_format_text_format"] = "none",["xOffset"] = 0,["preferToUpdate"] = false,["customText"] = "function()\
    if not WeakAuras.IsOptionsOpen() and aura_env.state.show then\
        if not aura_env.last or aura_env.last < GetTime() - 1.5 then\
            aura_env.last = GetTime()\
            SendChatMessage(\"CATCHER\")\
        end\
    end\
end",["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 28,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "update",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = true,["custom"] = "\
local keyword = \"catcher\"\
local backup = \"catcherbackup\"\
\
function aura_env.TryReadNote()\
    aura_env.initialized = false;\
    aura_env.rotations = {};\
    aura_env.numGroups = 0\
    aura_env.backup = {}\
    \
    \
    local noteData, errorString = EchoInternal:ReadEXRTNote();\
    if(errorString)then\
        print(\"Note parse failed,\",errorString);\
        elog(\"Note parsing failed:\",errorString);\
        return;\
    end\
    \
    for _,noteInfo in ipairs(noteData)do\
        if(noteInfo.identifier == keyword)then\
            local newRotation = {};\
            for rotationIdx,rotation in ipairs(noteInfo.rotation)do\
                for _,guy in ipairs(rotation)do\
                    table.insert(newRotation,guy);\
                end\
            end\
            table.insert(aura_env.rotations,newRotation);\
        elseif (noteInfo.identifier == backup)then\
            for rotationIdx,rotation in ipairs(noteInfo.rotation)do\
                for _,guy in ipairs(rotation)do\
                    table.insert(aura_env.backup,guy);\
                end\
            end\
        end\
    end\
    \
    aura_env.numGroups = #aura_env.rotations\
    if aura_env.numGroups > 0 then\
        elogl(\"CATCHER Init successful: groups\",aura_env.numGroups, \"backups\", #aura_env.backup)\
    end\
    --vdt(aura_env.rotations)\
    aura_env.initialized = true;\
end\
\
\
aura_env.unitOK = function(unit)\
    return (not UnitIsDeadOrGhost(unit)) and (not WA_GetUnitDebuff(unit, 426249))\
end\
\
\
",},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["event"] = "Health",["unit"] = "player",["names"] = {},["spellIds"] = {},["events"] = "TRIGGER:2 ENCOUNTER_START EXRT_NOTE_UPDATE ECHO_LARODAR_CATCH CLEU:SPELL_DAMAGE:SPELL_MISSED:SPELL_AURA_APPLIED:SPELL_AURA_APPLIED_DOSE",["custom_type"] = "stateupdate",["check"] = "event",["custom"] = "function(s,e,...)\
    if e == \"EXRT_NOTE_UPDATE\" then\
        \
        aura_env.TryReadNote()\
        \
    elseif e == \"ENCOUNTER_START\" then\
        aura_env.TryReadNote()\
        \
    elseif e == \"TRIGGER\" then\
        local num, tS = ...\
        if num and tS and tS[\"\"] and tS[\"\"].show then\
            local count = tonumber(tS[\"\"].count)\
            if count then\
                local thisGroup = count % aura_env.numGroups\
                thisGroup = thisGroup == 0 and aura_env.numGroups or thisGroup\
                local thisSet = aura_env.rotations[thisGroup]\
                \
                if thisSet then\
                    \
                    local usedBackups = {}\
                    local changed = false\
                    \
                    for index, name in ipairs(thisSet) do\
                        \
                        --backup checking\
                        if not aura_env.unitOK(name) then\
                            for i, backup in ipairs(aura_env.backup) do\
                                if aura_env.unitOK(backup) and not usedBackups[backup] then\
                                    usedBackups[backup] = true\
                                    name = backup\
                                    break\
                                end\
                            end\
                        end\
                        \
                        elogl(\"CATCHER\", index, name)\
                        if UnitIsUnit(name, \"player\") then\
                            --elog(\"Assigned to CATCHER\")\
                            -- if this assignment is the player then activate the Aura\
                            s[\"\"] = {\
                                show = true,\
                                changed = true,\
                                duration = 5, \
                                expirationTime = GetTime() + 5,\
                                autoHide = true,\
                                progressType = \"timed\",\
                                index = index,\
                                type = 1,\
                            }\
                            changed = true\
                            aura_env.count = 5\
                            C_Timer.After(5, function() WeakAuras.ScanEvents(\"ECHO_LARODAR_CATCH\", true) end)\
                            \
                        end\
                    end\
                    \
                    return changed\
                end\
            end\
        end\
        \
    elseif e == \"ECHO_LARODAR_CATCH\" and ... then\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            progressType = \"timed\",\
            autoHide = true,\
            duration = 10,\
            expirationTime = GetTime() + 10,\
            type = 2,\
        }\
        return true\
    elseif e == \"COMBAT_LOG_EVENT_UNFILTERED\" and s[\"\"] and aura_env.count and aura_env.count > 0 then\
        local _, subEvent, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID = ...\
        \
        if (subEvent == \"SPELL_DAMAGE\" or subEvent == \"SPELL_MISSED\") and spellID == 431314 then\
            elogl(\"Larodar test - balls -1, raider soaked\")\
            aura_env.count = aura_env.count - 1\
            \
        elseif spellID == 426256\
        and (subEvent == \"SPELL_AURA_APPLIED\" or subEvent == \"SPELL_AURA_APPLIED_DOSE\")\
        and destGUID == UnitGUID(\"boss1\")\
        then\
            elogl(\"Larodar test - balls -1, boss soaked\")\
            aura_env.count = aura_env.count - 1\
            \
        end\
        if aura_env.count == 0 then\
            s[\"\"].changed = true\
            s[\"\"].show = false\
        end\
        return true\
        \
    end\
end",["subeventPrefix"] = "SPELL",["customVariables"] = "{index = \"number\", expirationTime = true, duration = true, type = \"number\",}",},["untrigger"] = {},},[2] = {["trigger"] = {["use_remaining"] = true,["spellId"] = {426206,},["subeventSuffix"] = "_CAST_START",["remaining_operator"] = "<",["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["use_spellId"] = true,["duration"] = "1",["remaining"] = "4",["unit"] = "player",["type"] = "combatlog",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["useName"] = true,["auranames"] = {"426249",},["unit"] = "player",["matchesShowOn"] = "showOnMissing",["type"] = "aura2",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] and t[3] end",["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["displayText_format_p_time_legacy_floor"] = false,["selfPoint"] = "CENTER",["desc"] = "NOTES:\
#catcher name name name name name\
#catcher name name name name name\
#catcherbackup name name name name name\
\
Lets you assign people to catch the balls on each set that the boss casts. ",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2731",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",["multi"] = {["mythic"] = true,},},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 25,["source"] = "import",["shadowXOffset"] = 1,["authorOptions"] = {},["displayText"] = "CATCH BALL %p%c",["regionType"] = "text",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "type",["value"] = "2",["op"] = "==",},["changes"] = {{["value"] = {0,0.94117653369904,1,1,},["property"] = "color",},},},},["displayText_format_p_format"] = "timed",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["url"] = "https://echoesports.gg",["config"] = {},["anchorFrameParent"] = false,["yOffset"] = 0,["displayText_format_c_format"] = "none",["internalVersion"] = 70,["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "5. CATCHER Assigner - Larodar",["parent"] = "5. Texts - Larodar, Keeper of the Flame",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["displayText_format_p_time_precision"] = 1,["uid"] = "BQfISTdpqFm",["color"] = {1,1,1,1,},["displayText_format_p_time_dynamic_threshold"] = 60,["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {["forceEvents"] = true,},["wordWrap"] = "WordWrap",},["5. Fireman Assigner - Larodar"] = {["outline"] = "OUTLINE",["displayText_format_text_format"] = "none",["color"] = {1,1,1,1,},["displayText"] = "%text %p%c",["customText"] = "function()\
    if not WeakAuras.IsOptionsOpen()\
    and aura_env.states[1] and aura_env.states[1].show\
    and aura_env.states[1].index\
    and aura_env.states[1].index < 3 then\
        if not aura_env.last or aura_env.last < GetTime() - 1.5 then\
            aura_env.last = GetTime()\
            SendChatMessage(aura_env.states[1].say)\
        end\
    end\
end",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 25,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = true,["custom"] = "aura_env.timings = {30, 60, 90, 120, 180, 210}\
local keyword = \"fireman\"\
local backup = \"backup\"\
\
function aura_env.TryReadNote()\
    aura_env.initialized = false;\
    aura_env.rotations = {};\
    aura_env.numGroups = 0\
    aura_env.backup = {}\
    \
    \
    local noteData, errorString = EchoInternal:ReadEXRTNote();\
    if(errorString)then\
        print(\"Note parse failed,\",errorString);\
        elog(\"Note parsing failed:\",errorString);\
        return;\
    end\
    \
    for _,noteInfo in ipairs(noteData)do\
        if(noteInfo.identifier == keyword)then\
            local newRotation = {};\
            for rotationIdx,rotation in ipairs(noteInfo.rotation)do\
                for _,guy in ipairs(rotation)do\
                    table.insert(newRotation,guy);\
                end\
            end\
            table.insert(aura_env.rotations,newRotation);\
        elseif (noteInfo.identifier == backup)then\
            for rotationIdx,rotation in ipairs(noteInfo.rotation)do\
                for _,guy in ipairs(rotation)do\
                    table.insert(aura_env.backup,guy);\
                end\
            end\
            \
        end\
    end\
    \
    aura_env.numGroups = #aura_env.rotations\
    if aura_env.numGroups > 0 then\
        elogl(\"FIREMEN Init successful: groups\",aura_env.numGroups, \"backups\", #aura_env.backup)\
    end\
    --vdt(aura_env.rotations)\
    aura_env.initialized = true;\
end\
\
\
aura_env.unitOK = function(unit)\
    return (not UnitIsDeadOrGhost(unit)) and (not WA_GetUnitDebuff(unit, 425531))\
end\
\
\
",},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["event"] = "Health",["unit"] = "player",["names"] = {},["custom"] = "function(s,e,num, tS)\
    if e == \"EXRT_NOTE_UPDATE\" then\
        \
        aura_env.TryReadNote()\
        \
    elseif e == \"ENCOUNTER_START\" then\
        aura_env.TryReadNote()\
        aura_env.count = 0\
        \
    elseif e == \"OPTIONS\" then\
        s[\"\"] = {show = true,changed = true,text = \"FIREMAN\"}\
        return true\
        \
    elseif e == \"TRIGGER\" and num and tS and tS[\"\"] and tS[\"\"].show then\
        local count = type(tS[\"\"].count) == \"number\" and tS[\"\"].count or tonumber(tS[\"\"].count)\
        if count then\
            local thisGroup = count % aura_env.numGroups\
            thisGroup = thisGroup == 0 and aura_env.numGroups or thisGroup\
            local thisSet = aura_env.rotations[thisGroup]\
            elogl(\"FIREMAN THIS SET:\", unpack(thisSet))\
            if thisSet then\
                local changed = false\
                local usedBackups = {}\
                \
                for index, name in ipairs(thisSet) do\
                    \
                    --backup checking\
                    if not aura_env.unitOK(name) then\
                        for i, backup in ipairs(aura_env.backup) do\
                            if aura_env.unitOK(backup) and not usedBackups[backup] then\
                                usedBackups[backup] = true\
                                name = backup\
                                break\
                            end\
                        end\
                    end\
                    \
                    if not aura_env.unitOK(name) then\
                        elogl(\"FIREMAN --- NO FIREMAN AVAILABLE FOR\",thisGroup, index)\
                    else\
                        \
                        elogl(\"FIREMAN\", index, name)\
                        \
                        local dur = 10--index == 3 and 10 or 5\
                        \
                        if UnitIsUnit(name, \"player\") then\
                            elog(\"Assigned to FIREMAN\")\
                            -- if this assignment is the player then activate the Aura\
                            local texts = {\
                                \"1ST CLICKER\",\
                                \"2ND CLICKER\",\
                                \"FIREMAN IN\",\
                            }\
                            local say = {\
                                \"{rt8}\",\
                                \"{rt7}\",\
                            }\
                            \
                            s[\"\"] = {\
                                show = true,\
                                changed = true,\
                                duration = dur, \
                                expirationTime = GetTime() + dur,\
                                autoHide = true,\
                                text = texts[index],\
                                index = index,\
                                progressType = \"timed\",\
                                say = say[index],\
                            }\
                            changed = true\
                        end\
                    end\
                end\
                \
                return changed\
            end\
        end\
    end\
end",["spellIds"] = {},["custom_type"] = "stateupdate",["check"] = "event",["events"] = "TRIGGER:2 ECHO_LARODAR_FIREMAN ENCOUNTER_START EXRT_NOTE_UPDATE",["subeventPrefix"] = "SPELL",["customVariables"] = "{index = \"number\", expirationTime = true}",},["untrigger"] = {},},[2] = {["trigger"] = {["use_remaining"] = true,["spellId"] = "422614",["remaining_operator"] = "<",["event"] = "Boss Mod Timer",["unit"] = "player",["use_spellId"] = true,["type"] = "addons",["remaining"] = "10",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desc"] = "NOTES:\
#fireman name name name\
#fireman name name name\
#fireman name name name\
#backup name name name\
\
Let's you set who will be putting out fires on each set. In each set the first 2 get told to click and the third gets told they're the FIREMAN. \
If people are dead or already debuffed then backups will be added isntead. \
",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",["multi"] = {["mythic"] = true,},},["class"] = {["multi"] = {},},["use_difficulty"] = true,["encounterid"] = "2731",["size"] = {["multi"] = {},},},["fontSize"] = 33,["source"] = "import",["shadowXOffset"] = 1,["preferToUpdate"] = false,["wordWrap"] = "WordWrap",["regionType"] = "text",["fixedWidth"] = 200,["displayText_format_p_time_mod_rate"] = true,["automaticWidth"] = "Auto",["xOffset"] = 0,["uid"] = "H3B7QPKEgFa",["displayText_format_p_time_precision"] = 1,["anchorFrameParent"] = false,["displayText_format_c_format"] = "none",["displayText_format_p_time_legacy_floor"] = false,["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "5. Fireman Assigner - Larodar",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "5. Texts - Larodar, Keeper of the Flame",["config"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["shadowYOffset"] = -1,["shadowColor"] = {0,0,0,1,},["conditions"] = {{["check"] = {["trigger"] = -2,["variable"] = "AND",["checks"] = {{["trigger"] = 1,["variable"] = "index",["value"] = "3",["op"] = "==",},{["trigger"] = 2,["variable"] = "expirationTime",["value"] = "5",["op"] = ">",},},},["changes"] = {{["value"] = {1,0,0,0,},["property"] = "color",},},},{["check"] = {["trigger"] = 1,["op"] = "==",["value"] = "3",["variable"] = "index",},["changes"] = {{["value"] = {1,0,0,1,},["property"] = "color",},},["linked"] = true,},{["check"] = {["trigger"] = -2,["variable"] = "AND",["checks"] = {{["trigger"] = 1,["variable"] = "index",["op"] = "==",["value"] = "3",},{["trigger"] = 1,["variable"] = "expirationTime",["op"] = "<",["value"] = "5",},},},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "index",["op"] = "<",["value"] = "3",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},},["information"] = {["forceEvents"] = true,},["selfPoint"] = "CENTER",},["5. Assign healers to absorbs - Larodar"] = {["outline"] = "OUTLINE",["parent"] = "5. Smart Healer Glows",["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 10,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {},["finish"] = {["hide_all_glows"] = true,},["init"] = {["do_custom"] = true,["custom"] = "aura_env.debug = false--true\
function aura_env.elog(...)\
    if aura_env.debug then\
        elog(...)\
    end\
end\
function aura_env.elogl(...)\
    if aura_env.debug then\
        elogl(...)\
    end\
end\
\
-- Spec priority: Hpal > Holy priest > MW > Rdruid > Evoker \
local specs = {[65] = 100, [257] = 90, [270] = 80, [264] = 70, [1468] = 60}\
\
function aura_env.getHealers()\
    local healers = {}\
    for unit in WA_IterateGroupMembers() do\
        if UnitGroupRolesAssigned(unit) == \"HEALER\" and (not UnitIsDeadOrGhost(unit)) and specs[WeakAuras.SpecForUnit(unit)] then\
            table.insert(healers, (UnitName(unit)))\
        end\
    end\
    table.sort(healers, function(a,b)\
            if not a then return false end\
            if not b then return true end\
            local aspec = WeakAuras.SpecForUnit(a)\
            local bspec = WeakAuras.SpecForUnit(b)\
            local ascore = specs[aspec] or 1\
            local bscore = specs[bspec] or 1\
            if ascore == bscore then\
                return a > b\
            else\
                return ascore > bscore\
            end\
    end)\
    aura_env.elogl(\"Smolderon healer list\", unpack(healers))\
    \
    return healers\
end\
\
aura_env.ensureUnit = function(name)\
    return UnitExists(name) and name or Ambiguate(name, \"short\")\
end\
\
\
",},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["event"] = "Health",["subeventPrefix"] = "SPELL",["unit"] = "player",["names"] = {},["custom"] = "-- ECHO_HEAL_ABSORB_ASSIGN\
function(s,e,...)\
    local _, subEvent, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID = ...\
    if e == \"ECHO_HEAL_ABSORB_ASSIGN\" then\
        if aura_env.affected and #aura_env.affected > 0 then\
            --aura_env.elogl(\"Healer Assign1: affected\", #aura_env.affected)\
            \
            C_Timer.After(2, function() WeakAuras.ScanEvents(\"ECHO_HEAL_ABSORB_ASSIGN\", true) end)\
            local absorbs = {}\
            for _, name in pairs(aura_env.affected) do\
                table.insert(absorbs, {name = name, absorb = UnitGetTotalHealAbsorbs(name) or 0})\
            end\
            table.sort(absorbs, function(a,b)\
                    if a.absorb == b.absorb then\
                        return a.name < b.name\
                    else\
                        return a.absorb > b.absorb\
                    end\
                end\
            )\
            local output = \"\"\
            for i, absorb in ipairs(absorbs) do\
                output = format(output..\"-\"..i..absorb.name..absorb.absorb)\
            end\
            aura_env.elogl(\"Healer Assign2: AbsorbList \",output)\
            local healers = aura_env.getHealers()\
            local numHealers = #healers\
            local numAffected = #absorbs\
            local assigns = {}\
            --logic to match healers with affected\
            for i = 1, numHealers do\
                for j = 1, numAffected do\
                    local me = i % numAffected\
                    me = me == 0 and numAffected or me\
                    local match = j % numHealers\
                    match = match == 0 and numHealers or match\
                    if me == match then\
                        assigns[healers[i]] = assigns[healers[i]] or {}\
                        table.insert(assigns[healers[i]], absorbs[j].name)\
                    end\
                end\
            end\
            for healer, assignments in pairs(assigns) do\
                aura_env.elogl(\"Healer Assign3\",healer, \">\", unpack(assignments))\
            end\
            \
            if assigns[WeakAuras.me] then\
                for prio, affectedName in ipairs(assigns[WeakAuras.me]) do\
                    s[affectedName] = {\
                        show = true,\
                        changed = true,\
                        unit = affectedName,\
                        prio = prio,\
                    }\
                end\
            end\
            return true\
        end\
        \
    else\
        if subEvent == \"SPELL_AURA_APPLIED\" and spellID == 427299 then\
            if not aura_env.last or GetTime() - aura_env.last > 10 then\
                aura_env.affected = {}\
                aura_env.last = GetTime()\
                C_Timer.After(0.3, function() WeakAuras.ScanEvents(\"ECHO_HEAL_ABSORB_ASSIGN\", true) end)\
            end\
            local unit = aura_env.ensureUnit(destName)\
            table.insert(aura_env.affected, unit)\
            \
        elseif subEvent == \"SPELL_AURA_REMOVED\" and spellID == 427299 then\
            local unit = aura_env.ensureUnit(destName)\
            tDeleteItem(aura_env.affected, unit)\
            if s[unit] then\
                s[unit].show = false\
                s[unit].changed = true\
                return true\
            end\
        end\
    end\
end\
\
\
",["custom_type"] = "stateupdate",["check"] = "event",["events"] = "CLEU:SPELL_AURA_APPLIED:SPELL_AURA_REMOVED ECHO_HEAL_ABSORB_ASSIGN",["spellIds"] = {},["customVariables"] = "{prio = \"number\"}",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desc"] = "Assigns healers to the Heal Absorbs so nobody gets missed. ",["font"] = "Friz Quadrata TT",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["difficulty"] = {["single"] = "mythic",},["size"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["use_difficulty"] = true,["use_encounterid"] = true,},["fontSize"] = 12,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_format"] = "timed",["selfPoint"] = "CENTER",["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "alwaystrue",},["changes"] = {{["value"] = {["glow_frame_type"] = "UNITFRAME",["glow_action"] = "hide",},["property"] = "glowexternal",},},},{["check"] = {["trigger"] = 1,["variable"] = "prio",["value"] = "1",["op"] = "==",},["changes"] = {{["value"] = {["glow_frame_type"] = "UNITFRAME",["glow_thickness"] = 2,["glow_action"] = "show",["glow_color"] = {1,0,0,1,},["glow_type"] = "Pixel",["use_glow_color"] = true,["glow_lines"] = 12,},["property"] = "glowexternal",},},},{["check"] = {["trigger"] = 1,["variable"] = "prio",["op"] = "==",["value"] = "2",},["changes"] = {{["value"] = {["glow_lines"] = 12,["glow_thickness"] = 2,["glow_action"] = "show",["glow_frame_type"] = "UNITFRAME",["glow_type"] = "Pixel",["use_glow_color"] = true,["glow_color"] = {1,0.98039221763611,0,1,},},["property"] = "glowexternal",},},},{["check"] = {["trigger"] = 1,["variable"] = "prio",["value"] = "3",["op"] = "==",},["changes"] = {{["value"] = {["glow_color"] = {0,0.9215686917305,1,1,},["glow_thickness"] = 2,["glow_action"] = "show",["glow_lines"] = 12,["glow_type"] = "Pixel",["use_glow_color"] = true,["glow_frame_type"] = "UNITFRAME",},["property"] = "glowexternal",},},},{["check"] = {["trigger"] = 1,["variable"] = "prio",["op"] = ">=",["value"] = "4",},["changes"] = {{["value"] = {["glow_frame_type"] = "UNITFRAME",["glow_thickness"] = 2,["glow_action"] = "show",["glow_color"] = {0.078431375324726,1,0,1,},["glow_type"] = "Pixel",["use_glow_color"] = true,["glow_lines"] = 12,},["property"] = "glowexternal",},},},},["internalVersion"] = 70,["wordWrap"] = "WordWrap",["displayText_format_p_time_precision"] = 1,["url"] = "https://echoesports.gg",["uid"] = "gnMYJZEkLqq",["yOffset"] = 0,["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "5. Assign healers to absorbs - Larodar",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["config"] = {},["color"] = {1,1,1,1,},["displayText_format_p_time_dynamic_threshold"] = 60,["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["displayText"] = "",},["5. Icons (low) - Larodar, Keeper of the Flame"] = {["grow"] = "LEFT",["controlledChildren"] = {"5. [STUN] - Encased in Ash Debuff -  Larodar, Keeper of the Flame","5. [SAFE] - Nature's Bulwark  Debuff - Larodar, Keeper of the Flame","5. [BUFF] - Blazing Coalescence Debuff - Larodar, Keeper of the Flame","5. [DOT] - Blistering Splinters Debuff - Larodar, Keeper of the Flame","5. [MOVE] - Burning Ground Debuff - Larodar, Keeper of the Flame","5. [CAN'T CLICK] - Dream Fatigue Debuff - Larodar, Keeper of the Flame","5. [DOT] - Searing Ash Debuff - Larodar, Keeper of the Flame","5. [250%] - Everlasting Blaze Debuff - Larodar, Keeper of the Flame","5. [STACKS] - Ashen Asphyxiation  Debuff - Larodar, Keeper of the Flame",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["selfPoint"] = "RIGHT",["align"] = "CENTER",["rotation"] = 0,["xOffset"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["useLimit"] = false,["internalVersion"] = 70,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["gridType"] = "RD",["backdropColor"] = {1,1,1,0.5,},["borderInset"] = 1,["source"] = "import",["parent"] = "5. Larodar, Keeper of the Flame",["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Icon - Low Priority - Anchor [AMIR]",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["borderEdge"] = "Square Full White",["frameStrata"] = 1,["arcLength"] = 360,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["fullCircle"] = true,["tocversion"] = 100200,["id"] = "5. Icons (low) - Larodar, Keeper of the Flame",["regionType"] = "dynamicgroup",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["sortHybridTable"] = {["5. [STUN] - Encased in Ash Debuff -  Larodar, Keeper of the Flame"] = false,["5. [BUFF] - Blazing Coalescence Debuff - Larodar, Keeper of the Flame"] = false,["5. [SAFE] - Nature's Bulwark  Debuff - Larodar, Keeper of the Flame"] = false,["5. [DOT] - Blistering Splinters Debuff - Larodar, Keeper of the Flame"] = false,["5. [CAN'T CLICK] - Dream Fatigue Debuff - Larodar, Keeper of the Flame"] = false,["5. [250%] - Everlasting Blaze Debuff - Larodar, Keeper of the Flame"] = false,["5. [STACKS] - Ashen Asphyxiation  Debuff - Larodar, Keeper of the Flame"] = false,["5. [DOT] - Searing Ash Debuff - Larodar, Keeper of the Flame"] = false,["5. [MOVE] - Burning Ground Debuff - Larodar, Keeper of the Flame"] = false,},["uid"] = "oNzAd1PBkiO",["animate"] = false,["space"] = 2,["config"] = {},["conditions"] = {},["information"] = {},["stagger"] = 0,},["5. [BOMBS] - BOMB TIMER - Larodar, Keeper of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["class"] = {["multi"] = {},},["use_difficulty"] = true,["encounterid"] = "2731",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "1029721",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "5. Bars - Larodar, Keeper of the Flame",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "l5axeBTNbut",["config"] = {},["sparkRotationMode"] = "AUTO",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellId"] = {428901,},["auranames"] = {"428896",},["duration"] = "8",["use_unit"] = true,["group_count"] = "0",["group_countOperator"] = ">",["type"] = "combatlog",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["event"] = "Combat Log",["unit"] = "group",["names"] = {},["use_spellId"] = true,["spellIds"] = {},["subeventPrefix"] = "SPELL",["useName"] = true,["useGroup_count"] = true,["use_absorbMode"] = true,["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["internalVersion"] = 70,["rotateText"] = "NONE",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["auto"] = true,["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["borderInset"] = 11,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BOMBS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["authorOptions"] = {},["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["color"] = {},["textFlags"] = "None",["anchorFrameParent"] = false,["stacksFont"] = "Friz Quadrata TT",["icon"] = true,["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["zoom"] = 0,["id"] = "5. [BOMBS] - BOMB TIMER - Larodar, Keeper of the Flame",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 240,["sparkRotation"] = 0,["customTextUpdate"] = "update",["inverse"] = false,["height"] = 23,["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["value"] = "3.1",["op"] = "<",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\David\\3.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["op"] = "<",["value"] = "2.1",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\David\\2.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["value"] = "1.1",["op"] = "<",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\David\\1.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",},["5. Everlasting Blaze when boss casts - Larodar"] = {["iconSource"] = -1,["xOffset"] = 210,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["spellIds"] = {},["type"] = "aura2",["auranames"] = {"429032",},["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "combatlog",["spellId"] = {426206,},["subeventSuffix"] = "_CAST_START",["duration"] = "10",["event"] = "Combat Log",["unit"] = "player",["use_spellId"] = true,["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["custom_hide"] = "timed",["type"] = "custom",["events"] = "ECHO_LARODAR_FIVE_CATCHES",["custom_type"] = "event",["custom"] = "function(e,nilcheck) return nilcheck end",["duration"] = "10",["debuffType"] = "HELPFUL",["unit"] = "player",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] and t[2] and not t[3] end",["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desc"] = "Extra reminder to not soak balls when debuffed. ",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "CARE",["text_text_format_toooltip1_format"] = "none",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,0,0,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_toooltip3_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 30,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Proc",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = true,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 100,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2731",["size"] = {["multi"] = {},},},["source"] = "import",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\RobotBlip.ogg",["do_sound"] = false,},["init"] = {},["finish"] = {},},["cooldown"] = true,["displayIcon"] = "",["regionType"] = "icon",["url"] = "https://echoesports.gg",["authorOptions"] = {},["config"] = {},["color"] = {1,1,1,1,},["width"] = 100,["anchorFrameParent"] = false,["useCooldownModRate"] = true,["zoom"] = 0,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "5. Everlasting Blaze when boss casts - Larodar",["alpha"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "5. Singles - Larodar, Keeper of the Flame",["uid"] = "fNUKLle(lzh",["inverse"] = false,["desaturate"] = false,["selfPoint"] = "CENTER",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["stickyDuration"] = false,},["5. Intermission Soon - Larodar"] = {["outline"] = "OUTLINE",["authorOptions"] = {},["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_specific_unit"] = true,["percenthealth"] = {"35",},["event"] = "Health",["names"] = {},["use_unit"] = true,["use_absorbMode"] = true,["spellIds"] = {},["unit"] = "boss1",["subeventPrefix"] = "SPELL",["use_percenthealth"] = true,["percenthealth_operator"] = {">=",},["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_unit"] = true,["use_absorbMode"] = true,["event"] = "Health",["names"] = {},["use_specific_unit"] = true,["percenthealth"] = {"36.5",},["spellIds"] = {},["unit"] = "boss1",["subeventPrefix"] = "SPELL",["use_percenthealth"] = true,["percenthealth_operator"] = {"<",},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["internalVersion"] = 70,["selfPoint"] = "BOTTOM",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["difficulty"] = {["single"] = "mythic",["multi"] = {["mythic"] = true,},},["size"] = {["multi"] = {},},["encounterid"] = "2731",["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["use_encounterid"] = true,},["fontSize"] = 20,["source"] = "import",["shadowXOffset"] = 1,["color"] = {1,1,1,1,},["regionType"] = "text",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["conditions"] = {},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["displayText_format_p_time_precision"] = 1,["anchorFrameParent"] = false,["config"] = {},["displayText"] = "INTERMISSION SOON",["displayText_format_p_time_dynamic_threshold"] = 60,["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "5. Intermission Soon - Larodar",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "5. Texts - Larodar, Keeper of the Flame",["uid"] = "oXr9xSbnwgw",["xOffset"] = 0,["url"] = "https://echoesports.gg",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["wordWrap"] = "WordWrap",},["5. Flash Fire Heal Absorb - Larodar"] = {["controlledChildren"] = {"5. Flash Fire ABSORB bar - Larodar","5. Flash fire TIMER bar - Larodar",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 100,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "5. Flash Fire Heal Absorb - Larodar",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "5. Singles - Larodar, Keeper of the Flame",["uid"] = "yugoP9iqATP",["config"] = {},["xOffset"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["conditions"] = {},["information"] = {},["borderInset"] = 1,},["5. [SOAKS INC] - Falling Embers Cast -  Larodar"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.98039221763611,1,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["use_zoneIds"] = false,["class"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["encounterid"] = "2731",["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "5351065",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "5. Bars - Larodar, Keeper of the Flame",["preferToUpdate"] = false,["adjustedMin"] = "4",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["borderInset"] = 11,["stacksFont"] = "Friz Quadrata TT",["config"] = {},["spark"] = false,["sparkRotationMode"] = "AUTO",["textSize"] = 12,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["auranames"] = {"364963","Core Overload",},["duration"] = "7",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = true,["use_spellNames"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["spellNames"] = {"427252",},["event"] = "Cast",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_SUCCESS",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "boss",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["group_countOperator"] = ">",["use_unit"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["matchesShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["use_genericShowOn"] = true,["type"] = "unit",["names"] = {"Sacred Blade",},["unevent"] = "auto",["auraspellids"] = {},["buffShowOn"] = "showOnActive",["use_onUpdateUnitTarget"] = true,["useName"] = true,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["subeventPrefix"] = "SPELL",["remOperator"] = "<",["use_debuffClass"] = false,["custom_type"] = "event",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["customTextUpdate"] = "update",["internalVersion"] = 70,["width"] = 240,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderColor"] = {1,1,1,0.5,},["stickyDuration"] = false,["xOffset"] = 0,["sparkHidden"] = "NEVER",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SOAKS INC",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["semver"] = "1.0.5",["source"] = "import",["customText"] = "function()\
    return aura_env.count\
end\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["borderOffset"] = 5,["zoom"] = 0,["border"] = false,["borderEdge"] = "None",["sparkHeight"] = 14,["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["borderBackdrop"] = "Blizzard Tooltip",["sparkWidth"] = 3,["anchorFrameParent"] = false,["backgroundColor"] = {0,0,0,0.33132427930832,},["displayTextRight"] = "%p",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["useAdjustededMax"] = false,["id"] = "5. [SOAKS INC] - Falling Embers Cast -  Larodar",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["inverse"] = false,["uid"] = "TXRN5x11sTa",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["color"] = {},},["5. [MOVE] - Burning Ground Debuff - Larodar, Keeper of the Flame"] = {["iconSource"] = -1,["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"417610",},["event"] = "Health",["unit"] = "player",["spellIds"] = {},["names"] = {},["type"] = "aura2",["subeventPrefix"] = "SPELL",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "MOVE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2731",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["authorOptions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["selfPoint"] = "CENTER",["stickyDuration"] = false,["uid"] = "Wa0Oe5jrPNx",["frameStrata"] = 1,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "5. [MOVE] - Burning Ground Debuff - Larodar, Keeper of the Flame",["cooldownTextDisabled"] = false,["alpha"] = 1,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},});


-- 5. manifest data

journal:AddManifestData({
	{
		["echoVersion"] = 4,
		["parent"] = " Echo - Amirdrassil",
		["id"] = "5. Larodar, Keeper of the Flame",
		["children"] = {
			"5. Singles - Larodar, Keeper of the Flame",
			"5. Texts - Larodar, Keeper of the Flame",
			"5. Bars - Larodar, Keeper of the Flame",
			"5. Icons (low) - Larodar, Keeper of the Flame",
			"5. Icons (high) - Larodar, Keeper of the Flame",
		},
		["uid"] = "6so6tL4vSnd",
	},
	{
		["echoVersion"] = 1,
		["parent"] = "5. Larodar, Keeper of the Flame",
		["id"] = "5. Singles - Larodar, Keeper of the Flame",
		["children"] = {
			"5. [HS] - Flash Fire Debuff - Larodar",
			"5. Private Aura Holder 2 (singles) - Larodar",
			"5. Private Aura Holder 1 (singles) - Larodar",
			"5. Everlasting Blaze when boss casts - Larodar",
			"5. Flash Fire Heal Absorb - Larodar",
			"5. Simple Healer Glows",
			"5. Smart Healer Glows",
		},
		["uid"] = "M6avnyCLEZK",
	},
	{
		["id"] = "5. [HS] - Flash Fire Debuff - Larodar",
		["uid"] = "S3OTrDV2N4Z",
		["parent"] = "5. Singles - Larodar, Keeper of the Flame",
		["echoVersion"] = 7,
	},
	{
		["id"] = "5. Private Aura Holder 2 (singles) - Larodar",
		["uid"] = "NDZK4aHbPNK",
		["parent"] = "5. Singles - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. Private Aura Holder 1 (singles) - Larodar",
		["uid"] = "kMGKDQr8oM1",
		["parent"] = "5. Singles - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. Everlasting Blaze when boss casts - Larodar",
		["uid"] = "fNUKLle(lzh",
		["parent"] = "5. Singles - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "5. Singles - Larodar, Keeper of the Flame",
		["id"] = "5. Flash Fire Heal Absorb - Larodar",
		["children"] = {
			"5. Flash fire TIMER bar - Larodar",
			"5. Flash Fire ABSORB bar - Larodar",
		},
		["uid"] = "yugoP9iqATP",
	},
	{
		["id"] = "5. Flash fire TIMER bar - Larodar",
		["uid"] = "rDbZGkWrjJs",
		["parent"] = "5. Flash Fire Heal Absorb - Larodar",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. Flash Fire ABSORB bar - Larodar",
		["uid"] = "UnnZlFy)pkO",
		["parent"] = "5. Flash Fire Heal Absorb - Larodar",
		["echoVersion"] = 3,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "5. Singles - Larodar, Keeper of the Flame",
		["id"] = "5. Simple Healer Glows",
		["children"] = {
			"5. Blazing Coalescence Simple Glow",
		},
		["uid"] = "tL2v(3k)fjb",
	},
	{
		["id"] = "5. Blazing Coalescence Simple Glow",
		["uid"] = "QN3M170diZe",
		["parent"] = "5. Simple Healer Glows",
		["echoVersion"] = 0,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "5. Singles - Larodar, Keeper of the Flame",
		["id"] = "5. Smart Healer Glows",
		["children"] = {
			"5. Assign healers to absorbs - Larodar",
			"5. [GRIP] Raging inferno without Nature's Bulwark Simple Glow",
		},
		["uid"] = "ntSlorG1XDj",
	},
	{
		["id"] = "5. Assign healers to absorbs - Larodar",
		["uid"] = "gnMYJZEkLqq",
		["parent"] = "5. Smart Healer Glows",
		["echoVersion"] = 10,
	},
	{
		["id"] = "5. [GRIP] Raging inferno without Nature's Bulwark Simple Glow",
		["uid"] = "4gGIszIEapp",
		["parent"] = "5. Smart Healer Glows",
		["echoVersion"] = 0,
	},
	{
		["echoVersion"] = 2,
		["parent"] = "5. Larodar, Keeper of the Flame",
		["id"] = "5. Texts - Larodar, Keeper of the Flame",
		["children"] = {
			"5. CATCHER Assigner - Larodar",
			"5. Fireman Assigner - Larodar",
			"5. ROOTS HEALABLE - Larodar",
			"5. Intermission Soon - Larodar",
		},
		["uid"] = "g5yR9a4JeOB",
	},
	{
		["id"] = "5. CATCHER Assigner - Larodar",
		["uid"] = "BQfISTdpqFm",
		["parent"] = "5. Texts - Larodar, Keeper of the Flame",
		["echoVersion"] = 28,
	},
	{
		["id"] = "5. Fireman Assigner - Larodar",
		["uid"] = "H3B7QPKEgFa",
		["parent"] = "5. Texts - Larodar, Keeper of the Flame",
		["echoVersion"] = 25,
	},
	{
		["id"] = "5. ROOTS HEALABLE - Larodar",
		["uid"] = "EUmsAbfzLqZ",
		["parent"] = "5. Texts - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Intermission Soon - Larodar",
		["uid"] = "oXr9xSbnwgw",
		["parent"] = "5. Texts - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "5. Larodar, Keeper of the Flame",
		["id"] = "5. Bars - Larodar, Keeper of the Flame",
		["children"] = {
			"5. [BOMBS] - BOMB TIMER - Larodar, Keeper of the Flame",
			"5. [FRONTAL] - Smoldering Backdraft Cast - Larodar, Keeper of the Flame",
			"5. [INTERMISSION] - Consuming Flame Cast - Larodar, Keeper of the Flame",
			"5. [GET SAFE] - Raging Inferno Cast - Larodar, Keeper of the Flame",
			"5. [DODGE + ORBS] - Blazing Thorns Cast - Larodar, Keeper of the Flame",
			"5. [CHARGE] - Furious Charge Cast - Larodar, Keeper of the Flame",
			"5. [POOP] - Igniting Growth Debuff - Larodar, Keeper of the Flame",
			"5. [POOPING INC] - Igniting Growth Cast - Larodar, Keeper of the Flame",
			"5. [ROOTS] - Scorching Roots Cast - Larodar",
			"5. [SOAK] - Falling Embers Cast - Larodar",
			"5. [SOAKS INC] - Falling Embers Cast -  Larodar",
			"5. [TREANTS] - Fiery Force of Nature Cast - Larodar",
			"5. [TREANTS] - Ashen Call Cast - Larodar",
		},
		["uid"] = "NEg8usdAMr7",
	},
	{
		["id"] = "5. [BOMBS] - BOMB TIMER - Larodar, Keeper of the Flame",
		["uid"] = "l5axeBTNbut",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. [FRONTAL] - Smoldering Backdraft Cast - Larodar, Keeper of the Flame",
		["uid"] = "AYziMtzTz3A",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. [INTERMISSION] - Consuming Flame Cast - Larodar, Keeper of the Flame",
		["uid"] = "hrgJV4MaaQT",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. [GET SAFE] - Raging Inferno Cast - Larodar, Keeper of the Flame",
		["uid"] = "I6avirGoOKC",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 4,
	},
	{
		["id"] = "5. [DODGE + ORBS] - Blazing Thorns Cast - Larodar, Keeper of the Flame",
		["uid"] = "UNbe(Cbc2cv",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. [CHARGE] - Furious Charge Cast - Larodar, Keeper of the Flame",
		["uid"] = "bpN4AoLIi(K",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. [POOP] - Igniting Growth Debuff - Larodar, Keeper of the Flame",
		["uid"] = "kHUf3DRs(u3",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. [POOPING INC] - Igniting Growth Cast - Larodar, Keeper of the Flame",
		["uid"] = "jRnQ5LhZKKg",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. [ROOTS] - Scorching Roots Cast - Larodar",
		["uid"] = "dt8FLxGub3z",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. [SOAK] - Falling Embers Cast - Larodar",
		["uid"] = "1aAzGYO5oPB",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. [SOAKS INC] - Falling Embers Cast -  Larodar",
		["uid"] = "TXRN5x11sTa",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. [TREANTS] - Fiery Force of Nature Cast - Larodar",
		["uid"] = "MZfmfsXzYIY",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. [TREANTS] - Ashen Call Cast - Larodar",
		["uid"] = "LF1LlKsMos3",
		["parent"] = "5. Bars - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "5. Larodar, Keeper of the Flame",
		["id"] = "5. Icons (low) - Larodar, Keeper of the Flame",
		["children"] = {
			"5. [STACKS] - Ashen Asphyxiation  Debuff - Larodar, Keeper of the Flame",
			"5. [250%] - Everlasting Blaze Debuff - Larodar, Keeper of the Flame",
			"5. [DOT] - Searing Ash Debuff - Larodar, Keeper of the Flame",
			"5. [CAN'T CLICK] - Dream Fatigue Debuff - Larodar, Keeper of the Flame",
			"5. [MOVE] - Burning Ground Debuff - Larodar, Keeper of the Flame",
			"5. [DOT] - Blistering Splinters Debuff - Larodar, Keeper of the Flame",
			"5. [BUFF] - Blazing Coalescence Debuff - Larodar, Keeper of the Flame",
			"5. [SAFE] - Nature's Bulwark  Debuff - Larodar, Keeper of the Flame",
			"5. [STUN] - Encased in Ash Debuff -  Larodar, Keeper of the Flame",
		},
		["uid"] = "oNzAd1PBkiO",
	},
	{
		["id"] = "5. [STACKS] - Ashen Asphyxiation  Debuff - Larodar, Keeper of the Flame",
		["uid"] = "6K9shVSJ6lo",
		["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [250%] - Everlasting Blaze Debuff - Larodar, Keeper of the Flame",
		["uid"] = "pkHDiAw6Lcj",
		["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [DOT] - Searing Ash Debuff - Larodar, Keeper of the Flame",
		["uid"] = "uP9f8SJOf9i",
		["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [CAN'T CLICK] - Dream Fatigue Debuff - Larodar, Keeper of the Flame",
		["uid"] = "Ab7O(WkmjAW",
		["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [MOVE] - Burning Ground Debuff - Larodar, Keeper of the Flame",
		["uid"] = "Wa0Oe5jrPNx",
		["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [DOT] - Blistering Splinters Debuff - Larodar, Keeper of the Flame",
		["uid"] = "ImgdH8ws6gw",
		["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [BUFF] - Blazing Coalescence Debuff - Larodar, Keeper of the Flame",
		["uid"] = "t9He3(wJclt",
		["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [SAFE] - Nature's Bulwark  Debuff - Larodar, Keeper of the Flame",
		["uid"] = "wS8GRTTaOg5",
		["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [STUN] - Encased in Ash Debuff -  Larodar, Keeper of the Flame",
		["uid"] = "9jkLbnC8dNN",
		["parent"] = "5. Icons (low) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "5. Larodar, Keeper of the Flame",
		["id"] = "5. Icons (high) - Larodar, Keeper of the Flame",
		["children"] = {
			"5. [250%] - Everlasting Blaze Debuff (2 stracks) - Larodar, Keeper of the Flame",
			"5. [LEECH] - Smoldering Suffocation Debuff - Larodar, Keeper of the Flame",
			"5. [HEAL ABSORB] - Flash Fire Debuff - Larodar, Keeper of the Flame",
			"5. [TANK] - Nature's Fury  Debuff - Tank - Larodar, Keeper of the Flame",
			"5. [ROOT] - Scorching Bramblethorn  Debuff - Larodar, Keeper of the Flame",
			"5. [BOMB] - Ashen Devastation Debuff - Larodar, Keeper of the Flame",
			"5. [FIXATE] - Scorching Pursuit Debuff - Larodar, Keeper of the Flame",
			"5. [FIREMAN] - Dream Blossom Debuff - Larodar, Keeper of the Flame",
			"5. [POOPIN] - Igniting Growth Debuff - Larodar, Keeper of the Flame",
		},
		["uid"] = "tVuZmaAqWSp",
	},
	{
		["id"] = "5. [250%] - Everlasting Blaze Debuff (2 stracks) - Larodar, Keeper of the Flame",
		["uid"] = "4OZAmsl9Gpk",
		["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [LEECH] - Smoldering Suffocation Debuff - Larodar, Keeper of the Flame",
		["uid"] = "oxA1YKro8XC",
		["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [HEAL ABSORB] - Flash Fire Debuff - Larodar, Keeper of the Flame",
		["uid"] = "6w9Hf5KcGj0",
		["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [TANK] - Nature's Fury  Debuff - Tank - Larodar, Keeper of the Flame",
		["uid"] = "0Vys7drnAPT",
		["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [ROOT] - Scorching Bramblethorn  Debuff - Larodar, Keeper of the Flame",
		["uid"] = "x2S3v29pobj",
		["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [BOMB] - Ashen Devastation Debuff - Larodar, Keeper of the Flame",
		["uid"] = "jHxA48YNmDp",
		["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [FIXATE] - Scorching Pursuit Debuff - Larodar, Keeper of the Flame",
		["uid"] = "tNwhq3AlVbI",
		["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. [FIREMAN] - Dream Blossom Debuff - Larodar, Keeper of the Flame",
		["uid"] = "0utt)ayd8bj",
		["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "5. [POOPIN] - Igniting Growth Debuff - Larodar, Keeper of the Flame",
		["uid"] = "4UUR1RTGeiO",
		["parent"] = "5. Icons (high) - Larodar, Keeper of the Flame",
		["echoVersion"] = 1,
	},
},1207,0);

--fixUpNestedPreview(5,1207,"5. Larodar, Keeper of the Flame");