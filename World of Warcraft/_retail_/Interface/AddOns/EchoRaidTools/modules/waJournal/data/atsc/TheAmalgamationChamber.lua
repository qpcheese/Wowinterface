
local _AddonName, _EchoRaidTools = ...;

local journal = _EchoRaidTools:GetModule("waJournal");

-- 2. export data

journal:AddImportData({["2. Lingering Shadows - The Amalgamation Chamber"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"409299","Lingering Shadows",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["use_debuffClass"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["useExactSpellId"] = false,["names"] = {"Sacred Blade",},["use_genericShowOn"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["useName"] = true,["spellName"] = 0,["unevent"] = "auto",["unit"] = "player",["auraspellids"] = {},["subeventSuffix"] = "_CAST_START",["type"] = "aura2",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["duration"] = "3",["remOperator"] = "<",["use_unit"] = true,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "+%1.tooltip3%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip3_format"] = "none",["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_text_format_tooltip2_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = true,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2687",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["color"] = {1,1,1,1,},["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["auto"] = true,["zoom"] = 0,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "2. Lingering Shadows - The Amalgamation Chamber",["cooldownEdge"] = false,["frameStrata"] = 1,["width"] = 55,["alpha"] = 1,["uid"] = "t97lOBZLUkt",["inverse"] = false,["xOffset"] = 0,["selfPoint"] = "CENTER",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["desaturate"] = false,},["2. Flame Slash Cast [TANK SLASH] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.011764707043767,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["zoneIds"] = "",["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["use_role"] = true,["encounterid"] = "2687",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "FOFVe)0hxuW",["displayIcon"] = "135827",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "2. Bars - The Amalgamation Chamber",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["config"] = {},["customTextUpdate"] = "update",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 403203,["auranames"] = {"Advanced Recombobulation","362732",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = true,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "boss",["subeventSuffix"] = "_CAST_START",["use_tooltip"] = false,["ignoreSelf"] = true,["spellName"] = 0,["use_unit"] = true,["use_genericShowOn"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["use_exact_spellId"] = false,["type"] = "unit",["buffShowOn"] = "showOnActive",["unevent"] = "auto",["useName"] = true,["subeventPrefix"] = "SPELL",["auraspellids"] = {},["names"] = {"Sacred Blade",},["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["duration"] = "3",["remOperator"] = "<",["group_countOperator"] = ">",["use_debuffClass"] = false,["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "custom",["custom"] = "function()\
    return aura_env.isBossInRange()\
end",["custom_type"] = "event",["custom_hide"] = "custom",["debuffType"] = "HELPFUL",["events"] = "TRIGGER:1",["unit"] = "player",},["untrigger"] = {["custom"] = "function()\
    return not aura_env.isBossInRange()\
end",},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(trigger)\
    return trigger[1]\
end",["activeTriggerMode"] = 1,},["sparkColor"] = {1,1,1,1,},["internalVersion"] = 65,["textSize"] = 12,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["spark"] = false,["stickyDuration"] = false,["sparkRotation"] = 0,["width"] = 240,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "TANK SLASH",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["rotateText"] = "NONE",["text_text_format_1.destName_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.destName_abbreviate_max"] = 12,["text_text_format_1.destName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_text_format_1.destName_format"] = "Unit",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_justify"] = "CENTER",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.destName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["type"] = "subborder",["border_offset"] = 0,["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["sparkRotationMode"] = "AUTO",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["url"] = "https://echoesports.gg",["source"] = "import",["sparkHidden"] = "NEVER",["height"] = 23,["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["semver"] = "1.0.5",["borderInFront"] = false,["sparkWidth"] = 3,["icon_side"] = "LEFT",["zoom"] = 0,["borderSize"] = 16,["sparkHeight"] = 14,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["borderBackdrop"] = "Blizzard Tooltip",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["xOffset"] = 0,["id"] = "2. Flame Slash Cast [TANK SLASH] - The Amalgamation Chamber",["borderOffset"] = 5,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["custom"] = "aura_env.LRC = LibStub(\"LibRangeCheck-2.0\")\
aura_env.bossName = \"Eternal Blaze\"\
\
function aura_env.isBossInRange()\
    local unit = aura_env.getUnitFromName(aura_env.bossName, \"boss\")\
    return aura_env.isUnitInRange(unit)\
end\
\
function aura_env.isUnitInRange(unit)\
    local unitRange, _ = aura_env.LRC and unit and aura_env.LRC:GetRange(unit) or math.huge\
    return unitRange <= 40\
end\
\
function aura_env.getUnitFromName(name, type)\
    for i = 1, 40 do\
        local unit = type .. tostring(i)\
        local unitName, _ = UnitName(unit)\
        if unitName == name then\
            return unit\
        end\
    end\
end",["do_custom"] = true,},["finish"] = {},},["backdropColor"] = {1,1,1,0.5,},["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {{["changes"] = {{["value"] = 0,["property"] = "alpha",},},["check"] = {["value"] = 0,["variable"] = "show",["trigger"] = 2,},},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},},["2. Swirling Flame Cast [TORNADOES] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.41960787773132,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "451169",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["color"] = {},["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "2. Bars - The Amalgamation Chamber",["spark"] = false,["borderOffset"] = 5,["customTextUpdate"] = "update",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 404896,["auranames"] = {"364963","Core Overload",},["use_genericShowOn"] = true,["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["useExactSpellId"] = false,["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["custom_type"] = "event",["use_absorbMode"] = true,["names"] = {"Sacred Blade",},["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["matchesShowOn"] = "showOnActive",["type"] = "unit",["debuffType"] = "HARMFUL",["auraspellids"] = {},["unevent"] = "auto",["duration"] = "10",["unit"] = "boss",["useName"] = true,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_unit"] = true,["remOperator"] = "<",["spellName"] = 0,["use_absorbHealMode"] = true,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(trigger)\
    return trigger[1]\
end",["activeTriggerMode"] = 1,},["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["custom"] = "aura_env.LRC = LibStub(\"LibRangeCheck-2.0\")\
aura_env.bossName = \"Eternal Blaze\"\
\
function aura_env.isBossInRange()\
    local unit = aura_env.getUnitFromName(aura_env.bossName, \"boss\")\
    return aura_env.isUnitInRange(unit)\
end\
\
function aura_env.isUnitInRange(unit)\
    local unitRange, _ = aura_env.LRC and unit and aura_env.LRC:GetRange(unit) or math.huge\
    return unitRange <= 40\
end\
\
function aura_env.getUnitFromName(name, type)\
    for i = 1, 40 do\
        local unit = type .. tostring(i)\
        local unitName, _ = UnitName(unit)\
        if unitName == name then\
            return unit\
        end\
    end\
end",["do_custom"] = true,},},["internalVersion"] = 65,["url"] = "https://echoesports.gg",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["rotate"] = 0,["easeStrength"] = 3,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["anchorFrameType"] = "SCREEN",["stickyDuration"] = false,["adjustedMax"] = "4",["height"] = 23,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "TORNADOES",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_legacy_floor"] = true,},{["type"] = "subborder",["border_size"] = 1,["border_anchor"] = "bar",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},},["timer"] = true,["timerFlags"] = "None",["id"] = "2. Swirling Flame Cast [TORNADOES] - The Amalgamation Chamber",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["icon"] = true,["source"] = "import",["timerSize"] = 12,["displayTextRight"] = "%p",["sparkRotationMode"] = "AUTO",["border"] = false,["borderEdge"] = "None",["borderBackdrop"] = "Blizzard Tooltip",["borderSize"] = 16,["sparkWidth"] = 3,["icon_side"] = "LEFT",["adjustedMin"] = "4",["borderInFront"] = false,["sparkHeight"] = 14,["xOffset"] = 0,["zoom"] = 0,["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["textSize"] = 12,["sparkHidden"] = "NEVER",["useAdjustededMax"] = false,["frameStrata"] = 1,["width"] = 240,["uid"] = "KRpBd1AjE2n",["borderColor"] = {1,1,1,0.5,},["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["sparkColor"] = {1,1,1,1,},},["2. Coalescing Void Boom [BOOM] - The Amalgamation Chamber"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.44313728809357,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2687",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "1097742",["textColor"] = {1,1,1,1,},["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["borderBackdrop"] = "Blizzard Tooltip",["uid"] = "ZS2KMPf8qkG",["color"] = {},["cooldown"] = true,["customText"] = "function()\
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
",["sparkColor"] = {1,1,1,1,},["displayTextLeft"] = "%n",["parent"] = "2. Bars - The Amalgamation Chamber",["cooldownSwipe"] = true,["url"] = "https://echoesports.gg",["sparkRotationMode"] = "AUTO",["cooldownEdge"] = false,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = "403459",["auranames"] = {"Interdimensional Wormhole","362721",},["duration"] = "4",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Combat Log",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_exact_spellId"] = true,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "boss",["useExactSpellId"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["subeventPrefix"] = "SPELL",["matchesShowOn"] = "showOnActive",["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["use_genericShowOn"] = true,["type"] = "combatlog",["spellName"] = 0,["auraspellids"] = {},["debuffType"] = "HARMFUL",["unevent"] = "auto",["custom_hide"] = "timed",["useName"] = true,["realSpellName"] = 0,["use_spellName"] = false,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_unit"] = true,["remOperator"] = "<",["names"] = {"Sacred Blade",},["use_debuffClass"] = false,["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "custom",["custom"] = "function()\
    return aura_env.isBossInRange()\
end",["custom_type"] = "event",["custom_hide"] = "custom",["debuffType"] = "HELPFUL",["events"] = "TRIGGER:1",["unit"] = "player",},["untrigger"] = {["custom"] = "function()\
    return not aura_env.isBossInRange()\
end",},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(trigger)\
    return trigger[1]\
end",["activeTriggerMode"] = 1,},["anchorFrameType"] = "SCREEN",["internalVersion"] = 65,["stacksFlags"] = "None",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["cooldownTextDisabled"] = false,["stickyDuration"] = false,["sparkHidden"] = "NEVER",["height"] = 23,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BOOM",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},},["timer"] = true,["timerFlags"] = "None",["displayTextRight"] = "%p",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["semver"] = "1.0.4",["source"] = "import",["borderColor"] = {1,1,1,0.5,},["customTextUpdate"] = "update",["textFlags"] = "None",["border"] = false,["borderEdge"] = "None",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["borderSize"] = 16,["actions"] = {["start"] = {},["init"] = {["custom"] = "aura_env.LRC = LibStub(\"LibRangeCheck-2.0\")\
aura_env.bossName = \"Essence of Shadow\"\
\
function aura_env.isBossInRange()\
    local unit = aura_env.getUnitFromName(aura_env.bossName, \"boss\")\
    return aura_env.isUnitInRange(unit)\
end\
\
function aura_env.isUnitInRange(unit)\
    local unitRange, _ = aura_env.LRC and unit and aura_env.LRC:GetRange(unit) or math.huge\
    return unitRange <= 40\
end\
\
function aura_env.getUnitFromName(name, type)\
    for i = 1, 40 do\
        local unit = type .. tostring(i)\
        local unitName, _ = UnitName(unit)\
        if unitName == name then\
            return unit\
        end\
    end\
end",["do_custom"] = true,},["finish"] = {},},["icon_side"] = "LEFT",["borderInFront"] = false,["stacksFont"] = "Friz Quadrata TT",["sparkHeight"] = 14,["config"] = {},["backdropColor"] = {1,1,1,0.5,},["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["spark"] = false,["id"] = "2. Coalescing Void Boom [BOOM] - The Amalgamation Chamber",["authorOptions"] = {},["frameStrata"] = 1,["width"] = 240,["adjustedMin"] = "4",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["inverse"] = false,["borderOffset"] = 5,["orientation"] = "HORIZONTAL",["conditions"] = {{["changes"] = {{["value"] = 0,["property"] = "alpha",},},["check"] = {["value"] = 0,["variable"] = "show",["trigger"] = 2,},},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkOffsetX"] = 0,},["Fire/Shadow Debuff Controller"] = {["outline"] = "OUTLINE",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["do_custom"] = false,},["finish"] = {["do_custom"] = false,},["init"] = {["do_custom"] = true,["custom"] = "aura_env.FIRE = \"FIRE\"\
aura_env.SHADOW = \"SHADOW\"\
\
aura_env.unitStates = {}\
aura_env.highestStacks = {\
    [aura_env.FIRE] = 0,\
    [aura_env.SHADOW] = 0,\
}\
\
function aura_env.updateUnitState(unit, auraType, stacks)\
    aura_env.unitStates[unit] = aura_env.unitStates[unit] or {\
        [aura_env.FIRE] = 0,\
        [aura_env.SHADOW] = 0,\
    }\
    aura_env.unitStates[unit][auraType] = stacks\
end",},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["unit"] = "player",["debuffType"] = "HELPFUL",["subeventPrefix"] = "SPELL",["events"] = "TRIGGER:2:3",["names"] = {},["custom_type"] = "event",["spellIds"] = {},["custom"] = "function(_, triggerNum, triggerStates)\
    if not triggerStates then\
        return\
    end\
    \
    local auraType = triggerNum == 2 and aura_env.FIRE or aura_env.SHADOW\
    aura_env.highestStacks[auraType] = 0\
    \
    for _, state in pairs(triggerStates) do\
        local stacks = state.stacks or 0\
        aura_env.updateUnitState(state.unit, auraType, stacks)\
        aura_env.highestStacks[auraType] = math.max(aura_env.highestStacks[auraType], stacks)\
    end\
    \
    WeakAuras.ScanEvents(\"ECHO_FIRE_SHADOW\", aura_env.unitStates, aura_env.highestStacks)\
end",["custom_hide"] = "timed",},["untrigger"] = {},},[2] = {["trigger"] = {["showClones"] = true,["useName"] = true,["useStacks"] = false,["subeventSuffix"] = "_CAST_START",["combinePerUnit"] = true,["unit"] = "group",["event"] = "Health",["names"] = {},["subeventPrefix"] = "SPELL",["useExactSpellId"] = false,["spellIds"] = {},["useGroup_count"] = false,["type"] = "aura2",["perUnitMode"] = "all",["auranames"] = {"402617",},["debuffType"] = "BOTH",},["untrigger"] = {},},[3] = {["trigger"] = {["showClones"] = true,["useName"] = true,["useStacks"] = false,["useGroup_count"] = false,["perUnitMode"] = "all",["unit"] = "group",["auranames"] = {"401809",},["useExactSpellId"] = false,["auraspellids"] = {"377853",},["combinePerUnit"] = true,["type"] = "aura2",["debuffType"] = "BOTH",},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = 1,},["displayText_format_p_time_mod_rate"] = true,["internalVersion"] = 65,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["font"] = "Friz Quadrata TT",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2687",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 12,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_format"] = "timed",["wordWrap"] = "WordWrap",["conditions"] = {},["url"] = "https://echoesports.gg",["displayText_format_p_time_legacy_floor"] = false,["displayText_format_p_time_precision"] = 1,["displayText"] = "",["uid"] = "K)L5lTxfsR9",["color"] = {1,1,1,1,},["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "Fire/Shadow Debuff Controller",["parent"] = "2. Fire/Shadow lists - The Amalgamation Chamber",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["config"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["shadowYOffset"] = -1,["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["selfPoint"] = "BOTTOM",},["2. Fiery Meteor Cast [BIG SOAK] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["custom"] = "aura_env.LRC = LibStub(\"LibRangeCheck-2.0\")\
aura_env.bossName = \"Eternal Blaze\"\
\
function aura_env.isBossInRange()\
    local unit = aura_env.getUnitFromName(aura_env.bossName, \"boss\")\
    return aura_env.isUnitInRange(unit)\
end\
\
function aura_env.isUnitInRange(unit)\
    local unitRange, _ = aura_env.LRC and unit and aura_env.LRC:GetRange(unit) or math.huge\
    return unitRange <= 40\
end\
\
function aura_env.getUnitFromName(name, type)\
    for i = 1, 40 do\
        local unit = type .. tostring(i)\
        local unitName, _ = UnitName(unit)\
        if unitName == name then\
            return unit\
        end\
    end\
end",["do_custom"] = true,},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.43137258291245,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2687",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "1033911",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["color"] = {},["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "2. Bars - The Amalgamation Chamber",["sparkRotationMode"] = "AUTO",["uid"] = "Y4xMbWp1FV0",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 404732,["auranames"] = {"Advanced Recombobulation","362732",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = true,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_debuffClass"] = false,["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbMode"] = true,["unit"] = "boss",["matchesShowOn"] = "showOnActive",["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["use_genericShowOn"] = true,["type"] = "unit",["spellName"] = 0,["unevent"] = "auto",["useName"] = true,["auraspellids"] = {},["custom_type"] = "event",["buffShowOn"] = "showOnActive",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_unit"] = true,["remOperator"] = "<",["subeventPrefix"] = "SPELL",["subeventSuffix"] = "_CAST_START",["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "custom",["events"] = "TRIGGER:1",["custom_type"] = "event",["custom_hide"] = "custom",["custom"] = "function()\
    return aura_env.isBossInRange()\
end",["debuffType"] = "HELPFUL",["unit"] = "player",},["untrigger"] = {["custom"] = "function()\
    return not aura_env.isBossInRange()\
end",},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(trigger)\
    return trigger[1]\
end",["activeTriggerMode"] = 1,},["spark"] = false,["internalVersion"] = 65,["textSize"] = 12,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["rotate"] = 0,["easeStrength"] = 3,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderOffset"] = 5,["stickyDuration"] = false,["icon"] = true,["anchorFrameType"] = "SCREEN",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BIG SOAK",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["rotateText"] = "NONE",["text_text_format_1.destName_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.destName_abbreviate_max"] = 12,["text_text_format_1.destName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_text_format_1.destName_format"] = "Unit",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_justify"] = "CENTER",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.destName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["type"] = "subborder",["border_offset"] = 0,["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["height"] = 23,["timerFlags"] = "None",["timer"] = true,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["rotateText"] = "NONE",["source"] = "import",["id"] = "2. Fiery Meteor Cast [BIG SOAK] - The Amalgamation Chamber",["customTextUpdate"] = "update",["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["timerSize"] = 12,["borderInFront"] = false,["zoom"] = 0,["icon_side"] = "LEFT",["sparkWidth"] = 3,["borderBackdrop"] = "Blizzard Tooltip",["sparkHeight"] = 14,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["borderSize"] = 16,["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["xOffset"] = 0,["sparkHidden"] = "NEVER",["sparkColor"] = {1,1,1,1,},["frameStrata"] = 1,["width"] = 240,["sparkRotation"] = 0,["backdropColor"] = {1,1,1,0.5,},["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 2,["variable"] = "show",["value"] = 0,},["changes"] = {{["value"] = 0,["property"] = "alpha",},},},},["barColor2"] = {1,1,0,1,},["borderInset"] = 11,},["2. Convergent Eruption Soak [SOAKS + BALLS] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["do_custom"] = false,},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.41960787773132,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2687",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "DYg3793xaD0",["displayIcon"] = "332402",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "2. Bars - The Amalgamation Chamber",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["color"] = {},["customTextUpdate"] = "update",["sparkColor"] = {1,1,1,1,},["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = "408193",["auranames"] = {"Advanced Recombobulation","362732",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = true,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Combat Log",["use_spellId"] = true,["name"] = "Plasma Discharge",["use_sourceUnit"] = false,["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "boss",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["names"] = {"Sacred Blade",},["subeventPrefix"] = "SPELL",["use_unit"] = true,["buffShowOn"] = "showOnActive",["spellIds"] = {283573,},["type"] = "combatlog",["useExactSpellId"] = false,["auraspellids"] = {},["group_countOperator"] = ">",["debuffType"] = "HARMFUL",["unevent"] = "auto",["useName"] = true,["realSpellName"] = 0,["use_spellName"] = false,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "5.2",["remOperator"] = "<",["use_genericShowOn"] = true,["use_debuffClass"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["config"] = {},["internalVersion"] = 65,["useAdjustededMax"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["rotate"] = 0,["easeStrength"] = 3,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderColor"] = {1,1,1,0.5,},["stickyDuration"] = false,["auto"] = true,["anchorFrameType"] = "SCREEN",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SOAKS + BALLS",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_text_format_destName_format"] = "Unit",["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_anchorYOffset"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate"] = false,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["border_offset"] = 0,["type"] = "subborder",["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["authorOptions"] = {},["source"] = "import",["id"] = "2. Convergent Eruption Soak [SOAKS + BALLS] - The Amalgamation Chamber",["borderBackdrop"] = "Blizzard Tooltip",["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["displayTextLeft"] = "%n",["borderInFront"] = false,["sparkWidth"] = 3,["icon_side"] = "LEFT",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["borderSize"] = 16,["sparkHeight"] = 14,["zoom"] = 0,["timerSize"] = 12,["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["stacksFont"] = "Friz Quadrata TT",["sparkHidden"] = "NEVER",["sparkRotationMode"] = "AUTO",["frameStrata"] = 1,["width"] = 240,["url"] = "https://echoesports.gg",["icon"] = true,["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["borderInset"] = 11,},["2. Texts (anchored) - The Amalgamation Chamber"] = {["grow"] = "DOWN",["controlledChildren"] = {"2. Intermission - [SPREAD] - The Amalgamation Chamer",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["gridType"] = "RD",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 65,["useLimit"] = false,["align"] = "CENTER",["rotation"] = 0,["fullCircle"] = true,["subRegions"] = {},["stagger"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["anchorPoint"] = "CENTER",["backdropColor"] = {1,1,1,0.5,},["arcLength"] = 360,["animate"] = false,["config"] = {},["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["source"] = "import",["borderInset"] = 1,["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["rowSpace"] = 1,["borderOffset"] = 4,["sort"] = "none",["tocversion"] = 100100,["id"] = "2. Texts (anchored) - The Amalgamation Chamber",["xOffset"] = 0,["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["anchorFrameFrame"] = "WeakAuras:Texts - Anchor",["uid"] = "y3Qk0GvWnRN",["parent"] = "2. Singles - The Amalgamation Chamber",["sortHybridTable"] = {["2. Intermission - [SPREAD] - The Amalgamation Chamer"] = false,},["radius"] = 200,["conditions"] = {},["information"] = {},["selfPoint"] = "TOP",},["Fire/Shadow Debuff Bar"] = {["sparkWidth"] = 10,["sparkOffsetX"] = 0,["parent"] = "Fire/Shadow Debuff List",["preferToUpdate"] = false,["customText"] = "\
\
",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["sparkRotationMode"] = "AUTO",["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.80994279682636,},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["custom_type"] = "stateupdate",["customVariables"] = "{\
    debuffType = \"string\"\
}",["event"] = "Health",["unit"] = "player",["names"] = {},["custom"] = "function(allstates, _, unitStates, highestStacks)\
    if WeakAuras.IsOptionsOpen() then\
        unitStates, highestStacks = aura_env.createFakeStates()\
    end\
    \
    if not (unitStates and highestStacks) then\
        return\
    end\
    \
    for _, state in pairs(allstates) do\
        state.show = false\
        state.changed = true\
    end\
    \
    local playerAuraState = aura_env.getPlayerAuraState(unitStates)\
    local numUnitsWithOppositeDebuff = aura_env.countUnitsWithOppositeDebuff(playerAuraState, unitStates)\
    for unit, unitState in pairs(unitStates) do\
        local unitAuraState = aura_env.getUnitAuraState(unitState)\
        local unitHasOppositeDebuff = unitAuraState.majorDebuffType == playerAuraState.minorDebuffType\
        local maxProgressValue = math.max(highestStacks[aura_env.FIRE], highestStacks[aura_env.SHADOW])\
        allstates[unit] = {\
            show = aura_env.config.scripeMode or (unitHasOppositeDebuff and unitAuraState.majorStacks > 0 and numUnitsWithOppositeDebuff <= aura_env.config.playerCount),\
            changed = true,\
            unit = UnitExists(unit) and unit or \"player\",\
            debuffType = unitAuraState.majorDebuffType,\
            majorStacks = unitAuraState.majorStacks,\
            minorStacks = unitAuraState.minorStacks,\
            stacksDisplay = aura_env.getStacksDisplayStr(unitAuraState),\
            icon = aura_env.getIcon(unit, unitAuraState),\
            progressType = \"static\",\
            value = aura_env.config.useProgressBars and unitAuraState.majorStacks or maxProgressValue,\
            total = maxProgressValue,\
        }\
    end\
    \
    return true\
end",["events"] = "ECHO_FIRE_SHADOW",["spellIds"] = {},["check"] = "event",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["debuffType"] = "HELPFUL",["use_stage"] = true,["stage"] = "2",["stage_operator"] = "==",["event"] = "BigWigs Stage",["unit"] = "player",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(trigger)\
    return aura_env.config.scripeMode and trigger[1] or (trigger[1] and trigger[2])\
end",["activeTriggerMode"] = 1,},["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["iconSource"] = -1,["barColor"] = {0.60784316062927,0.12549020349979,0,1,},["desaturate"] = false,["information"] = {["forceEvents"] = false,["ignoreOptionsEventErrors"] = false,},["actions"] = {["start"] = {},["init"] = {["do_custom"] = true,["custom"] = "aura_env.CLASS_ICONS = {\
    [1] = 626008, -- Warrior\
    [2] = 626003, -- Paladin\
    [3] = 626000, -- Hunter\
    [4] = 626005, -- Rogue\
    [5] = 626004, -- Priest\
    [6] = 625998, -- DeathKnight\
    [7] = 626006, -- Shaman\
    [8] = 626001, -- Mage\
    [9] = 626007, -- Warlock\
    [10] = 626002, -- Monk\
    [11] = 625999, -- Druid\
    [12] = 1260827, -- Demon Hunter\
    [13] = 4574311, -- Evoker\
}\
\
aura_env.FIRE = \"FIRE\"\
aura_env.SHADOW = \"SHADOW\"\
\
aura_env.SPELL_ICONS = {\
    [aura_env.FIRE] = 236297,\
    [aura_env.SHADOW] = 237557,\
}\
\
aura_env.SPELL_COLORS = {\
    [aura_env.FIRE] = \"11ff4d00\",\
    [aura_env.SHADOW] = \"11c219ff\",\
}\
\
function aura_env.getPlayerAuraState(unitStates)\
    for unit, unitState in pairs(unitStates) do\
        if UnitIsUnit(unit, \"player\") then\
            return aura_env.getUnitAuraState(unitState)\
        end\
    end\
end\
\
function aura_env.getUnitAuraState(unitState)\
    local fireStacks = unitState[aura_env.FIRE]\
    local shadowStacks = unitState[aura_env.SHADOW]\
    return {\
        majorDebuffType = fireStacks >= shadowStacks and aura_env.FIRE or aura_env.SHADOW,\
        minorDebuffType = fireStacks < shadowStacks and aura_env.FIRE or aura_env.SHADOW,\
        majorStacks = math.max(fireStacks, shadowStacks),\
        minorStacks = math.min(fireStacks, shadowStacks)\
    }\
end\
\
function aura_env.getStacksDisplayStr(unitAuraState)\
    local result = tostring(unitAuraState.majorStacks)\
    if unitAuraState.minorStacks > 0 and aura_env.config.displayMinorStacks then\
        local color = aura_env.SPELL_COLORS[unitAuraState.minorDebuffType]\
        result = (\"|c%s(%d) \"):format(color, unitAuraState.minorStacks) .. result\
    end\
    return result\
end\
\
function aura_env.getIcon(unit, unitAuraState)\
    if aura_env.config.useClassIcon then\
        return aura_env.CLASS_ICONS[select(3, UnitClass(unit)) or 0]\
    else\
        return aura_env.SPELL_ICONS[unitAuraState.majorDebuffType]\
    end\
end\
\
function aura_env.countUnitsWithOppositeDebuff(playerAuraState, unitStates)\
    return AccumulateOp(unitStates, function(unitState)\
            local unitAuraState = aura_env.getUnitAuraState(unitState)\
            local unitHasOppositeDebuff = unitAuraState.majorDebuffType == playerAuraState.minorDebuffType\
            return unitHasOppositeDebuff and 1 or 0\
    end)\
end\
\
function aura_env.createFakeStates()\
    local maxStacks = 15\
    local unitStates = {}\
    local highestStacks = {\
        [aura_env.FIRE] = maxStacks,\
        [aura_env.SHADOW] = maxStacks,\
    }\
    \
    for i = 1, 20 do\
        local unit = i == 1 and \"player\" or \"raid\" .. tostring(i)\
        local preferFire = math.floor(math.random() * 2) == 0\
        local majorDebuffType = preferFire and aura_env.FIRE or aura_env.SHADOW\
        local minorDebuffType = preferFire and aura_env.SHADOW or aura_env.FIRE\
        unitStates[unit] = {\
            [majorDebuffType] = math.floor(math.random() * (maxStacks + 1)),\
            [minorDebuffType] = math.random() > 0.75 and math.floor(math.random() * maxStacks / 3) or 0,\
        }\
    end\
    \
    return unitStates, highestStacks\
end",},["finish"] = {},},["sparkOffsetY"] = 0,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["type"] = "subborder",["border_offset"] = 0,["text_text"] = "",["border_size"] = 2,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["text_shadowXOffset"] = 1,["text_text_format_1.unit_abbreviate"] = true,["text_text"] = "%1.unit",["text_text_format_1.unit_abbreviate_max"] = 6,["text_text_format_1.unit_realm_name"] = "never",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.name_format"] = "string",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.unit_format"] = "Unit",["text_text_format_player_format"] = "none",["text_fontSize"] = 15,["type"] = "subtext",["text_text_format_n_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_1.unitt_format"] = "none",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unit_color"] = "class",["text_shadowColor"] = {0,0,0,0.58837404847145,},["text_text_format_1.name_abbreviate_max"] = 8,["anchorXOffset"] = 0,["text_text_format_1.name_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%1.stacksDisplay",["text_text_format_1.unit_abbreviate_max"] = 5,["text_shadowColor"] = {0,0,0,0.23085284233093,},["text_fixedWidth"] = 64,["text_text_format_1.p_time_format"] = 0,["text_text_format_c_format"] = "none",["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_fontSize"] = 15,["text_text_format_1.tooltip2_format"] = "BigNumber",["text_text_format_1.unit_format"] = "Unit",["text_text_format_1.unit_abbreviate"] = true,["text_text_format_1.p_time_legacy_floor"] = false,["text_text_format_1.unit_realm_name"] = "never",["text_text_format_1.c_format"] = "none",["text_automaticWidth"] = "Auto",["text_text_format_1.stacksDisplay_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["text_text_format_1.p_time_precision"] = 1,["text_text_format_1.tooltip2_big_number_format"] = "AbbreviateNumbers",["text_text_format_1.unit_color"] = "class",["text_font"] = "Friz Quadrata TT",["type"] = "subtext",["text_selfPoint"] = "AUTO",["text_text_format_1.p_time_dynamic_threshold"] = 0,["text_text_format_1.unitt_format"] = "none",["text_text_format_1.p_format"] = "timed",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_n_format"] = "none",["text_fontType"] = "OUTLINE",["text_text_format_1.p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_text_format_1.s_format"] = "none",},},["gradientOrientation"] = "HORIZONTAL",["internalVersion"] = 65,["load"] = {["use_namerealm"] = false,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2687",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["namerealm"] = "",["class"] = {["multi"] = {},},["use_difficulty"] = true,["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["source"] = "import",["icon_side"] = "LEFT",["config"] = {["displayMinorStacks"] = false,["useClassIcon"] = true,["scripeMode"] = false,["useProgressBars"] = true,["playerCount"] = 4,},["height"] = 21,["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["sparkDesaturate"] = false,["sparkColor"] = {1,1,1,1,},["sparkHidden"] = "NEVER",["sparkHeight"] = 30,["texture"] = "Solid",["zoom"] = 0,["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["spark"] = false,["tocversion"] = 100100,["id"] = "Fire/Shadow Debuff Bar",["icon"] = true,["alpha"] = 1,["width"] = 140,["authorOptions"] = {{["type"] = "toggle",["key"] = "scripeMode",["width"] = 1,["default"] = true,["name"] = "Scripe mode",["useDesc"] = true,["desc"] = "Always display both columns",},{["type"] = "toggle",["key"] = "displayMinorStacks",["width"] = 1,["default"] = true,["name"] = "Display minor stacks",["useDesc"] = true,["desc"] = "Display both stack count for units with both debuffs",},{["type"] = "toggle",["key"] = "useProgressBars",["desc"] = "Bar progress will be relative to the player with the highest stacks",["useDesc"] = true,["name"] = "Use progress bars",["default"] = true,["width"] = 1,},{["type"] = "toggle",["useDesc"] = false,["key"] = "useClassIcon",["name"] = "Use class icons",["default"] = true,["width"] = 1,},{["type"] = "range",["useDesc"] = true,["max"] = 20,["step"] = 1,["width"] = 1,["min"] = 0,["name"] = "Player count threshold",["desc"] = "List will only show when fewer than x players have the opposite debuff",["key"] = "playerCount",["default"] = 4,},},["uid"] = "kjV4MaVluT(",["inverse"] = false,["xOffset"] = 0,["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "customcheck",["value"] = "function(state, ...)\
    return state[1].debuffType == \"SHADOW\"\
end",},["changes"] = {{["value"] = {0.30196079611778,0,0.42745101451874,1,},["property"] = "barColor",},},},},["barColor2"] = {1,1,0,1,},["useTooltip"] = false,},["2. Fire/Shadow lists - The Amalgamation Chamber"] = {["controlledChildren"] = {"Fire/Shadow Debuff Controller","Fire/Shadow Debuff List",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 414.07800292969,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["internalVersion"] = 65,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["anchorFrameParent"] = false,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "2. Fire/Shadow lists - The Amalgamation Chamber",["parent"] = "2. Singles - The Amalgamation Chamber",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["anchorFrameFrame"] = "WeakAuras:Scripe Lists - Anchor",["borderInset"] = 1,["xOffset"] = -880.64277648926,["uid"] = "dhbpYazTDHD",["config"] = {},["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["2. Umbral Detonation - Circle - The Amalgamation Chamber"] = {["user_y"] = 0,["iconSource"] = -1,["user_x"] = 0,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["foregroundColor"] = {0.83921575546265,0.33333334326744,1,1,},["echoVersion"] = 2,["sameTexture"] = true,["url"] = "https://echoesports.gg",["backgroundColor"] = {0.16078431904316,0.16078431904316,0.16078431904316,0.48795199394226,},["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["startAngle"] = 0,["useAdjustededMin"] = false,["regionType"] = "progresstexture",["blendMode"] = "BLEND",["slantMode"] = "INSIDE",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["alpha"] = 1,["uid"] = "SzmoOqd2mCd",["displayIcon"] = 3528301,["backgroundOffset"] = 0,["color"] = {1,1,1,1,},["desaturateBackground"] = false,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["desaturateForeground"] = false,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"405036","Umbral Detonation",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["custom_type"] = "event",["unit"] = "player",["subeventPrefix"] = "SPELL",["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["buffShowOn"] = "showOnActive",["type"] = "aura2",["custom_hide"] = "timed",["unevent"] = "auto",["use_genericShowOn"] = true,["auraspellids"] = {"405036",},["useName"] = true,["use_unit"] = true,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "3",["remOperator"] = "<",["use_debuffClass"] = false,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 65,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "TOP",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorXOffset"] = 0,["text_text_format_p_format"] = "timed",["text_text_format_p_time_precision"] = 1,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {0.98823529411765,0.99607843137255,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_p_time_format"] = 0,["text_anchorXOffset"] = 0,["text_fontSize"] = 14,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "BOTTOMRIGHT",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 5,["text_color"] = {0.98823529411765,0.99607843137255,1,1,},["text_font"] = "Friz Quadrata TT",["anchorXOffset"] = 0,["text_shadowYOffset"] = 0,["text_text_format_tooltip2_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = false,["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["type"] = "subborder",["text_text"] = "",["border_offset"] = 0,["border_color"] = {1,1,1,1,},["border_visible"] = false,["border_edge"] = "Square Full White",["border_size"] = 1,},},["height"] = 150,["useAdjustededMax"] = false,["fontSize"] = 12,["source"] = "import",["mirror"] = false,["crop_y"] = 0.41,["cooldown"] = true,["crop_x"] = 0.41,["cooldownTextDisabled"] = false,["auraRotation"] = 0,["authorOptions"] = {},["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",["actions"] = {["start"] = {["do_sound"] = false,},["init"] = {},["finish"] = {},},["width"] = 150,["parent"] = "2. Singles - The Amalgamation Chamber",["semver"] = "1.0.4",["frameStrata"] = 1,["id"] = "2. Umbral Detonation - Circle - The Amalgamation Chamber",["anchorPoint"] = "CENTER",["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["icon"] = true,["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",["inverse"] = false,["config"] = {},["orientation"] = "ANTICLOCKWISE",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["compress"] = false,},["2. Shadows Convergence Cast [DODGE BALLS] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["custom"] = "aura_env.LRC = LibStub(\"LibRangeCheck-2.0\")\
aura_env.bossName = \"Essence of Shadow\"\
\
function aura_env.isBossInRange()\
    local unit = aura_env.getUnitFromName(aura_env.bossName, \"boss\")\
    return aura_env.isUnitInRange(unit)\
end\
\
function aura_env.isUnitInRange(unit)\
    local unitRange, _ = aura_env.LRC and unit and aura_env.LRC:GetRange(unit) or math.huge\
    return unitRange <= 40\
end\
\
function aura_env.getUnitFromName(name, type)\
    for i = 1, 40 do\
        local unit = type .. tostring(i)\
        local unitName, _ = UnitName(unit)\
        if unitName == name then\
            return unit\
        end\
    end\
end",["do_custom"] = true,},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.37647062540054,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "458969",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["color"] = {},["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["parent"] = "2. Bars - The Amalgamation Chamber",["textSize"] = 12,["sparkColor"] = {1,1,1,1,},["customTextUpdate"] = "update",["timer"] = true,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 407640,["auranames"] = {"364963","Core Overload",},["duration"] = "10",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["use_absorbMode"] = true,["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "boss",["matchesShowOn"] = "showOnActive",["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["use_genericShowOn"] = true,["type"] = "unit",["group_countOperator"] = ">",["unevent"] = "auto",["use_unit"] = true,["auraspellids"] = {},["buffShowOn"] = "showOnActive",["useName"] = true,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["names"] = {"Sacred Blade",},["remOperator"] = "<",["custom_type"] = "event",["use_absorbHealMode"] = true,["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "custom",["events"] = "TRIGGER:1",["custom_type"] = "event",["unit"] = "player",["debuffType"] = "HELPFUL",["custom"] = "function()\
    return aura_env.isBossInRange()\
end",["custom_hide"] = "custom",},["untrigger"] = {["custom"] = "function()\
    return not aura_env.isBossInRange()\
end",},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(trigger)\
    return trigger[1]\
end",["activeTriggerMode"] = 1,},["icon"] = true,["internalVersion"] = 65,["rotateText"] = "NONE",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["easeStrength"] = 3,["rotate"] = 0,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["anchorFrameType"] = "SCREEN",["stickyDuration"] = false,["config"] = {},["adjustedMax"] = "4",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "DODGE BALLS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["anchorXOffset"] = 0,["anchorYOffset"] = 0,},{["border_offset"] = 0,["border_size"] = 1,["text_text"] = "",["border_anchor"] = "bar",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["type"] = "subborder",},},["height"] = 23,["timerFlags"] = "None",["id"] = "2. Shadows Convergence Cast [DODGE BALLS] - The Amalgamation Chamber",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["auto"] = true,["source"] = "import",["timerSize"] = 12,["displayTextRight"] = "%p",["customText"] = "function()\
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
",["border"] = false,["borderEdge"] = "None",["sparkWidth"] = 3,["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["zoom"] = 0,["borderBackdrop"] = "Blizzard Tooltip",["sparkHeight"] = 14,["borderOffset"] = 5,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["authorOptions"] = {},["sparkHidden"] = "NEVER",["useAdjustededMax"] = false,["frameStrata"] = 1,["width"] = 240,["sparkRotation"] = 0,["sparkRotationMode"] = "AUTO",["inverse"] = false,["stacksFont"] = "Friz Quadrata TT",["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 2,["variable"] = "show",["value"] = 0,},["changes"] = {{["value"] = 0,["property"] = "alpha",},},},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "GtITZCAyMQa",},["2. Icons - Low Priority - The Amalgamation Chamber"] = {["arcLength"] = 360,["controlledChildren"] = {"2. Lingering Shadows - The Amalgamation Chamber","2. Lingering Flames - The Amalgamation Chamber","2. Engulfing Heat [MOVE] - The Amalgamation Chamber","2. Lingering Umbra [MOVE] - The Amalgamation Chamber","2. Corrupting Shadow P1 - The Amalgamation Chamber","2. Blazing Heat P1 - The Amalgamation Chamber","2. Shadowflame - The Amalgamation Chamber",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["gridType"] = "RD",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 65,["selfPoint"] = "RIGHT",["align"] = "CENTER",["rotation"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["useLimit"] = false,["fullCircle"] = true,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["animate"] = false,["backdropColor"] = {1,1,1,0.5,},["sort"] = "none",["source"] = "import",["config"] = {},["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Icon - Low Priority - Anchor",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["grow"] = "LEFT",["anchorPoint"] = "CENTER",["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["rowSpace"] = 1,["borderOffset"] = 4,["borderEdge"] = "Square Full White",["tocversion"] = 100100,["id"] = "2. Icons - Low Priority - The Amalgamation Chamber",["uid"] = "Sy4AInzVNBW",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["parent"] = "2. The Amalgamation Chamber",["borderInset"] = 1,["authorOptions"] = {},["sortHybridTable"] = {["2. Engulfing Heat [MOVE] - The Amalgamation Chamber"] = false,["2. Shadowflame - The Amalgamation Chamber"] = false,["2. Lingering Flames - The Amalgamation Chamber"] = false,["2. Lingering Shadows - The Amalgamation Chamber"] = false,["2. Lingering Umbra [MOVE] - The Amalgamation Chamber"] = false,["2. Blazing Heat P1 - The Amalgamation Chamber"] = false,["2. Corrupting Shadow P1 - The Amalgamation Chamber"] = false,},["radius"] = 200,["conditions"] = {},["information"] = {},["stagger"] = 0,},["2. The Amalgamation Chamber"] = {["controlledChildren"] = {"2. Icons - High Priority - The Amalgamation Chamber","2. Icons - Low Priority - The Amalgamation Chamber","2. Bars - The Amalgamation Chamber","2. Singles - The Amalgamation Chamber",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "!Echo - Aberrus",["preferToUpdate"] = false,["groupIcon"] = 5161743,["anchorPoint"] = "CENTER",["echoVersion"] = 7,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["internalVersion"] = 65,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "2. The Amalgamation Chamber",["xOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["yOffset"] = 0,["borderInset"] = 1,["authorOptions"] = {},["config"] = {},["uid"] = "Wm0kS1yciTy",["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["2. Lingering Umbra [MOVE] - The Amalgamation Chamber"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"405083","Lingering Umbra",},["duration"] = "3",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["useExactSpellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "player",["names"] = {"Sacred Blade",},["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["buffShowOn"] = "showOnActive",["type"] = "aura2",["custom_hide"] = "timed",["unevent"] = "auto",["matchesShowOn"] = "showOnActive",["auraspellids"] = {},["useName"] = true,["subeventPrefix"] = "SPELL",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_genericShowOn"] = true,["remOperator"] = "<",["use_debuffClass"] = false,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "MOVE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.ttoltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = false,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["source"] = "import",["cooldownEdge"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["xOffset"] = 0,["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",["uid"] = "wuJNb(qPUcx",["zoom"] = 0,["width"] = 55,["frameStrata"] = 1,["auto"] = true,["cooldownTextDisabled"] = false,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "2. Lingering Umbra [MOVE] - The Amalgamation Chamber",["icon"] = true,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["config"] = {},["inverse"] = false,["authorOptions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayIcon"] = 3528301,["cooldown"] = true,["stickyDuration"] = false,},["2. Icons - High Priority - The Amalgamation Chamber"] = {["arcLength"] = 360,["controlledChildren"] = {"2. Umbral Detonation [BOMB] - The Amalgamation Chamber","2. Blistering Twilight [BOMB] - The Amalgamation Chamber","Withering Vulnerability - The Amalgamation Chamber","2. Corrupting Shadow P2 - The Amalgamation Chamber","2. Blazing Heat P2 - The Amalgamation Chamber",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["gridType"] = "RD",["echoVersion"] = 1,["fullCircle"] = true,["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 65,["selfPoint"] = "RIGHT",["align"] = "CENTER",["rotation"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["useLimit"] = false,["borderColor"] = {0,0,0,1,},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["animate"] = false,["backdropColor"] = {1,1,1,0.5,},["sort"] = "none",["source"] = "import",["uid"] = "avtY))wgdd6",["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Icon - High Priority - Anchor",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["grow"] = "LEFT",["anchorPoint"] = "CENTER",["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["rowSpace"] = 1,["borderOffset"] = 4,["borderEdge"] = "Square Full White",["tocversion"] = 100100,["id"] = "2. Icons - High Priority - The Amalgamation Chamber",["config"] = {},["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["authorOptions"] = {},["borderInset"] = 1,["parent"] = "2. The Amalgamation Chamber",["sortHybridTable"] = {["2. Umbral Detonation [BOMB] - The Amalgamation Chamber"] = false,["2. Corrupting Shadow P2 - The Amalgamation Chamber"] = false,["2. Blistering Twilight [BOMB] - The Amalgamation Chamber"] = false,["Withering Vulnerability - The Amalgamation Chamber"] = false,["2. Blazing Heat P2 - The Amalgamation Chamber"] = false,},["radius"] = 200,["conditions"] = {},["information"] = {},["stagger"] = 0,},["2. Umbral Detonation Cast [BOMBS] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["custom"] = "aura_env.LRC = LibStub(\"LibRangeCheck-2.0\")\
aura_env.bossName = \"Essence of Shadow\"\
\
function aura_env.isBossInRange()\
    local unit = aura_env.getUnitFromName(aura_env.bossName, \"boss\")\
    return aura_env.isUnitInRange(unit)\
end\
\
function aura_env.isUnitInRange(unit)\
    local unitRange, _ = aura_env.LRC and unit and aura_env.LRC:GetRange(unit) or math.huge\
    return unitRange <= 40\
end\
\
function aura_env.getUnitFromName(name, type)\
    for i = 1, 40 do\
        local unit = type .. tostring(i)\
        local unitName, _ = UnitName(unit)\
        if unitName == name then\
            return unit\
        end\
    end\
end",["do_custom"] = true,},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.43529415130615,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2687",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "136201",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["color"] = {},["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "2. Bars - The Amalgamation Chamber",["textSize"] = 12,["config"] = {},["sparkRotationMode"] = "AUTO",["spark"] = false,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 405016,["auranames"] = {"364963","Core Overload",},["use_genericShowOn"] = true,["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["use_absorbMode"] = true,["use_exact_spellId"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "boss",["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbHealMode"] = true,["use_unit"] = true,["duration"] = "10",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["matchesShowOn"] = "showOnActive",["useName"] = true,["debuffType"] = "HARMFUL",["auraspellids"] = {},["type"] = "unit",["subeventSuffix"] = "_CAST_START",["unevent"] = "auto",["subeventPrefix"] = "SPELL",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["names"] = {"Sacred Blade",},["remOperator"] = "<",["spellName"] = 0,["useExactSpellId"] = false,["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "custom",["events"] = "TRIGGER:1",["custom_type"] = "event",["custom_hide"] = "custom",["custom"] = "function()\
    return aura_env.isBossInRange()\
end",["debuffType"] = "HELPFUL",["unit"] = "player",},["untrigger"] = {["custom"] = "function()\
    return not aura_env.isBossInRange()\
end",},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(trigger)\
    return trigger[1]\
end",["activeTriggerMode"] = 1,},["rotateText"] = "NONE",["internalVersion"] = 65,["icon"] = true,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["width"] = 240,["stickyDuration"] = false,["borderInset"] = 11,["stacksFlags"] = "None",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BOMBS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_destName_abbreviate_max"] = 8,["text_fontType"] = "OUTLINE",["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_offset"] = 0,["border_size"] = 1,["text_text"] = "",["border_anchor"] = "bar",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["type"] = "subborder",},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["borderOffset"] = 5,["source"] = "import",["displayTextRight"] = "%p",["semver"] = "1.0.5",["customText"] = "function()\
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
",["border"] = false,["borderEdge"] = "None",["sparkWidth"] = 3,["borderSize"] = 16,["zoom"] = 0,["icon_side"] = "LEFT",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["borderBackdrop"] = "Blizzard Tooltip",["sparkHeight"] = 14,["borderInFront"] = false,["authorOptions"] = {},["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["timer"] = true,["id"] = "2. Umbral Detonation Cast [BOMBS] - The Amalgamation Chamber",["backdropColor"] = {1,1,1,0.5,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["customTextUpdate"] = "update",["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 2,["variable"] = "show",["value"] = 0,},["changes"] = {{["value"] = 0,["property"] = "alpha",},},},},["barColor2"] = {1,1,0,1,},["uid"] = "x5XDlNWfcv1",},["2. Singles - The Amalgamation Chamber"] = {["controlledChildren"] = {"2. Fire/Shadow lists - The Amalgamation Chamber","2. Add Health - The Amalgamation Chamber","2. Umbral Detonation - Circle - The Amalgamation Chamber","2. Blistering Twilight - Circle - The Amalgamation Chamber","2. Spell CDs on Nameplates - The Amalgamation Chamber","2. Texts (anchored) - The Amalgamation Chamber",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["internalVersion"] = 65,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["anchorFrameFrame"] = "WeakAuras:Singles - Anchor",["regionType"] = "group",["borderSize"] = 2,["anchorFrameParent"] = false,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "2. Singles - The Amalgamation Chamber",["parent"] = "2. The Amalgamation Chamber",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "rt12Bw0O0Co",["config"] = {},["selfPoint"] = "CENTER",["borderInset"] = 1,["conditions"] = {},["information"] = {},["borderEdge"] = "Square Full White",},["2. Bars - The Amalgamation Chamber"] = {["arcLength"] = 360,["controlledChildren"] = {"2. Fiery Meteor Cast [BIG SOAK] - The Amalgamation Chamber","2. Molten Eruption Cast [SOAKS INC] - The Amalgamation Chamber","2. Molten Eruption Soak [SOAKS] - The Amalgamation Chamber","2. Swirling Flame Cast [TORNADOES] - The Amalgamation Chamber","2. Flame Slash Cast [TANK SLASH] - The Amalgamation Chamber","2. Coalescing Void Cast [RUN AWAY] - The Amalgamation Chamber","2. Coalescing Void Boom [BOOM] - The Amalgamation Chamber","2. Umbral Detonation Cast [BOMBS] - The Amalgamation Chamber","2. Shadows Convergence Cast [DODGE BALLS] - The Amalgamation Chamber","2. Shadow Spike Cast [TANK SLASH] - The Amalgamation Chamber","2. Gloom Conflagration Cast [BIG SOAK + RUN AWAY] - The Amalgamation Chamber","2. Gloom Conflagration Boom [BOOM] - The Amalgamation Chamber","2. Blistering Twilight Cast [BOMBS + TORNADOES] - The Amalgamation Chamber","2. Convergent Eruption Cast Cast [SOAKS + BALLS INC] - The Amalgamation Chamber","2. Convergent Eruption Soak [SOAKS + BALLS] - The Amalgamation Chamber","2. Withering Vulnerability Cast [TANK SLASH] - The Amalgamation Chamber","2. Shadowflame Burst Cast [FRONTAL CONE] - The Amalgamation Chamber","2. Shadow and Flame [MARKS] - The Amalgamation Chamber",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["gridType"] = "RD",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 65,["selfPoint"] = "BOTTOM",["align"] = "CENTER",["rotation"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["useLimit"] = false,["fullCircle"] = true,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["animate"] = false,["backdropColor"] = {1,1,1,0.5,},["sort"] = "none",["source"] = "import",["config"] = {},["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Bars - Anchor",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["grow"] = "UP",["anchorPoint"] = "CENTER",["frameStrata"] = 1,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["rowSpace"] = 1,["borderOffset"] = 4,["borderEdge"] = "Square Full White",["tocversion"] = 100100,["id"] = "2. Bars - The Amalgamation Chamber",["uid"] = "CPxCIZCoeP0",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["parent"] = "2. The Amalgamation Chamber",["borderInset"] = 1,["authorOptions"] = {},["sortHybridTable"] = {["2. Flame Slash Cast [TANK SLASH] - The Amalgamation Chamber"] = false,["2. Swirling Flame Cast [TORNADOES] - The Amalgamation Chamber"] = false,["2. Coalescing Void Boom [BOOM] - The Amalgamation Chamber"] = false,["2. Withering Vulnerability Cast [TANK SLASH] - The Amalgamation Chamber"] = false,["2. Fiery Meteor Cast [BIG SOAK] - The Amalgamation Chamber"] = false,["2. Convergent Eruption Soak [SOAKS + BALLS] - The Amalgamation Chamber"] = false,["2. Shadow and Flame [MARKS] - The Amalgamation Chamber"] = false,["2. Convergent Eruption Cast Cast [SOAKS + BALLS INC] - The Amalgamation Chamber"] = false,["2. Molten Eruption Soak [SOAKS] - The Amalgamation Chamber"] = false,["2. Shadows Convergence Cast [DODGE BALLS] - The Amalgamation Chamber"] = false,["2. Shadowflame Burst Cast [FRONTAL CONE] - The Amalgamation Chamber"] = false,["2. Shadow Spike Cast [TANK SLASH] - The Amalgamation Chamber"] = false,["2. Coalescing Void Cast [RUN AWAY] - The Amalgamation Chamber"] = false,["2. Gloom Conflagration Boom [BOOM] - The Amalgamation Chamber"] = false,["2. Gloom Conflagration Cast [BIG SOAK + RUN AWAY] - The Amalgamation Chamber"] = false,["2. Blistering Twilight Cast [BOMBS + TORNADOES] - The Amalgamation Chamber"] = false,["2. Molten Eruption Cast [SOAKS INC] - The Amalgamation Chamber"] = false,["2. Umbral Detonation Cast [BOMBS] - The Amalgamation Chamber"] = false,},["radius"] = 200,["conditions"] = {},["information"] = {},["stagger"] = 0,},["2. Intermission - [SPREAD] - The Amalgamation Chamer"] = {["outline"] = "OUTLINE",["color"] = {1,1,1,1,},["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "event",["spellId"] = "406730",["subeventSuffix"] = "_CAST_START",["duration"] = "3",["event"] = "Spell Cast Succeeded",["unit"] = "boss1",["use_spellId"] = true,["spellIds"] = {},["subeventPrefix"] = "SPELL",["names"] = {},["use_specific_unit"] = true,["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 65,["wordWrap"] = "WordWrap",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_encounterid"] = true,["talent"] = {["multi"] = {},},["encounterid"] = "2687",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 20,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["url"] = "https://echoesports.gg",["displayText_format_p_time_legacy_floor"] = false,["conditions"] = {},["displayText_format_p_time_mod_rate"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayText_format_p_time_precision"] = 1,["parent"] = "2. Texts (anchored) - The Amalgamation Chamber",["config"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["justify"] = "LEFT",["tocversion"] = 100100,["id"] = "2. Intermission - [SPREAD] - The Amalgamation Chamer",["xOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["uid"] = "Ote(G5HYw3d",["displayText"] = "SPREAD",["yOffset"] = 0,["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["selfPoint"] = "BOTTOM",},["2. Umbral Detonation [BOMB] - The Amalgamation Chamber"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"405036","Umbral Detonation",},["duration"] = "3",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["custom_type"] = "event",["unit"] = "player",["use_unit"] = true,["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["buffShowOn"] = "showOnActive",["type"] = "aura2",["custom_hide"] = "timed",["unevent"] = "auto",["use_genericShowOn"] = true,["auraspellids"] = {"405036",},["useName"] = true,["subeventPrefix"] = "SPELL",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["use_debuffClass"] = false,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "BOMB",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.ttoltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = false,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["icon"] = true,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "2. Icons - High Priority - The Amalgamation Chamber",["authorOptions"] = {},["uid"] = "PjxJBWMQhK2",["cooldownTextDisabled"] = false,["width"] = 55,["frameStrata"] = 1,["semver"] = "1.0.4",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["id"] = "2. Umbral Detonation [BOMB] - The Amalgamation Chamber",["cooldownEdge"] = false,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["config"] = {},["inverse"] = false,["color"] = {1,1,1,1,},["desaturate"] = false,["displayIcon"] = 3528301,["cooldown"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["2. Blistering Twilight [BOMB] - The Amalgamation Chamber"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"405642","Blistering Twilight",},["use_genericShowOn"] = true,["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["use_debuffClass"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["use_unit"] = true,["matchesShowOn"] = "showOnActive",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["useName"] = true,["spellName"] = 0,["unevent"] = "auto",["subeventPrefix"] = "SPELL",["auraspellids"] = {"405036",},["custom_type"] = "event",["type"] = "aura2",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["duration"] = "3",["remOperator"] = "<",["unit"] = "player",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "BOMB",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_text_format_tooltip2_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = false,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2687",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["parent"] = "2. Icons - High Priority - The Amalgamation Chamber",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["cooldownEdge"] = false,["config"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["auto"] = true,["cooldownTextDisabled"] = false,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "2. Blistering Twilight [BOMB] - The Amalgamation Chamber",["zoom"] = 0,["useCooldownModRate"] = true,["width"] = 55,["selfPoint"] = "CENTER",["uid"] = "TiKZAyZ8SVJ",["inverse"] = false,["authorOptions"] = {},["xOffset"] = 0,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["stickyDuration"] = false,},["2. Gloom Conflagration Boom [BOOM] - The Amalgamation Chamber"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.40392160415649,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "4914678",["textColor"] = {1,1,1,1,},["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["borderBackdrop"] = "Blizzard Tooltip",["uid"] = "kRv4Hc83h8c",["parent"] = "2. Bars - The Amalgamation Chamber",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["customText"] = "function()\
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
",["color"] = {},["cooldownTextDisabled"] = false,["zoom"] = 0,["cooldownSwipe"] = true,["textSize"] = 12,["sparkRotationMode"] = "AUTO",["cooldownEdge"] = false,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = "405437",["auranames"] = {"Interdimensional Wormhole","362721",},["use_genericShowOn"] = true,["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Combat Log",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["useExactSpellId"] = false,["use_exact_spellId"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "boss",["use_debuffClass"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["custom_hide"] = "timed",["subeventPrefix"] = "SPELL",["matchesShowOn"] = "showOnActive",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["duration"] = "6.5",["useName"] = true,["use_absorbMode"] = true,["unevent"] = "auto",["buffShowOn"] = "showOnActive",["type"] = "combatlog",["auraspellids"] = {},["group_countOperator"] = ">",["realSpellName"] = 0,["use_spellName"] = false,["spellIds"] = {283573,},["names"] = {"Sacred Blade",},["remOperator"] = "<",["use_unit"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["width"] = 240,["internalVersion"] = 65,["stacksFlags"] = "None",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["url"] = "https://echoesports.gg",["stickyDuration"] = false,["id"] = "2. Gloom Conflagration Boom [BOOM] - The Amalgamation Chamber",["authorOptions"] = {},["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BOOM",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_destName_abbreviate_max"] = 8,["text_fontType"] = "OUTLINE",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["border_offset"] = 0,["type"] = "subborder",["border_anchor"] = "bar",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},},["timer"] = true,["timerFlags"] = "None",["semver"] = "1.0.4",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["timerSize"] = 12,["source"] = "import",["borderColor"] = {1,1,1,0.5,},["backdropColor"] = {1,1,1,0.5,},["config"] = {},["border"] = false,["borderEdge"] = "None",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["borderSize"] = 16,["stacksFont"] = "Friz Quadrata TT",["icon_side"] = "LEFT",["borderInFront"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["sparkHeight"] = 14,["textFlags"] = "None",["customTextUpdate"] = "update",["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["height"] = 23,["sparkHidden"] = "NEVER",["sparkColor"] = {1,1,1,1,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["adjustedMin"] = "4",["auto"] = true,["inverse"] = false,["cooldown"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["sparkOffsetX"] = 0,},["Withering Vulnerability - The Amalgamation Chamber"] = {["iconSource"] = -1,["parent"] = "2. Icons - High Priority - The Amalgamation Chamber",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"405914","Crushing Vulnerability",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["names"] = {"Sacred Blade",},["subeventPrefix"] = "SPELL",["use_unit"] = true,["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["useName"] = true,["useExactSpellId"] = false,["unevent"] = "auto",["auraspellids"] = {"405036",},["type"] = "aura2",["use_absorbHealMode"] = true,["group_countOperator"] = ">",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_genericShowOn"] = true,["remOperator"] = "<",["duration"] = "3",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%tooltip2%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip2_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.ttoltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = false,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["source"] = "import",["authorOptions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["url"] = "https://echoesports.gg",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "DH2IhCeRsKk",["frameStrata"] = 1,["width"] = 55,["useCooldownModRate"] = true,["auto"] = true,["zoom"] = 0,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "Withering Vulnerability - The Amalgamation Chamber",["cooldownTextDisabled"] = false,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["icon"] = true,["config"] = {},["inverse"] = false,["color"] = {1,1,1,1,},["xOffset"] = 0,["displayIcon"] = 3528301,["cooldown"] = true,["stickyDuration"] = false,},["2. Withering Vulnerability Cast [TANK SLASH] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.011764707043767,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["zoneIds"] = "",["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["use_role"] = true,["encounterid"] = "2687",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "m(xDW4v82ZY",["displayIcon"] = "4914674",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "2. Bars - The Amalgamation Chamber",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["borderInset"] = 11,["customTextUpdate"] = "update",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 405914,["auranames"] = {"Advanced Recombobulation","362732",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = true,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["custom_type"] = "event",["use_tooltip"] = false,["ignoreSelf"] = true,["spellName"] = 0,["unit"] = "boss",["use_genericShowOn"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["use_exact_spellId"] = false,["type"] = "unit",["buffShowOn"] = "showOnActive",["unevent"] = "auto",["useName"] = true,["subeventPrefix"] = "SPELL",["auraspellids"] = {},["names"] = {"Sacred Blade",},["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["group_countOperator"] = ">",["use_absorbHealMode"] = true,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["sparkColor"] = {1,1,1,1,},["internalVersion"] = 65,["displayTextLeft"] = "%n",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["easeStrength"] = 3,["rotate"] = 0,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["spark"] = false,["stickyDuration"] = false,["url"] = "https://echoesports.gg",["width"] = 240,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "TANK SLASH",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["rotateText"] = "NONE",["text_text_format_1.destName_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.destName_abbreviate_max"] = 12,["text_text_format_1.destName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_text_format_1.destName_format"] = "Unit",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_justify"] = "CENTER",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.destName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["type"] = "subborder",["border_offset"] = 0,["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["borderColor"] = {1,1,1,0.5,},["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["sparkRotationMode"] = "AUTO",["source"] = "import",["sparkHidden"] = "NEVER",["height"] = 23,["timerSize"] = 12,["border"] = false,["borderEdge"] = "None",["semver"] = "1.0.5",["borderInFront"] = false,["sparkWidth"] = 3,["icon_side"] = "LEFT",["zoom"] = 0,["borderSize"] = 16,["sparkHeight"] = 14,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["borderBackdrop"] = "Blizzard Tooltip",["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["authorOptions"] = {},["id"] = "2. Withering Vulnerability Cast [TANK SLASH] - The Amalgamation Chamber",["borderOffset"] = 5,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["icon"] = true,["useAdjustededMax"] = false,["inverse"] = false,["config"] = {},["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},},["2. Shadow Spike Cast [TANK SLASH] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["custom"] = "aura_env.LRC = LibStub(\"LibRangeCheck-2.0\")\
aura_env.bossName = \"Essence of Shadow\"\
\
function aura_env.isBossInRange()\
    local unit = aura_env.getUnitFromName(aura_env.bossName, \"boss\")\
    return aura_env.isUnitInRange(unit)\
end\
\
function aura_env.isUnitInRange(unit)\
    local unitRange, _ = aura_env.LRC and unit and aura_env.LRC:GetRange(unit) or math.huge\
    return unitRange <= 40\
end\
\
function aura_env.getUnitFromName(name, type)\
    for i = 1, 40 do\
        local unit = type .. tostring(i)\
        local unitName, _ = UnitName(unit)\
        if unitName == name then\
            return unit\
        end\
    end\
end",["do_custom"] = true,},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.37647062540054,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["use_role"] = true,["encounterid"] = "2687",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "1035040",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "2. Bars - The Amalgamation Chamber",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["sparkRotationMode"] = "AUTO",["sparkColor"] = {1,1,1,1,},["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 403699,["auranames"] = {"Advanced Recombobulation","362732",},["duration"] = "3",["group_count"] = "0",["spellName"] = 0,["showClones"] = true,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_debuffClass"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["use_exact_spellId"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["use_unit"] = true,["matchesShowOn"] = "showOnActive",["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["use_genericShowOn"] = true,["type"] = "unit",["useExactSpellId"] = false,["unevent"] = "auto",["useName"] = true,["auraspellids"] = {},["debuffType"] = "HARMFUL",["group_countOperator"] = ">",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["unit"] = "boss",["remOperator"] = "<",["subeventPrefix"] = "SPELL",["custom_hide"] = "timed",["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "custom",["custom"] = "function()\
    return aura_env.isBossInRange()\
end",["custom_type"] = "event",["custom_hide"] = "custom",["debuffType"] = "HELPFUL",["events"] = "TRIGGER:1",["unit"] = "player",},["untrigger"] = {["custom"] = "function()\
    return not aura_env.isBossInRange()\
end",},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(trigger)\
    return trigger[1]\
end",["activeTriggerMode"] = 1,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["internalVersion"] = 65,["displayTextLeft"] = "%n",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["easeStrength"] = 3,["rotate"] = 0,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["spark"] = false,["stickyDuration"] = false,["rotateText"] = "NONE",["anchorFrameType"] = "SCREEN",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "TANK SLASH",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["rotateText"] = "NONE",["text_text_format_1.destName_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.destName_abbreviate_max"] = 12,["text_text_format_1.destName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_text_format_1.destName_format"] = "Unit",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_justify"] = "CENTER",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.destName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["type"] = "subborder",["border_offset"] = 0,["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["height"] = 23,["timerFlags"] = "None",["timer"] = true,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["sparkRotation"] = 0,["source"] = "import",["id"] = "2. Shadow Spike Cast [TANK SLASH] - The Amalgamation Chamber",["customTextUpdate"] = "update",["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["timerSize"] = 12,["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["zoom"] = 0,["sparkWidth"] = 3,["sparkHeight"] = 14,["borderBackdrop"] = "Blizzard Tooltip",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["xOffset"] = 0,["sparkHidden"] = "NEVER",["stacksFont"] = "Friz Quadrata TT",["frameStrata"] = 1,["width"] = 240,["icon"] = true,["useAdjustededMax"] = false,["inverse"] = false,["uid"] = "88tpX232mJW",["orientation"] = "HORIZONTAL",["conditions"] = {{["changes"] = {{["value"] = 0,["property"] = "alpha",},},["check"] = {["value"] = 0,["variable"] = "show",["trigger"] = 2,},},},["barColor2"] = {1,1,0,1,},["config"] = {},},["2. Corrupting Shadow P2 - The Amalgamation Chamber"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"401809","Corrupting Shadow",},["duration"] = "3",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["spellName"] = 0,["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbHealMode"] = true,["names"] = {"Sacred Blade",},["matchesShowOn"] = "showOnActive",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["use_genericShowOn"] = true,["useName"] = true,["subeventSuffix"] = "_CAST_START",["auraspellids"] = {},["buffShowOn"] = "showOnActive",["use_unit"] = true,["unevent"] = "auto",["type"] = "aura2",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["subeventPrefix"] = "SPELL",["remOperator"] = "<",["group_countOperator"] = ">",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["debuffType"] = "HELPFUL",["use_stage"] = true,["stage"] = "2",["stage_operator"] = "==",["event"] = "BigWigs Stage",["unit"] = "player",},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_1.tooltip3_format"] = "none",["text_visible"] = false,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_anchorXOffset"] = 7,["text_text_format_1.tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["anchorXOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = true,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["useGlowColor"] = false,["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2687",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["use_never"] = false,["zoneIds"] = "",},["source"] = "import",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["cooldownEdge"] = false,["xOffset"] = 0,["config"] = {},["zoom"] = 0,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["auto"] = true,["cooldownTextDisabled"] = false,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "2. Corrupting Shadow P2 - The Amalgamation Chamber",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["desaturate"] = false,["uid"] = "iL)OyCa3eFD",["inverse"] = false,["parent"] = "2. Icons - High Priority - The Amalgamation Chamber",["color"] = {1,1,1,1,},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["2. Blazing Heat P2 - The Amalgamation Chamber"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"402617","Blazing Heat",},["use_genericShowOn"] = true,["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["use_absorbHealMode"] = true,["use_tooltip"] = false,["ignoreSelf"] = true,["custom_hide"] = "timed",["subeventPrefix"] = "SPELL",["use_unit"] = true,["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["matchesShowOn"] = "showOnActive",["useName"] = true,["unit"] = "player",["auraspellids"] = {},["type"] = "aura2",["unevent"] = "auto",["useExactSpellId"] = false,["buffShowOn"] = "showOnActive",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["duration"] = "3",["remOperator"] = "<",["group_countOperator"] = ">",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["debuffType"] = "HELPFUL",["use_stage"] = true,["stage"] = "2",["stage_operator"] = "==",["event"] = "BigWigs Stage",["unit"] = "player",},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = false,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tolltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.ttoltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_anchorXOffset"] = 7,},{["glowFrequency"] = 0.25,["glow"] = false,["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["useGlowColor"] = false,["type"] = "subglow",["glowScale"] = 1,["glowThickness"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["zoneIds"] = "",["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["encounterid"] = "2687",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["use_never"] = false,["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["desaturate"] = false,["uid"] = "iYo2X9tTm2J",["frameStrata"] = 1,["width"] = 55,["alpha"] = 1,["semver"] = "1.0.4",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "2. Blazing Heat P2 - The Amalgamation Chamber",["zoom"] = 0,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["url"] = "https://echoesports.gg",["config"] = {},["inverse"] = false,["parent"] = "2. Icons - High Priority - The Amalgamation Chamber",["authorOptions"] = {},["displayIcon"] = 3528301,["cooldown"] = true,["color"] = {1,1,1,1,},},["2. Spell CDs on Nameplates - The Amalgamation Chamber"] = {["arcLength"] = 360,["controlledChildren"] = {"2. Spell CDs - The Amalgamation Chamber",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 30,["preferToUpdate"] = false,["yOffset"] = 0,["gridType"] = "RD",["echoVersion"] = 1,["fullCircle"] = true,["useAnchorPerUnit"] = true,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 65,["useLimit"] = false,["align"] = "CENTER",["radius"] = 200,["stagger"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["rowSpace"] = 1,["subRegions"] = {},["borderColor"] = {0,0,0,1,},["uid"] = "pNasxgqHKK6",["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["borderInset"] = 1,["backdropColor"] = {1,1,1,0.5,},["anchorPoint"] = "RIGHT",["source"] = "import",["animate"] = false,["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["limit"] = 5,["frameStrata"] = 1,["sort"] = "none",["parent"] = "2. Singles - The Amalgamation Chamber",["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["anchorPerUnit"] = "NAMEPLATE",["borderOffset"] = 4,["grow"] = "RIGHT",["tocversion"] = 100100,["id"] = "2. Spell CDs on Nameplates - The Amalgamation Chamber",["authorOptions"] = {},["gridWidth"] = 5,["anchorFrameType"] = "SCREEN",["groupIcon"] = "Interface\\AddOns\\!!!EchoInternal\\assets\\textures\\Journal\\ELp1",["config"] = {},["sortHybridTable"] = {["2. Spell CDs - The Amalgamation Chamber"] = false,},["space"] = 2,["selfPoint"] = "LEFT",["conditions"] = {},["information"] = {},["rotation"] = 0,},["2. Lingering Flames - The Amalgamation Chamber"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"409320","Lingering Flames",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["useExactSpellId"] = false,["use_unit"] = true,["use_genericShowOn"] = true,["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["duration"] = "3",["type"] = "aura2",["spellName"] = 0,["unevent"] = "auto",["debuffType"] = "HARMFUL",["unit"] = "player",["auraspellids"] = {},["useName"] = true,["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["names"] = {"Sacred Blade",},["remOperator"] = "<",["use_absorbHealMode"] = true,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "+%1.tooltip3%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.ttoltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_tooltip2_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_visible"] = true,["text_anchorYOffset"] = -6,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["cooldownEdge"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",["color"] = {1,1,1,1,},["uid"] = "6Khoaqhcxtx",["zoom"] = 0,["width"] = 55,["frameStrata"] = 1,["auto"] = true,["cooldownTextDisabled"] = false,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "2. Lingering Flames - The Amalgamation Chamber",["desaturate"] = false,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["config"] = {},["inverse"] = false,["authorOptions"] = {},["icon"] = true,["displayIcon"] = 3528301,["cooldown"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["2. Engulfing Heat [MOVE] - The Amalgamation Chamber"] = {["iconSource"] = -1,["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"405645","Engulfing Heat",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["use_debuffClass"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["useExactSpellId"] = false,["names"] = {"Sacred Blade",},["use_genericShowOn"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["useName"] = true,["spellName"] = 0,["unevent"] = "auto",["subeventPrefix"] = "SPELL",["auraspellids"] = {},["subeventSuffix"] = "_CAST_START",["type"] = "aura2",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["duration"] = "3",["remOperator"] = "<",["unit"] = "player",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "MOVE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_text_format_tooltip2_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = false,["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2687",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["url"] = "https://echoesports.gg",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["xOffset"] = 0,["authorOptions"] = {},["config"] = {},["zoom"] = 0,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["semver"] = "1.0.4",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100100,["id"] = "2. Engulfing Heat [MOVE] - The Amalgamation Chamber",["stickyDuration"] = false,["frameStrata"] = 1,["width"] = 55,["useCooldownModRate"] = true,["uid"] = "JfyR3pUIBaN",["inverse"] = false,["color"] = {1,1,1,1,},["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["2. Corrupting Shadow P1 - The Amalgamation Chamber"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"401809","Corrupting Shadow",},["duration"] = "3",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["custom_type"] = "event",["unit"] = "player",["names"] = {"Sacred Blade",},["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["buffShowOn"] = "showOnActive",["type"] = "aura2",["custom_hide"] = "timed",["unevent"] = "auto",["matchesShowOn"] = "showOnActive",["auraspellids"] = {},["useName"] = true,["subeventPrefix"] = "SPELL",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_genericShowOn"] = true,["remOperator"] = "<",["use_debuffClass"] = false,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["unit"] = "player",["use_stage"] = true,["event"] = "BigWigs Stage",["stage_operator"] = "==",["stage"] = "1",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = false,["text_fontSize"] = 14,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["anchorXOffset"] = 0,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["zoneIds"] = "",["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["use_zoneIds"] = false,["encounterid"] = "2687",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["authorOptions"] = {},["color"] = {1,1,1,1,},["uid"] = "vsbVUinuEtI",["zoom"] = 0,["width"] = 55,["frameStrata"] = 1,["auto"] = true,["cooldownTextDisabled"] = false,["semver"] = "1.0.4",["tocversion"] = 100100,["id"] = "2. Corrupting Shadow P1 - The Amalgamation Chamber",["url"] = "https://echoesports.gg",["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["config"] = {},["inverse"] = false,["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",["stickyDuration"] = false,["displayIcon"] = 3528301,["cooldown"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["2. Shadow and Flame [MARKS] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["do_custom"] = false,},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = true,["selfPoint"] = "CENTER",["barColor"] = {0.43921571969986,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["use_zoneIds"] = false,["encounterid"] = "2687",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["class"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "ii()01Us0N4",["displayIcon"] = "1387353",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "2. Bars - The Amalgamation Chamber",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["sparkRotationMode"] = "AUTO",["borderOffset"] = 5,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 409385,["auranames"] = {"Advanced Recombobulation","362732",},["use_genericShowOn"] = true,["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = true,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["custom_type"] = "event",["use_tooltip"] = false,["ignoreSelf"] = true,["useExactSpellId"] = false,["use_debuffClass"] = false,["use_unit"] = true,["duration"] = "3",["debuffType"] = "HARMFUL",["spellIds"] = {283573,},["useName"] = true,["matchesShowOn"] = "showOnActive",["unevent"] = "auto",["type"] = "unit",["buffShowOn"] = "showOnActive",["unit"] = "boss",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["subeventPrefix"] = "SPELL",["remOperator"] = "<",["spellName"] = 0,["group_countOperator"] = ">",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["borderInset"] = 11,["internalVersion"] = 65,["backdropColor"] = {1,1,1,0.5,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["easeStrength"] = 3,["rotate"] = 0,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkColor"] = {1,1,1,1,},["stickyDuration"] = false,["customTextUpdate"] = "update",["anchorFrameType"] = "SCREEN",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "MARKS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["rotateText"] = "NONE",["text_text_format_1.destName_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.destName_abbreviate_max"] = 12,["text_text_format_1.destName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_text_format_1.destName_format"] = "Unit",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_justify"] = "CENTER",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.destName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["type"] = "subborder",["border_offset"] = 0,["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["rotateText"] = "NONE",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["authorOptions"] = {},["source"] = "import",["id"] = "2. Shadow and Flame [MARKS] - The Amalgamation Chamber",["height"] = 23,["timerSize"] = 12,["border"] = false,["borderEdge"] = "None",["displayTextRight"] = "%p",["borderInFront"] = false,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["icon_side"] = "LEFT",["borderSize"] = 16,["zoom"] = 0,["sparkHeight"] = 14,["sparkWidth"] = 3,["borderBackdrop"] = "Blizzard Tooltip",["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["textSize"] = 12,["sparkHidden"] = "NEVER",["spark"] = false,["frameStrata"] = 1,["width"] = 240,["sparkRotation"] = 0,["icon"] = true,["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,0,0.066666670143604,1,},["config"] = {},},["2. Blistering Twilight - Circle - The Amalgamation Chamber"] = {["user_y"] = 0,["iconSource"] = -1,["user_x"] = 0,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["foregroundColor"] = {0.83921575546265,0.33333334326744,1,1,},["echoVersion"] = 2,["sameTexture"] = true,["url"] = "https://echoesports.gg",["backgroundColor"] = {0.16078431904316,0.16078431904316,0.16078431904316,0.48795199394226,},["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",["useAdjustededMin"] = false,["regionType"] = "progresstexture",["blendMode"] = "BLEND",["slantMode"] = "INSIDE",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["alpha"] = 1,["uid"] = "qFT9163)zIS",["displayIcon"] = 3528301,["backgroundOffset"] = 0,["color"] = {1,1,1,1,},["desaturateBackground"] = false,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["desaturateForeground"] = false,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"405642","Blistering Twilight",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["custom_type"] = "event",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "player",["use_debuffClass"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["names"] = {"Sacred Blade",},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["spellIds"] = {283573,},["debuffType"] = "HARMFUL",["buffShowOn"] = "showOnActive",["useName"] = true,["group_countOperator"] = ">",["unevent"] = "auto",["duration"] = "3",["use_unit"] = true,["auraspellids"] = {"405036",},["type"] = "aura2",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_genericShowOn"] = true,["remOperator"] = "<",["spellName"] = 0,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 65,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "TOP",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorXOffset"] = 0,["text_text_format_p_format"] = "timed",["text_text_format_p_time_precision"] = 1,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {0.98823529411765,0.99607843137255,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_p_time_format"] = 0,["text_anchorXOffset"] = 0,["text_fontSize"] = 14,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "BOTTOMRIGHT",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 5,["text_color"] = {0.98823529411765,0.99607843137255,1,1,},["text_font"] = "Friz Quadrata TT",["anchorXOffset"] = 0,["text_shadowYOffset"] = 0,["text_text_format_tooltip2_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = false,["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["type"] = "subborder",["text_text"] = "",["border_offset"] = 0,["border_color"] = {1,1,1,1,},["border_visible"] = false,["border_edge"] = "Square Full White",["border_size"] = 1,},},["height"] = 150,["useAdjustededMax"] = false,["fontSize"] = 12,["source"] = "import",["mirror"] = false,["crop_y"] = 0.41,["cooldown"] = true,["crop_x"] = 0.41,["auraRotation"] = 0,["authorOptions"] = {},["config"] = {},["startAngle"] = 0,["actions"] = {["start"] = {["do_sound"] = false,},["init"] = {},["finish"] = {},},["width"] = 150,["parent"] = "2. Singles - The Amalgamation Chamber",["semver"] = "1.0.4",["frameStrata"] = 1,["id"] = "2. Blistering Twilight - Circle - The Amalgamation Chamber",["anchorPoint"] = "CENTER",["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["icon"] = true,["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",["inverse"] = false,["compress"] = false,["orientation"] = "ANTICLOCKWISE",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["cooldownTextDisabled"] = false,},["2. Add Health - The Amalgamation Chamber"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["customText"] = "function()\
    if WeakAuras.IsOptionsOpen() then\
        return \">>52.1%<<\",\"54.6%\",\"PUSH DMG\"\
    end\
    if not (aura_env.states[2].show and aura_env.states[4].show) then return end\
    \
    local boss1HP = aura_env.states[2].percenthealth\
    local boss2HP = aura_env.states[4].percenthealth\
    \
    local diff = abs(boss1HP - boss2HP)\
    local target1 = UnitIsUnit(\"target\", aura_env.states[2].unit)\
    local target2 = UnitIsUnit(\"target\", aura_env.states[4].unit)\
    \
    local output1 = format(\"%s%.1f%s\", target1 and \">>\" or \"\", boss1HP, target1 and \"<<\" or \"\")\
    local output2 = format(\"%s%.1f%s\", target2 and \">>\" or \"\", boss2HP, target2 and \"<<\" or \"\")\
    \
    if not aura_env.last or GetTime() - aura_env.last > 0.5 then\
        aura_env.last = GetTime()\
        local advice\
        if diff < aura_env.config.close then\
            advice = \"WATCH HP\" \
        else \
            if boss1HP > boss2HP and target1 then\
                advice = \"STOP DMG\"\
            elseif boss2HP > boss1HP and target2 then\
                advice = \"STOP DMG\"\
            else\
                advice = \"PUSH DMG\"\
            end\
        end\
        aura_env.advice = advice\
    end\
    \
    return output1, output2, aura_env.advice\
end",["yOffset"] = 186.99993896484,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["cooldownSwipe"] = true,["customTextUpdate"] = "event",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {["do_custom"] = true,["custom"] = "aura_env.FIRE_BOSS = \"Eternal Blaze\"\
aura_env.SHADOW_BOSS = \"Essence of Shadow\"\
\
\
function aura_env.getUnitFromName(name, type)\
    for i = 1, 40 do\
        local unit = type .. tostring(i)\
        local unitName, _ = UnitName(unit)\
        if unitName == name then\
            return unit\
        end\
    end\
end\
\
\
function aura_env.formatPercentHealth(percentHealth, highlight)\
    if highlight then\
        return string.format(\">>> %.1f%% <<<\", percentHealth)\
    else\
        return string.format(\"%.1f%%\", percentHealth)\
    end\
end\
\
\
function aura_env.getUnitHealth(unit)\
    return unit and (UnitHealth(unit) / UnitHealthMax(unit)) * 100\
end",},},["triggers"] = {[1] = {["trigger"] = {["npcId"] = "201773",["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["names"] = {},["use_absorbMode"] = true,["event"] = "Health",["unit"] = "boss",["use_npcId"] = true,["percenthealth"] = "55",["spellIds"] = {},["use_unit"] = true,["subeventPrefix"] = "SPELL",["use_percenthealth"] = true,["percenthealth_operator"] = "<=",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["npcId"] = "201773",["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_absorbMode"] = true,["event"] = "Health",["unit"] = "boss",["use_npcId"] = true,["percenthealth"] = "50",["spellIds"] = {},["use_unit"] = true,["names"] = {},["use_percenthealth"] = true,["percenthealth_operator"] = ">=",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["npcId"] = "201774",["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["names"] = {},["use_absorbMode"] = true,["event"] = "Health",["unit"] = "boss",["use_npcId"] = true,["percenthealth"] = "55",["spellIds"] = {},["use_unit"] = true,["subeventPrefix"] = "SPELL",["use_percenthealth"] = true,["percenthealth_operator"] = "<=",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[4] = {["trigger"] = {["npcId"] = "201774",["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["names"] = {},["use_absorbMode"] = true,["event"] = "Health",["unit"] = "boss",["use_npcId"] = true,["percenthealth"] = "50",["spellIds"] = {},["use_unit"] = true,["subeventPrefix"] = "SPELL",["use_percenthealth"] = true,["percenthealth_operator"] = ">=",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[5] = {["trigger"] = {["type"] = "unit",["use_absorbHealMode"] = true,["unit"] = "target",["use_unit"] = true,["use_absorbMode"] = true,["event"] = "Unit Characteristics",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t)\
    return ((t[1] and t[2]) or (t[3] and t[4]))\
end",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text_format_p_time_precision"] = 1,["text_text"] = "%c3",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "TOP",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorXOffset"] = 0,["text_text_format_p_format"] = "timed",["text_text_format_p_time_mod_rate"] = true,["type"] = "subtext",["text_shadowXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_visible"] = true,["text_shadowYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_c3_format"] = "none",["text_anchorPoint"] = "INNER_TOP",["text_text_format_p_time_format"] = 0,["text_text_format_c5_format"] = "none",["text_fontSize"] = 20,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_c_format"] = "none",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "%c1",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "CENTER",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.percenthealth_format"] = "Number",["text_text_format_2.percenthealth_format"] = "Number",["text_shadowYOffset"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,0.54117649793625,0.26274511218071,1,},["text_font"] = "Expressway MonoNum",["text_wordWrap"] = "WordWrap",["text_text_format_2.percenthealth_decimal_precision"] = 1,["text_visible"] = true,["text_text_format_c2_format"] = "none",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "CENTER",["text_text_format_c1_format"] = "none",["text_text_format_1.percenthealth_decimal_precision"] = 1,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_1.healthpercent_format"] = "none",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "%c2",["text_text_format_3.percenthealth_decimal_precision"] = 1,["text_shadowColor"] = {0,0,0,1,},["rotateText"] = "NONE",["text_selfPoint"] = "BOTTOM",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_3.percenthealth_format"] = "Number",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["text_text_format_c4_format"] = "none",["text_text_format_1.percenthealth_format"] = "Number",["text_text_format_2.percenthealth_format"] = "Number",["text_shadowYOffset"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {0.96862751245499,0.33333334326744,1,1,},["text_font"] = "Expressway MonoNum",["text_wordWrap"] = "WordWrap",["text_text_format_2.percenthealth_decimal_precision"] = 1,["text_fontType"] = "OUTLINE",["text_text_format_c2_format"] = "none",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOM",["text_text_format_c3_format"] = "none",["text_text_format_1.percenthealth_decimal_precision"] = 1,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_c_format"] = "none",},},["height"] = 75,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2687",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["regionType"] = "icon",["cooldownEdge"] = false,["information"] = {},["conditions"] = {},["authorOptions"] = {{["softMin"] = 0.3,["type"] = "range",["useDesc"] = false,["max"] = 3,["step"] = 0.1,["width"] = 1,["min"] = 0.1,["name"] = "\"Close\" Threshold",["softMax"] = 2,["default"] = 1.3,["key"] = "close",["bigStep"] = 0.1,},},["color"] = {1,1,1,0,},["uid"] = "hORisl2v0Jj",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["anchorFrameType"] = "SCREEN",["tocversion"] = 100100,["id"] = "2. Add Health - The Amalgamation Chamber",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 75,["zoom"] = 0,["config"] = {["close"] = 1.3,},["inverse"] = false,["icon"] = true,["selfPoint"] = "CENTER",["displayIcon"] = "1387353",["cooldown"] = false,["parent"] = "2. Singles - The Amalgamation Chamber",},["2. Shadowflame - The Amalgamation Chamber"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"Shadowflame","406780","406779",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["use_debuffClass"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["names"] = {"Sacred Blade",},["use_genericShowOn"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["useName"] = true,["spellName"] = 0,["unevent"] = "auto",["subeventPrefix"] = "SPELL",["auraspellids"] = {},["custom_type"] = "event",["type"] = "aura2",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["duration"] = "3",["remOperator"] = "<",["unit"] = "player",["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "-%1.tooltip3%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["anchorXOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["text_text_format_1.tooltip3_format"] = "none",["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_anchorXOffset"] = 7,["text_text_format_1.tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["anchorXOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_visible"] = true,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2687",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["use_never"] = false,["zoneIds"] = "",},["source"] = "import",["desaturate"] = false,["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["semver"] = "1.0.4",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["id"] = "2. Shadowflame - The Amalgamation Chamber",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "8zIwL5f52av",["inverse"] = false,["color"] = {1,1,1,1,},["xOffset"] = 0,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["url"] = "https://echoesports.gg",},["2. Blazing Heat P1 - The Amalgamation Chamber"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 361644,["auranames"] = {"402617","Blazing Heat",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["custom_type"] = "event",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["useExactSpellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["group_countOperator"] = ">",["use_tooltip"] = false,["ignoreSelf"] = true,["subeventSuffix"] = "_CAST_START",["names"] = {"Sacred Blade",},["subeventPrefix"] = "SPELL",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["use_debuffClass"] = false,["useName"] = true,["type"] = "aura2",["unevent"] = "auto",["buffShowOn"] = "showOnActive",["unit"] = "player",["auraspellids"] = {},["use_genericShowOn"] = true,["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["duration"] = "3",["remOperator"] = "<",["spellName"] = 0,["fetchRaidMark"] = false,["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["unit"] = "player",["use_stage"] = true,["event"] = "BigWigs Stage",["stage_operator"] = "==",["stage"] = "1",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["version"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = false,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip1_format"] = "none",["anchorXOffset"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_1.ttoltip1_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.tolltip1_format"] = "none",},{["glowFrequency"] = 0.25,["glow"] = false,["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["type"] = "subglow",["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["use_zoneIds"] = false,["encounterid"] = "2687",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["class"] = {["multi"] = {},},["zoneIds"] = "",},["source"] = "import",["url"] = "https://echoesports.gg",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 3528301,["xOffset"] = 0,["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["semver"] = "1.0.4",["zoom"] = 0,["auto"] = true,["tocversion"] = 100100,["id"] = "2. Blazing Heat P1 - The Amalgamation Chamber",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["useCooldownModRate"] = true,["width"] = 55,["alpha"] = 1,["uid"] = "GZUMUrMcH4(",["inverse"] = false,["color"] = {1,1,1,1,},["desaturate"] = false,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["Fire/Shadow Debuff List"] = {["arcLength"] = 360,["controlledChildren"] = {"Fire/Shadow Debuff Bar",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "2. Fire/Shadow lists - The Amalgamation Chamber",["preferToUpdate"] = false,["yOffset"] = 0,["gridType"] = "DR",["echoVersion"] = 2,["config"] = {},["borderColor"] = {0,0,0,1,},["useAnchorPerUnit"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["fullCircle"] = true,["useLimit"] = false,["align"] = "CENTER",["growOn"] = "changed",["anchorPoint"] = "CENTER",["frameStrata"] = 1,["rotation"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["limit"] = 20,["subRegions"] = {},["uid"] = "1d(Uc8qWBnd",["borderSize"] = 2,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["customSort"] = "WeakAuras.ComposeSorts(\
    WeakAuras.SortDescending {\"region\", \"state\", \"majorStacks\"},\
    WeakAuras.SortAscending {\"region\", \"state\", \"minorStacks\"}\
)",["backdropColor"] = {1,1,1,0.5,},["grow"] = "CUSTOM",["animate"] = false,["customGrow"] = "function(newPositions, activeRegions)\
    local debuffBar = aura_env.child_envs[1]\
    local spacing = 1\
    local barWidth = debuffBar.region.width + spacing\
    local barHeight = debuffBar.region.height + spacing\
    \
    if debuffBar.config.scripeMode then\
        local columns = {\
            FIRE = {\
                xOffset = -barWidth/2,\
                rowCount = 0\
            },\
            SHADOW = {\
                xOffset = barWidth/2,\
                rowCount = 0\
            }\
        }\
        for i, activeRegion in ipairs(activeRegions) do\
            local debuffType = activeRegion.region.state.debuffType\
            newPositions[i] = {\
                columns[debuffType].xOffset,\
                -columns[debuffType].rowCount * barHeight\
            }\
            columns[debuffType].rowCount = columns[debuffType].rowCount + 1\
        end\
    else\
        for i = 1, #activeRegions do\
            newPositions[i] = { 0, -i * barHeight }\
        end\
    end\
end",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["hybridPosition"] = "hybridFirst",["sort"] = "custom",["rowSpace"] = 1,["source"] = "import",["internalVersion"] = 65,["selfPoint"] = "TOPLEFT",["constantFactor"] = "RADIUS",["sortHybridTable"] = {["Fire/Shadow Debuff Bar"] = false,},["borderOffset"] = 4,["stagger"] = 0,["tocversion"] = 100100,["id"] = "Fire/Shadow Debuff List",["anchorPerUnit"] = "CUSTOM",["gridWidth"] = 9,["anchorFrameType"] = "SCREEN",["sortOn"] = "changed",["borderInset"] = 1,["xOffset"] = 0,["authorOptions"] = {},["groupIcon"] = "",["conditions"] = {},["information"] = {["forceEvents"] = true,},["space"] = 1,},["2. Molten Eruption Soak [SOAKS] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.41960787773132,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["ingroup"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "524305",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["color"] = {},["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "2. Bars - The Amalgamation Chamber",["customTextUpdate"] = "update",["borderOffset"] = 5,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = "403101",["auranames"] = {"Advanced Recombobulation","362732",},["use_genericShowOn"] = true,["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = true,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["fetchTooltip"] = true,["event"] = "Combat Log",["use_spellId"] = true,["name"] = "Plasma Discharge",["use_sourceUnit"] = false,["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["use_unit"] = true,["use_debuffClass"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["group_countOperator"] = ">",["spellName"] = 0,["unit"] = "boss",["matchesShowOn"] = "showOnActive",["debuffType"] = "HARMFUL",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["useName"] = true,["buffShowOn"] = "showOnActive",["unevent"] = "auto",["type"] = "combatlog",["duration"] = "5.2",["useExactSpellId"] = false,["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = false,["spellIds"] = {283573,},["names"] = {"Sacred Blade",},["remOperator"] = "<",["subeventPrefix"] = "SPELL",["custom_type"] = "event",["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "custom",["custom"] = "function()\
    return aura_env.isBossInRange()\
end",["custom_type"] = "event",["custom_hide"] = "custom",["debuffType"] = "HELPFUL",["events"] = "TRIGGER:1",["unit"] = "player",},["untrigger"] = {["custom"] = "function()\
    return not aura_env.isBossInRange()\
end",},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(trigger)\
    return trigger[1]\
end",["activeTriggerMode"] = 1,},["uid"] = "Y0Wm8XnYGZ4",["internalVersion"] = 65,["backdropColor"] = {1,1,1,0.5,},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkRotation"] = 0,["stickyDuration"] = false,["sparkColor"] = {1,1,1,1,},["width"] = 240,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SOAKS",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_text_format_destName_abbreviate"] = false,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["border_offset"] = 0,["type"] = "subborder",["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["authorOptions"] = {},["source"] = "import",["sparkHidden"] = "NEVER",["borderBackdrop"] = "Blizzard Tooltip",["semver"] = "1.0.5",["border"] = false,["borderEdge"] = "None",["textSize"] = 12,["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["sparkWidth"] = 3,["sparkHeight"] = 14,["timerSize"] = 12,["zoom"] = 0,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["auto"] = true,["id"] = "2. Molten Eruption Soak [SOAKS] - The Amalgamation Chamber",["sparkRotationMode"] = "AUTO",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["custom"] = "aura_env.LRC = LibStub(\"LibRangeCheck-2.0\")\
aura_env.bossName = \"Eternal Blaze\"\
\
function aura_env.isBossInRange()\
    local unit = aura_env.getUnitFromName(aura_env.bossName, \"boss\")\
    return aura_env.isUnitInRange(unit)\
end\
\
function aura_env.isUnitInRange(unit)\
    local unitRange, _ = aura_env.LRC and unit and aura_env.LRC:GetRange(unit) or math.huge\
    return unitRange <= 40\
end\
\
function aura_env.getUnitFromName(name, type)\
    for i = 1, 40 do\
        local unit = type .. tostring(i)\
        local unitName, _ = UnitName(unit)\
        if unitName == name then\
            return unit\
        end\
    end\
end",["do_custom"] = true,},["finish"] = {},},["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {{["changes"] = {{["value"] = 0,["property"] = "alpha",},},["check"] = {["value"] = 0,["variable"] = "show",["trigger"] = 2,},},},["barColor2"] = {1,1,0,1,},["config"] = {},},["2. Spell CDs - The Amalgamation Chamber"] = {["iconSource"] = -1,["wagoID"] = "B-saNwgCJ",["authorOptions"] = {{["subOptions"] = {{["type"] = "toggle",["default"] = true,["desc"] = "Activate/Deactivate spells without having to delete them out of this",["key"] = "active",["useDesc"] = true,["name"] = "Active",["width"] = 1,},{["type"] = "input",["useDesc"] = true,["width"] = 2,["desc"] = "Description for yourself to keep track of this in custom options",["default"] = "Ability Name",["key"] = "desc",["name"] = "Description",["length"] = 10,["multiline"] = false,["useLength"] = false,},{["type"] = "number",["useDesc"] = false,["max"] = 999999,["step"] = 1,["width"] = 0.5,["min"] = 0,["key"] = "spellID",["name"] = "spellID",["default"] = 0,},{["type"] = "number",["useDesc"] = true,["max"] = 999999,["step"] = 0.01,["width"] = 0.5,["min"] = 0,["key"] = "duration",["desc"] = "Duration until next Cast",["name"] = "Duration",["default"] = 0,},{["type"] = "number",["useDesc"] = true,["max"] = 999999,["step"] = 0.01,["width"] = 0.5,["min"] = 0,["key"] = "intduration",["desc"] = "0 = Deactivated. Duration until next Cast if the npc is interrupted",["name"] = "Interrupt-Duration",["default"] = 0,},{["type"] = "number",["useDesc"] = true,["max"] = 120,["step"] = 0.1,["width"] = 0.5,["min"] = 0,["key"] = "hideafter",["desc"] = "After how many seconds of a state being at 0seconds remaining it'll autohide to prevent something from being stuck forever. 0 = instant",["name"] = "Hide after",["default"] = 10,},{["type"] = "select",["values"] = {"On Cast Start","On Cast Success",},["default"] = 1,["key"] = "casttype",["useDesc"] = false,["name"] = "When to start Timer",["width"] = 1,},{["type"] = "number",["useDesc"] = true,["max"] = 1000000,["step"] = 1,["width"] = 0.7,["min"] = 0,["key"] = "overwrite",["desc"] = "With this you can specify a spellid to be used as icon instead of using the normal icon from the spellid",["name"] = "Overwrite spell-icon",["default"] = 0,},{["type"] = "toggle",["key"] = "tank",["default"] = true,["useDesc"] = false,["name"] = "Tank",["width"] = 0.5,},{["type"] = "toggle",["key"] = "heal",["default"] = true,["useDesc"] = false,["name"] = "Healer",["width"] = 0.5,},{["type"] = "toggle",["key"] = "mdps",["default"] = true,["useDesc"] = false,["name"] = "Melee",["width"] = 0.5,},{["type"] = "toggle",["key"] = "rdps",["default"] = true,["useDesc"] = false,["name"] = "Ranged",["width"] = 0.5,},{["type"] = "toggle",["default"] = false,["desc"] = "Highlighted Spells will be displayed in a seperate Aura",["key"] = "highlight",["useDesc"] = true,["name"] = "Highlight",["width"] = 0.5,},{["type"] = "header",["useName"] = true,["text"] = "Advanced Stuff, not needed in most cases",["noMerge"] = false,["width"] = 1,},{["type"] = "toggle",["default"] = false,["desc"] = "With this enabled the timer will loop in case the spell was not cast when reaching 0 until either the mob dies or recasts its spell. This is a rare case for mobs that cast their spells on a strict timer and skip casts when they were stunned to still properly track the cd of the next cast, should be used wisely. Does not work with progressive timers",["key"] = "loop",["useDesc"] = true,["name"] = "Strict-Timer",["width"] = 2,},{["type"] = "toggle",["default"] = false,["desc"] = "Whether to track spell cooldown based on combat start. You will have to specify a timer AND the unitID of the enemy",["key"] = "oncombat",["useDesc"] = true,["name"] = "Timer on Combat start?",["width"] = 1,},{["type"] = "number",["useDesc"] = true,["max"] = 1000000,["step"] = 0.1,["width"] = 0.5,["min"] = 0,["key"] = "combattimer",["desc"] = "Timer for on combat start",["name"] = "Combat-start Timer",["default"] = 0,},{["type"] = "input",["useDesc"] = true,["width"] = 0.5,["desc"] = "Only needed if you use on combat timer",["default"] = "",["key"] = "npcID",["name"] = "npcID",["length"] = 10,["multiline"] = false,["useLength"] = false,},{["type"] = "input",["useDesc"] = true,["width"] = 0.8,["desc"] = "If you want one spell to trigger other spell's(for example a transition spell triggering a cooldown on other spells) this is where you can specifiy those, seperated by a space.",["default"] = "0",["key"] = "spelltrigger",["name"] = "Trigger other spells",["length"] = 10,["multiline"] = false,["useLength"] = false,},{["type"] = "input",["useDesc"] = true,["width"] = 0.8,["desc"] = "Duration when the triggered spells will happen, again seperated by a space if you have multiple",["default"] = "0",["key"] = "spelltimer",["name"] = "Duration of the triggered spells",["length"] = 10,["multiline"] = false,["useLength"] = false,},{["type"] = "input",["useDesc"] = true,["width"] = 2,["desc"] = "Changing timers based on cast count. Put Numbers seperated by space. First number is the time from 1st to 2nd cast, then 2nd to 3rd cast and so on.",["default"] = "0",["key"] = "progressive",["name"] = "Progressive Timer",["length"] = 10,["multiline"] = false,["useLength"] = false,},{["type"] = "toggle",["default"] = false,["desc"] = "Enabled = Progressive timer will start from the beginning when it reaches the end. Disabled = Lowest value will continue showing.",["key"] = "repeating",["useDesc"] = true,["name"] = "Repeat",["width"] = 2,},{["type"] = "input",["useDesc"] = true,["width"] = 1,["desc"] = "Overwrite the cooldown for the specified npcID. This should be used when multiple npc's use the same spell but with a different cooldown. You can specifiy multiple unitID's with a space",["default"] = "",["key"] = "npcIDoffset",["name"] = "Overwrite Cooldown NPC",["length"] = 10,["multiline"] = false,["useLength"] = false,},{["type"] = "input",["useDesc"] = true,["width"] = 1,["desc"] = "Specify the cooldown for the specified npcID. If you're using multiple npcID's, seperate the individual cooldown by a space",["default"] = "",["key"] = "offsetnum",["name"] = "Overwrite Cooldown Number",["length"] = 10,["multiline"] = false,["useLength"] = false,},},["hideReorder"] = false,["useDesc"] = false,["nameSource"] = 2,["width"] = 1,["useCollapse"] = true,["collapse"] = false,["name"] = "Spells",["key"] = "spells",["limitType"] = "none",["groupType"] = "array",["type"] = "group",["size"] = 10,},},["preferToUpdate"] = false,["customText"] = "",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["duration"] = "2",["subeventPrefix"] = "SPELL",["destUnit"] = "target",["spellName"] = "Battle Stance",["debuffType"] = "HELPFUL",["unit"] = "player",["type"] = "custom",["use_destNpcId"] = false,["custom_type"] = "stateupdate",["names"] = {},["subeventSuffix"] = "_CAST_SUCCESS",["event"] = "Combat Log",["spellIds"] = {},["custom"] = "function(states, e, ...)\
    if e == \"STATUS\" then\
        for i=1, 40 do\
            local u = \"nameplate\"..i\
            if UnitExists(u) then\
                local G = UnitGUID(u)\
                aura_env.nameplates[u] = G\
                aura_env.guids[G] = u\
            end\
        end\
    elseif e == \"NAME_PLATE_UNIT_ADDED\" then\
        local u = ...\
        local updatestate = false\
        if u then\
            local G = UnitGUID(u)\
            aura_env.nameplates[u] = G\
            aura_env.guids[G] = u\
            for k, state in pairs(aura_env.temp) do\
                if state.GUID == G then\
                    if UnitAffectingCombat(u)\
                    then\
                        state.unit = u\
                        state.show = true\
                        state.changed = true\
                        states[k] = state  \
                        aura_env.temp[k] = nil\
                        updatestate = true\
                    else\
                        aura_env.units[G] = nil\
                        states[k] = nil\
                        aura_env.temp[k] = nil\
                        updatestate = true\
                    end\
                end\
            end\
            return updatestate\
        end\
        \
    elseif e == \"NAME_PLATE_UNIT_REMOVED\" then\
        local u = ...\
        local updatestate = false\
        if u then\
            local G = UnitGUID(u)\
            if G then\
                aura_env.nameplates[u] = nil\
                aura_env.guids[G] = nil\
                for k, state in pairs(states) do\
                    if state.GUID == G then\
                        aura_env.temp[k] = state\
                        state.show = false\
                        state.changed = true\
                        updatestate = true\
                    end\
                end\
                return updatestate\
            end\
        end\
        \
    elseif e == \"RELOE_SPELLCD_STATE_CLEAN\" then\
        local key, expires = ...\
        if (states[key] and states[key].expirationTime == expires and states[key].expirationTime < GetTime ()) or (aura_env.temp[key] and aura_env.temp[key].expirationTime < GetTime()) then\
            states[key] = nil\
            aura_env.temp[key] = nil\
            return true\
            \
        end\
        \
    elseif e == \"RELOE_SPELLCD_STATE_UPDATE\" then\
        local spell, GUID, spellID, duration, combat, type, count, key = ...\
        if spell and duration then\
            local current = GetTime()\
            if spell.highlight and aura_env.highlights then\
                WeakAuras.ScanEvents(\"RELOE_SPELLCD_STATE_UPDATE_HL\", spell, GUID, spellID, duration, combat, type, count, key)\
            else                \
                local icon = spell.overwrite ~= 0 and select(3, GetSpellInfo(spell.overwrite)) or select(3, GetSpellInfo(spellID))\
                if--[[ ((not states[key]) or states[key].expirationTime < current + duration-0.1 or not spell.loop) \
            and ]](combat \
                    or (not aura_env.last[GUID] )\
                    or current > aura_env.last[GUID][1]+0.5 or icon ~= aura_env.last[GUID][2]) or spellID ~= aura_env.last[GUID][3] then\
                    local data\
                    local updatestate = false\
                    \
                    if duration <= 0 then \
                        states[key] = nil\
                        aura_env.temp[key] = nil\
                        return true\
                    end\
                    \
                    data = {\
                        show = true,\
                        changed = true,\
                        progressType = \"timed\",\
                        duration = duration ,\
                        spellID = spellID,\
                        expirationTime = GetTime() + duration,\
                        icon = icon,\
                        hide = spell.hide,\
                        autoHide = false,\
                        GUID = GUID,\
                        highlight = spell.highlight,\
                        count = count,\
                        unit = aura_env.guids[GUID],\
                        spellId = spellID,\
                    }\
                    if spell.hide == 0 or spell.loop then\
                        data.autoHide = true\
                    end\
                    aura_env.last[GUID] = {current, icon, spellID}\
                    if aura_env.guids[GUID] then\
                        states[key] = data\
                        updatestate = true\
                    else\
                        aura_env.temp[key] = data\
                    end\
                    \
                    if spell.loop and not combat then\
                        local aura_env = aura_env\
                        C_Timer.After(duration, function()\
                                if aura_env.guids[GUID] then\
                                    WeakAuras.ScanEvents(\"RELOE_SPELLCD_STATE_UPDATE\", spell, GUID, spellID, duration, combat, type, count, key) \
                                end\
                                \
                        end)\
                    end\
                    return updatestate\
                end\
            end\
        end\
    else\
        \
        local unit, subevent, spellIDUNIT, sourceGUID, sourceName, sflags, _, destGUID, _, dflags, _, spellIDCLEU, _, _, spellIDINT = ...\
        \
        if sourceGUID and sourceName then -- checking for CLEU\
            if spellIDINT and bit.band(dflags, COMBATLOG_OBJECT_CONTROL_PLAYER) == 0 then\
                aura_env.oninterrupt(spellIDINT, destGUID)\
            elseif subevent == \"SPELL_CAST_SUCCESS\" and bit.band(sflags, COMBATLOG_OBJECT_CONTROL_PLAYER) == 0 and bit.band(sflags, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0  then\
                aura_env.onsuccess(spellIDCLEU, sourceGUID, sourceName, true)\
            elseif subevent == \"SPELL_CAST_START\" and bit.band(sflags, COMBATLOG_OBJECT_CONTROL_PLAYER) == 0 and bit.band(sflags, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0   then\
                aura_env.onstart(spellIDCLEU, sourceGUID)\
            end\
            \
            \
            \
        elseif unit then\
            local GUID = UnitGUID(unit)\
            if GUID then\
                local creature, _, _, _, _, npcID = strsplit(\"-\", GUID)\
                if npcID and (creature == \"Creature\" or creature == \"Vehicle\") then\
                    if e == \"UNIT_THREAT_LIST_UPDATE\" then\
                        if UnitAffectingCombat(unit) and (not aura_env.units[GUID]) then\
                            aura_env.units[GUID] = {GUID = GUID, time = GetTime()}\
                            for k, _ in pairs(aura_env.spells) do\
                                if aura_env.spells[k].oncombat and aura_env.spells[k].npcID and string.find(aura_env.spells[k].npcID, npcID) then\
                                    aura_env.oncombat(k, GUID)\
                                end\
                            end\
                        end\
                    elseif e == \"UNIT_SPELLCAST_SUCCEEDED\" and spellIDUNIT then\
                        aura_env.onsuccess(spellIDUNIT, GUID, UnitName(unit), false)\
                    elseif e == \"UNIT_SPELLCAST_START\" and spellIDUNIT then\
                        aura_env.onstart(spellIDUNIT, GUID)\
                    end\
                end\
            end\
        end\
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
",["use_spellName"] = true,["events"] = "STATUS UNIT_THREAT_LIST_UPDATE RELOE_SPELLCD_STATE_CLEAN RELOE_SPELLCD_STATE_UPDATE UNIT_SPELLCAST_SUCCEEDED:nameplate UNIT_SPELLCAST_START:nameplate CLEU:SPELL_CAST_SUCCESS:SPELL_INTERRUPT:SPELL_CAST_START NAME_PLATE_UNIT_ADDED NAME_PLATE_UNIT_REMOVED",["unevent"] = "timed",["check"] = "event",["use_destUnit"] = true,["use_unit"] = true,["customVariables"] = "{\
    expirationTime = true,\
    duration = true,\
    count = \"number\",\
}\
\
",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 65,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 43,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text"] = "",["text_text_format_p_format"] = "timed",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_precision"] = 1,["type"] = "subtext",["anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_p_time_format"] = 0,["text_shadowYOffset"] = 0,["text_visible"] = false,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "CENTER",["anchorYOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_fontSize"] = 16,["text_text_format_p_time_dynamic_threshold"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["type"] = "subborder",["text_text"] = "",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = true,["glowType"] = "Pixel",["glowLength"] = 8,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glow"] = false,["glowThickness"] = 2,["glowLines"] = 5,["glowBorder"] = true,},},["height"] = 34,["load"] = {["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "challenge",["multi"] = {["mythic"] = true,["challenge"] = true,},},["role"] = {},["zoneIds"] = "g437",["encounterid"] = "2687",["spec"] = {["multi"] = {},},["affixes"] = {},["use_never"] = false,["size"] = {["single"] = "party",["multi"] = {["party"] = true,},},},["source"] = "import",["actions"] = {["start"] = {},["init"] = {["custom"] = "aura_env.spells = {}\
aura_env.nameplates = {}\
aura_env.guids = {}\
aura_env.temp = {}\
aura_env.units = {}\
aura_env.progtime = {}\
aura_env.proglast = {}\
aura_env.last = {}\
aura_env.hdata = aura_env.hdata or WeakAuras.GetData(\"Highlighted Spells Season 1\")\
aura_env.highlights = aura_env.hdata and not aura_env.hdata.load.use_never\
\
for _, v in ipairs(aura_env.config.spells) do -- converting spells from custom options\
    if v.spellID ~= 0 then\
        if v.active then\
            aura_env.spells[v.spellID] = {icon = select(3, GetSpellInfo(v.spellID)), duration = v.duration, intduration = v.intduration, onstart = v.casttype == 1, onsuccess = v.casttype == 2, tank = v.tank, heal = v.heal, mdps = v.mdps, rdps = v.rdps, hide = v.hideafter, overwrite = v.overwrite, npcID = v.npcID, oncombat = v.oncombat, combattimer = v.combattimer, highlight = v.highlight, loop = v.loop, progressive = v.progressive, repeating = v.repeating, other = 0, npcIDoffset = v.npcIDoffset, offsetnum = v.offsetnum, offset = 0}\
            if v.npcIDoffset ~= \"\" and v.offsetnum ~= \"\" then\
                aura_env.spells[v.spellID].offset = {}\
                local nilcheck, i = true, 1\
                while nilcheck do\
                    local timer = select(i, strsplit(\" \", v.offsetnum))\
                    timer = tonumber(timer)\
                    local npcID = select(i, strsplit(\" \", v.npcIDoffset))\
                    if npcID then\
                        aura_env.spells[v.spellID].offset[npcID] = timer\
                        if not aura_env.spells[v.spellID].offset[npcID] then\
                            nilcheck = false\
                            aura_env.spells[v.spellID].offset[npcID] = nil\
                        end\
                    else\
                        nilcheck = false\
                    end\
                    i = i+1\
                end\
            end\
            if v.spelltrigger ~= \"0\" and v.spelltrigger ~= \"\" then\
                aura_env.spells[v.spellID].other = {}\
                local nilcheck, i = true, 1\
                while nilcheck do\
                    local timer = select(i, strsplit(\" \", v.spelltimer))\
                    timer = tonumber(timer)\
                    local sid = select(i, strsplit(\" \", v.spelltrigger)) or 0\
                    sid = tonumber(sid)\
                    aura_env.spells[v.spellID].other[sid] = timer\
                    if not aura_env.spells[v.spellID].other[sid] then\
                        nilcheck = false\
                        aura_env.spells[v.spellID].other[sid] = nil\
                    end\
                    i = i+1\
                end\
            end\
            if v.progressive ~= \"0\" and v.progressive ~= \"\" then\
                aura_env.spells[v.spellID].progressive = {}\
                local nilcheck, i = true, 1\
                while nilcheck do\
                    local timer = select(i, strsplit(\" \", v.progressive))\
                    timer = tonumber(timer)\
                    aura_env.spells[v.spellID].progressive[i] = timer\
                    if not aura_env.spells[v.spellID].progressive[i] then\
                        nilcheck = false\
                        aura_env.spells[v.spellID].progressive[i] = nil\
                    end\
                    i=i+1\
                end\
            end\
        end\
    end\
end\
\
\
\
\
\
-- checking for role\
aura_env.rolecheck = function(spell)\
    local spec, role, pos = WeakAuras.SpecRolePositionForUnit(\"player\")\
    return (role ~= \"TANK\" and spell.mdps and (pos == \"MELEE\" or spec == 105)) or (pos == \"RANGED\" and spell.rdps) or (role == \"TANK\" and spell.tank) or (role == \"HEALER\" and spell.heal)\
end\
\
\
aura_env.bossunit = function(GUID)\
    for i=1, 10 do\
        if not UnitExists(\"boss\"..i) then break end\
        if GUID == UnitGUID(\"boss\"..i) then\
            return true\
        end\
    end\
    return false\
end\
\
\
-- spell_interrupt\
aura_env.oninterrupt = function(spellID, GUID)\
    local spell, key = aura_env.spells[spellID], GUID..spellID\
    if spell\
    and spell.intduration > 0\
    and aura_env.rolecheck(spell)\
    and ((not aura_env.last[key]) or GetTime() > aura_env.last[key]+0.05) then \
        aura_env.last[key] = GetTime()\
        WeakAuras.ScanEvents(\"RELOE_SPELLCD_STATE_UPDATE\", spell, GUID, spellID, spell.intduration, false, false, 0, GUID..spellID)\
    end\
end\
\
-- spell_cast_start / unit_spellcast_start\
aura_env.onstart = function(spellID, GUID, name)\
    local spell, key = aura_env.spells[spellID], GUID..spellID\
    local npcID = select(6, strsplit(\"-\", GUID))\
    if spell\
    and spell.onstart \
    and ((not aura_env.last[key]) or GetTime() > aura_env.last[key]+0.05) then\
        aura_env.last[key] = GetTime()\
        local count, duration = -1, aura_env.rolecheck(spell) and spell.duration\
        if type(spell.other) == \"table\" then\
            for k, v in pairs(spell.other) do\
                WeakAuras.ScanEvents(\"RELOE_SPELLCD_STATE_UPDATE\", spell, GUID, k, v, false, false, 0, GUID..k)\
            end\
        end\
        if type(spell.progressive) == \"table\" then\
            duration, count = aura_env.getprogressivetimer(spell, spellID, GUID, duration, key)\
        end\
        if duration then\
            duration = type(spell.offset) == \"table\" and spell.offset[npcID] or duration\
            WeakAuras.ScanEvents(\"RELOE_SPELLCD_STATE_UPDATE\", spell, GUID, spellID, duration, false, false, count+1, key)\
        end\
    end\
end\
\
-- spell_cast_success / unit_spellcast_succeeded\
aura_env.onsuccess = function(spellID, GUID, name, CLEU)\
    local spell, key = aura_env.spells[spellID], GUID..spellID\
    local npcID = select(6, strsplit(\"-\", GUID))\
    if spell\
    and spell.onsuccess \
    and ((not aura_env.last[key]) or GetTime() > aura_env.last[key]+0.05)\
    then \
        aura_env.last[key] = GetTime()\
        local count, duration = -1, aura_env.rolecheck(spell) and aura_env.spells[spellID].duration\
        if type(spell.other) == \"table\" then\
            for k, v in pairs(spell.other) do\
                WeakAuras.ScanEvents(\"RELOE_SPELLCD_STATE_UPDATE\", spell, GUID, k, v, false, false, 0, GUID..k)\
            end\
        end\
        if duration and type(spell.progressive) == \"table\" then\
            duration, count = aura_env.getprogressivetimer(spell, spellID, GUID, duration, key)\
        end\
        if duration then\
            duration = type(spell.offset) == \"table\" and spell.offset[npcID] or duration\
            WeakAuras.ScanEvents(\"RELOE_SPELLCD_STATE_UPDATE\", spell, GUID, spellID, duration, false, true, count+1, key)\
        end\
    end\
end\
\
\
aura_env.oncombat = function(spellID, GUID)\
    local spell = aura_env.spells[spellID]\
    if spell\
    and spell.oncombat \
    and aura_env.rolecheck(spell) then\
        WeakAuras.ScanEvents(\"RELOE_SPELLCD_STATE_UPDATE\", spell, GUID, spellID, spell.combattimer, true, spell.onsuccess, 0, GUID..spellID)\
    end\
end\
\
\
aura_env.getprogressivetimer = function(spell, spellID, GUID, duration, key)\
    if not aura_env.progtime[key] then\
        aura_env.progtime[key] = 1\
    else\
        aura_env.progtime[key] = aura_env.progtime[key]+1\
    end\
    local timer = -1\
    if aura_env.progtime[key] > #spell.progressive  then\
        if spell.repeating then\
            aura_env.progtime[key] = 1\
            timer = spell.progressive[1]\
        else\
            for i=1, #spell.progressive do\
                timer = (spell.progressive[i] and (spell.progressive[i] < timer or timer == 0) and spell.progressive[i])  or timer\
            end\
        end\
    else\
        timer = spell.progressive[aura_env.progtime[key]]\
    end\
    if timer and timer ~= -1 then\
        return tonumber(timer), aura_env.progtime[key]\
    else\
        return duration, -1\
    end\
end\
\
\
\
\
\
",["do_custom"] = true,},["finish"] = {["do_custom"] = false,["stop_sound"] = false,},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = 4630363,["color"] = {1,1,1,1,},["useTooltip"] = false,["config"] = {["spells"] = {{["tank"] = false,["highlight"] = false,["active"] = true,["repeating"] = false,["duration"] = 21,["spelltrigger"] = "0",["overwrite"] = 0,["casttype"] = 1,["offsetnum"] = "",["npcIDoffset"] = "",["mdps"] = true,["oncombat"] = true,["hideafter"] = 10,["intduration"] = 21,["desc"] = "Swirling Flame",["loop"] = false,["progressive"] = "0",["combattimer"] = 9,["npcID"] = "201773",["rdps"] = true,["spelltimer"] = "0",["heal"] = true,["spellID"] = 404896,},},},["useCooldownModRate"] = true,["width"] = 34,["frameStrata"] = 1,["semver"] = "1.0.42",["zoom"] = 0.1,["auto"] = true,["tocversion"] = 100100,["id"] = "2. Spell CDs - The Amalgamation Chamber",["cooldownTextDisabled"] = false,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["colorR"] = 1,["duration"] = "2",["colorA"] = 1,["colorG"] = 1,["duration_type"] = "seconds",["colorB"] = 1,["scaleType"] = "straightScale",["easeStrength"] = 3,["easeType"] = "none",["scalex"] = 1,["scaley"] = 1,["alpha"] = 0,["x"] = 0,["y"] = 0,["colorType"] = "straightColor",["use_color"] = false,["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\
      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\
    end\
  ",["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\
      return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\
    end\
  ",["rotate"] = 0,["type"] = "none",["use_scale"] = true,},},["uid"] = "3Pn13BJiHdC",["inverse"] = false,["xOffset"] = 0,["parent"] = "2. Spell CDs on Nameplates - The Amalgamation Chamber",["conditions"] = {{["check"] = {["trigger"] = 1,["op"] = "<=",["variable"] = "expirationTime",["value"] = "2",},["linked"] = false,["changes"] = {{["value"] = true,["property"] = "sub.4.glow",},},},{["check"] = {["trigger"] = 1,["op"] = ">=",["variable"] = "expirationTime",["value"] = "20",},["linked"] = true,["changes"] = {{["property"] = "sub.3.border_visible",},{["property"] = "alpha",},},},{["check"] = {["trigger"] = 1,["op"] = "<",["variable"] = "expirationTime",["value"] = "0",},["changes"] = {{["value"] = {["custom"] = "local s = aura_env.state\
if s and s.hide > 0 then\
    C_Timer.After(s.hide, function()\
            WeakAuras.ScanEvents(\"RELOE_SPELLCD_STATE_CLEAN\", s.GUID..s.spellID, s.expirationTime)\
    end)\
end\
\
\
\
\
",},["property"] = "customcode",},},},},["information"] = {["forceEvents"] = false,["ignoreOptionsEventErrors"] = true,},["cooldownEdge"] = false,},["2. Coalescing Void Cast [RUN AWAY] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.43529415130615,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2687",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["auto"] = true,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "VgttGjlsfZt",["displayIcon"] = "1097742",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["color"] = {},["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "2. Bars - The Amalgamation Chamber",["customTextUpdate"] = "update",["borderOffset"] = 5,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 403459,["auranames"] = {"Interdimensional Wormhole","362721",},["duration"] = "3",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_exact_spellId"] = false,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["use_debuffClass"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["use_unit"] = true,["subeventPrefix"] = "SPELL",["unit"] = "boss",["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["group_countOperator"] = ">",["type"] = "unit",["useExactSpellId"] = false,["auraspellids"] = {},["use_genericShowOn"] = true,["debuffType"] = "HARMFUL",["useName"] = true,["unevent"] = "auto",["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["custom_type"] = "event",["custom_hide"] = "timed",["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "custom",["custom"] = "function()\
    return aura_env.isBossInRange()\
end",["custom_type"] = "event",["unit"] = "player",["debuffType"] = "HELPFUL",["events"] = "TRIGGER:1",["custom_hide"] = "custom",},["untrigger"] = {["custom"] = "function()\
    return not aura_env.isBossInRange()\
end",},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(trigger)\
    return trigger[1]\
end",["activeTriggerMode"] = 1,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["internalVersion"] = 65,["useAdjustededMax"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["easeStrength"] = 3,["rotate"] = 0,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["icon"] = true,["stickyDuration"] = false,["sparkRotationMode"] = "AUTO",["anchorFrameType"] = "SCREEN",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "RUN AWAY",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_text_format_destName_abbreviate"] = false,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["border_offset"] = 0,["type"] = "subborder",["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["height"] = 23,["timerFlags"] = "None",["timer"] = true,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["xOffset"] = 0,["source"] = "import",["id"] = "2. Coalescing Void Cast [RUN AWAY] - The Amalgamation Chamber",["textSize"] = 12,["timerSize"] = 12,["border"] = false,["borderEdge"] = "None",["displayTextRight"] = "%p",["borderInFront"] = false,["zoom"] = 0,["icon_side"] = "LEFT",["sparkWidth"] = 3,["sparkOffsetX"] = 0,["sparkHeight"] = 14,["borderSize"] = 16,["borderColor"] = {1,1,1,0.5,},["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["spark"] = false,["sparkHidden"] = "NEVER",["config"] = {},["frameStrata"] = 1,["width"] = 240,["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["custom"] = "aura_env.LRC = LibStub(\"LibRangeCheck-2.0\")\
aura_env.bossName = \"Essence of Shadow\"\
\
function aura_env.isBossInRange()\
    local unit = aura_env.getUnitFromName(aura_env.bossName, \"boss\")\
    return aura_env.isUnitInRange(unit)\
end\
\
function aura_env.isUnitInRange(unit)\
    local unitRange, _ = aura_env.LRC and unit and aura_env.LRC:GetRange(unit) or math.huge\
    return unitRange <= 40\
end\
\
function aura_env.getUnitFromName(name, type)\
    for i = 1, 40 do\
        local unit = type .. tostring(i)\
        local unitName, _ = UnitName(unit)\
        if unitName == name then\
            return unit\
        end\
    end\
end",["do_custom"] = true,},},["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 2,["variable"] = "show",["value"] = 0,},["changes"] = {{["value"] = 0,["property"] = "alpha",},},},},["barColor2"] = {1,1,0,1,},["sparkColor"] = {1,1,1,1,},},["2. Shadowflame Burst Cast [FRONTAL CONE] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.9764706492424,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2687",["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "4914677",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "2. Bars - The Amalgamation Chamber",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["sparkRotationMode"] = "AUTO",["uid"] = "hPT8uRczhtl",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 406783,["auranames"] = {"Advanced Recombobulation","362732",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["spellName"] = 0,["showClones"] = true,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_absorbHealMode"] = true,["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["names"] = {"Sacred Blade",},["use_exact_spellId"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["custom_type"] = "event",["unit"] = "boss",["duration"] = "3",["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["use_genericShowOn"] = true,["type"] = "unit",["useExactSpellId"] = false,["unevent"] = "auto",["useName"] = true,["auraspellids"] = {},["debuffType"] = "HARMFUL",["group_countOperator"] = ">",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["use_unit"] = true,["remOperator"] = "<",["subeventPrefix"] = "SPELL",["custom_hide"] = "timed",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["internalVersion"] = 65,["displayTextLeft"] = "%n",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["rotate"] = 0,["easeStrength"] = 3,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderOffset"] = 5,["stickyDuration"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["do_custom"] = false,},},["anchorFrameType"] = "SCREEN",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FRONTAL CONE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["rotateText"] = "NONE",["text_text_format_1.destName_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.destName_abbreviate_max"] = 12,["text_text_format_1.destName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_text_format_1.destName_format"] = "Unit",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_justify"] = "CENTER",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.destName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["type"] = "subborder",["border_offset"] = 0,["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["height"] = 23,["timerFlags"] = "None",["timer"] = true,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["source"] = "import",["id"] = "2. Shadowflame Burst Cast [FRONTAL CONE] - The Amalgamation Chamber",["customTextUpdate"] = "update",["timerSize"] = 12,["border"] = false,["borderEdge"] = "None",["displayTextRight"] = "%p",["borderInFront"] = false,["borderSize"] = 16,["icon_side"] = "LEFT",["zoom"] = 0,["sparkWidth"] = 3,["sparkHeight"] = 14,["borderBackdrop"] = "Blizzard Tooltip",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["authorOptions"] = {},["sparkHidden"] = "NEVER",["auto"] = true,["frameStrata"] = 1,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["inverse"] = false,["sparkColor"] = {1,1,1,1,},["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["borderInset"] = 11,},["2. Gloom Conflagration Cast [BIG SOAK + RUN AWAY] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.42352944612503,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "uBOlw8TwyKf",["displayIcon"] = "4914678",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "2. Bars - The Amalgamation Chamber",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["color"] = {},["customTextUpdate"] = "update",["borderOffset"] = 5,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 405437,["auranames"] = {"Advanced Recombobulation","362732",},["use_genericShowOn"] = true,["group_count"] = "0",["custom_hide"] = "timed",["showClones"] = true,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["useExactSpellId"] = false,["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["subeventPrefix"] = "SPELL",["use_absorbMode"] = true,["use_tooltip"] = false,["ignoreSelf"] = true,["spellName"] = 0,["custom_type"] = "event",["names"] = {"Sacred Blade",},["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["buffShowOn"] = "showOnActive",["use_unit"] = true,["useName"] = true,["debuffType"] = "HARMFUL",["unevent"] = "auto",["unit"] = "boss",["matchesShowOn"] = "showOnActive",["type"] = "unit",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["duration"] = "3",["remOperator"] = "<",["use_absorbHealMode"] = true,["group_countOperator"] = ">",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["internalVersion"] = 65,["backdropColor"] = {1,1,1,0.5,},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["easeStrength"] = 3,["rotate"] = 0,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkColor"] = {1,1,1,1,},["stickyDuration"] = false,["sparkRotationMode"] = "AUTO",["width"] = 240,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BIG SOAK + RUN AWAY",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["rotateText"] = "NONE",["text_text_format_1.destName_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.destName_abbreviate_max"] = 12,["text_text_format_1.destName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_text_format_1.destName_format"] = "Unit",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_justify"] = "CENTER",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.destName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["type"] = "subborder",["border_offset"] = 0,["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["url"] = "https://echoesports.gg",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["authorOptions"] = {},["source"] = "import",["sparkHidden"] = "NEVER",["height"] = 23,["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["semver"] = "1.0.5",["borderInFront"] = false,["sparkWidth"] = 3,["icon_side"] = "LEFT",["zoom"] = 0,["borderSize"] = 16,["sparkHeight"] = 14,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["borderBackdrop"] = "Blizzard Tooltip",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["displayTextLeft"] = "%n",["id"] = "2. Gloom Conflagration Cast [BIG SOAK + RUN AWAY] - The Amalgamation Chamber",["auto"] = true,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["icon"] = true,["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["config"] = {},},["2. Blistering Twilight Cast [BOMBS + TORNADOES] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.36862745881081,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["class"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "4914676",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "2. Bars - The Amalgamation Chamber",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["color"] = {},["uid"] = "neSHLGqJNpO",["config"] = {},["sparkRotationMode"] = "AUTO",["height"] = 23,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 405641,["auranames"] = {"364963","Core Overload",},["duration"] = "10",["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "boss",["custom_hide"] = "timed",["use_tooltip"] = false,["ignoreSelf"] = true,["subeventPrefix"] = "SPELL",["use_debuffClass"] = false,["use_unit"] = true,["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["use_genericShowOn"] = true,["type"] = "unit",["useName"] = true,["unevent"] = "auto",["names"] = {"Sacred Blade",},["custom_type"] = "event",["auraspellids"] = {},["debuffType"] = "HARMFUL",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["matchesShowOn"] = "showOnActive",["remOperator"] = "<",["use_exact_spellId"] = true,["group_countOperator"] = ">",["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["rotateText"] = "NONE",["internalVersion"] = 65,["customTextUpdate"] = "update",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["rotate"] = 0,["easeStrength"] = 3,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["anchorFrameType"] = "SCREEN",["stickyDuration"] = false,["stacksFlags"] = "None",["authorOptions"] = {},["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BOMBS + TORNADOES",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["anchorXOffset"] = 0,["anchorYOffset"] = 0,},{["type"] = "subborder",["border_size"] = 1,["border_anchor"] = "bar",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},},["timer"] = true,["timerFlags"] = "None",["id"] = "2. Blistering Twilight Cast [BOMBS + TORNADOES] - The Amalgamation Chamber",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["auto"] = true,["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["timerSize"] = 12,["border"] = false,["borderEdge"] = "None",["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["borderSize"] = 16,["sparkWidth"] = 3,["icon_side"] = "LEFT",["borderBackdrop"] = "Blizzard Tooltip",["zoom"] = 0,["sparkHeight"] = 14,["borderInFront"] = false,["borderOffset"] = 5,["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["backdropColor"] = {1,1,1,0.5,},["sparkHidden"] = "NEVER",["sparkRotation"] = 0,["frameStrata"] = 1,["width"] = 240,["customText"] = "function()\
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
",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["do_custom"] = false,},},["inverse"] = false,["stacksFont"] = "Friz Quadrata TT",["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["2. Molten Eruption Cast [SOAKS INC] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.41960787773132,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},["encounterid"] = "2687",["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["zoneIds"] = "",},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "roD(BBRG7Lt",["displayIcon"] = "524305",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["color"] = {},["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {1,1,0,1,},["parent"] = "2. Bars - The Amalgamation Chamber",["customTextUpdate"] = "update",["borderBackdrop"] = "Blizzard Tooltip",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = "403101",["auranames"] = {"Advanced Recombobulation","362732",},["use_genericShowOn"] = true,["group_count"] = "0",["spellName"] = 0,["showClones"] = true,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["use_sourceUnit"] = false,["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["custom_hide"] = "timed",["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["unit"] = "boss",["duration"] = "5.2",["use_tooltip"] = false,["ignoreSelf"] = true,["use_absorbMode"] = true,["use_unit"] = true,["matchesShowOn"] = "showOnActive",["spellIds"] = {283573,},["buffShowOn"] = "showOnActive",["custom_type"] = "event",["useName"] = true,["type"] = "unit",["unevent"] = "auto",["auraspellids"] = {},["use_debuffClass"] = false,["debuffType"] = "HARMFUL",["subeventPrefix"] = "SPELL",["realSpellName"] = 0,["use_spellName"] = false,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["names"] = {"Sacred Blade",},["remOperator"] = "<",["group_countOperator"] = ">",["subeventSuffix"] = "_CAST_SUCCESS",["useRem"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "custom",["custom"] = "function()\
    return aura_env.isBossInRange()\
end",["custom_type"] = "event",["custom_hide"] = "custom",["debuffType"] = "HELPFUL",["events"] = "TRIGGER:1",["unit"] = "player",},["untrigger"] = {["custom"] = "function()\
    return not aura_env.isBossInRange()\
end",},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(trigger)\
    return trigger[1]\
end",["activeTriggerMode"] = 1,},["borderOffset"] = 5,["internalVersion"] = 65,["useAdjustededMax"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["easeStrength"] = 3,["rotate"] = 0,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkColor"] = {1,1,1,1,},["stickyDuration"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["custom"] = "aura_env.LRC = LibStub(\"LibRangeCheck-2.0\")\
aura_env.bossName = \"Eternal Blaze\"\
\
function aura_env.isBossInRange()\
    local unit = aura_env.getUnitFromName(aura_env.bossName, \"boss\")\
    return aura_env.isUnitInRange(unit)\
end\
\
function aura_env.isUnitInRange(unit)\
    local unitRange, _ = aura_env.LRC and unit and aura_env.LRC:GetRange(unit) or math.huge\
    return unitRange <= 40\
end\
\
function aura_env.getUnitFromName(name, type)\
    for i = 1, 40 do\
        local unit = type .. tostring(i)\
        local unitName, _ = UnitName(unit)\
        if unitName == name then\
            return unit\
        end\
    end\
end",["do_custom"] = true,},},["anchorFrameType"] = "SCREEN",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SOAKS INC",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_text_format_destName_abbreviate"] = false,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["type"] = "subborder",["text_text"] = "",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["height"] = 23,["timerFlags"] = "None",["timer"] = true,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["authorOptions"] = {},["source"] = "import",["id"] = "2. Molten Eruption Cast [SOAKS INC] - The Amalgamation Chamber",["displayTextLeft"] = "%n",["displayTextRight"] = "%p",["border"] = false,["borderEdge"] = "None",["borderColor"] = {1,1,1,0.5,},["borderInFront"] = false,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["icon_side"] = "LEFT",["borderSize"] = 16,["zoom"] = 0,["sparkHeight"] = 14,["timerSize"] = 12,["sparkWidth"] = 3,["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["auto"] = true,["sparkHidden"] = "NEVER",["stacksFont"] = "Friz Quadrata TT",["frameStrata"] = 1,["width"] = 240,["sparkRotationMode"] = "AUTO",["url"] = "https://echoesports.gg",["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {{["changes"] = {{["value"] = 0,["property"] = "alpha",},},["check"] = {["value"] = 0,["variable"] = "show",["trigger"] = 2,},},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["config"] = {},},["2. Convergent Eruption Cast Cast [SOAKS + BALLS INC] - The Amalgamation Chamber"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.41960787773132,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["multi"] = {},},["use_zoneIds"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["encounterid"] = "2687",["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["class"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["race"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["stacksFont"] = "Friz Quadrata TT",["spark"] = false,["tocversion"] = 100100,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "332402",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "2. Bars - The Amalgamation Chamber",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {},["sparkRotationMode"] = "AUTO",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 408193,["auranames"] = {"Advanced Recombobulation","362732",},["matchesShowOn"] = "showOnActive",["group_count"] = "0",["group_countOperator"] = ">",["showClones"] = true,["name_operator"] = "find('%s')",["use_debuffClass"] = false,["subeventSuffix"] = "_CAST_SUCCESS",["fetchTooltip"] = true,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["use_sourceUnit"] = false,["check"] = "event",["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["useGroup_count"] = true,["use_absorbMode"] = true,["use_exact_spellId"] = false,["genericShowOn"] = "showOnCooldown",["unit"] = "boss",["use_absorbHealMode"] = true,["use_tooltip"] = false,["ignoreSelf"] = true,["custom_hide"] = "timed",["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["debuffType"] = "HARMFUL",["useExactSpellId"] = false,["useName"] = true,["custom_type"] = "event",["unevent"] = "auto",["duration"] = "5.2",["buffShowOn"] = "showOnActive",["type"] = "unit",["auraspellids"] = {},["realSpellName"] = 0,["use_spellName"] = true,["spellIds"] = {283573,},["names"] = {"Sacred Blade",},["remOperator"] = "<",["spellName"] = 0,["use_unit"] = true,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["auto"] = true,["internalVersion"] = 65,["useAdjustededMax"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["colorA"] = 1,["duration"] = "0",["rotate"] = 0,["easeStrength"] = 3,["duration_type"] = "seconds",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderOffset"] = 5,["stickyDuration"] = false,["url"] = "https://echoesports.gg",["width"] = 240,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SOAKS + BALLS INC",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_affected_format"] = "none",["text_text_format_destName_decimal_precision"] = 1,["text_text_format_destName_abbreviate"] = false,["type"] = "subtext",["text_anchorXOffset"] = 2,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_wordWrap"] = "WordWrap",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_text_format_p_format"] = "timed",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["border_offset"] = 0,["type"] = "subborder",["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["xOffset"] = 0,["source"] = "import",["sparkHidden"] = "NEVER",["customTextUpdate"] = "update",["semver"] = "1.0.5",["border"] = false,["borderEdge"] = "None",["borderBackdrop"] = "Blizzard Tooltip",["borderInFront"] = false,["zoom"] = 0,["icon_side"] = "LEFT",["borderSize"] = 16,["backgroundColor"] = {0.46274509803922,0.47843137254902,0.47058823529412,0.89758960157633,},["sparkHeight"] = 14,["sparkWidth"] = 3,["timerSize"] = 12,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["textSize"] = 12,["id"] = "2. Convergent Eruption Cast Cast [SOAKS + BALLS INC] - The Amalgamation Chamber",["sparkColor"] = {1,1,1,1,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = false,},["finish"] = {},},["inverse"] = false,["uid"] = "xj87o4LFyJA",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {1,1,0,1,},["config"] = {},},});


-- 2. manifest data

journal:AddManifestData({
	{
		["echoVersion"] = 7,
		["parent"] = "!Echo - Aberrus",
		["id"] = "2. The Amalgamation Chamber",
		["children"] = {
			"2. Singles - The Amalgamation Chamber",
			"2. Bars - The Amalgamation Chamber",
			"2. Icons - Low Priority - The Amalgamation Chamber",
			"2. Icons - High Priority - The Amalgamation Chamber",
		},
		["uid"] = "Wm0kS1yciTy",
	},
	{
		["echoVersion"] = 2,
		["parent"] = "2. The Amalgamation Chamber",
		["id"] = "2. Singles - The Amalgamation Chamber",
		["children"] = {
			"2. Texts (anchored) - The Amalgamation Chamber",
			"2. Spell CDs on Nameplates - The Amalgamation Chamber",
			"2. Blistering Twilight - Circle - The Amalgamation Chamber",
			"2. Umbral Detonation - Circle - The Amalgamation Chamber",
			"2. Add Health - The Amalgamation Chamber",
			"2. Fire/Shadow lists - The Amalgamation Chamber",
		},
		["uid"] = "rt12Bw0O0Co",
	},
	{
		["echoVersion"] = 1,
		["parent"] = "2. Singles - The Amalgamation Chamber",
		["id"] = "2. Texts (anchored) - The Amalgamation Chamber",
		["children"] = {
			"2. Intermission - [SPREAD] - The Amalgamation Chamer",
		},
		["uid"] = "y3Qk0GvWnRN",
	},
	{
		["id"] = "2. Intermission - [SPREAD] - The Amalgamation Chamer",
		["uid"] = "Ote(G5HYw3d",
		["parent"] = "2. Texts (anchored) - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "2. Singles - The Amalgamation Chamber",
		["id"] = "2. Spell CDs on Nameplates - The Amalgamation Chamber",
		["children"] = {
			"2. Spell CDs - The Amalgamation Chamber",
		},
		["uid"] = "pNasxgqHKK6",
	},
	{
		["id"] = "2. Spell CDs - The Amalgamation Chamber",
		["uid"] = "3Pn13BJiHdC",
		["parent"] = "2. Spell CDs on Nameplates - The Amalgamation Chamber",
		["echoVersion"] = 2,
	},
	{
		["id"] = "2. Blistering Twilight - Circle - The Amalgamation Chamber",
		["uid"] = "qFT9163)zIS",
		["parent"] = "2. Singles - The Amalgamation Chamber",
		["echoVersion"] = 2,
	},
	{
		["id"] = "2. Umbral Detonation - Circle - The Amalgamation Chamber",
		["uid"] = "SzmoOqd2mCd",
		["parent"] = "2. Singles - The Amalgamation Chamber",
		["echoVersion"] = 2,
	},
	{
		["id"] = "2. Add Health - The Amalgamation Chamber",
		["uid"] = "hORisl2v0Jj",
		["parent"] = "2. Singles - The Amalgamation Chamber",
		["echoVersion"] = 3,
	},
	{
		["echoVersion"] = 2,
		["parent"] = "2. Singles - The Amalgamation Chamber",
		["id"] = "2. Fire/Shadow lists - The Amalgamation Chamber",
		["children"] = {
			"Fire/Shadow Debuff List",
			"Fire/Shadow Debuff Controller",
		},
		["uid"] = "dhbpYazTDHD",
	},
	{
		["echoVersion"] = 2,
		["parent"] = "2. Fire/Shadow lists - The Amalgamation Chamber",
		["id"] = "Fire/Shadow Debuff List",
		["children"] = {
			"Fire/Shadow Debuff Bar",
		},
		["uid"] = "1d(Uc8qWBnd",
	},
	{
		["id"] = "Fire/Shadow Debuff Bar",
		["uid"] = "kjV4MaVluT(",
		["parent"] = "Fire/Shadow Debuff List",
		["echoVersion"] = 1,
	},
	{
		["id"] = "Fire/Shadow Debuff Controller",
		["uid"] = "K)L5lTxfsR9",
		["parent"] = "2. Fire/Shadow lists - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "2. The Amalgamation Chamber",
		["id"] = "2. Bars - The Amalgamation Chamber",
		["children"] = {
			"2. Shadow and Flame [MARKS] - The Amalgamation Chamber",
			"2. Shadowflame Burst Cast [FRONTAL CONE] - The Amalgamation Chamber",
			"2. Withering Vulnerability Cast [TANK SLASH] - The Amalgamation Chamber",
			"2. Convergent Eruption Soak [SOAKS + BALLS] - The Amalgamation Chamber",
			"2. Convergent Eruption Cast Cast [SOAKS + BALLS INC] - The Amalgamation Chamber",
			"2. Blistering Twilight Cast [BOMBS + TORNADOES] - The Amalgamation Chamber",
			"2. Gloom Conflagration Boom [BOOM] - The Amalgamation Chamber",
			"2. Gloom Conflagration Cast [BIG SOAK + RUN AWAY] - The Amalgamation Chamber",
			"2. Shadow Spike Cast [TANK SLASH] - The Amalgamation Chamber",
			"2. Shadows Convergence Cast [DODGE BALLS] - The Amalgamation Chamber",
			"2. Umbral Detonation Cast [BOMBS] - The Amalgamation Chamber",
			"2. Coalescing Void Boom [BOOM] - The Amalgamation Chamber",
			"2. Coalescing Void Cast [RUN AWAY] - The Amalgamation Chamber",
			"2. Flame Slash Cast [TANK SLASH] - The Amalgamation Chamber",
			"2. Swirling Flame Cast [TORNADOES] - The Amalgamation Chamber",
			"2. Molten Eruption Soak [SOAKS] - The Amalgamation Chamber",
			"2. Molten Eruption Cast [SOAKS INC] - The Amalgamation Chamber",
			"2. Fiery Meteor Cast [BIG SOAK] - The Amalgamation Chamber",
		},
		["uid"] = "CPxCIZCoeP0",
	},
	{
		["id"] = "2. Shadow and Flame [MARKS] - The Amalgamation Chamber",
		["uid"] = "ii()01Us0N4",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Shadowflame Burst Cast [FRONTAL CONE] - The Amalgamation Chamber",
		["uid"] = "hPT8uRczhtl",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Withering Vulnerability Cast [TANK SLASH] - The Amalgamation Chamber",
		["uid"] = "m(xDW4v82ZY",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Convergent Eruption Soak [SOAKS + BALLS] - The Amalgamation Chamber",
		["uid"] = "DYg3793xaD0",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Convergent Eruption Cast Cast [SOAKS + BALLS INC] - The Amalgamation Chamber",
		["uid"] = "xj87o4LFyJA",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Blistering Twilight Cast [BOMBS + TORNADOES] - The Amalgamation Chamber",
		["uid"] = "neSHLGqJNpO",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Gloom Conflagration Boom [BOOM] - The Amalgamation Chamber",
		["uid"] = "kRv4Hc83h8c",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Gloom Conflagration Cast [BIG SOAK + RUN AWAY] - The Amalgamation Chamber",
		["uid"] = "uBOlw8TwyKf",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Shadow Spike Cast [TANK SLASH] - The Amalgamation Chamber",
		["uid"] = "88tpX232mJW",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Shadows Convergence Cast [DODGE BALLS] - The Amalgamation Chamber",
		["uid"] = "GtITZCAyMQa",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Umbral Detonation Cast [BOMBS] - The Amalgamation Chamber",
		["uid"] = "x5XDlNWfcv1",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Coalescing Void Boom [BOOM] - The Amalgamation Chamber",
		["uid"] = "ZS2KMPf8qkG",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Coalescing Void Cast [RUN AWAY] - The Amalgamation Chamber",
		["uid"] = "VgttGjlsfZt",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Flame Slash Cast [TANK SLASH] - The Amalgamation Chamber",
		["uid"] = "FOFVe)0hxuW",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Swirling Flame Cast [TORNADOES] - The Amalgamation Chamber",
		["uid"] = "KRpBd1AjE2n",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Molten Eruption Soak [SOAKS] - The Amalgamation Chamber",
		["uid"] = "Y0Wm8XnYGZ4",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Molten Eruption Cast [SOAKS INC] - The Amalgamation Chamber",
		["uid"] = "roD(BBRG7Lt",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Fiery Meteor Cast [BIG SOAK] - The Amalgamation Chamber",
		["uid"] = "Y4xMbWp1FV0",
		["parent"] = "2. Bars - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "2. The Amalgamation Chamber",
		["id"] = "2. Icons - Low Priority - The Amalgamation Chamber",
		["children"] = {
			"2. Shadowflame - The Amalgamation Chamber",
			"2. Blazing Heat P1 - The Amalgamation Chamber",
			"2. Corrupting Shadow P1 - The Amalgamation Chamber",
			"2. Lingering Umbra [MOVE] - The Amalgamation Chamber",
			"2. Engulfing Heat [MOVE] - The Amalgamation Chamber",
			"2. Lingering Flames - The Amalgamation Chamber",
			"2. Lingering Shadows - The Amalgamation Chamber",
		},
		["uid"] = "Sy4AInzVNBW",
	},
	{
		["id"] = "2. Shadowflame - The Amalgamation Chamber",
		["uid"] = "8zIwL5f52av",
		["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Blazing Heat P1 - The Amalgamation Chamber",
		["uid"] = "GZUMUrMcH4(",
		["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Corrupting Shadow P1 - The Amalgamation Chamber",
		["uid"] = "vsbVUinuEtI",
		["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Lingering Umbra [MOVE] - The Amalgamation Chamber",
		["uid"] = "wuJNb(qPUcx",
		["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Engulfing Heat [MOVE] - The Amalgamation Chamber",
		["uid"] = "JfyR3pUIBaN",
		["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Lingering Flames - The Amalgamation Chamber",
		["uid"] = "6Khoaqhcxtx",
		["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Lingering Shadows - The Amalgamation Chamber",
		["uid"] = "t97lOBZLUkt",
		["parent"] = "2. Icons - Low Priority - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "2. The Amalgamation Chamber",
		["id"] = "2. Icons - High Priority - The Amalgamation Chamber",
		["children"] = {
			"2. Blazing Heat P2 - The Amalgamation Chamber",
			"2. Corrupting Shadow P2 - The Amalgamation Chamber",
			"Withering Vulnerability - The Amalgamation Chamber",
			"2. Blistering Twilight [BOMB] - The Amalgamation Chamber",
			"2. Umbral Detonation [BOMB] - The Amalgamation Chamber",
		},
		["uid"] = "avtY))wgdd6",
	},
	{
		["id"] = "2. Blazing Heat P2 - The Amalgamation Chamber",
		["uid"] = "iYo2X9tTm2J",
		["parent"] = "2. Icons - High Priority - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Corrupting Shadow P2 - The Amalgamation Chamber",
		["uid"] = "iL)OyCa3eFD",
		["parent"] = "2. Icons - High Priority - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "Withering Vulnerability - The Amalgamation Chamber",
		["uid"] = "DH2IhCeRsKk",
		["parent"] = "2. Icons - High Priority - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Blistering Twilight [BOMB] - The Amalgamation Chamber",
		["uid"] = "TiKZAyZ8SVJ",
		["parent"] = "2. Icons - High Priority - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
	{
		["id"] = "2. Umbral Detonation [BOMB] - The Amalgamation Chamber",
		["uid"] = "PjxJBWMQhK2",
		["parent"] = "2. Icons - High Priority - The Amalgamation Chamber",
		["echoVersion"] = 1,
	},
},1208,0);

--fixUpNestedPreview(2,1208,"2. The Amalgamation Chamber");