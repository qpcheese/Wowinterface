
local _AddonName, _EchoRaidTools = ...;

local journal = _EchoRaidTools:GetModule("waJournal");

-- 7. export data

journal:AddImportData({["7. Fixate List"] = {["arcLength"] = 360,["controlledChildren"] = {"7. Fixate List (MACRO) - Smolderon",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "7. Singles - Smolderon",["preferToUpdate"] = false,["yOffset"] = 52.999877929688,["sortHybridTable"] = {["7. Fixate List (MACRO) - Smolderon"] = false,},["echoVersion"] = 2,["borderColor"] = {0,0,0,1,},["space"] = 2,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["rotation"] = 0,["subRegions"] = {},["xOffset"] = -417.99981689453,["stagger"] = 0,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["selfPoint"] = "TOP",["backdropColor"] = {1,1,1,0.5,},["radius"] = 200,["animate"] = false,["grow"] = "DOWN",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["sort"] = "none",["borderInset"] = 1,["limit"] = 5,["authorOptions"] = {},["frameStrata"] = 1,["constantFactor"] = "RADIUS",["gridType"] = "RD",["borderOffset"] = 4,["stepAngle"] = 15,["tocversion"] = 100200,["id"] = "7. Fixate List",["config"] = {},["gridWidth"] = 5,["anchorFrameType"] = "SCREEN",["anchorPoint"] = "CENTER",["uid"] = "37WlR2kb6BN",["fullCircle"] = true,["rowSpace"] = 1,["source"] = "import",["conditions"] = {},["information"] = {},["useLimit"] = false,},["7 .[DOT] - Inferno Debuff - Smolderon"] = {["iconSource"] = -1,["parent"] = "7. Icons (high) - Smolderon",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"430325",},["fetchTooltip"] = false,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip2_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["authorOptions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["uid"] = "qBcHgdDOv1x",["frameStrata"] = 1,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "7 .[DOT] - Inferno Debuff - Smolderon",["cooldownTextDisabled"] = false,["alpha"] = 1,["width"] = 55,["xOffset"] = 0,["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["color"] = {1,1,1,1,},},["7. Private Aura Holder - Smolderon"] = {["iconSource"] = -1,["wagoID"] = "n3lAhBYxn",["parent"] = "7. Singles - Smolderon",["preferToUpdate"] = false,["yOffset"] = 50,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["custom_type"] = "stateupdate",["type"] = "custom",["use_alwaystrue"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_absorbMode"] = true,["event"] = "Conditions",["use_unit"] = true,["use_absorbHealMode"] = true,["custom"] = "function(a)\
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
end",["spellIds"] = {},["events"] = "",["check"] = "event",["names"] = {},["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%index",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowXOffset"] = 0,["anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_p_time_precision"] = 1,["text_shadowYOffset"] = 0,["text_visible"] = false,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorYOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_fontSize"] = 72,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_format"] = "timed",},},["height"] = 150,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["regionType"] = "icon",["selfPoint"] = "CENTER",["cooldown"] = false,["cooldownEdge"] = false,["xOffset"] = 409.00073242188,["color"] = {1,1,1,1,},["uid"] = "EOWbe)SPthO",["useCooldownModRate"] = true,["zoom"] = 0,["semver"] = "1.0.5",["tocversion"] = 100200,["id"] = "7. Private Aura Holder - Smolderon",["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["width"] = 150,["alpha"] = 1,["config"] = {},["inverse"] = false,["cooldownTextDisabled"] = true,["authorOptions"] = {},["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "customcheck",["value"] = "function()\
    return not WeakAuras.IsOptionsOpen()\
end",},["changes"] = {{["value"] = {1,1,1,0,},["property"] = "color",},{["property"] = "sub.2.text_visible",},},},},["information"] = {},["actions"] = {["start"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
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
end",["do_custom"] = true,},},},["7. [MOVE] - Smoldering Ground Debuff - Smolderon"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"421532",},["fetchTooltip"] = false,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "MOVE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorPoint"] = "OUTER_BOTTOM",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "7. Icons (low) - Smolderon",["selfPoint"] = "CENTER",["uid"] = "hn414olt1QP",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "7. [MOVE] - Smoldering Ground Debuff - Smolderon",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},["7. Bars - Smolderon"] = {["arcLength"] = 360,["controlledChildren"] = {"7. [SOAK] - Brand of Damnation Cast - Smolderon","7. [BAITS] - Lava Geysers Cast - Smolderon","7. [KNOCKBACK] - World In Flames Cast - Smolderon","7. [BOMB] - Searing Aftermath on Tank - Smolderon",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["selfPoint"] = "TOP",["align"] = "CENTER",["rotation"] = 0,["space"] = 2,["useLimit"] = false,["subRegions"] = {},["borderInset"] = 1,["sortHybridTable"] = {["7. [TICKER] - World In Flames - Smolderon"] = false,["7. [TICKS ON BAR] - World In Flames Channel - Smolderon"] = false,["7. [BAITS] - Lava Geysers Cast - Smolderon"] = false,["7. [KNOCKBACK] - World In Flames Cast - Smolderon"] = false,["7. [BOMB] - Searing Aftermath on Tank - Smolderon"] = false,["7. [SOAK] - Brand of Damnation Cast - Smolderon"] = false,},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["authorOptions"] = {},["backdropColor"] = {1,1,1,0.5,},["uid"] = "4YHJuThuFky",["animate"] = false,["source"] = "import",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["stepAngle"] = 15,["borderSize"] = 2,["limit"] = 5,["anchorFrameFrame"] = "WeakAuras:Bars - Anchor [AMIR]",["gridWidth"] = 5,["grow"] = "DOWN",["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["sort"] = "none",["borderOffset"] = 4,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["tocversion"] = 100200,["id"] = "7. Bars - Smolderon",["regionType"] = "dynamicgroup",["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["parent"] = "7. Smolderon",["config"] = {},["gridType"] = "RD",["fullCircle"] = true,["internalVersion"] = 70,["conditions"] = {},["information"] = {},["stagger"] = 0,},["7. [500%] - Seeking Inferno Debuff - Smolderon"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = false,["useExactSpellId"] = true,["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["auraspellids"] = {"426018",},["auranames"] = {"426018",},["spellIds"] = {},["unit"] = "player",["subeventSuffix"] = "_CAST_START",["type"] = "aura2",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["authorOptions"] = {},["selfPoint"] = "CENTER",["uid"] = "GpiP)YeRO0I",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "7. [500%] - Seeking Inferno Debuff - Smolderon",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["parent"] = "7. Icons (high) - Smolderon",["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["color"] = {1,1,1,1,},},["7. Overheated Glow"] = {["outline"] = "OUTLINE",["parent"] = "7, Simple Healer Glows",["displayText"] = "",["yOffset"] = 2000,["anchorPoint"] = "CENTER",["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["glow_lines"] = 12,["glow_thickness"] = 2,["glow_XOffset"] = 1,["glow_YOffset"] = 1,["do_glow"] = true,["glow_frame_type"] = "UNITFRAME",["glow_type"] = "Pixel",["glow_frequency"] = 0.1,["use_glow_color"] = true,["glow_action"] = "show",["glow_color"] = {0.97254908084869,0.61960786581039,0,1,},},["finish"] = {["hide_all_glows"] = true,},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["showClones"] = true,["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["unit"] = "group",["useName"] = true,["names"] = {},["auranames"] = {"421455",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["selfPoint"] = "BOTTOM",["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["subRegions"] = {{["type"] = "subbackground",},},["height"] = 1,["rotate"] = false,["load"] = {["size"] = {["multi"] = {},},["role"] = {["single"] = "HEALER",},["encounterid"] = "2824",["talent"] = {["multi"] = {},},["use_role"] = true,["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["displayText_format_p_time_legacy_floor"] = false,["displayText_format_p_time_mod_rate"] = true,["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["source"] = "import",["conditions"] = {},["shadowXOffset"] = 1,["automaticWidth"] = "Auto",["mirror"] = false,["preferToUpdate"] = false,["regionType"] = "texture",["shadowYOffset"] = -1,["blendMode"] = "BLEND",["config"] = {},["fontSize"] = 12,["width"] = 1,["displayText_format_p_time_precision"] = 1,["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["alpha"] = 1,["color"] = {0.97254908084869,0.61960786581039,0,1,},["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "7. Overheated Glow",["xOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["wordWrap"] = "WordWrap",["uid"] = "okl(axKd42d",["authorOptions"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["7. Intermission Pattern Starting"] = {["outline"] = "OUTLINE",["parent"] = "7. Texts - Smolderon",["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["unit"] = "player",["custom"] = "function(s,e,intermission)\
    if intermission then\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            intermission = intermission,\
            autoHide = true,\
            duration = 4,\
        }\
        return true\
    end\
end\
\
\
",["events"] = "ECHO_SMOLDERON_INTERMISSION_START",["custom_type"] = "stateupdate",["check"] = "event",["names"] = {},["spellIds"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["selfPoint"] = "BOTTOM",["desc"] = "Shows which pattern is starting at the start of an intermission\
",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_encounterid"] = true,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["size"] = {["multi"] = {},},},["fontSize"] = 30,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "preset",["easeType"] = "none",["duration_type"] = "seconds",["preset"] = "fade",["easeStrength"] = 3,},},["fixedWidth"] = 200,["wordWrap"] = "WordWrap",["xOffset"] = 0,["displayText_format_p_time_precision"] = 1,["color"] = {1,1,1,1,},["uid"] = "mimwMIvb3v8",["authorOptions"] = {},["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "7. Intermission Pattern Starting",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["displayText_format_intermission_format"] = "none",["config"] = {},["displayText"] = "PATTERN %intermission",["displayText_format_p_time_mod_rate"] = true,["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,},["7. Texts - Smolderon"] = {["arcLength"] = 360,["controlledChildren"] = {"7. Intermission Pattern Starting","7. Warning for next soaks","7. [SOAK ORBS] - Smolderon ",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["fullCircle"] = true,["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["useLimit"] = false,["align"] = "CENTER",["stagger"] = 0,["xOffset"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["radius"] = 200,["rowSpace"] = 1,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["gridType"] = "RD",["backdropColor"] = {1,1,1,0.5,},["borderInset"] = 1,["animate"] = false,["parent"] = "7. Smolderon",["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Texts - Anchor [AMIR]",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["borderEdge"] = "Square Full White",["frameStrata"] = 1,["grow"] = "DOWN",["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["selfPoint"] = "TOP",["tocversion"] = 100200,["id"] = "7. Texts - Smolderon",["regionType"] = "dynamicgroup",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["config"] = {},["uid"] = "kkzJNfD(itA",["sortHybridTable"] = {["7. [SOAK ORBS] - Smolderon "] = false,["7. Intermission Pattern Starting"] = false,["7. Warning for next soaks"] = false,},["source"] = "import",["borderColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["rotation"] = 0,},["7. Absorb Healthpot/HS - Smolderon"] = {["sparkWidth"] = 10,["iconSource"] = 0,["authorOptions"] = {},["displayText"] = "HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT\
HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT   HEALTHPOT",["yOffset"] = 22,["anchorPoint"] = "CENTER",["echoVersion"] = 7,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {["do_custom"] = false,},},["icon_color"] = {1,1,1,1,},["keepAspectRatio"] = false,["wordWrap"] = "WordWrap",["barColor"] = {0.258823543787,0,1,1,},["desaturate"] = false,["font"] = "Friz Quadrata TT",["sparkOffsetY"] = 0,["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2824",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["use_spellknown"] = false,["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["spellknown"] = 116841,["size"] = {["multi"] = {},},},["shadowXOffset"] = 1,["useAdjustededMin"] = false,["regionType"] = "icon",["displayText_format_unit_color"] = "class",["texture"] = "Minimalist",["displayText_format_spell_format"] = "none",["cooldownTextDisabled"] = false,["spark"] = false,["tocversion"] = 100200,["displayText_format_unit_format"] = "Unit",["alpha"] = 1,["config"] = {},["displayIcon"] = "4497595",["outline"] = "OUTLINE",["sparkOffsetX"] = 0,["parent"] = "7. Singles - Smolderon",["shadowYOffset"] = -1,["displayText_format_unit_abbreviate_max"] = 8,["cooldownSwipe"] = true,["customTextUpdate"] = "event",["cooldownEdge"] = false,["triggers"] = {[1] = {["trigger"] = {["itemName"] = 5512,["subeventSuffix"] = "_CAST_START",["use_genericShowOn"] = true,["genericShowOn"] = "showOnReady",["subeventPrefix"] = "SPELL",["use_itemName"] = true,["spellIds"] = {},["names"] = {},["event"] = "Cooldown Progress (Item)",["unit"] = "player",["type"] = "item",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "item",["subeventSuffix"] = "_CAST_START",["use_genericShowOn"] = true,["use_itemName"] = true,["names"] = {},["genericShowOn"] = "showOnReady",["spellIds"] = {},["itemName"] = 191380,["event"] = "Cooldown Progress (Item)",["subeventPrefix"] = "SPELL",["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["names"] = {},["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["realSpellName"] = "Exhilaration",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["unit"] = "player",["type"] = "spell",["use_track"] = true,["spellName"] = 109304,},["untrigger"] = {},},[4] = {["trigger"] = {["spellName"] = 19236,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_genericShowOn"] = true,["use_itemName"] = true,["names"] = {},["realSpellName"] = "Desperate Prayer",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[5] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["realSpellName"] = "Impending Victory",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["names"] = {},["type"] = "spell",["use_track"] = true,["spellName"] = 202168,},["untrigger"] = {},},[6] = {["trigger"] = {["spellName"] = 185311,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["names"] = {},["use_genericShowOn"] = true,["use_itemName"] = true,["subeventPrefix"] = "SPELL",["realSpellName"] = "Crimson Vial",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[7] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["names"] = {},["realSpellName"] = "Mortal Coil",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["subeventPrefix"] = "SPELL",["type"] = "spell",["use_track"] = true,["spellName"] = 6789,},["untrigger"] = {},},[8] = {["trigger"] = {["spellName"] = 633,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["use_itemName"] = true,["unit"] = "player",["realSpellName"] = "Lay on Hands",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["names"] = {},["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[9] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["names"] = {},["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["realSpellName"] = "Flash Heal",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["unit"] = "player",["type"] = "spell",["use_track"] = true,["spellName"] = 2061,},["untrigger"] = {},},[10] = {["trigger"] = {["spellName"] = 116670,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_genericShowOn"] = true,["use_itemName"] = true,["names"] = {},["realSpellName"] = "Vivify",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[11] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["realSpellName"] = "Renewal",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["names"] = {},["type"] = "spell",["use_track"] = true,["spellName"] = 108238,},["untrigger"] = {},},[12] = {["trigger"] = {["spellName"] = 8936,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["names"] = {},["use_genericShowOn"] = true,["use_itemName"] = true,["subeventPrefix"] = "SPELL",["realSpellName"] = "Regrowth",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[13] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["names"] = {},["realSpellName"] = "Healing Surge",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["subeventPrefix"] = "SPELL",["type"] = "spell",["use_track"] = true,["spellName"] = 8004,},["untrigger"] = {},},[14] = {["trigger"] = {["spellName"] = 48743,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["use_itemName"] = true,["unit"] = "player",["realSpellName"] = "Death Pact",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["names"] = {},["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[15] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["names"] = {},["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["realSpellName"] = "Death Strike",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["unit"] = "player",["type"] = "spell",["use_track"] = true,["spellName"] = 49998,},["untrigger"] = {},},[16] = {["trigger"] = {["spellName"] = 360995,["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["use_genericShowOn"] = true,["use_itemName"] = true,["names"] = {},["realSpellName"] = "Verdant Embrace",["use_spellName"] = true,["spellIds"] = {},["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["type"] = "spell",["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[17] = {["trigger"] = {["debuffType"] = "HELPFUL",["itemName"] = 191380,["genericShowOn"] = "showOnReady",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["realSpellName"] = "Emerald Blossom",["use_spellName"] = true,["spellIds"] = {},["use_itemName"] = true,["names"] = {},["type"] = "spell",["use_track"] = true,["spellName"] = 355913,},["untrigger"] = {},},[18] = {["trigger"] = {["rem"] = "1",["auranames"] = {"Frozen Shroud",},["names"] = {},["group_count"] = "0",["debuffType"] = "HARMFUL",["group_countOperator"] = ">",["type"] = "aura2",["unit"] = "player",["auraspellids"] = {"421656",},["custom_type"] = "stateupdate",["check"] = "event",["event"] = "Health",["useGroup_count"] = true,["events"] = "CLEU_SPELL_AURA_APPLIED ECHO_FULMINATING_FREEDOM_ASSIGN",["useName"] = false,["spellIds"] = {},["useExactSpellId"] = true,["remOperator"] = "<=",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["useRem"] = false,},["untrigger"] = {},},[19] = {["trigger"] = {["type"] = "addons",["spellId"] = "422577",["remaining_operator"] = "<",["event"] = "Boss Mod Timer",["unit"] = "player",["use_spellId"] = true,["use_remaining"] = true,["remaining"] = "1",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) \
    if t[18] and t[19] then\
        for i = 1, 17 do\
            if t[i] then\
                return true\
            end\
        end\
    end\
end\
\
\
",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "preset",["easeType"] = "none",["duration_type"] = "seconds",["preset"] = "alphaPulse",["easeStrength"] = 3,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["preferToUpdate"] = false,["cooldown"] = true,["selfPoint"] = "CENTER",["shadowColor"] = {0,0,0,1,},["subRegions"] = {{["type"] = "subbackground",},{["glowFrequency"] = 0.25,["glow"] = true,["useGlowColor"] = false,["glowType"] = "Proc",["glowLength"] = 10,["type"] = "subglow",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowStartAnim"] = true,["glowXOffset"] = 0,["glowDuration"] = 0.4,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 200,["backgroundColor"] = {0,0,0,0.5,},["icon"] = true,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["fontSize"] = 30,["source"] = "import",["displayText_format_unit_realm_name"] = "never",["sparkRotationMode"] = "AUTO",["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["displayText_format_p_time_format"] = 0,["sparkHidden"] = "NEVER",["automaticWidth"] = "Auto",["zoom"] = 0,["icon_side"] = "RIGHT",["fixedWidth"] = 200,["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["displayText_format_p_time_precision"] = 1,["displayText_format_p_time_legacy_floor"] = false,["sparkHeight"] = 30,["uid"] = "hRCZvcYp7L8",["justify"] = "LEFT",["color"] = {1,1,1,1,},["id"] = "7. Absorb Healthpot/HS - Smolderon",["xOffset"] = 273,["frameStrata"] = 1,["width"] = 200,["displayText_format_p_time_dynamic_threshold"] = 60,["displayText_format_unit_abbreviate"] = false,["inverse"] = false,["displayText_format_p_time_mod_rate"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,},["sparkColor"] = {1,1,1,1,},},["7. Smart Healer Glows"] = {["controlledChildren"] = {"7. Assign healers to absorbs",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "7. Singles - Smolderon",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "7. Smart Healer Glows",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["borderInset"] = 1,["uid"] = "Q3NFyT9Oa9Z",["authorOptions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["conditions"] = {},["information"] = {},["config"] = {},},["7. Singles - Smolderon"] = {["controlledChildren"] = {"Set Private Aura Text to LARGE","7. Fixate List","7. Fixate ASSIGN MAIN","7. Intermission Tick Display","7, Simple Healer Glows","7. Smart Healer Glows","7. Overheated Progress - Smolderon (simple)","7. Cauterizing Wound Bars","7. Private Aura Holder - Smolderon","7. Absorb Healthpot/HS - Smolderon",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "7. Singles - Smolderon",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "7. Smolderon",["config"] = {},["uid"] = "uoqrvri(Jl0",["authorOptions"] = {},["borderInset"] = 1,["conditions"] = {},["information"] = {},["selfPoint"] = "CENTER",},["7. [BAITS] - Lava Geysers Cast - Smolderon"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,1,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "451169",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "7. Bars - Smolderon",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["uid"] = "iK1hjvwHMBP",["borderInset"] = 11,["sparkRotationMode"] = "AUTO",["borderBackdrop"] = "Blizzard Tooltip",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {422691,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["use_unit"] = true,["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["subeventPrefix"] = "SPELL",["names"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["internalVersion"] = 70,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["displayTextLeft"] = "%n",["stickyDuration"] = false,["width"] = 240,["customText"] = "function()\
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
",["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BAITS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["border_anchor"] = "bar",["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["id"] = "7. [BAITS] - Lava Geysers Cast - Smolderon",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["zoom"] = 0,["source"] = "import",["timerSize"] = 12,["auto"] = true,["textFlags"] = "None",["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["color"] = {},["authorOptions"] = {},["anchorFrameParent"] = false,["icon"] = true,["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["inverse"] = false,["borderOffset"] = 5,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["config"] = {},},["7. [SOAK] - Brand of Damnation Cast - Smolderon"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["zoom"] = 0,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "510053",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "7. Bars - Smolderon",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "qou2mXYlema",["textSize"] = 12,["customTextUpdate"] = "update",["sparkRotationMode"] = "AUTO",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {421343,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["subeventPrefix"] = "SPELL",["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["use_unit"] = true,["names"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["borderInset"] = 11,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["adjustedMax"] = "4",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["timer"] = true,["borderOffset"] = 5,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SOAK %destUnit",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_destUnit_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["text_text_format_destUnit_format"] = "Unit",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destUnit_color"] = "class",["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,["text_text_format_destUnit_abbreviate"] = false,["text_text_format_destUnit_abbreviate_max"] = 8,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["icon"] = true,["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["authorOptions"] = {},["color"] = {},["anchorFrameParent"] = false,["textFlags"] = "None",["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["borderBackdrop"] = "Blizzard Tooltip",["id"] = "7. [SOAK] - Brand of Damnation Cast - Smolderon",["adjustedMin"] = "4",["frameStrata"] = 1,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["config"] = {},},["7. Cauterizing Wound ABSORB Bar - Smolderon"] = {["user_y"] = 0,["stacksSize"] = 12,["iconSource"] = -1,["user_x"] = 0,["authorOptions"] = {},["adjustedMax"] = "4",["yOffset"] = 13,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["sparkRotation"] = 0,["sameTexture"] = true,["url"] = "https://echoesports.gg",["icon"] = false,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["encounterid"] = "2824",["size"] = {["multi"] = {},},},["preferToUpdate"] = false,["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["cooldown"] = true,["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_10px.tga",["conditions"] = {},["tocversion"] = 100200,["smoothProgress"] = false,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["blendMode"] = "BLEND",["cooldownTextDisabled"] = false,["borderInset"] = 11,["slantMode"] = "INSIDE",["spark"] = false,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["auto"] = true,["compress"] = false,["startAngle"] = 0,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["width"] = 240,["frameStrata"] = 1,["sparkColor"] = {1,1,1,1,},["uid"] = "hS9wg68KSeo",["sparkHidden"] = "NEVER",["backgroundColor"] = {0,0,0,0.33132427930832,},["displayIcon"] = "",["displayTextRight"] = "%p",["textColor"] = {1,1,1,1,},["borderColor"] = {1,1,1,0.5,},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkOffsetX"] = 0,["rotateText"] = "NONE",["color"] = {},["sparkWidth"] = 3,["adjustedMin"] = "4",["stacksFlags"] = "None",["textFlags"] = "None",["desaturateBackground"] = false,["cooldownSwipe"] = true,["desaturateForeground"] = false,["customTextUpdate"] = "event",["cooldownEdge"] = false,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"421656",},["fetchTooltip"] = true,["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 70,["textSize"] = 12,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderInFront"] = false,["stickyDuration"] = false,["auraRotation"] = 0,["height"] = 18,["mirror"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},{["text_shadowXOffset"] = 1,["text_text"] = "%c%tooltip1",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "CENTER",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_text_format_tooltip1_format"] = "BigNumber",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_fontType"] = "None",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_CENTER",["text_text_format_c_format"] = "none",["text_text_format_n_format"] = "none",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",},},["timer"] = true,["timerFlags"] = "None",["backdropColor"] = {1,1,1,0.5,},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",["source"] = "import",["fontSize"] = 12,["parent"] = "7. Cauterizing Wound Bars",["config"] = {},["border"] = false,["borderEdge"] = "None",["borderBackdrop"] = "Blizzard Tooltip",["borderSize"] = 16,["backgroundOffset"] = 0,["icon_side"] = "LEFT",["sparkRotationMode"] = "AUTO",["xOffset"] = 0,["sparkHeight"] = 14,["customText"] = "function()\
    if WeakAuras.IsOptionsOpen() then\
        aura_env.region:SetDurationInfo(123123, 321321, true)\
    end\
    if aura_env.states[1].show and aura_env.states[1].tooltip1 then\
        if not aura_env.max then\
            aura_env.max = aura_env.states[1].tooltip1\
        end\
        --elog(\"absorb\", aura_env.states[1].tooltip1)\
        aura_env.region:SetDurationInfo(aura_env.states[1].tooltip1, aura_env.max, true)\
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
",["foregroundColor"] = {0,1,0.4078431725502,0.27108365297318,},["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["actions"] = {["start"] = {},["init"] = {},["finish"] = {["do_custom"] = true,["custom"] = "aura_env.max = nil",},},["id"] = "7. Cauterizing Wound ABSORB Bar - Smolderon",["crop_y"] = 0.41,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["timerColor"] = {1,1,1,1,},["inverse"] = false,["zoom"] = 0,["orientation"] = "HORIZONTAL",["crop_x"] = 0.41,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["stacksFont"] = "Friz Quadrata TT",},["7. [SOAK ORBS] - Smolderon "] = {["outline"] = "OUTLINE",["color"] = {1,1,1,1,},["displayText"] = "SOAK ORBS %s/5",["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["message"] = "PICK UP ORBS",["message_tts_voice"] = 0,["do_message"] = false,["message_type"] = "TTS",},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["stacksOperator"] = "<",["useName"] = true,["useStacks"] = true,["auranames"] = {"421858",},["unit"] = "player",["duration"] = "5",["event"] = "Combat Log",["names"] = {},["type"] = "aura2",["stacks"] = "5",["spellIds"] = {},["subeventPrefix"] = "SPELL",["use_spellId"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["spellId"] = {422172,},["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["wordWrap"] = "WordWrap",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["size"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["displayText_format_s_format"] = "none",["fontSize"] = 30,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["preferToUpdate"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["fixedWidth"] = 200,["internalVersion"] = 70,["displayText_format_p_time_precision"] = 1,["displayText_format_p_time_mod_rate"] = true,["xOffset"] = 0,["uid"] = "Q3A50DLwTf9",["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "7. [SOAK ORBS] - Smolderon ",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "7. Texts - Smolderon",["config"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["authorOptions"] = {},["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["selfPoint"] = "BOTTOM",},["7. Fixate List (MACRO) - Smolderon"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["sparkRotation"] = 0,["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.27108365297318,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.98039221763611,1,0,1,},["desc"] = "Just a display of the fixate order from `7. Fixate ASSIGN MAIN`",["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["auto"] = true,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = ")iZqHK0lWuH",["displayIcon"] = 841383,["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "7. Fixate List",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkRotationMode"] = "AUTO",["spark"] = false,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["names"] = {},["spellIds"] = {},["events"] = "ECHO_SMOLDERON_FIXATE_LIST CLEU:SPELL_AURA_APPLIED:SPELL_AURA_APPLIED_DOSE:SPELL_AURA_REFRESH ENCOUNTER_START UNIT_SPELLCAST_SUCCEEDED:boss1 ",["custom_type"] = "stateupdate",["check"] = "event",["custom"] = "function(s,e,...)\
    \
    \
    if e == \"UNIT_SPELLCAST_SUCCEEDED\" then\
        local unit, _, spellID = ...\
        if spellID == 426144 then\
            aura_env.expiration = GetTime() + 30\
            aura_env.pops = 0\
        end\
        \
    elseif e == \"ECHO_SMOLDERON_FIXATE_LIST\" and ... then\
        local names = {...}\
        local start = aura_env.pops and aura_env.pops+1 or 1\
        for i = start, #names do\
            if names[i] then\
                s[i] = {\
                    show = true,\
                    changed = true,\
                    duration = aura_env.expiration - GetTime(),\
                    expirationTime = aura_env.expiration,\
                    autoHide = true,\
                    unit = names[i],\
                    index = i,\
                    progressType = \"static\", \
                    value = 1,\
                    total = 1,\
                }\
            end\
        end\
        return true\
        \
    elseif e == \"COMBAT_LOG_EVENT_UNFILTERED\" then\
        local _, subEvent, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID = ...\
        if spellID == 426018 and (not aura_env.last or GetTime() - aura_env.last > 0.1) then \
            aura_env.last = GetTime()\
            aura_env.pops = aura_env.pops and aura_env.pops + 1 or 1\
            for i = 1, 6 do\
                if s[i] then\
                    s[i].changed = true\
                    s[i].duration = 4 \
                    s[i].expirationTime = GetTime() + 3\
                    s[i].autoHide = true\
                    s[i].progressType = \"timed\"\
                    s[i].debuff = true\
                    return true\
                end\
            end\
            if aura_env.pops == 4 then\
                WeakAuras.ScanEvents(\"ECHO_SMOLD_FIXATE_DONE\", true)\
            end\
        end\
    end\
end\
\
\
\
",["unit"] = "player",["customVariables"] = "{debuff = \"bool\"}",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 70,["stacksFont"] = "Friz Quadrata TT",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkOffsetX"] = 0,["stickyDuration"] = false,["displayTextLeft"] = "%n",["height"] = 20,["anchorFrameType"] = "SCREEN",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["border_anchor"] = "bar",["type"] = "subborder",["text_text"] = "",["border_size"] = 1,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_time_format"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "None",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 14,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["text_shadowXOffset"] = 1,["text_text_format_1.unit_abbreviate"] = false,["text_text"] = "%index %1.unit",["text_text_format_1.unitName_color"] = "class",["text_text_format_1.unit_abbreviate_max"] = 8,["text_shadowColor"] = {0,0,0,1,},["text_text_format_1.unitName_abbreviate"] = false,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_justify"] = "CENTER",["anchorYOffset"] = 0,["text_text_format_1.unitName_abbreviate_max"] = 8,["text_text_format_1.raidMark_format"] = "none",["text_text_format_affected_format"] = "none",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unit_color"] = "class",["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unit_format"] = "Unit",["text_text_format_1.unit_realm_name"] = "never",["text_fontSize"] = 14,["anchorXOffset"] = 0,["rotateText"] = "NONE",},},["timer"] = true,["timerFlags"] = "None",["desaturate"] = false,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["source"] = "import",["sparkHidden"] = "NEVER",["icon"] = false,["timerSize"] = 12,["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["customTextUpdate"] = "update",["icon_side"] = "LEFT",["borderColor"] = {1,1,1,0.5,},["sparkHeight"] = 14,["anchorFrameParent"] = false,["config"] = {},["borderInset"] = 11,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["xOffset"] = 0,["id"] = "7. Fixate List (MACRO) - Smolderon",["sparkWidth"] = 3,["frameStrata"] = 4,["width"] = 150,["backdropColor"] = {1,1,1,0.5,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["inverse"] = false,["color"] = {},["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "debuff",["value"] = 1,},["changes"] = {{["value"] = {1,0.035294119268656,0.035294119268656,1,},["property"] = "barColor",},},},},["barColor2"] = {1,0.55294120311737,0,1,},["sparkColor"] = {1,1,1,1,},},["7. Overheated Progress - Smolderon (simple)"] = {["user_y"] = 0,["iconSource"] = -1,["user_x"] = 0,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["foregroundColor"] = {0,1,1,1,},["echoVersion"] = 2,["sameTexture"] = true,["url"] = "https://echoesports.gg",["icon"] = true,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_10px.tga",["useAdjustededMin"] = false,["regionType"] = "progresstexture",["blendMode"] = "BLEND",["slantMode"] = "INSIDE",["cooldownTextDisabled"] = false,["auto"] = true,["compress"] = false,["alpha"] = 1,["uid"] = "d5IzzFG1RuQ",["displayIcon"] = 3528301,["backgroundOffset"] = 0,["color"] = {1,1,1,1,},["desaturateBackground"] = false,["cooldownSwipe"] = true,["customTextUpdate"] = "event",["cooldownEdge"] = false,["desaturateForeground"] = false,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"421455",},["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["useName"] = true,["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text_format_p_time_precision"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_text_format_c_format"] = "none",["text_selfPoint"] = "CENTER",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorXOffset"] = 0,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_format"] = "timed",["text_text_format_p_time_format"] = 0,["text_shadowXOffset"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {0.98823529411765,0.99607843137255,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = 0,["text_visible"] = false,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "CENTER",["text_text_format_tooltip1_format"] = "none",["text_shadowColor"] = {0,0,0,1,},["text_fontSize"] = 14,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = false,},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "BOTTOM",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {0.98823529411765,0.99607843137255,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = 0,["text_text_format_tooltip2_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "CENTER",["text_anchorYOffset"] = 5,["text_visible"] = false,["text_fontSize"] = 15,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["border_size"] = 1,["text_text"] = "",["type"] = "subborder",["border_color"] = {1,1,1,1,},["border_visible"] = false,["border_edge"] = "Square Full White",["border_offset"] = 0,},},["height"] = 150,["useAdjustededMax"] = false,["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",["source"] = "import",["mirror"] = false,["parent"] = "7. Singles - Smolderon",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["conditions"] = {},["auraRotation"] = 0,["tocversion"] = 100200,["zoom"] = 0,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontSize"] = 12,["anchorPoint"] = "CENTER",["anchorFrameType"] = "SCREEN",["backgroundColor"] = {0.16078431904316,0.16078431904316,0.16078431904316,0.48795199394226,},["id"] = "7. Overheated Progress - Smolderon (simple)",["useCooldownModRate"] = true,["frameStrata"] = 1,["width"] = 150,["crop_y"] = 0.41,["startAngle"] = 0,["inverse"] = false,["config"] = {},["orientation"] = "ANTICLOCKWISE",["crop_x"] = 0.41,["cooldown"] = true,["authorOptions"] = {},},["Set Private Aura Text to LARGE"] = {["outline"] = "OUTLINE",["parent"] = "7. Singles - Smolderon",["displayText_format_p_time_dynamic_threshold"] = 60,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["do_custom"] = true,["custom"] = "PrivateRaidBossEmoteFrameAnchor:SetScale(3)",},["finish"] = {["do_custom"] = true,["custom"] = "PrivateRaidBossEmoteFrameAnchor:SetScale(1)",},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["wordWrap"] = "WordWrap",["font"] = "Friz Quadrata TT",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["size"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["fontSize"] = 12,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["preferToUpdate"] = false,["xOffset"] = 0,["conditions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayText_format_p_time_precision"] = 1,["displayText"] = "",["displayText_format_p_time_mod_rate"] = true,["config"] = {},["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "Set Private Aura Text to LARGE",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "HcHCGf73qXo",["authorOptions"] = {},["displayText_format_p_time_legacy_floor"] = false,["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["selfPoint"] = "BOTTOM",},["7. [HEAL ABSORB] - Cauterizing Wound Debuff - Smolderon"] = {["iconSource"] = -1,["parent"] = "7. Icons (high) - Smolderon",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["auranames"] = {"421656",},["subeventPrefix"] = "SPELL",["unit"] = "player",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%tooltip1",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_format"] = "BigNumber",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip2_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["authorOptions"] = {},["stickyDuration"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "7. [HEAL ABSORB] - Cauterizing Wound Debuff - Smolderon",["frameStrata"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "8BNBMC2BaCT",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {["message"] = "X",["do_sound"] = true,["message_type"] = "SAY",["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\shot.ogg",["do_message"] = false,},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["xOffset"] = 0,},["7. Cauterizing Wound TIMER Bar - Smolderon"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["user_x"] = 0,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["foregroundColor"] = {0,0.98823535442352,1,0.27000004053116,},["echoVersion"] = 3,["sparkRotation"] = 0,["sameTexture"] = true,["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.81960791349411,0.82352948188782,0.85098046064377,1,},["desaturate"] = false,["rotation"] = 0,["font"] = "Friz Quadrata TT",["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",},["encounterid"] = "2824",["use_difficulty"] = true,["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["preferToUpdate"] = false,["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_10px.tga",["conditions"] = {},["tocversion"] = 100200,["smoothProgress"] = false,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["blendMode"] = "BLEND",["stacksFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["slantMode"] = "INSIDE",["config"] = {},["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["zoom"] = 0,["auto"] = true,["compress"] = false,["cooldown"] = true,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["sparkColor"] = {1,1,1,1,},["uid"] = ")rm2ImqNHqo",["id"] = "7. Cauterizing Wound TIMER Bar - Smolderon",["icon"] = false,["displayIcon"] = "",["displayTextRight"] = "%p",["backgroundOffset"] = 0,["actions"] = {["start"] = {},["finish"] = {["do_custom"] = false,},["init"] = {["do_custom"] = true,["custom"] = "aura_env.times = {\
    4.8,4.8, 4.8,4.8, 4.8,4.8, 4.8,4.8, 4.8,4.8, 4.8,4.8\
}\
\
\
",},},["url"] = "https://echoesports.gg",["sparkOffsetX"] = 0,["borderColor"] = {1,1,1,0.5,},["color"] = {},["authorOptions"] = {},["customText"] = "function()\
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
",["sparkWidth"] = 3,["customTextUpdate"] = "update",["desaturateBackground"] = false,["cooldownSwipe"] = true,["textSize"] = 12,["sparkRotationMode"] = "AUTO",["cooldownEdge"] = false,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["unit"] = "player",["subeventPrefix"] = "SPELL",["spellIds"] = {},["custom"] = "function(s, event, timestamp, subEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID)\
    if event == \"ENCOUNTER_START\" then\
        aura_env.count = 0\
        \
    elseif subEvent == \"SPELL_CAST_SUCCESS\" and spellID == 421343 then\
        aura_env.count = aura_env.count + 1\
        \
    elseif subEvent == \"SPELL_AURA_APPLIED\" and spellID == 421656 and destGUID == WeakAuras.myGUID then\
        local dur = aura_env.times[aura_env.count]\
        if dur then\
            s[\"\"] = {\
                show = true,\
                changed = true,\
                progressType = \"timed\", \
                duration  = dur,\
                expirationTime = GetTime() + dur,\
            }\
            return true\
        end\
    end\
end\
\
\
",["names"] = {},["check"] = "event",["custom_type"] = "stateupdate",["events"] = "CLEU:SPELL_AURA_APPLIED:SPELL_CAST_SUCCESS ENCOUNTER_START",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["useName"] = true,["auranames"] = {"421656",},["unit"] = "player",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 70,["startAngle"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderInFront"] = false,["stickyDuration"] = false,["adjustedMin"] = "4",["timer"] = true,["mirror"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},{["text_text_format_p_time_precision"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "CENTER",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_n_format"] = "none",["anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_p_format"] = "timed",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowXOffset"] = 1,["text_shadowYOffset"] = -1,["text_fontType"] = "None",["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "INNER_CENTER",["text_text_format_p_time_format"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = false,},},["height"] = 9,["timerFlags"] = "None",["useAdjustededMax"] = false,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",["source"] = "import",["fontSize"] = 12,["parent"] = "7. Cauterizing Wound Bars",["borderBackdrop"] = "Blizzard Tooltip",["border"] = false,["borderEdge"] = "None",["cooldownTextDisabled"] = false,["borderSize"] = 16,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["icon_side"] = "LEFT",["desaturateForeground"] = false,["user_y"] = 0,["sparkHeight"] = 14,["stacksFlags"] = "None",["anchorPoint"] = "CENTER",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["crop_y"] = 0.41,["sparkHidden"] = "NEVER",["textColor"] = {1,1,1,1,},["frameStrata"] = 1,["width"] = 240,["timerColor"] = {1,1,1,1,},["borderInset"] = 11,["inverse"] = false,["spark"] = false,["orientation"] = "HORIZONTAL",["crop_x"] = 0.41,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["auraRotation"] = 0,},["7. [KNOCKBACK] - World In Flames Cast - Smolderon"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = true,},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "1786407",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "7. Bars - Smolderon",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["textSize"] = 12,["customTextUpdate"] = "update",["sparkRotationMode"] = "AUTO",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["use_castType"] = true,["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["names"] = {},["use_absorbMode"] = true,["use_spellNames"] = true,["subeventPrefix"] = "SPELL",["castType"] = "cast",["use_unit"] = true,["spellIds"] = {},["event"] = "Cast",["use_exact_spellId"] = false,["unit"] = "boss",["spellNames"] = {422172,},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["borderInset"] = 11,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["stacksFlags"] = "None",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["height"] = 23,["zoom"] = 0,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "KNOCKBACK",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["icon"] = true,["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["authorOptions"] = {},["color"] = {},["anchorFrameParent"] = false,["textFlags"] = "None",["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["borderBackdrop"] = "Blizzard Tooltip",["id"] = "7. [KNOCKBACK] - World In Flames Cast - Smolderon",["adjustedMin"] = "4",["frameStrata"] = 1,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["inverse"] = false,["borderOffset"] = 5,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["uid"] = "vs7dUmE1zIN",},["7. Cauterizing Wound Bars"] = {["controlledChildren"] = {"7. Fully Absorbed - Cauterizing Wound - First 1","7. Cauterizing Wound ABSORB Bar - Smolderon","7. Cauterizing Wound TIMER Bar - Smolderon",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 100,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "7. Cauterizing Wound Bars",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "7. Singles - Smolderon",["uid"] = "piS8NjAeu0C",["borderInset"] = 1,["xOffset"] = 0,["selfPoint"] = "CENTER",["conditions"] = {},["information"] = {},["config"] = {},},["7. [TANK BOMB] - Searing Aftermath Debuff - Smolderon"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"422577",},["event"] = "Health",["names"] = {},["spellIds"] = {},["subeventPrefix"] = "SPELL",["useName"] = true,["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "TANK\\nBOMB",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["desaturate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["xOffset"] = 0,["selfPoint"] = "CENTER",["uid"] = "asTExzwtilr",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "7. [TANK BOMB] - Searing Aftermath Debuff - Smolderon",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 55,["authorOptions"] = {},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["parent"] = "7. Icons (high) - Smolderon",},["7. [WAVES] - Overheated Debuff - Smolderon"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"421455",},["fetchTooltip"] = false,["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "WAVES",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorPoint"] = "OUTER_BOTTOM",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip3_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["parent"] = "7. Icons (high) - Smolderon",["stickyDuration"] = false,["config"] = {},["zoom"] = 0,["anchorFrameParent"] = false,["width"] = 55,["useCooldownModRate"] = true,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "7. [WAVES] - Overheated Debuff - Smolderon",["frameStrata"] = 1,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "1RHTTRwFl0A",["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["authorOptions"] = {},},["7 .[DOT] - Lingering Burn Debuff - Smolderon"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"425574",},["fetchTooltip"] = false,["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip2_format"] = "none",["text_shadowYOffset"] = -1,["text_anchorPoint"] = "OUTER_BOTTOM",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip2_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["color"] = {1,1,1,1,},["stickyDuration"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "7 .[DOT] - Lingering Burn Debuff - Smolderon",["frameStrata"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["uid"] = "OmpF20pxmQF",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "7. Icons (high) - Smolderon",},["7. Assign healers to absorbs"] = {["outline"] = "OUTLINE",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 10,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {["do_custom"] = true,["custom"] = "aura_env.debug = false--true\
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
    --aura_env.elogl(\"Smolderon healer list\", unpack(healers))\
    \
    return healers\
end",},["finish"] = {["hide_all_glows"] = true,},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["customVariables"] = "{prio = \"number\"}",["event"] = "Health",["subeventPrefix"] = "SPELL",["custom"] = "-- ECHO_HEAL_ABSORB_ASSIGN\
function(s,e,...)\
    local _, subEvent, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID = ...\
    if e == \"ECHO_HEAL_ABSORB_ASSIGN\" then\
        if aura_env.affected and #aura_env.affected > 0 then\
            aura_env.elogl(\"Healer Assign1: affected\", #aura_env.affected)\
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
        if subEvent == \"SPELL_AURA_APPLIED\" and spellID == 421656 then\
            if not aura_env.last or GetTime() - aura_env.last > 10 then\
                aura_env.affected = {}\
                aura_env.last = GetTime()\
                C_Timer.After(0.3, function() WeakAuras.ScanEvents(\"ECHO_HEAL_ABSORB_ASSIGN\", true) end)\
            end\
            table.insert(aura_env.affected, destName)\
            \
        elseif subEvent == \"SPELL_AURA_REMOVED\" and spellID == 421656 then\
            tDeleteItem(aura_env.affected, destName)\
            if s[destName] then\
                s[destName].show = false\
                s[destName].changed = true\
                return true\
            end\
        end\
    end\
end\
\
\
",["spellIds"] = {},["events"] = "CLEU:SPELL_AURA_APPLIED:SPELL_AURA_REMOVED ECHO_HEAL_ABSORB_ASSIGN",["custom_type"] = "stateupdate",["check"] = "event",["names"] = {},["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["wordWrap"] = "WordWrap",["desc"] = "Assigns healers to the Heal Absorbs so nobody gets missed. ",["font"] = "Friz Quadrata TT",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["difficulty"] = {["single"] = "mythic",},["use_encounterid"] = true,["encounterid"] = "2824",["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["size"] = {["multi"] = {},},},["fontSize"] = 12,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_time_mod_rate"] = true,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["fixedWidth"] = 200,["displayText_format_p_time_legacy_floor"] = false,["selfPoint"] = "CENTER",["displayText_format_p_time_precision"] = 1,["shadowYOffset"] = -1,["uid"] = "CIEHuOjwYzK",["parent"] = "7. Smart Healer Glows",["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "7. Assign healers to absorbs",["color"] = {1,1,1,1,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["config"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["automaticWidth"] = "Auto",["shadowColor"] = {0,0,0,1,},["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "alwaystrue",},["changes"] = {{["value"] = {["glow_frame_type"] = "UNITFRAME",["glow_action"] = "hide",},["property"] = "glowexternal",},},},{["check"] = {["trigger"] = 1,["variable"] = "prio",["op"] = "==",["value"] = "1",},["changes"] = {{["value"] = {["glow_lines"] = 12,["glow_thickness"] = 2,["glow_action"] = "show",["glow_color"] = {1,0,0,1,},["glow_type"] = "Pixel",["use_glow_color"] = true,["glow_frame_type"] = "UNITFRAME",},["property"] = "glowexternal",},},},{["check"] = {["trigger"] = 1,["variable"] = "prio",["value"] = "2",["op"] = "==",},["changes"] = {{["value"] = {["glow_color"] = {1,0.98039221763611,0,1,},["glow_thickness"] = 2,["glow_action"] = "show",["glow_frame_type"] = "UNITFRAME",["glow_type"] = "Pixel",["use_glow_color"] = true,["glow_lines"] = 12,},["property"] = "glowexternal",},},},{["check"] = {["trigger"] = 1,["variable"] = "prio",["op"] = "==",["value"] = "3",},["changes"] = {{["value"] = {["glow_frame_type"] = "UNITFRAME",["glow_thickness"] = 2,["glow_action"] = "show",["glow_lines"] = 12,["glow_type"] = "Pixel",["use_glow_color"] = true,["glow_color"] = {0,0.9215686917305,1,1,},},["property"] = "glowexternal",},},},{["check"] = {["trigger"] = 1,["variable"] = "prio",["value"] = "4",["op"] = ">=",},["changes"] = {{["value"] = {["glow_lines"] = 12,["glow_thickness"] = 2,["glow_action"] = "show",["glow_color"] = {0.078431375324726,1,0,1,},["glow_type"] = "Pixel",["use_glow_color"] = true,["glow_frame_type"] = "UNITFRAME",},["property"] = "glowexternal",},},},},["information"] = {},["displayText"] = "",},["7. [MOVE] - Roiling Lava Debuff - Smolderon"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"428388",},["fetchTooltip"] = false,["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "MOVE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorPoint"] = "OUTER_BOTTOM",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["size"] = {["multi"] = {},},},["source"] = "import",["desaturate"] = false,["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["xOffset"] = 0,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "7. [MOVE] - Roiling Lava Debuff - Smolderon",["alpha"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "7. Icons (low) - Smolderon",["uid"] = "sGQvcWDq74c",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {1,1,1,1,},},["7. Fixate ASSIGN MAIN"] = {["user_y"] = 0,["user_x"] = 0,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 20,["sameTexture"] = false,["actions"] = {["start"] = {},["init"] = {["do_custom"] = true,["custom"] = "aura_env.Comm = LibStub:GetLibrary(\"AceComm-3.0\")\
\
-- LEADER ONLY\
-- they receive a message from a raider and give them an assign\
local prefix = \"ECHO_SMOLD\"\
aura_env.prefix = prefix\
aura_env.Comm:RegisterComm(prefix, function(prefix, message, channel, sender)\
        if UnitIsGroupLeader(\"player\") then\
            local unit = UnitExists(sender) and sender or Ambiguate(sender, \"none\")\
            WeakAuras.ScanEvents(\"ECHO_SMOLDERON_FIXATE\", unit, sender)\
        end\
    end\
)\
\
-- EVERYONE\
-- this is a whisper from the leader with your assign index\
local prefix2 = \"ECHO_SMOLD2\"\
aura_env.prefix2 = prefix2\
aura_env.Comm:RegisterComm(prefix2, function(prefix, message, channel, sender)\
        local index = tonumber(message)\
        if index then\
            WeakAuras.ScanEvents(\"ECHO_SMOLDERON_FIXATE_ASSIGN\", index)\
        end\
    end\
)\
\
-- EVERYONE\
-- this is the current list of affected names\
local prefix3 = \"ECHO_SMOLD3\"\
aura_env.prefix3 = prefix3\
aura_env.Comm:RegisterComm(prefix3, function(prefix, message, channel, sender)\
        local name1, name2, name3, name4 = strsplit(\":\", message)\
        if name1 then\
            WeakAuras.ScanEvents(\"ECHO_SMOLDERON_FIXATE_LIST\", name1, name2, name3, name4)\
        end\
    end\
)",},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"426018",},["group_countOperator"] = ">",["unit"] = "group",["event"] = "Health",["names"] = {},["useGroup_count"] = true,["combineMode"] = "showHighest",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["group_count"] = "0",["subeventPrefix"] = "SPELL",["type"] = "aura2",["debuffType"] = "BOTH",},["untrigger"] = {},},[2] = {["trigger"] = {["customVariables"] = "{index = \"number\", initialIndex = \"number\"}",["type"] = "custom",["events"] = "ECHO_MACRO TRIGGER:1 CHAT_MSG_ADDON ECHO_SMOLDERON_FIXATE ECHO_SMOLDERON_FIXATE_ASSIGN UNIT_SPELLCAST_SUCCEEDED:boss1 CLEU:SPELL_AURA_APPLIED:SPELL_AURA_APPLIED_DOSE:SPELL_AURA_REFRESH ENCOUNTER_START",["custom_type"] = "stateupdate",["check"] = "event",["custom"] = "-- ECHO_MACRO TRIGGER:1 CHAT_MSG_ADDON\
\
function(s,e,...)\
    if e == \"UNIT_SPELLCAST_SUCCEEDED\" then\
        local unit, _, spellID = ...\
        if spellID == 426144 then\
            aura_env.expiration = GetTime() + 30\
            aura_env.active = 4\
            aura_env.count = 0\
            aura_env.fixates = {}\
            aura_env.pops = 0\
            aura_env.clicked = false\
        end\
        \
    elseif e == \"ECHO_MACRO\" then\
        local num = ...\
        if num == 1 and aura_env.expiration and aura_env.expiration > GetTime() then\
            if not aura_env.clicked then\
                elog(\"SmoldFixate - macro hit\")\
                aura_env.Comm:SendCommMessage(aura_env.prefix, \"I AM FIXATED\", \"RAID\", nil, \"ALERT\")\
                aura_env.clicked = true\
            end\
        end\
        \
    elseif e == \"ECHO_SMOLDERON_FIXATE\" then\
        local unit, sender = ...\
        if unit and aura_env.expiration and aura_env.expiration > GetTime() then\
            \
            aura_env.fixates = aura_env.fixates or {}\
            table.insert(aura_env.fixates, unit)\
            aura_env.Comm:SendCommMessage(aura_env.prefix2, tostring(#aura_env.fixates), \"WHISPER\", sender, \"ALERT\")\
            local list = \"\"\
            for i, name in ipairs(aura_env.fixates) do\
                list = format(\"%s%s%s\", list, list == \"\" and \"\" or \":\", name)\
                aura_env.Comm:SendCommMessage(aura_env.prefix3, list, \"RAID\", nil, \"ALERT\")\
            end\
        end\
        \
    elseif e == \"ECHO_SMOLDERON_FIXATE_ASSIGN\" then\
        local index = ...\
        if index then\
            local yourIndex = index - (aura_env.pops or 0)\
            elog(\"SmoldFixate: assign recevied\", index, yourIndex)\
            s[\"\"] = {\
                show = true,\
                changed = true,\
                initialIndex = index,\
                index = yourIndex,\
                pos = yourIndex - 1,\
                autoHide = true,\
                duration = 30,\
            }\
            return true\
        end\
        \
    elseif e == \"COMBAT_LOG_EVENT_UNFILTERED\" then\
        local _, subEvent, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID = ...\
        if spellID == 426018 and (not aura_env.last or GetTime() - aura_env.last > 0.1) then \
            aura_env.pops = aura_env.pops and aura_env.pops +1 or 1\
            aura_env.last = GetTime()\
            elogl(\"SmoldFixate L: Pop!, decrement indices\")\
            WeakAuras.ScanEvents(\"ECHO_SMOLD_DECREMENT_FIXATES\", true)\
            \
            if s[\"\"] then\
                \
                local yourIndex = s[\"\"].initialIndex - aura_env.pops\
                if yourIndex == 0 then\
                    s[\"\"].show = false\
                    s[\"\"].changed = true\
                    return true\
                else\
                    s[\"\"].index = yourIndex\
                    s[\"\"].pos = yourIndex - 1\
                    s[\"\"].changed = true\
                    return true\
                end\
            end\
        end\
        \
    elseif e == \"OPTIONS\" then\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            index = math.random(1,4),\
            autoHide = true,\
            duration = 30,\
        }\
        return true\
    end\
    \
end\
\
\
",["debuffType"] = "HELPFUL",["unit"] = "player",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[2] end",["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["selfPoint"] = "CENTER",["desc"] = "Handles Macro presses for the Fixates. \
Use this macro when fixated: \
/run WeakAuras.ScanEvents(\"ECHO_MACRO\",1)\
\
You will be assigned a place and see a \"traffic light\" for when to clear. \
This Auras handles all the comms and sends to the Fixate List. \
",["rotation"] = 0,["font"] = "Friz Quadrata TT",["desaturateForeground"] = false,["subRegions"] = {{["type"] = "subbackground",},{["text_text_format_n_format"] = "none",["text_text"] = "%index",["text_text_format_2.pos_format"] = "none",["text_text_format_p_format"] = "timed",["anchorXOffset"] = 0,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_pos_format"] = "none",["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_p_time_precision"] = 1,["text_text_format_post_format"] = "none",["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowXOffset"] = 1,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "CENTER",["text_text_format_p_time_format"] = 0,["text_text_format_p_time_mod_rate"] = true,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},},["height"] = 60,["crop_x"] = 0.41,["crop_y"] = 0.41,["desaturateBackground"] = false,["useAdjustededMax"] = false,["fontSize"] = 12,["source"] = "import",["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",["parent"] = "7. Singles - Smolderon",["backgroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Circle_White",["mirror"] = false,["useAdjustededMin"] = false,["regionType"] = "progresstexture",["config"] = {},["blendMode"] = "BLEND",["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["width"] = 60,["slantMode"] = "INSIDE",["alpha"] = 1,["uid"] = "3ewNZ0ghHHL",["load"] = {["difficulty"] = {["single"] = "mythic",["multi"] = {["mythic"] = true,},},["use_encounterid"] = true,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["encounterid"] = "2824",["size"] = {["multi"] = {},},},["compress"] = false,["authorOptions"] = {},["tocversion"] = 100200,["id"] = "7. Fixate ASSIGN MAIN",["startAngle"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["backgroundColor"] = {1,0.9215686917305,0,0.55000001192093,},["auraRotation"] = 0,["inverse"] = false,["foregroundColor"] = {0.34509804844856,0.90588241815567,0,1,},["orientation"] = "ANTICLOCKWISE",["conditions"] = {{["check"] = {["trigger"] = -2,["variable"] = "AND",["op"] = "==",["checks"] = {{["trigger"] = 2,["variable"] = "index",["value"] = "1",["op"] = "==",},{["trigger"] = 1,["variable"] = "show",["value"] = 1,["op"] = ">",},},},["changes"] = {{["value"] = {1,0.90196084976196,0,0.55000001192093,},["property"] = "backgroundColor",},{["value"] = {0.14117647707462,1,0,1,},["property"] = "foregroundColor",},{["value"] = "NEXT\\n%p",["property"] = "sub.2.text_text",},},},{["check"] = {["trigger"] = 2,["variable"] = "index",["value"] = "1",["op"] = "==",},["linked"] = true,["changes"] = {{["value"] = {0.098039224743843,1,0,0.70000001788139,},["property"] = "backgroundColor",},{["value"] = "GO",["property"] = "sub.2.text_text",},{["value"] = {1,1,1,0,},["property"] = "foregroundColor",},},},{["check"] = {["trigger"] = -2,["variable"] = "AND",["op"] = "==",["checks"] = {{["trigger"] = 2,["variable"] = "index",["op"] = "==",["value"] = "2",},{["trigger"] = 1,["variable"] = "show",["value"] = 1,},},},["changes"] = {{["value"] = {1,0.90196084976196,0,0.55000001192093,},["property"] = "backgroundColor",},{["value"] = {1,1,1,0,},["property"] = "foregroundColor",},{["value"] = "WAIT %2.pos",["property"] = "sub.2.text_text",},},},{["check"] = {["trigger"] = 2,["op"] = "==",["variable"] = "index",["value"] = "2",},["changes"] = {{["value"] = {1,0.90196084976196,0,0.55000001192093,},["property"] = "backgroundColor",},{["value"] = {1,1,1,0,},["property"] = "foregroundColor",},{["value"] = "WAIT %2.pos",["property"] = "sub.2.text_text",},},["linked"] = true,},{["check"] = {["trigger"] = 2,["op"] = ">=",["variable"] = "index",["value"] = "3",},["changes"] = {{["value"] = {1,0,0,0.52000001072884,},["property"] = "backgroundColor",},{["value"] = {1,1,1,0,},["property"] = "foregroundColor",},{["value"] = "WAIT %2.pos",["property"] = "sub.2.text_text",},},},},["information"] = {},["backgroundOffset"] = 0,},["7. Icons (low) - Smolderon"] = {["grow"] = "LEFT",["controlledChildren"] = {"7. [SOAKED] - Emberscar's Mark Debuff - Smolderon","7. [MOVE] - Smoldering Ground Debuff - Smolderon","7. [MOVE] - Roiling Lava Debuff - Smolderon",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["selfPoint"] = "RIGHT",["align"] = "CENTER",["rotation"] = 0,["xOffset"] = 0,["useLimit"] = false,["subRegions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["internalVersion"] = 70,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["gridType"] = "RD",["backdropColor"] = {1,1,1,0.5,},["borderInset"] = 1,["source"] = "import",["parent"] = "7. Smolderon",["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Icon - Low Priority - Anchor [AMIR]",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["borderEdge"] = "Square Full White",["frameStrata"] = 1,["arcLength"] = 360,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["fullCircle"] = true,["tocversion"] = 100200,["id"] = "7. Icons (low) - Smolderon",["regionType"] = "dynamicgroup",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["sortHybridTable"] = {["7. [MOVE] - Smoldering Ground Debuff - Smolderon"] = false,["7. [SOAKED] - Emberscar's Mark Debuff - Smolderon"] = false,["7. [MOVE] - Roiling Lava Debuff - Smolderon"] = false,},["uid"] = "uXwyxYG1gAw",["animate"] = false,["space"] = 2,["config"] = {},["conditions"] = {},["information"] = {},["stagger"] = 0,},["7. [BOMB] - Searing Aftermath on Tank - Smolderon"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["do_custom"] = false,},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.96078437566757,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["zoneIds"] = "",["ingroup"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2824",["class"] = {["multi"] = {},},["talent2"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["race"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["pvptalent"] = {["multi"] = {},},["faction"] = {["multi"] = {},},["role"] = {["single"] = "TANK",["multi"] = {["TANK"] = true,},},["use_zoneIds"] = false,["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "525026",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "7. Bars - Smolderon",["preferToUpdate"] = false,["adjustedMin"] = "4",["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["color"] = {},["auto"] = true,["sparkColor"] = {1,1,1,1,},["uid"] = "AWNso3A6u53",["sparkRotationMode"] = "AUTO",["displayTextLeft"] = "%n",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["rem"] = "3",["spellId"] = 424936,["auranames"] = {"422577",},["use_genericShowOn"] = true,["group_count"] = "0",["spellName"] = 0,["showClones"] = false,["name_operator"] = "find('%s')",["use_absorbHealMode"] = true,["useExactSpellId"] = false,["fetchTooltip"] = false,["event"] = "Cast",["use_spellId"] = true,["name"] = "Plasma Discharge",["fetchRole"] = false,["combineMatches"] = "showLowest",["use_track"] = true,["customVariables"] = "{\
    expirationTime = true,\
    spellID = \"number\",\
}\
\
\
",["check"] = "event",["fetchRaidMark"] = true,["group_countOperator"] = ">",["useGroup_count"] = true,["custom_hide"] = "timed",["use_absorbMode"] = true,["genericShowOn"] = "showOnCooldown",["unit"] = "group",["use_debuffClass"] = false,["use_tooltip"] = false,["ignoreSelf"] = true,["spellIds"] = {283573,},["matchesShowOn"] = "showOnActive",["duration"] = "3",["debuffType"] = "HARMFUL",["buffShowOn"] = "showOnActive",["subeventPrefix"] = "SPELL",["useName"] = true,["auraspellids"] = {},["unevent"] = "auto",["use_unit"] = true,["type"] = "aura2",["use_onUpdateUnitTarget"] = true,["custom_type"] = "event",["realSpellName"] = 0,["use_spellName"] = true,["events"] = "CHAT_MSG_RAID_BOSS_EMOTE",["names"] = {"Sacred Blade",},["remOperator"] = "<",["subeventSuffix"] = "_CAST_SUCCESS",["useAffected"] = false,["useRem"] = false,},["untrigger"] = {},},["disjunctive"] = "all",["activeTriggerMode"] = -10,},["customTextUpdate"] = "update",["internalVersion"] = 70,["anchorFrameType"] = "SCREEN",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["rotate"] = 0,["easeStrength"] = 3,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkRotation"] = 0,["stickyDuration"] = false,["adjustedMax"] = "4",["id"] = "7. [BOMB] - Searing Aftermath on Tank - Smolderon",["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BOMB %raidMar%unit",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_text_format_unit_realm_name"] = "never",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_unit_format"] = "Unit",["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_text_format_destName_abbreviate"] = false,["text_text_format_unit_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_text_format_raidMar_format"] = "none",["text_text_format_unit_color"] = "class",["text_fontType"] = "OUTLINE",["text_text_format_unit_abbreviate_max"] = 8,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["height"] = 23,["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["timerSize"] = 12,["source"] = "import",["customText"] = "function()\
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
",["displayTextRight"] = "%p",["backgroundColor"] = {0,0,0,0.33132427930832,},["border"] = false,["borderEdge"] = "None",["sparkHeight"] = 14,["borderInFront"] = false,["borderBackdrop"] = "Blizzard Tooltip",["icon_side"] = "LEFT",["zoom"] = 0,["borderSize"] = 16,["anchorFrameParent"] = false,["sparkWidth"] = 3,["borderOffset"] = 5,["stacksColor"] = {1,1,1,1,},["semver"] = "1.0.5",["useAdjustededMax"] = false,["sparkHidden"] = "NEVER",["authorOptions"] = {},["frameStrata"] = 1,["width"] = 240,["rotateText"] = "NONE",["icon"] = true,["inverse"] = false,["stacksFont"] = "Friz Quadrata TT",["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["config"] = {},},["7. Icons (high) - Smolderon"] = {["grow"] = "LEFT",["controlledChildren"] = {"7. [TANK BOMB] - Searing Aftermath Debuff - Smolderon","7. [HEAL ABSORB] - Cauterizing Wound Debuff - Smolderon","7. [500%] - Seeking Inferno Debuff - Smolderon","7. [WAVES] - Overheated Debuff - Smolderon","7. [BUFF] - Ignited Essence  - Smolderon","7 .[DOT] - Lingering Burn Debuff - Smolderon","7 .[DOT] - Inferno Debuff - Smolderon",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["fullCircle"] = true,["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["rotation"] = 0,["borderColor"] = {0,0,0,1,},["stagger"] = 0,["subRegions"] = {},["useLimit"] = false,["gridType"] = "RD",["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["xOffset"] = 0,["backdropColor"] = {1,1,1,0.5,},["config"] = {},["source"] = "import",["borderInset"] = 1,["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["anchorFrameFrame"] = "WeakAuras:Icon - High Priority - Anchor [AMIR]",["gridWidth"] = 5,["arcLength"] = 360,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["sortHybridTable"] = {["7 .[DOT] - Lingering Burn Debuff - Smolderon"] = false,["7. [HEAL ABSORB] - Cauterizing Wound Debuff - Smolderon"] = false,["7 .[DOT] - Inferno Debuff - Smolderon"] = false,["7. [BUFF] - Ignited Essence  - Smolderon"] = false,["7. [WAVES] - Overheated Debuff - Smolderon"] = false,["7. [500%] - Seeking Inferno Debuff - Smolderon"] = false,["7. [TANK BOMB] - Searing Aftermath Debuff - Smolderon"] = false,},["tocversion"] = 100200,["id"] = "7. Icons (high) - Smolderon",["regionType"] = "dynamicgroup",["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["parent"] = "7. Smolderon",["uid"] = "(kDSC(FxFO0",["animate"] = false,["rowSpace"] = 1,["radius"] = 200,["conditions"] = {},["information"] = {},["selfPoint"] = "RIGHT",},["7. Intermission Position Tracker - Smolderon"] = {["sparkWidth"] = 10,["displayText_format_text_format"] = "none",["iconSource"] = -1,["user_x"] = 0,["authorOptions"] = {{["type"] = "description",["fontSize"] = "medium",["text"] = "",["width"] = 1,},{["useName"] = true,["type"] = "header",["text"] = "Basic Settings",["noMerge"] = false,["width"] = 1,},{["type"] = "toggle",["default"] = true,["key"] = "visuals",["useDesc"] = false,["name"] = "Show Visual Display",["width"] = 1,},{["type"] = "toggle",["key"] = "showBad",["default"] = false,["name"] = "Show Bad Rings",["useDesc"] = false,["width"] = 1,},{["type"] = "select",["values"] = {"Now > Next e.g: 3 > 5","All e.g. 2 > 3 > 5 > 1 > 2 > 1","Staggered vertically",},["key"] = "text",["default"] = 1,["name"] = "Main Text Option",["useDesc"] = false,["width"] = 1,},{["type"] = "select",["values"] = {"Ring Numbers","Next Move Advice","None",},["key"] = "ringText",["default"] = 1,["useDesc"] = false,["name"] = "Ring Text",["width"] = 1,},{["type"] = "toggle",["default"] = false,["useDesc"] = false,["name"] = "Play Sound on Change",["key"] = "useSound",["width"] = 1,},{["mediaType"] = "sound",["type"] = "media",["useDesc"] = false,["media"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["default"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BananaPeelSlip.ogg",["key"] = "sound",["name"] = "Sound",["width"] = 1,},{["type"] = "toggle",["useDesc"] = false,["default"] = true,["key"] = "tts",["name"] = "Text to Speech",["width"] = 1,},{["softMin"] = 0,["type"] = "range",["useDesc"] = false,["max"] = 4,["step"] = 0.1,["width"] = 1,["min"] = 0,["name"] = "TTS Global Delay",["softMax"] = 4,["bigStep"] = 0.1,["key"] = "ttsDelay",["default"] = 0,},{["useName"] = true,["type"] = "header",["text"] = "Intermission 1 Positions",["noMerge"] = false,["width"] = 1,},{["subOptions"] = {{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set1",["useDesc"] = false,["name"] = "Set 1",["default"] = 2,["width"] = 1,},{["multiline"] = false,["type"] = "input",["key"] = "tts1",["width"] = 1,["default"] = "2",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["key"] = "set2",["values"] = {"1","2","3","4","5",},["default"] = 1,["name"] = "Set 2",["useDesc"] = false,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "1",["name"] = "TTS",["key"] = "tts2",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set3",["useDesc"] = false,["name"] = "Set 3",["default"] = 2,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "2",["width"] = 1,["key"] = "tts3",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["key"] = "set4",["values"] = {"1","2","3","4","5",},["default"] = 3,["name"] = "Set 4",["useDesc"] = false,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "3",["name"] = "TTS",["key"] = "tts4",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set5",["useDesc"] = false,["name"] = "Set 5",["default"] = 2,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "2",["width"] = 1,["key"] = "tts5",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["key"] = "set6",["values"] = {"1","2","3","4","5",},["default"] = 1,["name"] = "Set 6",["useDesc"] = false,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "1",["name"] = "TTS",["key"] = "tts6",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set7",["useDesc"] = false,["name"] = "Set 7",["default"] = 2,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "2",["width"] = 1,["key"] = "tts7",["length"] = 10,["name"] = "TTS",["useLength"] = false,},},["type"] = "group",["useDesc"] = false,["nameSource"] = 0,["name"] = "Intermission 1",["width"] = 1,["useCollapse"] = true,["noMerge"] = false,["key"] = "int1",["collapse"] = true,["limitType"] = "none",["groupType"] = "simple",["hideReorder"] = true,["size"] = 10,},{["type"] = "space",["variableWidth"] = true,["height"] = 1,["useHeight"] = false,["width"] = 2,},{["type"] = "header",["useName"] = true,["text"] = "Intermission 2 Positions",["noMerge"] = false,["width"] = 1,},{["subOptions"] = {{["type"] = "select",["key"] = "set1",["values"] = {"1","2","3","4","5",},["default"] = 1,["name"] = "Set 1",["useDesc"] = false,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "1",["name"] = "TTS",["key"] = "tts1",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set2",["useDesc"] = false,["name"] = "Set 2",["default"] = 2,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "2",["width"] = 1,["key"] = "tts2",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["key"] = "set3",["values"] = {"1","2","3","4","5",},["default"] = 1,["name"] = "Set 3",["useDesc"] = false,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "1",["name"] = "TTS",["key"] = "tts3",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set4",["useDesc"] = false,["name"] = "Set 4",["default"] = 3,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "3",["width"] = 1,["key"] = "tts4",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["key"] = "set5",["values"] = {"1","2","3","4","5",},["default"] = 1,["name"] = "Set 5",["useDesc"] = false,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "1",["name"] = "TTS",["key"] = "tts5",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set6",["useDesc"] = false,["name"] = "Set 6",["default"] = 5,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "5",["width"] = 1,["key"] = "tts6",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["key"] = "set7",["values"] = {"1","2","3","4","5",},["default"] = 2,["name"] = "Set 7",["useDesc"] = false,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "2",["name"] = "TTS",["key"] = "tts7",["length"] = 10,["width"] = 1,["multiline"] = false,},},["type"] = "group",["useDesc"] = false,["nameSource"] = 0,["key"] = "int2",["width"] = 1,["useCollapse"] = true,["noMerge"] = false,["name"] = "Intermission 2",["hideReorder"] = true,["limitType"] = "none",["groupType"] = "simple",["collapse"] = true,["size"] = 10,},{["type"] = "space",["variableWidth"] = true,["height"] = 1,["width"] = 2,["useHeight"] = false,},{["useName"] = true,["type"] = "header",["text"] = "Intermission 3 Positions",["noMerge"] = false,["width"] = 1,},{["subOptions"] = {{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set1",["useDesc"] = false,["name"] = "Set 1",["default"] = 2,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "2",["width"] = 1,["key"] = "tts1",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["key"] = "set2",["values"] = {"1","2","3","4","5",},["default"] = 1,["name"] = "Set 2",["useDesc"] = false,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "1",["name"] = "TTS",["key"] = "tts2",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set3",["useDesc"] = false,["name"] = "Set 3",["default"] = 2,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "2",["width"] = 1,["key"] = "tts3",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["key"] = "set4",["values"] = {"1","2","3","4","5",},["default"] = 1,["name"] = "Set 4",["useDesc"] = false,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "1",["name"] = "TTS",["key"] = "tts4",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set5",["useDesc"] = false,["name"] = "Set 5",["default"] = 2,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "2",["width"] = 1,["key"] = "tts5",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["key"] = "set6",["values"] = {"1","2","3","4","5",},["default"] = 1,["name"] = "Set 6",["useDesc"] = false,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "1",["name"] = "TTS",["key"] = "tts6",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set7",["useDesc"] = false,["name"] = "Set 7",["default"] = 2,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "2",["width"] = 1,["key"] = "tts7",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["key"] = "set8",["values"] = {"1","2","3","4","5",},["default"] = 1,["name"] = "Set 8",["useDesc"] = false,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "1",["name"] = "TTS",["key"] = "tts8",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set9",["useDesc"] = false,["name"] = "Set 9",["default"] = 2,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "2",["width"] = 1,["key"] = "tts9",["length"] = 10,["name"] = "TTS",["useLength"] = false,},},["type"] = "group",["useDesc"] = false,["nameSource"] = 0,["name"] = "Intermission 3",["width"] = 1,["useCollapse"] = true,["noMerge"] = false,["key"] = "int3",["collapse"] = true,["limitType"] = "none",["groupType"] = "simple",["hideReorder"] = true,["size"] = 10,},{["type"] = "space",["variableWidth"] = true,["height"] = 1,["useHeight"] = false,["width"] = 2,},{["type"] = "header",["useName"] = true,["text"] = "Intermission 4 Positions",["noMerge"] = false,["width"] = 1,},{["subOptions"] = {{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set1",["useDesc"] = false,["name"] = "Set 1",["default"] = 1,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "1",["name"] = "TTS",["key"] = "tts1",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["key"] = "set2",["values"] = {"1","2","3","4","5",},["default"] = 2,["name"] = "Set 2",["useDesc"] = false,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "2",["width"] = 1,["key"] = "tts2",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set3",["useDesc"] = false,["name"] = "Set 3",["default"] = 1,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "1",["name"] = "TTS",["key"] = "tts3",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["key"] = "set4",["values"] = {"1","2","3","4","5",},["default"] = 3,["name"] = "Set 4",["useDesc"] = false,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "3",["width"] = 1,["key"] = "tts4",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set5",["useDesc"] = false,["name"] = "Set 5",["default"] = 1,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "1",["name"] = "TTS",["key"] = "tts5",["length"] = 10,["width"] = 1,["multiline"] = false,},{["type"] = "select",["key"] = "set6",["values"] = {"1","2","3","4","5",},["default"] = 5,["name"] = "Set 6",["useDesc"] = false,["width"] = 1,},{["multiline"] = false,["type"] = "input",["default"] = "5",["width"] = 1,["key"] = "tts6",["length"] = 10,["name"] = "TTS",["useLength"] = false,},{["type"] = "select",["values"] = {"1","2","3","4","5",},["key"] = "set7",["useDesc"] = false,["name"] = "Set 7",["default"] = 2,["width"] = 1,},{["useLength"] = false,["type"] = "input",["default"] = "2",["name"] = "TTS",["key"] = "tts7",["length"] = 10,["width"] = 1,["multiline"] = false,},},["type"] = "group",["useDesc"] = false,["nameSource"] = 0,["name"] = "Intermission 4",["width"] = 1,["useCollapse"] = true,["noMerge"] = false,["key"] = "int4",["collapse"] = true,["limitType"] = "none",["groupType"] = "simple",["hideReorder"] = true,["size"] = 10,},},["displayText"] = "%text",["yOffset"] = 239.00012207031,["foregroundColor"] = {1,1,1,0,},["echoVersion"] = 7,["sparkRotation"] = 0,["sameTexture"] = true,["actions"] = {["start"] = {["do_custom"] = true,["custom"] = "if aura_env.cloneId == \"\" then\
    \
    aura_env.region:SetFrameLevel(0)\
else\
    \
    aura_env.region:SetFrameLevel(100)\
end",},["finish"] = {["do_glow"] = false,["do_custom"] = true,["custom"] = "if aura_env.cloneId == \"\" then\
    aura_env.clearTimers()\
end\
\
\
",},["init"] = {["do_custom"] = true,["custom"] = "aura_env.testMode = false\
aura_env.debug = true\
aura_env.elog = function(...)\
    if aura_env.debug then\
        elog(...)\
    end\
end\
aura_env.elogl = function(...)\
    if aura_env.debug then\
        elogl(...)\
    end\
end\
\
aura_env.sets = {\
    \
    [1] = {\
        [1] = {\
            [1] = false, [2] = true, [3] = false, [4] = true, [5] = true\
        },\
        [2] = {\
            [1] = true, [2] = false, [3] = true, [4] = false, [5] = true\
        },\
        [3] = {\
            [1] = true, [2] = true, [3] = false, [4] = true, [5] = false\
        },\
        [4] = {\
            [1] = false, [2] = false, [3] = true, [4] = true, [5] = true\
        },\
        [5] = {\
            [1] = true, [2] = true, [3] = true, [4] = false, [5] = false\
        },\
        [6] = {\
            [1] = true, [2] = false, [3] = false, [4] = false, [5] = true\
        },\
        [7] = {\
            [1] = false, [2] = false, [3] = true, [4] = false, [5] = false\
        },\
        timings = {5, 9, 13, 17, 21, 25}--, 29}\
    },\
    \
    [2] = {\
        [1] = {\
            [1] = true, [2] = false, [3] = false, [4] = true, [5] = true\
        },\
        [2] = {\
            [1] = false, [2] = true, [3] = true, [4] = false, [5] = true\
        },\
        [3] = {\
            [1] = true, [2] = false, [3] = true, [4] = true, [5] = false\
        },\
        [4] = {\
            [1] = false, [2] = false, [3] = true, [4] = true, [5] = true\
        },\
        [5] = {\
            [1] = true, [2] = false, [3] = false, [4] = false, [5] = false\
        },\
        [6] = {\
            [1] = false, [2] = false, [3] = false, [4] = false, [5] = true\
        },\
        [7] = {\
            [1] = true, [2] = true, [3] = false, [4] = false, [5] = false\
        },\
        timings = {5, 9, 13, 17, 21, 25}--, 29}\
    },\
    \
    [3] = {\
        [1] = {\
            [1] = false, [2] = true, [3] = false, [4] = true, [5] = true\
        },\
        [2] = {\
            [1] = true, [2] = false, [3] = true, [4] = false, [5] = true\
        },\
        [3] = {\
            [1] = false, [2] = true, [3] = false, [4] = true, [5] = false\
        },\
        [4] = {\
            [1] = true, [2] = false, [3] = true, [4] = false, [5] = true\
        },\
        [5] = {\
            [1] = false, [2] = true, [3] = true, [4] = true, [5] = false\
        },\
        [6] = {\
            [1] = true, [2] = false, [3] = false, [4] = false, [5] = true\
        },\
        [7] = {\
            [1] = false, [2] = true, [3] = true, [4] = true, [5] = false\
        },\
        [8] = {\
            [1] = true, [2] = false, [3] = true, [4] = false, [5] = true\
        },\
        [9] = {\
            [1] = false, [2] = true, [3] = false, [4] = true, [5] = false\
        },\
        timings = {5,8,11,14,17,20,23,26}--,29}\
    },\
    \
    [4] = {\
        [1] = {\
            [1] = true, [2] = false, [3] = false, [4] = true, [5] = true\
        },\
        [2] = {\
            [1] = false, [2] = true, [3] = true, [4] = false, [5] = true\
        },\
        [3] = {\
            [1] = true, [2] = false, [3] = true, [4] = true, [5] = false\
        },\
        [4] = {\
            [1] = false, [2] = false, [3] = true, [4] = true, [5] = true\
        },\
        [5] = {\
            [1] = true, [2] = false, [3] = false, [4] = false, [5] = false\
        },\
        [6] = {\
            [1] = false, [2] = false, [3] = false, [4] = false, [5] = true\
        },\
        [7] = {\
            [1] = true, [2] = true, [3] = false, [4] = false, [5] = false\
        },\
        timings = {5, 9, 13, 17, 21, 25}--, 29}\
    },\
    \
}\
\
\
function aura_env.getChosenIndex(intermission, set)\
    local int = aura_env.config[\"int\"..intermission]\
    if int then\
        local set = int[\"set\"..set]\
        if set and tonumber(set) then\
            return tonumber(set)\
        end\
    end\
end\
\
\
local goodCol = \"ffffffff\"\
local badCol = \"ffff0000\"\
local chosenCol = \"ff00ff00\"\
function aura_env.getTextForIntermissionAndSet(intermission, set)\
    local thisSet = aura_env.sets[intermission][set]\
    local chosen = aura_env.getChosenIndex(intermission, set)\
    local output = \"\"\
    for i, isGood in ipairs(thisSet) do\
        output = format(\"%s%s|c%s%d\",\
            output,\
            output == \"\" and \"\" or \">\",\
            i == chosen and chosenCol or isGood and goodCol or badCol,\
            i\
        )\
    end\
    return output\
end\
\
function aura_env.getTextNowAndNext(intermission, set)\
    \
    local chosen = aura_env.getChosenIndex(intermission, set)\
    local next = aura_env.getChosenIndex(intermission, set+1)\
    local output = format(\"%d%s%s\", chosen, next and \" > \" or \"\", next and tostring(next) or \"\")\
    return output\
end\
function aura_env.getTextAllChosen(intermission, set, total)\
    local output = \"\"\
    for i = 1, total do\
        local chosen = aura_env.getChosenIndex(intermission, i)\
        output = format(\"%s%s%s%s%s\", output, output == \"\" and \"\" or \">\", i == set and \"\" or \"\", tostring(chosen), i == set and \"\" or \"\")\
    end\
    return output\
end\
function aura_env.getStaggeredText(intermission, set, total)\
    local output = \"\"\
    local s = \"\"\
    for i = 1, total do\
        local chosen = aura_env.getChosenIndex(intermission, i)\
        s = s..chosen\
    end\
    \
    for i = 1, 5 do\
        for col = 1, #s do\
            if string.sub(s, col, col) == tostring(i) then\
                if col == set then\
                    output = output..\"\"..i..\" \"\
                else\
                    output = output..i..\" \"\
                end\
            else\
                output = output..\"  \"\
            end\
        end\
        output = output..\"\\n\"\
    end \
    return output:gsub(\"%c[%s]-$\", \"\")..\"\\n\\n\"\
    \
end\
\
aura_env.texture = {\
    [\"\"] = [[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Circle_White]],\
    [\"tick\"] = [[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite]],\
    [1] = [[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Circle_White]],\
    [2] = [[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_40px.tga]],\
    [3] = [[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_30px.tga]],\
    [4] = [[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_30px.tga]],\
}\
\
function aura_env.clearTimers()\
    if aura_env.timers then\
        for _, timer in pairs(aura_env.timers) do\
            timer:Cancel()\
        end\
    end\
    aura_env.timers = {}\
end\
\
function aura_env.DoTTS(message)\
    C_VoiceChat.SpeakText(\
        0,\
        message,\
        1,\
        C_TTSSettings and C_TTSSettings.GetSpeechRate() or 0,\
        C_TTSSettings and C_TTSSettings.GetSpeechVolume() or 100\
    )\
end",},},["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["wordWrap"] = "WordWrap",["barColor"] = {1,0,0,1,},["desc"] = "A tracker to help you handle the Rings in the intermission.\
\
It has lots of settings in Custom Options. Most importantly, you can pre-set the positions you want to use for each intermission. The dropdowns in Custom Options show red for the dangerous ones. The defaults are probably okay for all melee. \
\
With your preferred positions set, you can use Cusotm Options to show/hide the visuals, change how the text is presented, and set what sounds you want to use. If you turn TTS on then the text box next to each set will be played. By default this is the number but you may want to only use TTS for specific notable moves. \
\
If you set it to load everywhere then it will work with the X-Practice Smolderon Module. ",["rotation"] = 0,["font"] = "Friz Quadrata TT",["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["crop_y"] = 2,["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",["shadowXOffset"] = 1,["useAdjustededMin"] = false,["regionType"] = "progresstexture",["blendMode"] = "BLEND",["slantMode"] = "INSIDE",["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",["zoom"] = 0,["spark"] = false,["compress"] = false,["alpha"] = 1,["uid"] = "D3uQ8wZqHT7",["fixedWidth"] = 200,["backgroundOffset"] = 0,["outline"] = "OUTLINE",["sparkOffsetX"] = 0,["color"] = {1,1,1,1,},["shadowYOffset"] = -1,["desaturateBackground"] = false,["preferToUpdate"] = false,["information"] = {},["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["desaturateForeground"] = false,["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["custom_type"] = "stateupdate",["customVariables"] = "{index = \"number\", isGood = \"bool\", type = \"number\", chosen = \"bool\", next = \"bool\", visuals = \"bool\", tts = \"bool\", current = \"number\", showBad = \"bool\", ringText = \"number\"}",["event"] = "Health",["subeventPrefix"] = "SPELL",["unit"] = "player",["custom"] = "--ECHO_MACRO ECHO_SMOLDERON_INTERMISSION_UPDATE\
function(s,e,...)\
    if e == \"ENCOUNTER_START\"\
    or (aura_env.testMode and e == \"ECHO_MACRO\" and ... == 2)\
    then\
        --aura_env.elog(\"Smolderon Intermission, reset\")\
        aura_env.intermission = 0\
        aura_env.clearTimers()\
        \
    elseif e == \"COMBAT_LOG_EVENT_UNFILTERED\" then\
        local _, subEvent, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID = ...\
        \
        if subEvent == \"SPELL_AURA_APPLIED\" and destGUID == UnitGUID(\"boss1\") and spellID == 422172 then\
            \
            aura_env.intermission = aura_env.intermission and aura_env.intermission + 1 or 1\
            WeakAuras.ScanEvents(\"ECHO_SMOLDERON_INTERMISSION_START\", aura_env.intermission)\
            aura_env.elogl(\"Smolderon Intermission, starting\", aura_env.intermission)\
        end\
    elseif (aura_env.testMode and e == \"ECHO_MACRO\" and ... == 1) then\
        aura_env.intermission = aura_env.intermission and aura_env.intermission + 1 or 1\
        WeakAuras.ScanEvents(\"ECHO_SMOLDERON_INTERMISSION_START\", aura_env.intermission)\
        aura_env.elog(\"Smolderon Intermission, starting\", aura_env.intermission)\
        \
    elseif(e == \"ECHO_SMOLDERON_INTERMISSION_START\" and ...) then\
        \
        -- start timer\
        aura_env.intermission = aura_env.intermission or 1\
        aura_env.thisIntermission = aura_env.sets[aura_env.intermission]\
        if not aura_env.thisIntermission then return end\
        aura_env.totalSets = #aura_env.thisIntermission\
        \
        aura_env.clearTimers()\
        for i, secs in ipairs(aura_env.thisIntermission.timings) do\
            aura_env.timers[i] = C_Timer.NewTimer(secs, function() WeakAuras.ScanEvents(\"ECHO_SMOLDERON_INTERMISSION_UPDATE\", i+1) end)\
        end\
        aura_env.timers[\"end\"] = C_Timer.NewTimer(30, function() WeakAuras.ScanEvents(\"ECHO_SMOLDERON_INTERMISSION_END\", true) end)\
        \
        if aura_env.config.useSound then PlaySoundFile(aura_env.config.sound, \"master\") end\
        \
        local text = aura_env.config.text == 1 and aura_env.getTextNowAndNext(aura_env.intermission, 1) \
        or aura_env.config.text == 2 and aura_env.getTextAllChosen(aura_env.intermission, 1, aura_env.totalSets) \
        or aura_env.config.text == 3 and aura_env.getStaggeredText(aura_env.intermission, 1, aura_env.totalSets)\
        \
        local chosen = aura_env.getChosenIndex(aura_env.intermission, 1)\
        local next = aura_env.getChosenIndex(aura_env.intermission, 2)\
        local nextMark\
        if next and chosen then\
            nextMark = next < chosen and \"^\" or \"v\"\
        end\
        local tts = aura_env.config[\"int\"..aura_env.intermission][\"tts\"..1]\
        if aura_env.config.tts and tts and tts ~= \"\" then\
            local aura_env = aura_env\
            if aura_env.config.ttsDelay and aura_env.config.ttsDelay > 0 then\
                C_Timer.After(aura_env.config.ttsDelay, function() aura_env.DoTTS(tts) end)\
            else\
                aura_env.DoTTS(tts)\
            end\
        end\
        \
        local dur = aura_env.thisIntermission.timings[1]\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            autoHide = false,\
            type = 1,\
            texture = aura_env.texture[\"\"],\
            visuals = aura_env.config.visuals,\
            current = chosen,\
        }\
        s[\"tick\"] = {\
            show = true,\
            changed = true,\
            duration = dur,\
            expirationTime = GetTime() + dur,\
            progressType = \"timed\",\
            autoHide = false,\
            type = 2,\
            text = text,\
            texture = aura_env.texture[\"tick\"],\
        }\
        \
        if aura_env.config.visuals then\
            for i, isGood in ipairs(aura_env.thisIntermission[1]) do\
                s[i] = {\
                    show = true,\
                    changed = true,\
                    --duration = 30,\
                    --autoHide = true,\
                    i = 1,\
                    index = i,\
                    chosen = i == chosen,\
                    next = i == next,\
                    nextMark = i == chosen and nextMark or \"\",\
                    isGood = isGood,\
                    showBad = aura_env.config.showBad,\
                    texture = aura_env.texture[i], \
                    ringText = aura_env.config.ringText,\
                }\
            end\
        end\
        \
        return true\
        \
    elseif e == \"ECHO_SMOLDERON_INTERMISSION_UPDATE\" and ... and s[\"\"] then\
        if WeakAuras.IsOptionsOpen() then aura_env.clearTimers() return end\
        local set = ...\
        local dur\
        if aura_env.thisIntermission.timings[set] and aura_env.thisIntermission.timings[set-1] then\
            dur = aura_env.thisIntermission.timings[set] - aura_env.thisIntermission.timings[set-1]\
        else\
            dur = set > 7 and 3 or 4\
        end\
        \
        local text = aura_env.config.text == 1 and aura_env.getTextNowAndNext(aura_env.intermission, set) \
        or aura_env.config.text == 2 and aura_env.getTextAllChosen(aura_env.intermission, set, aura_env.totalSets)\
        or aura_env.config.text == 3 and aura_env.getStaggeredText(aura_env.intermission, set, aura_env.totalSets)\
        local chosen = aura_env.getChosenIndex(aura_env.intermission, set)\
        local next = aura_env.getChosenIndex(aura_env.intermission, set + 1)\
        local nextMark\
        if next and chosen then\
            nextMark = next < chosen and \"^\" or \"v\"\
        end\
        local tts = aura_env.config[\"int\"..aura_env.intermission][\"tts\"..set]\
        if aura_env.config.tts then\
            local aura_env = aura_env\
            if aura_env.config.ttsDelay and aura_env.config.ttsDelay > 0 then\
                C_Timer.After(aura_env.config.ttsDelay, function() aura_env.DoTTS(tts) end)\
            else\
                aura_env.DoTTS(tts)\
            end\
        end\
        \
        if dur > 0 then\
            s[\"tick\"].duration = dur\
            s[\"tick\"].expirationTime = dur + GetTime()\
        end\
        s[\"tick\"].text = text\
        s[\"tick\"].changed = true\
        s[\"tick\"].current = chosen\
        \
        if aura_env.config.useSound then PlaySoundFile(aura_env.config.sound, \"master\") end\
        \
        if aura_env.config.visuals then\
            for i, isGood in ipairs(aura_env.thisIntermission[set]) do\
                s[i].isGood = isGood\
                s[i].i = set\
                s[i].chosen = i == chosen\
                s[i].next = i == next\
                s[i].nextMark = i == chosen and nextMark or \"\"\
                s[i].changed = true\
            end\
        end\
        return true\
    elseif e == \"ECHO_SMOLDERON_INTERMISSION_END\" and ... and s[\"\"] then\
        for _, state in pairs(s) do\
            state.show = false\
            state.changed = true\
        end\
        return true\
        \
    elseif e == \"XP_SMOLDERON_PATTERN\" and ... then\
        if type(...) == \"number\" and ... > 0 and ... <= 3 then\
            aura_env.intermission = ...\
            C_Timer.After(3.5, function() WeakAuras.ScanEvents(\"ECHO_SMOLDERON_INTERMISSION_START\", aura_env.intermission) end)\
        end\
    elseif e == \"XP_SMOLDERON_MOTE_STACKS\" and ... then\
        if ... < 5 then\
            PlaySoundFile(LibStub(\"LibSharedMedia-3.0\"):Fetch(\"sound\", \"Robot Blip\"))\
        else\
            PlaySoundFile(LibStub(\"LibSharedMedia-3.0\"):Fetch(\"sound\", \"Glass\"))\
        end\
        \
    elseif e == \"OPTIONS\" then\
        local text = aura_env.config.text\
        s[\"\"] = {show = true,\
            changed = true,\
            type = 1,\
            texture = aura_env.texture[\"\"],\
            visuals = aura_env.config.visuals,\
        }\
        s[\"tick\"] = {show = true,\
            changed = true,\
            type = 2,\
            texture = aura_env.texture[\"tick\"],\
            text = text == 1 and aura_env.getTextNowAndNext(2, 1) or text == 2 and aura_env.getTextAllChosen(2, 1, 7) or text == 3 and aura_env.getStaggeredText(2, 1, 7),\
        }\
        if aura_env.config.visuals then\
            for i = 1, 5 do\
                s[i] = {\
                    show = true,\
                    changed = true,\
                    index = i,\
                    chosen = i == 3,\
                    next = i == 1,\
                    nextMark = i == 3 and \"^\" or \"\",\
                    texture = aura_env.texture[i], \
                    isGood = i == 1 or i == 2 or i == 3 or i == 5,\
                    showBad = aura_env.config.showBad,\
                    ringText = aura_env.config.ringText,\
                }\
            end\
        end\
        return true\
    end\
end\
\
\
\
",["spellIds"] = {},["names"] = {},["check"] = "event",["events"] = "ECHO_SMOLDERON_INTERMISSION_START ECHO_SMOLDERON_INTERMISSION_UPDATE ECHO_SMOLDERON_INTERMISSION_END CLEU:SPELL_AURA_APPLIED ENCOUNTER_START XP_SMOLDERON_PATTERN XP_SMOLDERON_MOTE_STACKS",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["endAngle"] = 360,["internalVersion"] = 70,["crop_x"] = 0.41,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["orientation"] = "HORIZONTAL",["tocversion"] = 100200,["selfPoint"] = "TOP",["displayText_format_p_time_mod_rate"] = true,["backgroundColor"] = {0,0,0,0,},["anchorFrameType"] = "SCREEN",["icon"] = false,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text"] = "%text",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "BOTTOM",["text_automaticWidth"] = "Fixed",["text_fixedWidth"] = 300,["text_text_format_nowAndNext_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_text_format_text_format"] = "none",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -3,["text_text_format_allChosen_format"] = "none",["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "BOTTOM",["text_visible"] = true,["text_text_format_n_format"] = "none",["text_fontSize"] = 24,["anchorXOffset"] = 0,["text_font"] = "Fira Mono Medium",},{["text_shadowXOffset"] = 1,["text_text"] = "%nextMark",["text_shadowColor"] = {1,1,1,0,},["text_selfPoint"] = "BOTTOM",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {0,0,0,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_isGood_format"] = "none",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "BOTTOM",["text_visible"] = false,["text_text_format_n_format"] = "none",["text_fontSize"] = 18,["anchorXOffset"] = 0,["text_text_format_nextMark_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text"] = "%index",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "BOTTOM",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "BOTTOM",["text_anchorYOffset"] = 2,["text_text_format_n_format"] = "none",["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_visible"] = false,},{["text_shadowXOffset"] = 1,["text_text"] = "%staggeredText",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "BOTTOM",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Fira Mono Medium",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "TOP",["text_visible"] = true,["text_text_format_n_format"] = "none",["text_fontSize"] = 24,["anchorXOffset"] = 0,["text_text_format_staggeredText_format"] = "none",},},["height"] = 102,["rotate"] = false,["startAngle"] = 0,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",["source"] = "import",["sparkHidden"] = "NEVER",["config"] = {["ttsDelay"] = 0,["int2"] = {["tts3"] = "1",["set6"] = 5,["set1"] = 1,["tts5"] = "1",["set5"] = 1,["set4"] = 3,["set3"] = 1,["set2"] = 2,["tts1"] = "1",["tts4"] = "3",["set7"] = 2,["tts6"] = "5",["tts7"] = "2",["tts2"] = "2",},["int3"] = {["tts3"] = "2",["tts8"] = "1",["tts9"] = "2",["set3"] = 2,["set9"] = 2,["tts1"] = "2",["tts6"] = "1",["tts2"] = "1",["set6"] = 1,["set4"] = 1,["set5"] = 2,["set8"] = 1,["set2"] = 1,["tts4"] = "1",["set7"] = 2,["tts7"] = "2",["set1"] = 2,["tts5"] = "2",},["int4"] = {["tts3"] = "1",["set6"] = 5,["set1"] = 1,["tts5"] = "1",["set5"] = 1,["set4"] = 3,["set3"] = 1,["set2"] = 2,["tts1"] = "1",["tts4"] = "3",["set7"] = 2,["tts6"] = "5",["tts7"] = "2",["tts2"] = "2",},["text"] = 2,["visuals"] = true,["tts"] = false,["useSound"] = false,["showBad"] = false,["ringText"] = 2,["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BananaPeelSlip.ogg",["int1"] = {["tts3"] = "2",["set6"] = 1,["set1"] = 2,["tts5"] = "2",["set5"] = 2,["set4"] = 3,["set3"] = 2,["set2"] = 1,["tts1"] = "2",["tts4"] = "3",["set7"] = 3,["tts6"] = "1",["tts7"] = "3",["tts2"] = "1",},},["fontSize"] = 12,["mirror"] = false,["sparkRotationMode"] = "AUTO",["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["displayText_format_p_time_precision"] = 1,["icon_side"] = "RIGHT",["xOffset"] = 6.103515625e-05,["displayText_format_p_time_dynamic_threshold"] = 60,["sparkHeight"] = 30,["anchorPoint"] = "CENTER",["auraRotation"] = 0,["load"] = {["difficulty"] = {["single"] = "mythic",["multi"] = {["mythic"] = true,},},["use_encounterid"] = true,["encounterid"] = "2824",["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["use_difficulty"] = true,["size"] = {["multi"] = {},},},["justify"] = "LEFT",["parent"] = "7. Intermission Tick Display",["id"] = "7. Intermission Position Tracker - Smolderon",["user_y"] = 0.27,["frameStrata"] = 5,["width"] = 204,["displayText_format_p_time_format"] = 0,["desaturate"] = false,["inverse"] = false,["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["shadowColor"] = {0,0,0,1,},["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "index",["op"] = "==",["value"] = "1",},["changes"] = {{["value"] = 32,["property"] = "height",},{["value"] = 67,["property"] = "width",},},},{["check"] = {["trigger"] = 1,["variable"] = "index",["value"] = "2",["op"] = "==",},["changes"] = {{["value"] = 47,["property"] = "height",},{["value"] = 99,["property"] = "width",},{["value"] = {1,1,1,0.10000002384186,},["property"] = "backgroundColor",},},},{["check"] = {["trigger"] = 1,["variable"] = "index",["op"] = "==",["value"] = "3",},["changes"] = {{["value"] = 63,["property"] = "height",},{["value"] = 130,["property"] = "width",},},},{["check"] = {["trigger"] = 1,["variable"] = "index",["value"] = "4",["op"] = "==",},["changes"] = {{["value"] = 84,["property"] = "height",},{["value"] = 168,["property"] = "width",},{["value"] = {1,1,1,0.10000002384186,},["property"] = "backgroundColor",},},},{["check"] = {["trigger"] = 1,["variable"] = "chosen",["value"] = 1,},["changes"] = {{["value"] = {0.12549020349979,0.74117648601532,0.023529414087534,1,},["property"] = "backgroundColor",},},},{["check"] = {["trigger"] = 1,["variable"] = "next",["value"] = 1,},["changes"] = {{["value"] = {0,0.90196084976196,1,0.75,},["property"] = "foregroundColor",},},},{["check"] = {["trigger"] = 1,["variable"] = "type",["op"] = "==",["value"] = "1",},["changes"] = {{["value"] = {0,0,0,0.53000000119209,},["property"] = "backgroundColor",},{["value"] = {1,1,1,0.14000004529953,},["property"] = "foregroundColor",},},},{["check"] = {["trigger"] = 1,["variable"] = "visuals",["value"] = 0,},["changes"] = {{["value"] = {1,1,1,0,},["property"] = "backgroundColor",},{["value"] = {1,1,1,0,},["property"] = "foregroundColor",},},},{["check"] = {["trigger"] = 1,["variable"] = "type",["value"] = "2",["op"] = "==",},["changes"] = {{["value"] = 20,["property"] = "height",},{["value"] = 22,["property"] = "yOffsetRelative",},{["value"] = {0,0,0,0.37999999523163,},["property"] = "backgroundColor",},{["value"] = {0,0.49411767721176,0.79607850313187,0.73000001907349,},["property"] = "foregroundColor",},{},},},{["check"] = {["trigger"] = 1,["variable"] = "ringText",["op"] = "==",["value"] = "1",},["changes"] = {{["value"] = true,["property"] = "sub.4.text_visible",},},},{["check"] = {["trigger"] = 1,["variable"] = "ringText",["value"] = "2",["op"] = "==",},["changes"] = {{["value"] = true,["property"] = "sub.3.text_visible",},},},{["check"] = {["trigger"] = -2,["variable"] = "AND",["op"] = "==",["checks"] = {{["trigger"] = 1,["variable"] = "showBad",["value"] = 1,},{["trigger"] = 1,["variable"] = "isGood",["value"] = 0,},},},["changes"] = {{["value"] = {0.69803923368454,0,0,0.47000002861023,},["property"] = "backgroundColor",},},},},["barColor2"] = {1,1,0,1,},["sparkColor"] = {1,1,1,1,},},["7. Intermission Tick Display"] = {["controlledChildren"] = {"7. Intermission Position Tracker - Smolderon",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {0,0,0,1,},["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "7. Intermission Tick Display",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "7. Singles - Smolderon",["config"] = {},["selfPoint"] = "CENTER",["xOffset"] = 0,["uid"] = "FT(sz9Zl(ra",["conditions"] = {},["information"] = {},["borderInset"] = 1,},["7. [SOAKED] - Emberscar's Mark Debuff - Smolderon"] = {["iconSource"] = -1,["parent"] = "7. Icons (low) - Smolderon",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"421643",},["fetchTooltip"] = true,["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["unit"] = "player",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip2_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.ttoltip1_format"] = "none",["text_text_format_1.tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["authorOptions"] = {},["stickyDuration"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "7. [SOAKED] - Emberscar's Mark Debuff - Smolderon",["frameStrata"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "WMP923xtf94",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["xOffset"] = 0,},["7, Simple Healer Glows"] = {["controlledChildren"] = {"7. Overheated Glow",},["borderBackdrop"] = "Blizzard Tooltip",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "7, Simple Healer Glows",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["borderInset"] = 1,["uid"] = "SdzAA4XF5hn",["parent"] = "7. Singles - Smolderon",["xOffset"] = 0,["conditions"] = {},["information"] = {},["config"] = {},},["7. [BUFF] - Ignited Essence  - Smolderon"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["stacksOperator"] = "<",["auranames"] = {"421858",},["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["useStacks"] = false,["stacks"] = "5",["spellIds"] = {},["unit"] = "player",["subeventPrefix"] = "SPELL",["subeventSuffix"] = "_CAST_START",["type"] = "aura2",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "BUFF",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_tooltip1_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = true,["glowType"] = "Proc",["glowLength"] = 10,["text_text"] = "",["glowDuration"] = 1,["glowYOffset"] = 2,["glowColor"] = {0.97254908084869,1,0.98431378602982,1,},["glowStartAnim"] = false,["glowXOffset"] = 2,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2824",["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "stacks",["op"] = "==",["value"] = "1",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\RobotBlip.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "stacks",["value"] = "2",["op"] = "==",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\RobotBlip.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "stacks",["op"] = "==",["value"] = "3",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\RobotBlip.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "stacks",["value"] = "4",["op"] = "==",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\RobotBlip.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "stacks",["op"] = "==",["value"] = "5",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Glass.mp3",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "stacks",["op"] = "<",["value"] = "5",},["changes"] = {{["value"] = true,["property"] = "sub.3.glow",},},},},["parent"] = "7. Icons (high) - Smolderon",["selfPoint"] = "CENTER",["uid"] = "iElNjRH6q(e",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "7. [BUFF] - Ignited Essence  - Smolderon",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},["7. Warning for next soaks"] = {["outline"] = "OUTLINE",["authorOptions"] = {},["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\Details\\sounds\\sound_jedi1.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {"421343",},["spellId"] = "421343",["use_absorbMode"] = true,["names"] = {},["remaining"] = "5.7",["debuffType"] = "HELPFUL",["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["event"] = "Cast",["use_spellNames"] = true,["remaining_operator"] = "<",["use_spellId"] = true,["count"] = "1,3,5,7,9,11,13,15,17",["use_remaining"] = false,["use_count"] = true,["unit"] = "boss",["spellIds"] = {},["use_unit"] = true,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["use_count"] = false,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["remaining_operator"] = "<",["event"] = "Boss Mod Timer",["unit"] = "player",["spellIds"] = {},["use_spellId"] = true,["count"] = "1,3,5,7,9,11,13,15,17",["remaining"] = "5.7",["names"] = {},["spellId"] = "421343",["use_remaining"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["useRem"] = true,["type"] = "aura2",["names"] = {},["auranames"] = {"421455",},["unit"] = "group",["remOperator"] = ">",["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["useGroup_count"] = true,["group_countOperator"] = ">",["spellIds"] = {},["useName"] = true,["group_count"] = "0",["rem"] = "4",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},[4] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"421455",},["debuffType"] = "HARMFUL",["matchesShowOn"] = "showOnMissing",["event"] = "Combat Log",["unit"] = "player",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["spellIds"] = {},["useGroup_count"] = true,["group_count"] = "0",["names"] = {},["useName"] = true,["group_countOperator"] = ">",},["untrigger"] = {},},[5] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"421656",},["group_countOperator"] = "==",["matchesShowOn"] = "showOnMissing",["event"] = "Combat Log",["unit"] = "group",["useGroup_count"] = true,["names"] = {},["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["group_count"] = "0",["subeventPrefix"] = "SPELL",["useName"] = true,["debuffType"] = "HARMFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return (t[1] and t[2]) and t[3] and t[4] and t[5] end",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["wordWrap"] = "WordWrap",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["difficulty"] = {["single"] = "mythic",},["size"] = {["multi"] = {},},["encounterid"] = "2824",["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["use_encounterid"] = true,},["fontSize"] = 40,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_time_mod_rate"] = true,["selfPoint"] = "BOTTOM",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "show",["value"] = 1,},["changes"] = {{["value"] = "SOAK %p",["property"] = "displayText",},{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\Addons\\Details\\sounds\\sound_jedi1.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},},["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["displayText_format_p_time_precision"] = 1,["url"] = "https://echoesports.gg",["config"] = {},["parent"] = "7. Texts - Smolderon",["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "7. Warning for next soaks",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "(FgXlUE0397",["displayText"] = "BIG SOAK %p",["color"] = {1,1,1,1,},["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,},["7. Fully Absorbed - Cauterizing Wound - First 1"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = -11,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.63921570777893,1,1,},["desc"] = "Shows a bar when the first person's heal absorb is removed, so you know when damage will occur nearby. ",["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["difficulty"] = {["single"] = "mythic",},["use_encounterid"] = true,["encounterid"] = "2824",["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_difficulty"] = true,["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = false,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["borderInset"] = 11,["displayIcon"] = "134337",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["color"] = {},["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["parent"] = "7. Cauterizing Wound Bars",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["sparkRotationMode"] = "AUTO",["config"] = {},["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["unit"] = "player",["events"] = "CLEU:SPELL_CAST_SUCCESS:SPELL_AURA_REMOVED",["spellIds"] = {},["custom_type"] = "stateupdate",["check"] = "event",["names"] = {},["custom"] = "function(s, event, timestamp, subEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID)\
    if subEvent == \"SPELL_CAST_SUCCESS\" and spellID == 421343 then\
        aura_env.count = 0\
    elseif subEvent == \"SPELL_AURA_REMOVED\" and spellID == 421656 and UnitGroupRolesAssigned(destName) ~= \"TANK\" then\
        \
        aura_env.count = aura_env.count and aura_env.count + 1 or 1\
        if aura_env.count < 2 then\
            \
            if destName == WeakAuras.me then\
                SendChatMessage(\"X\")\
            end\
            \
            s[aura_env.count] = {\
                show = true,\
                changed = true,\
                autoHide = true,\
                progressType = \"timed\",\
                duration = 3,\
                expirationTime = GetTime() + 3,\
                unit = destName,\
                index = aura_env.count\
            }\
            return true\
        end\
    elseif event == \"OPTIONS\" then\
        for i = 1, 1 do\
            s[i] = {\
                show = true,\
                changed = true,\
                autoHide = true,\
                duration = 3,\
                expirationTime = GetTime() + 3,\
                progressType = \"timed\",\
                unit = \"player\",\
                index = aura_env.count\
            }\
        end\
        return true\
    end\
end\
\
\
\
",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"421455",},["unit"] = "player",["matchesShowOn"] = "showOnMissing",["useName"] = true,["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["stacksFont"] = "Friz Quadrata TT",["internalVersion"] = 70,["uid"] = "okchpusk5S9",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkColor"] = {1,1,1,1,},["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["rotateText"] = "NONE",["stacksFlags"] = "None",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "%unit",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_text_format_unit_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_unit_format"] = "Unit",["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = false,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_text_format_destName_abbreviate"] = false,["text_text_format_unit_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_unit_color"] = "class",["text_text_format_raidMar_format"] = "none",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_text_format_unit_abbreviate_max"] = 8,},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_shadowYOffset"] = -1,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["anchorYOffset"] = 0,},{["border_anchor"] = "bar",["border_size"] = 1,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 12,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["timer"] = true,["customTextUpdate"] = "update",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["customText"] = "function()\
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
",["icon_side"] = "LEFT",["textFlags"] = "None",["auto"] = true,["sparkHeight"] = 14,["authorOptions"] = {},["sparkRotation"] = 0,["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["icon"] = false,["id"] = "7. Fully Absorbed - Cauterizing Wound - First 1",["displayTextLeft"] = "%n",["frameStrata"] = 1,["width"] = 240,["backgroundColor"] = {0,0,0,0.33132427930832,},["desaturate"] = false,["inverse"] = false,["zoom"] = 0,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkOffsetX"] = 0,},["7. Smolderon"] = {["controlledChildren"] = {"7. Icons (high) - Smolderon","7. Icons (low) - Smolderon","7. Bars - Smolderon","7. Texts - Smolderon","7. Singles - Smolderon",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = " Echo - Amirdrassil",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "7. Smolderon",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["groupIcon"] = "5342930",["borderInset"] = 1,["xOffset"] = 0,["selfPoint"] = "CENTER",["config"] = {},["conditions"] = {},["information"] = {},["uid"] = "55)9b1xOFLe",},});


-- 7. manifest data

journal:AddManifestData({
	{
		["echoVersion"] = 2,
		["parent"] = " Echo - Amirdrassil",
		["id"] = "7. Smolderon",
		["children"] = {
			"7. Singles - Smolderon",
			"7. Texts - Smolderon",
			"7. Bars - Smolderon",
			"7. Icons (low) - Smolderon",
			"7. Icons (high) - Smolderon",
		},
		["uid"] = "55)9b1xOFLe",
	},
	{
		["echoVersion"] = 2,
		["parent"] = "7. Smolderon",
		["id"] = "7. Singles - Smolderon",
		["children"] = {
			"7. Absorb Healthpot/HS - Smolderon",
			"7. Private Aura Holder - Smolderon",
			"7. Cauterizing Wound Bars",
			"7. Overheated Progress - Smolderon (simple)",
			"7. Smart Healer Glows",
			"7, Simple Healer Glows",
			"7. Intermission Tick Display",
			"7. Fixate ASSIGN MAIN",
			"7. Fixate List",
			"Set Private Aura Text to LARGE",
		},
		["uid"] = "uoqrvri(Jl0",
	},
	{
		["id"] = "7. Absorb Healthpot/HS - Smolderon",
		["uid"] = "hRCZvcYp7L8",
		["parent"] = "7. Singles - Smolderon",
		["echoVersion"] = 7,
	},
	{
		["id"] = "7. Private Aura Holder - Smolderon",
		["uid"] = "EOWbe)SPthO",
		["parent"] = "7. Singles - Smolderon",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "7. Singles - Smolderon",
		["id"] = "7. Cauterizing Wound Bars",
		["children"] = {
			"7. Cauterizing Wound TIMER Bar - Smolderon",
			"7. Cauterizing Wound ABSORB Bar - Smolderon",
			"7. Fully Absorbed - Cauterizing Wound - First 1",
		},
		["uid"] = "piS8NjAeu0C",
	},
	{
		["id"] = "7. Cauterizing Wound TIMER Bar - Smolderon",
		["uid"] = ")rm2ImqNHqo",
		["parent"] = "7. Cauterizing Wound Bars",
		["echoVersion"] = 3,
	},
	{
		["id"] = "7. Cauterizing Wound ABSORB Bar - Smolderon",
		["uid"] = "hS9wg68KSeo",
		["parent"] = "7. Cauterizing Wound Bars",
		["echoVersion"] = 3,
	},
	{
		["id"] = "7. Fully Absorbed - Cauterizing Wound - First 1",
		["uid"] = "okchpusk5S9",
		["parent"] = "7. Cauterizing Wound Bars",
		["echoVersion"] = 2,
	},
	{
		["id"] = "7. Overheated Progress - Smolderon (simple)",
		["uid"] = "d5IzzFG1RuQ",
		["parent"] = "7. Singles - Smolderon",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "7. Singles - Smolderon",
		["id"] = "7. Smart Healer Glows",
		["children"] = {
			"7. Assign healers to absorbs",
		},
		["uid"] = "Q3NFyT9Oa9Z",
	},
	{
		["id"] = "7. Assign healers to absorbs",
		["uid"] = "CIEHuOjwYzK",
		["parent"] = "7. Smart Healer Glows",
		["echoVersion"] = 10,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "7. Singles - Smolderon",
		["id"] = "7, Simple Healer Glows",
		["children"] = {
			"7. Overheated Glow",
		},
		["uid"] = "SdzAA4XF5hn",
	},
	{
		["id"] = "7. Overheated Glow",
		["uid"] = "okl(axKd42d",
		["parent"] = "7, Simple Healer Glows",
		["echoVersion"] = 0,
	},
	{
		["echoVersion"] = 2,
		["parent"] = "7. Singles - Smolderon",
		["id"] = "7. Intermission Tick Display",
		["children"] = {
			"7. Intermission Position Tracker - Smolderon",
		},
		["uid"] = "FT(sz9Zl(ra",
	},
	{
		["id"] = "7. Intermission Position Tracker - Smolderon",
		["uid"] = "D3uQ8wZqHT7",
		["parent"] = "7. Intermission Tick Display",
		["echoVersion"] = 7,
	},
	{
		["id"] = "7. Fixate ASSIGN MAIN",
		["uid"] = "3ewNZ0ghHHL",
		["parent"] = "7. Singles - Smolderon",
		["echoVersion"] = 20,
	},
	{
		["echoVersion"] = 2,
		["parent"] = "7. Singles - Smolderon",
		["id"] = "7. Fixate List",
		["children"] = {
			"7. Fixate List (MACRO) - Smolderon",
		},
		["uid"] = "37WlR2kb6BN",
	},
	{
		["id"] = "7. Fixate List (MACRO) - Smolderon",
		["uid"] = ")iZqHK0lWuH",
		["parent"] = "7. Fixate List",
		["echoVersion"] = 3,
	},
	{
		["id"] = "Set Private Aura Text to LARGE",
		["uid"] = "HcHCGf73qXo",
		["parent"] = "7. Singles - Smolderon",
		["echoVersion"] = 0,
	},
	{
		["echoVersion"] = 2,
		["parent"] = "7. Smolderon",
		["id"] = "7. Texts - Smolderon",
		["children"] = {
			"7. [SOAK ORBS] - Smolderon ",
			"7. Warning for next soaks",
			"7. Intermission Pattern Starting",
		},
		["uid"] = "kkzJNfD(itA",
	},
	{
		["id"] = "7. [SOAK ORBS] - Smolderon ",
		["uid"] = "Q3A50DLwTf9",
		["parent"] = "7. Texts - Smolderon",
		["echoVersion"] = 0,
	},
	{
		["id"] = "7. Warning for next soaks",
		["uid"] = "(FgXlUE0397",
		["parent"] = "7. Texts - Smolderon",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. Intermission Pattern Starting",
		["uid"] = "mimwMIvb3v8",
		["parent"] = "7. Texts - Smolderon",
		["echoVersion"] = 0,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "7. Smolderon",
		["id"] = "7. Bars - Smolderon",
		["children"] = {
			"7. [BOMB] - Searing Aftermath on Tank - Smolderon",
			"7. [KNOCKBACK] - World In Flames Cast - Smolderon",
			"7. [BAITS] - Lava Geysers Cast - Smolderon",
			"7. [SOAK] - Brand of Damnation Cast - Smolderon",
		},
		["uid"] = "4YHJuThuFky",
	},
	{
		["id"] = "7. [BOMB] - Searing Aftermath on Tank - Smolderon",
		["uid"] = "AWNso3A6u53",
		["parent"] = "7. Bars - Smolderon",
		["echoVersion"] = 2,
	},
	{
		["id"] = "7. [KNOCKBACK] - World In Flames Cast - Smolderon",
		["uid"] = "vs7dUmE1zIN",
		["parent"] = "7. Bars - Smolderon",
		["echoVersion"] = 3,
	},
	{
		["id"] = "7. [BAITS] - Lava Geysers Cast - Smolderon",
		["uid"] = "iK1hjvwHMBP",
		["parent"] = "7. Bars - Smolderon",
		["echoVersion"] = 2,
	},
	{
		["id"] = "7. [SOAK] - Brand of Damnation Cast - Smolderon",
		["uid"] = "qou2mXYlema",
		["parent"] = "7. Bars - Smolderon",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "7. Smolderon",
		["id"] = "7. Icons (low) - Smolderon",
		["children"] = {
			"7. [MOVE] - Roiling Lava Debuff - Smolderon",
			"7. [MOVE] - Smoldering Ground Debuff - Smolderon",
			"7. [SOAKED] - Emberscar's Mark Debuff - Smolderon",
		},
		["uid"] = "uXwyxYG1gAw",
	},
	{
		["id"] = "7. [MOVE] - Roiling Lava Debuff - Smolderon",
		["uid"] = "sGQvcWDq74c",
		["parent"] = "7. Icons (low) - Smolderon",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. [MOVE] - Smoldering Ground Debuff - Smolderon",
		["uid"] = "hn414olt1QP",
		["parent"] = "7. Icons (low) - Smolderon",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. [SOAKED] - Emberscar's Mark Debuff - Smolderon",
		["uid"] = "WMP923xtf94",
		["parent"] = "7. Icons (low) - Smolderon",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "7. Smolderon",
		["id"] = "7. Icons (high) - Smolderon",
		["children"] = {
			"7 .[DOT] - Inferno Debuff - Smolderon",
			"7 .[DOT] - Lingering Burn Debuff - Smolderon",
			"7. [BUFF] - Ignited Essence  - Smolderon",
			"7. [WAVES] - Overheated Debuff - Smolderon",
			"7. [500%] - Seeking Inferno Debuff - Smolderon",
			"7. [HEAL ABSORB] - Cauterizing Wound Debuff - Smolderon",
			"7. [TANK BOMB] - Searing Aftermath Debuff - Smolderon",
		},
		["uid"] = "(kDSC(FxFO0",
	},
	{
		["id"] = "7 .[DOT] - Inferno Debuff - Smolderon",
		["uid"] = "qBcHgdDOv1x",
		["parent"] = "7. Icons (high) - Smolderon",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7 .[DOT] - Lingering Burn Debuff - Smolderon",
		["uid"] = "OmpF20pxmQF",
		["parent"] = "7. Icons (high) - Smolderon",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. [BUFF] - Ignited Essence  - Smolderon",
		["uid"] = "iElNjRH6q(e",
		["parent"] = "7. Icons (high) - Smolderon",
		["echoVersion"] = 2,
	},
	{
		["id"] = "7. [WAVES] - Overheated Debuff - Smolderon",
		["uid"] = "1RHTTRwFl0A",
		["parent"] = "7. Icons (high) - Smolderon",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. [500%] - Seeking Inferno Debuff - Smolderon",
		["uid"] = "GpiP)YeRO0I",
		["parent"] = "7. Icons (high) - Smolderon",
		["echoVersion"] = 1,
	},
	{
		["id"] = "7. [HEAL ABSORB] - Cauterizing Wound Debuff - Smolderon",
		["uid"] = "8BNBMC2BaCT",
		["parent"] = "7. Icons (high) - Smolderon",
		["echoVersion"] = 2,
	},
	{
		["id"] = "7. [TANK BOMB] - Searing Aftermath Debuff - Smolderon",
		["uid"] = "asTExzwtilr",
		["parent"] = "7. Icons (high) - Smolderon",
		["echoVersion"] = 1,
	},
},1207,0);

--fixUpNestedPreview(7,1207,"7. Smolderon");
