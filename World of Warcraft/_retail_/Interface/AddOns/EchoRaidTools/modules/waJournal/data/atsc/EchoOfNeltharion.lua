local _AddonName, _EchoRaidTools = ...;

local journal = _EchoRaidTools:GetModule("waJournal");

-- 8. export data

journal:AddImportData({["8. Sunder Shadow Cast [GHOST - %1.unitName] - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["do_custom"] = false,},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.3843137254902,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["zoneIds"] = "",["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["use_role"] = true,["encounterid"] = "2684",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "237531",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Echo of Neltharion",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["displayTextLeft"] = "%n",["uid"] = "oE34JANABMC",["customTextUpdate"] = "update",["height"] = 23,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 407790,["auranames"] = {},["duration"] = "3",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = true,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["subeventSuffix"] = "_CAST_START",["use_tooltip"] = false,["ignoreSelf"] = true,["use_unit"] = true,["spellName"] = 0,["names"] = {"Sacred Blade",},["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["use_absorbHealMode"] = true,["type"] = "unit",["useName"] = false,["unevent"] = "auto",["matchesShowOn"] = "showOnActive",["buffShowOn"] = "showOnActive",["unit"] = "boss",["auraspellids"] = {"399713",},["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["use_exact_spellId"] = false,["custom_hide"] = "timed",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["icon"] = true,["internalVersion"] = 65,["rotateText"] = "NONE",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["easeStrength"] = 3,["rotate"] = 0,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["anchorFrameType"] = "SCREEN",["stickyDuration"] = false,["auto"] = true,["stacksFlags"] = "None",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "GHOST - %1.unitName",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["anchorXOffset"] = 0,["anchorYOffset"] = 0,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},},["timer"] = true,["timerFlags"] = "None",["id"] = "8. Sunder Shadow Cast [GHOST - %1.unitName] - Echo of Neltharion",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["borderInset"] = 11,["source"] = "import",["timerSize"] = 12,["semver"] = "1.0.5",["customText"] = "function()\
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
",["border"] = false,["borderEdge"] = "None",["sparkWidth"] = 3,["borderSize"] = 16,["borderInFront"] = false,["icon_side"] = "LEFT",["backgroundColor"] = {0,0,0,0.52000001072884,},["borderOffset"] = 5,["sparkHeight"] = 14,["zoom"] = 0,["borderBackdrop"] = "Blizzard Tooltip",["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["xOffset"] = 0,["sparkHidden"] = "NEVER",["useAdjustededMax"] = false,["frameStrata"] = 1,["width"] = 240,["sparkRotation"] = 0,["sparkRotationMode"] = "AUTO",["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["config"] = {},},["8. Shatter (low stacks) - Echo of Neltharion"] = {["iconSource"] = -1,["parent"] = "8. Icons - Low Priority - Echo of Neltharion",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"407329",},["duration"] = "3",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["use_absorbHealMode"] = true,["custom_hide"] = "timed",["useStacks"] = false,["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["matchesShowOn"] = "showOnActive",["stacks"] = "3",["ignoreSelf"] = true,["names"] = {"Sacred Blade",},["spellIds"] = {283573,},["useExactSpellId"] = false,["stacksOperator"] = "<=",["buffShowOn"] = "showOnActive",["useName"] = true,["type"] = "aura2",["use_tooltip"] = false,["auraspellids"] = {},["unevent"] = "auto",["use_unit"] = true,["debuffType"] = "HARMFUL",["subeventPrefix"] = "SPELL",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_genericShowOn"] = true,["remOperator"] = "<",["spellName"] = 0,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = false,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_text_format_1.toltip1_format"] = "none",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_anchorXOffset"] = 7,},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2684",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["source"] = "import",["icon"] = true,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["xOffset"] = 0,["uid"] = "aZql1E4aD(b",["zoom"] = 0,["width"] = 55,["alpha"] = 1,["auto"] = true,["cooldownTextDisabled"] = false,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "8. Shatter (low stacks) - Echo of Neltharion",["url"] = "https://echoesports.gg",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["config"] = {},["inverse"] = false,["authorOptions"] = {},["stickyDuration"] = false,["displayIcon"] = 3528301,["cooldown"] = true,["selfPoint"] = "CENTER",},["8. Rushing Shadows Cast [WALL BREAKERS] - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.22352942824364,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["class"] = {["multi"] = {},},["encounterid"] = "2684",["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "4914668",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Echo of Neltharion",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["config"] = {},["spark"] = false,["sparkRotationMode"] = "AUTO",["height"] = 23,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 407207,["auranames"] = {"364963","Core Overload",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["useExactSpellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["use_absorbHealMode"] = true,["use_tooltip"] = false,["ignoreSelf"] = true,["custom_type"] = "event",["use_unit"] = true,["use_genericShowOn"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["duration"] = "10",["type"] = "unit",["debuffType"] = "HARMFUL",["auraspellids"] = {},["unevent"] = "auto",["names"] = {"Sacred Blade",},["useName"] = true,["use_exact_spellId"] = false,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["unit"] = "boss",["remOperator"] = "<",["spellName"] = 0,["custom_hide"] = "timed",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = -10,},["rotateText"] = "NONE",["internalVersion"] = 65,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["easeStrength"] = 3,["rotate"] = 0,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["width"] = 240,["stickyDuration"] = false,["adjustedMax"] = "4",["xOffset"] = 0,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "WALL BREAKERS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["stacksFont"] = "Friz Quadrata TT",["source"] = "import",["timerSize"] = 12,["textSize"] = 12,["backgroundColor"] = {0,0,0,0.52000001072884,},["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["semver"] = "1.0.5",["icon_side"] = "LEFT",["zoom"] = 0,["borderBackdrop"] = "Blizzard Tooltip",["sparkHeight"] = 14,["borderOffset"] = 5,["sparkWidth"] = 3,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["id"] = "8. Rushing Shadows Cast [WALL BREAKERS] - Echo of Neltharion",["borderColor"] = {1,1,1,0.5,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["adjustedMin"] = "4",["icon"] = true,["inverse"] = false,["uid"] = "cyqDHdutbz8",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["borderInset"] = 11,},["8. Surerendering to Corruption [CORRUPTION\nINC] - Echo of Neltharion"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"405484",},["duration"] = "3",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["useExactSpellId"] = false,["use_unit"] = true,["matchesShowOn"] = "showOnActive",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["group_countOperator"] = ">",["type"] = "aura2",["use_debuffClass"] = false,["unevent"] = "auto",["names"] = {"Sacred Blade",},["debuffType"] = "HARMFUL",["useName"] = true,["auraspellids"] = {"410972","401010",},["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["unit"] = "player",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "CORRUPTION\\nINC",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_1.tolltip1_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip1_format"] = "none",["anchorXOffset"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_1.ttoltip1_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_s_format"] = "none",},{["glowFrequency"] = 0.25,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2684",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["cooldownEdge"] = false,["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["authorOptions"] = {},["selfPoint"] = "CENTER",["config"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["auto"] = true,["cooldownTextDisabled"] = false,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "8. Surerendering to Corruption [CORRUPTION\\nINC] - Echo of Neltharion",["zoom"] = 0,["useCooldownModRate"] = true,["width"] = 55,["icon"] = true,["uid"] = "ubs38YDlkDM",["inverse"] = false,["color"] = {1,1,1,1,},["parent"] = "8. Icons - High Priority - Echo of Neltharion",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["desaturate"] = false,},["8. Bars - Echo of Neltharion"] = {["arcLength"] = 360,["controlledChildren"] = {"8. Echoing Fissure Cast [FISSURE %2.count] - Echo of Neltharion","8. Rushing Shadows Cast [WALL BREAKERS] - Echo of Neltharion","8. Twisted Earth Cast [WALLS INC] - Echo of Neltharion","8. Surrender to Corruption Cast [DMG] - Echo of Neltharion","8. Umbral Annihilation Cast [BIG BOOM %c] - Echo of Neltharion","8. Sunder Shadow Cast [GHOST - %1.unitName] - Echo of Neltharion","8. Shadow Strike Cast [BREAKING] - Echo of Neltharion","8. Ebon Destruction Cast [GET SAFE] - Echo of Neltharion","8. Calamitous Strike Cast [KNOCK] - Echo of Neltharion","8. Sunder Reality Cast [PORTALS INC] - Echo of Neltharion","8. Volcanic Heart Duration - Echo of Neltharion",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["fullCircle"] = true,["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 65,["useLimit"] = false,["align"] = "CENTER",["stagger"] = 0,["radius"] = 200,["subRegions"] = {},["rotation"] = 0,["sortHybridTable"] = {["8. Sunder Reality Cast [PORTALS INC] - Echo of Neltharion"] = false,["8. Sunder Shadow Cast [GHOST - %1.unitName] - Echo of Neltharion"] = false,["8. Calamitous Strike Cast [KNOCK] - Echo of Neltharion"] = false,["8. Echoing Fissure Cast [FISSURE %2.count] - Echo of Neltharion"] = false,["8. Surrender to Corruption Cast [DMG] - Echo of Neltharion"] = false,["8. Umbral Annihilation Cast [BIG BOOM %c] - Echo of Neltharion"] = false,["8. Rushing Shadows Cast [WALL BREAKERS] - Echo of Neltharion"] = false,["8. Twisted Earth Cast [WALLS INC] - Echo of Neltharion"] = false,["8. Volcanic Heart Duration - Echo of Neltharion"] = false,["8. Shadow Strike Cast [BREAKING] - Echo of Neltharion"] = false,["8. Ebon Destruction Cast [GET SAFE] - Echo of Neltharion"] = false,},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["animate"] = false,["backdropColor"] = {1,1,1,0.5,},["sort"] = "none",["source"] = "import",["config"] = {},["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["xOffset"] = 0,["parent"] = "8. Echo of Neltharion",["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["rowSpace"] = 1,["borderOffset"] = 4,["anchorFrameFrame"] = "WeakAuras:Bars - Anchor",["tocversion"] = 100100,["id"] = "8. Bars - Echo of Neltharion",["uid"] = "UYL)EodOWUT",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["grow"] = "UP",["borderInset"] = 1,["gridType"] = "RD",["borderColor"] = {0,0,0,1,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["conditions"] = {},["information"] = {},["selfPoint"] = "BOTTOM",},["8. Private Aura Bar - Neltharion [PUBLIC]"] = {["sparkWidth"] = 10,["iconSource"] = -1,["authorOptions"] = {{["type"] = "range",["useDesc"] = false,["max"] = 40,["step"] = 1,["width"] = 1,["min"] = 10,["name"] = "Icon Size",["default"] = 20,["key"] = "iconSize",},{["type"] = "space",["variableWidth"] = true,["height"] = 1,["useHeight"] = false,["width"] = 1,},{["type"] = "toggle",["useDesc"] = false,["default"] = false,["name"] = "Show Stacked Melee",["key"] = "showMelee",["width"] = 1,},{["type"] = "space",["variableWidth"] = true,["height"] = 1,["width"] = 1,["useHeight"] = false,},{["type"] = "toggle",["key"] = "useLimit",["useDesc"] = false,["name"] = "Use Group Limit",["default"] = false,["width"] = 1,},{["type"] = "range",["useDesc"] = false,["max"] = 30,["step"] = 1,["width"] = 1,["min"] = 1,["name"] = "Group Size Limit",["key"] = "limit",["default"] = 5,},},["displayText_format_p_time_dynamic_threshold"] = 60,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["displayText_format_n_abbreviate_max"] = 8,["sparkRotation"] = 0,["actions"] = {["start"] = {["do_message"] = false,["do_custom"] = true,["custom"] = "if aura_env.state.unit then\
    local anchorID = aura_env.region.anchorID\
    if anchorID then\
        C_UnitAuras.RemovePrivateAuraAnchor(anchorID)\
    end\
    \
    local self = aura_env.region\
    local privateAnchorArgs = {\
        unitToken = aura_env.state.unit,\
        auraIndex = 1,\
        parent = self,\
        showCountdownFrame = true,\
        showCountdownNumbers = true,\
        iconInfo = {\
            iconAnchor = {\
                point = \"RIGHT\",\
                relativeTo = self,\
                relativePoint = \"RIGHT\",\
                offsetX = 0,\
                offsetY = 0\
            },\
            iconWidth = aura_env.config.iconSize,\
            iconHeight = aura_env.config.iconSize,\
        },\
        durationAnchor = {\
            point = \"LEFT\",\
            relativeTo = self,\
            relativePoint = \"RIGHT\",\
            offsetX = 2,\
            offsetY = 0,\
        }\
    }\
    \
    aura_env.region.anchorID = C_UnitAuras.AddPrivateAuraAnchor(privateAnchorArgs)\
end\
\
\
",},["finish"] = {["do_custom"] = true,["custom"] = "local anchorID = aura_env.region.anchorID\
if anchorID then\
    C_UnitAuras.RemovePrivateAuraAnchor(anchorID)\
end",},["init"] = {["do_custom"] = true,["custom"] = "function aura_env.IsTank(unit)\
    local _, role = WeakAuras.SpecRolePositionForUnit(unit)\
    return role == \"TANK\"\
end\
\
function aura_env.IsMelee(unit)\
    local _, _, position = WeakAuras.SpecRolePositionForUnit(unit)\
    return position == \"MELEE\"\
end",},},["displayText_format_p_time_mod_rate"] = true,["enableGradient"] = false,["wordWrap"] = "WordWrap",["barColor"] = {0,0,0,0.58421608805656,},["desaturate"] = false,["font"] = "Friz Quadrata TT",["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_ingroup"] = false,["ingroup"] = {["multi"] = {["raid"] = true,},},["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2684",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["shadowXOffset"] = 1,["useAdjustededMin"] = false,["regionType"] = "aurabar",["texture"] = "Minimalist",["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["spark"] = false,["tocversion"] = 100100,["alpha"] = 1,["uid"] = "0lLddOjlQQY",["fixedWidth"] = 200,["outline"] = "OUTLINE",["sparkOffsetX"] = 0,["displayText_format_n_color"] = "class",["parent"] = "8. Private Aura Scripe List - Neltharion [PUBLIC]",["shadowYOffset"] = -1,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["triggers"] = {[1] = {["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "custom",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_absorbMode"] = true,["event"] = "Unit Characteristics",["names"] = {},["spellIds"] = {},["custom"] = "function(allstates, event, ...)\
    for _, state in pairs(allstates) do\
        state.show = false\
        state.changed = true\
    end\
    if not IsInRaid() then return end\
    for unit in WA_IterateGroupMembers() do\
        local raidIndex = UnitInRaid(unit)\
        local subGroup = select(3, GetRaidRosterInfo(raidIndex))\
        local raidUnitToken = \"raid\" .. tostring(raidIndex)\
        \
        local isTank = aura_env.IsTank(unit)\
        local isMelee = aura_env.IsMelee(unit)\
        local isPriest = select(2, UnitClass(unit)) == \"PRIEST\"\
        local difficulty = GetRaidDifficultyID()\
        local numGroups = difficulty == 16 and 4 or 6\
        local meleeChar = isMelee or isTank\
        \
        local index = UnitInRaid(unit) + (meleeChar and 30 or 0)\
        \
        if subGroup <= numGroups then\
            allstates[unit] = {\
                show = aura_env.config.showMelee or (not meleeChar),\
                changed = true,\
                progressType = \"static\",\
                value = 0,\
                total = 1,\
                name = unit,\
                unit = raidUnitToken,\
                unitIsPlayer = UnitIsUnit(unit, \"player\"),\
                index = index,\
                isMelee = meleeChar\
            }\
        else\
            allstates[unit] = {\
                show = false,\
                changed = true,\
            }\
        end\
    end\
    if aura_env.config.showMelee then\
        \
        allstates[\"meleeCover\"] = {\
            show = true,\
            changed = true,\
            progressType = \"static\",\
            value = 1,\
            total = 1,\
            label = \"MELEE\",\
            index = math.huge,\
        }\
    end\
    \
    return true\
end",["events"] = "ENCOUNTER_START",["custom_type"] = "stateupdate",["check"] = "event",["unit"] = "group",["use_unit"] = true,["customVariables"] = "{\
    unitIsPlayer = \"bool\",\
    isMelee = \"bool\",\
}",},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["preferToUpdate"] = false,["subRegions"] = {{["type"] = "subforeground",},{["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text"] = "%n",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_n_color"] = "class",["type"] = "subtext",["text_text_format_n_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorXOffset"] = -20,["text_shadowYOffset"] = -1,["text_text_format_n_abbreviate_max"] = 8,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_text_format_n_format"] = "Unit",["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_n_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%label",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_label_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_n_color"] = "class",["type"] = "subtext",["text_text_format_n_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_text_format_n_abbreviate_max"] = 8,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_CENTER",["text_visible"] = true,["text_text_format_n_format"] = "Unit",["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_n_abbreviate"] = true,},{["type"] = "subborder",["border_anchor"] = "bar",["border_offset"] = 0,["border_color"] = {1,1,1,1,},["border_visible"] = false,["border_edge"] = "Square Full White",["border_size"] = 1,},},["height"] = 20,["barColor2"] = {1,1,0,1,},["internalVersion"] = 65,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["fontSize"] = 17,["displayText_format_n_realm_name"] = "never",["displayText_format_n_format"] = "Unit",["orientation"] = "HORIZONTAL",["zoom"] = 0,["source"] = "import",["sparkColor"] = {1,1,1,1,},["selfPoint"] = "BOTTOM",["width"] = 100,["icon"] = false,["icon_side"] = "RIGHT",["backgroundColor"] = {0,0,0,0.5,},["sparkHidden"] = "NEVER",["displayText_format_p_time_precision"] = 1,["sparkHeight"] = 30,["displayText"] = "%n",["xOffset"] = 0,["justify"] = "LEFT",["displayText_format_p_time_format"] = 0,["id"] = "8. Private Aura Bar - Neltharion [PUBLIC]",["sparkRotationMode"] = "AUTO",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["icon_color"] = {1,1,1,1,},["config"] = {["iconSize"] = 20,["showMelee"] = true,["limit"] = 7,["useLimit"] = false,},["inverse"] = false,["displayText_format_n_abbreviate"] = false,["shadowColor"] = {0,0,0,1,},["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "unitIsPlayer",["value"] = 1,},["changes"] = {{["value"] = true,["property"] = "sub.5.border_visible",},},},{["check"] = {["trigger"] = 1,["variable"] = "isMelee",["value"] = 1,},["changes"] = {{["property"] = "sub.3.text_visible",},},},},["information"] = {},["color"] = {1,1,1,1,},},["8. Collapsed Earth [STUN] - Echo of Neltharion"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"Collapsed Earth","402120",},["use_genericShowOn"] = true,["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_hide"] = "timed",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["use_debuffClass"] = false,["use_unit"] = true,["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["names"] = {"Sacred Blade",},["type"] = "aura2",["useName"] = true,["unevent"] = "auto",["matchesShowOn"] = "showOnActive",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "3",["remOperator"] = "<",["useExactSpellId"] = false,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "STUN",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip2_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.toltip1_format"] = "none",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_visible"] = true,["text_anchorYOffset"] = -6,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2684",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["source"] = "import",["parent"] = "8. Icons - High Priority - Echo of Neltharion",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["url"] = "https://echoesports.gg",["selfPoint"] = "CENTER",["uid"] = "kcthP(oH622",["alpha"] = 1,["width"] = 55,["useCooldownModRate"] = true,["semver"] = "1.0.4",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "8. Collapsed Earth [STUN] - Echo of Neltharion",["zoom"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["icon"] = true,["config"] = {},["inverse"] = false,["color"] = {1,1,1,1,},["authorOptions"] = {},["displayIcon"] = 3528301,["cooldown"] = true,["stickyDuration"] = false,},["8. Calamitous Strike Cast [KNOCK] - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.9764706492424,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["use_role"] = true,["class"] = {["multi"] = {},},["encounterid"] = "2684",["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "252222",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Echo of Neltharion",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "h587sSw0LVe",["displayTextLeft"] = "%n",["borderInset"] = 11,["customTextUpdate"] = "update",["height"] = 23,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 401022,["auranames"] = {"364963","Core Overload",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["use_absorbMode"] = true,["use_tooltip"] = false,["ignoreSelf"] = true,["use_debuffClass"] = false,["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["spellName"] = 0,["useName"] = true,["type"] = "unit",["auraspellids"] = {},["debuffType"] = "HARMFUL",["custom_hide"] = "timed",["unit"] = "boss",["unevent"] = "auto",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["duration"] = "10",["remOperator"] = "<",["names"] = {"Sacred Blade",},["useExactSpellId"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = -10,},["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["internalVersion"] = 65,["rotateText"] = "NONE",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["easeStrength"] = 3,["rotate"] = 0,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["width"] = 240,["stickyDuration"] = false,["auto"] = true,["adjustedMax"] = "4",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "KNOCK",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_offset"] = 0,["type"] = "subborder",["border_anchor"] = "bar",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["source"] = "import",["semver"] = "1.0.5",["authorOptions"] = {},["borderOffset"] = 5,["border"] = false,["borderEdge"] = "None",["sparkWidth"] = 3,["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["zoom"] = 0,["borderBackdrop"] = "Blizzard Tooltip",["sparkHeight"] = 14,["backgroundColor"] = {0,0,0,0.52000001072884,},["timerSize"] = 12,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["adjustedMin"] = "4",["id"] = "8. Calamitous Strike Cast [KNOCK] - Echo of Neltharion",["useAdjustededMax"] = false,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["sparkRotationMode"] = "AUTO",["inverse"] = false,["sparkColor"] = {1,1,1,1,},["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["color"] = {},},["8. Singles - Echo of Neltharion"] = {["controlledChildren"] = {"8. Private Aura Scripe List - Neltharion [PUBLIC]","8. Blue Breaker - Neltharion","8. Scripe Group (anchored)","8. Texts (anchored) - Echo of Neltharion","8. Private Auras - Neltharion","Nelth Heart Positions",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["internalVersion"] = 65,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["anchorFrameFrame"] = "WeakAuras:Singles - Anchor",["regionType"] = "group",["borderSize"] = 2,["anchorFrameParent"] = false,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "8. Singles - Echo of Neltharion",["parent"] = "8. Echo of Neltharion",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "LUtW0JsUK12",["borderInset"] = 1,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {},["conditions"] = {},["information"] = {},["borderEdge"] = "Square Full White",},["8. Private Aura - Neltharion"] = {["iconSource"] = -1,["wagoID"] = "n3lAhBYxn",["authorOptions"] = {{["type"] = "input",["useDesc"] = false,["width"] = 1,["key"] = "unit",["multiline"] = false,["default"] = "player",["length"] = 10,["name"] = "Unit",["useLength"] = false,},{["type"] = "range",["useDesc"] = false,["max"] = 16,["step"] = 1,["width"] = 1,["min"] = 1,["key"] = "auras",["name"] = "#auras",["default"] = 4,},},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["url"] = "https://echoesports.gg/weakauras",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["custom_type"] = "stateupdate",["type"] = "custom",["use_alwaystrue"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_absorbMode"] = true,["event"] = "Conditions",["unit"] = "player",["use_absorbHealMode"] = true,["custom"] = "function(a)\
    for k, v in pairs(a) do\
        v.show = false\
        v.changed = true\
    end\
    for i = 1, aura_env.config.auras do\
        a[i] = {\
            show = true,\
            changed = true,\
            index = i\
        } \
    end\
    return true\
end",["spellIds"] = {},["events"] = "",["check"] = "event",["names"] = {},["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text"] = "%index",["text_text_format_p_format"] = "timed",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_format"] = 0,["anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_p_time_precision"] = 1,["text_shadowYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorYOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_fontSize"] = 72,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},},["height"] = 80,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2684",["size"] = {["multi"] = {},},},["source"] = "import",["regionType"] = "icon",["actions"] = {["start"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
if anchorID then\
    C_UnitAuras.RemovePrivateAuraAnchor(anchorID)\
end\
\
local self = aura_env.region\
local privateAnchorArgs = {\
    unitToken = aura_env.config.unit,\
    auraIndex = aura_env.state.index,\
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
aura_env.region.anchorID = C_UnitAuras.AddPrivateAuraAnchor(privateAnchorArgs)\
print(aura_env.region.anchorID)",["do_custom"] = true,},["init"] = {["do_custom"] = false,},["finish"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
if anchorID then\
    C_UnitAuras.RemovePrivateAuraAnchor(anchorID)\
end",["do_custom"] = true,},},["cooldown"] = false,["cooldownEdge"] = false,["xOffset"] = 0,["color"] = {1,1,1,1,},["uid"] = "UBeA0G3kOLT",["useCooldownModRate"] = true,["zoom"] = 0,["semver"] = "1.0.5",["tocversion"] = 100100,["id"] = "8. Private Aura - Neltharion",["anchorFrameType"] = "SCREEN",["alpha"] = 1,["width"] = 80,["frameStrata"] = 1,["config"] = {["unit"] = "player",["auras"] = 4,},["inverse"] = false,["cooldownTextDisabled"] = true,["parent"] = "8. Private Auras - Neltharion",["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "customcheck",["value"] = "function()\
    return not WeakAuras.IsOptionsOpen()\
end",},["changes"] = {{["value"] = {1,1,1,0,},["property"] = "color",},{["property"] = "sub.2.text_visible",},},},},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["8. Add Shield Down - Echo of Neltharion"] = {["outline"] = "OUTLINE",["authorOptions"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["do_sound"] = false,},["init"] = {},["finish"] = {},},["displayText_format_1.p_time_format"] = 0,["displayText_format_p_format"] = "timed",["internalVersion"] = 65,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["font"] = "Expressway MonoNum",["displayText_format_1.p_time_precision"] = 1,["displayText_format_1.p_format"] = "timed",["load"] = {["use_encounterid"] = true,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2684",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["preferToUpdate"] = false,["fontSize"] = 20,["source"] = "import",["xOffset"] = 0,["shadowXOffset"] = 1,["displayText_format_1.p_time_mod_rate"] = true,["fixedWidth"] = 200,["displayText_format_p_time_legacy_floor"] = false,["regionType"] = "text",["displayText_format_1.p_time_legacy_floor"] = false,["triggers"] = {[1] = {["trigger"] = {["type"] = "combatlog",["spellId"] = "407036",["subeventSuffix"] = "_AURA_REMOVED",["duration"] = "4",["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["use_absorbHealMode"] = true,["use_spellId"] = true,["spellIds"] = {},["use_unit"] = true,["names"] = {},["unit"] = "boss",["use_absorbMode"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "all",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["uid"] = "7VhAsiXuczU",["displayText"] = "KILL ADD NOW",["displayText_format_p_time_precision"] = 1,["displayText_format_1.p_time_dynamic_threshold"] = 60,["automaticWidth"] = "Auto",["yOffset"] = 0,["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "8. Add Shield Down - Echo of Neltharion",["wordWrap"] = "WordWrap",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "8. Texts (anchored) - Echo of Neltharion",["config"] = {},["color"] = {1,1,1,1,},["selfPoint"] = "CENTER",["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},},["8. Corruption List - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = true,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.019607843831182,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2684",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = 3528301,["textColor"] = {1,1,1,1,},["preferToUpdate"] = false,["borderBackdrop"] = "Blizzard Tooltip",["barColor2"] = {0.43529415130615,0.18823531270027,1,1,},["color"] = {},["uid"] = "j7TSZFh((NO",["customText"] = "function()\
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
",["sparkOffsetX"] = 0,["borderOffset"] = 5,["cooldown"] = true,["cooldownSwipe"] = true,["textSize"] = 12,["customTextUpdate"] = "update",["cooldownEdge"] = false,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"Corruption","401010",},["duration"] = "3",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = true,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["useExactSpellId"] = true,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["use_absorbHealMode"] = true,["use_tooltip"] = false,["ignoreSelf"] = false,["custom_hide"] = "timed",["names"] = {"Sacred Blade",},["use_genericShowOn"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["type"] = "aura2",["unit"] = "group",["unevent"] = "auto",["matchesShowOn"] = "showOnActive",["useName"] = false,["auraspellids"] = {"410972","401010",},["spellName"] = 0,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_unit"] = true,["remOperator"] = "<",["custom_type"] = "event",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["spark"] = false,["internalVersion"] = 65,["width"] = 200,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["useCooldownModRate"] = true,["stickyDuration"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["sparkHidden"] = "NEVER",["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_text"] = "",["type"] = "subborder",["border_anchor"] = "bar",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["type"] = "subtext",["anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_time_format"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 14,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%1.unitName",["text_text_format_1.unitName_color"] = "class",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_text_format_1.unitName_abbreviate"] = false,["rotateText"] = "NONE",["type"] = "subtext",["text_text_format_1.unitName_abbreviate_max"] = 8,["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_1.unitName_format"] = "Unit",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_affected_format"] = "none",["text_fontSize"] = 16,["anchorXOffset"] = 0,["text_justify"] = "CENTER",},},["timer"] = true,["timerFlags"] = "None",["sparkWidth"] = 3,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["displayTextRight"] = "%p",["source"] = "import",["timerSize"] = 12,["borderColor"] = {1,1,1,0.5,},["backgroundColor"] = {0,0,0,0.3433730006218,},["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["parent"] = "8. Scripe List - Echo of Neltharion",["icon_side"] = "LEFT",["sparkColor"] = {1,1,1,1,},["useAdjustededMax"] = false,["sparkHeight"] = 14,["sparkRotationMode"] = "AUTO",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.4",["authorOptions"] = {},["id"] = "8. Corruption List - Echo of Neltharion",["stacksFont"] = "Friz Quadrata TT",["frameStrata"] = 4,["anchorFrameType"] = "SCREEN",["url"] = "https://echoesports.gg",["height"] = 20,["inverse"] = false,["zoom"] = 0,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["config"] = {},},["8. Ebon Destruction [DOT] - Echo of Neltharion"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"407917",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["group_countOperator"] = ">",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["use_unit"] = true,["useExactSpellId"] = false,["names"] = {"Sacred Blade",},["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["use_debuffClass"] = false,["type"] = "aura2",["useName"] = true,["unevent"] = "auto",["unit"] = "player",["buffShowOn"] = "showOnActive",["auraspellids"] = {},["duration"] = "3",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["subeventSuffix"] = "_CAST_START",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_1.tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip1_format"] = "none",["anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_visible"] = true,["text_text_format_1.toltip1_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_anchorXOffset"] = 7,},{["glowFrequency"] = 0.15,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2684",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["url"] = "https://echoesports.gg",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["selfPoint"] = "CENTER",["config"] = {},["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["semver"] = "1.0.4",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "8. Ebon Destruction [DOT] - Echo of Neltharion",["zoom"] = 0,["alpha"] = 1,["width"] = 55,["stickyDuration"] = false,["uid"] = "tnjpYshLAkQ",["inverse"] = false,["xOffset"] = 0,["parent"] = "8. Icons - Low Priority - Echo of Neltharion",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["authorOptions"] = {},},["8. Calamitous Strike - Echo of Neltharion"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"Calamitous Strike","401998",},["use_genericShowOn"] = true,["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_hide"] = "timed",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["use_debuffClass"] = false,["names"] = {"Sacred Blade",},["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["subeventPrefix"] = "SPELL",["type"] = "aura2",["useName"] = true,["unevent"] = "auto",["matchesShowOn"] = "showOnActive",["use_unit"] = true,["debuffType"] = "HARMFUL",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "3",["remOperator"] = "<",["useExactSpellId"] = false,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = false,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "+%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.ttoltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.toltip1_format"] = "none",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_visible"] = true,["text_anchorYOffset"] = -6,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2684",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "8. Icons - High Priority - Echo of Neltharion",["xOffset"] = 0,["uid"] = "dhYHvZGdt2x",["zoom"] = 0,["width"] = 55,["useCooldownModRate"] = true,["auto"] = true,["cooldownTextDisabled"] = false,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "8. Calamitous Strike - Echo of Neltharion",["cooldownEdge"] = false,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["config"] = {},["inverse"] = false,["authorOptions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayIcon"] = 3528301,["cooldown"] = true,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},},["8. Icons - High Priority - Echo of Neltharion"] = {["grow"] = "LEFT",["controlledChildren"] = {"8. Rushing Shadows - Echo of Neltharion","8. Volcanic Heartbeat [HIDE] - Echo of Neltharion","8. Corruption - Echo of Neltharion","8. Surerendering to Corruption [CORRUPTION\\nINC] - Echo of Neltharion","8. Calamitous Strike - Echo of Neltharion","8. Sundered Shadow [GHOST] - Echo of Neltharion","8. Sundered Reality [SAFE] - Echo of Neltharion","8. Collapsed Earth [STUN] - Echo of Neltharion",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Echo of Neltharion",["preferToUpdate"] = false,["yOffset"] = 0,["gridType"] = "RD",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 65,["useLimit"] = false,["align"] = "CENTER",["stagger"] = 0,["selfPoint"] = "RIGHT",["subRegions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["fullCircle"] = true,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["animate"] = false,["backdropColor"] = {1,1,1,0.5,},["sort"] = "none",["source"] = "import",["config"] = {},["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Icon - High Priority - Anchor",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["arcLength"] = 360,["anchorPoint"] = "CENTER",["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["rowSpace"] = 1,["borderOffset"] = 4,["borderEdge"] = "Square Full White",["tocversion"] = 100100,["id"] = "8. Icons - High Priority - Echo of Neltharion",["uid"] = "428JyM9(zjI",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["xOffset"] = 0,["borderInset"] = 1,["authorOptions"] = {},["sortHybridTable"] = {["8. Surerendering to Corruption [CORRUPTION\nINC] - Echo of Neltharion"] = false,["8. Collapsed Earth [STUN] - Echo of Neltharion"] = false,["8. Calamitous Strike - Echo of Neltharion"] = false,["8. Volcanic Heartbeat [HIDE] - Echo of Neltharion"] = false,["8. Corruption - Echo of Neltharion"] = false,["8. Sundered Reality [SAFE] - Echo of Neltharion"] = false,["8. Rushing Shadows - Echo of Neltharion"] = false,["8. Sundered Shadow [GHOST] - Echo of Neltharion"] = false,},["radius"] = 200,["conditions"] = {},["information"] = {},["rotation"] = 0,},["8. Not in a Portal - Echo of Neltharion (safe)"] = {["outline"] = "OUTLINE",["parent"] = "8. Texts (anchored) - Echo of Neltharion",["displayText_format_p_time_dynamic_threshold"] = 60,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["event"] = "Cast",["use_unit"] = true,["use_spellId"] = true,["spellIds"] = {},["spellId"] = 407917,["subeventPrefix"] = "SPELL",["unit"] = "boss",["names"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"407919",},["unit"] = "player",["matchesShowOn"] = "showOnActive",["useName"] = true,["debuffType"] = "HARMFUL",},["untrigger"] = {},},["disjunctive"] = "all",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["font"] = "Expressway MonoNum",["displayText_format_1.p_time_precision"] = 1,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["load"] = {["size"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2684",["use_encounterid"] = true,},["preferToUpdate"] = false,["fontSize"] = 20,["source"] = "import",["selfPoint"] = "CENTER",["shadowXOffset"] = 1,["displayText_format_1.p_time_mod_rate"] = true,["conditions"] = {},["internalVersion"] = 65,["regionType"] = "text",["displayText_format_1.p_time_legacy_floor"] = false,["displayText_format_p_time_mod_rate"] = true,["displayText_format_1.p_time_format"] = 0,["config"] = {},["automaticWidth"] = "Auto",["displayText_format_p_time_precision"] = 1,["displayText_format_1.p_time_dynamic_threshold"] = 60,["color"] = {0,1,0.2039215862751,1,},["yOffset"] = 0,["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "8. Not in a Portal - Echo of Neltharion (safe)",["wordWrap"] = "WordWrap",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "TnCVuOvElOO",["displayText"] = "SAFE",["authorOptions"] = {},["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["displayText_format_1.p_format"] = "timed",},["8. Sunder Reality Cast [PORTALS INC] - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["do_custom"] = false,},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.9764706492424,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["encounterid"] = "2684",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "4914669",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Echo of Neltharion",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["color"] = {},["textSize"] = 12,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 403908,["auranames"] = {"364963","Core Overload",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["unit"] = "boss",["use_tooltip"] = false,["ignoreSelf"] = true,["use_unit"] = true,["names"] = {"Sacred Blade",},["use_genericShowOn"] = true,["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["useExactSpellId"] = false,["useName"] = true,["type"] = "unit",["auraspellids"] = {},["unevent"] = "auto",["debuffType"] = "HARMFUL",["use_debuffClass"] = false,["spellName"] = 0,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "10",["remOperator"] = "<",["use_absorbMode"] = true,["group_countOperator"] = ">",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = -10,},["icon"] = true,["internalVersion"] = 65,["rotateText"] = "NONE",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["rotate"] = 0,["easeStrength"] = 3,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["anchorFrameType"] = "SCREEN",["stickyDuration"] = false,["adjustedMin"] = "4",["height"] = 23,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "PORTALS INC",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_legacy_floor"] = true,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},},["timer"] = true,["timerFlags"] = "None",["id"] = "8. Sunder Reality Cast [PORTALS INC] - Echo of Neltharion",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["stacksFlags"] = "None",["source"] = "import",["displayTextRight"] = "%p",["sparkColor"] = {1,1,1,1,},["authorOptions"] = {},["border"] = false,["borderEdge"] = "None",["borderOffset"] = 5,["borderInFront"] = false,["backgroundColor"] = {0,0,0,0.52000001072884,},["icon_side"] = "LEFT",["zoom"] = 0,["borderBackdrop"] = "Blizzard Tooltip",["sparkHeight"] = 14,["borderSize"] = 16,["sparkWidth"] = 3,["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["timerSize"] = 12,["sparkHidden"] = "NEVER",["backdropColor"] = {1,1,1,0.5,},["frameStrata"] = 1,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["customTextUpdate"] = "update",["inverse"] = false,["spark"] = false,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "af9f7M7YqNP",},["8. Surrender to Corruption Cast [DMG] - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.43529415130615,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["class"] = {["multi"] = {},},["encounterid"] = "2684",["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "4914666",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Echo of Neltharion",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["customTextUpdate"] = "update",["sparkColor"] = {1,1,1,1,},["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 403057,["auranames"] = {"364963","Core Overload",},["use_genericShowOn"] = true,["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["useExactSpellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["use_absorbHealMode"] = true,["use_tooltip"] = false,["ignoreSelf"] = true,["custom_type"] = "event",["names"] = {"Sacred Blade",},["matchesShowOn"] = "showOnActive",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["duration"] = "10",["type"] = "unit",["buffShowOn"] = "showOnActive",["auraspellids"] = {},["unevent"] = "auto",["use_unit"] = true,["useName"] = true,["use_exact_spellId"] = false,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["unit"] = "boss",["remOperator"] = "<",["custom_hide"] = "timed",["group_countOperator"] = ">",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = -10,},["url"] = "https://echoesports.gg",["internalVersion"] = 65,["sparkRotationMode"] = "AUTO",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["width"] = 240,["stickyDuration"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["height"] = 23,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "DMG",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_destName_abbreviate_max"] = 8,["text_fontType"] = "OUTLINE",["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_offset"] = 0,["border_size"] = 1,["text_text"] = "",["border_anchor"] = "bar",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["type"] = "subborder",},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["adjustedMax"] = "4",["source"] = "import",["semver"] = "1.0.5",["authorOptions"] = {},["adjustedMin"] = "4",["border"] = false,["borderEdge"] = "None",["borderOffset"] = 5,["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["borderBackdrop"] = "Blizzard Tooltip",["zoom"] = 0,["sparkHeight"] = 14,["sparkWidth"] = 3,["backgroundColor"] = {0,0,0,0.52000001072884,},["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["timerSize"] = 12,["id"] = "8. Surrender to Corruption Cast [DMG] - Echo of Neltharion",["useAdjustededMax"] = false,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["spark"] = false,["inverse"] = false,["uid"] = "Zc4kHHpR0lO",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["config"] = {},},["8. Ebon Destruction Cast [GET SAFE] - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.9764706492424,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["zoneIds"] = "",["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2684",["class"] = {["multi"] = {},},["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_never"] = false,["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "1354169",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Echo of Neltharion",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["color"] = {},["uid"] = "X3Gq8gB(3(3",["auto"] = true,["sparkRotationMode"] = "AUTO",["timer"] = true,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 407917,["auranames"] = {"364963","Core Overload",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useExactSpellId"] = false,["useGroup_count"] = false,["use_absorbHealMode"] = true,["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["subeventSuffix"] = "_CAST_START",["use_tooltip"] = false,["ignoreSelf"] = true,["names"] = {"Sacred Blade",},["use_unit"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["custom_hide"] = "timed",["debuffType"] = "HARMFUL",["buffShowOn"] = "showOnActive",["type"] = "unit",["unevent"] = "auto",["auraspellids"] = {},["unit"] = "boss",["useName"] = true,["use_onUpdateUnitTarget"] = true,["use_absorbMode"] = true,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["duration"] = "10",["remOperator"] = "<",["use_genericShowOn"] = true,["spellName"] = 0,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = -10,},["rotateText"] = "NONE",["internalVersion"] = 65,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["width"] = 240,["stickyDuration"] = false,["stacksFlags"] = "None",["xOffset"] = 0,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "GET SAFE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_fontType"] = "OUTLINE",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_offset"] = 0,["border_size"] = 1,["text_text"] = "",["border_anchor"] = "bar",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["type"] = "subborder",},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["source"] = "import",["displayTextRight"] = "%p",["textSize"] = 12,["semver"] = "1.0.5",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["borderOffset"] = 5,["icon_side"] = "LEFT",["borderBackdrop"] = "Blizzard Tooltip",["zoom"] = 0,["sparkHeight"] = 14,["sparkWidth"] = 3,["backgroundColor"] = {0,0,0,0.52000001072884,},["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["backdropColor"] = {1,1,1,0.5,},["id"] = "8. Ebon Destruction Cast [GET SAFE] - Echo of Neltharion",["sparkRotation"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["customText"] = "function()\
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
",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["do_sound"] = true,},["init"] = {["do_custom"] = false,},["finish"] = {},},["inverse"] = false,["config"] = {},["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 1,["op"] = "<",["variable"] = "expirationTime",["value"] = "3.2",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\Amy\\3.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["op"] = "<",["value"] = "2.2",["variable"] = "expirationTime",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\Amy\\2.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["op"] = "<",["variable"] = "expirationTime",["value"] = "1.2",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\Amy\\1.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["borderInset"] = 11,},["8. Scripe Group (anchored)"] = {["controlledChildren"] = {"8. Scripe List - Echo of Neltharion",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Singles - Echo of Neltharion",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 65,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["anchorFrameFrame"] = "WeakAuras:Scripe Lists - Anchor",["regionType"] = "group",["borderSize"] = 2,["anchorFrameParent"] = false,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "8. Scripe Group (anchored)",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["borderInset"] = 1,["xOffset"] = 0,["config"] = {},["uid"] = "YXE8OsxlzS6",["conditions"] = {},["information"] = {},["borderEdge"] = "Square Full White",},["8. Twisted Earth Cast [WALLS INC] - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.97254908084869,0.67058825492859,0.4078431725502,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["zoneIds"] = "",["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["use_never"] = false,["spec"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["encounterid"] = "2684",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "1044087",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Echo of Neltharion",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["sparkColor"] = {1,1,1,1,},["sparkRotationMode"] = "AUTO",["spark"] = false,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 402902,["auranames"] = {"Advanced Recombobulation","362732",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = true,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["useExactSpellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["custom_type"] = "event",["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbHealMode"] = true,["use_exact_spellId"] = false,["subeventPrefix"] = "SPELL",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["matchesShowOn"] = "showOnActive",["type"] = "unit",["buffShowOn"] = "showOnActive",["auraspellids"] = {},["unevent"] = "auto",["use_genericShowOn"] = true,["unit"] = "boss",["useName"] = true,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["names"] = {"Sacred Blade",},["remOperator"] = "<",["group_countOperator"] = ">",["spellName"] = 0,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = -10,},["borderOffset"] = 5,["internalVersion"] = 65,["stacksFont"] = "Friz Quadrata TT",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["customTextUpdate"] = "update",["stickyDuration"] = false,["borderInset"] = 11,["width"] = 240,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "WALLS INC",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_text_format_destName_abbreviate"] = false,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["border_offset"] = 0,["type"] = "subborder",["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["height"] = 23,["timerFlags"] = "None",["timer"] = true,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["xOffset"] = 0,["source"] = "import",["sparkHidden"] = "NEVER",["borderColor"] = {1,1,1,0.5,},["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["semver"] = "1.0.5",["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["borderBackdrop"] = "Blizzard Tooltip",["sparkWidth"] = 3,["sparkHeight"] = 14,["zoom"] = 0,["color"] = {},["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["textSize"] = 12,["id"] = "8. Twisted Earth Cast [WALLS INC] - Echo of Neltharion",["rotateText"] = "NONE",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["backgroundColor"] = {0,0,0,0.52000001072884,},["useAdjustededMax"] = false,["inverse"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "tC(HMlFq5Vi",},["8. Volcanic Heart Duration - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.41960787773132,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["class"] = {["multi"] = {},},["encounterid"] = "2684",["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "2065635",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Echo of Neltharion",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "jlld38zX9be",["displayTextLeft"] = "%n",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["sparkRotationMode"] = "AUTO",["timer"] = true,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = "410968",["auranames"] = {"364963","Core Overload",},["duration"] = "7",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Spell Cast Succeeded",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["custom_type"] = "event",["useGroup_count"] = false,["use_absorbMode"] = true,["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["names"] = {"Sacred Blade",},["use_tooltip"] = false,["ignoreSelf"] = true,["useExactSpellId"] = false,["use_unit"] = true,["custom"] = "function(event, _, _, spellID)\
    if spellID == 410968 and (not aura_env.last or aura_env.last < GetTime() - 1) then\
        aura_env.last = GetTime()\
        return true\
    end\
end\
\
\
",["events"] = "UNIT_SPELLCAST_SUCCEEDED:boss",["buffShowOn"] = "showOnActive",["use_genericShowOn"] = true,["useName"] = true,["custom_hide"] = "timed",["auraspellids"] = {},["unit"] = "boss",["debuffType"] = "HARMFUL",["unevent"] = "auto",["type"] = "custom",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["use_debuffClass"] = false,["group_countOperator"] = ">",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = -10,},["icon"] = true,["internalVersion"] = 65,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["width"] = 240,["stickyDuration"] = false,["adjustedMin"] = "4",["adjustedMax"] = "4",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "HEARTS OUT",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_time_precision"] = 1,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_format"] = "timed",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["semver"] = "1.0.5",["timerSize"] = 12,["authorOptions"] = {},["border"] = false,["borderEdge"] = "None",["sparkWidth"] = 3,["borderSize"] = 16,["borderInFront"] = false,["icon_side"] = "LEFT",["zoom"] = 0,["borderBackdrop"] = "Blizzard Tooltip",["sparkHeight"] = 14,["backgroundColor"] = {0,0,0,0.52000001072884,},["borderOffset"] = 5,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["sparkColor"] = {1,1,1,1,},["id"] = "8. Volcanic Heart Duration - Echo of Neltharion",["borderColor"] = {1,1,1,0.5,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["borderInset"] = 11,["url"] = "https://echoesports.gg",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["color"] = {},},["Nelth Heart Positions"] = {["user_y"] = 0,["user_x"] = 0,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 228.00030517578,["foregroundColor"] = {1,1,1,1,},["desaturateBackground"] = false,["sameTexture"] = false,["backgroundColor"] = {1,1,1,0.58000001311302,},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["unit"] = "player",["custom"] = "function(s, e, num, ts)\
    if num and num == 2 and ts and ts[\"\"] and ts[\"\"].show\
    then\
        local phase = WeakAuras.GetBigWigsStage()\
        phase = phase and phase > 0 and phase or 1\
        local count = tonumber(ts[\"\"].count)\
        if phase and count and aura_env.images[phase][count] then\
            --print(count, phase,  WeakAuras.GetBigWigsStage())\
            s[\"\"] = {\
                show = true,\
                changed = true,\
                texture = aura_env.images[phase][count],\
                autoHide = true,\
                duration = 9,\
                expirationTime = GetTime() + 9,\
                progressType = \"static\",\
                value = 1,\
                total = 1,\
            }\
            return true\
        end\
    end\
end\
\
\
",["spellIds"] = {},["custom_type"] = "stateupdate",["check"] = "event",["names"] = {},["events"] = "TRIGGER:2",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["use_remaining"] = true,["spellId"] = "410953",["remaining_operator"] = "<",["event"] = "BigWigs Timer",["unit"] = "player",["use_spellId"] = true,["remaining"] = "2",["type"] = "addons",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["type"] = "addons",["use_stage"] = false,["debuffType"] = "HELPFUL",["event"] = "BigWigs Stage",["unit"] = "player",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 65,["desaturateForeground"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["selfPoint"] = "CENTER",["crop_x"] = 0.41,["actions"] = {["start"] = {},["init"] = {["do_custom"] = true,["custom"] = "if not aura_env.region.bg then\
    aura_env.region.bg = aura_env.region:CreateTexture()\
end\
aura_env.region.bg:SetTexture([[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\bombBG.png]])\
aura_env.region.bg:SetDrawLayer(\"BACKGROUND\", 1)\
--aura_env.region.bg:SetColorTexture(unpack(aura_env.config.c))\
aura_env.region.bg:SetVertexColor(unpack(aura_env.config.c))\
aura_env.region.bg:ClearAllPoints()\
--local w,h = aura_env.region:GetSize()\
--local xoff, yoff = w*0.1,h*0.2\
--aura_env.region.bg:SetPoint(\"TOPLEFT\", xoff, -yoff)\
--aura_env.region.bg:SetPoint(\"BOTTOMRIGHT\", -xoff, yoff)\
\
aura_env.region.bg:SetAllPoints()\
\
aura_env.images = {\
    [1] = {\
        [1] = [[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\P1bomb1.png]],\
        [2] = [[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\P1bomb2.png]],\
        [3] = [[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\P1bomb3.png]],\
        [4] = [[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\P1bomb4.png]],\
    },\
    [2] = {\
        [1] = [[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\bomb12.png]],\
        [2] = [[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\bomb12.png]],\
        [3] = [[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\bomb3.png]],\
        [4] = [[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\bomb4.png]],\
        [5] = [[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\bomb5.png]],\
        [6] = [[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\bomb67.png]],\
        [7] = [[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\bomb67.png]],\
    },\
    \
}\
--[[Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions]]\
\
\
",},["finish"] = {},},["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["load"] = {["difficulty"] = {["single"] = "mythic",["multi"] = {["mythic"] = true,},},["use_encounterid"] = true,["use_difficulty"] = true,["talent"] = {["multi"] = {},},["encounterid"] = "2684",["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["subRegions"] = {{["type"] = "subbackground",},},["height"] = 350,["rotate"] = false,["crop_y"] = 0.41,["anchorPoint"] = "CENTER",["useAdjustededMax"] = false,["backgroundTexture"] = "Interface\\Textures\\bombBG.png",["source"] = "import",["startAngle"] = 0,["config"] = {["c"] = {0,0,0,0.54000002145767,},},["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["mirror"] = false,["useAdjustededMin"] = false,["regionType"] = "texture",["width"] = 350,["blendMode"] = "BLEND",["alpha"] = 1,["auraRotation"] = 0,["slantMode"] = "INSIDE",["fontSize"] = 12,["texture"] = "Interface\\AddOns\\EchoRaidTools\\assets\\textures\\NeltharionHeartPositions\\bomb3.png",["tocversion"] = 100100,["parent"] = "8. Singles - Echo of Neltharion",["authorOptions"] = {{["type"] = "color",["key"] = "c",["useDesc"] = false,["name"] = "Background Colour",["default"] = {0,0,0,0.54000002145767,},["width"] = 1,},},["compress"] = false,["id"] = "Nelth Heart Positions",["foregroundTexture"] = "Interface\\Textures\\bomb12.png",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = -457.00006103516,["uid"] = "YesMFP8ooaY",["inverse"] = false,["echoVersion"] = 3,["orientation"] = "VERTICAL",["conditions"] = {},["information"] = {},["backgroundOffset"] = 2,},["8. Texts (anchored) - Echo of Neltharion"] = {["arcLength"] = 360,["controlledChildren"] = {"8. Shadow Barrier [BOSS\\nIMMUNE] - Echo of Neltharion","8. Not in a Portal - Echo of Neltharion","8. Not in a Portal - Echo of Neltharion (safe)","8. Add Shield Down - Echo of Neltharion",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["selfPoint"] = "TOP",["align"] = "CENTER",["stagger"] = 0,["rowSpace"] = 1,["subRegions"] = {},["rotation"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["sortHybridTable"] = {["8. Not in a Portal - Echo of Neltharion (safe)"] = false,["8. Add Shield Down - Echo of Neltharion"] = false,["8. Shadow Barrier [BOSS\nIMMUNE] - Echo of Neltharion"] = false,["8. Not in a Portal - Echo of Neltharion"] = false,},["backdropColor"] = {1,1,1,0.5,},["sort"] = "none",["animate"] = false,["config"] = {},["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Texts - Anchor",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["source"] = "import",["parent"] = "8. Singles - Echo of Neltharion",["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["grow"] = "DOWN",["borderOffset"] = 4,["xOffset"] = 0,["tocversion"] = 100100,["id"] = "8. Texts (anchored) - Echo of Neltharion",["borderInset"] = 1,["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["borderEdge"] = "Square Full White",["uid"] = "6kLC9cvPszW",["gridType"] = "RD",["fullCircle"] = true,["internalVersion"] = 65,["conditions"] = {},["information"] = {},["useLimit"] = false,},["8. Rushing Shadows - Echo of Neltharion"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"Rushing Shadows","407220",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["unit"] = "player",["subeventPrefix"] = "SPELL",["use_unit"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["useName"] = true,["subeventSuffix"] = "_CAST_START",["unevent"] = "auto",["auraspellids"] = {},["duration"] = "3",["type"] = "aura2",["use_debuffClass"] = false,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["group_countOperator"] = ">",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_1.tooltip1_format"] = "none",["text_visible"] = false,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_anchorXOffset"] = 7,["anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_text_format_1.toltip1_format"] = "none",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.15,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2684",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["icon"] = true,["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["parent"] = "8. Icons - High Priority - Echo of Neltharion",["color"] = {1,1,1,1,},["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["auto"] = true,["zoom"] = 0,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "8. Rushing Shadows - Echo of Neltharion",["url"] = "https://echoesports.gg",["alpha"] = 1,["width"] = 55,["useCooldownModRate"] = true,["uid"] = "icsMVS9lgxA",["inverse"] = false,["xOffset"] = 0,["stickyDuration"] = false,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["selfPoint"] = "CENTER",},["8. Echoing Fissure Cast [FISSURE %2.count] - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.38431376218796,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["class"] = {["multi"] = {},},["encounterid"] = "2684",["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "136025",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Echo of Neltharion",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["config"] = {},["spark"] = false,["sparkRotationMode"] = "AUTO",["height"] = 23,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 403272,["auranames"] = {"364963","Core Overload",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["useExactSpellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["use_absorbHealMode"] = true,["use_tooltip"] = false,["ignoreSelf"] = true,["custom_type"] = "event",["use_unit"] = true,["use_genericShowOn"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["duration"] = "10",["type"] = "unit",["buffShowOn"] = "showOnActive",["auraspellids"] = {},["unevent"] = "auto",["names"] = {"Sacred Blade",},["useName"] = true,["use_exact_spellId"] = false,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["unit"] = "boss",["remOperator"] = "<",["spellName"] = 0,["custom_hide"] = "timed",["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "combatlog",["subeventSuffix"] = "_CAST_START",["duration"] = "5",["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["use_spellName"] = true,["debuffType"] = "HELPFUL",["use_spellId"] = false,["unit"] = "player",["spellName"] = "Echoing Fissure",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["rotateText"] = "NONE",["internalVersion"] = 65,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["easeStrength"] = 3,["rotate"] = 0,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["width"] = 240,["stickyDuration"] = false,["adjustedMax"] = "4",["xOffset"] = 0,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FISSURE %2.count",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_text_format_2.count_format"] = "none",["text_anchorPoint"] = "INNER_LEFT",["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["type"] = "subborder",["border_offset"] = 0,["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["stacksFont"] = "Friz Quadrata TT",["source"] = "import",["timerSize"] = 12,["textSize"] = 12,["backgroundColor"] = {0,0,0,0.52000001072884,},["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["semver"] = "1.0.5",["icon_side"] = "LEFT",["zoom"] = 0,["borderBackdrop"] = "Blizzard Tooltip",["sparkHeight"] = 14,["borderOffset"] = 5,["sparkWidth"] = 3,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["id"] = "8. Echoing Fissure Cast [FISSURE %2.count] - Echo of Neltharion",["borderColor"] = {1,1,1,0.5,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["adjustedMin"] = "4",["icon"] = true,["inverse"] = false,["uid"] = "ITKfm(Tpf2e",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["borderInset"] = 11,},["8. Sundered Reality [SAFE] - Echo of Neltharion"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"407919",},["use_genericShowOn"] = true,["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_hide"] = "timed",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["use_debuffClass"] = false,["subeventPrefix"] = "SPELL",["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["use_unit"] = true,["type"] = "aura2",["useName"] = true,["unevent"] = "auto",["matchesShowOn"] = "showOnActive",["names"] = {"Sacred Blade",},["debuffType"] = "HARMFUL",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "3",["remOperator"] = "<",["useExactSpellId"] = false,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SAFE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip2_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.toltip1_format"] = "none",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_visible"] = true,["text_anchorYOffset"] = -6,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2684",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["source"] = "import",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "8. Icons - High Priority - Echo of Neltharion",["xOffset"] = 0,["uid"] = "wwgzhlzMamg",["cooldownTextDisabled"] = false,["width"] = 55,["useCooldownModRate"] = true,["semver"] = "1.0.4",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["id"] = "8. Sundered Reality [SAFE] - Echo of Neltharion",["url"] = "https://echoesports.gg",["alpha"] = 1,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["config"] = {},["inverse"] = false,["authorOptions"] = {},["desaturate"] = false,["displayIcon"] = 3528301,["cooldown"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["8. Private Aura Scripe List - Neltharion [PUBLIC]"] = {["grow"] = "CUSTOM",["controlledChildren"] = {"8. Private Aura Bar - Neltharion [PUBLIC]",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Singles - Echo of Neltharion",["preferToUpdate"] = false,["yOffset"] = 477.00036621094,["anchorPoint"] = "CENTER",["echoVersion"] = 9,["borderColor"] = {0,0,0,1,},["rowSpace"] = 1,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["selfPoint"] = "TOPLEFT",["align"] = "LEFT",["growOn"] = "changed",["stagger"] = 0,["subRegions"] = {},["internalVersion"] = 65,["sortHybridTable"] = {["8. Private Aura Bar - Neltharion [PUBLIC]"] = false,},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropColor"] = {1,1,1,0.5,},["useLimit"] = false,["source"] = "import",["customGrow"] = "function(pos, reg)\
    local config = aura_env.child_envs[1].config\
    local limit = config.useLimit and config.limit or 30\
    local x, y = 0,0\
    local spacing = 1\
    for i, r in ipairs(reg) do\
        if i <= limit then\
            pos[i] = {x,y}\
            if not r.region.state.isMelee then\
                x = x\
                y = y - (r.region.height + spacing)\
            end\
        else\
            pos[i] = {0,0,false}\
        end\
    end\
end\
\
\
",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["sort"] = "none",["animate"] = false,["borderInset"] = 1,["uid"] = "NmypVrPMITb",["arcLength"] = 360,["constantFactor"] = "RADIUS",["gridWidth"] = 5,["borderOffset"] = 4,["xOffset"] = -568.99987792969,["tocversion"] = 100100,["id"] = "8. Private Aura Scripe List - Neltharion [PUBLIC]",["limit"] = 5,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["config"] = {},["gridType"] = "RD",["fullCircle"] = true,["space"] = 1,["conditions"] = {},["information"] = {},["rotation"] = 0,},["8. Sundered Shadow [GHOST] - Echo of Neltharion"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"Sundered Shadow","407728",},["use_genericShowOn"] = true,["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_hide"] = "timed",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["use_debuffClass"] = false,["names"] = {"Sacred Blade",},["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["subeventPrefix"] = "SPELL",["type"] = "aura2",["useName"] = true,["unevent"] = "auto",["matchesShowOn"] = "showOnActive",["use_unit"] = true,["debuffType"] = "HARMFUL",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "3",["remOperator"] = "<",["useExactSpellId"] = false,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "GHOST",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.ttoltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.toltip1_format"] = "none",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_visible"] = true,["text_anchorYOffset"] = -6,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = true,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2684",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "8. Icons - High Priority - Echo of Neltharion",["xOffset"] = 0,["uid"] = "pbG13EsPjwJ",["zoom"] = 0,["width"] = 55,["useCooldownModRate"] = true,["auto"] = true,["cooldownTextDisabled"] = false,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "8. Sundered Shadow [GHOST] - Echo of Neltharion",["cooldownEdge"] = false,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["config"] = {},["inverse"] = false,["authorOptions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayIcon"] = 3528301,["cooldown"] = true,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},},["8. Corruption - Echo of Neltharion"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"Corruption","401010",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = true,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["use_absorbHealMode"] = true,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_genericShowOn"] = true,["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["matchesShowOn"] = "showOnActive",["useName"] = false,["use_unit"] = true,["unevent"] = "auto",["auraspellids"] = {"410972","401010",},["type"] = "aura2",["spellName"] = 0,["debuffType"] = "HARMFUL",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["subeventPrefix"] = "SPELL",["remOperator"] = "<",["custom_type"] = "event",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = false,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_1.tolltip1_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_s_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.ttoltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = true,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2684",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["source"] = "import",["icon"] = true,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "WWYqwibMk9k",["alpha"] = 1,["width"] = 55,["useCooldownModRate"] = true,["semver"] = "1.0.4",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["id"] = "8. Corruption - Echo of Neltharion",["cooldownTextDisabled"] = false,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["desaturate"] = false,["config"] = {},["inverse"] = false,["authorOptions"] = {},["parent"] = "8. Icons - High Priority - Echo of Neltharion",["displayIcon"] = 3528301,["cooldown"] = true,["url"] = "https://echoesports.gg",},["8. Surerendering to Corruption List [INC %1.unitName] - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = true,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.0039215688593686,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2684",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = 3528301,["textColor"] = {1,1,1,1,},["preferToUpdate"] = false,["borderBackdrop"] = "Blizzard Tooltip",["barColor2"] = {0.27450981736183,0.10980392992496,1,1,},["parent"] = "8. Scripe List - Echo of Neltharion",["config"] = {},["customText"] = "function()\
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
",["sparkOffsetX"] = 0,["cooldownTextDisabled"] = false,["displayTextLeft"] = "%n",["cooldownSwipe"] = true,["borderOffset"] = 5,["customTextUpdate"] = "update",["cooldownEdge"] = false,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"405484",},["use_genericShowOn"] = true,["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = true,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["useExactSpellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = false,["names"] = {"Sacred Blade",},["custom_type"] = "event",["unit"] = "group",["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["custom_hide"] = "timed",["useName"] = true,["debuffType"] = "HARMFUL",["auraspellids"] = {"410972","401010",},["type"] = "aura2",["use_unit"] = true,["duration"] = "3",["unevent"] = "auto",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["use_debuffClass"] = false,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["url"] = "https://echoesports.gg",["internalVersion"] = 65,["anchorFrameType"] = "SCREEN",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["frameStrata"] = 4,["stickyDuration"] = false,["stacksFont"] = "Friz Quadrata TT",["sparkHidden"] = "NEVER",["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_text"] = "",["type"] = "subborder",["border_anchor"] = "bar",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["type"] = "subtext",["anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_time_format"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 14,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "INC %1.unitName",["text_text_format_1.unitName_color"] = "class",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_text_format_1.unitName_abbreviate"] = false,["rotateText"] = "NONE",["type"] = "subtext",["text_text_format_1.unitName_abbreviate_max"] = 8,["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_1.unitName_format"] = "Unit",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_affected_format"] = "none",["text_fontSize"] = 16,["anchorXOffset"] = 0,["text_justify"] = "CENTER",},},["timer"] = true,["timerFlags"] = "None",["sparkWidth"] = 3,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["displayTextRight"] = "%p",["source"] = "import",["timerSize"] = 12,["borderColor"] = {1,1,1,0.5,},["backgroundColor"] = {0,0,0,0.3400000333786,},["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["authorOptions"] = {},["icon_side"] = "LEFT",["sparkColor"] = {1,1,1,1,},["useAdjustededMax"] = false,["sparkHeight"] = 14,["sparkRotationMode"] = "AUTO",["icon"] = true,["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.4",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["id"] = "8. Surerendering to Corruption List [INC %1.unitName] - Echo of Neltharion",["color"] = {},["useCooldownModRate"] = true,["width"] = 200,["height"] = 20,["spark"] = false,["inverse"] = true,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["orientation"] = "HORIZONTAL",["conditions"] = {},["cooldown"] = true,["uid"] = "ofhBSpEXm2s",},["8. Umbral Annihilation Cast [BIG BOOM %c] - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.49411767721176,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["class"] = {["multi"] = {},},["encounterid"] = "2684",["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "4914667",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Echo of Neltharion",["customText"] = "function()\
    return aura_env.states[2].stacks and aura_env.states[2].stacks + 1 or 1\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["displayTextLeft"] = "%n",["auto"] = true,["customTextUpdate"] = "event",["stacksFont"] = "Friz Quadrata TT",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 405434,["auranames"] = {"364963","Core Overload",},["duration"] = "10",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbHealMode"] = true,["custom_hide"] = "timed",["use_unit"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["buffShowOn"] = "showOnActive",["type"] = "unit",["useName"] = true,["unevent"] = "auto",["subeventPrefix"] = "SPELL",["unit"] = "boss",["auraspellids"] = {},["matchesShowOn"] = "showOnActive",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["use_absorbMode"] = true,["useExactSpellId"] = false,["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["rem"] = "3",["spellId"] = 405434,["auranames"] = {"404045",},["duration"] = "9000",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["custom_type"] = "event",["fetchTooltip"] = false,["event"] = "Combat Log",["use_spellId"] = false,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_exact_spellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["spellName"] = "Umbral Annihilation",["use_tooltip"] = false,["ignoreSelf"] = true,["group_countOperator"] = ">",["subeventPrefix"] = "SPELL",["matchesShowOn"] = "showOnActive",["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["use_absorbHealMode"] = true,["type"] = "aura2",["useExactSpellId"] = false,["auraspellids"] = {},["debuffType"] = "HELPFUL",["unit"] = "boss",["useName"] = true,["unevent"] = "auto",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_genericShowOn"] = true,["remOperator"] = "<",["names"] = {"Sacred Blade",},["subeventSuffix"] = "_CAST_START",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["url"] = "https://echoesports.gg",["internalVersion"] = 65,["sparkRotationMode"] = "AUTO",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["width"] = 240,["stickyDuration"] = false,["icon"] = true,["height"] = 23,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BIG BOOM %c",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_2.stacks_format"] = "none",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_text_format_2.count_format"] = "none",["text_anchorPoint"] = "INNER_LEFT",["text_text_format_2.s_format"] = "none",["text_text_format_c_format"] = "none",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["text_text"] = "",["type"] = "subborder",["border_anchor"] = "bar",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["adjustedMax"] = "4",["source"] = "import",["semver"] = "1.0.5",["authorOptions"] = {},["adjustedMin"] = "4",["border"] = false,["borderEdge"] = "None",["borderOffset"] = 5,["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["borderBackdrop"] = "Blizzard Tooltip",["zoom"] = 0,["sparkHeight"] = 14,["sparkWidth"] = 3,["backgroundColor"] = {0,0,0,0.52000001072884,},["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["timerSize"] = 12,["id"] = "8. Umbral Annihilation Cast [BIG BOOM %c] - Echo of Neltharion",["backdropColor"] = {1,1,1,0.5,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["sparkColor"] = {1,1,1,1,},["inverse"] = false,["uid"] = "ePobArP3jqi",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["config"] = {},},["8. Blue Breaker - Neltharion"] = {["outline"] = "OUTLINE",["authorOptions"] = {},["displayText"] = "%2.raidMark BLUE BREAKER %1.p",["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["event"] = "Cast",["unit"] = "boss",["use_spellId"] = true,["spellIds"] = {},["spellId"] = 407207,["names"] = {},["use_unit"] = true,["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["use_raidMarkIndex"] = true,["use_absorbHealMode"] = true,["use_absorbMode"] = true,["event"] = "Unit Characteristics",["unit"] = "player",["use_unit"] = true,["raidMarkIndex"] = 6,["type"] = "unit",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["font"] = "Expressway MonoNum",["displayText_format_1.p_time_precision"] = 1,["displayText_format_1.p_format"] = "timed",["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["parent"] = "8. Singles - Echo of Neltharion",["selfPoint"] = "BOTTOM",["fontSize"] = 30,["source"] = "import",["conditions"] = {},["shadowXOffset"] = 1,["displayText_format_1.p_time_mod_rate"] = true,["internalVersion"] = 65,["preferToUpdate"] = false,["regionType"] = "text",["displayText_format_1.p_time_legacy_floor"] = false,["url"] = "https://echoesports.gg",["config"] = {},["xOffset"] = 0,["displayText_format_p_time_dynamic_threshold"] = 60,["displayText_format_p_time_precision"] = 1,["displayText_format_1.p_time_dynamic_threshold"] = 60,["yOffset"] = 0,["color"] = {1,1,1,1,},["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "8. Blue Breaker - Neltharion",["wordWrap"] = "WordWrap",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["displayText_format_2.raidMark_format"] = "none",["uid"] = "SRiO0QWPdJl",["displayText_format_1.p_time_format"] = 0,["displayText_format_p_format"] = "timed",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["subRegions"] = {{["type"] = "subbackground",},},},["8. Volcanic Heart [DOT] - Echo of Neltharion"] = {["iconSource"] = -1,["parent"] = "8. Icons - Low Priority - Echo of Neltharion",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"410953",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["subeventPrefix"] = "SPELL",["names"] = {"Sacred Blade",},["unit"] = "player",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["useName"] = true,["useExactSpellId"] = false,["unevent"] = "auto",["use_genericShowOn"] = true,["type"] = "aura2",["auraspellids"] = {},["spellName"] = 0,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["use_absorbHealMode"] = true,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_1.tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip2_format"] = "none",["anchorXOffset"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.toltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = true,["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.15,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2684",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["color"] = {1,1,1,1,},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["url"] = "https://echoesports.gg",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {},["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["semver"] = "1.0.4",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["id"] = "8. Volcanic Heart [DOT] - Echo of Neltharion",["cooldownTextDisabled"] = false,["alpha"] = 1,["width"] = 55,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["uid"] = "wN3yuXhoFy7",["inverse"] = false,["authorOptions"] = {},["xOffset"] = 0,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["desaturate"] = false,},["8. Private Auras - Neltharion"] = {["arcLength"] = 360,["controlledChildren"] = {"8. Private Aura - Neltharion",},["borderBackdrop"] = "Blizzard Tooltip",["wagoID"] = "n3lAhBYxn",["xOffset"] = 131.18310546875,["preferToUpdate"] = false,["yOffset"] = 47.222045898438,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["fullCircle"] = true,["space"] = 2,["url"] = "https://echoesports.gg/weakauras",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["selfPoint"] = "LEFT",["align"] = "CENTER",["rotation"] = 0,["version"] = 6,["subRegions"] = {},["parent"] = "8. Singles - Echo of Neltharion",["stagger"] = 0,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropColor"] = {1,1,1,0.5,},["internalVersion"] = 65,["animate"] = false,["authorOptions"] = {},["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["borderInset"] = 1,["sort"] = "ascending",["grow"] = "RIGHT",["gridWidth"] = 2,["constantFactor"] = "RADIUS",["uid"] = "Dny4A(8BoQX",["borderOffset"] = 4,["semver"] = "1.0.5",["tocversion"] = 100100,["id"] = "8. Private Auras - Neltharion",["rowSpace"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "UIPARENT",["gridType"] = "RU",["config"] = {},["sortHybridTable"] = {["8. Private Aura - Neltharion"] = false,},["source"] = "import",["borderColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["useLimit"] = false,},["8. Icons - Low Priority - Echo of Neltharion"] = {["grow"] = "LEFT",["controlledChildren"] = {"8. Volcanic Heart [DOT] - Echo of Neltharion","8. Ebon Destruction [DOT] - Echo of Neltharion","8. Shatter (low stacks) - Echo of Neltharion",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["fullCircle"] = true,["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 65,["selfPoint"] = "RIGHT",["align"] = "CENTER",["stagger"] = 0,["radius"] = 200,["subRegions"] = {},["rotation"] = 0,["sortHybridTable"] = {["8. Ebon Destruction [DOT] - Echo of Neltharion"] = false,["8. Shatter (low stacks) - Echo of Neltharion"] = false,["8. Volcanic Heart [DOT] - Echo of Neltharion"] = false,},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["animate"] = false,["backdropColor"] = {1,1,1,0.5,},["sort"] = "none",["source"] = "import",["config"] = {},["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["xOffset"] = 0,["parent"] = "8. Echo of Neltharion",["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["rowSpace"] = 1,["borderOffset"] = 4,["anchorFrameFrame"] = "WeakAuras:Icon - Low Priority - Anchor",["tocversion"] = 100100,["id"] = "8. Icons - Low Priority - Echo of Neltharion",["uid"] = "kGkwAzp88Zh",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["arcLength"] = 360,["borderInset"] = 1,["gridType"] = "RD",["borderColor"] = {0,0,0,1,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["conditions"] = {},["information"] = {},["useLimit"] = false,},["8. Scripe List - Echo of Neltharion"] = {["grow"] = "DOWN",["controlledChildren"] = {"8. Corruption List - Echo of Neltharion","8. Surerendering to Corruption List [INC %1.unitName] - Echo of Neltharion",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["rotation"] = 0,["rowSpace"] = 1,["useLimit"] = false,["subRegions"] = {},["internalVersion"] = 65,["gridType"] = "RD",["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["customSort"] = "WeakAuras.ComposeSorts(\
  WeakAuras.SortAscending{\"dataIndex\"},\
  WeakAuras.SortDescending{\"region\", \"state\", \"expirationTime\"}\
)",["backdropColor"] = {1,1,1,0.5,},["uid"] = "61L)CFYes)Q",["source"] = "import",["borderInset"] = 1,["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Scripe Lists - Anchor",["regionType"] = "dynamicgroup",["borderSize"] = 2,["sort"] = "custom",["borderEdge"] = "Square Full White",["sortHybridTable"] = {["8. Corruption List - Echo of Neltharion"] = false,["8. Surerendering to Corruption List [INC %1.unitName] - Echo of Neltharion"] = false,},["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["xOffset"] = 0,["borderOffset"] = 4,["arcLength"] = 360,["tocversion"] = 100100,["id"] = "8. Scripe List - Echo of Neltharion",["limit"] = 5,["gridWidth"] = 5,["anchorFrameType"] = "SCREEN",["parent"] = "8. Scripe Group (anchored)",["config"] = {},["stagger"] = 0,["animate"] = false,["fullCircle"] = true,["conditions"] = {},["information"] = {},["selfPoint"] = "TOP",},["8. Volcanic Heartbeat [HIDE] - Echo of Neltharion"] = {["iconSource"] = -1,["parent"] = "8. Icons - High Priority - Echo of Neltharion",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"410966",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["useExactSpellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["names"] = {"Sacred Blade",},["subeventPrefix"] = "SPELL",["matchesShowOn"] = "showOnActive",["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["custom_type"] = "event",["useName"] = true,["type"] = "aura2",["unevent"] = "auto",["buffShowOn"] = "showOnActive",["auraspellids"] = {},["use_debuffClass"] = false,["spellName"] = 0,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_genericShowOn"] = true,["remOperator"] = "<",["use_unit"] = true,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "HIDE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_1.toltip1_format"] = "none",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2684",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["authorOptions"] = {},["color"] = {1,1,1,1,},["uid"] = "fauVAGEfPUD",["cooldownTextDisabled"] = false,["width"] = 55,["useCooldownModRate"] = true,["semver"] = "1.0.4",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["id"] = "8. Volcanic Heartbeat [HIDE] - Echo of Neltharion",["url"] = "https://echoesports.gg",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["config"] = {},["inverse"] = false,["xOffset"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayIcon"] = 3528301,["cooldown"] = true,["desaturate"] = false,},["8. Echo of Neltharion"] = {["controlledChildren"] = {"8. Icons - High Priority - Echo of Neltharion","8. Icons - Low Priority - Echo of Neltharion","8. Bars - Echo of Neltharion","8. Singles - Echo of Neltharion",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "!Echo - Aberrus",["preferToUpdate"] = false,["groupIcon"] = 5161747,["anchorPoint"] = "CENTER",["echoVersion"] = 5,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["internalVersion"] = 65,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "8. Echo of Neltharion",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["config"] = {},["uid"] = "q4xjdcSeuS)",["xOffset"] = 0,["borderInset"] = 1,["yOffset"] = 0,["conditions"] = {},["information"] = {},["selfPoint"] = "CENTER",},["8. Shadow Strike Cast [BREAKING] - Echo of Neltharion"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.3843137254902,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["use_role"] = false,["encounterid"] = "2684",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["HEALER"] = true,["DAMAGER"] = true,},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "237531",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Echo of Neltharion",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["config"] = {},["textSize"] = 12,["uid"] = "tWlUdt6xL(B",["customTextUpdate"] = "update",["auto"] = true,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 407796,["auranames"] = {},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["spellName"] = 0,["use_absorbHealMode"] = true,["use_unit"] = true,["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["unit"] = "boss",["type"] = "unit",["use_genericShowOn"] = true,["auraspellids"] = {"399713",},["buffShowOn"] = "showOnActive",["matchesShowOn"] = "showOnActive",["unevent"] = "auto",["useName"] = false,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["subeventPrefix"] = "SPELL",["remOperator"] = "<",["use_exact_spellId"] = false,["useExactSpellId"] = true,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["icon"] = true,["internalVersion"] = 65,["sparkRotation"] = 0,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["easeStrength"] = 3,["rotate"] = 0,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["width"] = 240,["stickyDuration"] = false,["borderInset"] = 11,["timer"] = true,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BREAKING",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_time_precision"] = 1,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_format"] = "timed",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["xOffset"] = 0,["customText"] = "function()\
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
",["border"] = false,["borderEdge"] = "None",["borderBackdrop"] = "Blizzard Tooltip",["borderInFront"] = false,["zoom"] = 0,["icon_side"] = "LEFT",["backgroundColor"] = {0,0,0,0.52000001072884,},["borderOffset"] = 5,["sparkHeight"] = 14,["borderSize"] = 16,["sparkWidth"] = 3,["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["semver"] = "1.0.5",["id"] = "8. Shadow Strike Cast [BREAKING] - Echo of Neltharion",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotationMode"] = "AUTO",["url"] = "https://echoesports.gg",["inverse"] = false,["stacksFont"] = "Friz Quadrata TT",["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},},["8. Shadow Barrier [BOSS\nIMMUNE] - Echo of Neltharion"] = {["outline"] = "OUTLINE",["iconSource"] = -1,["justify"] = "LEFT",["color"] = {1,1,1,1,},["displayText_format_p_time_dynamic_threshold"] = 60,["cooldown"] = true,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"403049",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["subeventSuffix"] = "_CAST_START",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["stacksOperator"] = "<=",["duration"] = "3",["useStacks"] = false,["useGroup_count"] = true,["names"] = {"Sacred Blade",},["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["use_genericShowOn"] = true,["use_tooltip"] = false,["ignoreSelf"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["useMatch_count"] = false,["use_debuffClass"] = false,["debuffType"] = "BOTH",["buffShowOn"] = "showOnActive",["useExactSpellId"] = false,["type"] = "aura2",["unevent"] = "auto",["auraspellids"] = {},["useName"] = true,["group_countOperator"] = ">",["stacks"] = "3",["custom_hide"] = "timed",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["subeventPrefix"] = "SPELL",["remOperator"] = "<",["unit"] = "target",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 65,["keepAspectRatio"] = false,["wordWrap"] = "WordWrap",["conditions"] = {},["shadowYOffset"] = -1,["zoom"] = 0,["desaturate"] = false,["parent"] = "8. Texts (anchored) - Echo of Neltharion",["font"] = "Friz Quadrata TT",["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["height"] = 55,["config"] = {},["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2684",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["fontSize"] = 20,["source"] = "import",["alpha"] = 1,["shadowXOffset"] = 1,["semver"] = "1.0.4",["preferToUpdate"] = false,["automaticWidth"] = "Auto",["regionType"] = "text",["stickyDuration"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["displayText_format_p_time_legacy_floor"] = false,["authorOptions"] = {},["displayText_format_p_time_precision"] = 1,["displayIcon"] = 3528301,["selfPoint"] = "CENTER",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "8. Shadow Barrier [BOSS\\nIMMUNE] - Echo of Neltharion",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["frameStrata"] = 1,["width"] = 55,["displayText_format_p_time_mod_rate"] = true,["uid"] = "lThJNHFRhGb",["inverse"] = false,["displayText"] = "BOSS IMMUNE",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["xOffset"] = 0,},["8. Not in a Portal - Echo of Neltharion"] = {["outline"] = "OUTLINE",["xOffset"] = 0,["displayText_format_p_time_dynamic_threshold"] = 60,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["event"] = "Cast",["use_unit"] = true,["use_spellId"] = true,["spellIds"] = {},["spellId"] = 407917,["subeventPrefix"] = "SPELL",["unit"] = "boss",["names"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"407919",},["unit"] = "player",["matchesShowOn"] = "showOnMissing",["useName"] = true,["debuffType"] = "HARMFUL",},["untrigger"] = {},},["disjunctive"] = "all",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["font"] = "Expressway MonoNum",["displayText_format_1.p_time_precision"] = 1,["displayText_format_1.p_format"] = "timed",["load"] = {["size"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["encounterid"] = "2684",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["preferToUpdate"] = false,["fontSize"] = 20,["source"] = "import",["internalVersion"] = 65,["shadowXOffset"] = 1,["displayText_format_1.p_time_mod_rate"] = true,["conditions"] = {},["displayText_format_p_format"] = "timed",["regionType"] = "text",["displayText_format_1.p_time_legacy_floor"] = false,["displayText_format_1.p_time_format"] = 0,["automaticWidth"] = "Auto",["config"] = {},["color"] = {1,1,1,1,},["displayText_format_p_time_precision"] = 1,["displayText_format_1.p_time_dynamic_threshold"] = 60,["authorOptions"] = {},["yOffset"] = 0,["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "8. Not in a Portal - Echo of Neltharion",["wordWrap"] = "WordWrap",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "8. Texts (anchored) - Echo of Neltharion",["uid"] = "pJ4wBypgla6",["displayText"] = "GET SAFE %1.p ",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["selfPoint"] = "CENTER",},});


-- 8. manifest data

journal:AddManifestData({
	{
		["echoVersion"] = 5,
		["parent"] = "!Echo - Aberrus",
		["id"] = "8. Echo of Neltharion",
		["children"] = {
			"8. Singles - Echo of Neltharion",
			"8. Bars - Echo of Neltharion",
			"8. Icons - Low Priority - Echo of Neltharion",
			"8. Icons - High Priority - Echo of Neltharion",
		},
		["uid"] = "q4xjdcSeuS)",
	},
	{
		["echoVersion"] = 2,
		["parent"] = "8. Echo of Neltharion",
		["id"] = "8. Singles - Echo of Neltharion",
		["children"] = {
			"Nelth Heart Positions",
			"8. Private Auras - Neltharion",
			"8. Texts (anchored) - Echo of Neltharion",
			"8. Scripe Group (anchored)",
			"8. Blue Breaker - Neltharion",
			"8. Private Aura Scripe List - Neltharion [PUBLIC]",
		},
		["uid"] = "LUtW0JsUK12",
	},
	{
		["id"] = "Nelth Heart Positions",
		["uid"] = "YesMFP8ooaY",
		["parent"] = "8. Singles - Echo of Neltharion",
		["echoVersion"] = 3,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "8. Singles - Echo of Neltharion",
		["id"] = "8. Private Auras - Neltharion",
		["children"] = {
			"8. Private Aura - Neltharion",
		},
		["uid"] = "Dny4A(8BoQX",
	},
	{
		["id"] = "8. Private Aura - Neltharion",
		["uid"] = "UBeA0G3kOLT",
		["parent"] = "8. Private Auras - Neltharion",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "8. Singles - Echo of Neltharion",
		["id"] = "8. Texts (anchored) - Echo of Neltharion",
		["children"] = {
			"8. Add Shield Down - Echo of Neltharion",
			"8. Not in a Portal - Echo of Neltharion (safe)",
			"8. Not in a Portal - Echo of Neltharion",
			"8. Shadow Barrier [BOSS\\nIMMUNE] - Echo of Neltharion",
		},
		["uid"] = "6kLC9cvPszW",
	},
	{
		["id"] = "8. Add Shield Down - Echo of Neltharion",
		["uid"] = "7VhAsiXuczU",
		["parent"] = "8. Texts (anchored) - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Not in a Portal - Echo of Neltharion (safe)",
		["uid"] = "TnCVuOvElOO",
		["parent"] = "8. Texts (anchored) - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Not in a Portal - Echo of Neltharion",
		["uid"] = "pJ4wBypgla6",
		["parent"] = "8. Texts (anchored) - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Shadow Barrier [BOSS\\nIMMUNE] - Echo of Neltharion",
		["uid"] = "lThJNHFRhGb",
		["parent"] = "8. Texts (anchored) - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "8. Singles - Echo of Neltharion",
		["id"] = "8. Scripe Group (anchored)",
		["children"] = {
			"8. Scripe List - Echo of Neltharion",
		},
		["uid"] = "YXE8OsxlzS6",
	},
	{
		["echoVersion"] = 1,
		["parent"] = "8. Scripe Group (anchored)",
		["id"] = "8. Scripe List - Echo of Neltharion",
		["children"] = {
			"8. Surerendering to Corruption List [INC %1.unitName] - Echo of Neltharion",
			"8. Corruption List - Echo of Neltharion",
		},
		["uid"] = "61L)CFYes)Q",
	},
	{
		["id"] = "8. Surerendering to Corruption List [INC %1.unitName] - Echo of Neltharion",
		["uid"] = "ofhBSpEXm2s",
		["parent"] = "8. Scripe List - Echo of Neltharion",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. Corruption List - Echo of Neltharion",
		["uid"] = "j7TSZFh((NO",
		["parent"] = "8. Scripe List - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Blue Breaker - Neltharion",
		["uid"] = "SRiO0QWPdJl",
		["parent"] = "8. Singles - Echo of Neltharion",
		["echoVersion"] = 3,
	},
	{
		["echoVersion"] = 9,
		["parent"] = "8. Singles - Echo of Neltharion",
		["id"] = "8. Private Aura Scripe List - Neltharion [PUBLIC]",
		["children"] = {
			"8. Private Aura Bar - Neltharion [PUBLIC]",
		},
		["uid"] = "NmypVrPMITb",
	},
	{
		["id"] = "8. Private Aura Bar - Neltharion [PUBLIC]",
		["uid"] = "0lLddOjlQQY",
		["parent"] = "8. Private Aura Scripe List - Neltharion [PUBLIC]",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 2,
		["parent"] = "8. Echo of Neltharion",
		["id"] = "8. Bars - Echo of Neltharion",
		["children"] = {
			"8. Volcanic Heart Duration - Echo of Neltharion",
			"8. Sunder Reality Cast [PORTALS INC] - Echo of Neltharion",
			"8. Calamitous Strike Cast [KNOCK] - Echo of Neltharion",
			"8. Ebon Destruction Cast [GET SAFE] - Echo of Neltharion",
			"8. Shadow Strike Cast [BREAKING] - Echo of Neltharion",
			"8. Sunder Shadow Cast [GHOST - %1.unitName] - Echo of Neltharion",
			"8. Umbral Annihilation Cast [BIG BOOM %c] - Echo of Neltharion",
			"8. Surrender to Corruption Cast [DMG] - Echo of Neltharion",
			"8. Twisted Earth Cast [WALLS INC] - Echo of Neltharion",
			"8. Rushing Shadows Cast [WALL BREAKERS] - Echo of Neltharion",
			"8. Echoing Fissure Cast [FISSURE %2.count] - Echo of Neltharion",
		},
		["uid"] = "UYL)EodOWUT",
	},
	{
		["id"] = "8. Volcanic Heart Duration - Echo of Neltharion",
		["uid"] = "jlld38zX9be",
		["parent"] = "8. Bars - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Sunder Reality Cast [PORTALS INC] - Echo of Neltharion",
		["uid"] = "af9f7M7YqNP",
		["parent"] = "8. Bars - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Calamitous Strike Cast [KNOCK] - Echo of Neltharion",
		["uid"] = "h587sSw0LVe",
		["parent"] = "8. Bars - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Ebon Destruction Cast [GET SAFE] - Echo of Neltharion",
		["uid"] = "X3Gq8gB(3(3",
		["parent"] = "8. Bars - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Shadow Strike Cast [BREAKING] - Echo of Neltharion",
		["uid"] = "tWlUdt6xL(B",
		["parent"] = "8. Bars - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Sunder Shadow Cast [GHOST - %1.unitName] - Echo of Neltharion",
		["uid"] = "oE34JANABMC",
		["parent"] = "8. Bars - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Umbral Annihilation Cast [BIG BOOM %c] - Echo of Neltharion",
		["uid"] = "ePobArP3jqi",
		["parent"] = "8. Bars - Echo of Neltharion",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. Surrender to Corruption Cast [DMG] - Echo of Neltharion",
		["uid"] = "Zc4kHHpR0lO",
		["parent"] = "8. Bars - Echo of Neltharion",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. Twisted Earth Cast [WALLS INC] - Echo of Neltharion",
		["uid"] = "tC(HMlFq5Vi",
		["parent"] = "8. Bars - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Rushing Shadows Cast [WALL BREAKERS] - Echo of Neltharion",
		["uid"] = "cyqDHdutbz8",
		["parent"] = "8. Bars - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Echoing Fissure Cast [FISSURE %2.count] - Echo of Neltharion",
		["uid"] = "ITKfm(Tpf2e",
		["parent"] = "8. Bars - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "8. Echo of Neltharion",
		["id"] = "8. Icons - Low Priority - Echo of Neltharion",
		["children"] = {
			"8. Shatter (low stacks) - Echo of Neltharion",
			"8. Ebon Destruction [DOT] - Echo of Neltharion",
			"8. Volcanic Heart [DOT] - Echo of Neltharion",
		},
		["uid"] = "kGkwAzp88Zh",
	},
	{
		["id"] = "8. Shatter (low stacks) - Echo of Neltharion",
		["uid"] = "aZql1E4aD(b",
		["parent"] = "8. Icons - Low Priority - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Ebon Destruction [DOT] - Echo of Neltharion",
		["uid"] = "tnjpYshLAkQ",
		["parent"] = "8. Icons - Low Priority - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Volcanic Heart [DOT] - Echo of Neltharion",
		["uid"] = "wN3yuXhoFy7",
		["parent"] = "8. Icons - Low Priority - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "8. Echo of Neltharion",
		["id"] = "8. Icons - High Priority - Echo of Neltharion",
		["children"] = {
			"8. Collapsed Earth [STUN] - Echo of Neltharion",
			"8. Sundered Reality [SAFE] - Echo of Neltharion",
			"8. Sundered Shadow [GHOST] - Echo of Neltharion",
			"8. Calamitous Strike - Echo of Neltharion",
			"8. Surerendering to Corruption [CORRUPTION\\nINC] - Echo of Neltharion",
			"8. Corruption - Echo of Neltharion",
			"8. Volcanic Heartbeat [HIDE] - Echo of Neltharion",
			"8. Rushing Shadows - Echo of Neltharion",
		},
		["uid"] = "428JyM9(zjI",
	},
	{
		["id"] = "8. Collapsed Earth [STUN] - Echo of Neltharion",
		["uid"] = "kcthP(oH622",
		["parent"] = "8. Icons - High Priority - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Sundered Reality [SAFE] - Echo of Neltharion",
		["uid"] = "wwgzhlzMamg",
		["parent"] = "8. Icons - High Priority - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Sundered Shadow [GHOST] - Echo of Neltharion",
		["uid"] = "pbG13EsPjwJ",
		["parent"] = "8. Icons - High Priority - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Calamitous Strike - Echo of Neltharion",
		["uid"] = "dhYHvZGdt2x",
		["parent"] = "8. Icons - High Priority - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Surerendering to Corruption [CORRUPTION\\nINC] - Echo of Neltharion",
		["uid"] = "ubs38YDlkDM",
		["parent"] = "8. Icons - High Priority - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Corruption - Echo of Neltharion",
		["uid"] = "WWYqwibMk9k",
		["parent"] = "8. Icons - High Priority - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Volcanic Heartbeat [HIDE] - Echo of Neltharion",
		["uid"] = "fauVAGEfPUD",
		["parent"] = "8. Icons - High Priority - Echo of Neltharion",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Rushing Shadows - Echo of Neltharion",
		["uid"] = "icsMVS9lgxA",
		["parent"] = "8. Icons - High Priority - Echo of Neltharion",
		["echoVersion"] = 1,
	},
},1208,0);

--fixUpNestedPreview(8,1208,"8. Echo of Neltharion");