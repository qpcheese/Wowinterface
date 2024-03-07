local _AddonName, _EchoRaidTools = ...;

local journal = _EchoRaidTools:GetModule("waJournal");

-- 5. export data

journal:AddImportData({["5. Searing Slam Progress Circle - Rashok, the Elder"] = {["user_y"] = 0,["iconSource"] = -1,["user_x"] = 0,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["foregroundColor"] = {1,0.4588235616684,0,1,},["echoVersion"] = 2,["sameTexture"] = true,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["crop_y"] = 0.41,["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",["useAdjustededMin"] = false,["regionType"] = "progresstexture",["blendMode"] = "BLEND",["slantMode"] = "INSIDE",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["alpha"] = 1,["uid"] = "7jAYjUKcxFI",["displayIcon"] = 3528301,["backgroundOffset"] = 0,["parent"] = "5. Singles - Rashok, the Elder",["desaturateBackground"] = false,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["desaturateForeground"] = false,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"405819","Searing Slam",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = false,["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["custom_type"] = "event",["use_tooltip"] = false,["ignoreSelf"] = true,["custom_hide"] = "timed",["subeventPrefix"] = "SPELL",["names"] = {"Sacred Blade",},["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["duration"] = "3",["type"] = "aura2",["use_unit"] = true,["auraspellids"] = {},["useName"] = true,["unevent"] = "auto",["use_absorbHealMode"] = true,["debuffType"] = "HARMFUL",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_genericShowOn"] = true,["remOperator"] = "<",["group_countOperator"] = ">",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 65,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "TOP",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorXOffset"] = 0,["text_text_format_p_format"] = "timed",["text_text_format_p_time_precision"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {0.98823529411765,0.99607843137255,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_p_time_format"] = 0,["text_text_format_tooltip1_format"] = "none",["text_fontSize"] = 14,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "BOTTOMRIGHT",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {0.98823529411765,0.99607843137255,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_1.ttoltip1_format"] = "none",["text_shadowYOffset"] = 0,["text_text_format_tooltip2_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_visible"] = true,["text_anchorYOffset"] = -6,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_anchorXOffset"] = 5,},{["border_offset"] = 0,["text_text"] = "",["border_size"] = 1,["border_color"] = {1,1,1,1,},["border_visible"] = false,["border_edge"] = "Square Full White",["type"] = "subborder",},},["height"] = 150,["useAdjustededMax"] = false,["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",["source"] = "import",["mirror"] = false,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2680",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["conditions"] = {},["xOffset"] = 0,["auraRotation"] = 0,["compress"] = false,["startAngle"] = 0,["backgroundColor"] = {0.16078431904316,0.16078431904316,0.16078431904316,0.64000001549721,},["width"] = 150,["color"] = {1,1,1,1,},["semver"] = "1.0.4",["useCooldownModRate"] = true,["id"] = "5. Searing Slam Progress Circle - Rashok, the Elder",["anchorPoint"] = "CENTER",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["icon"] = true,["fontSize"] = 12,["inverse"] = false,["config"] = {},["orientation"] = "ANTICLOCKWISE",["crop_x"] = 0.41,["cooldown"] = true,["zoom"] = 0,},["5. Flaming Upsurge Cast [FLAMING SLASH] - Rashok, the Elder"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.20784315466881,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["use_role"] = true,["encounterid"] = "2680",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "524795",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "5. Bars - Rashok, the Elder",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["config"] = {},["sparkRotationMode"] = "AUTO",["stacksFont"] = "Friz Quadrata TT",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 407547,["auranames"] = {"Interdimensional Wormhole","362721",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["custom_type"] = "event",["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["use_debuffClass"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["useExactSpellId"] = false,["unit"] = "boss",["matchesShowOn"] = "showOnActive",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["use_absorbMode"] = true,["type"] = "unit",["group_countOperator"] = ">",["auraspellids"] = {},["buffShowOn"] = "showOnActive",["subeventPrefix"] = "SPELL",["useName"] = true,["unevent"] = "auto",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["use_unit"] = true,["spellName"] = 0,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["spark"] = false,["internalVersion"] = 65,["backdropColor"] = {1,1,1,0.5,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["rotate"] = 0,["easeStrength"] = 3,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["do_custom"] = false,},},["stickyDuration"] = false,["url"] = "https://echoesports.gg",["anchorFrameType"] = "SCREEN",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FLAMING SLASH",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_text_format_destName_format"] = "Unit",["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_anchorYOffset"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate"] = false,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["type"] = "subborder",["text_text"] = "",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["xOffset"] = 0,["source"] = "import",["id"] = "5. Flaming Upsurge Cast [FLAMING SLASH] - Rashok, the Elder",["borderColor"] = {1,1,1,0.5,},["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["timerSize"] = 12,["borderInFront"] = false,["zoom"] = 0,["icon_side"] = "LEFT",["sparkWidth"] = 3,["sparkOffsetX"] = 0,["sparkHeight"] = 14,["borderSize"] = 16,["color"] = {},["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["displayTextLeft"] = "%n",["sparkHidden"] = "NEVER",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["frameStrata"] = 1,["width"] = 240,["customTextUpdate"] = "update",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["inverse"] = false,["sparkColor"] = {1,1,1,1,},["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["uid"] = "Icdk2feuRLy",},["5. Doom Flame - Time to soak [SOAKS LANDING] - Rashok, the Elder"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.49803924560547,1,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2680",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["cooldownTextDisabled"] = false,["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "4914676",["textColor"] = {1,1,1,1,},["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["sparkOffsetX"] = 0,["borderInset"] = 11,["color"] = {},["borderBackdrop"] = "Blizzard Tooltip",["adjustedMin"] = "4",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["cooldownSwipe"] = true,["zoom"] = 0,["sparkRotationMode"] = "AUTO",["cooldownEdge"] = false,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = "406851",["auranames"] = {"Interdimensional Wormhole","362721",},["use_genericShowOn"] = true,["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Combat Log",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["custom_type"] = "event",["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbHealMode"] = true,["unit"] = "boss",["names"] = {"Sacred Blade",},["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["duration"] = "5",["useName"] = true,["use_exact_spellId"] = true,["auraspellids"] = {},["unevent"] = "auto",["debuffType"] = "HARMFUL",["type"] = "combatlog",["custom_hide"] = "timed",["realSpellName"] = 0,["use_spellName"] = false,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["use_unit"] = true,["group_countOperator"] = ">",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["anchorFrameType"] = "SCREEN",["internalVersion"] = 65,["adjustedMax"] = "4",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["customText"] = "function()\
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
",["stickyDuration"] = false,["sparkHidden"] = "NEVER",["xOffset"] = 0,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SOAKS LANDING",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},},["height"] = 23,["timerFlags"] = "None",["displayTextRight"] = "%p",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["semver"] = "1.0.4",["source"] = "import",["backdropColor"] = {1,1,1,0.5,},["borderColor"] = {1,1,1,0.5,},["customTextUpdate"] = "update",["border"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderSize"] = 16,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["icon_side"] = "LEFT",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["borderInFront"] = false,["sparkHeight"] = 14,["textFlags"] = "None",["config"] = {},["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["timer"] = true,["id"] = "5. Doom Flame - Time to soak [SOAKS LANDING] - Rashok, the Elder",["borderOffset"] = 5,["frameStrata"] = 1,["width"] = 240,["url"] = "https://echoesports.gg",["parent"] = "5. Bars - Rashok, the Elder",["inverse"] = false,["textSize"] = 12,["orientation"] = "HORIZONTAL",["conditions"] = {},["cooldown"] = true,["uid"] = "n6sVceYDCgv",},["5. Rashok, the Elder"] = {["controlledChildren"] = {"5. Icons - High Priority - Rashok, the Elder","5. Icons - Low Priority - Rashok, the Elder","5. Bars - Rashok, the Elder","5. Singles - Rashok, the Elder",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["groupIcon"] = 5161749,["anchorPoint"] = "CENTER",["echoVersion"] = 10,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["internalVersion"] = 65,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "5. Rashok, the Elder",["xOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["yOffset"] = 0,["config"] = {},["parent"] = "!Echo - Aberrus",["uid"] = "kMweva(DkC9",["borderInset"] = 1,["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["5. Earthen Crush Cast [EARTHEN CRUSH] - Rashok, the Elder"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.20784315466881,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["zoneIds"] = "",["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["use_role"] = true,["encounterid"] = "2680",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "1016245",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "5. Bars - Rashok, the Elder",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["uid"] = "pc1rPD4AjR3",["customTextUpdate"] = "update",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 407597,["auranames"] = {"Interdimensional Wormhole","362721",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["useExactSpellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "boss",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["custom_type"] = "event",["subeventPrefix"] = "SPELL",["matchesShowOn"] = "showOnActive",["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["use_genericShowOn"] = true,["type"] = "unit",["buffShowOn"] = "showOnActive",["unevent"] = "auto",["auraspellids"] = {},["use_unit"] = true,["useName"] = true,["use_exact_spellId"] = false,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["names"] = {"Sacred Blade",},["remOperator"] = "<",["group_countOperator"] = ">",["use_debuffClass"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["borderOffset"] = 5,["internalVersion"] = 65,["displayTextLeft"] = "%n",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["easeStrength"] = 3,["rotate"] = 0,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["stickyDuration"] = false,["sparkRotationMode"] = "AUTO",["width"] = 240,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "EARTHEN CRUSH",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_text_format_destName_abbreviate"] = false,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_text_format_destName_abbreviate_max"] = 8,["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["border_offset"] = 0,["type"] = "subborder",["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["height"] = 23,["timerFlags"] = "None",["timer"] = true,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["source"] = "import",["sparkHidden"] = "NEVER",["borderColor"] = {1,1,1,0.5,},["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["semver"] = "1.0.5",["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["sparkOffsetX"] = 0,["sparkWidth"] = 3,["sparkHeight"] = 14,["zoom"] = 0,["color"] = {},["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["authorOptions"] = {},["id"] = "5. Earthen Crush Cast [EARTHEN CRUSH] - Rashok, the Elder",["auto"] = true,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["url"] = "https://echoesports.gg",["backdropColor"] = {1,1,1,0.5,},["inverse"] = false,["config"] = {},["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["borderInset"] = 11,},["5. Overcharged Traffic Light - Rashok, the Elder [PUBLIC]"] = {["user_y"] = 0,["selfPoint"] = "TOP",["user_x"] = 0,["xOffset"] = 0,["preferToUpdate"] = false,["customText"] = "function()\
    return aura_env.getDisplayString()\
end",["yOffset"] = 10,["anchorPoint"] = "CENTER",["oName"] = "09 Stone Legion Generals - Personal Anima Display",["echoVersion"] = 5,["conditions"] = {{["check"] = {["value"] = "GREEN",["op"] = "==",["trigger"] = 1,["variable"] = "color",},["linked"] = false,["changes"] = {{["value"] = {0.21960785984993,1,0.34509804844856,0.62999999523163,},["property"] = "color",},{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BoxingArenaSound.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["op"] = "==",["checks"] = {{["value"] = "3",["op"] = ">",["trigger"] = 1,["variable"] = "selfQueuePosition",},{["value"] = "6",["op"] = "<=",["trigger"] = 1,["variable"] = "selfQueuePosition",},},["value"] = "YELLOW",["variable"] = "color",["trigger"] = 1,},["linked"] = true,["changes"] = {{["value"] = {0.99215692281723,1,0.19215688109398,0.64413511753082,},["property"] = "color",},{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\SharpPunch.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["value"] = "RED",["op"] = "==",["trigger"] = 1,["variable"] = "color",},["linked"] = true,["changes"] = {{["value"] = {1,0.015686275437474,0,0.65597820281982,},["property"] = "color",},},},},["sameTexture"] = false,["url"] = "https://echoesports.gg",["desaturateForeground"] = false,["triggers"] = {[1] = {["trigger"] = {["use_absorbMode"] = true,["use_unit"] = true,["debuffType"] = "HELPFUL",["type"] = "custom",["custom_hide"] = "timed",["subeventSuffix"] = "_CAST_START",["unevent"] = "auto",["subeventPrefix"] = "SPELL",["event"] = "Health",["names"] = {},["custom_type"] = "stateupdate",["duration"] = "1",["events"] = "ECHO_OVERCHARGED",["unit"] = "player",["check"] = "event",["custom"] = "function(allstates, event, ...)\
    local playerQueue = {}\
    \
    if WeakAuras.IsOptionsOpen() then\
        playerQueue = { \"otherplayer\", \"player\" }\
    elseif event == \"ECHO_OVERCHARGED\" and ... then\
        playerQueue = ... or {}\
    end\
    \
    local queuePos = aura_env.getSelfQueuePosition(playerQueue)\
    allstates[1] = {\
        show = queuePos > 0,\
        changed = true,\
        text = aura_env.getDisplayText(queuePos),\
        color = aura_env.getTrafficLightColor(queuePos),\
    }\
    \
    return true\
end",["spellIds"] = {},["customVariables"] = "{\
    green = \"bool\",\
    yellow = \"bool\",\
    red = \"bool\",\
    color = \"string\",\
}",},["untrigger"] = {},},[2] = {["trigger"] = {["useName"] = true,["auranames"] = {"405827",},["debuffType"] = "HARMFUL",["type"] = "aura2",["unit"] = "player",},["untrigger"] = {},},[3] = {["trigger"] = {["type"] = "addons",["unit"] = "player",["use_stage"] = true,["event"] = "BigWigs Stage",["stage_operator"] = "<",["stage"] = "3",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t)\
    if WeakAuras.CurrentEncounter then\
        return t[1] and t[2] and t[3]\
    else\
        return t[1]\
    end\
end",["activeTriggerMode"] = 1,},["endAngle"] = 360,["internalVersion"] = 65,["authorOptions"] = {{["type"] = "range",["useDesc"] = true,["max"] = 10,["step"] = 1,["width"] = 2,["min"] = 0,["key"] = "clearingGroupSize",["desc"] = "Number of players who should clear at the same time",["name"] = "Clearing group size",["default"] = 2,},},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["colorA"] = 1,["colorG"] = 1,["type"] = "custom",["easeType"] = "none",["use_color"] = false,["alpha"] = 0,["duration_type"] = "seconds",["y"] = 0,["colorType"] = "custom",["x"] = 0,["rotate"] = 0,["colorFunc"] = "\
\
",["easeStrength"] = 3,["colorB"] = 1,["scaley"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {["clearingGroupSize"] = 3,},["desaturateBackground"] = false,["auraRotation"] = 0,["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["tocversion"] = 100100,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text"] = "%text",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "CENTER",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_text_format_text_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_n_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "CENTER",["text_visible"] = true,["text_text_format_c_format"] = "none",["text_fontSize"] = 12,["anchorXOffset"] = 0,["text_font"] = "Friz Quadrata TT",},},["height"] = 50,["rotate"] = false,["crop_y"] = 0.41,["width"] = 50,["useAdjustededMax"] = false,["backgroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Circle_White",["source"] = "import",["startAngle"] = 0,["alpha"] = 1,["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["mirror"] = false,["useAdjustededMin"] = false,["regionType"] = "texture",["load"] = {["use_never"] = false,["instance_type"] = {},["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["zoneIds"] = "",["talent"] = {["multi"] = {},},["encounterid"] = "2680",["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["blendMode"] = "BLEND",["fontSize"] = 12,["backgroundColor"] = {0.58039215686275,0.58039215686275,0.58039215686275,0.5,},["slantMode"] = "INSIDE",["anchorFrameParent"] = false,["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Circle_White",["foregroundColor"] = {1,1,1,1,},["actions"] = {["start"] = {["do_custom"] = false,["do_message"] = false,},["finish"] = {},["init"] = {["do_custom"] = true,["custom"] = "function aura_env.getSelfQueuePosition(playerQueue)\
    for i, playerName in pairs(playerQueue)do\
        if UnitIsUnit(playerName, \"player\") then\
            return i;\
        end\
    end\
    \
    return 0\
end\
\
function aura_env.getTrafficLightColor(queuePos)\
    if queuePos <= aura_env.config.clearingGroupSize then\
        return \"GREEN\"\
    elseif queuePos <= (aura_env.config.clearingGroupSize * 2) then\
        return \"YELLOW\"\
    end\
    return \"RED\"\
end\
\
function aura_env.getDisplayText(queuePos)\
    if queuePos <= aura_env.config.clearingGroupSize then\
        return \"GO!\"\
    else\
        return \"Wait \" .. tostring(queuePos - aura_env.config.clearingGroupSize)\
    end\
end",},},["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",["compress"] = false,["id"] = "5. Overcharged Traffic Light - Rashok, the Elder [PUBLIC]",["desc"] = "Indicate your position in the ordering for Anima. ",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["color"] = {0.22745099663734,1,0.36078432202339,0.63229152560234,},["uid"] = "1m18LUz1C(l",["inverse"] = false,["parent"] = "5. Overcharged Singles - Rashok, the Elder [PUBLIC]",["orientation"] = "CLOCKWISE",["crop_x"] = 0.41,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["backgroundOffset"] = 0,},["5. Bars - Rashok, the Elder"] = {["grow"] = "UP",["controlledChildren"] = {"5. Ancient Fury cast [ENRAGE] - Rashok, the Elder","5. Searing Slam Bar [LEAP (%2.count) - %1.unitName] - Rashok, the Elder","5. Doom Flame Cast [SOAKS INC] - Rashok, the Elder","5. Doom Flame - Time to soak [SOAKS LANDING] - Rashok, the Elder","5. Shadowlava Blast Cast [FRONTAL CONE] - Rashok, the Elder","5. Charged Smash Cast [BIG SOAK] - Rashok, the Elder","5. Unleash Shadowflame Cast [LOOK ORBS] - Rashok, the Elder","5. Unleash Shadowflame CastComplete [BOOM] - Rashok, the Elder","5. Earthen Crush Cast [EARTHEN CRUSH] - Rashok, the Elder","5. Flaming Upsurge Cast [FLAMING SLASH] - Rashok, the Elder",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "5. Rashok, the Elder",["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["5. Shadowlava Blast Cast [FRONTAL CONE] - Rashok, the Elder"] = false,["5. Earthen Crush Cast [EARTHEN CRUSH] - Rashok, the Elder"] = false,["5. Ancient Fury cast [ENRAGE] - Rashok, the Elder"] = false,["5. Flaming Upsurge Cast [FLAMING SLASH] - Rashok, the Elder"] = false,["5. Searing Slam Bar [LEAP (%2.count) - %1.unitName] - Rashok, the Elder"] = false,["5. Unleash Shadowflame CastComplete [BOOM] - Rashok, the Elder"] = false,["5. Charged Smash Cast [BIG SOAK] - Rashok, the Elder"] = false,["5. Unleash Shadowflame Cast [LOOK ORBS] - Rashok, the Elder"] = false,["5. Doom Flame Cast [SOAKS INC] - Rashok, the Elder"] = false,["5. Doom Flame - Time to soak [SOAKS LANDING] - Rashok, the Elder"] = false,},["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 65,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["rotation"] = 0,["radius"] = 200,["subRegions"] = {},["stagger"] = 0,["useLimit"] = false,["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["animate"] = false,["backdropColor"] = {1,1,1,0.5,},["sort"] = "none",["source"] = "import",["borderInset"] = 1,["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Bars - Anchor",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["arcLength"] = 360,["gridType"] = "RD",["gridWidth"] = 5,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["xOffset"] = 0,["borderOffset"] = 4,["borderEdge"] = "Square Full White",["tocversion"] = 100100,["id"] = "5. Bars - Rashok, the Elder",["uid"] = "uM4zRcy9ZTv",["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["authorOptions"] = {},["config"] = {},["anchorPoint"] = "CENTER",["space"] = 2,["fullCircle"] = true,["conditions"] = {},["information"] = {},["selfPoint"] = "BOTTOM",},["5. Energy Count down - Rashok, the Elder"] = {["sparkWidth"] = 10,["iconSource"] = 0,["parent"] = "5. Singles - Rashok, the Elder",["preferToUpdate"] = false,["customText"] = "",["yOffset"] = 400,["anchorPoint"] = "CENTER",["echoVersion"] = 14,["sparkRotation"] = 0,["sparkRotationMode"] = "AUTO",["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.5,},["triggers"] = {[1] = {["trigger"] = {["use_absorbMode"] = true,["use_specific_unit"] = true,["debuffType"] = "HELPFUL",["type"] = "custom",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Power",["use_unit"] = true,["custom_type"] = "stateupdate",["use_power"] = true,["events"] = "CLEU:SPELL_AURA_APPLIED:SPELL_DAMAGE:SPELL_MISSED",["unit"] = "boss1",["check"] = "event",["custom"] = "function(s, event, timestamp, subEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID)\
    \
    local power\
    \
    if WeakAuras.IsOptionsOpen() then\
        power = 30\
    elseif subEvent == \"SPELL_AURA_APPLIED\" and spellID == 401419 then\
        power = UnitPower(\"boss1\")\
    end\
    \
    if power then\
        local dur = ceil(power / 5)\
        aura_env.start = GetTime()\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            total = power,\
            value = power,\
            progressType = \"timed\",\
            duration = dur,\
            expirationTime = dur + GetTime(),\
            count = ceil(dur / 1.5),\
            autoHide = true,\
        }\
        return true\
    end\
    \
    if (subEvent == \"SPELL_DAMAGE\" or subEvent == \"SPELL_MISSED\") and s[\"\"] and destGUID == WeakAuras.myGUID and spellID == 404448 then\
        --elog(\"pulse \"..format(\"%.2f\", GetTime() - aura_env.start))\
        s[\"\"].count = s[\"\"].count - 1\
        s[\"\"].changed = true\
        \
        return true\
    end\
end",["spellIds"] = {},["customVariables"] = "{duration = true,expirationTime = true, count = \"number\"}",},["untrigger"] = {},},["disjunctive"] = "all",["customTriggerLogic"] = "function(trigger)\
    return trigger[2]\
end",["activeTriggerMode"] = 1,},["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["barColor"] = {0.49411767721176,0.60784316062927,1,1,},["desaturate"] = false,["internalVersion"] = 65,["barColor2"] = {1,1,0,1,},["sparkOffsetY"] = 0,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_text_format_p_time_precision"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["type"] = "subtext",["text_text_format_p_format"] = "timed",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_n_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_p_time_format"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_shadowXOffset"] = 1,["text_fontSize"] = 16,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%count",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_c1_decimal_precision"] = 0,["type"] = "subtext",["text_fontType"] = "OUTLINE",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_visible"] = true,["text_shadowYOffset"] = -1,["text_text_format_c1_format"] = "Number",["text_wordWrap"] = "WordWrap",["text_text_format_count_format"] = "none",["text_anchorPoint"] = "INNER_CENTER",["text_text_format_n_format"] = "none",["text_text_format_c1_round_type"] = "floor",["text_fontSize"] = 16,["anchorXOffset"] = 0,["text_text_format_c_format"] = "none",},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["type"] = "subborder",},},["height"] = 28,["displayIcon"] = "3154546",["load"] = {["use_encounterid"] = true,["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2680",["size"] = {["multi"] = {},},},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["icon"] = true,["source"] = "import",["customTextUpdate"] = "event",["uid"] = "V(4c3)8NHIY",["sparkColor"] = {1,1,1,1,},["gradientOrientation"] = "HORIZONTAL",["useAdjustededMin"] = false,["regionType"] = "aurabar",["anchorFrameType"] = "SCREEN",["alpha"] = 1,["icon_side"] = "LEFT",["actions"] = {["start"] = {["do_custom"] = false,["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["id"] = "5. Energy Count down - Rashok, the Elder",["sparkHeight"] = 30,["texture"] = "Clean",["zoom"] = 0,["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["spark"] = false,["tocversion"] = 100100,["sparkHidden"] = "NEVER",["authorOptions"] = {},["frameStrata"] = 1,["width"] = 300,["xOffset"] = -0.0001220703125,["config"] = {},["inverse"] = false,["sparkOffsetX"] = 0,["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "count",["value"] = "3",["op"] = "==",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\David\\3.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "count",["op"] = "==",["value"] = "2",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\David\\2.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "count",["value"] = "1",["op"] = "==",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\David\\1.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},},["information"] = {["forceEvents"] = true,},["selfPoint"] = "CENTER",},["5. Lava Wave [MOVE] - Rashok, the Elder"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"403543","Lava Wave",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["use_debuffClass"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["custom_hide"] = "timed",["use_unit"] = true,["subeventPrefix"] = "SPELL",["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["use_genericShowOn"] = true,["type"] = "aura2",["duration"] = "3",["unevent"] = "auto",["buffShowOn"] = "showOnActive",["custom_type"] = "event",["auraspellids"] = {},["useName"] = true,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["names"] = {"Sacred Blade",},["remOperator"] = "<",["useExactSpellId"] = false,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "MOVE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.ttoltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = false,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2680",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["authorOptions"] = {},["uid"] = "yFFh2K7qy1P",["cooldownTextDisabled"] = false,["width"] = 55,["frameStrata"] = 1,["auto"] = true,["zoom"] = 0,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "5. Lava Wave [MOVE] - Rashok, the Elder",["url"] = "https://echoesports.gg",["alpha"] = 1,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["config"] = {},["inverse"] = false,["parent"] = "5. Icons - Low Priority - Rashok, the Elder",["selfPoint"] = "CENTER",["displayIcon"] = 3528301,["cooldown"] = true,["icon"] = true,},["5. Unleash Shadowflame Cast [LOOK ORBS] - Rashok, the Elder"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.43529415130615,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2680",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "4914673",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["color"] = {},["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["sparkColor"] = {1,1,1,1,},["customTextUpdate"] = "update",["spark"] = false,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["use_castType"] = false,["rem"] = "3",["spellId"] = 410070,["auranames"] = {"Interdimensional Wormhole","362721",},["use_genericShowOn"] = true,["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["castType"] = "channel",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["useExactSpellId"] = false,["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["names"] = {"Sacred Blade",},["matchesShowOn"] = "showOnActive",["unit"] = "boss",["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["use_absorbMode"] = true,["type"] = "unit",["spellName"] = 0,["auraspellids"] = {},["buffShowOn"] = "showOnActive",["useName"] = true,["unevent"] = "auto",["subeventPrefix"] = "SPELL",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "3",["remOperator"] = "<",["custom_type"] = "event",["use_debuffClass"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["config"] = {},["internalVersion"] = 65,["height"] = 23,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["easeStrength"] = 3,["rotate"] = 0,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["stacksFont"] = "Friz Quadrata TT",["stickyDuration"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Glass.mp3",["do_sound"] = true,},["init"] = {["do_custom"] = false,},["finish"] = {},},["width"] = 240,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "LOOK ORBS",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_text_format_destName_abbreviate"] = false,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_text_format_destName_abbreviate_max"] = 8,["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["border_offset"] = 0,["type"] = "subborder",["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["sparkRotation"] = 0,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["source"] = "import",["sparkHidden"] = "NEVER",["xOffset"] = 0,["semver"] = "1.0.5",["border"] = false,["borderEdge"] = "None",["sparkRotationMode"] = "AUTO",["borderInFront"] = false,["sparkOffsetX"] = 0,["icon_side"] = "LEFT",["sparkWidth"] = 3,["zoom"] = 0,["sparkHeight"] = 14,["borderSize"] = 16,["displayTextRight"] = "%p",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["displayTextLeft"] = "%n",["id"] = "5. Unleash Shadowflame Cast [LOOK ORBS] - Rashok, the Elder",["uid"] = "QJ)90K0wrLf",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["icon"] = true,["useAdjustededMax"] = false,["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "5. Bars - Rashok, the Elder",},["5. Unleash Shadowflame CastComplete [BOOM] - Rashok, the Elder"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.43529415130615,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2680",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "4914673",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["color"] = {},["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["parent"] = "5. Bars - Rashok, the Elder",["sparkRotationMode"] = "AUTO",["config"] = {},["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = "410070",["auranames"] = {"Interdimensional Wormhole","362721",},["use_genericShowOn"] = true,["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Combat Log",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["unit"] = "boss",["use_tooltip"] = false,["ignoreSelf"] = true,["custom_hide"] = "timed",["use_unit"] = true,["matchesShowOn"] = "showOnActive",["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["type"] = "combatlog",["useExactSpellId"] = false,["auraspellids"] = {},["useName"] = true,["unevent"] = "auto",["use_debuffClass"] = false,["use_absorbMode"] = true,["realSpellName"] = 0,["use_spellName"] = false,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "18",["remOperator"] = "<",["subeventPrefix"] = "SPELL",["group_countOperator"] = ">",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["borderOffset"] = 5,["internalVersion"] = 65,["displayTextLeft"] = "%n",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkColor"] = {1,1,1,1,},["stickyDuration"] = false,["customTextUpdate"] = "update",["width"] = 240,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BOOM",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_text_format_destName_abbreviate"] = false,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["border_offset"] = 0,["type"] = "subborder",["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["source"] = "import",["sparkHidden"] = "NEVER",["icon"] = true,["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["semver"] = "1.0.5",["borderInFront"] = false,["borderColor"] = {1,1,1,0.5,},["icon_side"] = "LEFT",["zoom"] = 0,["borderSize"] = 16,["sparkHeight"] = 14,["sparkOffsetX"] = 0,["sparkWidth"] = 3,["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["authorOptions"] = {},["id"] = "5. Unleash Shadowflame CastComplete [BOOM] - Rashok, the Elder",["auto"] = true,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["url"] = "https://echoesports.gg",["backdropColor"] = {1,1,1,0.5,},["inverse"] = false,["stacksFont"] = "Friz Quadrata TT",["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "iAZvK6vLUsb",},["5. Icons - High Priority - Rashok, the Elder"] = {["grow"] = "LEFT",["controlledChildren"] = {"5. Overcharged [BIG DOT] - Rashok, the Elder","5. Searing Slam [LEAP] - Rashok, the Elder","5. Flaming Slash - Rashok, the Elder","5. Earthen Crush - Rashok, the Elder","5. Lava Explosion [HUGE\\nDOT] - Rashok, the Elder","5. Remnant Shadowflame Energy [ABSORB\\n%1.tooltip1] - Rashok, the Elder",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["5. Searing Slam [LEAP] - Rashok, the Elder"] = false,["5. Remnant Shadowflame Energy [ABSORB\n%1.tooltip1] - Rashok, the Elder"] = false,["5. Overcharged [BIG DOT] - Rashok, the Elder"] = false,["5. Earthen Crush - Rashok, the Elder"] = false,["5. Flaming Slash - Rashok, the Elder"] = false,["5. Lava Explosion [HUGE\nDOT] - Rashok, the Elder"] = false,},["echoVersion"] = 1,["fullCircle"] = true,["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 65,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["stagger"] = 0,["radius"] = 200,["subRegions"] = {},["rotation"] = 0,["selfPoint"] = "RIGHT",["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["arcLength"] = 360,["backdropColor"] = {1,1,1,0.5,},["sort"] = "none",["animate"] = false,["borderInset"] = 1,["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["source"] = "import",["anchorPoint"] = "CENTER",["gridWidth"] = 5,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["anchorFrameFrame"] = "WeakAuras:Icon - High Priority - Anchor",["borderOffset"] = 4,["config"] = {},["tocversion"] = 100100,["id"] = "5. Icons - High Priority - Rashok, the Elder",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["parent"] = "5. Rashok, the Elder",["uid"] = "CihVovtvppj",["gridType"] = "RD",["space"] = 2,["borderColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["useLimit"] = false,},["5. Searing Slam [LEAP] - Rashok, the Elder"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"405819",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["useExactSpellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["names"] = {"Sacred Blade",},["group_countOperator"] = ">",["unit"] = "player",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["subeventPrefix"] = "SPELL",["type"] = "aura2",["use_debuffClass"] = false,["unevent"] = "auto",["useName"] = true,["debuffType"] = "HARMFUL",["duration"] = "3",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["custom_type"] = "event",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "LEAP",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_1.tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_text_format_1.tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_visible"] = true,["text_anchorYOffset"] = -6,["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["useGlowColor"] = false,["glow"] = false,["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2680",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["xOffset"] = 0,["parent"] = "5. Icons - High Priority - Rashok, the Elder",["config"] = {},["zoom"] = 0,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["semver"] = "1.0.4",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "5. Searing Slam [LEAP] - Rashok, the Elder",["url"] = "https://echoesports.gg",["alpha"] = 1,["width"] = 55,["useCooldownModRate"] = true,["uid"] = "dwpgPPE8hMT",["inverse"] = false,["color"] = {1,1,1,1,},["stickyDuration"] = false,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["actions"] = {["start"] = {},["init"] = {},["finish"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\shot.ogg",["do_sound"] = false,},},},["5. Doom Flames [DOT] - Rashok, the Elder"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"406152","Doom Flames",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = false,["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbHealMode"] = true,["names"] = {"Sacred Blade",},["duration"] = "3",["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["use_genericShowOn"] = true,["useName"] = true,["custom_type"] = "event",["unevent"] = "auto",["subeventPrefix"] = "SPELL",["auraspellids"] = {},["type"] = "aura2",["buffShowOn"] = "showOnActive",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_unit"] = true,["remOperator"] = "<",["group_countOperator"] = ">",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.ttoltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = true,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2680",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["xOffset"] = 0,["parent"] = "5. Icons - Low Priority - Rashok, the Elder",["uid"] = "A)sw6GUvnc8",["cooldownTextDisabled"] = false,["width"] = 55,["useCooldownModRate"] = true,["auto"] = true,["zoom"] = 0,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "5. Doom Flames [DOT] - Rashok, the Elder",["cooldownEdge"] = false,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["config"] = {},["inverse"] = false,["color"] = {1,1,1,1,},["desaturate"] = false,["displayIcon"] = 3528301,["cooldown"] = true,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},},["5. Searing Slam Bar [LEAP (%2.count) - %1.unitName] - Rashok, the Elder"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 4,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.68235296010971,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2680",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "UStuw6jNRP2",["displayIcon"] = "136111",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "5. Bars - Rashok, the Elder",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["config"] = {},["customTextUpdate"] = "update",["color"] = {},["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 396779,["auranames"] = {"405821","Searing Slam",},["use_genericShowOn"] = true,["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["fetchRole"] = true,["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["custom_type"] = "event",["fetchRaidMark"] = true,["useGroup_count"] = true,["use_absorbHealMode"] = true,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = false,["check"] = "event",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["matchesShowOn"] = "showOnActive",["duration"] = "3",["buffShowOn"] = "showOnActive",["type"] = "aura2",["useName"] = true,["debuffType"] = "HARMFUL",["auraspellids"] = {},["unevent"] = "auto",["spellName"] = 0,["names"] = {"Sacred Blade",},["unit"] = "group",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["subeventPrefix"] = "SPELL",["remOperator"] = "<",["useExactSpellId"] = false,["useAffected"] = true,["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "combatlog",["spellId"] = "405821",["subeventSuffix"] = "_CAST_START",["duration"] = "5",["event"] = "Combat Log",["unit"] = "player",["use_spellId"] = true,["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["sparkColor"] = {1,1,1,1,},["internalVersion"] = 65,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["rotateText"] = "NONE",["stickyDuration"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_custom"] = false,["do_sound"] = false,},["init"] = {["custom"] = "\
\
",["do_custom"] = true,},["finish"] = {},},["width"] = 240,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "LEAP (%2.count) - %1.unitName",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 12,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["text_text_format_2.N_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_text_format_2.count_format"] = "none",["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["text_text"] = "",["type"] = "subborder",["border_anchor"] = "bar",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},},["height"] = 23,["timerFlags"] = "None",["textSize"] = 12,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["sparkRotation"] = 0,["source"] = "import",["sparkHidden"] = "NEVER",["xOffset"] = 0,["semver"] = "1.0.5",["border"] = false,["borderEdge"] = "None",["timer"] = true,["borderInFront"] = false,["timerSize"] = 12,["icon_side"] = "LEFT",["borderBackdrop"] = "Blizzard Tooltip",["sparkWidth"] = 3,["sparkHeight"] = 14,["zoom"] = 0,["borderSize"] = 16,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["sparkRotationMode"] = "AUTO",["id"] = "5. Searing Slam Bar [LEAP (%2.count) - %1.unitName] - Rashok, the Elder",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["backdropColor"] = {1,1,1,0.5,},["spark"] = false,["inverse"] = false,["stacksFont"] = "Friz Quadrata TT",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["borderInset"] = 11,},["5. Doom Flame Cast [SOAKS INC] - Rashok, the Elder"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.49803924560547,1,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2680",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "4914676",["textColor"] = {1,1,1,1,},["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkOffsetX"] = 0,["cooldownTextDisabled"] = false,["parent"] = "5. Bars - Rashok, the Elder",["sparkColor"] = {1,1,1,1,},["adjustedMin"] = "4",["spark"] = false,["cooldown"] = true,["zoom"] = 0,["cooldownSwipe"] = true,["borderOffset"] = 5,["sparkRotationMode"] = "AUTO",["cooldownEdge"] = false,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 406851,["auranames"] = {"Interdimensional Wormhole","362721",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_exact_spellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["useExactSpellId"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["spellName"] = 0,["custom_type"] = "event",["subeventPrefix"] = "SPELL",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["unit"] = "boss",["useName"] = true,["debuffType"] = "HARMFUL",["unevent"] = "auto",["names"] = {"Sacred Blade",},["use_genericShowOn"] = true,["type"] = "unit",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["group_countOperator"] = ">",["use_absorbHealMode"] = true,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["width"] = 240,["internalVersion"] = 65,["adjustedMax"] = "4",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["customText"] = "function()\
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
",["stickyDuration"] = false,["id"] = "5. Doom Flame Cast [SOAKS INC] - Rashok, the Elder",["authorOptions"] = {},["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SOAKS INC",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},},["height"] = 23,["timerFlags"] = "None",["semver"] = "1.0.4",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["timerSize"] = 12,["source"] = "import",["backdropColor"] = {1,1,1,0.5,},["config"] = {},["textFlags"] = "None",["border"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderSize"] = 16,["borderInFront"] = false,["icon_side"] = "LEFT",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["sparkHeight"] = 14,["customTextUpdate"] = "update",["borderColor"] = {1,1,1,0.5,},["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["timer"] = true,["sparkHidden"] = "NEVER",["color"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["url"] = "https://echoesports.gg",["uid"] = "Qonr6iNlIwA",["inverse"] = false,["displayTextLeft"] = "%n",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["borderBackdrop"] = "Blizzard Tooltip",},["5. Overcharged [BIG DOT] - Rashok, the Elder"] = {["iconSource"] = -1,["parent"] = "5. Icons - High Priority - Rashok, the Elder",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"405827","Overcharged",},["duration"] = "3",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["custom_type"] = "event",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["useExactSpellId"] = false,["names"] = {"Sacred Blade",},["use_unit"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["subeventPrefix"] = "SPELL",["type"] = "aura2",["use_absorbHealMode"] = true,["unevent"] = "auto",["useName"] = true,["debuffType"] = "HARMFUL",["matchesShowOn"] = "showOnActive",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["spellName"] = 0,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "BIG DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_1.tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_text_format_1.tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_visible"] = true,["text_anchorYOffset"] = -6,["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_anchorXOffset"] = 7,},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2680",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["actions"] = {["start"] = {},["init"] = {},["finish"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\shot.ogg",["do_sound"] = true,},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["xOffset"] = 0,["color"] = {1,1,1,1,},["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["auto"] = true,["zoom"] = 0,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "5. Overcharged [BIG DOT] - Rashok, the Elder",["cooldownEdge"] = false,["frameStrata"] = 1,["width"] = 55,["useCooldownModRate"] = true,["uid"] = "0t8YrnHfC4E",["inverse"] = false,["authorOptions"] = {},["stickyDuration"] = false,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["selfPoint"] = "CENTER",},["5. Flaming Slash - Rashok, the Elder"] = {["iconSource"] = -1,["parent"] = "5. Icons - High Priority - Rashok, the Elder",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"Flaming Slash","407547",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["use_debuffClass"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["spellName"] = 0,["use_unit"] = true,["duration"] = "3",["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["use_genericShowOn"] = true,["useName"] = true,["group_countOperator"] = ">",["unevent"] = "auto",["debuffType"] = "HARMFUL",["auraspellids"] = {},["type"] = "aura2",["useExactSpellId"] = false,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["subeventPrefix"] = "SPELL",["remOperator"] = "<",["names"] = {"Sacred Blade",},["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "+%1.tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_1.tolltip1_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_s_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.ttoltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = false,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2680",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["source"] = "import",["cooldownEdge"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["authorOptions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "mmGcbzg(SFC",["alpha"] = 1,["width"] = 55,["useCooldownModRate"] = true,["semver"] = "1.0.4",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "5. Flaming Slash - Rashok, the Elder",["zoom"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["desaturate"] = false,["config"] = {},["inverse"] = false,["xOffset"] = 0,["color"] = {1,1,1,1,},["displayIcon"] = 3528301,["cooldown"] = true,["icon"] = true,},["5. Earthen Crush - Rashok, the Elder"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"Earthen Crush","407597",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["use_absorbHealMode"] = true,["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["spellName"] = 0,["useName"] = true,["type"] = "aura2",["unevent"] = "auto",["buffShowOn"] = "showOnActive",["names"] = {"Sacred Blade",},["auraspellids"] = {},["use_genericShowOn"] = true,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["duration"] = "3",["remOperator"] = "<",["group_countOperator"] = ">",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "+%1.tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_1.tolltip1_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_anchorXOffset"] = 7,["anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.ttoltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_visible"] = false,["text_anchorYOffset"] = -6,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_s_format"] = "none",},{["glowFrequency"] = 0.25,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2680",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["url"] = "https://echoesports.gg",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["color"] = {1,1,1,1,},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["semver"] = "1.0.4",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "5. Earthen Crush - Rashok, the Elder",["zoom"] = 0,["useCooldownModRate"] = true,["width"] = 55,["desaturate"] = false,["uid"] = ")KswxqA)IIC",["inverse"] = false,["authorOptions"] = {},["parent"] = "5. Icons - High Priority - Rashok, the Elder",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},},["5. Shadowlava Blast Cast [FRONTAL CONE] - Rashok, the Elder"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.43529415130615,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2680",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "4914680",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "5. Bars - Rashok, the Elder",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["borderInset"] = 11,["sparkRotationMode"] = "AUTO",["stacksFont"] = "Friz Quadrata TT",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 406333,["auranames"] = {"Interdimensional Wormhole","362721",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_exact_spellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["custom_type"] = "event",["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbHealMode"] = true,["use_unit"] = true,["duration"] = "3",["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["use_genericShowOn"] = true,["useName"] = true,["buffShowOn"] = "showOnActive",["auraspellids"] = {},["type"] = "unit",["unevent"] = "auto",["spellName"] = 0,["unit"] = "boss",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["subeventPrefix"] = "SPELL",["remOperator"] = "<",["custom_hide"] = "timed",["useExactSpellId"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["internalVersion"] = 65,["auto"] = true,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["customTextUpdate"] = "update",["stickyDuration"] = false,["uid"] = "LyIG2)IT6No",["width"] = 240,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FRONTAL CONE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_text_format_destName_abbreviate"] = false,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["border_size"] = 1,["type"] = "subborder",["text_text"] = "",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["xOffset"] = 0,["source"] = "import",["sparkHidden"] = "NEVER",["borderColor"] = {1,1,1,0.5,},["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["semver"] = "1.0.5",["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["sparkOffsetX"] = 0,["sparkWidth"] = 3,["sparkHeight"] = 14,["zoom"] = 0,["color"] = {},["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["textSize"] = 12,["id"] = "5. Shadowlava Blast Cast [FRONTAL CONE] - Rashok, the Elder",["rotateText"] = "NONE",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["icon"] = true,["backdropColor"] = {1,1,1,0.5,},["inverse"] = false,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["config"] = {},},["5. Lava Explosion [HUGE\nDOT] - Rashok, the Elder"] = {["iconSource"] = -1,["parent"] = "5. Icons - High Priority - Rashok, the Elder",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"406161","Lava Explosion",},["use_genericShowOn"] = true,["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["useExactSpellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["custom_type"] = "event",["use_absorbHealMode"] = true,["names"] = {"Sacred Blade",},["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["unit"] = "player",["useName"] = true,["type"] = "aura2",["unevent"] = "auto",["duration"] = "3",["matchesShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_unit"] = true,["remOperator"] = "<",["custom_hide"] = "timed",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "HUGE\\nDOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.ttoltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = false,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["glow"] = true,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2680",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["source"] = "import",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["authorOptions"] = {},["uid"] = "0Ce76khHkhe",["zoom"] = 0,["width"] = 55,["useCooldownModRate"] = true,["semver"] = "1.0.4",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "5. Lava Explosion [HUGE\\nDOT] - Rashok, the Elder",["cooldownEdge"] = false,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["config"] = {},["inverse"] = false,["xOffset"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayIcon"] = 3528301,["cooldown"] = true,["stickyDuration"] = false,},["5. Lava Vortex [MOVE] - Rashok, the Elder"] = {["iconSource"] = -1,["parent"] = "5. Icons - Low Priority - Rashok, the Elder",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"406160","Lava Vortex",},["duration"] = "3",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = false,["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["use_absorbHealMode"] = true,["use_tooltip"] = false,["ignoreSelf"] = true,["names"] = {"Sacred Blade",},["use_unit"] = true,["subeventPrefix"] = "SPELL",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["buffShowOn"] = "showOnActive",["useName"] = true,["custom_hide"] = "timed",["auraspellids"] = {},["matchesShowOn"] = "showOnActive",["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["unevent"] = "auto",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["group_countOperator"] = ">",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "MOVE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_1.tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_text_format_tooltip2_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = false,["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2680",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["icon"] = true,["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["xOffset"] = 0,["authorOptions"] = {},["config"] = {},["zoom"] = 0,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["semver"] = "1.0.4",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "5. Lava Vortex [MOVE] - Rashok, the Elder",["url"] = "https://echoesports.gg",["frameStrata"] = 1,["width"] = 55,["useCooldownModRate"] = true,["uid"] = "BbHvMXFVx)m",["inverse"] = false,["color"] = {1,1,1,1,},["desaturate"] = false,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["5. Overcharged List - Rashok, the Elder [PUBLIC]"] = {["grow"] = "DOWN",["sortOn"] = "changed",["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = -616.59359741211,["preferToUpdate"] = false,["yOffset"] = 334.24462890625,["gridType"] = "RD",["fullCircle"] = true,["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["selfPoint"] = "TOP",["align"] = "CENTER",["stagger"] = 0,["authorOptions"] = {},["subRegions"] = {},["rotation"] = 0,["useLimit"] = false,["load"] = {["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["customSort"] = "WeakAuras.ComposeSorts(\
    WeakAuras.SortAscending {\"region\", \"state\", \"queuePos\"}\
)\
\
\
",["backdropColor"] = {1,1,1,0.5,},["space"] = 1,["animate"] = true,["controlledChildren"] = {"5. Overcharged Bar - Rashok, the Elder 5",},["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["sort"] = "custom",["uid"] = "E2yU2owDj4l",["limit"] = 5,["arcLength"] = 360,["frameStrata"] = 1,["constantFactor"] = "RADIUS",["borderInset"] = 1,["borderOffset"] = 4,["sortHybridTable"] = {["5. Overcharged Bar - Rashok, the Elder 5"] = false,},["tocversion"] = 100100,["id"] = "5. Overcharged List - Rashok, the Elder [PUBLIC]",["parent"] = "5. Overcharged Singles - Rashok, the Elder [PUBLIC]",["gridWidth"] = 5,["anchorFrameType"] = "SCREEN",["anchorPoint"] = "CENTER",["config"] = {},["source"] = "import",["borderColor"] = {0,0,0,1,},["internalVersion"] = 65,["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["5. Icons - Low Priority - Rashok, the Elder"] = {["grow"] = "LEFT",["controlledChildren"] = {"5. Doom Flames [DOT] - Rashok, the Elder","5. Lava Vortex [MOVE] - Rashok, the Elder","5. Lava Wave [MOVE] - Rashok, the Elder","5. Scorched Flesh - Rashok, the Elder",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 65,["selfPoint"] = "RIGHT",["align"] = "CENTER",["rotation"] = 0,["space"] = 2,["subRegions"] = {},["stagger"] = 0,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["arcLength"] = 360,["backdropColor"] = {1,1,1,0.5,},["sort"] = "none",["animate"] = false,["borderInset"] = 1,["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Icon - Low Priority - Anchor",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["source"] = "import",["gridType"] = "RD",["gridWidth"] = 5,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["borderEdge"] = "Square Full White",["borderOffset"] = 4,["uid"] = "sMe4BFKlQLL",["tocversion"] = 100100,["id"] = "5. Icons - Low Priority - Rashok, the Elder",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["parent"] = "5. Rashok, the Elder",["config"] = {},["sortHybridTable"] = {["5. Lava Vortex [MOVE] - Rashok, the Elder"] = false,["5. Doom Flames [DOT] - Rashok, the Elder"] = false,["5. Lava Wave [MOVE] - Rashok, the Elder"] = false,["5. Scorched Flesh - Rashok, the Elder"] = false,},["fullCircle"] = true,["radius"] = 200,["conditions"] = {},["information"] = {},["useLimit"] = false,},["5. Overcharged Controller - Rashok, the Elder [PUBLIC]"] = {["outline"] = "OUTLINE",["parent"] = "5. Overcharged Singles - Rashok, the Elder [PUBLIC]",["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {["do_custom"] = true,["custom"] = "aura_env.spellIDs = {\
    [405827] = \"Overcharged\",\
}\
\
aura_env.playerQueue = {}\
aura_env.nextAllowedProcessTime = GetTime()\
\
function aura_env.addPlayerToQueue(playerToAdd)\
    table.insert(aura_env.playerQueue, playerToAdd)\
end\
\
function aura_env.removePlayerFromQueue(playerToRemove)\
    for i, playerName in pairs(aura_env.playerQueue) do\
        if playerName == playerToRemove then\
            table.remove(aura_env.playerQueue, i)\
            break\
        end\
    end\
end\
\
function aura_env.processPlayerQueue(delay)\
    if aura_env.nextAllowedProcessTime > GetTime() then\
        return\
    end\
    \
    aura_env.nextAllowedProcessTime = GetTime() + delay\
    C_Timer.After(delay, function()\
            aura_env.sortPlayerQueue()\
            WeakAuras.ScanEvents(\"ECHO_OVERCHARGED\", aura_env.playerQueue)\
    end)\
end\
\
function aura_env.SortCandidatesByMissingDebuff(candidates, debuff)\
    local originalIndices = tInvert(candidates)\
    table.sort(candidates, function(a, b)\
            local aMissingDebuff = not aura_env.UnitHasDebuff(a, debuff)\
            local bMissingDebuff = not aura_env.UnitHasDebuff(b, debuff)\
            if aMissingDebuff ~= bMissingDebuff then\
                return aMissingDebuff and not bMissingDebuff\
            end\
            return originalIndices[a] < originalIndices[b]\
    end)\
end\
\
function aura_env.sortPlayerQueue()\
    local originalIndices = tInvert(aura_env.playerQueue)\
    table.sort(aura_env.playerQueue, function(a, b)\
            if aura_env.getUnitPriority(a) ~= aura_env.getUnitPriority(b) then\
                return aura_env.getUnitPriority(a) < aura_env.getUnitPriority(b)\
            end\
            return originalIndices[a] < originalIndices[b]\
    end)\
end\
\
function aura_env.getUnitPriority(unit)\
    -- MELEE DPS > RANGED DPS > HEALER > TANK\
    local _, role, pos = WeakAuras.SpecRolePositionForUnit(unit)\
    if role == \"DAMAGER\" then\
        return pos == \"MELEE\" and 0 or 1\
    elseif role == \"HEALER\" then\
        return 2\
    else\
        return 3\
    end\
end",},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["custom_type"] = "event",["event"] = "Health",["subeventPrefix"] = "SPELL",["customDuration"] = "function()end",["custom"] = "function(event, ...)\
    if event == \"ENCOUNTER_START\" or WeakAuras.IsOptionsOpen() then\
        aura_env.playerQueue = {}\
    end\
    \
    if event == \"COMBAT_LOG_EVENT_UNFILTERED\" then\
        local _, subEvent, _, _, _, _, _ , _, destName, _, _, spellID = ...\
        if not aura_env.spellIDs[spellID] then\
            return false\
        end\
        \
        if subEvent == \"SPELL_AURA_APPLIED\" then\
            aura_env.addPlayerToQueue(destName)\
            aura_env.processPlayerQueue(0.1)\
        elseif subEvent == \"SPELL_AURA_REMOVED\" then\
            aura_env.removePlayerFromQueue(destName)\
            aura_env.processPlayerQueue(0)\
        end\
    end\
end",["events"] = "CLEU:SPELL_AURA_APPLIED:SPELL_AURA_REMOVED ENCOUNTER_START ECHO_PROCESS_OVERCHARGED",["names"] = {},["check"] = "event",["spellIds"] = {},["unit"] = "player",["custom_hide"] = "custom",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["internalVersion"] = 65,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desc"] = "Prio list = \"overcharged\"",["font"] = "Friz Quadrata TT",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["class"] = {["multi"] = {},},["encounterid"] = "2680",["use_difficulty"] = true,["instance_type"] = {},["size"] = {["multi"] = {},},},["fontSize"] = 12,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_format"] = "timed",["wordWrap"] = "WordWrap",["fixedWidth"] = 200,["displayText_format_p_time_legacy_floor"] = false,["selfPoint"] = "BOTTOM",["displayText_format_p_time_precision"] = 1,["yOffset"] = 0,["config"] = {["clearingGroupSize"] = 3,},["automaticWidth"] = "Auto",["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "5. Overcharged Controller - Rashok, the Elder [PUBLIC]",["color"] = {1,1,1,1,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {{["type"] = "range",["useDesc"] = true,["max"] = 10,["step"] = 1,["width"] = 2,["min"] = 0,["key"] = "clearingGroupSize",["default"] = 2,["name"] = "Clearing group size",["desc"] = "Number of players who should clear at the same time",},},["uid"] = "fezp8WGWUz2",["xOffset"] = 0,["displayText"] = "",["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,},["5. Ancient Fury cast [ENRAGE] - Rashok, the Elder"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.92549026012421,0.23921570181847,0.23921570181847,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2680",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["zoom"] = 0,["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "JI1PwN40g73",["displayIcon"] = "458971",["textColor"] = {1,1,1,1,},["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["borderBackdrop"] = "Blizzard Tooltip",["sparkOffsetX"] = 0,["parent"] = "5. Bars - Rashok, the Elder",["sparkColor"] = {1,1,1,1,},["adjustedMin"] = "4",["borderInset"] = 11,["borderOffset"] = 5,["cooldownTextDisabled"] = false,["cooldownSwipe"] = true,["displayTextLeft"] = "%n",["sparkRotationMode"] = "AUTO",["cooldownEdge"] = false,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 405316,["auranames"] = {"Interdimensional Wormhole","362721",},["use_genericShowOn"] = true,["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_absorbMode"] = true,["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["custom_type"] = "event",["use_tooltip"] = false,["ignoreSelf"] = true,["spellName"] = 0,["names"] = {"Sacred Blade",},["matchesShowOn"] = "showOnActive",["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["duration"] = "3",["type"] = "unit",["use_debuffClass"] = false,["unevent"] = "auto",["buffShowOn"] = "showOnActive",["useName"] = true,["auraspellids"] = {},["custom_hide"] = "timed",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["unit"] = "boss",["remOperator"] = "<",["use_unit"] = true,["useExactSpellId"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["anchorFrameType"] = "SCREEN",["internalVersion"] = 65,["customText"] = "function()\
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
",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["stacksFlags"] = "None",["stickyDuration"] = false,["sparkHidden"] = "NEVER",["height"] = 23,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "ENRAGE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_fontType"] = "OUTLINE",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["border_anchor"] = "bar",["border_size"] = 1,["text_text"] = "",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["type"] = "subborder",},},["timer"] = true,["timerFlags"] = "None",["timerSize"] = 12,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["displayTextRight"] = "%p",["source"] = "import",["borderColor"] = {1,1,1,0.5,},["customTextUpdate"] = "update",["textFlags"] = "None",["border"] = false,["borderEdge"] = "None",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["borderSize"] = 16,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["icon_side"] = "LEFT",["borderInFront"] = false,["stacksFont"] = "Friz Quadrata TT",["sparkHeight"] = 14,["config"] = {},["backdropColor"] = {1,1,1,0.5,},["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.4",["auto"] = true,["id"] = "5. Ancient Fury cast [ENRAGE] - Rashok, the Elder",["xOffset"] = 0,["frameStrata"] = 1,["width"] = 240,["rotateText"] = "NONE",["color"] = {},["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {},["cooldown"] = true,["barColor2"] = {1,1,0,1,},},["5. Remnant Shadowflame Energy [ABSORB\n%1.tooltip1] - Rashok, the Elder"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"410077","",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["group_countOperator"] = ">",["names"] = {"Sacred Blade",},["unit"] = "player",["spellIds"] = {283573,},["debuffType"] = "BOTH",["use_genericShowOn"] = true,["type"] = "aura2",["duration"] = "3",["unevent"] = "auto",["buffShowOn"] = "showOnActive",["useExactSpellId"] = false,["auraspellids"] = {},["useName"] = true,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["subeventPrefix"] = "SPELL",["remOperator"] = "<",["use_absorbHealMode"] = true,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "ABSORB\\n%1.tooltip1",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.tooltip1_big_number_format"] = "AbbreviateNumbers",["text_anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "BigNumber",["text_text_format_tooltip1_format"] = "none",},{["text_text_format_1.tooltip1_big_number_format"] = "AbbreviateNumbers",["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_fontType"] = "OUTLINE",["text_anchorYOffset"] = -6,["text_text_format_1.tooltip1_round_type"] = "floor",["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "BigNumber",["text_text_format_1.tooltip1_decimal_precision"] = 0,},{["glowFrequency"] = 0.25,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2680",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["xOffset"] = 0,["color"] = {1,1,1,1,},["uid"] = "R0(Dp2Q8ala",["zoom"] = 0,["width"] = 55,["frameStrata"] = 1,["semver"] = "1.0.4",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "5. Remnant Shadowflame Energy [ABSORB\\n%1.tooltip1] - Rashok, the Elder",["cooldownEdge"] = false,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["config"] = {},["inverse"] = false,["parent"] = "5. Icons - High Priority - Rashok, the Elder",["desaturate"] = false,["displayIcon"] = 3528301,["cooldown"] = true,["icon"] = true,},["5. Overcharged Singles - Rashok, the Elder [PUBLIC]"] = {["controlledChildren"] = {"5. Overcharged Controller - Rashok, the Elder [PUBLIC]","5. Overcharged Traffic Light - Rashok, the Elder [PUBLIC]","5. Overcharged List - Rashok, the Elder [PUBLIC]",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 4,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["unit"] = "player",["names"] = {},["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["internalVersion"] = 65,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "5. Overcharged Singles - Rashok, the Elder [PUBLIC]",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["config"] = {},["uid"] = "Va40FM3Ec53",["parent"] = "5. Singles - Rashok, the Elder",["borderInset"] = 1,["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["5. Singles - Rashok, the Elder"] = {["controlledChildren"] = {"5. Searing Slam Progress Circle - Rashok, the Elder","5. Searing Slam Raid Frame Glow - Rashok, the Elder","5. Energy Count down - Rashok, the Elder","5. Overcharged Singles - Rashok, the Elder [PUBLIC]",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["internalVersion"] = 65,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["anchorFrameFrame"] = "WeakAuras:Singles - Anchor",["regionType"] = "group",["borderSize"] = 2,["anchorFrameParent"] = false,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "5. Singles - Rashok, the Elder",["xOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {},["parent"] = "5. Rashok, the Elder",["borderInset"] = 1,["uid"] = "BaIn1Tc5YBb",["conditions"] = {},["information"] = {},["borderEdge"] = "Square Full White",},["5. Scorched Flesh - Rashok, the Elder"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"408204","Scorched Flesh",},["use_genericShowOn"] = true,["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["spellName"] = 0,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["subeventPrefix"] = "SPELL",["use_tooltip"] = false,["ignoreSelf"] = true,["group_countOperator"] = ">",["unit"] = "player",["matchesShowOn"] = "showOnActive",["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["useName"] = true,["custom_type"] = "event",["auraspellids"] = {},["type"] = "aura2",["unevent"] = "auto",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "3",["remOperator"] = "<",["use_unit"] = true,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "+%1.tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.ttoltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = true,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2680",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["icon"] = true,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["authorOptions"] = {},["parent"] = "5. Icons - Low Priority - Rashok, the Elder",["uid"] = "b02r7PGM9sE",["cooldownTextDisabled"] = false,["width"] = 55,["alpha"] = 1,["auto"] = true,["zoom"] = 0,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "5. Scorched Flesh - Rashok, the Elder",["cooldownEdge"] = false,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["config"] = {},["inverse"] = false,["xOffset"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayIcon"] = 3528301,["cooldown"] = true,["stickyDuration"] = false,},["5. Charged Smash Cast [BIG SOAK] - Rashok, the Elder"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["do_custom"] = false,},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.20784315466881,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2680",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "4914677",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "5. Bars - Rashok, the Elder",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["config"] = {},["customTextUpdate"] = "update",["spark"] = false,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 400777,["auranames"] = {"Interdimensional Wormhole","362721",},["duration"] = "3",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["custom_type"] = "event",["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["spellName"] = 0,["names"] = {"Sacred Blade",},["matchesShowOn"] = "showOnActive",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["use_absorbMode"] = true,["type"] = "unit",["use_debuffClass"] = false,["auraspellids"] = {},["buffShowOn"] = "showOnActive",["unit"] = "boss",["useName"] = true,["unevent"] = "auto",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["subeventPrefix"] = "SPELL",["subeventSuffix"] = "_CAST_START",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["borderOffset"] = 5,["internalVersion"] = 65,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["easeStrength"] = 3,["rotate"] = 0,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkRotationMode"] = "AUTO",["stickyDuration"] = false,["sparkColor"] = {1,1,1,1,},["anchorFrameType"] = "SCREEN",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BIG SOAK",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_text_format_destName_abbreviate"] = false,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["border_offset"] = 0,["type"] = "subborder",["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["height"] = 23,["timerFlags"] = "None",["timer"] = true,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["authorOptions"] = {},["source"] = "import",["id"] = "5. Charged Smash Cast [BIG SOAK] - Rashok, the Elder",["borderColor"] = {1,1,1,0.5,},["timerSize"] = 12,["border"] = false,["borderEdge"] = "None",["displayTextRight"] = "%p",["borderInFront"] = false,["zoom"] = 0,["icon_side"] = "LEFT",["sparkWidth"] = 3,["sparkOffsetX"] = 0,["sparkHeight"] = 14,["borderSize"] = 16,["color"] = {},["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["displayTextLeft"] = "%n",["sparkHidden"] = "NEVER",["url"] = "https://echoesports.gg",["frameStrata"] = 1,["width"] = 240,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["backdropColor"] = {1,1,1,0.5,},["inverse"] = false,["icon"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["uid"] = "iOX(PQDsh13",},["5. Overcharged Bar - Rashok, the Elder 5"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = 0,["authorOptions"] = {{["type"] = "range",["useDesc"] = true,["max"] = 10,["step"] = 1,["width"] = 2,["min"] = 0,["key"] = "clearingGroupSize",["desc"] = "Number of players who should clear at the same time",["name"] = "Clearing group size",["default"] = 2,},},["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {},["finish"] = {},["init"] = {["do_custom"] = true,["custom"] = "function aura_env.getTrafficLightColor(queuePos)\
    if queuePos <= aura_env.config.clearingGroupSize then\
        return \"GREEN\"\
    elseif queuePos <= (aura_env.config.clearingGroupSize * 2) then\
        return \"YELLOW\"\
    end\
    return \"RED\"\
end",},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.21960785984993,1,0.36078432202339,0.64413511753082,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["instance_type"] = {},["class"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["spec"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["use_difficulty"] = true,["encounterid"] = "2680",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = false,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Clean",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "sc4sW1g78eP",["displayIcon"] = 4914675,["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["color"] = {},["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["config"] = {["clearingGroupSize"] = 3,},["sparkRotationMode"] = "AUTO",["stacksFont"] = "Friz Quadrata TT",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["showClones"] = false,["useName"] = false,["customVariables"] = "{\
    queuePos = \"number\",\
    color = \"string\",\
}\
\
\
",["subeventSuffix"] = "_CAST_START",["custom_type"] = "stateupdate",["names"] = {},["event"] = "Health",["subeventPrefix"] = "SPELL",["auranames"] = {},["events"] = "ECHO_OVERCHARGED",["spellIds"] = {},["custom"] = "function(allstates, event, ...)\
    local playerQueue = {}\
    \
    if WeakAuras.IsOptionsOpen() then\
        playerQueue = { \"player\", \"player1\", \"player2\", \"player3\", \"player4\", \"player5\", \"player6\", \"player7\", \"player8\" }\
    elseif event == \"ECHO_OVERCHARGED\" and ... then\
        playerQueue = ...\
    else\
        return false\
    end\
    \
    for _, state in pairs(allstates) do\
        state.show = false\
        state.changed = true\
    end\
    \
    for i, playerName in ipairs(playerQueue) do\
        allstates[playerName] = {\
            show = true,\
            changed = true,\
            unit = playerName,\
            queuePos = i,\
            color = aura_env.getTrafficLightColor(i),\
            progressType = \"static\",\
            value = 1,\
            total = 1,\
        }\
    end\
    \
    return true\
end",["check"] = "event",["type"] = "custom",["unit"] = "group",["debuffType"] = "BOTH",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["unit"] = "player",["use_stage"] = true,["event"] = "BigWigs Stage",["stage_operator"] = "<",["stage"] = "3",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 65,["timer"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "preset",["easeType"] = "none",["duration_type"] = "seconds",["easeStrength"] = 3,["preset"] = "slideleft",},},["backdropInFront"] = false,["text"] = true,["url"] = "https://echoesports.gg",["stickyDuration"] = false,["borderColor"] = {1,1,1,0.5,},["width"] = 140,["customTextUpdate"] = "update",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_text_format_p_time_precision"] = 1,["text_text"] = "%1.queuePos",["text_text_format_p_format"] = "timed",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_1.queuePosition_format"] = "none",["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_fixedWidth"] = 64,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,["type"] = "subtext",["text_text_format_p_time_format"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_shadowColor"] = {0,0,0,1,},["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_RIGHT",["anchorYOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 16,["anchorXOffset"] = 0,["text_text_format_1.queuePos_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text"] = "%1.unit",["text_text_format_1.unit_abbreviate_max"] = 7,["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unit_format"] = "Unit",["text_text_format_1.unit_abbreviate"] = true,["text_text_format_1.unitName_color"] = "class",["text_text_format_1.unit_realm_name"] = "never",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_font"] = "Friz Quadrata TT",["text_text_format_1.unitName_format"] = "Unit",["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_destName_abbreviate_max"] = 8,["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unit_color"] = "class",["text_fontType"] = "None",["text_text_format_1.unitName_abbreviate"] = true,},{["border_anchor"] = "bar",["type"] = "subborder",["text_text"] = "",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 2,},},["height"] = 21,["timerFlags"] = "None",["backdropColor"] = {1,1,1,0.5,},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["id"] = "5. Overcharged Bar - Rashok, the Elder 5",["source"] = "import",["customText"] = "function()\
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
",["timerSize"] = 12,["auto"] = true,["border"] = false,["borderEdge"] = "None",["xOffset"] = 0,["borderSize"] = 16,["sparkOffsetX"] = 0,["icon_side"] = "LEFT",["sparkColor"] = {1,1,1,1,},["icon"] = true,["sparkHeight"] = 14,["borderInFront"] = false,["borderInset"] = 11,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["sparkWidth"] = 3,["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["displayTextLeft"] = "%n",["backgroundColor"] = {0.95686280727386,1,0.95294123888016,0.63229152560234,},["inverse"] = false,["borderOffset"] = 5,["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["value"] = "GREEN",["op"] = "==",["trigger"] = 1,["variable"] = "color",},["linked"] = false,["changes"] = {{["value"] = {0.050980396568775,1,0.3098039329052,0.74479070305824,},["property"] = "barColor",},},},{["check"] = {["op"] = "==",["checks"] = {{["value"] = "3",["op"] = ">",["trigger"] = 1,["variable"] = "queuePosition",},{["value"] = "6",["op"] = "<=",["trigger"] = 1,["variable"] = "queuePosition",},},["value"] = "YELLOW",["variable"] = "color",["trigger"] = 1,},["linked"] = true,["changes"] = {{["value"] = {1,0.96078437566757,0,0.74000000953674,},["property"] = "barColor",},},},{["check"] = {["value"] = "RED",["op"] = "==",["trigger"] = 1,["variable"] = "color",},["linked"] = true,["changes"] = {{["value"] = {1,0.16470588743687,0,0.74000000953674,},["property"] = "barColor",},},},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "5. Overcharged List - Rashok, the Elder [PUBLIC]",},["5. Searing Slam Raid Frame Glow - Rashok, the Elder"] = {["glow"] = false,["text1FontSize"] = 12,["authorOptions"] = {},["displayText"] = " ",["yOffset"] = -36.000030517578,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["glow_lines"] = 8,["glow_thickness"] = 2,["glow_XOffset"] = 1,["glow_scale"] = 1,["glow_action"] = "show",["glow_color"] = {0.92941176470588,0.92941176470588,0,1,},["glow_frequency"] = 0.25,["glow_type"] = "Pixel",["glow_frame_type"] = "UNITFRAME",["do_glow"] = true,["use_glow_color"] = true,["do_custom"] = false,["glow_YOffset"] = 1,},["init"] = {["do_custom"] = false,},["finish"] = {["glow_frame_type"] = "UNITFRAME",["hide_all_glows"] = true,["glow_action"] = "hide",["do_custom"] = false,["do_glow"] = true,},},["text2Font"] = "Friz Quadrata TT",["selfPoint"] = "CENTER",["text1Containment"] = "INSIDE",["text1Point"] = "CENTER",["text2FontFlags"] = "OUTLINE",["load"] = {["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["zoneIds"] = "",["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["encounterid"] = "2680",["pvptalent"] = {["multi"] = {},},["role"] = {["multi"] = {},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["size"] = {["multi"] = {["twenty"] = true,["flexible"] = true,},},},["shadowXOffset"] = 1,["text1FontFlags"] = "OUTLINE",["regionType"] = "text",["text2FontSize"] = 24,["text2"] = "%p",["auto"] = false,["tocversion"] = 100100,["text2Enabled"] = false,["uid"] = "DxGok52l)t(",["fixedWidth"] = 200,["outline"] = "OUTLINE",["color"] = {1,1,1,1,},["customText"] = "\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["shadowYOffset"] = -1,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["triggers"] = {[1] = {["trigger"] = {["useStacks"] = false,["useGroup_count"] = false,["groupclone"] = true,["matchesShowOn"] = "showOnActive",["name_info"] = "aura",["use_specific_unit"] = false,["names"] = {"Putrid Paroxysm","Absorbed in Darkness","Gestate","Roiling Deceit","Imminent Ruin","Unleashed Shadow","Deathwish","Torment",},["use_tooltip"] = false,["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",["duration"] = "1",["stacksOperator"] = ">=",["custom_type"] = "stateupdate",["buffShowOn"] = "showOnActive",["showClones"] = true,["useName"] = true,["use_debuffClass"] = false,["unevent"] = "timed",["useExactSpellId"] = false,["type"] = "aura2",["event"] = "Health",["subeventSuffix"] = "_CAST_START",["unit"] = "group",["auraspellids"] = {"1",},["spellIds"] = {262314,274387,265212,265360,272536,276672,274271,267427,},["auranames"] = {"405819","Searing Slam",},["check"] = "update",["combineMatches"] = "showLowest",["stacks"] = "6",["custom_hide"] = "timed",},["untrigger"] = {},},["disjunctive"] = "any",["customTriggerLogic"] = "",["activeTriggerMode"] = 1,},["internalVersion"] = 65,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["version"] = 15,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["height"] = 11.99995803833,["fontSize"] = 12,["text2Containment"] = "INSIDE",["text1Color"] = {1,1,1,1,},["preferToUpdate"] = false,["xOffset"] = -542.00009155273,["text2Color"] = {1,1,1,1,},["displayIcon"] = 841384,["source"] = "import",["text2Point"] = "CENTER",["parent"] = "5. Singles - Rashok, the Elder",["zoom"] = 0,["icon"] = true,["text1"] = "%n",["text1Enabled"] = true,["width"] = 6.9999866485596,["wordWrap"] = "WordWrap",["justify"] = "LEFT",["config"] = {},["id"] = "5. Searing Slam Raid Frame Glow - Rashok, the Elder",["text1Font"] = "Friz Quadrata TT",["frameStrata"] = 9,["anchorFrameType"] = "SCREEN",["desaturate"] = false,["font"] = "Friz Quadrata TT",["inverse"] = false,["semver"] = "1.0.14",["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["cooldownTextDisabled"] = false,},});


-- 5. manifest data

journal:AddManifestData({
	{
		["echoVersion"] = 10,
		["parent"] = "!Echo - Aberrus",
		["id"] = "5. Rashok, the Elder",
		["children"] = {
			"5. Singles - Rashok, the Elder",
			"5. Bars - Rashok, the Elder",
			"5. Icons - Low Priority - Rashok, the Elder",
			"5. Icons - High Priority - Rashok, the Elder",
		},
		["uid"] = "kMweva(DkC9",
	},
	{
		["echoVersion"] = 2,
		["parent"] = "5. Rashok, the Elder",
		["id"] = "5. Singles - Rashok, the Elder",
		["children"] = {
			"5. Overcharged Singles - Rashok, the Elder [PUBLIC]",
			"5. Energy Count down - Rashok, the Elder",
			"5. Searing Slam Raid Frame Glow - Rashok, the Elder",
			"5. Searing Slam Progress Circle - Rashok, the Elder",
		},
		["uid"] = "BaIn1Tc5YBb",
	},
	{
		["echoVersion"] = 4,
		["parent"] = "5. Singles - Rashok, the Elder",
		["id"] = "5. Overcharged Singles - Rashok, the Elder [PUBLIC]",
		["children"] = {
			"5. Overcharged List - Rashok, the Elder [PUBLIC]",
			"5. Overcharged Traffic Light - Rashok, the Elder [PUBLIC]",
			"5. Overcharged Controller - Rashok, the Elder [PUBLIC]",
		},
		["uid"] = "Va40FM3Ec53",
	},
	{
		["echoVersion"] = 0,
		["parent"] = "5. Overcharged Singles - Rashok, the Elder [PUBLIC]",
		["id"] = "5. Overcharged List - Rashok, the Elder [PUBLIC]",
		["children"] = {
			"5. Overcharged Bar - Rashok, the Elder 5",
		},
		["uid"] = "E2yU2owDj4l",
	},
	{
		["id"] = "5. Overcharged Bar - Rashok, the Elder 5",
		["uid"] = "sc4sW1g78eP",
		["parent"] = "5. Overcharged List - Rashok, the Elder [PUBLIC]",
		["echoVersion"] = 0,
	},
	{
		["id"] = "5. Overcharged Traffic Light - Rashok, the Elder [PUBLIC]",
		["uid"] = "1m18LUz1C(l",
		["parent"] = "5. Overcharged Singles - Rashok, the Elder [PUBLIC]",
		["echoVersion"] = 5,
	},
	{
		["id"] = "5. Overcharged Controller - Rashok, the Elder [PUBLIC]",
		["uid"] = "fezp8WGWUz2",
		["parent"] = "5. Overcharged Singles - Rashok, the Elder [PUBLIC]",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Energy Count down - Rashok, the Elder",
		["uid"] = "V(4c3)8NHIY",
		["parent"] = "5. Singles - Rashok, the Elder",
		["echoVersion"] = 14,
	},
	{
		["id"] = "5. Searing Slam Raid Frame Glow - Rashok, the Elder",
		["uid"] = "DxGok52l)t(",
		["parent"] = "5. Singles - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Searing Slam Progress Circle - Rashok, the Elder",
		["uid"] = "7jAYjUKcxFI",
		["parent"] = "5. Singles - Rashok, the Elder",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "5. Rashok, the Elder",
		["id"] = "5. Bars - Rashok, the Elder",
		["children"] = {
			"5. Flaming Upsurge Cast [FLAMING SLASH] - Rashok, the Elder",
			"5. Earthen Crush Cast [EARTHEN CRUSH] - Rashok, the Elder",
			"5. Unleash Shadowflame CastComplete [BOOM] - Rashok, the Elder",
			"5. Unleash Shadowflame Cast [LOOK ORBS] - Rashok, the Elder",
			"5. Charged Smash Cast [BIG SOAK] - Rashok, the Elder",
			"5. Shadowlava Blast Cast [FRONTAL CONE] - Rashok, the Elder",
			"5. Doom Flame - Time to soak [SOAKS LANDING] - Rashok, the Elder",
			"5. Doom Flame Cast [SOAKS INC] - Rashok, the Elder",
			"5. Searing Slam Bar [LEAP (%2.count) - %1.unitName] - Rashok, the Elder",
			"5. Ancient Fury cast [ENRAGE] - Rashok, the Elder",
		},
		["uid"] = "uM4zRcy9ZTv",
	},
	{
		["id"] = "5. Flaming Upsurge Cast [FLAMING SLASH] - Rashok, the Elder",
		["uid"] = "Icdk2feuRLy",
		["parent"] = "5. Bars - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Earthen Crush Cast [EARTHEN CRUSH] - Rashok, the Elder",
		["uid"] = "pc1rPD4AjR3",
		["parent"] = "5. Bars - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Unleash Shadowflame CastComplete [BOOM] - Rashok, the Elder",
		["uid"] = "iAZvK6vLUsb",
		["parent"] = "5. Bars - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Unleash Shadowflame Cast [LOOK ORBS] - Rashok, the Elder",
		["uid"] = "QJ)90K0wrLf",
		["parent"] = "5. Bars - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Charged Smash Cast [BIG SOAK] - Rashok, the Elder",
		["uid"] = "iOX(PQDsh13",
		["parent"] = "5. Bars - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Shadowlava Blast Cast [FRONTAL CONE] - Rashok, the Elder",
		["uid"] = "LyIG2)IT6No",
		["parent"] = "5. Bars - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Doom Flame - Time to soak [SOAKS LANDING] - Rashok, the Elder",
		["uid"] = "n6sVceYDCgv",
		["parent"] = "5. Bars - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Doom Flame Cast [SOAKS INC] - Rashok, the Elder",
		["uid"] = "Qonr6iNlIwA",
		["parent"] = "5. Bars - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Searing Slam Bar [LEAP (%2.count) - %1.unitName] - Rashok, the Elder",
		["uid"] = "UStuw6jNRP2",
		["parent"] = "5. Bars - Rashok, the Elder",
		["echoVersion"] = 4,
	},
	{
		["id"] = "5. Ancient Fury cast [ENRAGE] - Rashok, the Elder",
		["uid"] = "JI1PwN40g73",
		["parent"] = "5. Bars - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "5. Rashok, the Elder",
		["id"] = "5. Icons - Low Priority - Rashok, the Elder",
		["children"] = {
			"5. Scorched Flesh - Rashok, the Elder",
			"5. Lava Wave [MOVE] - Rashok, the Elder",
			"5. Lava Vortex [MOVE] - Rashok, the Elder",
			"5. Doom Flames [DOT] - Rashok, the Elder",
		},
		["uid"] = "sMe4BFKlQLL",
	},
	{
		["id"] = "5. Scorched Flesh - Rashok, the Elder",
		["uid"] = "b02r7PGM9sE",
		["parent"] = "5. Icons - Low Priority - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Lava Wave [MOVE] - Rashok, the Elder",
		["uid"] = "yFFh2K7qy1P",
		["parent"] = "5. Icons - Low Priority - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Lava Vortex [MOVE] - Rashok, the Elder",
		["uid"] = "BbHvMXFVx)m",
		["parent"] = "5. Icons - Low Priority - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Doom Flames [DOT] - Rashok, the Elder",
		["uid"] = "A)sw6GUvnc8",
		["parent"] = "5. Icons - Low Priority - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "5. Rashok, the Elder",
		["id"] = "5. Icons - High Priority - Rashok, the Elder",
		["children"] = {
			"5. Remnant Shadowflame Energy [ABSORB\\n%1.tooltip1] - Rashok, the Elder",
			"5. Lava Explosion [HUGE\\nDOT] - Rashok, the Elder",
			"5. Earthen Crush - Rashok, the Elder",
			"5. Flaming Slash - Rashok, the Elder",
			"5. Searing Slam [LEAP] - Rashok, the Elder",
			"5. Overcharged [BIG DOT] - Rashok, the Elder",
		},
		["uid"] = "CihVovtvppj",
	},
	{
		["id"] = "5. Remnant Shadowflame Energy [ABSORB\\n%1.tooltip1] - Rashok, the Elder",
		["uid"] = "R0(Dp2Q8ala",
		["parent"] = "5. Icons - High Priority - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Lava Explosion [HUGE\\nDOT] - Rashok, the Elder",
		["uid"] = "0Ce76khHkhe",
		["parent"] = "5. Icons - High Priority - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Earthen Crush - Rashok, the Elder",
		["uid"] = ")KswxqA)IIC",
		["parent"] = "5. Icons - High Priority - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Flaming Slash - Rashok, the Elder",
		["uid"] = "mmGcbzg(SFC",
		["parent"] = "5. Icons - High Priority - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Searing Slam [LEAP] - Rashok, the Elder",
		["uid"] = "dwpgPPE8hMT",
		["parent"] = "5. Icons - High Priority - Rashok, the Elder",
		["echoVersion"] = 1,
	},
	{
		["id"] = "5. Overcharged [BIG DOT] - Rashok, the Elder",
		["uid"] = "0t8YrnHfC4E",
		["parent"] = "5. Icons - High Priority - Rashok, the Elder",
		["echoVersion"] = 1,
	},
},1208,0);

--fixUpNestedPreview(5,1208,"5. Rashok, the Elder");