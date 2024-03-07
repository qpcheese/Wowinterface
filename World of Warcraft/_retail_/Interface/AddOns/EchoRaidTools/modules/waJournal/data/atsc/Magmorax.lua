local _AddonName, _EchoRaidTools = ...;

local journal = _EchoRaidTools:GetModule("waJournal");

-- 7. export data

journal:AddImportData({["7. Overpowering Stomp Countdown - Magmorax"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["displayText_format_p_time_mod_rate"] = true,["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.070588238537312,1,0,1,},["desaturate"] = false,["font"] = "Friz Quadrata TT",["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2683",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["shadowXOffset"] = 1,["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "text",["stacks"] = true,["preferToUpdate"] = false,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100100,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["stacksFont"] = "Friz Quadrata TT",["orientation"] = "HORIZONTAL",["sparkColor"] = {1,1,1,1,},["uid"] = "WzKU6LadS8o",["config"] = {},["wordWrap"] = "WordWrap",["fixedWidth"] = 200,["borderBackdrop"] = "Blizzard Tooltip",["textColor"] = {1,1,1,1,},["outline"] = "OUTLINE",["anchorFrameType"] = "SCREEN",["sparkOffsetX"] = 0,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["parent"] = "7. Singles - Magmorax",["displayText_format_p_time_format"] = 0,["customText"] = "function()\
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
",["shadowYOffset"] = -1,["id"] = "7. Overpowering Stomp Countdown - Magmorax",["customTextUpdate"] = "update",["timerSize"] = 12,["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["do_custom"] = false,},},["sparkRotationMode"] = "AUTO",["automaticWidth"] = "Auto",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 403671,["auranames"] = {"Advanced Recombobulation","362732",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = true,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_debuffClass"] = false,["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["unit"] = "boss",["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbMode"] = true,["subeventPrefix"] = "SPELL",["use_unit"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["custom_type"] = "event",["type"] = "unit",["useName"] = true,["unevent"] = "auto",["auraspellids"] = {},["debuffType"] = "HARMFUL",["custom_hide"] = "timed",["useExactSpellId"] = false,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["duration"] = "3",["remOperator"] = "<",["use_genericShowOn"] = true,["spellName"] = 0,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 65,["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["easeStrength"] = 3,["rotate"] = 0,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["displayText_format_p_time_dynamic_threshold"] = 60,["stickyDuration"] = false,["sparkHeight"] = 14,["borderInset"] = 11,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["timer"] = true,["timerFlags"] = "None",["sparkWidth"] = 3,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["fontSize"] = 12,["source"] = "import",["useAdjustededMax"] = false,["semver"] = "1.0.5",["borderSize"] = 16,["border"] = false,["borderEdge"] = "None",["displayTextRight"] = "%p",["borderInFront"] = false,["sparkRotation"] = 0,["icon_side"] = "LEFT",["url"] = "https://echoesports.gg",["height"] = 23,["displayText_format_p_time_precision"] = 1,["authorOptions"] = {},["displayText"] = "",["stacksColor"] = {1,1,1,1,},["justify"] = "LEFT",["icon_color"] = {1,1,1,1,},["sparkHidden"] = "NEVER",["displayTextLeft"] = "%n",["frameStrata"] = 1,["width"] = 240,["auto"] = true,["color"] = {1,1,1,1,},["inverse"] = false,["borderOffset"] = 5,["shadowColor"] = {0,0,0,1,},["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["value"] = "2",["op"] = "<",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\Amy\\2.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["op"] = "<",["value"] = "1",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\Amy\\1.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},},["barColor2"] = {1,1,0,1,},["zoom"] = 0,},["7. Molten Spittle List - Magmorax"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.80784320831299,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["class"] = {["single"] = "HUNTER",["multi"] = {["HUNTER"] = true,},},["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["single"] = 2,["multi"] = {true,},},["encounterid"] = "2683",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "7. Scripe List - Magmorax",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "WBoHErc8o(8",["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["showClones"] = true,["type"] = "aura2",["auranames"] = {"402994",},["event"] = "Health",["unit"] = "raid",["useExactSpellId"] = false,["auraspellids"] = {},["spellIds"] = {},["names"] = {},["subeventPrefix"] = "SPELL",["useName"] = true,["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["color"] = {},["internalVersion"] = 65,["spark"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["duration"] = "0",["alphaType"] = "custom",["colorA"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["scalex"] = 1,["colorB"] = 1,["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["textSize"] = 12,["stickyDuration"] = false,["actions"] = {["start"] = {["do_message"] = false,["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Bleat.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["anchorFrameType"] = "SCREEN",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_text"] = "",["type"] = "subborder",["border_anchor"] = "bar",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["type"] = "subtext",["anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_time_format"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 14,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%1.unitName",["text_text_format_1.unitName_color"] = "class",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_text_format_1.unitName_abbreviate"] = false,["rotateText"] = "NONE",["type"] = "subtext",["text_text_format_1.unitName_abbreviate_max"] = 8,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_affected_format"] = "none",["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_justify"] = "CENTER",},},["timer"] = true,["timerFlags"] = "None",["backgroundColor"] = {0,0,0,0.43975883722305,},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["customTextUpdate"] = "update",["source"] = "import",["id"] = "7. Molten Spittle List - Magmorax",["sparkRotation"] = 0,["semver"] = "1.0.5",["border"] = false,["borderEdge"] = "None",["authorOptions"] = {},["borderSize"] = 16,["timerSize"] = 12,["icon_side"] = "LEFT",["backdropColor"] = {1,1,1,0.5,},["stacksFont"] = "Friz Quadrata TT",["sparkHeight"] = 14,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["borderInFront"] = false,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["textFlags"] = "None",["sparkHidden"] = "NEVER",["rotateText"] = "NONE",["frameStrata"] = 4,["width"] = 200,["zoom"] = 0,["height"] = 20,["inverse"] = false,["sparkOffsetX"] = 0,["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "spellId",["value"] = "411149",["op"] = "==",},["changes"] = {{["value"] = {1,0,0.039215687662363,1,},["property"] = "barColor",},},},},["barColor2"] = {0.678431391716,0,0.047058828175068,1,},["config"] = {},},["7. Scripe List - Magmorax"] = {["arcLength"] = 360,["controlledChildren"] = {"7. Molten Spittle List - Magmorax",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "7. Scripe Group (anchored)",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["unit"] = "player",["names"] = {},["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 65,["useLimit"] = false,["align"] = "CENTER",["stagger"] = 0,["radius"] = 200,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["rowSpace"] = 1,["source"] = "import",["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["customSort"] = "WeakAuras.ComposeSorts(\
  WeakAuras.SortAscending{\"dataIndex\"},\
  WeakAuras.SortDescending{\"region\", \"state\", \"expirationTime\"}\
)",["backdropColor"] = {1,1,1,0.5,},["borderEdge"] = "Square Full White",["animate"] = false,["borderInset"] = 1,["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Scripe Lists - Anchor",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["xOffset"] = 180,["selfPoint"] = "TOP",["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["fullCircle"] = true,["borderOffset"] = 4,["config"] = {},["tocversion"] = 100100,["id"] = "7. Scripe List - Magmorax",["grow"] = "DOWN",["gridWidth"] = 5,["anchorFrameType"] = "SCREEN",["sort"] = "custom",["uid"] = "NRutzqananr",["authorOptions"] = {},["sortHybridTable"] = {["7. Molten Spittle List - Magmorax"] = false,},["gridType"] = "RD",["conditions"] = {},["information"] = {},["rotation"] = 0,},["7. Incinerating Maws - Magmorax"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"401348","Incinerating Maws",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbHealMode"] = true,["unit"] = "player",["use_genericShowOn"] = true,["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["useExactSpellId"] = false,["type"] = "aura2",["useName"] = true,["auraspellids"] = {},["unevent"] = "auto",["names"] = {"Sacred Blade",},["debuffType"] = "HARMFUL",["subeventPrefix"] = "SPELL",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "3",["remOperator"] = "<",["group_countOperator"] = ">",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "+%1.tooltip3%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_1.tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_1.toltip1_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_fontType"] = "OUTLINE",["text_shadowYOffset"] = -1,["text_text_format_1.toltip3_format"] = "none",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_anchorXOffset"] = 7,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_1.tooltip3_format"] = "none",},{["glowFrequency"] = 0.1,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2683",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["xOffset"] = 0,["parent"] = "7. Icons - High Priority - Magmorax",["uid"] = "rEccWuYDT)m",["cooldownTextDisabled"] = false,["width"] = 55,["frameStrata"] = 1,["semver"] = "1.0.4",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["id"] = "7. Incinerating Maws - Magmorax",["url"] = "https://echoesports.gg",["alpha"] = 1,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["config"] = {},["inverse"] = false,["color"] = {1,1,1,1,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayIcon"] = 3528301,["cooldown"] = true,["desaturate"] = false,},["7. Lava Ejection Assigner - Magmorax"] = {["outline"] = "OUTLINE",["color"] = {0.85098046064377,0.20784315466881,0.10980392992496,1,},["preferToUpdate"] = false,["customText"] = "function()\
    if not WeakAuras.IsOptionsOpen() then\
        if not aura_env.last or aura_env.last < GetTime() - 1.5 then\
            aura_env.last = GetTime()\
            SendChatMessage(\"CATCHER\")\
        end\
    end\
end",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 19,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["do_sound"] = true,},["finish"] = {},["init"] = {["do_custom"] = true,["custom"] = "local keyword = \"catcher\"\
local backupWord = \"backup\"\
\
local spell = 413367 --\"Lava Ejection\" -- maybe change to a spellID later when we get one?\
\
function aura_env.TryReadNote()\
    aura_env.initialized = false;\
    aura_env.rotations = {};\
    aura_env.numGroups = 0\
    \
    aura_env.backups = {}\
    \
    local noteData, errorString = EchoInternal:ReadEXRTNote();\
    if(errorString)then\
        print(\"Note parse failed,\",errorString);\
        elogl(\"Note parsing failed:\",errorString);\
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
        elseif noteInfo.identifier == backupWord then\
            for rotationIdx,rotation in ipairs(noteInfo.rotation)do\
                for _,guy in ipairs(rotation)do\
                    table.insert(aura_env.backups,guy);\
                end\
            end\
        end\
    end\
    \
    aura_env.numGroups = #aura_env.rotations\
    \
    elogl(\"Lava Ejection Init successful:\",aura_env.numGroups, #aura_env.rotations[1], #aura_env.rotations[2],  #aura_env.rotations[3], #aura_env.backups)\
    aura_env.initialized = true;\
end\
\
aura_env.notReady = function(unit)\
    local _, _, _, _, dur, exp = WA_GetUnitDebuff(unit, spell)\
    if exp and exp > (GetTime() + 10) then elogl(\"ejection report:\",unit, exp - GetTime()) end\
    return (UnitIsDead(unit) and not UnitIsFeignDeath(unit)) or (exp and exp > (GetTime() + 10))\
end\
\
local marks = {4,5,6,7}\
aura_env.setMark = function(unit, index)\
    if UnitIsGroupLeader(\"player\") then\
        SetRaidTarget(unit, marks[index])\
        C_Timer.After(10, function() SetRaidTarget(unit, 0) end)\
    end\
end",},},["triggers"] = {[1] = {["trigger"] = {["type"] = "addons",["spellId"] = "403740",["subeventSuffix"] = "_CAST_START",["remaining_operator"] = "<",["event"] = "BigWigs Timer",["subeventPrefix"] = "SPELL",["remaining"] = "3",["spellIds"] = {},["use_remaining"] = true,["unit"] = "player",["use_spellId"] = true,["names"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["customVariables"] = "{index = \"number\", backup = \"bool\"}",["event"] = "Health",["unit"] = "player",["subeventPrefix"] = "SPELL",["events"] = "TRIGGER:1 ENCOUNTER_START EXRT_NOTE_UPDATE",["custom"] = "function(s,e,num,ts)\
    if e == \"ENCOUNTER_START\" or e == \"EXRT_NOTE_UPDATE\" then\
        aura_env.TryReadNote()\
        \
    elseif ts and ts[\"\"] and ts[\"\"].show then\
        local count = tonumber(ts[\"\"].count)\
        if count then\
            \
            local thisGroup = count % aura_env.numGroups\
            thisGroup = thisGroup == 0 and aura_env.numGroups or thisGroup\
            local thisSet = aura_env.rotations[thisGroup]\
            \
            if thisSet then\
                elogl(\"Lava Ejection - catchers\", unpack(thisSet))\
                local index = 0\
                local catchers = {}\
                local changed = false\
                local missingCatchers = 0\
                \
                for _, name in ipairs(thisSet) do\
                    if aura_env.notReady(name) then\
                        -- this soaker is dead/debuffed so count them for backups\
                        missingCatchers = missingCatchers + 1\
                    else\
                        -- this soaker is alive and not debuffed\
                        index = index + 1\
                        aura_env.setMark(name, index)\
                        elogl(\"Lava Ejection assigned\", name)\
                        \
                        table.insert(catchers, name)\
                        \
                        if UnitIsUnit(name, \"player\") then\
                            --elog(\"Lava Ejection on me!\")\
                            -- if this assignment is the player then activate the Aura\
                            s[\"\"] = {\
                                show = true,\
                                changed = true,\
                                duration = 10, \
                                expirationTime = GetTime() + 10,\
                                autoHide = true,\
                                index = index,\
                            }\
                            changed = true\
                        end\
                    end\
                end\
                -- now handle backups for any dead soakers\
                if missingCatchers > 0  then\
                    elogl(\"Lava Ejection backups needed\", missingCatchers)\
                    \
                    local backups = CopyTable(aura_env.backups, true)\
                    for i = #backups, 1, -1 do\
                        if aura_env.notReady(backups[i]) then\
                            -- they're already dead/debuffed so can't help us\
                            table.remove(backups, i)\
                        end\
                    end\
                    \
                    if missingCatchers > #backups then\
                        elogl(\"Lava Ejection - NOT ENOUGH BACKUPS!\", missingCatchers - #backups)\
                    end\
                    \
                    for i = 1, missingCatchers do\
                        -- for each missing soaker in the group try to find a backup\
                        if backups[i] then\
                            index = index + 1\
                            aura_env.setMark(backups[i], index)\
                            elogl(\"Lava Ejection backups assigned\", backups[i])\
                            \
                            table.insert(catchers, name)\
                            \
                            if UnitIsUnit(\"player\", backups[i]) then\
                                -- and if this backup is the player, tell them to soak\
                                s[\"\"] = {\
                                    show = true,\
                                    changed = true,\
                                    duration = 10, \
                                    expirationTime = GetTime() + 10,\
                                    autoHide = true,\
                                    index = index,\
                                    backup = true,\
                                }\
                                changed = true\
                            end\
                        end\
                    end\
                end\
                table.sort(catchers)\
                WeakAuras.ScanEvents(\"ECHO_CATCHER_EXTERNALS\", catchers, thisGroup)\
                WeakAuras.ScanEvents(\"ECHO_CATCHER_GLOW\", catchers)\
                \
                return changed\
            end\
        end\
    end\
end",["custom_type"] = "stateupdate",["check"] = "event",["spellIds"] = {},["names"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["useName"] = true,["auranames"] = {"413351",},["unit"] = "player",["matchesShowOn"] = "showOnMissing",["type"] = "aura2",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[2] end",["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["displayText_format_p_time_legacy_floor"] = false,["selfPoint"] = "CENTER",["desc"] = "NOTES:\
#catcher name name name\
#catcher name name name\
#backup name name name",["font"] = "Expressway MonoNum",["displayText_format_c_format"] = "none",["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["encounterid"] = "2683",["use_difficulty"] = true,["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 33,["source"] = "import",["shadowXOffset"] = 1,["automaticWidth"] = "Auto",["regionType"] = "text",["displayText_format_p_time_dynamic_threshold"] = 60,["conditions"] = {},["internalVersion"] = 65,["wordWrap"] = "WordWrap",["displayText_format_p_format"] = "timed",["displayText_format_p_time_precision"] = 1,["uid"] = "zL1Ab9HcD8I",["parent"] = "7. Texts (anchored) - Magmorax",["shadowYOffset"] = -1,["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "7. Lava Ejection Assigner - Magmorax",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {},["xOffset"] = 0,["displayText"] = "CATCH NEXT! %p%c",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {["forceEvents"] = true,},["subRegions"] = {{["type"] = "subbackground",},},},["7. Lava Ejection - Magmorax"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"413351",},["duration"] = "3",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["use_debuffClass"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["names"] = {"Sacred Blade",},["use_unit"] = true,["subeventPrefix"] = "SPELL",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["type"] = "aura2",["useExactSpellId"] = false,["unevent"] = "auto",["useName"] = true,["spellName"] = 0,["matchesShowOn"] = "showOnActive",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["custom_type"] = "event",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SOAKED\\n150%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_1.tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip1_format"] = "none",["anchorXOffset"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.toltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = true,["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.15,["glow"] = false,["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["useGlowColor"] = false,["type"] = "subglow",["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2683",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["cooldownEdge"] = false,["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["color"] = {1,1,1,1,},["parent"] = "7. Icons - Low Priority - Magmorax",["config"] = {},["alpha"] = 1,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["auto"] = true,["cooldownTextDisabled"] = false,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "7. Lava Ejection - Magmorax",["zoom"] = 0,["useCooldownModRate"] = true,["width"] = 55,["desaturate"] = false,["uid"] = "CzzlMhwNXyx",["inverse"] = false,["xOffset"] = 0,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["icon"] = true,},["7. Scripe Group (anchored)"] = {["controlledChildren"] = {"7. Searing Heat Dynamic Group","7. Scripe List - Magmorax",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "7. Singles - Magmorax",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 65,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["anchorFrameFrame"] = "WeakAuras:Scripe Lists - Anchor",["regionType"] = "group",["borderSize"] = 2,["anchorFrameParent"] = false,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "7. Scripe Group (anchored)",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["borderInset"] = 1,["xOffset"] = 0,["config"] = {},["uid"] = "J6tZeX8rP3F",["conditions"] = {},["information"] = {},["borderEdge"] = "Square Full White",},["7. Searing Heat Debuff Bar - Magmorax"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.43975883722305,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = true,["selfPoint"] = "CENTER",["barColor"] = {1,0.61960786581039,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2683",["class"] = {["single"] = "HUNTER",["multi"] = {["HUNTER"] = true,},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["single"] = 2,["multi"] = {true,},},["use_difficulty"] = true,["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["color"] = {},["customText"] = "function()\
    if aura_env.state and aura_env.state.stacks then\
        aura_env.region:SetDurationInfo(aura_env.state.stacks, 50, true) \
    end\
end",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["config"] = {},["sparkRotationMode"] = "AUTO",["sparkColor"] = {1,1,1,1,},["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["useMatch_count"] = true,["auranames"] = {"408839",},["combinePerUnit"] = false,["unit"] = "group",["match_count"] = "0",["debuffType"] = "HARMFUL",["showClones"] = true,["useName"] = true,["useExactSpellId"] = false,["perUnitMode"] = "all",["event"] = "Health",["subeventPrefix"] = "SPELL",["names"] = {},["spellIds"] = {},["auraspellids"] = {},["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["useAffected"] = false,["match_countOperator"] = ">=",},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = 1,},["parent"] = "7. Searing Heat Dynamic Group",["internalVersion"] = 65,["stacksFont"] = "Friz Quadrata TT",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["duration"] = "0",["alphaType"] = "custom",["colorA"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["scalex"] = 1,["colorB"] = 1,["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["icon"] = true,["stickyDuration"] = false,["textSize"] = 12,["anchorFrameType"] = "SCREEN",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_text"] = "",["type"] = "subborder",["border_anchor"] = "bar",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["text_shadowXOffset"] = 1,["text_text"] = "%1.unitName",["text_text_format_1.unitName_color"] = "class",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_text_format_1.unitName_abbreviate_max"] = 8,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_affected_format"] = "none",["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s%c",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_c_format"] = "none",["anchorXOffset"] = 0,["type"] = "subtext",["text_shadowColor"] = {0,0,0,1,},["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_time_format"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 14,["text_text_format_p_time_dynamic_threshold"] = 0,["text_text_format_p_time_legacy_floor"] = true,},},["height"] = 15,["timerFlags"] = "None",["url"] = "https://echoesports.gg",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["customTextUpdate"] = "event",["source"] = "import",["sparkHidden"] = "NEVER",["sparkRotation"] = 0,["timerSize"] = 12,["border"] = false,["borderEdge"] = "None",["authorOptions"] = {},["borderInFront"] = false,["uid"] = "giVAvFCMAqv",["icon_side"] = "LEFT",["borderSize"] = 16,["zoom"] = 0,["sparkHeight"] = 14,["useAdjustededMax"] = false,["timer"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["semver"] = "1.0.5",["id"] = "7. Searing Heat Debuff Bar - Magmorax",["textFlags"] = "None",["frameStrata"] = 4,["width"] = 140,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Bleat.ogg",["do_message"] = false,["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["auto"] = true,["inverse"] = false,["borderOffset"] = 5,["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "customcheck",["value"] = "function()\
    return false\
    --return aura_env.state.unit and EchoInternal:IsMelee(aura_env.state.unit)\
end",},["changes"] = {{["value"] = {1,0.72156864404678,0.74509805440903,1,},["property"] = "barColor",},},},},["barColor2"] = {1,0.43529415130615,0.20784315466881,1,},["borderBackdrop"] = "Blizzard Tooltip",},["7. Molten Spittle normal [POOL\nSPAWN] - Magmorax"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"402994",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["custom_type"] = "event",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbHealMode"] = true,["unit"] = "player",["use_genericShowOn"] = true,["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["useExactSpellId"] = true,["type"] = "aura2",["useName"] = false,["auraspellids"] = {"402994",},["unevent"] = "auto",["names"] = {"Sacred Blade",},["debuffType"] = "HARMFUL",["subeventPrefix"] = "SPELL",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "3",["remOperator"] = "<",["group_countOperator"] = ">",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "POOL\\nSPAWN",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_1.toltip1_format"] = "none",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.15,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["zoneIds"] = "",["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["class"] = {["multi"] = {},},["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["encounterid"] = "2683",["size"] = {["multi"] = {},},},["source"] = "import",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["xOffset"] = 0,["parent"] = "7. Icons - High Priority - Magmorax",["uid"] = "B4SlazyM8n2",["cooldownTextDisabled"] = false,["width"] = 55,["frameStrata"] = 1,["semver"] = "1.0.4",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["id"] = "7. Molten Spittle normal [POOL\\nSPAWN] - Magmorax",["url"] = "https://echoesports.gg",["alpha"] = 1,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["config"] = {},["inverse"] = false,["color"] = {1,1,1,1,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayIcon"] = 3528301,["cooldown"] = true,["desaturate"] = false,},["7. Molten Spittle Bomb [SOAK\nBOMB] - Magmorax"] = {["iconSource"] = 0,["parent"] = "7. Icons - High Priority - Magmorax",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"402994",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = true,["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["group_countOperator"] = ">",["names"] = {"Sacred Blade",},["use_genericShowOn"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["unit"] = "player",["type"] = "aura2",["use_debuffClass"] = false,["auraspellids"] = {"411149",},["buffShowOn"] = "showOnActive",["useName"] = false,["custom_type"] = "event",["unevent"] = "auto",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["use_unit"] = true,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SOAK\\nBOMB",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_1.tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip2_format"] = "none",["anchorXOffset"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.toltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = false,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = true,["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["encounterid"] = "2683",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",["multi"] = {},},["race"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 463515,["color"] = {1,1,1,1,},["authorOptions"] = {},["config"] = {},["zoom"] = 0,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["semver"] = "1.0.4",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "7. Molten Spittle Bomb [SOAK\\nBOMB] - Magmorax",["cooldownEdge"] = false,["frameStrata"] = 1,["width"] = 55,["alpha"] = 1,["uid"] = "3ZYv6Xk)e62",["inverse"] = false,["xOffset"] = 0,["stickyDuration"] = false,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["icon"] = true,},["7. Texts (anchored) - Magmorax"] = {["grow"] = "DOWN",["controlledChildren"] = {"7. Molten Spittle Bomb - GROUP SOAK","7. Spittle Side Text","7. Lava Ejection Assigner - Magmorax","7. Blazing Tantrum - Boss in lava - Magmorax",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["7. Lava Ejection Assigner - Magmorax"] = false,["7. Spittle Side Text"] = false,["7. Molten Spittle Bomb - GROUP SOAK"] = false,["7. Blazing Tantrum - Boss in lava - Magmorax"] = false,},["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["useLimit"] = false,["align"] = "CENTER",["rotation"] = 0,["space"] = 2,["subRegions"] = {},["stagger"] = 0,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["arcLength"] = 360,["backdropColor"] = {1,1,1,0.5,},["animate"] = false,["source"] = "import",["uid"] = "t5S8n2MyED)",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["sort"] = "none",["borderInset"] = 1,["anchorPoint"] = "CENTER",["gridWidth"] = 5,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["authorOptions"] = {},["tocversion"] = 100100,["id"] = "7. Texts (anchored) - Magmorax",["anchorFrameFrame"] = "WeakAuras:Texts - Anchor",["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["parent"] = "7. Singles - Magmorax",["config"] = {},["gridType"] = "RD",["fullCircle"] = true,["internalVersion"] = 65,["conditions"] = {},["information"] = {},["selfPoint"] = "TOP",},["7. Lava Ejection - Catcher Glow - Mogmorax"] = {["outline"] = "OUTLINE",["xOffset"] = 0,["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 4,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["glow_frame_type"] = "UNITFRAME",["glow_color"] = {0.96078437566757,0.0078431377187371,1,0.80000001192093,},["glow_action"] = "show",["glow_lines"] = 13,["glow_type"] = "Pixel",["use_glow_color"] = true,["do_glow"] = true,},["init"] = {},["finish"] = {["hide_all_glows"] = true,},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["unit"] = "player",["spellIds"] = {},["custom"] = "function(s,e,catchers)\
    if catchers then\
        elogl(\"Catcher table recieved\", unpack(catchers))\
        for _, name in pairs(catchers) do\
            local unit = \"raid\"..UnitInRaid(name)\
            \
            s[name] = {\
                show = true,\
                changed = true,\
                unit = unit,\
                autoHide = true,\
                duration = 10,\
                expirationTime = GetTime() + 10,\
            }\
        end\
        \
        return true\
    end\
end",["custom_type"] = "stateupdate",["check"] = "event",["names"] = {},["events"] = "ECHO_CATCHER_EXTERNALS",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["internalVersion"] = 65,["wordWrap"] = "WordWrap",["font"] = "Friz Quadrata TT",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_encounterid"] = true,["talent"] = {["multi"] = {},},["encounterid"] = "2683",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 12,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["fixedWidth"] = 200,["displayText_format_p_format"] = "timed",["authorOptions"] = {},["displayText_format_p_time_precision"] = 1,["automaticWidth"] = "Auto",["uid"] = "haDdRcqEGI8",["yOffset"] = 0,["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "7. Lava Ejection - Catcher Glow - Mogmorax",["parent"] = "7. Singles - Magmorax",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["config"] = {},["displayText"] = "",["displayText_format_p_time_dynamic_threshold"] = 60,["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["selfPoint"] = "BOTTOM",},["7. Bars - Magmorax"] = {["arcLength"] = 360,["controlledChildren"] = {"7. Blazing Breath Cast [BREATH] - Magmorax","7. Molten Spittle Cast [POOLS INC] - Magmorax","7. Overpowering Stomp Cast [KNOCKBACK] - Magmorax","7. Igniting Roar Cast [DMG + SOAKS POOLS] - Magmorax",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["useLimit"] = false,["align"] = "CENTER",["stagger"] = 0,["rotation"] = 0,["subRegions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["animate"] = false,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["anchorFrameFrame"] = "WeakAuras:Bars - Anchor",["backdropColor"] = {1,1,1,0.5,},["limit"] = 5,["source"] = "import",["config"] = {},["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["sort"] = "none",["borderInset"] = 1,["gridType"] = "RD",["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["internalVersion"] = 65,["borderOffset"] = 4,["authorOptions"] = {},["tocversion"] = 100100,["id"] = "7. Bars - Magmorax",["grow"] = "UP",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["parent"] = "7. Magmorax",["uid"] = "zSOEIeFqUqR",["sortHybridTable"] = {["7. Blazing Breath Cast [BREATH] - Magmorax"] = false,["7. Igniting Roar Cast [DMG + SOAKS POOLS] - Magmorax"] = false,["7. Molten Spittle Cast [POOLS INC] - Magmorax"] = false,["7. Overpowering Stomp Cast [KNOCKBACK] - Magmorax"] = false,},["rowSpace"] = 1,["fullCircle"] = true,["conditions"] = {},["information"] = {},["selfPoint"] = "BOTTOM",},["7. Molten Spittle Cast [POOLS INC] - Magmorax"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["do_custom"] = false,},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.97254908084869,0.67058825492859,0.4078431725502,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2683",["spec"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["use_never"] = false,["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "135810",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "7. Bars - Magmorax",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["config"] = {},["sparkRotationMode"] = "AUTO",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 402989,["auranames"] = {"Advanced Recombobulation","362732",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = true,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_absorbMode"] = true,["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["unit"] = "boss",["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbHealMode"] = true,["use_unit"] = true,["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["buffShowOn"] = "showOnActive",["useName"] = true,["matchesShowOn"] = "showOnActive",["unevent"] = "auto",["auraspellids"] = {},["names"] = {"Sacred Blade",},["use_genericShowOn"] = true,["type"] = "unit",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["subeventPrefix"] = "SPELL",["remOperator"] = "<",["spellName"] = 0,["custom_type"] = "event",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = -10,},["stacksFont"] = "Friz Quadrata TT",["internalVersion"] = 65,["auto"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["rotate"] = 0,["easeStrength"] = 3,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["customTextUpdate"] = "update",["stickyDuration"] = false,["uid"] = "i16UT6whuqY",["anchorFrameType"] = "SCREEN",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "POOLS INC",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_text_format_destName_format"] = "Unit",["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_anchorYOffset"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate"] = false,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["type"] = "subborder",["text_text"] = "",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["xOffset"] = 0,["source"] = "import",["id"] = "7. Molten Spittle Cast [POOLS INC] - Magmorax",["borderColor"] = {1,1,1,0.5,},["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["timerSize"] = 12,["borderInFront"] = false,["zoom"] = 0,["icon_side"] = "LEFT",["sparkWidth"] = 3,["borderBackdrop"] = "Blizzard Tooltip",["sparkHeight"] = 14,["borderSize"] = 16,["color"] = {},["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["displayTextLeft"] = "%n",["sparkHidden"] = "NEVER",["rotateText"] = "NONE",["frameStrata"] = 1,["width"] = 240,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["useAdjustededMax"] = false,["inverse"] = false,["icon"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["sparkColor"] = {1,1,1,1,},},["7. Molten Spittle normal (LFR/N/H) [POOL\nSPAWN] - Magmorax "] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"402994",},["duration"] = "3",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["custom_type"] = "event",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["use_absorbHealMode"] = true,["use_tooltip"] = false,["ignoreSelf"] = true,["useExactSpellId"] = false,["names"] = {"Sacred Blade",},["use_genericShowOn"] = true,["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["group_countOperator"] = ">",["type"] = "aura2",["useName"] = true,["auraspellids"] = {"402994",},["unevent"] = "auto",["unit"] = "player",["custom_hide"] = "timed",["debuffType"] = "HARMFUL",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["use_unit"] = true,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "POOL\\nSPAWN",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_visible"] = false,["text_wordWrap"] = "WordWrap",["text_text_format_1.toltip1_format"] = "none",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_anchorXOffset"] = 7,},{["glowFrequency"] = 0.15,["glow"] = false,["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["useGlowColor"] = false,["type"] = "subglow",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["zoneIds"] = "",["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["encounterid"] = "2683",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {["heroic"] = true,["lfr"] = true,["normal"] = true,},},["race"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["use_difficulty"] = false,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["url"] = "https://echoesports.gg",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["authorOptions"] = {},["uid"] = "m6xGLSYV2E6",["zoom"] = 0,["width"] = 55,["alpha"] = 1,["auto"] = true,["cooldownTextDisabled"] = false,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "7. Molten Spittle normal (LFR/N/H) [POOL\\nSPAWN] - Magmorax ",["icon"] = true,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["config"] = {},["inverse"] = false,["parent"] = "7. Icons - High Priority - Magmorax",["selfPoint"] = "CENTER",["displayIcon"] = 3528301,["cooldown"] = true,["stickyDuration"] = false,},["7. Searing Heat Dynamic Group"] = {["arcLength"] = 360,["controlledChildren"] = {"7. Searing Heat Debuff Bar - Magmorax",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "7. Scripe Group (anchored)",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["fullCircle"] = true,["space"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["useLimit"] = false,["align"] = "CENTER",["rotation"] = 0,["subRegions"] = {},["grow"] = "DOWN",["selfPoint"] = "TOP",["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["customSort"] = "WeakAuras.ComposeSorts(\
  WeakAuras.SortAscending{\"region\", \"state\", \"stacks\"},\
  WeakAuras.SortDescending{\"region\", \"state\", \"expirationTime\"}\
)",["backdropColor"] = {1,1,1,0.5,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["animate"] = false,["internalVersion"] = 65,["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["sort"] = "custom",["limit"] = 5,["borderInset"] = 1,["source"] = "import",["uid"] = "d)O(1tKu8PD",["constantFactor"] = "RADIUS",["frameStrata"] = 1,["borderOffset"] = 4,["rowSpace"] = 1,["tocversion"] = 100100,["id"] = "7. Searing Heat Dynamic Group",["gridType"] = "RD",["gridWidth"] = 5,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["config"] = {},["authorOptions"] = {},["sortHybridTable"] = {["7. Searing Heat Debuff Bar - Magmorax"] = false,},["borderColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["stagger"] = 0,},["7. Igniting Roar Dot - Magmorax"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"403747",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["custom_type"] = "event",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbHealMode"] = true,["unit"] = "player",["use_genericShowOn"] = true,["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["useExactSpellId"] = false,["type"] = "aura2",["useName"] = true,["auraspellids"] = {},["unevent"] = "auto",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",["use_unit"] = true,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "3",["remOperator"] = "<",["group_countOperator"] = ">",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = false,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_1.toltip1_format"] = "none",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.15,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2683",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "7. Icons - Low Priority - Magmorax",["url"] = "https://echoesports.gg",["uid"] = "p0Q5HnELk9k",["frameStrata"] = 1,["width"] = 55,["alpha"] = 1,["auto"] = true,["zoom"] = 0,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "7. Igniting Roar Dot - Magmorax",["cooldownTextDisabled"] = false,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["desaturate"] = false,["config"] = {},["inverse"] = false,["color"] = {1,1,1,1,},["authorOptions"] = {},["displayIcon"] = 3528301,["cooldown"] = true,["icon"] = true,},["7. Overpowering Stomp Cast [KNOCKBACK] - Magmorax"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.070588238537312,1,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2683",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "136025",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "7. Bars - Magmorax",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["color"] = {},["sparkRotationMode"] = "AUTO",["stacksFont"] = "Friz Quadrata TT",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 403671,["auranames"] = {"Advanced Recombobulation","362732",},["use_genericShowOn"] = true,["group_count"] = "0",["spellName"] = 0,["showClones"] = true,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["useExactSpellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["unit"] = "boss",["use_tooltip"] = false,["ignoreSelf"] = true,["subeventPrefix"] = "SPELL",["names"] = {"Sacred Blade",},["duration"] = "3",["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["useName"] = true,["type"] = "unit",["unevent"] = "auto",["use_exact_spellId"] = false,["auraspellids"] = {},["custom_hide"] = "timed",["use_debuffClass"] = false,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["subeventSuffix"] = "_CAST_START",["group_countOperator"] = ">",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["auto"] = true,["internalVersion"] = 65,["useAdjustededMax"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = true,},["init"] = {["do_custom"] = false,},["finish"] = {},},["width"] = 240,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "KNOCKBACK",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_text_format_destName_abbreviate"] = false,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["border_size"] = 1,["type"] = "subborder",["text_text"] = "",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["authorOptions"] = {},["source"] = "import",["sparkHidden"] = "NEVER",["sparkRotation"] = 0,["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["semver"] = "1.0.5",["borderInFront"] = false,["sparkWidth"] = 3,["icon_side"] = "LEFT",["zoom"] = 0,["borderSize"] = 16,["sparkHeight"] = 14,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["borderBackdrop"] = "Blizzard Tooltip",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["textSize"] = 12,["id"] = "7. Overpowering Stomp Cast [KNOCKBACK] - Magmorax",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["customTextUpdate"] = "update",["rotateText"] = "NONE",["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "OXS6IFSG)YM",},["7. Icons - Low Priority - Magmorax"] = {["arcLength"] = 360,["controlledChildren"] = {"7. Burning Chains [CHAINS] - Magmorax","7. Searing Heat [DOT] - Magmorax","7. Igniting Roar Dot - Magmorax","7. Lava Ejection - Magmorax",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["useLimit"] = false,["align"] = "CENTER",["stagger"] = 0,["rotation"] = 0,["subRegions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["animate"] = false,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["anchorFrameFrame"] = "WeakAuras:Icon - Low Priority - Anchor",["backdropColor"] = {1,1,1,0.5,},["limit"] = 5,["source"] = "import",["config"] = {},["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["sort"] = "none",["borderInset"] = 1,["gridType"] = "RD",["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["internalVersion"] = 65,["borderOffset"] = 4,["authorOptions"] = {},["tocversion"] = 100100,["id"] = "7. Icons - Low Priority - Magmorax",["grow"] = "LEFT",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["parent"] = "7. Magmorax",["uid"] = "NxakZIQIZ16",["sortHybridTable"] = {["7. Searing Heat [DOT] - Magmorax"] = false,["7. Igniting Roar Dot - Magmorax"] = false,["7. Burning Chains [CHAINS] - Magmorax"] = false,["7. Lava Ejection - Magmorax"] = false,},["rowSpace"] = 1,["fullCircle"] = true,["conditions"] = {},["information"] = {},["selfPoint"] = "RIGHT",},["7. Blazing Breath Cast [BREATH] - Magmorax"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.9764706492424,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2683",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "HFsO8OX1Nnp",["displayIcon"] = "236216",["textColor"] = {1,1,1,1,},["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["borderBackdrop"] = "Blizzard Tooltip",["spark"] = false,["parent"] = "7. Bars - Magmorax",["cooldownTextDisabled"] = false,["customText"] = "function()\
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
",["borderInset"] = 11,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["borderOffset"] = 5,["cooldownSwipe"] = true,["textSize"] = 12,["sparkRotationMode"] = "AUTO",["cooldownEdge"] = false,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 402344,["auranames"] = {"Interdimensional Wormhole","362721",},["duration"] = "3",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_SUCCESS",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_exact_spellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "boss",["useExactSpellId"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["custom_hide"] = "timed",["custom_type"] = "event",["names"] = {"Sacred Blade",},["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["subeventPrefix"] = "SPELL",["type"] = "unit",["buffShowOn"] = "showOnActive",["auraspellids"] = {},["use_unit"] = true,["matchesShowOn"] = "showOnActive",["useName"] = true,["unevent"] = "auto",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["spellName"] = 0,["use_absorbHealMode"] = true,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["width"] = 240,["internalVersion"] = 65,["stacksFlags"] = "None",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["adjustedMin"] = "4",["stickyDuration"] = false,["id"] = "7. Blazing Breath Cast [BREATH] - Magmorax",["xOffset"] = 0,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BREATH",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["border_anchor"] = "bar",["border_size"] = 1,["text_text"] = "",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["type"] = "subborder",},},["height"] = 23,["timerFlags"] = "None",["semver"] = "1.0.4",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["timerSize"] = 12,["source"] = "import",["backdropColor"] = {1,1,1,0.5,},["config"] = {},["textFlags"] = "None",["border"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderSize"] = 16,["borderInFront"] = false,["icon_side"] = "LEFT",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["sparkHeight"] = 14,["customTextUpdate"] = "update",["borderColor"] = {1,1,1,0.5,},["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["timer"] = true,["sparkHidden"] = "NEVER",["sparkColor"] = {1,1,1,1,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["rotateText"] = "NONE",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["inverse"] = false,["color"] = {},["orientation"] = "HORIZONTAL",["conditions"] = {},["cooldown"] = true,["sparkOffsetX"] = 0,},["7. Molten Spittle Bomb Air Horn - Magmorax"] = {["outline"] = "OUTLINE",["iconSource"] = -1,["semver"] = "1.0.4",["color"] = {1,1,1,1,},["displayText_format_p_time_dynamic_threshold"] = 60,["cooldown"] = true,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "update",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = true,},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"411149",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["useExactSpellId"] = true,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbHealMode"] = true,["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["duration"] = "3",["type"] = "aura2",["use_unit"] = true,["unevent"] = "auto",["useName"] = false,["auraspellids"] = {"411149",},["custom_type"] = "event",["buffShowOn"] = "showOnActive",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["unit"] = "player",["remOperator"] = "<",["group_countOperator"] = ">",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["displayIcon"] = 3528301,["yOffset"] = 0,["cooldownTextDisabled"] = false,["stickyDuration"] = false,["authorOptions"] = {},["font"] = "Friz Quadrata TT",["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["height"] = 55,["config"] = {},["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2683",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["fontSize"] = 12,["source"] = "import",["alpha"] = 1,["shadowXOffset"] = 1,["auto"] = true,["preferToUpdate"] = false,["cooldownEdge"] = false,["regionType"] = "text",["desaturate"] = false,["url"] = "https://echoesports.gg",["icon"] = true,["displayText_format_p_time_legacy_floor"] = false,["xOffset"] = 0,["displayText_format_p_time_precision"] = 1,["conditions"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["zoom"] = 0,["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "7. Molten Spittle Bomb Air Horn - Magmorax",["wordWrap"] = "WordWrap",["useCooldownModRate"] = true,["width"] = 55,["displayText_format_p_time_mod_rate"] = true,["uid"] = ")eupfBxDMDK",["inverse"] = false,["displayText"] = "",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "7. Singles - Magmorax",},["7. Burning Chains [CHAINS] - Magmorax"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"411633",},["duration"] = "3",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["use_debuffClass"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["unit"] = "player",["use_unit"] = true,["subeventPrefix"] = "SPELL",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["useName"] = true,["custom_hide"] = "timed",["unevent"] = "auto",["type"] = "aura2",["group_countOperator"] = ">",["matchesShowOn"] = "showOnActive",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["subeventSuffix"] = "_CAST_START",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "CHAINS",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.tooltip3_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_1.tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorXOffset"] = 0,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_text_format_1.toltip1_format"] = "none",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_text_format_1.toltip3_format"] = "none",["text_fontType"] = "OUTLINE",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.1,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2683",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["icon"] = true,["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["authorOptions"] = {},["color"] = {1,1,1,1,},["config"] = {},["zoom"] = 0,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["semver"] = "1.0.4",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "7. Burning Chains [CHAINS] - Magmorax",["cooldownEdge"] = false,["frameStrata"] = 1,["width"] = 55,["useCooldownModRate"] = true,["uid"] = "KAAYw64pGnS",["inverse"] = false,["parent"] = "7. Icons - Low Priority - Magmorax",["stickyDuration"] = false,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["7. Molten Spittle Circle - Magmorax"] = {["user_y"] = 0,["iconSource"] = -1,["user_x"] = 0,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["foregroundColor"] = {1,0.74509805440903,0.17647059261799,1,},["echoVersion"] = 2,["sameTexture"] = true,["url"] = "https://echoesports.gg",["backgroundColor"] = {0.16078431904316,0.16078431904316,0.16078431904316,0.48795199394226,},["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["crop_y"] = 0.41,["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",["useAdjustededMin"] = false,["regionType"] = "progresstexture",["blendMode"] = "BLEND",["slantMode"] = "INSIDE",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["alpha"] = 1,["uid"] = "VgY2UYLl72V",["displayIcon"] = 3528301,["backgroundOffset"] = 0,["color"] = {1,1,1,1,},["desaturateBackground"] = false,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["desaturateForeground"] = false,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"Molten Spittle","402994",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["use_debuffClass"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["subeventPrefix"] = "SPELL",["use_unit"] = true,["names"] = {"Sacred Blade",},["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["type"] = "aura2",["group_countOperator"] = ">",["unevent"] = "auto",["useName"] = true,["spellName"] = 0,["duration"] = "3",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["use_genericShowOn"] = true,["remOperator"] = "<",["useExactSpellId"] = false,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 65,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "TOP",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorXOffset"] = 0,["text_text_format_p_format"] = "timed",["text_text_format_p_time_precision"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {0.98823529411765,0.99607843137255,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_p_time_format"] = 0,["text_text_format_tooltip1_format"] = "none",["text_fontSize"] = 14,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "BOTTOMRIGHT",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {0.98823529411765,0.99607843137255,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_1.ttoltip1_format"] = "none",["text_shadowYOffset"] = 0,["text_text_format_tooltip2_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_visible"] = true,["text_anchorYOffset"] = -6,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_anchorXOffset"] = 5,},{["border_size"] = 1,["text_text"] = "",["border_offset"] = 0,["border_color"] = {1,1,1,1,},["border_visible"] = false,["border_edge"] = "Square Full White",["type"] = "subborder",},},["height"] = 150,["useAdjustededMax"] = false,["fontSize"] = 12,["source"] = "import",["mirror"] = false,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2683",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["cooldown"] = true,["crop_x"] = 0.41,["zoom"] = 0,["compress"] = false,["authorOptions"] = {},["startAngle"] = 0,["icon"] = true,["width"] = 150,["parent"] = "7. Singles - Magmorax",["semver"] = "1.0.4",["frameStrata"] = 1,["id"] = "7. Molten Spittle Circle - Magmorax",["anchorPoint"] = "CENTER",["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",["inverse"] = false,["auraRotation"] = 0,["orientation"] = "ANTICLOCKWISE",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "spellId",["op"] = "==",["value"] = "411149",},["changes"] = {{["value"] = {1,0,0.078431375324726,1,},["property"] = "foregroundColor",},},},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["config"] = {},},["7. Searing Heat [DOT] - Magmorax"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"408839",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["useExactSpellId"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["use_unit"] = true,["unit"] = "player",["subeventPrefix"] = "SPELL",["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["buffShowOn"] = "showOnActive",["type"] = "aura2",["useName"] = true,["auraspellids"] = {},["unevent"] = "auto",["use_debuffClass"] = false,["group_countOperator"] = ">",["spellName"] = 0,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["use_genericShowOn"] = true,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = 1,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_1.toltip1_format"] = "none",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2683",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["source"] = "import",["cooldownEdge"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "7. Icons - Low Priority - Magmorax",["actions"] = {["start"] = {},["finish"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\shot.ogg",["do_sound"] = false,},["init"] = {},},["uid"] = "IqD)CWV(w)F",["frameStrata"] = 1,["width"] = 55,["alpha"] = 1,["auto"] = true,["zoom"] = 0,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "7. Searing Heat [DOT] - Magmorax",["cooldownTextDisabled"] = false,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["desaturate"] = false,["config"] = {},["inverse"] = false,["xOffset"] = 0,["authorOptions"] = {},["displayIcon"] = 3528301,["cooldown"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["7. Spittle Side Text"] = {["outline"] = "OUTLINE",["xOffset"] = 0,["displayText"] = "%side %2.p",["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 10,["displayText_format_2.p_time_mod_rate"] = true,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["message"] = "%side",["message_type"] = "SAY",["do_message"] = true,["message_format_side_format"] = "none",["do_custom"] = false,},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["unit"] = "player",["events"] = "ENCOUNTER_START CLEU:SPELL_AURA_APPLIED:SPELL_CAST_SUCCESS",["custom"] = "function(s, event, ...)\
    local _, subEvent, _, sourceGUID, _, _, _, destGUID, destName, _, _, spellID = ...\
    if event == \"ENCOUNTER_START\" and ... then\
        aura_env.count = 0\
        \
    else\
        local _, subEvent, _, sourceGUID, _, _, _, destGUID, destName, _, _, spellID = ...\
        \
        if subEvent == \"SPELL_CAST_SUCCESS\" and spellID == 402989 then\
            aura_env.count = aura_env.count + 1\
            --elogl(\"Spittle side cast increment\", aura_env.count)\
            \
            \
        elseif subEvent == \"SPELL_AURA_APPLIED\" and spellID == 402994 and aura_env.count and aura_env.count < 4 then\
            \
            \
            local expectedNumberAffected = 2\
            if not aura_env.last or aura_env.last < GetTime() - 1 then\
                aura_env.last = GetTime()\
                aura_env.affected = {}\
            end\
            table.insert(aura_env.affected, destName)\
            \
            if #aura_env.affected == expectedNumberAffected then\
                \
                table.sort(aura_env.affected)\
                elogl(\"Spittle side\", unpack(aura_env.affected))\
                for i, name in ipairs(aura_env.affected) do\
                    if UnitIsUnit(name, \"player\") then\
                        --elog(\"spittle side on me\", i == 1 and \"LEFT\" or \"RIGHT\")\
                        s[\"\"] = {\
                            show = true,\
                            changed = true,\
                            autoHide = true,\
                            duration = 5, \
                            expirationTime = GetTime() + 5,\
                            side = i == 1 and \"LEFT\" or \"RIGHT\",\
                        }\
                        return true\
                    end\
                end\
            end\
        end\
    end\
    \
end\
\
\
\
",["names"] = {},["check"] = "event",["custom_type"] = "stateupdate",["spellIds"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "aura2",["useExactSpellId"] = true,["unit"] = "player",["auraspellids"] = {"402994",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["wordWrap"] = "WordWrap",["font"] = "Expressway MonoNum",["displayText_format_2.p_time_precision"] = 1,["subRegions"] = {{["type"] = "subbackground",},},["displayText_format_2.p_time_format"] = 0,["load"] = {["difficulty"] = {["single"] = "mythic",},["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["use_difficulty"] = true,["encounterid"] = "2683",["use_encounterid"] = true,},["fontSize"] = 20,["source"] = "import",["preferToUpdate"] = false,["shadowXOffset"] = 1,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["fixedWidth"] = 200,["selfPoint"] = "BOTTOM",["regionType"] = "text",["internalVersion"] = 65,["displayText_format_p_time_format"] = 0,["uid"] = "Qv7(BnI5vBD",["displayText_format_p_time_dynamic_threshold"] = 60,["displayText_format_2.p_time_legacy_floor"] = false,["displayText_format_p_time_precision"] = 1,["displayText_format_2.p_time_dynamic_threshold"] = 60,["color"] = {1,1,1,1,},["displayText_format_2.p_format"] = "timed",["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "7. Spittle Side Text",["parent"] = "7. Texts (anchored) - Magmorax",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["config"] = {},["yOffset"] = 0,["displayText_format_p_time_mod_rate"] = true,["shadowColor"] = {0,0,0,1,},["displayText_format_side_format"] = "none",["information"] = {},["conditions"] = {},},["7. Magmorax"] = {["controlledChildren"] = {"7. Icons - High Priority - Magmorax","7. Icons - Low Priority - Magmorax","7. Bars - Magmorax","7. Singles - Magmorax",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "!Echo - Aberrus",["preferToUpdate"] = false,["groupIcon"] = 5161746,["anchorPoint"] = "CENTER",["echoVersion"] = 7,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["internalVersion"] = 65,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "7. Magmorax",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["yOffset"] = 0,["borderInset"] = 1,["xOffset"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {},["conditions"] = {},["information"] = {},["uid"] = "r2ud3sXPn8T",},["7. Singles - Magmorax"] = {["controlledChildren"] = {"7. Lava Ejection - Catcher Glow - Mogmorax","7. Molten Spittle Bomb Air Horn - Magmorax","7. Overpowering Stomp Countdown - Magmorax","7. Molten Spittle Circle - Magmorax","7. Scripe Group (anchored)","7. Texts (anchored) - Magmorax",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "7. Magmorax",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["internalVersion"] = 65,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["anchorFrameFrame"] = "WeakAuras:Singles - Anchor",["regionType"] = "group",["borderSize"] = 2,["anchorFrameParent"] = false,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "7. Singles - Magmorax",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "2OVe1Z2Elpz",["config"] = {},["borderEdge"] = "Square Full White",["borderInset"] = 1,["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["7. Molten Spittle Bomb - GROUP SOAK"] = {["outline"] = "OUTLINE",["iconSource"] = 0,["displayIcon"] = 463515,["parent"] = "7. Texts (anchored) - Magmorax",["displayText_format_p_time_dynamic_threshold"] = 60,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"402994",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["use_absorbHealMode"] = true,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["useExactSpellId"] = true,["use_unit"] = true,["duration"] = "3",["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["use_genericShowOn"] = true,["useName"] = false,["custom_type"] = "event",["unevent"] = "auto",["auraspellids"] = {"411149",},["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",["type"] = "aura2",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["unit"] = "player",["remOperator"] = "<",["group_countOperator"] = ">",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["keepAspectRatio"] = false,["wordWrap"] = "WordWrap",["fixedWidth"] = 200,["displayText"] = "GROUP SOAK",["auto"] = true,["stickyDuration"] = false,["icon"] = true,["font"] = "Expressway MonoNum",["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["height"] = 55,["uid"] = "CMzo5wHDi8L",["load"] = {["zoneIds"] = "",["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["encounterid"] = "2683",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["cooldownTextDisabled"] = false,["width"] = 55,["fontSize"] = 30,["source"] = "import",["alpha"] = 1,["shadowXOffset"] = 1,["semver"] = "1.0.4",["preferToUpdate"] = false,["url"] = "https://echoesports.gg",["regionType"] = "text",["desaturate"] = false,["automaticWidth"] = "Auto",["displayText_format_p_time_mod_rate"] = true,["useCooldownModRate"] = true,["xOffset"] = 0,["displayText_format_p_time_precision"] = 1,["yOffset"] = 0,["selfPoint"] = "CENTER",["zoom"] = 0,["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "7. Molten Spittle Bomb - GROUP SOAK",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["internalVersion"] = 65,["config"] = {},["inverse"] = false,["authorOptions"] = {},["shadowColor"] = {0,0,0,1,},["conditions"] = {},["cooldown"] = true,["color"] = {1,1,1,1,},},["7. Igniting Roar Cast [DMG + SOAKS POOLS] - Magmorax"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.38431376218796,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2683",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "134153",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "7. Bars - Magmorax",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["sparkColor"] = {1,1,1,1,},["spark"] = false,["sparkRotationMode"] = "AUTO",["timer"] = true,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 403740,["auranames"] = {"364963","Core Overload",},["duration"] = "10",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["use_exact_spellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["use_unit"] = true,["use_genericShowOn"] = true,["subeventPrefix"] = "SPELL",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["custom_type"] = "event",["type"] = "unit",["buffShowOn"] = "showOnActive",["auraspellids"] = {},["unit"] = "boss",["useName"] = true,["custom_hide"] = "timed",["unevent"] = "auto",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = -10,},["url"] = "https://echoesports.gg",["internalVersion"] = 65,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["easeStrength"] = 3,["rotate"] = 0,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["width"] = 240,["stickyDuration"] = false,["adjustedMax"] = "4",["authorOptions"] = {},["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "DMG + SOAK POOLS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_fontType"] = "OUTLINE",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["config"] = {},["source"] = "import",["displayTextRight"] = "%p",["textSize"] = 12,["sparkWidth"] = 3,["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["timerSize"] = 12,["icon_side"] = "LEFT",["zoom"] = 0,["borderOffset"] = 5,["sparkHeight"] = 14,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["borderBackdrop"] = "Blizzard Tooltip",["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["useAdjustededMax"] = false,["id"] = "7. Igniting Roar Cast [DMG + SOAKS POOLS] - Magmorax",["borderColor"] = {1,1,1,0.5,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["customText"] = "function()\
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
",["icon"] = true,["inverse"] = false,["stacksFont"] = "Friz Quadrata TT",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["uid"] = "ZZqmbLF00lW",},["7. Icons - High Priority - Magmorax"] = {["arcLength"] = 360,["controlledChildren"] = {"7. Incinerating Maws - Magmorax","7. Molten Spittle normal (LFR/N/H) [POOL\\nSPAWN] - Magmorax ","7. Molten Spittle normal [POOL\\nSPAWN] - Magmorax","7. Molten Spittle Bomb [SOAK\\nBOMB] - Magmorax",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "7. Magmorax",["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["7. Molten Spittle normal [POOL\nSPAWN] - Magmorax"] = false,["7. Molten Spittle normal (LFR/N/H) [POOL\nSPAWN] - Magmorax "] = false,["7. Molten Spittle Bomb [SOAK\nBOMB] - Magmorax"] = false,["7. Incinerating Maws - Magmorax"] = false,},["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["stagger"] = 0,["internalVersion"] = 65,["subRegions"] = {},["rotation"] = 0,["selfPoint"] = "RIGHT",["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["gridType"] = "RD",["backdropColor"] = {1,1,1,0.5,},["animate"] = false,["source"] = "import",["config"] = {},["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Icon - High Priority - Anchor",["regionType"] = "dynamicgroup",["borderSize"] = 2,["sort"] = "none",["uid"] = "MQyjl4DcnOR",["anchorPoint"] = "CENTER",["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["borderEdge"] = "Square Full White",["tocversion"] = 100100,["id"] = "7. Icons - High Priority - Magmorax",["grow"] = "LEFT",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["authorOptions"] = {},["borderInset"] = 1,["xOffset"] = 0,["space"] = 2,["fullCircle"] = true,["conditions"] = {},["information"] = {},["useLimit"] = false,},["7. Blazing Tantrum - Boss in lava - Magmorax"] = {["outline"] = "OUTLINE",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"407879",},["debuffType"] = "HELPFUL",["event"] = "Health",["subeventPrefix"] = "SPELL",["useGroup_count"] = true,["unit"] = "boss",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["group_count"] = "0",["type"] = "aura2",["names"] = {},["group_countOperator"] = ">",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["wordWrap"] = "WordWrap",["font"] = "Expressway MonoNum",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["load"] = {["size"] = {["multi"] = {},},["role"] = {["single"] = "TANK",},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["use_role"] = true,["spec"] = {["multi"] = {},},["encounterid"] = "2683",["use_encounterid"] = true,},["fontSize"] = 25,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_time_mod_rate"] = true,["selfPoint"] = "CENTER",["conditions"] = {},["internalVersion"] = 65,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayText_format_p_time_precision"] = 1,["shadowYOffset"] = -1,["config"] = {},["authorOptions"] = {},["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "7. Blazing Tantrum - Boss in lava - Magmorax",["parent"] = "7. Texts (anchored) - Magmorax",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "qUYaZUlzgiL",["displayText_format_p_time_dynamic_threshold"] = 60,["url"] = "https://echoesports.gg",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["displayText"] = "MOVE BOSS",},});


-- 7. manifest data

journal:AddManifestData({
	{
		["echoVersion"] = 7,
		["parent"] = "!Echo - Aberrus",
		["id"] = "7. Magmorax",
		["children"] = {
			"7. Singles - Magmorax",
			"7. Bars - Magmorax",
			"7. Icons - Low Priority - Magmorax",
			"7. Icons - High Priority - Magmorax",
		},
		["uid"] = "r2ud3sXPn8T",
	},
	{
		["echoVersion"] = 2,
		["parent"] = "7. Magmorax",
		["id"] = "7. Singles - Magmorax",
		["children"] = {
			"7. Texts (anchored) - Magmorax",
			"7. Scripe Group (anchored)",
			"7. Molten Spittle Circle - Magmorax",
			"7. Overpowering Stomp Countdown - Magmorax",
			"7. Molten Spittle Bomb Air Horn - Magmorax",
			"7. Lava Ejection - Catcher Glow - Mogmorax",
		},
		["uid"] = "2OVe1Z2Elpz",
	},
	{
		["echoVersion"] = 1,
		["parent"] = "7. Singles - Magmorax",
		["id"] = "7. Texts (anchored) - Magmorax",
		["children"] = {
			"7. Blazing Tantrum - Boss in lava - Magmorax",
			"7. Lava Ejection Assigner - Magmorax",
			"7. Spittle Side Text",
			"7. Molten Spittle Bomb - GROUP SOAK",
		},
		["uid"] = "t5S8n2MyED)",
	},
	{
		["id"] = "7. Blazing Tantrum - Boss in lava - Magmorax",
		["uid"] = "qUYaZUlzgiL",
		["parent"] = "7. Texts (anchored) - Magmorax",
		["echoVersion"] = 2,
	},
	{
		["id"] = "7. Lava Ejection Assigner - Magmorax",
		["uid"] = "zL1Ab9HcD8I",
		["parent"] = "7. Texts (anchored) - Magmorax",
		["echoVersion"] = 19,
	},
	{
		["id"] = "7. Spittle Side Text",
		["uid"] = "Qv7(BnI5vBD",
		["parent"] = "7. Texts (anchored) - Magmorax",
		["echoVersion"] = 10,
	},
	{
		["id"] = "7. Molten Spittle Bomb - GROUP SOAK",
		["uid"] = "CMzo5wHDi8L",
		["parent"] = "7. Texts (anchored) - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "7. Singles - Magmorax",
		["id"] = "7. Scripe Group (anchored)",
		["children"] = {
			"7. Scripe List - Magmorax",
			"7. Searing Heat Dynamic Group",
		},
		["uid"] = "J6tZeX8rP3F",
	},
	{
		["echoVersion"] = 1,
		["parent"] = "7. Scripe Group (anchored)",
		["id"] = "7. Scripe List - Magmorax",
		["children"] = {
			"7. Molten Spittle List - Magmorax",
		},
		["uid"] = "NRutzqananr",
	},
	{
		["id"] = "7. Molten Spittle List - Magmorax",
		["uid"] = "WBoHErc8o(8",
		["parent"] = "7. Scripe List - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "7. Scripe Group (anchored)",
		["id"] = "7. Searing Heat Dynamic Group",
		["children"] = {
			"7. Searing Heat Debuff Bar - Magmorax",
		},
		["uid"] = "d)O(1tKu8PD",
	},
	{
		["id"] = "7. Searing Heat Debuff Bar - Magmorax",
		["uid"] = "giVAvFCMAqv",
		["parent"] = "7. Searing Heat Dynamic Group",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Molten Spittle Circle - Magmorax",
		["uid"] = "VgY2UYLl72V",
		["parent"] = "7. Singles - Magmorax",
		["echoVersion"] = 2,
	},
	{
		["id"] = "7. Overpowering Stomp Countdown - Magmorax",
		["uid"] = "WzKU6LadS8o",
		["parent"] = "7. Singles - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Molten Spittle Bomb Air Horn - Magmorax",
		["uid"] = ")eupfBxDMDK",
		["parent"] = "7. Singles - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Lava Ejection - Catcher Glow - Mogmorax",
		["uid"] = "haDdRcqEGI8",
		["parent"] = "7. Singles - Magmorax",
		["echoVersion"] = 4,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "7. Magmorax",
		["id"] = "7. Bars - Magmorax",
		["children"] = {
			"7. Igniting Roar Cast [DMG + SOAKS POOLS] - Magmorax",
			"7. Overpowering Stomp Cast [KNOCKBACK] - Magmorax",
			"7. Molten Spittle Cast [POOLS INC] - Magmorax",
			"7. Blazing Breath Cast [BREATH] - Magmorax",
		},
		["uid"] = "zSOEIeFqUqR",
	},
	{
		["id"] = "7. Igniting Roar Cast [DMG + SOAKS POOLS] - Magmorax",
		["uid"] = "ZZqmbLF00lW",
		["parent"] = "7. Bars - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Overpowering Stomp Cast [KNOCKBACK] - Magmorax",
		["uid"] = "OXS6IFSG)YM",
		["parent"] = "7. Bars - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Molten Spittle Cast [POOLS INC] - Magmorax",
		["uid"] = "i16UT6whuqY",
		["parent"] = "7. Bars - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Blazing Breath Cast [BREATH] - Magmorax",
		["uid"] = "HFsO8OX1Nnp",
		["parent"] = "7. Bars - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "7. Magmorax",
		["id"] = "7. Icons - Low Priority - Magmorax",
		["children"] = {
			"7. Lava Ejection - Magmorax",
			"7. Igniting Roar Dot - Magmorax",
			"7. Searing Heat [DOT] - Magmorax",
			"7. Burning Chains [CHAINS] - Magmorax",
		},
		["uid"] = "NxakZIQIZ16",
	},
	{
		["id"] = "7. Lava Ejection - Magmorax",
		["uid"] = "CzzlMhwNXyx",
		["parent"] = "7. Icons - Low Priority - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Igniting Roar Dot - Magmorax",
		["uid"] = "p0Q5HnELk9k",
		["parent"] = "7. Icons - Low Priority - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Searing Heat [DOT] - Magmorax",
		["uid"] = "IqD)CWV(w)F",
		["parent"] = "7. Icons - Low Priority - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Burning Chains [CHAINS] - Magmorax",
		["uid"] = "KAAYw64pGnS",
		["parent"] = "7. Icons - Low Priority - Magmorax",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "7. Magmorax",
		["id"] = "7. Icons - High Priority - Magmorax",
		["children"] = {
			"7. Molten Spittle Bomb [SOAK\\nBOMB] - Magmorax",
			"7. Molten Spittle normal [POOL\\nSPAWN] - Magmorax",
			"7. Molten Spittle normal (LFR/N/H) [POOL\\nSPAWN] - Magmorax ",
			"7. Incinerating Maws - Magmorax",
		},
		["uid"] = "MQyjl4DcnOR",
	},
	{
		["id"] = "7. Molten Spittle Bomb [SOAK\\nBOMB] - Magmorax",
		["uid"] = "3ZYv6Xk)e62",
		["parent"] = "7. Icons - High Priority - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Molten Spittle normal [POOL\\nSPAWN] - Magmorax",
		["uid"] = "B4SlazyM8n2",
		["parent"] = "7. Icons - High Priority - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Molten Spittle normal (LFR/N/H) [POOL\\nSPAWN] - Magmorax ",
		["uid"] = "m6xGLSYV2E6",
		["parent"] = "7. Icons - High Priority - Magmorax",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Incinerating Maws - Magmorax",
		["uid"] = "rEccWuYDT)m",
		["parent"] = "7. Icons - High Priority - Magmorax",
		["echoVersion"] = 1,
	},
},1208,0);

--fixUpNestedPreview(7,1208,"7. Magmorax");