
local _AddonName, _EchoRaidTools = ...;

local journal = _EchoRaidTools:GetModule("waJournal");

-- 8. export data

journal:AddImportData({["8. Player Can Dwarf it"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 4,["cooldownSwipe"] = true,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "spell",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["use_genericShowOn"] = true,["genericShowOn"] = "showOnReady",["subeventPrefix"] = "SPELL",["realSpellName"] = "Stoneform",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["names"] = {},["use_track"] = true,["spellName"] = 20594,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "spell",["subeventSuffix"] = "_CAST_START",["spellName"] = 265221,["use_genericShowOn"] = true,["genericShowOn"] = "showOnReady",["subeventPrefix"] = "SPELL",["realSpellName"] = "Fireblood",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["names"] = {},["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["useName"] = true,["auranames"] = {"424581",},["unit"] = "player",["type"] = "aura2",["debuffType"] = "BOTH",},["untrigger"] = {},},[4] = {["trigger"] = {["type"] = "addons",["unit"] = "player",["use_stage"] = true,["event"] = "Boss Mod Stage",["stage_operator"] = ">",["stage"] = "1",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return (t[1] or t[2]) and t[3] and t[4] end",["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_shadowYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_fontSize"] = 12,["anchorXOffset"] = 0,["text_fontType"] = "OUTLINE",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "buttonOverlay",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["useGlowColor"] = false,["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 30,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["regionType"] = "icon",["color"] = {1,1,1,1,},["information"] = {},["icon"] = true,["parent"] = "8. Dispel Traffic Light",["cooldownTextDisabled"] = false,["uid"] = "PccuKdsYTnC",["zoom"] = 0,["alpha"] = 1,["tocversion"] = 100200,["id"] = "8. Player Can Dwarf it",["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["width"] = 30,["useCooldownModRate"] = true,["config"] = {},["inverse"] = false,["xOffset"] = 50,["selfPoint"] = "CENTER",["conditions"] = {},["cooldown"] = true,["desc"] = "Reminder Icon for when you have the debuff but can remove it yourself with a racial.",},["8. [SEEDS] - P2 - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 350,["anchorPoint"] = "CENTER",["echoVersion"] = 8,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "460698",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["color"] = {},["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderInset"] = 11,["sparkColor"] = {1,1,1,1,},["sparkRotationMode"] = "AUTO",["auto"] = true,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellId"] = {423265,},["auranames"] = {"423265",},["use_absorbMode"] = true,["unit"] = "boss",["destUnit"] = "boss1",["group_count"] = "0",["group_countOperator"] = ">",["debuffType"] = "BOTH",["type"] = "combatlog",["use_specific_destUnit"] = true,["subeventSuffix"] = "_AURA_APPLIED",["use_unit"] = true,["duration"] = "5",["event"] = "Combat Log",["useGroup_count"] = true,["use_exact_spellId"] = false,["use_spellId"] = true,["spellIds"] = {},["subeventPrefix"] = "SPELL",["useName"] = true,["use_destUnit"] = true,["names"] = {},["use_absorbHealMode"] = true,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["unit"] = "player",["use_stage"] = true,["event"] = "Boss Mod Stage",["stage_operator"] = "==",["stage"] = "2",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "",["event"] = "Combat Log",["unit"] = "player",["custom"] = "function(s,e,...)\
    local _, subEvent, _, sourceGUID, _, _, _, destGUID, destName, _, _, spellID = ...\
    if subEvent == \"SPELL_CAST_SUCCESS\" and spellID == 423265 then\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            count = 16,\
        }\
        return true\
    elseif subEvent == \"SPELL_AURA_APPLIED\" and spellID == 430583 and s[\"\"] then\
        s[\"\"].count = s[\"\"].count - 1\
        s[\"\"].changed = true\
        return true\
    end\
end",["events"] = "CLEU:SPELL_CAST_SUCCESS:SPELL_AURA_APPLIED",["check"] = "event",["custom_type"] = "stateupdate",["subeventPrefix"] = "",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] and t[2] end",["activeTriggerMode"] = -10,},["borderOffset"] = 5,["internalVersion"] = 70,["rotateText"] = "NONE",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["stacksFlags"] = "None",["stickyDuration"] = false,["width"] = 350,["borderColor"] = {1,1,1,0.5,},["uid"] = "aCuaGV)7tiV",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SOAK SEEDS %3.count",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_text_format_3.count_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["border_anchor"] = "bar",["border_size"] = 1,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 35,["timerFlags"] = "None",["id"] = "8. [SEEDS] - P2 - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["timerSize"] = 12,["customText"] = "function()\
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
",["displayTextLeft"] = "%n",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["stacksFont"] = "Friz Quadrata TT",["textFlags"] = "None",["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["zoom"] = 0,["sparkHidden"] = "NEVER",["timer"] = true,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["customTextUpdate"] = "update",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["inverse"] = false,["sparkOffsetX"] = 0,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",},["8. Texts - Tindral Sageswift, Seer of the Flame"] = {["grow"] = "DOWN",["controlledChildren"] = {"8. [FEATHER NEXT] (note)","8. [DISPEL NEXT] (note)","8. [DON'T SOAK] - Seed of Flame Debuff - Tindral Sageswift, Seer of the Flame - single",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["fullCircle"] = true,["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["stagger"] = 0,["useLimit"] = false,["selfPoint"] = "TOP",["subRegions"] = {},["borderInset"] = 1,["sortHybridTable"] = {["8. [FEATHER NEXT] (note)"] = false,["8. [DON'T SOAK] - Seed of Flame Debuff - Tindral Sageswift, Seer of the Flame - single"] = false,["8. [DISPEL NEXT] (note)"] = false,},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["source"] = "import",["backdropColor"] = {1,1,1,0.5,},["uid"] = "Q1Ypvx2aE1K",["animate"] = false,["anchorFrameFrame"] = "WeakAuras:Texts - Anchor [AMIR]",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["authorOptions"] = {},["gridWidth"] = 5,["arcLength"] = 360,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["radius"] = 200,["tocversion"] = 100200,["id"] = "8. Texts - Tindral Sageswift, Seer of the Flame",["regionType"] = "dynamicgroup",["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["parent"] = "8. Tindral Sageswift, Seer of the Flame",["config"] = {},["gridType"] = "RD",["borderColor"] = {0,0,0,1,},["space"] = 2,["conditions"] = {},["information"] = {},["rotation"] = 0,},["8. [WATCH] - Flame Surge PREdebuff - Tindral Sageswift, Seer of the Flame "] = {["iconSource"] = -1,["xOffset"] = 190,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = true,},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = false,["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["unit"] = "player",["useExactSpellId"] = true,["spellIds"] = {},["names"] = {},["auraspellids"] = {"427297",},["auranames"] = {"422000",},["type"] = "aura2",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "WATCH",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = true,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["selfPoint"] = "CENTER",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["stickyDuration"] = false,["uid"] = "b80rXN4Jl0Y",["frameStrata"] = 1,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [WATCH] - Flame Surge PREdebuff - Tindral Sageswift, Seer of the Flame ",["zoom"] = 0,["useCooldownModRate"] = true,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["authorOptions"] = {},},["8. Fiery Growth - Zaelia only"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 3,["anchorPoint"] = "CENTER",["echoVersion"] = 6,["cooldownSwipe"] = true,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["useGroup_count"] = true,["debuffType"] = "HARMFUL",["event"] = "Health",["names"] = {},["subeventPrefix"] = "SPELL",["unit"] = "group",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["group_count"] = "1",["useName"] = true,["auranames"] = {"424581",},["group_countOperator"] = "==",},["untrigger"] = {},},[2] = {["trigger"] = {["debuffType"] = "HARMFUL",["type"] = "aura2",["auranames"] = {"424582",},["useGroup_count"] = true,["group_count"] = "0",["useName"] = true,["unit"] = "group",["group_countOperator"] = "==",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end\
",["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "DISPEL NOW",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "OUTER_BOTTOM",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_fontType"] = "OUTLINE",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Proc",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["useGlowColor"] = false,["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_namerealm"] = true,["namerealm"] = "Lyskanoon",["use_ignoreNameRealm"] = false,["encounterid"] = "2786",["use_encounterid"] = true,["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["regionType"] = "icon",["color"] = {1,1,1,1,},["information"] = {},["icon"] = true,["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["zoom"] = 0,["uid"] = "4Zs6Y(Yv27I",["cooldownTextDisabled"] = false,["alpha"] = 1,["tocversion"] = 100200,["id"] = "8. Fiery Growth - Zaelia only",["width"] = 55,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["config"] = {},["inverse"] = false,["xOffset"] = 275,["selfPoint"] = "CENTER",["conditions"] = {{["check"] = {["trigger"] = 2,["variable"] = "show",["value"] = 1,},["changes"] = {{["value"] = true,["property"] = "sub.3.glow",},{["value"] = true,["property"] = "sub.2.text_visible",},},},},["cooldown"] = true,["desc"] = "Extra reminder for the 4th Dispeller. Shows when theirs is next, glows once they should go.\
In Echo this was Zaelia's assignment. You should set the Load Condition for your 4th healer. ",},["8. [ROOT] - Mass Entanglement PREDebuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"424495",},["fetchTooltip"] = false,["event"] = "Health",["subeventPrefix"] = "SPELL",["auraspellids"] = {"424495",},["subeventSuffix"] = "_CAST_START",["spellIds"] = {},["unit"] = "player",["useExactSpellId"] = true,["useName"] = false,["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "ROOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip2_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["authorOptions"] = {},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["stickyDuration"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {},["useCooldownModRate"] = true,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [ROOT] - Mass Entanglement PREDebuff - Tindral Sageswift, Seer of the Flame",["zoom"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "EPHfDTpfjk4",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",},["8. FEATHER Preglow"] = {["outline"] = "OUTLINE",["parent"] = "8. Smart Healer Glows",["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 9,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["glow_frame_type"] = "UNITFRAME",["glow_thickness"] = 2,["glow_action"] = "show",["do_glow"] = true,["glow_frequency"] = 0.1,["do_sound"] = false,["use_glow_color"] = true,["glow_type"] = "Pixel",["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.ogg",["glow_color"] = {0.93333339691162,0.54117649793625,0,1,},},["finish"] = {["hide_all_glows"] = true,},["init"] = {["do_custom"] = true,["custom"] = "local keyword = \"feather\"\
\
aura_env.positions = {\"BACKLEFT\", \"LEFT\", \"FRONT\", \"RIGHT\"}\
--aura_env.positions = {\"LEFTFRONT\",\"LEFTBACK\", \"RIGHTFRONT\", \"RIGHTBACK\"}\
\
function aura_env.TryReadNote()\
    aura_env.initialized = false;\
    aura_env.rotations = {}\
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
                    \
                    table.insert(newRotation,guy);\
                end\
            end\
            table.insert(aura_env.rotations,newRotation);\
        end\
    end\
    \
    elogl(\"feather Note Init:\",#aura_env.rotations)\
    --[[for i, set in ipairs(aura_env.rotations) do\
        for j, name in ipairs(set) do\
            print(i,j,name)\
        end\
    end]]\
    aura_env.initialized = true;\
    \
end\
\
\
\
\
",},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["names"] = {},["unit"] = "player",["events"] = "ENCOUNTER_START EXRT_NOTE_UPDATE TRIGGER:2 CLEU:SPELL_AURA_APPLIED",["custom"] = "function(s,e,num,ts,...)\
    if e == \"ENCOUNTER_START\" or e == \"EXRT_NOTE_UPDATE\" then\
        aura_env.TryReadNote()\
        aura_env.count = 1\
        \
    elseif e == \"COMBAT_LOG_EVENT_UNFILTERED\" then\
        local _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID = ...\
        if spellID == 425582 then\
            aura_env.count = aura_env.count + 1\
        end\
        \
    elseif ts and ts[\"\"] and ts[\"\"].show then\
        local count = tonumber(ts[\"\"].count)\
        if count then\
            \
            --[[local triggers = WeakAuras.GetActiveTriggers(aura_env.id)\
            local stage = triggers[3] and 2 or triggers[4] and 3 or 1\
            count = stage == 3 and count + 4 or stage == 2 and count + 2 or count\
            ]]\
            local count = aura_env.count\
            if count > #aura_env.rotations then\
                count = count % #aura_env.rotations\
            end\
            count = count == 0 and #aura_env.rotations or count\
            \
            local set = aura_env.rotations[count]\
            for i, name in pairs(set) do\
                s[name] = {\
                    show = true,\
                    changed = true,\
                    duration = 4,\
                    expirationTime = GetTime() + 4,\
                    autoHide = true,\
                    unit = name,\
                }\
                \
                return true\
            end\
        end\
    end\
end\
\
\
",["custom_type"] = "stateupdate",["check"] = "event",["subeventPrefix"] = "SPELL",["spellIds"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["spellId"] = "425582",["remaining_operator"] = "<",["event"] = "Boss Mod Timer",["unit"] = "player",["message"] = "Owl form / flare bomb",["remaining"] = "4",["use_message"] = false,["use_remaining"] = true,["use_spellId"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["internalVersion"] = 70,["selfPoint"] = "CENTER",["desc"] = "Works off the same feather note used elsewhere, but glows those frames for healers so they can be topped. ",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["use_role"] = true,["encounterid"] = "2786",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["role"] = {["single"] = "HEALER",},["class"] = {["multi"] = {},},["use_difficulty"] = true,["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 25,["source"] = "import",["shadowXOffset"] = 1,["authorOptions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["regionType"] = "text",["conditions"] = {},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["automaticWidth"] = "Auto",["uid"] = "lHL)NozOQAq",["anchorFrameParent"] = false,["displayText_format_p_time_precision"] = 1,["color"] = {1,1,1,1,},["xOffset"] = 0,["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "8. FEATHER Preglow",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["displayText_format_p_time_dynamic_threshold"] = 60,["config"] = {},["displayText"] = "",["displayText_format_pos_format"] = "none",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["wordWrap"] = "WordWrap",},["8. [FEATHER NEXT] (note)"] = {["displayText_format_2.p_time_legacy_floor"] = false,["displayText_format_position_format"] = "none",["color"] = {1,1,1,1,},["displayText_format_p_time_dynamic_threshold"] = 60,["customText"] = "function() \
    if aura_env.state and aura_env.state.show and aura_env.state.expirationTime then\
        return (aura_env.state.expirationTime - 4) - GetTime()\
    end\
end\
\
\
",["yOffset"] = 0,["displayText_format_pos_format"] = "none",["echoVersion"] = 24,["displayText_format_2.p_time_mod_rate"] = true,["customTextUpdate"] = "update",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.ogg",["do_sound"] = false,},["init"] = {["do_custom"] = true,["custom"] = "local keyword = \"feather\"\
\
aura_env.positions = {\"LEFT\", \"MIDLEFT\", \"MIDRIGHT\", \"RIGHT\"}\
--aura_env.positions = {\"LEFTFRONT\",\"LEFTBACK\", \"RIGHTFRONT\", \"RIGHTBACK\"}\
\
function aura_env.TryReadNote()\
    aura_env.initialized = false;\
    aura_env.rotations = {}\
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
                    \
                    table.insert(newRotation,guy);\
                end\
            end\
            table.insert(aura_env.rotations,newRotation);\
        end\
    end\
    \
    elogl(\"feather Note Init:\",#aura_env.rotations)\
    --[[for i, set in ipairs(aura_env.rotations) do\
        for j, name in ipairs(set) do\
            elogl(\"feathers\",i,j,name)\
        end\
    end]]\
    aura_env.initialized = true;\
    \
end\
\
\
\
\
",},["finish"] = {["stop_sound"] = true,},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["custom_type"] = "stateupdate",["customVariables"] = "{expirationTime = true}",["event"] = "Health",["names"] = {},["unit"] = "player",["events"] = "ENCOUNTER_START EXRT_NOTE_UPDATE TRIGGER:2 CLEU:SPELL_AURA_APPLIED",["spellIds"] = {},["subeventPrefix"] = "SPELL",["check"] = "event",["custom"] = "function(s,e,num,ts,...)\
    if e == \"ENCOUNTER_START\" or e == \"EXRT_NOTE_UPDATE\" then\
        aura_env.TryReadNote()\
        aura_env.count = 1\
        \
    elseif e == \"COMBAT_LOG_EVENT_UNFILTERED\" then\
        local _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID = ...\
        if spellID == 425582 then\
            aura_env.count = aura_env.count + 1\
            --elog(\"cannexx - boss cast, incrementing count\", aura_env.count)\
        end\
        \
    elseif ts and ts[\"\"] and ts[\"\"].show and not s[\"\"] then\
        --local count = tonumber(ts[\"\"].count)\
        --if count then\
        \
        --[[local triggers = WeakAuras.GetActiveTriggers(aura_env.id)\
            local stage = triggers[3] and 2 or triggers[4] and 3 or 1\
            count = stage == 3 and count + 4 or stage == 2 and count + 2 or count\
            ]]\
        local count = aura_env.count\
        if count > #aura_env.rotations then\
            count = count % #aura_env.rotations\
        end\
        count = count == 0 and #aura_env.rotations or count\
        \
        local set = aura_env.rotations[count]\
        if set then\
            \
            --elogl(\"feather note, count\", count, \"set\", unpack(set))\
            --elog(\"cannexx, count\", count, \"set\", unpack(set))\
            \
            local i = tIndexOf(set, WeakAuras.me)\
            if i then\
                --elog(\"my feather\", i, \"count\", count)\
                s[\"\"] = {\
                    show = true,\
                    changed = true,\
                    duration = 8,\
                    expirationTime = GetTime() + 8,\
                    autoHide = true,\
                    progressType = \"timed\",\
                    pos = aura_env.positions[i]\
                }\
                \
                return true\
            end\
        end\
        \
    elseif e == \"OPTIONS\" then\
        local i = math.random(1,4)\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            duration = 8,\
            expirationTime = GetTime() + 8,\
            autoHide = true,\
            progressType = \"timed\",\
            pos = aura_env.positions[i]\
        }\
        \
        return true\
    end\
end\
\
\
",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["spellId"] = "425582",["remaining_operator"] = "<",["event"] = "Boss Mod Timer",["unit"] = "player",["message"] = "Owl form / flare bomb",["remaining"] = "4",["use_message"] = false,["use_remaining"] = true,["use_spellId"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["useName"] = true,["auranames"] = {"425657","422509",},["debuffType"] = "BOTH",["matchesShowOn"] = "showOnMissing",["type"] = "aura2",["unit"] = "player",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] and t[3] end",["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["wordWrap"] = "WordWrap",["displayText_format_p_time_format"] = 0,["conditions"] = {{["check"] = {["trigger"] = 2,["variable"] = "expirationTime",["op"] = "<",["value"] = "2",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 2,["variable"] = "show",["op"] = "<",["value"] = 0,},["changes"] = {{["value"] = {0,0.9215686917305,1,1,},["property"] = "color",},{["value"] = "PICK UP FEATHER",["property"] = "displayText",},},},},["shadowYOffset"] = -1,["desc"] = "#feather name name name name\
#feather name name name name\
\
Assign feathers by Note. They'll get a reminder when it's their turn. ",["displayText_format_2.p_format"] = "timed",["font"] = "Expressway MonoNum",["displayText_format_c_time_format"] = 0,["subRegions"] = {{["type"] = "subbackground",},},["displayText_format_2.p_time_format"] = 0,["anchorFrameParent"] = false,["load"] = {["use_never"] = false,["use_ignoreNameRealm"] = true,["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["ignoreNameRealm"] = "Canexxthree",["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["use_difficulty"] = true,["encounterid"] = "2786",["size"] = {["multi"] = {},},},["uid"] = "q91tUwmEKIZ",["parent"] = "8. Texts - Tindral Sageswift, Seer of the Flame",["fontSize"] = 25,["displayText_format_c_time_legacy_floor"] = false,["displayText_format_p_format"] = "timed",["shadowXOffset"] = 1,["displayText_format_p_time_legacy_floor"] = false,["source"] = "import",["selfPoint"] = "CENTER",["regionType"] = "text",["displayText_format_c_time_dynamic_threshold"] = 60,["anchorPoint"] = "CENTER",["fixedWidth"] = 200,["displayText_format_c_format"] = "timed",["displayText_format_p_time_precision"] = 1,["displayText_format_c_time_precision"] = 1,["displayText_format_2.p_time_dynamic_threshold"] = 60,["displayText_format_2.p_time_precision"] = 1,["displayText"] = "FEATHER %2.p",["justify"] = "CENTER",["tocversion"] = 100200,["id"] = "8. [FEATHER NEXT] (note)",["xOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["outline"] = "OUTLINE",["config"] = {},["authorOptions"] = {},["preferToUpdate"] = false,["shadowColor"] = {0,0,0,1,},["displayText_format_c_time_mod_rate"] = true,["information"] = {},["url"] = "https://echoesports.gg",},["8. [PUSHBACK] - Typhoon Cast - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.94117653369904,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "1029585",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "aMmv8p9yF78",["textSize"] = 12,["customTextUpdate"] = "update",["sparkRotationMode"] = "AUTO",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {421636,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_exact_spellId"] = false,["event"] = "Cast",["names"] = {},["use_spellNames"] = true,["spellIds"] = {},["use_unit"] = true,["subeventPrefix"] = "SPELL",["unit"] = "boss",["use_absorbMode"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = false,},["finish"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = false,},["init"] = {},},["internalVersion"] = 70,["config"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["stacksFlags"] = "None",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["timer"] = true,["borderInset"] = 11,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "PUSHBACK",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["icon"] = true,["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["authorOptions"] = {},["color"] = {},["anchorFrameParent"] = false,["textFlags"] = "None",["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["zoom"] = 0,["id"] = "8. [PUSHBACK] - Typhoon Cast - Tindral Sageswift, Seer of the Flame",["customText"] = "function()\
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
",["frameStrata"] = 1,["width"] = 240,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",},["8. [DISPELS] - Fiery Growth Cast - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.87843143939972,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "dhZ41rzYnMK",["displayIcon"] = "429590",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["zoom"] = 0,["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {424581,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["unit"] = "boss",["spellIds"] = {},["event"] = "Cast",["subeventPrefix"] = "SPELL",["use_unit"] = true,["names"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["internalVersion"] = 70,["sparkRotation"] = 0,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["width"] = 240,["customText"] = "function()\
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
",["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "DISPELS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["id"] = "8. [DISPELS] - Fiery Growth Cast - Tindral Sageswift, Seer of the Flame",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["backdropColor"] = {1,1,1,0.5,},["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["customTextUpdate"] = "update",["rotateText"] = "NONE",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["8. Smart Healer Glows"] = {["controlledChildren"] = {"8. FEATHER Preglow",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "8. Smart Healer Glows",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {},["uid"] = "ntTyEi5jsel",["xOffset"] = 0,["authorOptions"] = {},["conditions"] = {},["information"] = {},["borderInset"] = 1,},["8. [TANK] - Searing Wrath Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"422000",},["event"] = "Health",["names"] = {},["spellIds"] = {},["subeventPrefix"] = "SPELL",["type"] = "aura2",["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",["desaturate"] = false,["uid"] = "QgzXM6xyqTd",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [TANK] - Searing Wrath Debuff - Tindral Sageswift, Seer of the Flame",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},["8. [STACKS] - Astral Heat Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"429166",},["fetchTooltip"] = true,["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "player",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "STACKS\\n%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["use_encounterid"] = true,},["source"] = "import",["authorOptions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["selfPoint"] = "CENTER",["stickyDuration"] = false,["uid"] = "rDDIsdNfqsq",["frameStrata"] = 1,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [STACKS] - Astral Heat Debuff - Tindral Sageswift, Seer of the Flame",["zoom"] = 0,["useCooldownModRate"] = true,["width"] = 55,["xOffset"] = 0,["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["color"] = {1,1,1,1,},},["8. [TANK] - Blazing Mushroom Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = 0,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"424578",},["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SHROOM\\nDOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["selfPoint"] = "CENTER",["uid"] = "JxWvikY12q(",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [TANK] - Blazing Mushroom Debuff - Tindral Sageswift, Seer of the Flame",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {["do_sound"] = false,},["finish"] = {},["init"] = {},},["displayIcon"] = 571319,["cooldown"] = true,["authorOptions"] = {},},["8. [DISPEL] - Fiery Growth Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["auranames"] = {"424581",},["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DISPEL",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",["stickyDuration"] = false,["config"] = {},["zoom"] = 0,["anchorFrameParent"] = false,["width"] = 55,["useCooldownModRate"] = true,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [DISPEL] - Fiery Growth Debuff - Tindral Sageswift, Seer of the Flame",["frameStrata"] = 1,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["uid"] = "0vVmmt1EXhg",["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {1,1,1,1,},},["8. Dispel Traffic Light"] = {["controlledChildren"] = {"8. Player Can Dwarf it","8. Dispel Traffic Light - Tindral Sageswift","8. Dispel Glow Assignment - Tindral Sageswift",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "8. Dispel Traffic Light",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["borderInset"] = 1,["config"] = {},["authorOptions"] = {},["selfPoint"] = "CENTER",["conditions"] = {},["information"] = {},["uid"] = "erl79eHoPax",},["8. Fiery Growth - Velo only"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 3,["anchorPoint"] = "CENTER",["echoVersion"] = 6,["cooldownSwipe"] = true,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"424581",},["group_countOperator"] = "==",["event"] = "Health",["unit"] = "group",["subeventPrefix"] = "SPELL",["names"] = {},["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["group_count"] = "2",["type"] = "aura2",["useGroup_count"] = true,["debuffType"] = "HARMFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["debuffType"] = "HARMFUL",["type"] = "aura2",["auranames"] = {"424582",},["useGroup_count"] = true,["group_count"] = "0",["useName"] = true,["unit"] = "group",["group_countOperator"] = "==",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end\
",["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "DISPEL NOW",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "OUTER_BOTTOM",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_fontType"] = "OUTLINE",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Proc",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowDuration"] = 1,["glowXOffset"] = 0,["glow"] = false,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_namerealm"] = true,["namerealm"] = "Veloyap",["use_ignoreNameRealm"] = false,["spec"] = {["multi"] = {},},["use_encounterid"] = true,["encounterid"] = "2786",["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["regionType"] = "icon",["xOffset"] = 275,["cooldown"] = true,["icon"] = true,["color"] = {1,1,1,1,},["zoom"] = 0,["config"] = {},["cooldownTextDisabled"] = false,["frameStrata"] = 1,["tocversion"] = 100200,["id"] = "8. Fiery Growth - Velo only",["width"] = 55,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["uid"] = "wmnpnSNOn7d",["inverse"] = false,["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["selfPoint"] = "CENTER",["conditions"] = {{["check"] = {["trigger"] = 2,["variable"] = "show",["value"] = 1,},["changes"] = {{["value"] = true,["property"] = "sub.3.glow",},{["value"] = true,["property"] = "sub.2.text_visible",},},},},["information"] = {},["desc"] = "Extra reminder for the 3rd Dispeller. Shows when theirs is next, glows once they should go.\
In Echo this was Velos assignment. You should set the Load Condition for your 3rd healer. ",},["8. [DOT] - Lingering Cinder Debuff on raid - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["group_countOperator"] = ">",["fetchTooltip"] = false,["event"] = "Health",["subeventPrefix"] = "SPELL",["auranames"] = {"424582",},["names"] = {},["spellIds"] = {},["useGroup_count"] = true,["group_count"] = "0",["unit"] = "group",["useName"] = true,["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["xOffset"] = 0,["stickyDuration"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [DOT] - Lingering Cinder Debuff on raid - Tindral Sageswift, Seer of the Flame",["frameStrata"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "mBJjppm2RFl",["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["authorOptions"] = {},},["8. [FEATHER NEXT] (note) (display)"] = {["user_y"] = 0,["user_x"] = 0,["xOffset"] = 0,["displayText"] = "FEATHER NEXT",["yOffset"] = 110,["anchorPoint"] = "CENTER",["echoVersion"] = 22,["displayText_format_p_time_format"] = 0,["sameTexture"] = false,["url"] = "https://echoesports.gg",["backgroundColor"] = {1,1,1,0.37999999523163,},["displayText_format_p_time_mod_rate"] = true,["wordWrap"] = "WordWrap",["desc"] = "NOTE:\
#feather name name name name\
#feather name name name name\
\
Gives feather carriers a direction to pick up their orb in the sky. ",["rotation"] = 0,["font"] = "Expressway MonoNum",["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["encounterid"] = "2786",["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["startAngle"] = 0,["shadowXOffset"] = 1,["useAdjustededMin"] = false,["regionType"] = "progresstexture",["blendMode"] = "BLEND",["slantMode"] = "INSIDE",["tocversion"] = 100200,["alpha"] = 1,["uid"] = "ecRRUBRoY1z",["fixedWidth"] = 200,["backgroundOffset"] = 2,["outline"] = "OUTLINE",["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["shadowYOffset"] = -1,["displayText_format_pos_format"] = "none",["desaturateBackground"] = false,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["desaturateForeground"] = false,["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["custom_type"] = "stateupdate",["debuffType"] = "HELPFUL",["event"] = "Health",["names"] = {},["subeventSuffix"] = "_CAST_START",["custom"] = "function(s,e,num,ts,...)\
    if e == \"ENCOUNTER_START\" or e == \"EXRT_NOTE_UPDATE\" then\
        aura_env.TryReadNote()\
        aura_env.count = 1\
        \
    elseif e == \"COMBAT_LOG_EVENT_UNFILTERED\" then\
        local _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID = ...\
        if spellID == 425582 then\
            aura_env.count = aura_env.count + 1\
        end\
        \
    elseif ts and ts[\"\"] and ts[\"\"].show and not s[\"\"] then\
        local count = tonumber(ts[\"\"].count)\
        if count then\
            \
            local stage = WeakAuras.GetBossStage()\
            \
            local count = aura_env.count\
            if count > #aura_env.rotations then\
                count = count % #aura_env.rotations\
            end\
            count = count == 0 and #aura_env.rotations or count\
            \
            local set = aura_env.rotations[count]\
            if set then\
                \
                --elogl(\"feather radar note, count\", count, \"set\", unpack(set))\
                \
                local i = tIndexOf(set, WeakAuras.me)\
                if i then\
                    --elog(\"feather radar\", i)\
                    s[\"\"] = {\
                        show = true,\
                        changed = true,\
                        duration = 8,\
                        autoHide = true,\
                        direction = stage == 1 and aura_env.positionsP1[i] or stage == 2 and aura_env.positionsP2[i] or stage == 3 and aura_env.positionsP3[i],\
                    }\
                    \
                    return true\
                end\
            end\
        end\
        \
    elseif e == \"OPTIONS\" then\
        local stage = math.random(1,3)\
        local i = math.random(1,4)\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            duration = 8,\
            autoHide = true,\
            direction = stage == 1 and aura_env.positionsP1[i] or stage == 2 and aura_env.positionsP2[i] or stage == 3 and aura_env.positionsP3[i],\
        }\
        return true\
    end\
end\
\
\
",["events"] = "ENCOUNTER_START EXRT_NOTE_UPDATE TRIGGER:2 CLEU:SPELL_AURA_APPLIED",["subeventPrefix"] = "SPELL",["check"] = "event",["spellIds"] = {},["unit"] = "player",["customVariables"] = "{expirationTime = true, direction = \"string\"}",},["untrigger"] = {},},[2] = {["trigger"] = {["use_remaining"] = true,["spellId"] = "425582",["remaining_operator"] = "<",["event"] = "Boss Mod Timer",["unit"] = "player",["message"] = "Owl form / flare bomb",["use_spellId"] = true,["use_message"] = false,["type"] = "addons",["remaining"] = "4",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["useName"] = true,["auranames"] = {"425657","422509",},["unit"] = "player",["type"] = "aura2",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] and t[3] end",["activeTriggerMode"] = -10,},["endAngle"] = 360,["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text"] = "%direction",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "CENTER",["text_visible"] = true,["text_text_format_n_format"] = "none",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_direction_format"] = "none",},},["height"] = 100,["useAdjustededMax"] = false,["backgroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_10px.tga",["source"] = "import",["preferToUpdate"] = false,["auraRotation"] = 0,["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "direction",["value"] = "WEST",["op"] = "==",},["changes"] = {{["value"] = 270,["property"] = "auraRotation",},},},{["check"] = {["trigger"] = 1,["variable"] = "direction",["op"] = "==",["value"] = "NORTHWEST",},["changes"] = {{["value"] = 225,["property"] = "auraRotation",},},},{["check"] = {["trigger"] = 1,["variable"] = "direction",["value"] = "NORTH",["op"] = "==",},["changes"] = {{["value"] = 180,["property"] = "auraRotation",},},},{["check"] = {["trigger"] = 1,["variable"] = "direction",["op"] = "==",["value"] = "NORTHEAST",},["changes"] = {{["value"] = 135,["property"] = "auraRotation",},},},{["check"] = {["trigger"] = 1,["variable"] = "direction",["value"] = "EAST",["op"] = "==",},["changes"] = {{["value"] = 90,["property"] = "auraRotation",},},},{["check"] = {["trigger"] = 1,["variable"] = "direction",["op"] = "==",["value"] = "SOUTHEAST",},["changes"] = {{["value"] = 45,["property"] = "auraRotation",},},},{["check"] = {["trigger"] = 1,["variable"] = "direction",["value"] = "SOUTH",["op"] = "==",},["changes"] = {{["value"] = 0,["property"] = "auraRotation",},},},{["check"] = {["trigger"] = 1,["variable"] = "direction",["op"] = "==",["value"] = "SOUTHWEST",},["changes"] = {{["value"] = 315,["property"] = "auraRotation",},},},},["mirror"] = false,["shadowColor"] = {0,0,0,1,},["foregroundTexture"] = "minimap-positionarrowdown",["compress"] = false,["crop_y"] = 0.41,["selfPoint"] = "CENTER",["anchorFrameType"] = "SCREEN",["internalVersion"] = 70,["displayText_format_p_time_precision"] = 1,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.ogg",["do_sound"] = false,},["finish"] = {["stop_sound"] = true,},["init"] = {["do_custom"] = true,["custom"] = "local keyword = \"feather\"\
\
aura_env.degrees = {\
    WEST = 270, \
    NORTHWEST = 225,\
    NORTH = 180,\
    NORTHEAST = 135,\
    EAST = 90,\
    SOUTHEAST = 45,\
    SOUTH = 0,\
    SOUTHWEST = 315,\
}\
\
aura_env.positionsP1 = {\"WEST\", \"SOUTH\", \"EAST\", \"NORTH\"}\
aura_env.positionsP2 = {\"NORTHWEST\", \"SOUTHWEST\", \"SOUTHEAST\", \"NORTHEAST\"}\
aura_env.positionsP3 = {\"NORTHWEST\", \"SOUTHWEST\", \"SOUTHEAST\", \"NORTHEAST\"}\
--aura_env.positions = {\"LEFTFRONT\",\"LEFTBACK\", \"RIGHTFRONT\", \"RIGHTBACK\"}\
\
function aura_env.TryReadNote()\
    aura_env.initialized = false;\
    aura_env.rotations = {}\
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
                    \
                    table.insert(newRotation,guy);\
                end\
            end\
            table.insert(aura_env.rotations,newRotation);\
        end\
    end\
    \
    elogl(\"feather (radar) Note Init:\",#aura_env.rotations)\
    --[[for i, set in ipairs(aura_env.rotations) do\
        for j, name in ipairs(set) do\
            elogl(\"feather radar:\", i,j,name)\
        end\
    end]]\
    \
    aura_env.initialized = true;\
    \
end\
\
\
\
\
",},},["color"] = {1,1,1,1,},["displayText_format_p_time_dynamic_threshold"] = 60,["justify"] = "LEFT",["displayText_format_p_format"] = "timed",["id"] = "8. [FEATHER NEXT] (note) (display)",["foregroundColor"] = {1,1,1,1,},["frameStrata"] = 1,["width"] = 100,["anchorFrameParent"] = false,["config"] = {},["inverse"] = false,["fontSize"] = 25,["orientation"] = "VERTICAL",["crop_x"] = 0.41,["information"] = {},["authorOptions"] = {},},["8. Icons (low) - Tindral Sageswift, Seer of the Flame"] = {["arcLength"] = 360,["controlledChildren"] = {"8. [WIPE] - Poisonous Mushroom Debuff - Tindral Sageswift, Seer of the Flame","8. [BUFF] - Dream Essence Debuff - Tindral Sageswift, Seer of the Flame","8. Fallen Feather Debuff - Tindral Sageswift, Seer of the Flame","8. [MOVE] - Scorching Ground Debuff - Tindral Sageswift, Seer of the Flame","8. [DOT] - Lingering Cinder Debuff on raid - Tindral Sageswift, Seer of the Flame","8. [ROOT] - Mass Entanglement Debuff - Tindral Sageswift, Seer of the Flame","8. [DOT] - Germination DOT - Tindral Sageswift, Seer of the Flame","8. [STACKS] - Astral Heat Debuff - Tindral Sageswift, Seer of the Flame",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Tindral Sageswift, Seer of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["8. [WIPE] - Poisonous Mushroom Debuff - Tindral Sageswift, Seer of the Flame"] = false,["8. [STACKS] - Astral Heat Debuff - Tindral Sageswift, Seer of the Flame"] = false,["8. Fallen Feather Debuff - Tindral Sageswift, Seer of the Flame"] = false,["8. [ROOT] - Mass Entanglement Debuff - Tindral Sageswift, Seer of the Flame"] = false,["8. [DOT] - Lingering Cinder Debuff on raid - Tindral Sageswift, Seer of the Flame"] = false,["8. [MOVE] - Scorching Ground Debuff - Tindral Sageswift, Seer of the Flame"] = false,["8. [DOT] - Germination DOT - Tindral Sageswift, Seer of the Flame"] = false,["8. [BUFF] - Dream Essence Debuff - Tindral Sageswift, Seer of the Flame"] = false,},["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["stagger"] = 0,["rotation"] = 0,["config"] = {},["subRegions"] = {},["internalVersion"] = 70,["gridType"] = "RD",["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["animate"] = false,["backdropColor"] = {1,1,1,0.5,},["borderInset"] = 1,["source"] = "import",["anchorFrameFrame"] = "WeakAuras:Icon - Low Priority - Anchor [AMIR]",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["xOffset"] = 0,["gridWidth"] = 5,["grow"] = "LEFT",["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["selfPoint"] = "RIGHT",["tocversion"] = 100200,["id"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",["regionType"] = "dynamicgroup",["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["anchorPoint"] = "CENTER",["uid"] = "(CbOA7sBSFT",["authorOptions"] = {},["fullCircle"] = true,["rowSpace"] = 1,["conditions"] = {},["information"] = {},["useLimit"] = false,},["8. [SEED] - Seed of Flame Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = false,["auraspellids"] = {"424665",},["fetchTooltip"] = true,["event"] = "Health",["unit"] = "player",["auranames"] = {"424665",},["subeventSuffix"] = "_CAST_START",["spellIds"] = {},["names"] = {},["useExactSpellId"] = true,["type"] = "aura2",["subeventPrefix"] = "SPELL",["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SEED",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 3,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["difficulty"] = {["multi"] = {["heroic"] = true,["lfr"] = true,["normal"] = true,},},["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["encounterid"] = "2786",["use_encounterid"] = true,},["source"] = "import",["xOffset"] = 0,["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["selfPoint"] = "CENTER",["desaturate"] = false,["config"] = {},["useCooldownModRate"] = true,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [SEED] - Seed of Flame Debuff - Tindral Sageswift, Seer of the Flame",["zoom"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",["uid"] = "huSasCgyEnE",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["authorOptions"] = {},},["8. [DON'T SOAK] - Germinating Aura Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["do_sound"] = true,["message_tts_voice"] = 0,["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BananaPeelSlip.ogg",["do_message"] = false,["message_type"] = "TTS",},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["auraspellids"] = {"430583",},["auranames"] = {"424665",},["spellIds"] = {},["unit"] = "player",["useExactSpellId"] = true,["type"] = "aura2",["subeventPrefix"] = "SPELL",["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DON'T\\nSOAK",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 3,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["difficulty"] = {["multi"] = {["heroic"] = true,["lfr"] = true,["normal"] = true,},},["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["encounterid"] = "2786",["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",["stickyDuration"] = false,["uid"] = "ODnni4lKSSD",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [DON'T SOAK] - Germinating Aura Debuff - Tindral Sageswift, Seer of the Flame",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["xOffset"] = 0,["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["authorOptions"] = {},},["8. Dispel Glow Assignment - Tindral Sageswift"] = {["outline"] = "OUTLINE",["displayText_format_initialIndex_format"] = "none",["parent"] = "8. Dispel Traffic Light",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 14,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["glow_frame_type"] = "UNITFRAME",["glow_thickness"] = 2,["glow_action"] = "show",["glow_type"] = "Pixel",["do_glow"] = false,["glow_lines"] = 15,},["finish"] = {["hide_all_glows"] = true,},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["event"] = "Health",["subeventPrefix"] = "SPELL",["names"] = {},["spellIds"] = {},["events"] = "ECHO_TINDRAL_DISPEL_HEALERS ECHO_TINDRAL_DISPEL_DELAY CLEU:SPELL_AURA_REMOVED",["custom_type"] = "stateupdate",["check"] = "event",["custom"] = "function(s,e,...)\
    if e == \"ECHO_TINDRAL_DISPEL_HEALERS\" then\
        local affected = ... \
        if affected then\
            elogl(\"tindral healers:\", unpack(affected))\
            \
            if aura_env.timer then\
                aura_env.timer:Cancel()\
                aura_env.timer = nil\
            end\
            \
            aura_env.affected = affected\
            \
            for i, name in ipairs(aura_env.affected) do\
                local col = i > 1 and \"red\" or \"green\"\
                --elogl(\"healer dispel on\", i, name, col)\
                s[name] = {\
                    show = true,\
                    changed = true,\
                    unit = name,\
                    col = col,\
                    pos = i,\
                    initialIndex = i,\
                }\
            end\
            return true\
        end\
    elseif e == \"COMBAT_LOG_EVENT_UNFILTERED\" then\
        local _, subEvent, _, _, _, _, _, destGUID, destName,_, _, spellID = ...\
        if spellID == 424581 then\
            local changed = false\
            if aura_env.timer then\
                aura_env.timer:Cancel()\
                aura_env.timer = nil\
            end\
            \
            if s[destName] then\
                s[destName].show = false\
                s[destName].changed = true\
                changed = true\
                tDeleteItem(aura_env.affected, destName)\
            end\
            for i, name in ipairs(aura_env.affected) do\
                local col = i > 1 and \"red\" or \"yellow\"\
                --elogl(\"healer dispel on\", i, name, col)\
                s[name] = s[name] or {\
                    show = true,\
                    changed = true,\
                    unit = name,\
                    col = col,\
                    pos = i,\
                    delayed = true,\
                    initialIndex = i,\
                }\
                s[name].col = col\
                s[name].pos = i\
                s[name].delayed = true\
                s[name].changed = true\
            end\
            \
            aura_env.timer = C_Timer.NewTimer(3, function() WeakAuras.ScanEvents(\"ECHO_TINDRAL_DISPEL_DELAY\", true) end)\
            return true\
        end\
    elseif e == \"ECHO_TINDRAL_DISPEL_DELAY\" and ... then\
        for name, state in pairs(s) do\
            state.delayed = false\
            state.changed = true\
            state.col = state.pos == 1 and \"green\" or \"red\"\
            \
            --elogl(\"healer dispel on\", state.pos, name, state.col)\
        end\
        return true\
    end\
end",["unit"] = "player",["customVariables"] = "{\
    position = \"number\",\
    col = \"string\"\
}",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "event",["debuffType"] = "HELPFUL",["use_eventtype"] = true,["eventtype"] = "ENCOUNTER_START",["duration"] = "465",["event"] = "Encounter Events",["unit"] = "player",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["selfPoint"] = "CENTER",["desc"] = "Glow the Dispels for healers. \
Green for Go, Yellow for Soon, Red for WAIT. ",["font"] = "Expressway",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["use_role"] = true,["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["role"] = {["single"] = "HEALER",["multi"] = {["HEALER"] = true,},},["encounterid"] = "2786",["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 40,["source"] = "import",["shadowXOffset"] = 1,["shadowYOffset"] = -1,["regionType"] = "text",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "alwaystrue",},["changes"] = {{["value"] = {["glow_frame_type"] = "UNITFRAME",["glow_action"] = "hide",},["property"] = "glowexternal",},},},{["check"] = {["op"] = "==",["checks"] = {{["trigger"] = 1,["op"] = "==",["variable"] = "position",["value"] = "1",},{["trigger"] = 1,["variable"] = "delay",["value"] = "0",["op"] = ">",},},["trigger"] = 1,["variable"] = "col",["value"] = "yellow",},["changes"] = {{["value"] = {["glow_frame_type"] = "UNITFRAME",["glow_thickness"] = 2,["glow_action"] = "show",["glow_lines"] = 12,["glow_type"] = "Pixel",["use_glow_color"] = true,["glow_color"] = {0.98039221763611,1,0,1,},},["property"] = "glowexternal",},},},{["check"] = {["trigger"] = 1,["variable"] = "col",["value"] = "green",["op"] = "==",},["linked"] = true,["changes"] = {{["value"] = {["glow_frame_type"] = "UNITFRAME",["glow_thickness"] = 2,["glow_action"] = "show",["use_glow_color"] = true,["glow_type"] = "Pixel",["glow_color"] = {0.098039224743843,0.98431378602982,0,1,},["glow_lines"] = 12,},["property"] = "glowexternal",},},},{["check"] = {["trigger"] = 1,["op"] = "==",["variable"] = "col",["value"] = "red",},["linked"] = true,["changes"] = {{["value"] = {["glow_frame_type"] = "UNITFRAME",["glow_thickness"] = 2,["glow_action"] = "show",["use_glow_color"] = true,["glow_type"] = "Pixel",["glow_color"] = {1,0,0,1,},["glow_lines"] = 12,},["property"] = "glowexternal",},},},},["internalVersion"] = 70,["displayText_format_p_time_mod_rate"] = true,["anchorFrameParent"] = false,["displayText_format_p_time_precision"] = 1,["config"] = {},["xOffset"] = 0,["color"] = {1,1,1,1,},["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "8. Dispel Glow Assignment - Tindral Sageswift",["wordWrap"] = "WordWrap",["frameStrata"] = 5,["anchorFrameType"] = "UNITFRAME",["authorOptions"] = {},["uid"] = "NLdSUZWse4M",["displayText_format_p_time_dynamic_threshold"] = 60,["url"] = "https://echoesports.gg",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["displayText"] = "%initialIndex",},["8. Supernova Cast - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 4,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,1,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["class"] = {["multi"] = {},},["use_difficulty"] = true,["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "2175503",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["color"] = {},["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderInset"] = 11,["sparkColor"] = {1,1,1,1,},["customTextUpdate"] = "update",["borderOffset"] = 5,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {424140,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["subeventPrefix"] = "SPELL",["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["auto"] = true,["internalVersion"] = 70,["sparkRotationMode"] = "AUTO",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["stacksFlags"] = "None",["stickyDuration"] = false,["width"] = 240,["sparkRotation"] = 0,["uid"] = "uBSUiq8CUqN",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BIG BOOM!",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = false,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["text_text"] = "",["border_offset"] = 0,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "8. Supernova Cast - Tindral Sageswift, Seer of the Flame",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["timerSize"] = 12,["customText"] = "function()\
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
",["displayTextLeft"] = "%n",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["stacksFont"] = "Friz Quadrata TT",["textFlags"] = "None",["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["zoom"] = 0,["sparkHidden"] = "NEVER",["timer"] = true,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["inverse"] = false,["sparkOffsetX"] = 0,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",},["8. Supernova ABSORB - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = 0,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 8,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {["do_custom"] = true,["custom"] = "aura_env.max = nil",},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.94117653369904,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["encounterid"] = "2786",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "6ir4p61TwTy",["displayIcon"] = 135940,["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["customText"] = "function()\
    if WeakAuras.IsOptionsOpen() then \
        aura_env.region:SetDurationInfo(123123, 321321, true)\
    end\
    if aura_env.states[1].show and aura_env.states[2].show and aura_env.states[1].absorb then\
        if not aura_env.max then\
            aura_env.max = aura_env.states[1].absorb -- 53895040\
        end\
        aura_env.region:SetDurationInfo(aura_env.states[1].absorb, aura_env.max, true)\
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
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["zoom"] = 0,["customTextUpdate"] = "event",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["unit"] = "player",["subeventPrefix"] = "SPELL",["custom"] = "function(s,e,num, ts)\
    if num == 2 and ts and ts[\"\"] and ts[\"\"].show and ts[\"\"].absorb then\
        s[\"\"] = s[\"\"] or {\
            show = true,\
            progressType = \"static\",\
            total = ts[\"\"].absorb,\
        }\
        s[\"\"].value = ts[\"\"].absorb\
        s[\"\"].changed = true\
        return true\
    elseif s[\"\"] then\
        s[\"\"].show = false\
        s[\"\"].changed = true\
        return true\
        \
    end\
end\
\
\
",["events"] = "TRIGGER:2",["custom_type"] = "stateupdate",["check"] = "event",["names"] = {},["spellIds"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["use_showAbsorb"] = true,["auranames"] = {"424180",},["use_absorbMode"] = true,["use_absorb"] = true,["use_unit"] = true,["specificUnit"] = "boss1",["group_count"] = "0",["group_countOperator"] = ">",["absorb"] = {"0",},["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["absorb_operator"] = {">",},["fetchTooltip"] = true,["event"] = "Health",["debuffType"] = "BOTH",["subeventPrefix"] = "SPELL",["useGroup_count"] = true,["spellIds"] = {},["type"] = "unit",["useName"] = true,["use_specific_unit"] = true,["unit"] = "boss1",["names"] = {},},["untrigger"] = {},},[3] = {["trigger"] = {["spellNames"] = {424140,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["unit"] = "boss",["spellIds"] = {},["event"] = "Cast",["subeventPrefix"] = "SPELL",["use_unit"] = true,["names"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["sparkRotationMode"] = "AUTO",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = false,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_text_format_c_format"] = "none",},{["text_text_format_p_time_precision"] = 1,["text_text_format_p_big_number_format"] = "AbbreviateNumbers",["text_shadowColor"] = {0,0,0,1,},["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_format"] = "BigNumber",["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text"] = "%p",["text_shadowXOffset"] = 1,["text_anchorYOffset"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_visible"] = true,["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_text_format_absorb_big_number_format"] = "AbbreviateNumbers",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_format"] = 0,["text_text_format_absorb_format"] = "BigNumber",["text_fontSize"] = 15,["anchorXOffset"] = 0,["anchorYOffset"] = 0,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "8. Supernova ABSORB - Tindral Sageswift, Seer of the Flame",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["8. [ROOT] - Mass Entanglement Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = false,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Health",["subeventPrefix"] = "SPELL",["auraspellids"] = {"424497",},["auranames"] = {"424495",},["spellIds"] = {},["names"] = {},["useExactSpellId"] = true,["type"] = "aura2",["unit"] = "player",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "ROOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["selfPoint"] = "CENTER",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["xOffset"] = 0,["stickyDuration"] = false,["uid"] = "xE1etPFicZn",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [ROOT] - Mass Entanglement Debuff - Tindral Sageswift, Seer of the Flame",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["authorOptions"] = {},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["color"] = {1,1,1,1,},},["8. [BUFF] - Dream Essence Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["auranames"] = {"424258",},["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["color"] = {1,1,1,1,},["stickyDuration"] = false,["config"] = {},["zoom"] = 0,["anchorFrameParent"] = false,["width"] = 55,["useCooldownModRate"] = true,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [BUFF] - Dream Essence Debuff - Tindral Sageswift, Seer of the Flame",["frameStrata"] = 1,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["uid"] = "OqQlF)ERuCI",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",},["8. Fiery Growth - Thaner only"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 3,["anchorPoint"] = "CENTER",["echoVersion"] = 8,["cooldownSwipe"] = true,["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",["event"] = "Health",["names"] = {},["unit"] = "group",["subeventPrefix"] = "SPELL",["spellIds"] = {},["useGroup_count"] = true,["group_count"] = "3",["type"] = "aura2",["auranames"] = {"424581",},["group_countOperator"] = "==",},["untrigger"] = {},},[2] = {["trigger"] = {["debuffType"] = "HARMFUL",["type"] = "aura2",["auranames"] = {"424582",},["useGroup_count"] = true,["group_count"] = "0",["useName"] = true,["unit"] = "group",["group_countOperator"] = "==",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end\
",["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desc"] = "Extra reminder for the 2nd Dispeller. Shows when theirs is next, glows once they should go.\
In Echo this was Thaner's assignment. You should set the Load Condition for your 2nd healer. ",["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "DISPEL NOW",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "OUTER_BOTTOM",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_fontType"] = "OUTLINE",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Proc",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["useGlowColor"] = false,["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_namerealm"] = true,["namerealm"] = "Thanerpala",["talent"] = {["multi"] = {},},["encounterid"] = "2786",["use_encounterid"] = true,["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["use_ignoreNameRealm"] = false,["size"] = {["multi"] = {},},},["source"] = "import",["regionType"] = "icon",["xOffset"] = 275,["information"] = {},["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["color"] = {1,1,1,1,},["zoom"] = 0,["uid"] = "TTUjdRbOWLz",["cooldownTextDisabled"] = false,["useCooldownModRate"] = true,["tocversion"] = 100200,["id"] = "8. Fiery Growth - Thaner only",["anchorFrameType"] = "SCREEN",["alpha"] = 1,["width"] = 55,["frameStrata"] = 1,["config"] = {},["inverse"] = false,["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["desaturate"] = false,["conditions"] = {{["check"] = {["trigger"] = 2,["variable"] = "show",["value"] = 1,},["changes"] = {{["value"] = true,["property"] = "sub.3.glow",},{["value"] = true,["property"] = "sub.2.text_visible",},},},},["cooldown"] = true,["selfPoint"] = "CENTER",},["8. [FLARE BOMBS] - Flare Bomb Cast - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = 0,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.9215686917305,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "TIv8uLe2oen",["displayIcon"] = "2103839",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["zoom"] = 0,["customTextUpdate"] = "update",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {425576,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["subeventPrefix"] = "SPELL",["spellIds"] = {},["use_unit"] = true,["names"] = {},["unit"] = "boss",["event"] = "Cast",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["sparkRotationMode"] = "AUTO",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FEATHERS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "8. [FLARE BOMBS] - Flare Bomb Cast - Tindral Sageswift, Seer of the Flame",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["8. Singles - Tindral Sageswift, Seer of the Flame"] = {["controlledChildren"] = {"8. [SEEDS] - P3 - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame","8. [SEEDS] - P2 - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame","8 Evoker use Verdant Embrace on Fiery Regrowth","8. Fiery Growth - Zaelia only","8. Fiery Growth - Velo only","8. Fiery Growth - Thaner only","8. Simple Glows","8. [FEATHER NEXT] (note) (display)","8. Smart Healer Glows","8. Dispel Traffic Light","Tank Shroom Advice - Tindral","8. [LAND] - Empowering Flame Debuff - Tindral Sageswift, Seer of the Flame","8. [WATCH] - Flame Surge PREdebuff - Tindral Sageswift, Seer of the Flame ",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "8. Tindral Sageswift, Seer of the Flame",["borderInset"] = 1,["config"] = {},["xOffset"] = 0,["uid"] = "8diPbnhoNyR",["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["8. [MOVE] - Scorching Ground Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"424499",},["fetchTooltip"] = false,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "MOVE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["selfPoint"] = "CENTER",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",["desaturate"] = false,["uid"] = "LtfJRnk65ni",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [MOVE] - Scorching Ground Debuff - Tindral Sageswift, Seer of the Flame",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},["8. [ABSORB] - Suppressive Ember Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["unit"] = "player",["spellIds"] = {},["type"] = "aura2",["auranames"] = {"424579",},["names"] = {},["subeventPrefix"] = "SPELL",["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "ABSORB\\n%tooltip1",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_text_format_tooltip1_format"] = "BigNumber",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorPoint"] = "OUTER_BOTTOM",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["use_encounterid"] = true,},["source"] = "import",["selfPoint"] = "CENTER",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["stickyDuration"] = false,["uid"] = "B6AjeCdfoJl",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [ABSORB] - Suppressive Ember Debuff - Tindral Sageswift, Seer of the Flame",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 55,["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["authorOptions"] = {},},["8. [DISPEL NEXT] (note)"] = {["outline"] = "OUTLINE",["color"] = {1,1,1,1,},["displayText"] = "DISPEL #%index",["yOffset"] = 0,["displayText_format_pos_format"] = "none",["echoVersion"] = 15,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.ogg",["do_sound"] = false,},["finish"] = {["stop_sound"] = true,},["init"] = {["do_custom"] = true,["custom"] = "local keyword = \"dispel\"\
\
function aura_env.TryReadNote()\
    aura_env.initialized = false;\
    aura_env.rotations = {}\
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
                    \
                    table.insert(newRotation,guy);\
                end\
            end\
            table.insert(aura_env.rotations,newRotation);\
        end\
    end\
    \
    elogl(\"Dispel Note Init:\",#aura_env.rotations)--, unpack(aura_env.rotations[1]))\
    --[[for i, set in ipairs(aura_env.rotations) do\
        for j, name in ipairs(set) do\
            print(i,j,name)\
        end\
    end]]\
    aura_env.initialized = true;\
    \
end\
\
\
\
\
",},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["custom_type"] = "stateupdate",["debuffType"] = "HELPFUL",["event"] = "Health",["names"] = {},["subeventSuffix"] = "_CAST_START",["custom"] = "function(s,e,num,ts,...)\
    if e == \"ENCOUNTER_START\" or e == \"EXRT_NOTE_UPDATE\" then\
        aura_env.TryReadNote()\
        aura_env.count = 1\
        \
    elseif e == \"COMBAT_LOG_EVENT_UNFILTERED\" then\
        local _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID = ...\
        if spellID == 424581 then\
            aura_env.count = aura_env.count + 1\
        end\
        \
    elseif ts and ts[\"\"] and ts[\"\"].show then\
        \
        --[[local triggers = WeakAuras.GetActiveTriggers(aura_env.id)\
            local stage = triggers[3] and 2 or triggers[4] and 3 or 1\
            count = stage == 3 and count + 4 or stage == 2 and count + 2 or count\
            ]]\
        local count = aura_env.count\
        if count > #aura_env.rotations then\
            count = count % #aura_env.rotations\
        end\
        count = count == 0 and #aura_env.rotations or count\
        \
        local set = aura_env.rotations[count]\
        if set then\
            \
            --if set then elogl(\"dispel note, count\", count, \"set\", unpack(set)) end\
            \
            local i = tIndexOf(set, WeakAuras.me)\
            if i then\
                s[\"\"] = {\
                    show = true,\
                    changed = true,\
                    duration = 4,\
                    expirationTime = GetTime() + 4,\
                    autoHide = true,\
                    progressType = \"timed\",\
                    index = i,\
                }\
                \
                return true\
            end\
        end\
    end\
end\
\
\
",["events"] = "ENCOUNTER_START EXRT_NOTE_UPDATE TRIGGER:2 CLEU:SPELL_CAST_SUCCESS",["subeventPrefix"] = "SPELL",["check"] = "event",["spellIds"] = {},["unit"] = "player",["customVariables"] = "{expirationTime = true, index = \"number\"}",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["spellId"] = "424581",["remaining_operator"] = "<",["event"] = "Boss Mod Timer",["unit"] = "player",["message"] = "Owl form / flare bomb",["remaining"] = "4",["use_message"] = false,["use_remaining"] = true,["use_spellId"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["selfPoint"] = "CENTER",["desc"] = "#fdispel name name name name\
\
Can use if you want to assign different people to dispel different sets. We ended up not using this, just using the same order of healer dispels each time. ",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["class"] = {["multi"] = {},},["use_difficulty"] = true,["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 25,["source"] = "import",["shadowXOffset"] = 1,["preferToUpdate"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["conditions"] = {},["regionType"] = "text",["internalVersion"] = 70,["displayText_format_p_time_mod_rate"] = true,["shadowYOffset"] = -1,["uid"] = "RUEYHFtjGEF",["displayText_format_p_time_precision"] = 1,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["xOffset"] = 0,["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "8. [DISPEL NEXT] (note)",["parent"] = "8. Texts - Tindral Sageswift, Seer of the Flame",["frameStrata"] = 1,["displayText_format_index_format"] = "none",["displayText_format_p_time_dynamic_threshold"] = 60,["config"] = {},["anchorPoint"] = "CENTER",["automaticWidth"] = "Auto",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["wordWrap"] = "WordWrap",},["8. [WIPE] - Poisonous Mushroom Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"426686",},["fetchTooltip"] = true,["event"] = "Health",["subeventPrefix"] = "SPELL",["auraspellids"] = {"426691",},["subeventSuffix"] = "_CAST_START",["spellIds"] = {},["names"] = {},["useExactSpellId"] = true,["useName"] = false,["unit"] = "player",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SHROOM\\nFAIL",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["use_encounterid"] = true,},["source"] = "import",["authorOptions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["selfPoint"] = "CENTER",["desaturate"] = false,["uid"] = "5MQmmHX)rh2",["frameStrata"] = 1,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [WIPE] - Poisonous Mushroom Debuff - Tindral Sageswift, Seer of the Flame",["cooldownTextDisabled"] = false,["alpha"] = 1,["width"] = 55,["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",["config"] = {},["inverse"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["do_sound"] = false,},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},["8. [DON'T SOAK] - Seed of Flame Debuff - Tindral Sageswift, Seer of the Flame - single"] = {["outline"] = "OUTLINE",["iconSource"] = -1,["xOffset"] = 0,["displayText"] = "DON'T SOAK",["selfPoint"] = "CENTER",["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = false,["auranames"] = {"424665",},["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["auraspellids"] = {"430583",},["useExactSpellId"] = true,["spellIds"] = {},["subeventPrefix"] = "SPELL",["subeventSuffix"] = "_CAST_START",["type"] = "aura2",["unit"] = "player",["debuffType"] = "BOTH",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "combatlog",["spellId"] = {423265,},["subeventSuffix"] = "_CAST_SUCCESS",["duration"] = "10",["event"] = "Combat Log",["unit"] = "player",["use_spellId"] = true,["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["displayText_format_p_time_legacy_floor"] = false,["keepAspectRatio"] = false,["wordWrap"] = "WordWrap",["cooldown"] = true,["conditions"] = {},["yOffset"] = 0,["desaturate"] = false,["anchorFrameParent"] = false,["font"] = "Expressway MonoNum",["displayText_format_p_time_dynamic_threshold"] = 60,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["height"] = 55,["config"] = {},["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",["multi"] = {["heroic"] = true,["lfr"] = true,["normal"] = true,},},["encounterid"] = "2786",["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["authorOptions"] = {},["width"] = 55,["fontSize"] = 30,["source"] = "import",["useCooldownModRate"] = true,["shadowXOffset"] = 1,["color"] = {0.87843143939972,0,1,1,},["preferToUpdate"] = false,["stickyDuration"] = false,["regionType"] = "text",["justify"] = "LEFT",["cooldownTextDisabled"] = false,["fixedWidth"] = 200,["frameStrata"] = 1,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\RobotBlip.ogg",["do_sound"] = false,},["init"] = {},["finish"] = {},},["displayText_format_p_time_precision"] = 1,["automaticWidth"] = "Auto",["parent"] = "8. Texts - Tindral Sageswift, Seer of the Flame",["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [DON'T SOAK] - Seed of Flame Debuff - Tindral Sageswift, Seer of the Flame - single",["url"] = "https://echoesports.gg",["alpha"] = 1,["anchorFrameType"] = "SCREEN",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "B(Awv5V0H2I",["inverse"] = false,["internalVersion"] = 70,["shadowColor"] = {0,0,0,1,},["displayIcon"] = "",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["displayText_format_p_format"] = "timed",},["Tank Shroom Advice - Tindral"] = {["sparkWidth"] = 3,["sparkOffsetX"] = 0,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite",["color"] = {1,1,1,1,},["preferToUpdate"] = false,["cooldown"] = true,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["sparkRotation"] = 0,["sparkRotationMode"] = "AUTO",["cooldownEdge"] = false,["backgroundColor"] = {1,0,0,1,},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["customVariables"] = "{\
    col = {\
        type = \"select\",\
        values = {red = \"Red\", green = \"Green\"},\
        display = \"Color\",\
    }, \
    visuals = \"bool\",\
    sounds = \"bool\",\
}",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["events"] = "WA_Start WA_A WA_B CLEU:SPELL_AURA_APPLIED:SPELL_CAST_SUCCESS:SPELL_DAMAGE:SPELL_MISSED",["custom"] = "function(s,e,...)\
    \
    local _, subEvent, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID, spellName = ...\
    \
    if (subEvent == \"SPELL_CAST_SUCCESS\" and spellID == 426669)\
    --or e == \"WA_Start\"\
    then\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            progressType = \"timed\", \
            duration = 12,\
            expirationTime = GetTime() + 12,\
            autoHide = true,\
            col = aura_env.config.start == 1 and \"red\" or \"green\",\
            visuals = aura_env.config.visuals,\
            sounds = aura_env.config.sounds,\
        }\
        return true\
        \
    elseif (subEvent == \"SPELL_AURA_APPLIED\" or subEvent == \"SPELL_DAMAGE\" or subEvent == \"SPELL_MISSED\")\
    and destGUID == WeakAuras.myGUID and s[\"\"]\
    and spellName == GetSpellInfo(424578) -- hit by Blazing\
    --or e == \"WA_A\"\
    then\
        s[\"\"].col = \"green\"\
        s[\"\"].changed = true\
        return true\
        \
    elseif (subEvent == \"SPELL_AURA_APPLIED\" or subEvent == \"SPELL_DAMAGE\" or subEvent == \"SPELL_MISSED\")\
    and destGUID == WeakAuras.myGUID and s[\"\"]\
    and spellName == GetSpellInfo(426686) -- hit by Poisonous\
    -- or e == \"WA_B\"\
    then\
        s[\"\"].col = \"red\"\
        s[\"\"].changed = true\
        return true\
        \
    end\
    \
end",["custom_type"] = "stateupdate",["check"] = "event",["names"] = {},["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["icon_color"] = {1,1,1,1,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["actions"] = {["start"] = {},["init"] = {["do_custom"] = true,["custom"] = "--vdt(aura_env.config)",},["finish"] = {},},["url"] = "https://echoesports.gg",["barColor"] = {1,0,0,0,},["desc"] = "Tells tanks which colour to take. Set your initial colour in Custom Options. ",["zoom"] = 0,["iconSource"] = -1,["sparkOffsetY"] = 0,["subRegions"] = {{["type"] = "subbackground",},{["tick_blend_mode"] = "ADD",["type"] = "subtick",["tick_xOffset"] = 0,["tick_desaturate"] = false,["automatic_length"] = true,["tick_thickness"] = 2,["tick_placement_mode"] = "AtValue",["use_texture"] = false,["tick_color"] = {0,0,0,1,},["tick_yOffset"] = 0,["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["tick_visible"] = true,["tick_placement"] = "3",["tick_length"] = 30,["tick_mirror"] = false,["tick_rotation"] = 0,},{["tick_blend_mode"] = "ADD",["type"] = "subtick",["tick_xOffset"] = 0,["tick_desaturate"] = false,["automatic_length"] = true,["tick_thickness"] = 2,["tick_placement_mode"] = "AtValue",["use_texture"] = false,["tick_color"] = {0,0,0,1,},["tick_yOffset"] = 0,["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["tick_visible"] = true,["tick_placement"] = "6",["tick_length"] = 30,["tick_mirror"] = false,["tick_rotation"] = 0,},{["tick_blend_mode"] = "ADD",["type"] = "subtick",["tick_xOffset"] = 0,["tick_desaturate"] = false,["automatic_length"] = true,["tick_thickness"] = 2,["tick_rotation"] = 0,["use_texture"] = false,["tick_color"] = {0,0,0,1,},["tick_placement"] = "9",["tick_yOffset"] = 0,["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["tick_visible"] = true,["tick_length"] = 30,["tick_mirror"] = false,["tick_placement_mode"] = "AtValue",},{["type"] = "subforeground",},{["type"] = "subborder",["border_anchor"] = "bar",["border_offset"] = 0,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 2,},},["height"] = 30,["uid"] = "5(7pYMNmlXH",["load"] = {["talent"] = {["multi"] = {},},["use_role"] = true,["encounterid"] = "2786",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",["multi"] = {["mythic"] = true,},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["id"] = "Tank Shroom Advice - Tindral",["source"] = "import",["anchorFrameType"] = "SCREEN",["alpha"] = 1,["barColor2"] = {1,1,0,1,},["icon"] = false,["useAdjustededMin"] = false,["regionType"] = "aurabar",["gradientOrientation"] = "HORIZONTAL",["xOffset"] = 0,["icon_side"] = "RIGHT",["selfPoint"] = "CENTER",["useCooldownModRate"] = true,["sparkHeight"] = 30,["texture"] = "Solid",["config"] = {["timer"] = 1,["sounds"] = true,["start"] = 2,["visuals"] = true,},["cooldownTextDisabled"] = false,["spark"] = true,["tocversion"] = 100200,["sparkHidden"] = "NEVER",["desaturate"] = false,["frameStrata"] = 1,["width"] = 100,["authorOptions"] = {{["fontSize"] = "medium",["type"] = "description",["text"] = "\
Can show/hide the bar and enable/Disable the TTS prompts here.\
Set your assigned starter shroom. \
\
",["width"] = 2,},{["type"] = "toggle",["useDesc"] = false,["key"] = "visuals",["name"] = "Show Visuals",["default"] = true,["width"] = 1,},{["type"] = "toggle",["key"] = "sounds",["useDesc"] = false,["default"] = true,["name"] = "Use Sounds",["width"] = 1,},{["type"] = "select",["values"] = {"BLAZING","POISONOUS",},["key"] = "start",["useDesc"] = false,["name"] = "Starter Shroom",["default"] = 1,["width"] = 1,},{["type"] = "space",["variableWidth"] = true,["height"] = 1,["width"] = 1,["useHeight"] = false,},{["type"] = "select",["values"] = {"Full with Ticks","Current Shroom",},["key"] = "timer",["default"] = 1,["name"] = "Timer type",["useDesc"] = false,["width"] = 1,},},["sparkColor"] = {1,1,1,1,},["inverse"] = false,["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "col",["op"] = "==",["value"] = "red",},["changes"] = {{["value"] = {1,0,0,1,},["property"] = "backgroundColor",},},},{["check"] = {["trigger"] = 1,["variable"] = "col",["op"] = "==",["value"] = "green",},["linked"] = true,["changes"] = {{["value"] = {0.05882353335619,1,0,1,},["property"] = "backgroundColor",},},},{["check"] = {["trigger"] = 1,["variable"] = "visuals",["value"] = 0,},["changes"] = {{["property"] = "alpha",},},},{["check"] = {["trigger"] = -2,["variable"] = "AND",["checks"] = {{["trigger"] = 1,["variable"] = "sounds",["value"] = 1,},{["trigger"] = 1,["op"] = "==",["value"] = "red",["variable"] = "col",},},},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\red.mp3",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = -2,["variable"] = "AND",["checks"] = {{["trigger"] = 1,["variable"] = "sounds",["value"] = 1,},{["trigger"] = 1,["op"] = "==",["variable"] = "col",["value"] = "green",},},},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\green.mp3",["sound_channel"] = "Master",},["property"] = "sound",},},["linked"] = true,},},["information"] = {},["enableGradient"] = false,},["8. [MUSHROOMS] - Blazing Mushrooms Cast - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.12156863510609,1,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "z9skmQrffLh",["displayIcon"] = "451162",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["config"] = {},["customTextUpdate"] = "update",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {423264,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["unit"] = "boss",["spellIds"] = {},["event"] = "Cast",["names"] = {},["use_unit"] = true,["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["sparkRotationMode"] = "AUTO",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["auto"] = true,["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["customText"] = "function()\
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
",["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "MUSHROOMS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["zoom"] = 0,["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["authorOptions"] = {},["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["color"] = {},["textFlags"] = "None",["anchorFrameParent"] = false,["stacksFont"] = "Friz Quadrata TT",["icon"] = true,["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["useAdjustededMax"] = false,["id"] = "8. [MUSHROOMS] - Blazing Mushrooms Cast - Tindral Sageswift, Seer of the Flame",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["8. Simple Glows"] = {["controlledChildren"] = {"8. Prot Pally - Glow Heal Absorbs",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 5,["borderColor"] = {0,0,0,1,},["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["unit"] = "player",["names"] = {},["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["internalVersion"] = 70,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "8. Simple Glows",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {},["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["xOffset"] = 0,["uid"] = "OInwn2qI1R9",["conditions"] = {},["information"] = {},["borderInset"] = 1,},["8. [TANK] - Poisonous Mushroom Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["unit"] = "player",["auraspellids"] = {"426686",},["auranames"] = {},["spellIds"] = {},["subeventPrefix"] = "SPELL",["useExactSpellId"] = true,["type"] = "aura2",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SHROOM\\nDOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip2_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",["stickyDuration"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [TANK] - Poisonous Mushroom Debuff - Tindral Sageswift, Seer of the Flame",["frameStrata"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "1Vlegva)Uzm",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {["do_sound"] = false,},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["authorOptions"] = {},},["8. [DOT] - Germination DOT - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["debuffType"] = "BOTH",["useName"] = false,["auraspellids"] = {"423265",},["useExactSpellId"] = true,["names"] = {},["fetchTooltip"] = false,["event"] = "Health",["subeventPrefix"] = "SPELL",["subeventSuffix"] = "_CAST_START",["useGroup_count"] = true,["spellIds"] = {},["unit"] = "boss",["group_count"] = "0",["type"] = "aura2",["auranames"] = {"424495",},["group_countOperator"] = ">",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["color"] = {1,1,1,1,},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["selfPoint"] = "CENTER",["stickyDuration"] = false,["config"] = {},["useCooldownModRate"] = true,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [DOT] - Germination DOT - Tindral Sageswift, Seer of the Flame",["zoom"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "D2gvEzz3hFU",["inverse"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",},["8. Icons (high) - Tindral Sageswift, Seer of the Flame"] = {["arcLength"] = 360,["controlledChildren"] = {"8. [TANK] - Searing Wrath Debuff - Tindral Sageswift, Seer of the Flame","8. [TANK] - Poisonous Mushroom Debuff - Tindral Sageswift, Seer of the Flame","8. [TANK] - Blazing Mushroom Debuff - Tindral Sageswift, Seer of the Flame","8. [DISPEL] - Fiery Growth Debuff - Tindral Sageswift, Seer of the Flame","8. [ABSORB] - Suppressive Ember Debuff - Tindral Sageswift, Seer of the Flame","8. [ROOT] - Mass Entanglement PREDebuff - Tindral Sageswift, Seer of the Flame","8. [DON'T SOAK] - Germinating Aura Debuff - Tindral Sageswift, Seer of the Flame","8. [SEED] - Seed of Flame Debuff - Tindral Sageswift, Seer of the Flame",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Tindral Sageswift, Seer of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["8. [DISPEL] - Fiery Growth Debuff - Tindral Sageswift, Seer of the Flame"] = false,["8. [DON'T SOAK] - Germinating Aura Debuff - Tindral Sageswift, Seer of the Flame"] = false,["8. [SEED] - Seed of Flame Debuff - Tindral Sageswift, Seer of the Flame"] = false,["8. [TANK] - Blazing Mushroom Debuff - Tindral Sageswift, Seer of the Flame"] = false,["8. [ROOT] - Mass Entanglement PREDebuff - Tindral Sageswift, Seer of the Flame"] = false,["8. [TANK] - Poisonous Mushroom Debuff - Tindral Sageswift, Seer of the Flame"] = false,["8. [ABSORB] - Suppressive Ember Debuff - Tindral Sageswift, Seer of the Flame"] = false,["8. [TANK] - Searing Wrath Debuff - Tindral Sageswift, Seer of the Flame"] = false,},["fullCircle"] = true,["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["useLimit"] = false,["align"] = "CENTER",["stagger"] = 0,["borderColor"] = {0,0,0,1,},["selfPoint"] = "RIGHT",["subRegions"] = {},["internalVersion"] = 70,["gridType"] = "RD",["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["xOffset"] = 0,["backdropColor"] = {1,1,1,0.5,},["uid"] = "6HvBS5o37e2",["animate"] = false,["config"] = {},["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Icon - High Priority - Anchor [AMIR]",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["borderEdge"] = "Square Full White",["gridWidth"] = 5,["grow"] = "LEFT",["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["tocversion"] = 100200,["id"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",["regionType"] = "dynamicgroup",["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["authorOptions"] = {},["borderInset"] = 1,["anchorPoint"] = "CENTER",["source"] = "import",["rowSpace"] = 1,["conditions"] = {},["information"] = {},["rotation"] = 0,},["8. Supernova TICKS - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 7,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["encounterid"] = "2786",["use_difficulty"] = true,["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = false,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "2175503",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["borderInset"] = 11,["sparkOffsetX"] = 0,["customTextUpdate"] = "update",["uid"] = "iqHyzgBKOKV",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {424140,},["use_absorbMode"] = true,["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",["type"] = "custom",["use_absorbHealMode"] = true,["custom_type"] = "stateupdate",["use_spellNames"] = true,["names"] = {},["subeventSuffix"] = "_CAST_START",["event"] = "Cast",["spellIds"] = {},["unit"] = "boss",["check"] = "event",["use_unit"] = true,["events"] = "CLEU:SPELL_AURA_APPLIED ECHO_TINDRAL_TICKS",["custom"] = "function(s,e,...)\
    if e == \"ECHO_TINDRAL_TICKS\" and ... then\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            progressType = \"timed\", \
            duration = 2, \
            expirationTime = GetTime() + 2, \
            autoHide = true,\
        }\
        return true\
    else\
        local _, subEvent, _, sourceGUID, _, _, _, destGUID, destName, _, _, spellID = ...\
        if spellID == 424140 and destGUID == UnitGUID(\"boss1\") then\
            if aura_env.timers then\
                for _, timer in pairs(aura_env.timers) do\
                    timer:Cancel()\
                end\
            end\
            aura_env.timers = {}\
            for i = 1, 8 do\
                aura_env.timers[i] = C_Timer.NewTimer(i*2, function() WeakAuras.ScanEvents(\"ECHO_TINDRAL_TICKS\", i) end)\
            end\
            s[\"\"] = {\
                show = true,\
                changed = true,\
                progressType = \"timed\", \
                duration = 2, \
                expirationTime = GetTime() + 2, \
                autoHide = true,\
            }\
            return true\
        end\
    end\
end\
\
\
\
",},["untrigger"] = {},},[2] = {["trigger"] = {["spellNames"] = {"424140",},["use_spellIds"] = false,["use_absorbHealMode"] = true,["auranames"] = {"424140",},["use_absorbMode"] = true,["event"] = "Cast",["unit"] = "boss",["castType"] = "channel",["use_castType"] = true,["use_unit"] = true,["use_spellNames"] = true,["type"] = "unit",["useName"] = true,["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["height"] = 7,["internalVersion"] = 70,["auto"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkColor"] = {1,1,1,1,},["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["adjustedMax"] = "4",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = false,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_anchorYOffset"] = 0,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_shadowYOffset"] = -1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["border_size"] = 1,["border_offset"] = 0,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["icon"] = false,["authorOptions"] = {},["border"] = false,["borderEdge"] = "None",["textFlags"] = "None",["borderSize"] = 16,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["stacksFont"] = "Friz Quadrata TT",["borderInFront"] = false,["sparkHeight"] = 14,["displayTextLeft"] = "%n",["customText"] = "function()\
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
",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["sparkRotationMode"] = "AUTO",["id"] = "8. Supernova TICKS - Tindral Sageswift, Seer of the Flame",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["frameStrata"] = 1,["width"] = 240,["rotateText"] = "NONE",["zoom"] = 0,["inverse"] = false,["borderOffset"] = 5,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["color"] = {},},["8. [STARS] - Falling Star Cast - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.4588235616684,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "236168",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "6JTk7TEhn7l",["textSize"] = 12,["customTextUpdate"] = "update",["sparkRotationMode"] = "AUTO",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {420236,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["unit"] = "boss",["spellIds"] = {},["event"] = "Cast",["names"] = {},["use_unit"] = true,["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["internalVersion"] = 70,["config"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["adjustedMax"] = "4",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["height"] = 23,["borderInset"] = 11,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "STARS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["icon"] = true,["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["authorOptions"] = {},["color"] = {},["anchorFrameParent"] = false,["textFlags"] = "None",["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["zoom"] = 0,["id"] = "8. [STARS] - Falling Star Cast - Tindral Sageswift, Seer of the Flame",["adjustedMin"] = "4",["frameStrata"] = 1,["width"] = 240,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",},["8. [SEEDS] - P3 - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 350,["anchorPoint"] = "CENTER",["echoVersion"] = 8,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "460698",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["borderInset"] = 11,["sparkOffsetX"] = 0,["sparkRotationMode"] = "AUTO",["uid"] = "TNV1srgZPmM",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellId"] = {423265,},["auranames"] = {"423265",},["duration"] = "7",["subeventPrefix"] = "SPELL",["destUnit"] = "boss1",["group_count"] = "0",["debuffType"] = "BOTH",["use_specific_destUnit"] = true,["useName"] = true,["use_absorbHealMode"] = true,["subeventSuffix"] = "_AURA_APPLIED",["use_unit"] = true,["use_absorbMode"] = true,["event"] = "Combat Log",["type"] = "combatlog",["group_countOperator"] = ">",["use_spellId"] = true,["spellIds"] = {},["names"] = {},["useGroup_count"] = true,["use_destUnit"] = true,["unit"] = "boss",["use_exact_spellId"] = false,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["debuffType"] = "HELPFUL",["use_stage"] = true,["stage"] = "3",["stage_operator"] = "==",["event"] = "Boss Mod Stage",["unit"] = "player",},["untrigger"] = {},},[3] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "",["event"] = "Combat Log",["unit"] = "player",["events"] = "CLEU:SPELL_CAST_SUCCESS:SPELL_AURA_APPLIED",["custom"] = "function(s,e,...)\
    local _, subEvent, _, sourceGUID, _, _, _, destGUID, destName, _, _, spellID = ...\
    if subEvent == \"SPELL_CAST_SUCCESS\" and spellID == 423265 then\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            count = 16,\
        }\
        return true\
    elseif subEvent == \"SPELL_AURA_APPLIED\" and spellID == 430583 and s[\"\"] then\
        s[\"\"].count = s[\"\"].count - 1\
        s[\"\"].changed = true\
        return true\
    end\
end",["check"] = "event",["subeventPrefix"] = "",["custom_type"] = "stateupdate",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] and t[2] end",["activeTriggerMode"] = -10,},["height"] = 35,["internalVersion"] = 70,["borderOffset"] = 5,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkColor"] = {1,1,1,1,},["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["adjustedMax"] = "4",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SOAK SEEDS %3.count",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_3.count_format"] = "none",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_shadowYOffset"] = -1,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_anchorYOffset"] = 0,["text_fontSize"] = 20,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["border_offset"] = 0,["border_size"] = 1,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["displayTextRight"] = "%p",["icon"] = true,["authorOptions"] = {},["border"] = false,["borderEdge"] = "None",["textFlags"] = "None",["borderSize"] = 16,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["stacksFont"] = "Friz Quadrata TT",["borderInFront"] = false,["sparkHeight"] = 14,["displayTextLeft"] = "%n",["customText"] = "function()\
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
",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["rotateText"] = "NONE",["id"] = "8. [SEEDS] - P3 - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame",["customTextUpdate"] = "update",["frameStrata"] = 1,["width"] = 350,["backgroundColor"] = {0,0,0,0.33132427930832,},["zoom"] = 0,["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["color"] = {},},["8. [ROOT INC] - Mass Entanglement Cast - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.68627452850342,0.5137255191803,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "5351059",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",["zoom"] = 0,["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {424495,},["type"] = "aura2",["use_absorbHealMode"] = true,["useExactSpellId"] = true,["use_absorbMode"] = true,["use_spellNames"] = true,["use_unit"] = true,["auraspellids"] = {"424495",},["names"] = {},["spellIds"] = {},["unit"] = "player",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["event"] = "Cast",["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["internalVersion"] = 70,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "ROOT INC",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["id"] = "8. [ROOT INC] - Mass Entanglement Cast - Tindral Sageswift, Seer of the Flame",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["rotateText"] = "NONE",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "hrP1rWysxoZ",},["8. Incarnation: Tree of Flame - absorb ticks"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.61960786581039,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["role"] = {["single"] = "HEALER",["multi"] = {["HEALER"] = true,["TANK"] = true,},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["use_role"] = true,["spec"] = {["multi"] = {},},["encounterid"] = "2786",["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["auto"] = true,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "u6zvXQP2IyI",["displayIcon"] = "236220",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["color"] = {},["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["borderInset"] = 11,["sparkColor"] = {1,1,1,1,},["customTextUpdate"] = "update",["config"] = {},["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["spellId"] = {"422115",},["auranames"] = {"426018",},["duration"] = "18",["unit"] = "group",["subeventPrefix"] = "SPELL",["names"] = {},["use_unit"] = true,["debuffType"] = "BOTH",["useExactSpellId"] = true,["type"] = "combatlog",["use_absorbHealMode"] = true,["auraspellids"] = {"424582",},["use_absorbMode"] = true,["useName"] = false,["event"] = "Combat Log",["use_percentpower"] = true,["subeventSuffix"] = "_AURA_APPLIED",["use_spellId"] = true,["spellIds"] = {},["use_sourceUnit"] = false,["use_specific_unit"] = true,["use_destUnit"] = false,["percentpower"] = "90",["percentpower_operator"] = ">",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "aura2",["specificUnit"] = "boss1",["debuffType"] = "BOTH",["useName"] = true,["auranames"] = {"422115",},["unit"] = "member",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["stacksFont"] = "Friz Quadrata TT",["internalVersion"] = 70,["backgroundColor"] = {0,0,0,0.33132427930832,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["stickyDuration"] = false,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = false,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},{["tick_blend_mode"] = "ADD",["type"] = "subtick",["tick_xOffset"] = 0,["tick_desaturate"] = false,["automatic_length"] = true,["tick_thickness"] = 2,["tick_color"] = {1,1,1,1,},["use_texture"] = false,["tick_placement_mode"] = "AtMissingValue",["tick_visible"] = true,["tick_placement"] = "6",["tick_yOffset"] = 0,["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["tick_length"] = 30,["tick_mirror"] = false,["tick_rotation"] = 0,},{["tick_blend_mode"] = "ADD",["type"] = "subtick",["tick_xOffset"] = 0,["tick_desaturate"] = false,["automatic_length"] = true,["tick_thickness"] = 2,["tick_color"] = {1,1,1,1,},["use_texture"] = false,["tick_placement_mode"] = "AtMissingValue",["tick_visible"] = true,["tick_placement"] = "12",["tick_yOffset"] = 0,["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["tick_length"] = 30,["tick_mirror"] = false,["tick_rotation"] = 0,},{["tick_blend_mode"] = "ADD",["type"] = "subtick",["tick_xOffset"] = 0,["tick_desaturate"] = false,["automatic_length"] = true,["tick_thickness"] = 2,["tick_color"] = {1,1,1,1,},["use_texture"] = false,["tick_placement_mode"] = "AtMissingValue",["tick_visible"] = true,["tick_placement"] = "18",["tick_yOffset"] = 0,["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["tick_length"] = 30,["tick_mirror"] = false,["tick_rotation"] = 0,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["adjustedMin"] = "4",["source"] = "import",["displayTextRight"] = "%p",["textFlags"] = "None",["rotateText"] = "NONE",["border"] = false,["borderEdge"] = "None",["borderBackdrop"] = "Blizzard Tooltip",["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["borderSize"] = 16,["xOffset"] = 0,["anchorFrameParent"] = false,["zoom"] = 0,["borderOffset"] = 5,["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["useAdjustededMax"] = false,["id"] = "8. Incarnation: Tree of Flame - absorb ticks",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotationMode"] = "AUTO",["textSize"] = 12,["inverse"] = false,["spark"] = false,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",},["8. [FIRE BEAM] - Fire Beam Cast - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.61960786581039,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "AXU6f7DYxtk",["displayIcon"] = "236216",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["config"] = {},["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {421398,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["unit"] = "boss",["spellIds"] = {},["event"] = "Cast",["names"] = {},["use_unit"] = true,["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["customTextUpdate"] = "update",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["auto"] = true,["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["adjustedMin"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FIRE BEAM",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["zoom"] = 0,["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["authorOptions"] = {},["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["color"] = {},["textFlags"] = "None",["anchorFrameParent"] = false,["stacksFont"] = "Friz Quadrata TT",["icon"] = true,["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["backdropColor"] = {1,1,1,0.5,},["id"] = "8. [FIRE BEAM] - Fire Beam Cast - Tindral Sageswift, Seer of the Flame",["stacksFlags"] = "None",["frameStrata"] = 1,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["inverse"] = false,["borderOffset"] = 5,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["8. Dispel Traffic Light - Tindral Sageswift"] = {["user_y"] = 0,["user_x"] = 0,["parent"] = "8. Dispel Traffic Light",["preferToUpdate"] = false,["customText"] = "function()\
    if aura_env.state and aura_env.state.show and aura_env.state.initialIndex then\
        if not aura_env.last or aura_env.last < GetTime() - 1.5 then\
            aura_env.last = GetTime()\
            SendChatMessage(aura_env.state.initialIndex)\
        end\
    end\
end\
\
\
",["yOffset"] = 0,["anchorPoint"] = "CENTER",["desaturateBackground"] = false,["sameTexture"] = false,["url"] = "https://echoesports.gg",["backgroundColor"] = {0.95686280727386,1,0.28627452254295,0.62999999523163,},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["customVariables"] = "{position = \"number\",expirationTime = true, initialIndex = \"number\"}",["event"] = "Health",["names"] = {},["custom"] = "function(s,e,...)\
    local _, subEvent, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID = ...\
    \
    if subEvent == \"SPELL_AURA_APPLIED\" and spellID == 424581 then\
        if not aura_env.last or GetTime() - aura_env.last > 10 then\
            aura_env.affected = {}\
            aura_env.last = GetTime()\
        end\
        table.insert(aura_env.affected, destName)\
        \
        if #aura_env.affected == 4 then -- !!!!\
            table.sort(aura_env.affected)\
            elogl(\"tindrel dispel people\", unpack(aura_env.affected))\
            \
            aura_env.mark(aura_env.affected)\
            WeakAuras.ScanEvents(\"ECHO_TINDRAL_DISPEL_HEALERS\", CopyTable(aura_env.affected))\
            WeakAuras.ScanEvents(\"ECHO_TINDRAL_DISPEL_SCRIPE\", CopyTable(aura_env.affected))\
            \
            local i = tIndexOf(aura_env.affected, WeakAuras.me)\
            \
            if i then\
                --elog(\"tindrel dispel - me\", i)\
                s[\"\"] = {\
                    show = true,\
                    changed = true,\
                    position = i - 1,\
                    direction = i == 1 and \"LEFT\" or i == 2 and \"MIDLEFT\" or i == 3 and \"MIDRIGHT\" or i == 4 and \"RIGHT\",\
                    initialIndex = i,\
                }\
                return true\
            end\
        end\
        \
    elseif subEvent == \"SPELL_AURA_REMOVED\" and spellID == 424581 and aura_env.affected then\
        tDeleteItem(aura_env.affected, destName)\
        WeakAuras.ScanEvents(\"ECHO_TINDRAL_DISPEL_SCRIPE\", CopyTable(aura_env.affected))\
        aura_env.removeMark(destName)\
        \
        local i = tIndexOf(aura_env.affected, WeakAuras.me)\
        \
        if s[\"\"] then\
            if not i then\
                s[\"\"].show = false\
                s[\"\"].changed = true\
                return true\
            end\
            local dur = 3\
            --elog(\"tindrel dispel - updating\", i)\
            s[\"\"].progressType = \"timed\"\
            s[\"\"].duration = dur\
            s[\"\"].expirationTime = GetTime() + dur\
            s[\"\"].changed = true\
            s[\"\"].position = i - 1\
            return true\
        end\
        \
    elseif e == \"OPTIONS\" then\
        local i = math.random(1,4)\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            position = i-1,\
            direction = i == 1 and \"LEFT\" or i == 2 and \"MIDLEFT\" or i == 3 and \"MIDRIGHT\" or i == 4 and \"RIGHT\",\
            initialIndex = i,\
        }\
        return true\
        \
    end\
end",["events"] = "CLEU:SPELL_AURA_APPLIED:SPELL_AURA_REMOVED",["spellIds"] = {},["custom_type"] = "stateupdate",["check"] = "event",["subeventPrefix"] = "SPELL",["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "event",["unit"] = "player",["use_eventtype"] = true,["debuffType"] = "HELPFUL",["duration"] = "465",["event"] = "Encounter Events",["eventtype"] = "ENCOUNTER_START",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 70,["selfPoint"] = "CENTER",["actions"] = {["start"] = {},["init"] = {["do_custom"] = true,["custom"] = "local marks = {8, 7, 2, 3}\
function aura_env.mark(people)\
    if UnitIsGroupLeader(\"player\") then\
        for i, name in ipairs(people) do\
            SetRaidTarget(name, marks[i])\
        end\
    end\
end\
function aura_env.removeMark(name)\
    if UnitIsGroupLeader(\"player\") then\
        SetRaidTarget(name, 0)\
    end\
end",},["finish"] = {},},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desc"] = "Traffic light display for assigned Dispel Order.",["rotation"] = 0,["font"] = "Friz Quadrata TT",["crop_x"] = 0.41,["subRegions"] = {{["type"] = "subbackground",},{["text_text_format_n_format"] = "none",["text_text"] = "",["text_text_format_p_format"] = "timed",["text_selfPoint"] = "CENTER",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_position_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_text_format_initialIndex_format"] = "none",["type"] = "subtext",["text_text_format_p_time_precision"] = 1,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_time_format"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "CENTER",["text_text_format_p_time_legacy_floor"] = false,["text_shadowXOffset"] = 1,["text_fontSize"] = 16,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%direction",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "TOP",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "BOTTOM",["text_visible"] = false,["text_text_format_n_format"] = "none",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_direction_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text"] = "%initialIndex%c",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_initialIndex_format"] = "none",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "BOTTOM",["text_visible"] = true,["text_text_format_n_format"] = "none",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_c_format"] = "none",},},["height"] = 50,["desaturateForeground"] = false,["crop_y"] = 0.41,["echoVersion"] = 12,["useAdjustededMax"] = false,["fontSize"] = 12,["source"] = "import",["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",["startAngle"] = 0,["uid"] = "gRBUE6te8aI",["mirror"] = false,["useAdjustededMin"] = false,["regionType"] = "progresstexture",["xOffset"] = 0,["blendMode"] = "BLEND",["width"] = 50,["alpha"] = 1,["slantMode"] = "INSIDE",["backgroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Circle_White",["auraRotation"] = 0,["compress"] = false,["foregroundColor"] = {0.16078431904316,1,0,1,},["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["tocversion"] = 100200,["id"] = "8. Dispel Traffic Light - Tindral Sageswift",["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["frameStrata"] = 6,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["config"] = {},["inverse"] = true,["customTextUpdate"] = "update",["orientation"] = "CLOCKWISE",["conditions"] = {{["check"] = {["trigger"] = -2,["variable"] = "AND",["op"] = "==",["checks"] = {{["trigger"] = 1,["variable"] = "position",["op"] = "==",["value"] = "0",},{["trigger"] = 1,["variable"] = "expirationTime",["op"] = ">",["value"] = "0",},},},["changes"] = {{["value"] = {1,0.90196084976196,0,0.55000001192093,},["property"] = "backgroundColor",},{["value"] = "MOVE\\n%p",["property"] = "sub.2.text_text",},},},{["check"] = {["trigger"] = 1,["variable"] = "position",["op"] = "==",["value"] = "0",},["linked"] = true,["changes"] = {{["value"] = {0.098039224743843,1,0,0.70000001788139,},["property"] = "backgroundColor",},{["value"] = "GO",["property"] = "sub.2.text_text",},},},{["check"] = {["trigger"] = 1,["op"] = "==",["variable"] = "position",["value"] = "1",},["changes"] = {{["value"] = {1,0.90196084976196,0,0.55000001192093,},["property"] = "backgroundColor",},{["value"] = {1,1,1,0,},["property"] = "foregroundColor",},{["value"] = "READY",["property"] = "sub.2.text_text",},},},{["check"] = {["trigger"] = 1,["op"] = "==",["value"] = "2",["variable"] = "position",},["changes"] = {{["value"] = {1,0,0,0.52000001072884,},["property"] = "backgroundColor",},{["value"] = {1,1,1,0,},["property"] = "foregroundColor",},{["value"] = "WAIT",["property"] = "sub.2.text_text",},},},{["check"] = {["trigger"] = 1,["op"] = "==",["variable"] = "position",["value"] = "3",},["changes"] = {{["value"] = {0.57254904508591,0,0,0.59000000357628,},["property"] = "backgroundColor",},{["value"] = {1,1,1,0,},["property"] = "foregroundColor",},{["value"] = "LAST",["property"] = "sub.2.text_text",},},},{["check"] = {["trigger"] = 1,["variable"] = "initialIndex",["op"] = "==",["value"] = "20",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "initialIndex",["value"] = "1",["op"] = "==",},["changes"] = {{["value"] = -50,["property"] = "sub.3.text_anchorXOffset",},},},{["check"] = {["trigger"] = 1,["variable"] = "initialIndex",["op"] = "==",["value"] = "2",},["changes"] = {{["value"] = -25,["property"] = "sub.3.text_anchorXOffset",},{["value"] = -10,["property"] = "sub.3.text_anchorYOffset",},},},{["check"] = {["trigger"] = 1,["variable"] = "initialIndex",["value"] = "3",["op"] = "==",},["changes"] = {{["value"] = 25,["property"] = "sub.3.text_anchorXOffset",},{["value"] = -10,["property"] = "sub.3.text_anchorYOffset",},},},{["check"] = {["trigger"] = 1,["variable"] = "initialIndex",["op"] = "==",["value"] = "4",},["changes"] = {{["value"] = 50,["property"] = "sub.3.text_anchorXOffset",},},},},["information"] = {},["backgroundOffset"] = 0,},["8. Fallen Feather Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Glass.mp3",["do_sound"] = true,},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["type"] = "aura2",["auranames"] = {"425657","422509",},["unit"] = "player",["names"] = {},["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["selfPoint"] = "CENTER",["uid"] = "2ScCwuuDpaP",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "8. Fallen Feather Debuff - Tindral Sageswift, Seer of the Flame",["alpha"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},["8. Tindral Sageswift, Seer of the Flame"] = {["controlledChildren"] = {"8. Icons (high) - Tindral Sageswift, Seer of the Flame","8. Icons (low) - Tindral Sageswift, Seer of the Flame","8. Bars - Tindral Sageswift, Seer of the Flame","8. Texts - Tindral Sageswift, Seer of the Flame","8. Singles - Tindral Sageswift, Seer of the Flame",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = " Echo - Amirdrassil",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "8. Tindral Sageswift, Seer of the Flame",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["config"] = {},["uid"] = "4hZ2tSMeOmy",["xOffset"] = 0,["borderInset"] = 1,["groupIcon"] = "5342923",["conditions"] = {},["information"] = {},["selfPoint"] = "CENTER",},["8. [MUSHROOMS] - Poisonous Mushrooms Cast - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.12156863510609,1,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "8NmkiwBMWEn",["displayIcon"] = "451162",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["zoom"] = 0,["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {426687,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["subeventPrefix"] = "SPELL",["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "MUSHROOMS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "8. [MUSHROOMS] - Poisonous Mushrooms Cast - Tindral Sageswift, Seer of the Flame",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["backdropColor"] = {1,1,1,0.5,},["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["rotateText"] = "NONE",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["8. [DMG + SEEDS] - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "pdRDiNO04Oa",["displayIcon"] = "460698",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["zoom"] = 0,["customTextUpdate"] = "update",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {423265,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_exact_spellId"] = false,["event"] = "Cast",["subeventPrefix"] = "SPELL",["use_spellNames"] = true,["spellIds"] = {},["use_unit"] = true,["names"] = {},["unit"] = "boss",["use_absorbMode"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["sparkRotationMode"] = "AUTO",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "DMG + SEEDS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "8. [DMG + SEEDS] - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["8. [FIRE BEAM] - Fire Beam Time to Beams - Tindral Sageswift, Seer of the Flame"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 5,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.61960786581039,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2786",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "XIVBIMwFtog",["displayIcon"] = "236216",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",["borderOffset"] = 5,["customTextUpdate"] = "update",["zoom"] = 0,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {421398,},["type"] = "combatlog",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["unit"] = "boss",["duration"] = "4",["event"] = "Combat Log",["names"] = {},["subeventPrefix"] = "SPELL",["use_spellId"] = true,["spellIds"] = {},["use_spellNames"] = true,["use_absorbMode"] = true,["use_unit"] = true,["spellId"] = {421398,},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["config"] = {},["internalVersion"] = 70,["sparkRotationMode"] = "AUTO",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderColor"] = {1,1,1,0.5,},["stickyDuration"] = false,["width"] = 240,["backdropColor"] = {1,1,1,0.5,},["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FIRE BEAM",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_anchorYOffset"] = 0,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_shadowYOffset"] = -1,["text_fontSize"] = 15,["anchorXOffset"] = 0,["anchorYOffset"] = 0,},{["border_anchor"] = "bar",["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "8. [FIRE BEAM] - Fire Beam Time to Beams - Tindral Sageswift, Seer of the Flame",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["borderInset"] = 11,["source"] = "import",["timerSize"] = 12,["auto"] = true,["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["textFlags"] = "None",["borderInFront"] = false,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["color"] = {},["borderSize"] = 16,["sparkHeight"] = 14,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["adjustedMin"] = "4",["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.33132427930832,},["inverse"] = false,["displayTextLeft"] = "%n",["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["8. Prot Pally - Glow Heal Absorbs"] = {["outline"] = "OUTLINE",["authorOptions"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["glow_lines"] = 14,["glow_YOffset"] = 1,["glow_action"] = "show",["glow_thickness"] = 2,["do_glow"] = true,["glow_XOffset"] = 1,["glow_length"] = 20,["glow_type"] = "Proc",["use_glow_color"] = true,["glow_color"] = {0.019607843831182,1,0,1,},["glow_frame_type"] = "UNITFRAME",},["init"] = {},["finish"] = {["hide_all_glows"] = true,},},["triggers"] = {[1] = {["trigger"] = {["showClones"] = true,["type"] = "aura2",["auranames"] = {"424579",},["combinePerUnit"] = true,["event"] = "Health",["unit"] = "group",["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["wordWrap"] = "WordWrap",["font"] = "Friz Quadrata TT",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_encounterid"] = true,["use_class_and_spec"] = true,["class_and_spec"] = {["single"] = 66,},["talent"] = {["multi"] = {},},["encounterid"] = "2786",["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 12,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["preferToUpdate"] = false,["selfPoint"] = "BOTTOM",["fixedWidth"] = 200,["displayText_format_p_time_legacy_floor"] = false,["displayText_format_p_time_precision"] = 1,["displayText_format_p_time_mod_rate"] = true,["parent"] = "8. Simple Glows",["uid"] = "DhYbz74r9qD",["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "8. Prot Pally - Glow Heal Absorbs",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["config"] = {},["xOffset"] = 0,["displayText"] = "",["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["8. [LAND] - Empowering Flame Debuff - Tindral Sageswift, Seer of the Flame"] = {["iconSource"] = 0,["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Glass.mp3",["do_sound"] = true,},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"425610",},["fetchTooltip"] = false,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "LAND",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {0.258823543787,1,0,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 100,["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2786",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["xOffset"] = 170,["stickyDuration"] = false,["uid"] = "MigkxDZCCyX",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "8. [LAND] - Empowering Flame Debuff - Tindral Sageswift, Seer of the Flame",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 100,["authorOptions"] = {},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "1029584",["cooldown"] = true,["color"] = {1,1,1,1,},},["8. Bars - Tindral Sageswift, Seer of the Flame"] = {["grow"] = "DOWN",["controlledChildren"] = {"8. [MUSHROOMS] - Blazing Mushrooms Cast - Tindral Sageswift, Seer of the Flame","8. [MUSHROOMS] - Poisonous Mushrooms Cast - Tindral Sageswift, Seer of the Flame","8. [DISPELS] - Fiery Growth Cast - Tindral Sageswift, Seer of the Flame","8. [STARS] - Falling Star Cast - Tindral Sageswift, Seer of the Flame","8. [ROOT INC] - Mass Entanglement Cast - Tindral Sageswift, Seer of the Flame","8. [FIRE BEAM] - Fire Beam Cast - Tindral Sageswift, Seer of the Flame","8. [FIRE BEAM] - Fire Beam Time to Beams - Tindral Sageswift, Seer of the Flame","8. [PUSHBACK] - Typhoon Cast - Tindral Sageswift, Seer of the Flame","8. [FLARE BOMBS] - Flare Bomb Cast - Tindral Sageswift, Seer of the Flame","8. Supernova ABSORB - Tindral Sageswift, Seer of the Flame","8. Supernova Cast - Tindral Sageswift, Seer of the Flame","8. Supernova TICKS - Tindral Sageswift, Seer of the Flame","8. [DMG + SEEDS] - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame","8. Incarnation: Tree of Flame - absorb ticks",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["gridType"] = "RD",["echoVersion"] = 1,["fullCircle"] = true,["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["rotation"] = 0,["useLimit"] = false,["selfPoint"] = "TOP",["subRegions"] = {},["borderInset"] = 1,["rowSpace"] = 1,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["sortHybridTable"] = {["8. [DMG + SEEDS] - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame"] = false,["8. Supernova Cast - Tindral Sageswift, Seer of the Flame"] = false,["8. Incarnation: Tree of Flame - absorb ticks"] = false,["8. Supernova ABSORB - Tindral Sageswift, Seer of the Flame"] = false,["8. [STARS] - Falling Star Cast - Tindral Sageswift, Seer of the Flame"] = false,["8. [ROOT INC] - Mass Entanglement Cast - Tindral Sageswift, Seer of the Flame"] = false,["8. Supernova TICKS - Tindral Sageswift, Seer of the Flame"] = false,["8. [MUSHROOMS] - Poisonous Mushrooms Cast - Tindral Sageswift, Seer of the Flame"] = false,["8. [FLARE BOMBS] - Flare Bomb Cast - Tindral Sageswift, Seer of the Flame"] = false,["8. [FIRE BEAM] - Fire Beam Time to Beams - Tindral Sageswift, Seer of the Flame"] = false,["8. [FIRE BEAM] - Fire Beam Cast - Tindral Sageswift, Seer of the Flame"] = false,["8. [MUSHROOMS] - Blazing Mushrooms Cast - Tindral Sageswift, Seer of the Flame"] = false,["8. [PUSHBACK] - Typhoon Cast - Tindral Sageswift, Seer of the Flame"] = false,["8. [DISPELS] - Fiery Growth Cast - Tindral Sageswift, Seer of the Flame"] = false,},["backdropColor"] = {1,1,1,0.5,},["config"] = {},["source"] = "import",["parent"] = "8. Tindral Sageswift, Seer of the Flame",["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Bars - Anchor [AMIR]",["stepAngle"] = 15,["borderSize"] = 2,["limit"] = 5,["borderEdge"] = "Square Full White",["gridWidth"] = 5,["arcLength"] = 360,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["sort"] = "none",["borderOffset"] = 4,["animate"] = false,["tocversion"] = 100200,["id"] = "8. Bars - Tindral Sageswift, Seer of the Flame",["regionType"] = "dynamicgroup",["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["xOffset"] = 0,["uid"] = "xyjOShsaKkD",["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["internalVersion"] = 70,["conditions"] = {},["information"] = {},["stagger"] = 0,},["8 Evoker use Verdant Embrace on Fiery Regrowth"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "spell",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["use_genericShowOn"] = true,["genericShowOn"] = "showOnReady",["names"] = {},["realSpellName"] = "Verdant Embrace",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["subeventPrefix"] = "SPELL",["use_track"] = true,["spellName"] = 360995,},["untrigger"] = {},},[2] = {["trigger"] = {["useName"] = true,["auranames"] = {"424581",},["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["type"] = "unit",["use_absorbHealMode"] = true,["percenthealth"] = {"85",},["event"] = "Health",["unit"] = "player",["use_absorbMode"] = true,["use_unit"] = true,["use_percenthealth"] = true,["percenthealth_operator"] = {"<",},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "SELF HEAL",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "OUTER_BOTTOM",["text_fontSize"] = 16,["anchorXOffset"] = 0,["text_fontType"] = "OUTLINE",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Proc",["glowLength"] = 10,["glowYOffset"] = 3,["glowColor"] = {1,1,1,1,},["useGlowColor"] = false,["glowXOffset"] = 3,["glowThickness"] = 1,["glowScale"] = 1,["glow"] = true,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["class"] = {["multi"] = {},},["class_and_spec"] = {["multi"] = {[1467] = true,[1468] = true,[1473] = true,},},["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_class_and_spec"] = false,["encounterid"] = "2786",["use_encounterid"] = true,},["source"] = "import",["regionType"] = "icon",["authorOptions"] = {},["information"] = {},["icon"] = true,["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",["useCooldownModRate"] = true,["zoom"] = 0,["uid"] = "Hw6oPuL7aJ6",["tocversion"] = 100200,["id"] = "8 Evoker use Verdant Embrace on Fiery Regrowth",["frameStrata"] = 1,["alpha"] = 1,["width"] = 55,["anchorFrameType"] = "SCREEN",["config"] = {},["inverse"] = false,["xOffset"] = 150,["cooldownTextDisabled"] = false,["conditions"] = {},["cooldown"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},});


-- 8. manifest data

journal:AddManifestData({
	{
		["echoVersion"] = 3,
		["parent"] = " Echo - Amirdrassil",
		["id"] = "8. Tindral Sageswift, Seer of the Flame",
		["children"] = {
			"8. Singles - Tindral Sageswift, Seer of the Flame",
			"8. Texts - Tindral Sageswift, Seer of the Flame",
			"8. Bars - Tindral Sageswift, Seer of the Flame",
			"8. Icons (low) - Tindral Sageswift, Seer of the Flame",
			"8. Icons (high) - Tindral Sageswift, Seer of the Flame",
		},
		["uid"] = "4hZ2tSMeOmy",
	},
	{
		["echoVersion"] = 3,
		["parent"] = "8. Tindral Sageswift, Seer of the Flame",
		["id"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["children"] = {
			"8. [WATCH] - Flame Surge PREdebuff - Tindral Sageswift, Seer of the Flame ",
			"8. [LAND] - Empowering Flame Debuff - Tindral Sageswift, Seer of the Flame",
			"Tank Shroom Advice - Tindral",
			"8. Dispel Traffic Light",
			"8. Smart Healer Glows",
			"8. [FEATHER NEXT] (note) (display)",
			"8. Simple Glows",
			"8. Fiery Growth - Thaner only",
			"8. Fiery Growth - Velo only",
			"8. Fiery Growth - Zaelia only",
			"8 Evoker use Verdant Embrace on Fiery Regrowth",
			"8. [SEEDS] - P2 - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame",
			"8. [SEEDS] - P3 - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame",
		},
		["uid"] = "8diPbnhoNyR",
	},
	{
		["id"] = "8. [WATCH] - Flame Surge PREdebuff - Tindral Sageswift, Seer of the Flame ",
		["uid"] = "b80rXN4Jl0Y",
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. [LAND] - Empowering Flame Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "MigkxDZCCyX",
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "Tank Shroom Advice - Tindral",
		["uid"] = "5(7pYMNmlXH",
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["id"] = "8. Dispel Traffic Light",
		["children"] = {
			"8. Dispel Glow Assignment - Tindral Sageswift",
			"8. Dispel Traffic Light - Tindral Sageswift",
			"8. Player Can Dwarf it",
		},
		["uid"] = "erl79eHoPax",
	},
	{
		["id"] = "8. Dispel Glow Assignment - Tindral Sageswift",
		["uid"] = "NLdSUZWse4M",
		["parent"] = "8. Dispel Traffic Light",
		["echoVersion"] = 14,
	},
	{
		["id"] = "8. Dispel Traffic Light - Tindral Sageswift",
		["uid"] = "gRBUE6te8aI",
		["parent"] = "8. Dispel Traffic Light",
		["echoVersion"] = 12,
	},
	{
		["id"] = "8. Player Can Dwarf it",
		["uid"] = "PccuKdsYTnC",
		["parent"] = "8. Dispel Traffic Light",
		["echoVersion"] = 4,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["id"] = "8. Smart Healer Glows",
		["children"] = {
			"8. FEATHER Preglow",
		},
		["uid"] = "ntTyEi5jsel",
	},
	{
		["id"] = "8. FEATHER Preglow",
		["uid"] = "lHL)NozOQAq",
		["parent"] = "8. Smart Healer Glows",
		["echoVersion"] = 9,
	},
	{
		["id"] = "8. [FEATHER NEXT] (note) (display)",
		["uid"] = "ecRRUBRoY1z",
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 22,
	},
	{
		["echoVersion"] = 5,
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["id"] = "8. Simple Glows",
		["children"] = {
			"8. Prot Pally - Glow Heal Absorbs",
		},
		["uid"] = "OInwn2qI1R9",
	},
	{
		["id"] = "8. Prot Pally - Glow Heal Absorbs",
		["uid"] = "DhYbz74r9qD",
		["parent"] = "8. Simple Glows",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. Fiery Growth - Thaner only",
		["uid"] = "TTUjdRbOWLz",
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 8,
	},
	{
		["id"] = "8. Fiery Growth - Velo only",
		["uid"] = "wmnpnSNOn7d",
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 6,
	},
	{
		["id"] = "8. Fiery Growth - Zaelia only",
		["uid"] = "4Zs6Y(Yv27I",
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 6,
	},
	{
		["id"] = "8 Evoker use Verdant Embrace on Fiery Regrowth",
		["uid"] = "Hw6oPuL7aJ6",
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [SEEDS] - P2 - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame",
		["uid"] = "aCuaGV)7tiV",
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 8,
	},
	{
		["id"] = "8. [SEEDS] - P3 - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame",
		["uid"] = "TNV1srgZPmM",
		["parent"] = "8. Singles - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 8,
	},
	{
		["echoVersion"] = 3,
		["parent"] = "8. Tindral Sageswift, Seer of the Flame",
		["id"] = "8. Texts - Tindral Sageswift, Seer of the Flame",
		["children"] = {
			"8. [DON'T SOAK] - Seed of Flame Debuff - Tindral Sageswift, Seer of the Flame - single",
			"8. [DISPEL NEXT] (note)",
			"8. [FEATHER NEXT] (note)",
		},
		["uid"] = "Q1Ypvx2aE1K",
	},
	{
		["id"] = "8. [DON'T SOAK] - Seed of Flame Debuff - Tindral Sageswift, Seer of the Flame - single",
		["uid"] = "B(Awv5V0H2I",
		["parent"] = "8. Texts - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [DISPEL NEXT] (note)",
		["uid"] = "RUEYHFtjGEF",
		["parent"] = "8. Texts - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 15,
	},
	{
		["id"] = "8. [FEATHER NEXT] (note)",
		["uid"] = "q91tUwmEKIZ",
		["parent"] = "8. Texts - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 24,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "8. Tindral Sageswift, Seer of the Flame",
		["id"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["children"] = {
			"8. Incarnation: Tree of Flame - absorb ticks",
			"8. [DMG + SEEDS] - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame",
			"8. Supernova TICKS - Tindral Sageswift, Seer of the Flame",
			"8. Supernova Cast - Tindral Sageswift, Seer of the Flame",
			"8. Supernova ABSORB - Tindral Sageswift, Seer of the Flame",
			"8. [FLARE BOMBS] - Flare Bomb Cast - Tindral Sageswift, Seer of the Flame",
			"8. [PUSHBACK] - Typhoon Cast - Tindral Sageswift, Seer of the Flame",
			"8. [FIRE BEAM] - Fire Beam Time to Beams - Tindral Sageswift, Seer of the Flame",
			"8. [FIRE BEAM] - Fire Beam Cast - Tindral Sageswift, Seer of the Flame",
			"8. [ROOT INC] - Mass Entanglement Cast - Tindral Sageswift, Seer of the Flame",
			"8. [STARS] - Falling Star Cast - Tindral Sageswift, Seer of the Flame",
			"8. [DISPELS] - Fiery Growth Cast - Tindral Sageswift, Seer of the Flame",
			"8. [MUSHROOMS] - Poisonous Mushrooms Cast - Tindral Sageswift, Seer of the Flame",
			"8. [MUSHROOMS] - Blazing Mushrooms Cast - Tindral Sageswift, Seer of the Flame",
		},
		["uid"] = "xyjOShsaKkD",
	},
	{
		["id"] = "8. Incarnation: Tree of Flame - absorb ticks",
		["uid"] = "u6zvXQP2IyI",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 3,
	},
	{
		["id"] = "8. [DMG + SEEDS] - Flaming Germination Cast - Tindral Sageswift, Seer of the Flame",
		["uid"] = "pdRDiNO04Oa",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. Supernova TICKS - Tindral Sageswift, Seer of the Flame",
		["uid"] = "iqHyzgBKOKV",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 7,
	},
	{
		["id"] = "8. Supernova Cast - Tindral Sageswift, Seer of the Flame",
		["uid"] = "uBSUiq8CUqN",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 4,
	},
	{
		["id"] = "8. Supernova ABSORB - Tindral Sageswift, Seer of the Flame",
		["uid"] = "6ir4p61TwTy",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 8,
	},
	{
		["id"] = "8. [FLARE BOMBS] - Flare Bomb Cast - Tindral Sageswift, Seer of the Flame",
		["uid"] = "TIv8uLe2oen",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. [PUSHBACK] - Typhoon Cast - Tindral Sageswift, Seer of the Flame",
		["uid"] = "aMmv8p9yF78",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. [FIRE BEAM] - Fire Beam Time to Beams - Tindral Sageswift, Seer of the Flame",
		["uid"] = "XIVBIMwFtog",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 5,
	},
	{
		["id"] = "8. [FIRE BEAM] - Fire Beam Cast - Tindral Sageswift, Seer of the Flame",
		["uid"] = "AXU6f7DYxtk",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. [ROOT INC] - Mass Entanglement Cast - Tindral Sageswift, Seer of the Flame",
		["uid"] = "hrP1rWysxoZ",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. [STARS] - Falling Star Cast - Tindral Sageswift, Seer of the Flame",
		["uid"] = "6JTk7TEhn7l",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. [DISPELS] - Fiery Growth Cast - Tindral Sageswift, Seer of the Flame",
		["uid"] = "dhZ41rzYnMK",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. [MUSHROOMS] - Poisonous Mushrooms Cast - Tindral Sageswift, Seer of the Flame",
		["uid"] = "8NmkiwBMWEn",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 2,
	},
	{
		["id"] = "8. [MUSHROOMS] - Blazing Mushrooms Cast - Tindral Sageswift, Seer of the Flame",
		["uid"] = "z9skmQrffLh",
		["parent"] = "8. Bars - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "8. Tindral Sageswift, Seer of the Flame",
		["id"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",
		["children"] = {
			"8. [STACKS] - Astral Heat Debuff - Tindral Sageswift, Seer of the Flame",
			"8. [DOT] - Germination DOT - Tindral Sageswift, Seer of the Flame",
			"8. [ROOT] - Mass Entanglement Debuff - Tindral Sageswift, Seer of the Flame",
			"8. [DOT] - Lingering Cinder Debuff on raid - Tindral Sageswift, Seer of the Flame",
			"8. [MOVE] - Scorching Ground Debuff - Tindral Sageswift, Seer of the Flame",
			"8. Fallen Feather Debuff - Tindral Sageswift, Seer of the Flame",
			"8. [BUFF] - Dream Essence Debuff - Tindral Sageswift, Seer of the Flame",
			"8. [WIPE] - Poisonous Mushroom Debuff - Tindral Sageswift, Seer of the Flame",
		},
		["uid"] = "(CbOA7sBSFT",
	},
	{
		["id"] = "8. [STACKS] - Astral Heat Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "rDDIsdNfqsq",
		["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [DOT] - Germination DOT - Tindral Sageswift, Seer of the Flame",
		["uid"] = "D2gvEzz3hFU",
		["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [ROOT] - Mass Entanglement Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "xE1etPFicZn",
		["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [DOT] - Lingering Cinder Debuff on raid - Tindral Sageswift, Seer of the Flame",
		["uid"] = "mBJjppm2RFl",
		["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [MOVE] - Scorching Ground Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "LtfJRnk65ni",
		["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. Fallen Feather Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "2ScCwuuDpaP",
		["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [BUFF] - Dream Essence Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "OqQlF)ERuCI",
		["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [WIPE] - Poisonous Mushroom Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "5MQmmHX)rh2",
		["parent"] = "8. Icons (low) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "8. Tindral Sageswift, Seer of the Flame",
		["id"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",
		["children"] = {
			"8. [SEED] - Seed of Flame Debuff - Tindral Sageswift, Seer of the Flame",
			"8. [DON'T SOAK] - Germinating Aura Debuff - Tindral Sageswift, Seer of the Flame",
			"8. [ROOT] - Mass Entanglement PREDebuff - Tindral Sageswift, Seer of the Flame",
			"8. [ABSORB] - Suppressive Ember Debuff - Tindral Sageswift, Seer of the Flame",
			"8. [DISPEL] - Fiery Growth Debuff - Tindral Sageswift, Seer of the Flame",
			"8. [TANK] - Blazing Mushroom Debuff - Tindral Sageswift, Seer of the Flame",
			"8. [TANK] - Poisonous Mushroom Debuff - Tindral Sageswift, Seer of the Flame",
			"8. [TANK] - Searing Wrath Debuff - Tindral Sageswift, Seer of the Flame",
		},
		["uid"] = "6HvBS5o37e2",
	},
	{
		["id"] = "8. [SEED] - Seed of Flame Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "huSasCgyEnE",
		["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [DON'T SOAK] - Germinating Aura Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "ODnni4lKSSD",
		["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [ROOT] - Mass Entanglement PREDebuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "EPHfDTpfjk4",
		["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [ABSORB] - Suppressive Ember Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "B6AjeCdfoJl",
		["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [DISPEL] - Fiery Growth Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "0vVmmt1EXhg",
		["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [TANK] - Blazing Mushroom Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "JxWvikY12q(",
		["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [TANK] - Poisonous Mushroom Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "1Vlegva)Uzm",
		["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
	{
		["id"] = "8. [TANK] - Searing Wrath Debuff - Tindral Sageswift, Seer of the Flame",
		["uid"] = "QgzXM6xyqTd",
		["parent"] = "8. Icons (high) - Tindral Sageswift, Seer of the Flame",
		["echoVersion"] = 1,
	},
},1207,0);

--fixUpNestedPreview(8,1207,"8. Tindral Sageswift, Seer of the Flame");
