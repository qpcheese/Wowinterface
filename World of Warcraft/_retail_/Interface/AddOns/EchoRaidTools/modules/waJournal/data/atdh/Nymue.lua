
local _AddonName, _EchoRaidTools = ...;

local journal = _EchoRaidTools:GetModule("waJournal");

-- 6. export data

journal:AddImportData({["6. [FRONTAL] - Lumbering Slam Cast - Nymue, Weaver of the Cycle (add)"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,1,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "463566",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "6. Bars - Nymue, Weaver of the Cycle",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",["zoom"] = 0,["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {429108,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["unit"] = "nameplate",["subeventPrefix"] = "SPELL",["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["internalVersion"] = 70,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FRONTAL",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "6. [FRONTAL] - Lumbering Slam Cast - Nymue, Weaver of the Cycle (add)",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["borderOffset"] = 5,["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["rotateText"] = "NONE",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "ydbLa8x)(5V",},["6. [SAFE] - Inflorescence Debuff - Nymue, Weaver of the Cycle"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["useName"] = true,["unit"] = "player",["auranames"] = {"423195",},["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SAFE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",["desaturate"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [SAFE] - Inflorescence Debuff - Nymue, Weaver of the Cycle",["frameStrata"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "aFjqwcU1akY",["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["authorOptions"] = {},},["6. Private Aura Holder 1 - Single - Nymue"] = {["iconSource"] = -1,["wagoID"] = "n3lAhBYxn",["parent"] = "6. Singles - Nymue, Weaver of the Cycle",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["cooldownEdge"] = false,["actions"] = {["start"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
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
aura_env.region.anchorID = C_UnitAuras.AddPrivateAuraAnchor(privateAnchorArgs)",["do_custom"] = true,},["init"] = {["do_custom"] = false,},["finish"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
if anchorID then\
    C_UnitAuras.RemovePrivateAuraAnchor(anchorID)\
end",["do_custom"] = true,},},["triggers"] = {[1] = {["trigger"] = {["custom_type"] = "stateupdate",["type"] = "custom",["use_alwaystrue"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_absorbMode"] = true,["event"] = "Conditions",["use_unit"] = true,["use_absorbHealMode"] = true,["custom"] = "function(a)\
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
end",["spellIds"] = {},["events"] = "",["check"] = "event",["names"] = {},["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%index",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowXOffset"] = 0,["anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_p_time_precision"] = 1,["text_shadowYOffset"] = 0,["text_visible"] = false,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorYOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_fontSize"] = 72,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_format"] = "timed",},},["height"] = 100,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["regionType"] = "icon",["authorOptions"] = {},["cooldown"] = false,["icon"] = true,["url"] = "https://echoesports.gg",["cooldownTextDisabled"] = true,["anchorFrameParent"] = false,["uid"] = "Im7jfYx0DYc",["frameStrata"] = 1,["zoom"] = 0,["semver"] = "1.0.5",["tocversion"] = 100200,["id"] = "6. Private Aura Holder 1 - Single - Nymue",["width"] = 100,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["config"] = {},["inverse"] = false,["xOffset"] = 340,["color"] = {1,1,1,1,},["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "customcheck",["value"] = "function()\
    return not WeakAuras.IsOptionsOpen()\
end",},["changes"] = {{["value"] = {1,1,1,0,},["property"] = "color",},{["property"] = "sub.2.text_visible",},},},},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["6. Nymue, Weaver of the Cycle"] = {["controlledChildren"] = {"6. Icons (high) - Nymue, Weaver of the Cycle","6. Icons (low) - Nymue, Weaver of the Cycle","6. Bars - Nymue, Weaver of the Cycle","6. Texts - Nymue, Weaver of the Cycle","6. Singles - Nymue, Weaver of the Cycle",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "6. Nymue, Weaver of the Cycle",["parent"] = " Echo - Amirdrassil",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["groupIcon"] = "5342920",["borderInset"] = 1,["xOffset"] = 0,["selfPoint"] = "CENTER",["uid"] = "1QjcK5LgNON",["conditions"] = {},["information"] = {},["config"] = {},},["6. Impending Loom Simple Glow"] = {["outline"] = "OUTLINE",["parent"] = "6. Simple Glows",["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["glow_color"] = {1,0,0,1,},["glow_YOffset"] = 1,["glow_action"] = "show",["glow_XOffset"] = 1,["glow_frequency"] = 0.3,["glow_lines"] = 12,["use_glow_color"] = true,["do_glow"] = true,["glow_type"] = "Pixel",["glow_thickness"] = 2,["glow_frame_type"] = "UNITFRAME",},["init"] = {},["finish"] = {["hide_all_glows"] = true,},},["triggers"] = {[1] = {["trigger"] = {["showClones"] = true,["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["useName"] = true,["unit"] = "group",["auranames"] = {"429785",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["wordWrap"] = "WordWrap",["font"] = "Friz Quadrata TT",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["talent"] = {["multi"] = {},},["use_role"] = true,["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["role"] = {["single"] = "HEALER",},["encounterid"] = "2708",["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 12,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_time_mod_rate"] = true,["selfPoint"] = "BOTTOM",["fixedWidth"] = 200,["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["displayText_format_p_time_precision"] = 1,["url"] = "https://echoesports.gg",["uid"] = "ehrsuSbsZWA",["color"] = {1,1,1,1,},["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "6. Impending Loom Simple Glow",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["config"] = {},["xOffset"] = 0,["displayText_format_p_time_dynamic_threshold"] = 60,["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["displayText"] = "",},["6. [STUN] - Impending Loom Debuff - Nymue, Weaver of the Cycle"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["auranames"] = {"429785",},["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "STUN",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["authorOptions"] = {},["desaturate"] = false,["config"] = {},["zoom"] = 0,["anchorFrameParent"] = false,["width"] = 55,["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [STUN] - Impending Loom Debuff - Nymue, Weaver of the Cycle",["alpha"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "R2X(VVxQbmO",["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "6. Icons (high) - Nymue, Weaver of the Cycle",},["6. [RIGHT] (note)"] = {["outline"] = "OUTLINE",["parent"] = "6. Texts - Nymue, Weaver of the Cycle",["preferToUpdate"] = false,["shadowYOffset"] = -1,["displayText_format_pos_format"] = "none",["echoVersion"] = 14,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["do_sound"] = true,},["finish"] = {["stop_sound"] = true,},["init"] = {["do_custom"] = true,["custom"] = "local keyword = \"right\"\
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
    elogl(\"RIGHT ADD Note Init:\",#aura_env.rotations)\
    aura_env.initialized = true;\
    \
end\
\
\
\
\
",},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["event"] = "Health",["names"] = {},["custom_type"] = "stateupdate",["events"] = "ENCOUNTER_START EXRT_NOTE_UPDATE TRIGGER:2 ",["spellIds"] = {},["subeventPrefix"] = "SPELL",["check"] = "event",["custom"] = "function(s,e,num,ts,...)\
    if e == \"ENCOUNTER_START\" or e == \"EXRT_NOTE_UPDATE\" then\
        aura_env.TryReadNote()\
        \
    elseif ts and ts[\"\"] and ts[\"\"].show then\
        local count = tonumber(ts[\"\"].count)\
        if count then\
            \
            if count > #aura_env.rotations then\
                count = count % #aura_env.rotations\
            end\
            count = count == 0 and #aura_env.rotations or count\
            \
            local set = aura_env.rotations[count]\
            elogl(\"RIGHT ADD note, count\", count, \"set\", unpack(set))\
            \
            local i = tIndexOf(set, WeakAuras.me)\
            if i then\
                elog(\"RIGHT ASSIGNED TO ME\")\
                s[\"\"] = {\
                    show = true,\
                    changed = true,\
                    duration = 8,\
                    expirationTime = GetTime() + 8,\
                    autoHide = true,\
                    progressType = \"timed\",\
                }\
                return true\
            end\
        end\
    end\
end\
\
\
",["unit"] = "player",["customVariables"] = "{expirationTime = true}",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "combatlog",["spellId"] = {426855,},["subeventSuffix"] = "_CAST_START",["remaining_operator"] = "<",["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["message"] = "Owl form / flare bomb",["remaining"] = "4",["duration"] = "1",["use_spellId"] = true,["use_message"] = false,["unit"] = "player",["use_remaining"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desc"] = "#right name name\
#right name name\
#right name name\
\
Assign specific players to go on the Right add in the intermission",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2708",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["class"] = {["multi"] = {},},["use_difficulty"] = true,["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 35,["source"] = "import",["shadowXOffset"] = 1,["authorOptions"] = {},["wordWrap"] = "WordWrap",["regionType"] = "text",["conditions"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["internalVersion"] = 70,["anchorPoint"] = "CENTER",["uid"] = "bXl1LM6KT7A",["displayText_format_p_time_precision"] = 1,["anchorFrameParent"] = false,["xOffset"] = 0,["displayText_format_p_format"] = "timed",["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "6. [RIGHT] (note)",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["config"] = {},["displayText"] = "RIGHT ADD",["url"] = "https://echoesports.gg",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["selfPoint"] = "CENTER",},["6. [DON'T MID] - Lucid Vulnerability Debuff -  Nymue, Weaver of the Cycle"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["event"] = "Health",["unit"] = "player",["spellIds"] = {},["names"] = {},["type"] = "aura2",["subeventPrefix"] = "SPELL",["auranames"] = {"428479",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DON'T MID",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["color"] = {1,1,1,1,},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["selfPoint"] = "CENTER",["desaturate"] = false,["uid"] = "oC2My4qLyb3",["frameStrata"] = 1,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [DON'T MID] - Lucid Vulnerability Debuff -  Nymue, Weaver of the Cycle",["cooldownTextDisabled"] = false,["alpha"] = 1,["width"] = 55,["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},["6. [AIRHORN] - INSIDE AND DEBUFFED -  Nymue"] = {["outline"] = "OUTLINE",["iconSource"] = -1,["authorOptions"] = {},["displayText"] = "",["wordWrap"] = "WordWrap",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = true,},["finish"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"428479",},["fetchTooltip"] = true,["event"] = "Health",["unit"] = "player",["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["useName"] = true,["auranames"] = {"428012",},["fetchTooltip"] = true,["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["conditions"] = {},["url"] = "https://echoesports.gg",["desaturate"] = false,["xOffset"] = 0,["font"] = "Friz Quadrata TT",["displayText_format_p_time_legacy_floor"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["height"] = 55,["uid"] = "DEmC2wyUG2J",["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2708",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["justify"] = "LEFT",["width"] = 55,["fontSize"] = 12,["source"] = "import",["alpha"] = 1,["shadowXOffset"] = 1,["parent"] = "6. Singles - Nymue, Weaver of the Cycle",["preferToUpdate"] = false,["stickyDuration"] = false,["regionType"] = "text",["icon"] = true,["zoom"] = 0,["displayText_format_p_time_precision"] = 1,["frameStrata"] = 1,["selfPoint"] = "CENTER",["anchorFrameParent"] = false,["automaticWidth"] = "Auto",["displayText_format_p_time_dynamic_threshold"] = 60,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [AIRHORN] - INSIDE AND DEBUFFED -  Nymue",["displayIcon"] = "",["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["shadowYOffset"] = -1,["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["cooldown"] = true,["displayText_format_p_time_mod_rate"] = true,},["6. [STUN THREADS] - Impending Loom Cast - Nymue, Weaver of the Cycle"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "wdmBAOw90IC",["displayIcon"] = "4549251",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "6. Bars - Nymue, Weaver of the Cycle",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["textSize"] = 12,["customTextUpdate"] = "update",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {429615,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["subeventPrefix"] = "SPELL",["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["names"] = {},["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 70,["sparkRotationMode"] = "AUTO",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["customText"] = "function()\
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
",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "STUN THREADS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["icon"] = true,["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["authorOptions"] = {},["color"] = {},["anchorFrameParent"] = false,["textFlags"] = "None",["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["backdropColor"] = {1,1,1,0.5,},["id"] = "6. [STUN THREADS] - Impending Loom Cast - Nymue, Weaver of the Cycle",["stacksFlags"] = "None",["frameStrata"] = 1,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["6. [DOT] - Verdant Matrix Debuff -  Nymue, Weaver of the Cycle"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["useName"] = true,["unit"] = "player",["auranames"] = {"420554",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Proc",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["parent"] = "6. Icons (high) - Nymue, Weaver of the Cycle",["desaturate"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [DOT] - Verdant Matrix Debuff -  Nymue, Weaver of the Cycle",["frameStrata"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "(BE5aH1LflK",["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "stacks",["value"] = "3",["op"] = ">=",},["changes"] = {{["value"] = true,["property"] = "sub.4.glow",},},},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["authorOptions"] = {},},["6. Icons (high) - Nymue, Weaver of the Cycle"] = {["grow"] = "LEFT",["controlledChildren"] = {"6. [TANK] - Woven Resonance Debuff - tank - Nymue, Weaver of the Cycle","6. [STUN] - Impending Loom Debuff - Nymue, Weaver of the Cycle","6. [DOT] - Verdant Matrix Debuff -  Nymue, Weaver of the Cycle","6. [RAIN] - Viridian Rain Uptime - Nymue, Weaver of the Cycle","6. Private Aura Holder 1 - Nymue",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["6. [RAIN] - Viridian Rain Uptime - Nymue, Weaver of the Cycle"] = false,["6. Private Aura Holder 1 - Nymue"] = false,["6. [DOT] - Verdant Matrix Debuff -  Nymue, Weaver of the Cycle"] = false,["6. [STUN] - Impending Loom Debuff - Nymue, Weaver of the Cycle"] = false,["6. [TANK] - Woven Resonance Debuff - tank - Nymue, Weaver of the Cycle"] = false,},["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["stagger"] = 0,["rowSpace"] = 1,["selfPoint"] = "RIGHT",["subRegions"] = {},["radius"] = 200,["gridType"] = "RD",["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["config"] = {},["backdropColor"] = {1,1,1,0.5,},["borderInset"] = 1,["source"] = "import",["anchorFrameFrame"] = "WeakAuras:Icon - High Priority - Anchor [AMIR]",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["parent"] = "6. Nymue, Weaver of the Cycle",["frameStrata"] = 1,["arcLength"] = 360,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["rotation"] = 0,["tocversion"] = 100200,["id"] = "6. Icons (high) - Nymue, Weaver of the Cycle",["regionType"] = "dynamicgroup",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["anchorPoint"] = "CENTER",["uid"] = "2v9FgrYvb(8",["authorOptions"] = {},["animate"] = false,["fullCircle"] = true,["conditions"] = {},["information"] = {},["useLimit"] = false,},["6. [FLOWERS UP] - Surging Growth Debuff - Nymue, Weaver of the Cycle"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["names"] = {},["spellIds"] = {},["subeventPrefix"] = "SPELL",["useName"] = true,["unit"] = "player",["auranames"] = {"429983",},["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["uid"] = "(gPOp0e53kz",["alpha"] = 1,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [FLOWERS UP] - Surging Growth Debuff - Nymue, Weaver of the Cycle",["zoom"] = 0,["frameStrata"] = 1,["width"] = 55,["authorOptions"] = {},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["color"] = {1,1,1,1,},},["6. Singles - Nymue, Weaver of the Cycle"] = {["controlledChildren"] = {"6. Private Aura Holder 1 - Single - Nymue","6. [prog circle] - Verdant Matrix Debuff -  Nymue, Weaver of the Cycle","6. /Say on Stun","6. [AIRHORN] - INSIDE AND DEBUFFED -  Nymue","6. Simple Glows",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "6. Nymue, Weaver of the Cycle",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "6. Singles - Nymue, Weaver of the Cycle",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["borderInset"] = 1,["uid"] = "YEWQVuBze5u",["xOffset"] = 0,["config"] = {},["conditions"] = {},["information"] = {},["selfPoint"] = "CENTER",},["6. [DOT] - Weaver's Burden (post-bomb) Debuff - Nymue, Weaver of the Cycle"] = {["iconSource"] = -1,["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["useExactSpellId"] = true,["event"] = "Health",["names"] = {},["subeventPrefix"] = "SPELL",["auraspellids"] = {"427721",},["spellIds"] = {},["unit"] = "player",["auranames"] = {"427721",},["subeventSuffix"] = "_CAST_START",["useName"] = false,["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["size"] = {["multi"] = {},},},["source"] = "import",["authorOptions"] = {},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["stickyDuration"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {},["frameStrata"] = 1,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [DOT] - Weaver's Burden (post-bomb) Debuff - Nymue, Weaver of the Cycle",["zoom"] = 0,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "14krlpPd1C2",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["xOffset"] = 0,},["6. /Say on Stun"] = {["outline"] = "OUTLINE",["parent"] = "6. Singles - Nymue, Weaver of the Cycle",["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["message_type"] = "SAY",["do_message"] = true,["message"] = "STUNNED",},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"429785",},["event"] = "Health",["names"] = {},["spellIds"] = {},["subeventPrefix"] = "SPELL",["useName"] = true,["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["wordWrap"] = "WordWrap",["font"] = "Friz Quadrata TT",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["difficulty"] = {["single"] = "mythic",},["size"] = {["multi"] = {},},["encounterid"] = "2708",["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["use_encounterid"] = true,},["fontSize"] = 12,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_time_mod_rate"] = true,["selfPoint"] = "BOTTOM",["conditions"] = {},["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayText_format_p_time_precision"] = 1,["url"] = "https://echoesports.gg",["config"] = {},["authorOptions"] = {},["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "6. /Say on Stun",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "G(TfJPYZbkJ",["color"] = {1,1,1,1,},["displayText"] = "",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,},["6. [RAIN] - Viridian Rain Uptime - Nymue, Weaver of the Cycle"] = {["iconSource"] = -1,["parent"] = "6. Icons (high) - Nymue, Weaver of the Cycle",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "combatlog",["spellId"] = {"420907",},["subeventSuffix"] = "_CAST_SUCCESS",["fetchTooltip"] = true,["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["auranames"] = {"428273",},["use_spellId"] = true,["spellIds"] = {},["names"] = {},["unit"] = "player",["duration"] = "6",["useName"] = true,["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "RAIN",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Proc",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = true,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["stickyDuration"] = false,["uid"] = "GcyyznAIxiL",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [RAIN] - Viridian Rain Uptime - Nymue, Weaver of the Cycle",["frameStrata"] = 1,["useCooldownModRate"] = true,["width"] = 55,["authorOptions"] = {},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "4622455",["cooldown"] = true,["xOffset"] = 0,},["6. Simple Glows"] = {["controlledChildren"] = {"6. Impending Loom Simple Glow","6. Weaver's Burden Simple Glow",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "6. Simple Glows",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["config"] = {},["borderInset"] = 1,["parent"] = "6. Singles - Nymue, Weaver of the Cycle",["selfPoint"] = "CENTER",["conditions"] = {},["information"] = {},["uid"] = "ZiA2X8XQenK",},["6. Icons (low) - Nymue, Weaver of the Cycle"] = {["arcLength"] = 360,["controlledChildren"] = {"6. [] - Unravel Debuff -  Nymue, Weaver of the Cycle","6. [INSIDE] - Lucid Miasma Debuff -  Nymue, Weaver of the Cycle","6. [SAFE] - Inflorescence Debuff - Nymue, Weaver of the Cycle","6. [DOT] - Ephemeral Flora Debuff - Nymue, Weaver of the Cycle","6. [DOT] - Weaver's Burden (post-bomb) Debuff - Nymue, Weaver of the Cycle","6. [FLOWERS UP] - Surging Growth Debuff - Nymue, Weaver of the Cycle","6. [DON'T MID] - Lucid Vulnerability Debuff -  Nymue, Weaver of the Cycle","6. [] - Verdant Rend Debuff -  Nymue, Weaver of the Cycle",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "6. Nymue, Weaver of the Cycle",["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["6. [] - Unravel Debuff -  Nymue, Weaver of the Cycle"] = false,["6. [SAFE] - Inflorescence Debuff - Nymue, Weaver of the Cycle"] = false,["6. [FLOWERS UP] - Surging Growth Debuff - Nymue, Weaver of the Cycle"] = false,["6. [] - Verdant Rend Debuff -  Nymue, Weaver of the Cycle"] = false,["6. [DON'T MID] - Lucid Vulnerability Debuff -  Nymue, Weaver of the Cycle"] = false,["6. [DOT] - Weaver's Burden (post-bomb) Debuff - Nymue, Weaver of the Cycle"] = false,["6. [INSIDE] - Lucid Miasma Debuff -  Nymue, Weaver of the Cycle"] = false,["6. [DOT] - Ephemeral Flora Debuff - Nymue, Weaver of the Cycle"] = false,},["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["useLimit"] = false,["align"] = "CENTER",["stagger"] = 0,["rotation"] = 0,["config"] = {},["subRegions"] = {},["internalVersion"] = 70,["gridType"] = "RD",["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["animate"] = false,["backdropColor"] = {1,1,1,0.5,},["borderInset"] = 1,["source"] = "import",["anchorFrameFrame"] = "WeakAuras:Icon - Low Priority - Anchor [AMIR]",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["xOffset"] = 0,["gridWidth"] = 5,["grow"] = "LEFT",["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["selfPoint"] = "RIGHT",["tocversion"] = 100200,["id"] = "6. Icons (low) - Nymue, Weaver of the Cycle",["regionType"] = "dynamicgroup",["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["anchorPoint"] = "CENTER",["uid"] = "jeysElZBOXa",["authorOptions"] = {},["fullCircle"] = true,["rowSpace"] = 1,["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["6. Private Aura Holder 1 - Nymue"] = {["iconSource"] = -1,["wagoID"] = "n3lAhBYxn",["authorOptions"] = {{["type"] = "input",["useDesc"] = false,["width"] = 1,["key"] = "unit",["default"] = "player",["name"] = "Unit",["length"] = 10,["multiline"] = false,["useLength"] = false,},{["type"] = "range",["useDesc"] = false,["max"] = 16,["step"] = 1,["width"] = 1,["min"] = 1,["key"] = "auras",["default"] = 4,["name"] = "#auras",},},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["custom_type"] = "stateupdate",["type"] = "custom",["use_alwaystrue"] = true,["subeventSuffix"] = "_CAST_START",["use_unit"] = true,["use_absorbMode"] = true,["event"] = "Conditions",["subeventPrefix"] = "SPELL",["names"] = {},["spellIds"] = {},["custom"] = "function(a)\
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
end",["events"] = "",["check"] = "event",["use_absorbHealMode"] = true,["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text"] = "%index",["text_text_format_p_format"] = "timed",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_p_time_precision"] = 1,["text_shadowYOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorYOffset"] = 0,["text_visible"] = false,["text_fontSize"] = 72,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = true,["talent"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["regionType"] = "icon",["color"] = {1,1,1,1,},["information"] = {},["actions"] = {["start"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
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
print(aura_env.region.anchorID)",["do_custom"] = true,},["finish"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
if anchorID then\
    C_UnitAuras.RemovePrivateAuraAnchor(anchorID)\
end",["do_custom"] = true,},["init"] = {["do_custom"] = false,},},["url"] = "https://echoesports.gg",["zoom"] = 0,["anchorFrameParent"] = false,["config"] = {["auras"] = 1,["unit"] = "player",},["alpha"] = 1,["cooldownTextDisabled"] = true,["semver"] = "1.0.5",["tocversion"] = 100200,["id"] = "6. Private Aura Holder 1 - Nymue",["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["width"] = 55,["frameStrata"] = 1,["uid"] = "(vgOhvUw6sw",["inverse"] = false,["parent"] = "6. Icons (high) - Nymue, Weaver of the Cycle",["xOffset"] = 0,["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "customcheck",["value"] = "function()\
    return not WeakAuras.IsOptionsOpen()\
end",},["changes"] = {{["value"] = {1,1,1,0,},["property"] = "color",},{["property"] = "sub.2.text_visible",},},},},["cooldown"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["6. [INTERMISSION] - Full Bloom Cast - Nymue, Weaver of the Cycle"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "r)36NFbQcQg",["displayIcon"] = "237578",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "6. Bars - Nymue, Weaver of the Cycle",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["zoom"] = 0,["customTextUpdate"] = "update",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {426855,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["subeventPrefix"] = "SPELL",["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["sparkRotation"] = 0,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "INTERMISSION",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["id"] = "6. [INTERMISSION] - Full Bloom Cast - Nymue, Weaver of the Cycle",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["borderOffset"] = 5,["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["backdropColor"] = {1,1,1,0.5,},["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotationMode"] = "AUTO",["rotateText"] = "NONE",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["6. [BOSS IMMUNE] - Nymue, Weaver of the Cycle"] = {["outline"] = "OUTLINE",["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["useGroup_count"] = true,["group_countOperator"] = ">",["event"] = "Health",["names"] = {},["subeventPrefix"] = "SPELL",["unit"] = "boss",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["group_count"] = "0",["useName"] = true,["auranames"] = {"425794",},["debuffType"] = "BOTH",},["untrigger"] = {},},[2] = {["trigger"] = {["use_specific_unitisunit"] = true,["type"] = "unit",["use_absorbHealMode"] = true,["use_absorbMode"] = true,["event"] = "Unit Characteristics",["use_unit"] = true,["unitisunit"] = "boss1",["use_unitisunit"] = true,["unit"] = "target",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["selfPoint"] = "CENTER",["desc"] = "Simple reminder not to bother DPSing the boss once immune\
",["font"] = "Expressway MonoNum",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},},["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["use_encounterid"] = true,},["fontSize"] = 25,["source"] = "import",["shadowXOffset"] = 1,["parent"] = "6. Texts - Nymue, Weaver of the Cycle",["regionType"] = "text",["anchorFrameParent"] = false,["conditions"] = {},["displayText_format_p_time_mod_rate"] = true,["internalVersion"] = 70,["url"] = "https://echoesports.gg",["displayText_format_p_time_precision"] = 1,["config"] = {},["authorOptions"] = {},["xOffset"] = 0,["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "6. [BOSS IMMUNE] - Nymue, Weaver of the Cycle",["wordWrap"] = "WordWrap",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["displayText_format_p_time_dynamic_threshold"] = 60,["uid"] = "(Y(bPGAj9Ct",["displayText"] = "BOSS IMMUNE",["shadowYOffset"] = -1,["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["6. Bars - Nymue, Weaver of the Cycle"] = {["grow"] = "DOWN",["controlledChildren"] = {"6. [LINES + DMG] - Continuum Cast - Nymue, Weaver of the Cycle","6. [FRONTAL] - Lumbering Slam Cast - Nymue, Weaver of the Cycle (add)","6. [DODGES] - Lucid Exhaust Cast - Nymue, Weaver of the Cycle (add)","6. [STUN THREADS] - Impending Loom Cast - Nymue, Weaver of the Cycle","6. [INTERMISSION] - Full Bloom Cast - Nymue, Weaver of the Cycle","6. [RAIN] - Viridian Rain Cast - Nymue, Weaver of the Cycle",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "6. Nymue, Weaver of the Cycle",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["rotation"] = 0,["space"] = 2,["stagger"] = 0,["subRegions"] = {},["selfPoint"] = "TOP",["sortHybridTable"] = {["6. [FRONTAL] - Lumbering Slam Cast - Nymue, Weaver of the Cycle (add)"] = false,["6. [LINES + DMG] - Continuum Cast - Nymue, Weaver of the Cycle"] = false,["6. [DODGES] - Lucid Exhaust Cast - Nymue, Weaver of the Cycle (add)"] = false,["6. [RAIN] - Viridian Rain Cast - Nymue, Weaver of the Cycle"] = false,["6. [INTERMISSION] - Full Bloom Cast - Nymue, Weaver of the Cycle"] = false,["6. [STUN THREADS] - Impending Loom Cast - Nymue, Weaver of the Cycle"] = false,},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["xOffset"] = 0,["backdropColor"] = {1,1,1,0.5,},["uid"] = "rMQKqXjkt0a",["source"] = "import",["animate"] = false,["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["stepAngle"] = 15,["borderSize"] = 2,["limit"] = 5,["anchorFrameFrame"] = "WeakAuras:Bars - Anchor [AMIR]",["frameStrata"] = 1,["arcLength"] = 360,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["sort"] = "none",["borderOffset"] = 4,["gridType"] = "RD",["tocversion"] = 100200,["id"] = "6. Bars - Nymue, Weaver of the Cycle",["regionType"] = "dynamicgroup",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["authorOptions"] = {},["borderInset"] = 1,["fullCircle"] = true,["internalVersion"] = 70,["config"] = {},["conditions"] = {},["information"] = {},["useLimit"] = false,},["6. Texts - Nymue, Weaver of the Cycle"] = {["grow"] = "DOWN",["controlledChildren"] = {"6. [CHECK FOR FLOWERS] - add nearly dead - Nymue","6. [BOSS IMMUNE] - Nymue, Weaver of the Cycle","6. [MID ADD] (note)","6. [LEFT] (note)","6. [RIGHT] (note)",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["fullCircle"] = true,["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["rotation"] = 0,["useLimit"] = false,["selfPoint"] = "TOP",["subRegions"] = {},["borderInset"] = 1,["sortHybridTable"] = {["6. [MID ADD] (note)"] = false,["6. [BOSS IMMUNE] - Nymue, Weaver of the Cycle"] = false,["6. [RIGHT] (note)"] = false,["6. [LEFT] (note)"] = false,["6. [CHECK FOR FLOWERS] - add nearly dead - Nymue"] = false,},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["source"] = "import",["backdropColor"] = {1,1,1,0.5,},["uid"] = "ZIisQS9RE0k",["animate"] = false,["anchorFrameFrame"] = "WeakAuras:Texts - Anchor [AMIR]",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["authorOptions"] = {},["gridWidth"] = 5,["arcLength"] = 360,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["radius"] = 200,["tocversion"] = 100200,["id"] = "6. Texts - Nymue, Weaver of the Cycle",["regionType"] = "dynamicgroup",["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["parent"] = "6. Nymue, Weaver of the Cycle",["config"] = {},["gridType"] = "RD",["borderColor"] = {0,0,0,1,},["space"] = 2,["conditions"] = {},["information"] = {},["stagger"] = 0,},["6. [INSIDE] - Lucid Miasma Debuff -  Nymue, Weaver of the Cycle"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"428012",},["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "INSIDE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip3_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["size"] = {["multi"] = {},},},["source"] = "import",["authorOptions"] = {},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["desaturate"] = false,["selfPoint"] = "CENTER",["config"] = {},["useCooldownModRate"] = true,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [INSIDE] - Lucid Miasma Debuff -  Nymue, Weaver of the Cycle",["cooldownTextDisabled"] = false,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "wySmc0fWYCi",["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",},["6. [CHECK FOR FLOWERS] - add nearly dead - Nymue"] = {["outline"] = "OUTLINE",["authorOptions"] = {},["displayText"] = "CHECK FOR FLOWERS",["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["npcId"] = "209800",["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_unit"] = true,["use_absorbMode"] = true,["event"] = "Health",["unit"] = "target",["use_npcId"] = true,["percenthealth"] = {"4",},["spellIds"] = {},["subeventPrefix"] = "SPELL",["names"] = {},["use_percenthealth"] = true,["percenthealth_operator"] = {"<",},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desc"] = "Reminder to check for any small soaks still present before running away from the big adds. ",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["difficulty"] = {["single"] = "mythic",},["use_encounterid"] = true,["spec"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["use_difficulty"] = true,["size"] = {["multi"] = {},},},["fontSize"] = 25,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["preferToUpdate"] = false,["selfPoint"] = "BOTTOM",["fixedWidth"] = 200,["displayText_format_p_time_legacy_floor"] = false,["displayText_format_p_time_precision"] = 1,["displayText_format_p_format"] = "timed",["color"] = {1,1,1,1,},["uid"] = "aKo6A85xuRs",["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "6. [CHECK FOR FLOWERS] - add nearly dead - Nymue",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["config"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["parent"] = "6. Texts - Nymue, Weaver of the Cycle",["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["wordWrap"] = "WordWrap",},["6. [RAIN] - Viridian Rain Cast - Nymue, Weaver of the Cycle"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "gUx8t6NETSk",["displayIcon"] = "",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "6. Bars - Nymue, Weaver of the Cycle",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["textSize"] = 12,["sparkRotationMode"] = "AUTO",["borderOffset"] = 5,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {"420907",},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["use_unit"] = true,["subeventPrefix"] = "SPELL",["unit"] = "boss",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 70,["url"] = "https://echoesports.gg",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["adjustedMin"] = "4",["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "RAIN",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["icon"] = true,["borderSize"] = 16,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["authorOptions"] = {},["color"] = {},["sparkHeight"] = 14,["borderInFront"] = false,["textFlags"] = "None",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["backdropColor"] = {1,1,1,0.5,},["id"] = "6. [RAIN] - Viridian Rain Cast - Nymue, Weaver of the Cycle",["stacksFlags"] = "None",["frameStrata"] = 1,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["customTextUpdate"] = "update",["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["6. [LEFT] (note)"] = {["outline"] = "OUTLINE",["parent"] = "6. Texts - Nymue, Weaver of the Cycle",["preferToUpdate"] = false,["shadowYOffset"] = -1,["displayText_format_pos_format"] = "none",["echoVersion"] = 14,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["do_sound"] = true,},["init"] = {["do_custom"] = true,["custom"] = "local keyword = \"left\"\
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
    elogl(\"LEFT ADD Note Init:\",#aura_env.rotations)\
    aura_env.initialized = true;\
    \
end\
\
\
\
\
",},["finish"] = {["stop_sound"] = true,},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["customVariables"] = "{expirationTime = true}",["event"] = "Health",["names"] = {},["unit"] = "player",["spellIds"] = {},["custom"] = "function(s,e,num,ts,...)\
    if e == \"ENCOUNTER_START\" or e == \"EXRT_NOTE_UPDATE\" then\
        aura_env.TryReadNote()\
        \
    elseif ts and ts[\"\"] and ts[\"\"].show then\
        local count = tonumber(ts[\"\"].count)\
        if count then\
            \
            if count > #aura_env.rotations then\
                count = count % #aura_env.rotations\
            end\
            count = count == 0 and #aura_env.rotations or count\
            \
            local set = aura_env.rotations[count]\
            elogl(\"LEFT ADD note, count\", count, \"set\", unpack(set))\
            \
            local i = tIndexOf(set, WeakAuras.me)\
            if i then\
                elog(\"LEFT ASSIGNED TO ME\")\
                s[\"\"] = {\
                    show = true,\
                    changed = true,\
                    duration = 8,\
                    expirationTime = GetTime() + 8,\
                    autoHide = true,\
                    progressType = \"timed\",\
                }\
                return true\
            end\
        end\
    end\
end\
\
\
",["subeventPrefix"] = "SPELL",["check"] = "event",["events"] = "ENCOUNTER_START EXRT_NOTE_UPDATE TRIGGER:2 ",["custom_type"] = "stateupdate",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "combatlog",["spellId"] = {426855,},["subeventSuffix"] = "_CAST_START",["remaining_operator"] = "<",["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["message"] = "Owl form / flare bomb",["remaining"] = "4",["duration"] = "1",["use_spellId"] = true,["use_message"] = false,["unit"] = "player",["use_remaining"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["internalVersion"] = 70,["selfPoint"] = "CENTER",["desc"] = "#left name name\
#left name name\
#left name name\
\
Assign specific players to go on the Left add in the intermission",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["encounterid"] = "2708",["use_difficulty"] = true,["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 35,["source"] = "import",["shadowXOffset"] = 1,["authorOptions"] = {},["wordWrap"] = "WordWrap",["regionType"] = "text",["fixedWidth"] = 200,["displayText_format_p_time_dynamic_threshold"] = 60,["displayText_format_p_time_legacy_floor"] = false,["anchorPoint"] = "CENTER",["config"] = {},["anchorFrameParent"] = false,["displayText_format_p_time_precision"] = 1,["color"] = {1,1,1,1,},["displayText_format_p_format"] = "timed",["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "6. [LEFT] (note)",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "E2u(5NiJwHX",["displayText"] = "LEFT ADD",["url"] = "https://echoesports.gg",["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["6. [DOT] - Ephemeral Flora Debuff - Nymue, Weaver of the Cycle"] = {["iconSource"] = -1,["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"430563",},["event"] = "Health",["unit"] = "player",["spellIds"] = {},["names"] = {},["type"] = "aura2",["subeventPrefix"] = "SPELL",["subeventSuffix"] = "_CAST_START",["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["xOffset"] = 0,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["uid"] = "sfethVWbd64",["frameStrata"] = 1,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [DOT] - Ephemeral Flora Debuff - Nymue, Weaver of the Cycle",["cooldownTextDisabled"] = false,["alpha"] = 1,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["authorOptions"] = {},},["6. [TANK] - Woven Resonance Debuff - tank - Nymue, Weaver of the Cycle"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["unit"] = "player",["spellIds"] = {},["type"] = "aura2",["auranames"] = {"428273",},["names"] = {},["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip3_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},{["border_size"] = 2,["type"] = "subborder",["border_color"] = {1,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["authorOptions"] = {},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["selfPoint"] = "CENTER",["desaturate"] = false,["config"] = {},["alpha"] = 1,["anchorFrameParent"] = false,["width"] = 55,["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [TANK] - Woven Resonance Debuff - tank - Nymue, Weaver of the Cycle",["cooldownTextDisabled"] = false,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "Hdpd98muiw1",["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "6. Icons (high) - Nymue, Weaver of the Cycle",},["6. [MID ADD] (note)"] = {["outline"] = "OUTLINE",["xOffset"] = 0,["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 14,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg",["do_sound"] = true,},["finish"] = {["stop_sound"] = true,},["init"] = {["do_custom"] = true,["custom"] = "local keyword = \"mid\"\
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
    elogl(\"MID ADD Note Init:\",#aura_env.rotations)\
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
        \
    elseif ts and ts[\"\"] and ts[\"\"].show then\
        local count = tonumber(ts[\"\"].count)\
        if count then\
            \
            if count > #aura_env.rotations then\
                count = count % #aura_env.rotations\
            end\
            count = count == 0 and #aura_env.rotations or count\
            \
            local set = aura_env.rotations[count]\
            elogl(\"MID ADD note, count\", count, \"set\", unpack(set))\
            \
            local i = tIndexOf(set, WeakAuras.me)\
            if i then\
                elog(\"MID ASSIGNED TO ME\")\
                s[\"\"] = {\
                    show = true,\
                    changed = true,\
                    duration = 8,\
                    expirationTime = GetTime() + 8,\
                    autoHide = true,\
                    progressType = \"timed\",\
                }\
                return true\
            end\
        end\
    end\
end\
\
\
",["events"] = "ENCOUNTER_START EXRT_NOTE_UPDATE TRIGGER:2 ",["subeventPrefix"] = "SPELL",["check"] = "event",["spellIds"] = {},["unit"] = "player",["customVariables"] = "{expirationTime = true}",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "combatlog",["spellId"] = {426855,},["subeventSuffix"] = "_CAST_START",["remaining_operator"] = "<",["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["message"] = "Owl form / flare bomb",["remaining"] = "4",["duration"] = "1",["use_spellId"] = true,["use_message"] = false,["unit"] = "player",["use_remaining"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desc"] = "#mid name name\
#mid name name\
#mid name name\
\
Assign specific players to go to the Mid add in the intermission.",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2708",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["class"] = {["multi"] = {},},["use_difficulty"] = true,["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 35,["source"] = "import",["shadowXOffset"] = 1,["color"] = {1,1,1,1,},["wordWrap"] = "WordWrap",["regionType"] = "text",["conditions"] = {},["automaticWidth"] = "Auto",["internalVersion"] = 70,["parent"] = "6. Texts - Nymue, Weaver of the Cycle",["uid"] = "kbtJp7npHn2",["anchorFrameParent"] = false,["displayText_format_p_time_precision"] = 1,["authorOptions"] = {},["displayText_format_p_format"] = "timed",["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "6. [MID ADD] (note)",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["displayText"] = "MID ADD",["config"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["displayText_format_pos_format"] = "none",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["selfPoint"] = "CENTER",},["6. [LINES + DMG] - Continuum Cast - Nymue, Weaver of the Cycle"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.098039224743843,1,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "1394953",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "6. Bars - Nymue, Weaver of the Cycle",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",["zoom"] = 0,["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {420846,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["subeventPrefix"] = "SPELL",["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "LINES + DMG",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["border_anchor"] = "bar",["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "6. [LINES + DMG] - Continuum Cast - Nymue, Weaver of the Cycle",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["borderOffset"] = 5,["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["backdropColor"] = {1,1,1,0.5,},["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["rotateText"] = "NONE",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "YQvyulW5qxe",},["6. [DODGES] - Lucid Exhaust Cast - Nymue, Weaver of the Cycle (add)"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "4630447",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "6. Bars - Nymue, Weaver of the Cycle",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",["zoom"] = 0,["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {423993,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["unit"] = "nameplate",["subeventPrefix"] = "SPELL",["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["internalVersion"] = 70,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "DODGES",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "6. [DODGES] - Lucid Exhaust Cast - Nymue, Weaver of the Cycle (add)",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["borderOffset"] = 5,["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["rotateText"] = "NONE",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "Qj8BkUaSf73",},["6. [] - Unravel Debuff -  Nymue, Weaver of the Cycle"] = {["iconSource"] = -1,["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["spellIds"] = {},["type"] = "aura2",["auranames"] = {"421368",},["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["xOffset"] = 0,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["uid"] = "hI)UDyBw0LK",["frameStrata"] = 1,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [] - Unravel Debuff -  Nymue, Weaver of the Cycle",["cooldownTextDisabled"] = false,["alpha"] = 1,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["authorOptions"] = {},},["6. [prog circle] - Verdant Matrix Debuff -  Nymue, Weaver of the Cycle"] = {["user_y"] = 0,["iconSource"] = -1,["user_x"] = 0,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["foregroundColor"] = {0.13725490868092,0.98823535442352,0,0.43000000715256,},["echoVersion"] = 3,["sameTexture"] = true,["url"] = "https://echoesports.gg",["icon"] = true,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desc"] = "Progressa circle for the Lines debuff. Changes colour as you get higher stacks. ",["rotation"] = 0,["font"] = "Friz Quadrata TT",["crop_y"] = 0.41,["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["startAngle"] = 0,["useAdjustededMin"] = false,["regionType"] = "progresstexture",["blendMode"] = "BLEND",["slantMode"] = "INSIDE",["cooldownTextDisabled"] = false,["auto"] = true,["compress"] = false,["alpha"] = 1,["uid"] = "G9C59cSdW(A",["displayIcon"] = "",["backgroundOffset"] = 2,["parent"] = "6. Singles - Nymue, Weaver of the Cycle",["desaturateBackground"] = false,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["desaturateForeground"] = false,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["auranames"] = {"420554",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},},["height"] = 150,["useAdjustededMax"] = false,["fontSize"] = 12,["source"] = "import",["mirror"] = false,["zoom"] = 0,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "stacks",["value"] = "2",["op"] = "==",},["changes"] = {{["value"] = {1,0.63921570777893,0,0.59000000357628,},["property"] = "foregroundColor",},},},{["check"] = {["trigger"] = 1,["variable"] = "stacks",["op"] = ">=",["value"] = "3",},["changes"] = {{["value"] = {1,0,0,0.59000000357628,},["property"] = "foregroundColor",},},},},["xOffset"] = 0,["auraRotation"] = 0,["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",["anchorFrameParent"] = false,["backgroundColor"] = {0.50196081399918,0.50196081399918,0.50196081399918,0,},["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["frameStrata"] = 1,["anchorPoint"] = "CENTER",["id"] = "6. [prog circle] - Verdant Matrix Debuff -  Nymue, Weaver of the Cycle",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["useCooldownModRate"] = true,["width"] = 150,["desaturate"] = false,["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["class"] = {["multi"] = {},},["use_difficulty"] = true,["encounterid"] = "2708",["size"] = {["multi"] = {},},},["inverse"] = false,["config"] = {},["orientation"] = "ANTICLOCKWISE",["crop_x"] = 0.41,["cooldown"] = true,["tocversion"] = 100200,},["6. [] - Verdant Rend Debuff -  Nymue, Weaver of the Cycle"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"423842",},["fetchTooltip"] = true,["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2708",["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["xOffset"] = 0,["stickyDuration"] = false,["config"] = {},["zoom"] = 0,["anchorFrameParent"] = false,["width"] = 55,["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "6. [] - Verdant Rend Debuff -  Nymue, Weaver of the Cycle",["alpha"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",["uid"] = "YXGWpl(8i9W",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {1,1,1,1,},},["6. Weaver's Burden Simple Glow"] = {["outline"] = "OUTLINE",["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["glow_color"] = {1,0.91764712333679,0.1803921610117,1,},["glow_YOffset"] = 1,["glow_action"] = "show",["glow_thickness"] = 2,["glow_frequency"] = 0.3,["glow_frame_type"] = "UNITFRAME",["glow_type"] = "Pixel",["do_glow"] = true,["use_glow_color"] = true,["glow_XOffset"] = 1,["glow_lines"] = 12,},["finish"] = {["hide_all_glows"] = true,},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["showClones"] = true,["type"] = "aura2",["auranames"] = {"427721",},["group_role"] = {["DAMAGER"] = true,["HEALER"] = true,},["event"] = "Health",["subeventPrefix"] = "SPELL",["useName"] = true,["spellIds"] = {},["unit"] = "group",["useGroupRole"] = true,["subeventSuffix"] = "_CAST_START",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["wordWrap"] = "WordWrap",["font"] = "Friz Quadrata TT",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["size"] = {["multi"] = {},},["role"] = {["single"] = "HEALER",},["encounterid"] = "2708",["talent"] = {["multi"] = {},},["use_role"] = true,["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["fontSize"] = 12,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_time_mod_rate"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["conditions"] = {},["internalVersion"] = 70,["selfPoint"] = "BOTTOM",["displayText_format_p_time_precision"] = 1,["url"] = "https://echoesports.gg",["config"] = {},["authorOptions"] = {},["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "6. Weaver's Burden Simple Glow",["xOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "6. Simple Glows",["uid"] = "KFvp8cC8wyf",["displayText_format_p_time_dynamic_threshold"] = 60,["shadowYOffset"] = -1,["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["displayText"] = "",},});


-- 6. manifest data

journal:AddManifestData({
	{
		["echoVersion"] = 2,
		["parent"] = " Echo - Amirdrassil",
		["id"] = "6. Nymue, Weaver of the Cycle",
		["children"] = {
			"6. Singles - Nymue, Weaver of the Cycle",
			"6. Texts - Nymue, Weaver of the Cycle",
			"6. Bars - Nymue, Weaver of the Cycle",
			"6. Icons (low) - Nymue, Weaver of the Cycle",
			"6. Icons (high) - Nymue, Weaver of the Cycle",
		},
		["uid"] = "1QjcK5LgNON",
	},
	{
		["echoVersion"] = 1,
		["parent"] = "6. Nymue, Weaver of the Cycle",
		["id"] = "6. Singles - Nymue, Weaver of the Cycle",
		["children"] = {
			"6. Simple Glows",
			"6. [AIRHORN] - INSIDE AND DEBUFFED -  Nymue",
			"6. /Say on Stun",
			"6. [prog circle] - Verdant Matrix Debuff -  Nymue, Weaver of the Cycle",
			"6. Private Aura Holder 1 - Single - Nymue",
		},
		["uid"] = "YEWQVuBze5u",
	},
	{
		["echoVersion"] = 0,
		["parent"] = "6. Singles - Nymue, Weaver of the Cycle",
		["id"] = "6. Simple Glows",
		["children"] = {
			"6. Weaver's Burden Simple Glow",
			"6. Impending Loom Simple Glow",
		},
		["uid"] = "ZiA2X8XQenK",
	},
	{
		["id"] = "6. Weaver's Burden Simple Glow",
		["uid"] = "KFvp8cC8wyf",
		["parent"] = "6. Simple Glows",
		["echoVersion"] = 0,
	},
	{
		["id"] = "6. Impending Loom Simple Glow",
		["uid"] = "ehrsuSbsZWA",
		["parent"] = "6. Simple Glows",
		["echoVersion"] = 0,
	},
	{
		["id"] = "6. [AIRHORN] - INSIDE AND DEBUFFED -  Nymue",
		["uid"] = "DEmC2wyUG2J",
		["parent"] = "6. Singles - Nymue, Weaver of the Cycle",
		["echoVersion"] = 1,
	},
	{
		["id"] = "6. /Say on Stun",
		["uid"] = "G(TfJPYZbkJ",
		["parent"] = "6. Singles - Nymue, Weaver of the Cycle",
		["echoVersion"] = 0,
	},
	{
		["id"] = "6. [prog circle] - Verdant Matrix Debuff -  Nymue, Weaver of the Cycle",
		["uid"] = "G9C59cSdW(A",
		["parent"] = "6. Singles - Nymue, Weaver of the Cycle",
		["echoVersion"] = 3,
	},
	{
		["id"] = "6. Private Aura Holder 1 - Single - Nymue",
		["uid"] = "Im7jfYx0DYc",
		["parent"] = "6. Singles - Nymue, Weaver of the Cycle",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "6. Nymue, Weaver of the Cycle",
		["id"] = "6. Texts - Nymue, Weaver of the Cycle",
		["children"] = {
			"6. [RIGHT] (note)",
			"6. [LEFT] (note)",
			"6. [MID ADD] (note)",
			"6. [BOSS IMMUNE] - Nymue, Weaver of the Cycle",
			"6. [CHECK FOR FLOWERS] - add nearly dead - Nymue",
		},
		["uid"] = "ZIisQS9RE0k",
	},
	{
		["id"] = "6. [RIGHT] (note)",
		["uid"] = "bXl1LM6KT7A",
		["parent"] = "6. Texts - Nymue, Weaver of the Cycle",
		["echoVersion"] = 14,
	},
	{
		["id"] = "6. [LEFT] (note)",
		["uid"] = "E2u(5NiJwHX",
		["parent"] = "6. Texts - Nymue, Weaver of the Cycle",
		["echoVersion"] = 14,
	},
	{
		["id"] = "6. [MID ADD] (note)",
		["uid"] = "kbtJp7npHn2",
		["parent"] = "6. Texts - Nymue, Weaver of the Cycle",
		["echoVersion"] = 14,
	},
	{
		["id"] = "6. [BOSS IMMUNE] - Nymue, Weaver of the Cycle",
		["uid"] = "(Y(bPGAj9Ct",
		["parent"] = "6. Texts - Nymue, Weaver of the Cycle",
		["echoVersion"] = 2,
	},
	{
		["id"] = "6. [CHECK FOR FLOWERS] - add nearly dead - Nymue",
		["uid"] = "aKo6A85xuRs",
		["parent"] = "6. Texts - Nymue, Weaver of the Cycle",
		["echoVersion"] = 0,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "6. Nymue, Weaver of the Cycle",
		["id"] = "6. Bars - Nymue, Weaver of the Cycle",
		["children"] = {
			"6. [RAIN] - Viridian Rain Cast - Nymue, Weaver of the Cycle",
			"6. [INTERMISSION] - Full Bloom Cast - Nymue, Weaver of the Cycle",
			"6. [STUN THREADS] - Impending Loom Cast - Nymue, Weaver of the Cycle",
			"6. [DODGES] - Lucid Exhaust Cast - Nymue, Weaver of the Cycle (add)",
			"6. [FRONTAL] - Lumbering Slam Cast - Nymue, Weaver of the Cycle (add)",
			"6. [LINES + DMG] - Continuum Cast - Nymue, Weaver of the Cycle",
		},
		["uid"] = "rMQKqXjkt0a",
	},
	{
		["id"] = "6. [RAIN] - Viridian Rain Cast - Nymue, Weaver of the Cycle",
		["uid"] = "gUx8t6NETSk",
		["parent"] = "6. Bars - Nymue, Weaver of the Cycle",
		["echoVersion"] = 2,
	},
	{
		["id"] = "6. [INTERMISSION] - Full Bloom Cast - Nymue, Weaver of the Cycle",
		["uid"] = "r)36NFbQcQg",
		["parent"] = "6. Bars - Nymue, Weaver of the Cycle",
		["echoVersion"] = 2,
	},
	{
		["id"] = "6. [STUN THREADS] - Impending Loom Cast - Nymue, Weaver of the Cycle",
		["uid"] = "wdmBAOw90IC",
		["parent"] = "6. Bars - Nymue, Weaver of the Cycle",
		["echoVersion"] = 2,
	},
	{
		["id"] = "6. [DODGES] - Lucid Exhaust Cast - Nymue, Weaver of the Cycle (add)",
		["uid"] = "Qj8BkUaSf73",
		["parent"] = "6. Bars - Nymue, Weaver of the Cycle",
		["echoVersion"] = 2,
	},
	{
		["id"] = "6. [FRONTAL] - Lumbering Slam Cast - Nymue, Weaver of the Cycle (add)",
		["uid"] = "ydbLa8x)(5V",
		["parent"] = "6. Bars - Nymue, Weaver of the Cycle",
		["echoVersion"] = 2,
	},
	{
		["id"] = "6. [LINES + DMG] - Continuum Cast - Nymue, Weaver of the Cycle",
		["uid"] = "YQvyulW5qxe",
		["parent"] = "6. Bars - Nymue, Weaver of the Cycle",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "6. Nymue, Weaver of the Cycle",
		["id"] = "6. Icons (low) - Nymue, Weaver of the Cycle",
		["children"] = {
			"6. [] - Verdant Rend Debuff -  Nymue, Weaver of the Cycle",
			"6. [DON'T MID] - Lucid Vulnerability Debuff -  Nymue, Weaver of the Cycle",
			"6. [FLOWERS UP] - Surging Growth Debuff - Nymue, Weaver of the Cycle",
			"6. [DOT] - Weaver's Burden (post-bomb) Debuff - Nymue, Weaver of the Cycle",
			"6. [DOT] - Ephemeral Flora Debuff - Nymue, Weaver of the Cycle",
			"6. [SAFE] - Inflorescence Debuff - Nymue, Weaver of the Cycle",
			"6. [INSIDE] - Lucid Miasma Debuff -  Nymue, Weaver of the Cycle",
			"6. [] - Unravel Debuff -  Nymue, Weaver of the Cycle",
		},
		["uid"] = "jeysElZBOXa",
	},
	{
		["id"] = "6. [] - Verdant Rend Debuff -  Nymue, Weaver of the Cycle",
		["uid"] = "YXGWpl(8i9W",
		["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 1,
	},
	{
		["id"] = "6. [DON'T MID] - Lucid Vulnerability Debuff -  Nymue, Weaver of the Cycle",
		["uid"] = "oC2My4qLyb3",
		["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 1,
	},
	{
		["id"] = "6. [FLOWERS UP] - Surging Growth Debuff - Nymue, Weaver of the Cycle",
		["uid"] = "(gPOp0e53kz",
		["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 1,
	},
	{
		["id"] = "6. [DOT] - Weaver's Burden (post-bomb) Debuff - Nymue, Weaver of the Cycle",
		["uid"] = "14krlpPd1C2",
		["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 1,
	},
	{
		["id"] = "6. [DOT] - Ephemeral Flora Debuff - Nymue, Weaver of the Cycle",
		["uid"] = "sfethVWbd64",
		["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 1,
	},
	{
		["id"] = "6. [SAFE] - Inflorescence Debuff - Nymue, Weaver of the Cycle",
		["uid"] = "aFjqwcU1akY",
		["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 3,
	},
	{
		["id"] = "6. [INSIDE] - Lucid Miasma Debuff -  Nymue, Weaver of the Cycle",
		["uid"] = "wySmc0fWYCi",
		["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 2,
	},
	{
		["id"] = "6. [] - Unravel Debuff -  Nymue, Weaver of the Cycle",
		["uid"] = "hI)UDyBw0LK",
		["parent"] = "6. Icons (low) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "6. Nymue, Weaver of the Cycle",
		["id"] = "6. Icons (high) - Nymue, Weaver of the Cycle",
		["children"] = {
			"6. Private Aura Holder 1 - Nymue",
			"6. [RAIN] - Viridian Rain Uptime - Nymue, Weaver of the Cycle",
			"6. [DOT] - Verdant Matrix Debuff -  Nymue, Weaver of the Cycle",
			"6. [STUN] - Impending Loom Debuff - Nymue, Weaver of the Cycle",
			"6. [TANK] - Woven Resonance Debuff - tank - Nymue, Weaver of the Cycle",
		},
		["uid"] = "2v9FgrYvb(8",
	},
	{
		["id"] = "6. Private Aura Holder 1 - Nymue",
		["uid"] = "(vgOhvUw6sw",
		["parent"] = "6. Icons (high) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 2,
	},
	{
		["id"] = "6. [RAIN] - Viridian Rain Uptime - Nymue, Weaver of the Cycle",
		["uid"] = "GcyyznAIxiL",
		["parent"] = "6. Icons (high) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 1,
	},
	{
		["id"] = "6. [DOT] - Verdant Matrix Debuff -  Nymue, Weaver of the Cycle",
		["uid"] = "(BE5aH1LflK",
		["parent"] = "6. Icons (high) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 3,
	},
	{
		["id"] = "6. [STUN] - Impending Loom Debuff - Nymue, Weaver of the Cycle",
		["uid"] = "R2X(VVxQbmO",
		["parent"] = "6. Icons (high) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 1,
	},
	{
		["id"] = "6. [TANK] - Woven Resonance Debuff - tank - Nymue, Weaver of the Cycle",
		["uid"] = "Hdpd98muiw1",
		["parent"] = "6. Icons (high) - Nymue, Weaver of the Cycle",
		["echoVersion"] = 1,
	},
},1207,0);

--fixUpNestedPreview(6,1207,"6. Nymue, Weaver of the Cycle");