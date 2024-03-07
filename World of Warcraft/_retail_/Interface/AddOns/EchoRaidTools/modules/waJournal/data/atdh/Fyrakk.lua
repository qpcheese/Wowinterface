
local _AddonName, _EchoRaidTools = ...;

local journal = _EchoRaidTools:GetModule("waJournal");

-- 9. export data

journal:AddImportData({["9. [KNOCK UP] Incarnate Cast Success - Fyrakk the Blazing (transition 2)"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 300,["anchorPoint"] = "CENTER",["echoVersion"] = 6,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "5342925",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Singles - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["zoom"] = 0,["customTextUpdate"] = "update",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {412761,},["spellId"] = {412761,},["duration"] = "5.5",["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",["type"] = "combatlog",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["use_spellNames"] = true,["use_unit"] = true,["use_count"] = true,["use_spellId"] = true,["spellIds"] = {},["names"] = {},["use_absorbMode"] = true,["event"] = "Combat Log",["unit"] = "boss",["count"] = "4",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["config"] = {},["internalVersion"] = 70,["auto"] = true,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = true,},["init"] = {},["finish"] = {},},["stickyDuration"] = false,["width"] = 400,["sparkRotation"] = 0,["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FLY AWAY",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 32,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},{["tick_blend_mode"] = "ADD",["type"] = "subtick",["tick_xOffset"] = 0,["tick_desaturate"] = false,["automatic_length"] = true,["tick_thickness"] = 2,["tick_color"] = {1,1,1,1,},["use_texture"] = false,["tick_placement_mode"] = "AtValue",["tick_visible"] = true,["tick_placement"] = "0.5",["tick_yOffset"] = 0,["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["tick_length"] = 30,["tick_mirror"] = false,["tick_rotation"] = 0,},},["height"] = 30,["timerFlags"] = "None",["id"] = "9. [KNOCK UP] Incarnate Cast Success - Fyrakk the Blazing (transition 2)",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["icon"] = true,["border"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderSize"] = 16,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["sparkHeight"] = 14,["borderInFront"] = false,["authorOptions"] = {},["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["customText"] = "function()\
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
",["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotationMode"] = "AUTO",["url"] = "https://echoesports.gg",["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "ZMmJow2fz34",},["9. Icons (high) - Fyrakk the Blazing"] = {["arcLength"] = 360,["controlledChildren"] = {"9. [BIG DOT] Apocalypse Roar Debuff - Fyrakk the Blazing","9. [SPREAD] Blaze Debuff - Fyrakk the Blazing","9. [LEAP] Darkflame Cleave TARGET Debuff - Fyrakk the Blazing","9. [MARK] Fyr'alath's Mark Debuff - Fyrakk the Blazing","9. [FLAME] Flamebound Debuff - Fyrakk the Blazing","9. [SHADOW] Shadowbound Debuff - Fyrakk the Blazing","9. [FAIL] Exploding Core Debuff - Fyrakk the Blazing (add)","9. [SEED STACKS] Corruption - Fyrakk the Blazing","9. [FIRESTORM] Eternal Firestorm - Fyrakk the Blazing",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Fyrakk the Blazing",["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["9. [LEAP] Darkflame Cleave TARGET Debuff - Fyrakk the Blazing"] = false,["9. [SPREAD] Blaze Debuff - Fyrakk the Blazing"] = false,["9. [FLAME] Flamebound Debuff - Fyrakk the Blazing"] = false,["9. [MARK] Fyr'alath's Mark Debuff - Fyrakk the Blazing"] = false,["9. [FAIL] Exploding Core Debuff - Fyrakk the Blazing (add)"] = false,["9. [FIRESTORM] Eternal Firestorm - Fyrakk the Blazing"] = false,["9. [SEED STACKS] Corruption - Fyrakk the Blazing"] = false,["9. [BIG DOT] Apocalypse Roar Debuff - Fyrakk the Blazing"] = false,["9. [SHADOW] Shadowbound Debuff - Fyrakk the Blazing"] = false,},["fullCircle"] = true,["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["stagger"] = 0,["borderColor"] = {0,0,0,1,},["rotation"] = 0,["subRegions"] = {},["useLimit"] = false,["radius"] = 200,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["gridType"] = "RD",["backdropColor"] = {1,1,1,0.5,},["config"] = {},["animate"] = false,["regionType"] = "dynamicgroup",["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Icon - High Priority - Anchor [AMIR]",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["xOffset"] = 0,["gridWidth"] = 5,["grow"] = "LEFT",["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["borderEdge"] = "Square Full White",["borderOffset"] = 4,["authorOptions"] = {},["tocversion"] = 100200,["id"] = "9. Icons (high) - Fyrakk the Blazing",["limit"] = 5,["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["anchorPoint"] = "CENTER",["borderInset"] = 1,["source"] = "import",["space"] = 2,["uid"] = "kowsn2jXDsW",["conditions"] = {},["information"] = {},["selfPoint"] = "RIGHT",},["9. Singles - Fyrakk the Blazing"] = {["controlledChildren"] = {"Amirdrassil Health Bar (widget)","9. Corruption Glow (basic)","9. GS up on Ancient","Intermission Positions","Aflame Tracker","9. Corruption Groups","Fyrakk Seeds","Corruption Tracker (simple)","9. [SEED STACKS] Corruption - Fyrakk the Blazing (own stacks)","9. Private Aura Holder 1 (singles) - Fyrakk","9. Private Aura Holder 2 (singles) - Fyrakk","9. Private Aura Holder 3 (singles) - Fyrakk","9. Mass Dispel [MASS DISPEL] - Fyrakk","9. [SCOOCHING] Dream Rend Duration - Fyrakk the Blazing","9. [SCOOCHING] Dream Rend Duration - Fyrakk the Blazing 2","9. Player Can Dwarf Aflame phase2","9. Player Can Dwarf Aflame phase1","Adds Marker","9. [KNOCK UP] Incarnate Cast Success - Fyrakk the Blazing","9. [KNOCK UP] Incarnate Cast Success - Fyrakk the Blazing (transition 2)","9. [GET SHIELD + PUSH] Apocalypse Roar Cast - Fyrakk the Blazing",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Fyrakk the Blazing",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "9. Singles - Fyrakk the Blazing",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["uid"] = "svGB)wWiHLd",["config"] = {},["xOffset"] = 0,["borderInset"] = 1,["conditions"] = {},["information"] = {},["selfPoint"] = "CENTER",},["Intermission Positions (fire Macro)"] = {["color"] = {1,1,1,1,},["preferToUpdate"] = false,["customText"] = "function()\
    if aura_env.state.show and aura_env.state.say then\
        if not aura_env.last or aura_env.last < GetTime() - 1.5 then\
            aura_env.last = GetTime()\
            SendChatMessage(aura_env.state.say)\
        end\
    end\
end\
\
\
\
",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 34,["customTextUpdate"] = "update",["actions"] = {["start"] = {["message"] = "%say",["custom"] = "if aura_env.state.me then\
    local say = aura_env.state.say\
    for i = 1, 12 do\
        C_Timer.After(i * 1.5, function() SendChatMessage(say) end)\
    end\
    SendChatMessage(say)\
end",["message_format_say_format"] = "none",["message_type"] = "SAY",["do_message"] = false,["do_custom"] = true,},["init"] = {["do_custom"] = true,["custom"] = "function aura_env.getFullGroup()\
    local t = {}\
    for unit in WA_IterateGroupMembers() do\
        local _, _, subGroup = GetRaidRosterInfo(UnitInRaid(unit))\
        if subGroup <= 4 and (not UnitIsDeadOrGhost(unit)) then\
            table.insert(t, (UnitName(unit)))\
        end\
    end\
    return t\
end\
\
aura_env.posNames = {\"L1\", \"L2\", \"L3\", \"L4\", \"L5\", \"R5\", \"R4\", \"R3\", \"R2\", \"R1\"}",},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["customVariables"] = "{type = \"string\", me = \"bool\", dead = \"bool\"}",["event"] = "Health",["subeventPrefix"] = "SPELL",["events"] = "ENCOUNTER_START CLEU:SPELL_CAST_SUCCESS:SPELL_CAST_START ECHO_PRIVATE_AURA ECHO_FYRAK_INTERMISSION_POSITIONS",["custom"] = "function(s,e,...)\
    if e == \"ENCOUNTER_START\" then\
        aura_env.count = 0\
        \
    elseif e == \"COMBAT_LOG_EVENT_UNFILTERED\" then\
        local _, subEvent, _, sourceGUID, _, _, _, destGUID, destName, _, _, spellID = ...\
        if subEvent == \"SPELL_CAST_SUCCESS\" and spellID == 412761 then\
            --elogl(\"Fyrakk - intermission, starting to listen\")\
            aura_env.count = aura_env.count + 1\
            if aura_env.count == 1 then\
                aura_env.clicked = 0\
                aura_env.intermission = true\
                aura_env.fire = {}\
                aura_env.shadow = {}\
                \
            end\
            \
        elseif subEvent == \"SPELL_CAST_START\" and spellID == 419144 and aura_env.intermission then\
            WeakAuras.ScanEvents(\"ECHO_FYRAK_INTERMISSION_POSITIONS\", true)\
            \
        end\
        \
    elseif e == \"ECHO_FYRAK_INTERMISSION_POSITIONS\" and ... then\
        \
        if aura_env.fire and #aura_env.fire > 0 then\
            \
            local shadow = aura_env.getFullGroup()\
            for i, name in ipairs(aura_env.fire) do\
                tDeleteItem(shadow, name)\
            end\
            \
            table.sort(aura_env.fire)\
            local fireTotal = #aura_env.fire\
            for i = 1, (10 - fireTotal) do\
                table.insert(aura_env.fire, ceil(fireTotal/2), \"dead\")\
            end\
            WeakAuras.ScanEvents(\"FYRAKK_INTERMISSION_FIRE_LIST\", CopyTable(aura_env.fire))\
            elogl(\"Fyrak Flamebound\", #aura_env.fire,unpack(aura_env.fire))\
            \
            \
            table.sort(shadow)\
            local shadowTotal = #shadow\
            for i = 1, (10 - shadowTotal) do\
                table.insert(shadow, ceil(shadowTotal/2), \"dead\")\
            end\
            WeakAuras.ScanEvents(\"FYRAKK_INTERMISSION_SHADOW_LIST\", CopyTable(shadow))\
            elogl(\"Fyrak Shadowbound\", #shadow, unpack(shadow))\
            \
            aura_env.intermission = false\
            local myIndex = tIndexOf(aura_env.fire, WeakAuras.me)\
            if myIndex then\
                \
                for i = 1, #aura_env.fire do\
                    s[i] = {\
                        show = true,\
                        changed = true,\
                        me = i == myIndex,\
                        type = \"fire\",\
                        index = i,\
                        duration = 7,\
                        autoHide = true,\
                        pos = aura_env.posNames[i],\
                        dead = aura_env.fire[i] == \"dead\",\
                        say = i == myIndex and aura_env.posNames[i] and aura_env.posNames[i]..\"{rt2}\" or nil,\
                        texture = i == myIndex and [[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Circle_White]] or nil,\
                    }\
                end\
                return true\
            end\
            \
            local myIndex = tIndexOf(shadow, WeakAuras.me)\
            if myIndex then\
                \
                for i = 1, #shadow do\
                    s[i] = {\
                        show = true,\
                        changed = true,\
                        me = i == myIndex,\
                        type = \"shadow\",\
                        index = i,\
                        duration = 7,\
                        autoHide = true,\
                        dead = shadow[i] == \"dead\",\
                        pos = aura_env.posNames[i],\
                        say = i == myIndex and aura_env.posNames[i] and aura_env.posNames[i]..\"{rt3}\" or nil,\
                        texture = i == myIndex and [[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Circle_White]] or nil,\
                    }\
                end\
                return true\
            end\
        end\
        \
    elseif e == \"ECHO_PRIVATE_AURA\" and aura_env.intermission then\
        \
        local spellIndex, unit = ...\
        \
        if unit and spellIndex == 1 then\
            if not tContains(aura_env.fire, unit) then\
                \
                aura_env.clicked = aura_env.clicked and aura_env.clicked + 1 or 1\
                table.insert(aura_env.fire, unit)\
            end\
        end\
        \
        \
    elseif e == \"OPTIONS\" then\
        local type = math.random() < 0.5 and \"fire\" or \"shadow\"\
        local myIndex = math.random(1,10)\
        local dead = math.random(1,10)\
        for i = 1, 10 do\
            s[i] = {\
                show = true,\
                changed = true,\
                me = i == myIndex,\
                type = type,\
                index = i,\
                dead = i == dead,\
                pos = aura_env.posNames[i],\
                texture = i == myIndex and [[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Circle_White]] or nil,\
            }\
        end\
        return true\
    end\
end\
\
\
",["spellIds"] = {},["custom_type"] = "stateupdate",["check"] = "event",["names"] = {},["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["selfPoint"] = "CENTER",["desaturate"] = false,["rotation"] = 0,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text"] = "%pos",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_pos_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,0.41000002622604,},["text_font"] = "Expressway",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "CENTER",["text_text_format_n_format"] = "none",["text_visible"] = true,["text_fontSize"] = 12,["anchorXOffset"] = 0,["text_text_format_c_format"] = "none",},},["height"] = 20,["rotate"] = false,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["source"] = "import",["mirror"] = false,["regionType"] = "texture",["blendMode"] = "BLEND",["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_30px.tga",["desc"] = "Macro:\
/run WeakAuras.ScanEvents(\"ECHO_MACRO\",1)\
Press when you have FIRE ONLY.\
Assigns positions for the Intermission.",["frameStrata"] = 1,["tocversion"] = 100200,["id"] = "Intermission Positions (fire Macro)",["parent"] = "Intermission Positions",["alpha"] = 1,["width"] = 20,["authorOptions"] = {},["uid"] = "Hr82v0j9Ate",["xOffset"] = 0,["config"] = {},["anchorFrameType"] = "SCREEN",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "type",["op"] = "==",["value"] = "fire",},["changes"] = {{["value"] = {1,0.56078433990479,0,1,},["property"] = "color",},},},{["check"] = {["trigger"] = 1,["variable"] = "type",["op"] = "==",["value"] = "shadow",},["linked"] = true,["changes"] = {{["value"] = {0.76862752437592,0.22352942824364,0.98431378602982,1,},["property"] = "color",},},},{["check"] = {["trigger"] = 1,["variable"] = "me",["value"] = 1,},["changes"] = {{["value"] = 35,["property"] = "width",},{["value"] = 35,["property"] = "height",},{["property"] = "sub.2.text_color",},{["value"] = 14,["property"] = "sub.2.text_fontSize",},},},{["check"] = {["trigger"] = 1,["variable"] = "dead",["value"] = 1,},["changes"] = {{["value"] = {0.36862745881081,0.36862745881081,0.36862745881081,1,},["property"] = "color",},},},},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["9. [SHADOW] Shadowbound Debuff - Fyrakk the Blazing"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"429906",},["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SHADOW\\n%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["source"] = "import",["selfPoint"] = "CENTER",["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["authorOptions"] = {},["desaturate"] = false,["uid"] = "k7eil19detz",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [SHADOW] Shadowbound Debuff - Fyrakk the Blazing",["alpha"] = 1,["frameStrata"] = 1,["width"] = 55,["parent"] = "9. Icons (high) - Fyrakk the Blazing",["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["color"] = {1,1,1,1,},},["9. [EXPLODING] Exploding Core Cast - Fyrakk the Blazing (add)"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["zoom"] = 0,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "1035051",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["config"] = {},["sparkRotationMode"] = "AUTO",["borderOffset"] = 5,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {"428400",},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["subeventPrefix"] = "SPELL",["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["auto"] = true,["internalVersion"] = 70,["url"] = "https://echoesports.gg",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["stickyDuration"] = false,["width"] = 240,["sparkRotation"] = 0,["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "EXPLODING",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "9. [EXPLODING] Exploding Core Cast - Fyrakk the Blazing (add)",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["timerSize"] = 12,["borderInset"] = 11,["icon"] = true,["border"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["borderInFront"] = false,["textFlags"] = "None",["anchorFrameParent"] = false,["color"] = {},["authorOptions"] = {},["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["customText"] = "function()\
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
",["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["customTextUpdate"] = "update",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["inverse"] = false,["displayTextLeft"] = "%n",["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "lcegOgIT0kW",},["9. Mass Dispel [MASS DISPEL] - Fyrakk"] = {["textFlags"] = "None",["stacksSize"] = 12,["iconSource"] = -1,["authorOptions"] = {},["stacksFlags"] = "None",["yOffset"] = 190,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {["do_custom"] = false,},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.73333333333333,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["talent2"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["zoneIds"] = "",["class"] = {["single"] = "HUNTER",["multi"] = {["HUNTER"] = true,},},["race"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["multi"] = {},},["role"] = {["multi"] = {},},["spec"] = {["single"] = 2,["multi"] = {true,},},["pvptalent"] = {["multi"] = {},},["encounterid"] = "2677",["faction"] = {["multi"] = {},},["ingroup"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Minimalist",["textFont"] = "Friz Quadrata TT",["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = 135739,["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["preferToUpdate"] = false,["parent"] = "9. Singles - Fyrakk the Blazing",["barColor2"] = {1,1,0,1,},["customText"] = "function()\
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
",["uid"] = "tap58rT7cU9",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["cooldownSwipe"] = true,["color"] = {},["customTextUpdate"] = "update",["cooldownEdge"] = false,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["use_castType"] = false,["auranames"] = {"326455","325877",},["useGroupRole"] = false,["duration"] = "7",["destUnit"] = "player",["group_count"] = "1",["custom_hide"] = "timed",["subeventSuffix"] = "_CAST_START",["event"] = "Cast",["castType"] = "cast",["name"] = "Flames of Punishment",["use_sourceUnit"] = false,["check"] = "event",["use_destUnit"] = false,["spellNames"] = {349891,"Mass Dispel",},["useGroup_count"] = true,["use_absorbMode"] = true,["genericShowOn"] = "showOnActive",["unit"] = "raid",["debuffType"] = "HARMFUL",["group_countOperator"] = ">=",["useName"] = true,["useAffected"] = true,["unevent"] = "auto",["spellName"] = "Death Knell",["type"] = "unit",["subeventPrefix"] = "SPELL",["events"] = "UNIT_SPELLCAST_SUCCEEDED",["use_unit"] = true,["use_spellName"] = false,["spellIds"] = {},["dynamicDuration"] = false,["names"] = {"Vulnerable",},["custom_type"] = "event",["sourceUnit"] = "player",["use_spellNames"] = true,},["untrigger"] = {["unit"] = "boss",},},[2] = {["trigger"] = {["use_specId"] = false,["type"] = "unit",["use_absorbHealMode"] = true,["use_absorbMode"] = true,["event"] = "Class/Spec",["use_unit"] = true,["specId"] = {["multi"] = {[256] = true,[257] = true,[105] = true,[65] = true,[264] = true,[270] = true,[1468] = true,},},["classification"] = {},["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["useName"] = true,["auranames"] = {"417807",},["unit"] = "player",["type"] = "aura2",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] and (t[2] or t[3]) end",["activeTriggerMode"] = -10,},["displayTextLeft"] = "%n",["internalVersion"] = 70,["stacksFont"] = "Friz Quadrata TT",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["colorR"] = 1,["scalex"] = 1,["alphaType"] = "custom",["colorB"] = 1,["colorG"] = 1,["alphaFunc"] = "\
\
",["use_alpha"] = false,["type"] = "none",["easeType"] = "none",["scaley"] = 1,["alpha"] = 0,["y"] = 0,["x"] = 0,["duration_type"] = "seconds",["rotate"] = 0,["easeStrength"] = 3,["duration"] = "0",["colorA"] = 1,},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["anchorFrameType"] = "SCREEN",["stickyDuration"] = false,["sparkRotationMode"] = "AUTO",["timer"] = true,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "MASS DISPEL",["text_text_format_1.destName_abbreviate_max"] = 8,["text_text_format_1.destName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.destName_realm_name"] = "never",["type"] = "subtext",["text_anchorXOffset"] = 4,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.destName_abbreviate"] = false,["text_text_format_1.destName_format"] = "Unit",["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},["type"] = "subtext",["text_shadowXOffset"] = 1,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway",["text_text_format_percentpower_format"] = "none",["text_shadowYOffset"] = -1,["text_text_format_1.percentpower_format"] = "none",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_text_format_p_time_precision"] = 1,["text_fontSize"] = 14,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_format"] = "timed",},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["border_offset"] = 2,["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["type"] = "subborder",},},["height"] = 23,["timerFlags"] = "None",["id"] = "9. Mass Dispel [MASS DISPEL] - Fyrakk",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["sparkOffsetX"] = 0,["source"] = "import",["semver"] = "1.0.5",["borderColor"] = {1,1,1,0.5,},["sparkWidth"] = 3,["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["backgroundColor"] = {0.17647058823529,0.17647058823529,0.17647058823529,0.7818441838026,},["icon_side"] = "LEFT",["borderOffset"] = 5,["timerSize"] = 12,["sparkHeight"] = 14,["xOffset"] = 0,["zoom"] = 0.25,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["sparkHidden"] = "NEVER",["config"] = {},["frameStrata"] = 1,["width"] = 240,["url"] = "https://echoesports.gg",["icon"] = true,["inverse"] = false,["cooldown"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = false,},["borderInset"] = 11,},["9. [LANDING] Greater Firestorm Landing - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.52156865596771,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "136186",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["customTextUpdate"] = "update",["config"] = {},["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {419506,},["type"] = "combatlog",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["unit"] = "boss",["use_absorbMode"] = true,["event"] = "Combat Log",["names"] = {},["subeventPrefix"] = "SPELL",["use_spellId"] = true,["spellIds"] = {},["use_spellNames"] = true,["duration"] = "6",["use_unit"] = true,["spellId"] = {422518,},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["borderInset"] = 11,["internalVersion"] = 70,["rotateText"] = "NONE",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkRotation"] = 0,["stickyDuration"] = false,["width"] = 240,["backdropColor"] = {1,1,1,0.5,},["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "LANDING",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_shadowYOffset"] = -1,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_legacy_floor"] = true,},{["border_anchor"] = "bar",["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "9. [LANDING] Greater Firestorm Landing - Fyrakk the Blazing",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["customText"] = "function()\
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
",["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["icon"] = true,["border"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderSize"] = 16,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["sparkHeight"] = 14,["borderInFront"] = false,["authorOptions"] = {},["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["zoom"] = 0,["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotationMode"] = "AUTO",["backgroundColor"] = {0,0,0,0.33132427930832,},["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "D7GhiFD5fU)",},["9. Corruption Groups"] = {["arcLength"] = 360,["controlledChildren"] = {"9. Corruption Groups Display (simple)","9. My Group Dropped",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = -610.99990844727,["preferToUpdate"] = false,["yOffset"] = 163.00006103516,["gridType"] = "RD",["fullCircle"] = true,["space"] = 2,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["useLimit"] = false,["align"] = "CENTER",["rotation"] = 0,["subRegions"] = {},["grow"] = "DOWN",["selfPoint"] = "TOP",["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["animate"] = false,["backdropColor"] = {1,1,1,0.5,},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["source"] = "import",["borderColor"] = {0,0,0,1,},["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["stepAngle"] = 15,["borderSize"] = 2,["limit"] = 5,["borderInset"] = 1,["regionType"] = "dynamicgroup",["sort"] = "none",["gridWidth"] = 5,["constantFactor"] = "RADIUS",["config"] = {},["borderOffset"] = 4,["rowSpace"] = 1,["tocversion"] = 100200,["id"] = "9. Corruption Groups",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "9. Singles - Fyrakk the Blazing",["uid"] = "SRTDnOwkJ2C",["anchorPoint"] = "CENTER",["sortHybridTable"] = {["9. Corruption Groups Display (simple)"] = false,["9. My Group Dropped"] = false,},["radius"] = 200,["conditions"] = {},["information"] = {},["stagger"] = 0,},["9. [FLY AWAY] Incarnate Cast - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = false,},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "e7vBox(5kWF",["displayIcon"] = "5342925",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "9. Bars - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",["borderInset"] = 11,["sparkRotationMode"] = "AUTO",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {412761,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["subeventPrefix"] = "SPELL",["spellIds"] = {},["event"] = "Cast",["use_unit"] = true,["names"] = {},["unit"] = "boss",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 70,["url"] = "https://echoesports.gg",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderColor"] = {1,1,1,0.5,},["stickyDuration"] = false,["width"] = 240,["useAdjustededMax"] = false,["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FLY AWAY",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_shadowYOffset"] = -1,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["anchorYOffset"] = 0,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["id"] = "9. [FLY AWAY] Incarnate Cast - Fyrakk the Blazing",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["customText"] = "function()\
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
",["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["icon"] = true,["border"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderInFront"] = false,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["sparkHeight"] = 14,["borderSize"] = 16,["authorOptions"] = {},["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["config"] = {},["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["customTextUpdate"] = "update",["backgroundColor"] = {0,0,0,0.33132427930832,},["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["Seed Holders (comms)"] = {["sparkWidth"] = 10,["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 19,["sparkRotation"] = 0,["sparkRotationMode"] = "AUTO",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["customVariables"] = "{bloom = \"bool\", dropped = \"bool\"}",["event"] = "Health",["subeventPrefix"] = "SPELL",["events"] = "UNIT_SPELLCAST_SUCCEEDED:group TRIGGER:2 ECHO_SEED_INFO UPDATE_EXTRA_ACTIONBAR",["custom"] = "function(s,e,...)\
    if e == \"UNIT_SPELLCAST_SUCCEEDED\" then\
        local unit, _, spellID = ...\
        if spellID == 423702 then -- DROP?\
            elogl(\"fyrakk seed, dropped?\", unit)\
            s[UnitName(unit)] = {\
                show = true,\
                changed = true,\
                duration = 60, \
                autoHide = true,\
                dropped = true,\
                unit = unit,\
            }\
            return true\
        elseif spellID == 423714 then -- BLOOM\
            elogl(\"fyrakk seed, bloomed?\", unit)\
            s[UnitName(unit)] = {\
                show = true,\
                changed = true,\
                duration = 6,\
                expirationTime = GetTime() + 6,\
                autoHide = true,\
                progressType = \"timed\",\
                bloom = true,\
                unit = unit,\
            }\
            return true\
        end\
        \
    elseif e == \"UPDATE_EXTRA_ACTIONBAR\" then\
        local aura_env = aura_env\
        C_Timer.After(0.1, function()\
                local usable = HasExtraActionBar()\
                if usable ~= aura_env.usable then\
                    aura_env.usable = usable \
                    aura_env:SendMacroComm(usable)\
                end \
            end\
        )\
        \
        \
    elseif e == \"ECHO_SEED_INFO\" then\
        local active, unit = ...\
        elogl(\"Fyrakk Seed Holder\",active, unit)\
        if unit then\
            if not active then\
                for u, state in pairs(s) do\
                    if UnitIsUnit(unit, u) and not state.bloom then\
                        s[u].show = true\
                        s[u].changed = true\
                        s[u].dropped = true\
                        s[u].autoHide = true\
                        s[u].duration = 2\
                        return true\
                    end\
                end\
            else\
                s[unit] =  {\
                    show = true,\
                    changed = true,\
                    duration = 60, \
                    autoHide = true,\
                    unit = unit,\
                }\
                return true\
            end\
        end\
    elseif e == \"STATUS\" then\
        for _, state in pairs(s) do\
            state.show = false\
            state.changed = true\
        end\
        return true\
    end\
end\
\
\
",["spellIds"] = {},["custom_type"] = "stateupdate",["check"] = "event",["names"] = {},["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end\
",["activeTriggerMode"] = -10,},["icon_color"] = {1,1,1,1,},["internalVersion"] = 70,["selfPoint"] = "CENTER",["barColor"] = {0,1,0.678431391716,1,},["desaturate"] = false,["desc"] = "Display of good seed holders. \
We didn't end up using this on prog tbh.",["barColor2"] = {1,1,0,1,},["sparkOffsetY"] = 0,["subRegions"] = {{["type"] = "subbackground",},{["type"] = "subforeground",},{["text_text_format_p_time_precision"] = 1,["text_text"] = "%p",["text_text_format_p_format"] = "timed",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["type"] = "subtext",["text_text_format_p_time_dynamic_threshold"] = 60,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowXOffset"] = 1,["text_shadowYOffset"] = -1,["text_text_format_p_time_mod_rate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_format"] = 0,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["text_shadowXOffset"] = 1,["text_text"] = "%unit",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_fontType"] = "None",["type"] = "subtext",["text_text_format_unit_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_unit_abbreviate"] = false,["text_shadowYOffset"] = -1,["text_text_format_unit_format"] = "Unit",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_unit_color"] = "class",["text_text_format_n_format"] = "none",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_unit_abbreviate_max"] = 8,},},["gradientOrientation"] = "HORIZONTAL",["displayIcon"] = 4554354,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["source"] = "import",["actions"] = {["start"] = {},["init"] = {["do_custom"] = true,["custom"] = "local ACE_COMM = LibStub(\"AceComm-3.0\")\
\
local PREFIX = \"ECHO_SEEDS\"\
aura_env.prefix = PREFIX\
aura_env.debugMode = false--true\
\
-- Setup ---------------------------------------------------------------------------------------------------------------\
local aura_env = aura_env\
\
ACE_COMM:RegisterComm(PREFIX, function(...) aura_env:ProcessComm(...) end)\
\
function aura_env:ProcessComm(_, active, channel, sender)\
    local unit = Ambiguate(sender, \"none\")\
    active = active == \"1\" and true or false\
    if unit then\
        WeakAuras.ScanEvents(\"ECHO_SEED_INFO\", active, unit)\
    end\
end\
\
function aura_env:SendMacroComm(active)\
    local channel = IsInRaid() and \"RAID\" or \"GUILD\"\
    ACE_COMM:SendCommMessage(PREFIX, active and \"1\" or \"0\", channel, nil, \"ALERT\")\
end",},["finish"] = {},},["enableGradient"] = false,["config"] = {},["parent"] = "Fyrakk Seeds",["useAdjustededMin"] = false,["regionType"] = "aurabar",["width"] = 150,["alpha"] = 1,["icon_side"] = "LEFT",["uid"] = "QixQ5t1kWt0",["sparkHidden"] = "NEVER",["sparkHeight"] = 30,["texture"] = "Blizzard Raid Bar",["zoom"] = 0,["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["spark"] = false,["tocversion"] = 100200,["id"] = "Seed Holders (comms)",["sparkOffsetX"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["sparkColor"] = {1,1,1,1,},["inverse"] = false,["backgroundColor"] = {0,0,0,0.5,},["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "bloom",["value"] = 1,},["changes"] = {{["value"] = {0.89411771297455,0.99607849121094,0,1,},["property"] = "barColor",},},},{["check"] = {["trigger"] = 1,["variable"] = "dropped",["value"] = 1,},["changes"] = {{["value"] = {0,0.45490199327469,0.50588238239288,1,},["property"] = "barColor",},},},{["check"] = {["trigger"] = -1,["variable"] = "alwaystrue",},["linked"] = true,["changes"] = {{["value"] = true,["property"] = "inverse",},},},},["information"] = {},["height"] = 18,},["9. [MOVE] Shadowflame Breath - Fyrakk the Blazing"] = {["iconSource"] = -1,["parent"] = "9. Icons (low) - Fyrakk the Blazing",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"410225",},["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "MOVE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["xOffset"] = 0,["desaturate"] = false,["config"] = {},["zoom"] = 0,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [MOVE] Shadowflame Breath - Fyrakk the Blazing",["frameStrata"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "uwxYh22W)2P",["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["authorOptions"] = {},},["9. Player Can Dwarf Aflame phase1"] = {["iconSource"] = -1,["xOffset"] = 130,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 14,["cooldownSwipe"] = true,["cooldownEdge"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Drums.ogg",["do_sound"] = true,},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "spell",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["realSpellName"] = "Stoneform",["use_spellName"] = true,["spellIds"] = {},["genericShowOn"] = "showOnReady",["subeventPrefix"] = "SPELL",["names"] = {},["use_track"] = true,["spellName"] = 20594,},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "spell",["subeventSuffix"] = "_CAST_START",["spellName"] = 265221,["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["unit"] = "player",["realSpellName"] = "Fireblood",["use_spellName"] = true,["spellIds"] = {},["genericShowOn"] = "showOnReady",["subeventPrefix"] = "SPELL",["names"] = {},["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["debuffType"] = "BOTH",["type"] = "aura2",["stacksOperator"] = ">=",["auranames"] = {"417807",},["useStacks"] = true,["useName"] = true,["stacks"] = "6",["unit"] = "player",},["untrigger"] = {},},[4] = {["trigger"] = {["type"] = "addons",["unit"] = "player",["use_stage"] = true,["event"] = "Boss Mod Stage",["stage_operator"] = "==",["stage"] = "1",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return (t[1] or t[2]) and t[3] and t[4] end\
",["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "DWARF",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "OUTER_BOTTOM",["text_fontSize"] = 18,["anchorXOffset"] = 0,["text_fontType"] = "OUTLINE",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Proc",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowDuration"] = 1,["glowXOffset"] = 0,["glow"] = true,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 64,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["regionType"] = "icon",["parent"] = "9. Singles - Fyrakk the Blazing",["cooldown"] = true,["icon"] = true,["color"] = {1,1,1,1,},["useCooldownModRate"] = true,["cooldownTextDisabled"] = false,["config"] = {},["tocversion"] = 100200,["id"] = "9. Player Can Dwarf Aflame phase1",["frameStrata"] = 1,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["width"] = 64,["uid"] = "zu1wWpCyjhm",["inverse"] = false,["authorOptions"] = {},["zoom"] = 0,["conditions"] = {},["information"] = {},["selfPoint"] = "CENTER",},["9. [BURN] Incinerated Debuff - Fyrakk the Blazing"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"425483",},["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["useName"] = true,["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "BURN",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["xOffset"] = 0,["stickyDuration"] = false,["uid"] = "tPtbkmvQKxg",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [BURN] Incinerated Debuff - Fyrakk the Blazing",["frameStrata"] = 1,["alpha"] = 1,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["parent"] = "9. Icons (low) - Fyrakk the Blazing",},["9. [SPREAD] Blaze Debuff - Fyrakk the Blazing"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"414186",},["event"] = "Health",["names"] = {},["spellIds"] = {},["subeventPrefix"] = "SPELL",["useName"] = true,["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SPREAD",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["authorOptions"] = {},["stickyDuration"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [SPREAD] Blaze Debuff - Fyrakk the Blazing",["alpha"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "X2wWFKHSlRm",["inverse"] = false,["url"] = "https://echoesports.gg",["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "9. Icons (high) - Fyrakk the Blazing",},["9. Bars - Fyrakk the Blazing"] = {["arcLength"] = 360,["controlledChildren"] = {"9. [FIRESTORM] Firestorm Cast - Fyrakk the Blazing","9. [FIRESTORM + ADDS] Greater Firestorm Cast - Fyrakk the Blazing","9. [LANDING] Firestorm Landing - Fyrakk the Blazing","9. [LANDING] Greater Firestorm Landing - Fyrakk the Blazing","9. [TORNADOES] Eternal Firestorm Landing - Fyrakk the Blazing","9. [SEEDS LANDING] Firestorm Landing - Fyrakk the Blazing","9. [SOAK] Darkflame Cleave Incoming - Fyrakk the Blazing","9. [WILDFIRE] Wildfire Cast - Fyrakk the Blazing","9. [RIFT INC] Dream Rend Cast - Fyrakk the Blazing","9. [FRONTAL] Fyr'alath's Bite Cast - Fyrakk the Blazing","9. [FIREBALL] Fyr'alath's Flame Cast - Fyrakk the Blazing (add?)","9. CAST Corrupt - Fyrakk the Blazing","9. ABSORB Corrupt - Fyrakk the Blazing","9. [BREATH] Shadowflame Breath Cast - Fyrakk the Blazing","9. [BREATH] Deep Breath - Fyrakk the Blazing","9. [CAGE BREAK] Molten Eruption Cast - Fyrakk the Blazing (add)","9. [CAGES] Shadow Cage Cast - Fyrakk the Blazing (add)","9. [EXPLODING] Exploding Core Cast - Fyrakk the Blazing (add)","9. [RUN AWAY] Flamefall Cast - Fyrakk the Blazing","9. [BREATH + ADDS] Shadowflame Devastation Cast - Fyrakk the Blazing","9. [TANK HIT] Infernal Maw Cast - Fyrakk the Blazing","9. [FLY AWAY] Incarnate Cast - Fyrakk the Blazing",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["9. [TANK HIT] Infernal Maw Cast - Fyrakk the Blazing"] = false,["9. CAST Corrupt - Fyrakk the Blazing"] = false,["9. [FIRESTORM] Firestorm Cast - Fyrakk the Blazing"] = false,["9. [SOAK] Darkflame Cleave Incoming - Fyrakk the Blazing"] = false,["9. [RUN AWAY] Flamefall Cast - Fyrakk the Blazing"] = false,["9. [FIREBALL] Fyr'alath's Flame Cast - Fyrakk the Blazing (add?)"] = false,["9. [LANDING] Firestorm Landing - Fyrakk the Blazing"] = false,["9. [BREATH + ADDS] Shadowflame Devastation Cast - Fyrakk the Blazing"] = false,["9. [WILDFIRE] Wildfire Cast - Fyrakk the Blazing"] = false,["9. [BREATH] Shadowflame Breath Cast - Fyrakk the Blazing"] = false,["9. [RIFT INC] Dream Rend Cast - Fyrakk the Blazing"] = false,["9. [FRONTAL] Fyr'alath's Bite Cast - Fyrakk the Blazing"] = false,["9. [EXPLODING] Exploding Core Cast - Fyrakk the Blazing (add)"] = false,["9. [SEEDS LANDING] Firestorm Landing - Fyrakk the Blazing"] = false,["9. [FLY AWAY] Incarnate Cast - Fyrakk the Blazing"] = false,["9. [CAGE BREAK] Molten Eruption Cast - Fyrakk the Blazing (add)"] = false,["9. [BREATH] Deep Breath - Fyrakk the Blazing"] = false,["9. [LANDING] Greater Firestorm Landing - Fyrakk the Blazing"] = false,["9. [TORNADOES] Eternal Firestorm Landing - Fyrakk the Blazing"] = false,["9. [FIRESTORM + ADDS] Greater Firestorm Cast - Fyrakk the Blazing"] = false,["9. [CAGES] Shadow Cage Cast - Fyrakk the Blazing (add)"] = false,["9. ABSORB Corrupt - Fyrakk the Blazing"] = false,},["fullCircle"] = true,["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["align"] = "CENTER",["stagger"] = 0,["borderColor"] = {0,0,0,1,},["rotation"] = 0,["subRegions"] = {},["useLimit"] = false,["internalVersion"] = 70,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["authorOptions"] = {},["backdropColor"] = {1,1,1,0.5,},["uid"] = "mi5l6)CVPyh",["source"] = "import",["anchorFrameFrame"] = "WeakAuras:Bars - Anchor [AMIR]",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["grow"] = "DOWN",["frameStrata"] = 1,["parent"] = "9. Fyrakk the Blazing",["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["anchorPoint"] = "CENTER",["tocversion"] = 100200,["id"] = "9. Bars - Fyrakk the Blazing",["regionType"] = "dynamicgroup",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["gridType"] = "RD",["config"] = {},["animate"] = false,["space"] = 2,["borderInset"] = 1,["conditions"] = {},["information"] = {},["selfPoint"] = "TOP",},["9. [BREATH] Deep Breath - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = false,},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["zoom"] = 0,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "jild1wRCxJI",["displayIcon"] = "5342925",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["borderOffset"] = 5,["customTextUpdate"] = "update",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {412761,},["spellId"] = "422524",["remaining_operator"] = "<",["names"] = {},["remaining"] = "5",["debuffType"] = "HELPFUL",["type"] = "addons",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_spellNames"] = true,["event"] = "Boss Mod Timer",["use_spellId"] = true,["spellIds"] = {},["use_absorbMode"] = true,["use_remaining"] = true,["use_unit"] = true,["subeventPrefix"] = "SPELL",["unit"] = "boss",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["auto"] = true,["internalVersion"] = 70,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["url"] = "https://echoesports.gg",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "DEEP BREATH",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["customText"] = "function()\
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
",["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["authorOptions"] = {},["border"] = false,["borderEdge"] = "None",["color"] = {},["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["borderSize"] = 16,["textFlags"] = "None",["anchorFrameParent"] = false,["stacksFont"] = "Friz Quadrata TT",["icon"] = true,["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["useAdjustededMax"] = false,["id"] = "9. [BREATH] Deep Breath - Fyrakk the Blazing",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 240,["sparkRotationMode"] = "AUTO",["backgroundColor"] = {0,0,0,0.33132427930832,},["inverse"] = false,["config"] = {},["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["9. [RUN AWAY] Flamefall Cast - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "1033911",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "9. Bars - Fyrakk the Blazing",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "p5HLK7TM2Bq",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["sparkRotationMode"] = "AUTO",["config"] = {},["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {"419123",},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["use_unit"] = true,["subeventPrefix"] = "SPELL",["unit"] = "boss",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["timer"] = true,["internalVersion"] = 70,["backgroundColor"] = {0,0,0,0.33132427930832,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["customTextUpdate"] = "update",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["borderInset"] = 11,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "RUN AWAY",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["icon"] = true,["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["authorOptions"] = {},["color"] = {},["anchorFrameParent"] = false,["textFlags"] = "None",["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["adjustedMin"] = "4",["id"] = "9. [RUN AWAY] Flamefall Cast - Fyrakk the Blazing",["stacksFlags"] = "None",["frameStrata"] = 1,["width"] = 240,["url"] = "https://echoesports.gg",["displayTextLeft"] = "%n",["inverse"] = false,["zoom"] = 0,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",},["9. Corruption Glow (basic)"] = {["outline"] = "OUTLINE",["authorOptions"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 4,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["do_glow"] = true,["glow_action"] = "show",["glow_color"] = {0.98823535442352,0.92941182851791,0,1,},["glow_type"] = "Pixel",["use_glow_color"] = true,["glow_frame_type"] = "UNITFRAME",},["init"] = {},["finish"] = {["hide_all_glows"] = true,},},["triggers"] = {[1] = {["trigger"] = {["useStacks"] = true,["auranames"] = {"430045",},["useGroupRole"] = true,["names"] = {},["stacks"] = "10",["debuffType"] = "HARMFUL",["showClones"] = true,["useName"] = true,["stacksOperator"] = ">=",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["spellIds"] = {},["unit"] = "group",["fetchRole"] = false,["type"] = "aura2",["group_role"] = {["HEALER"] = true,["DAMAGER"] = true,},["subeventPrefix"] = "SPELL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["wordWrap"] = "WordWrap",["font"] = "Friz Quadrata TT",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_encounterid"] = true,["role"] = {["single"] = "HEALER",},["spec"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["use_role"] = true,["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["fontSize"] = 12,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["preferToUpdate"] = false,["selfPoint"] = "BOTTOM",["fixedWidth"] = 200,["displayText_format_p_time_legacy_floor"] = false,["displayText_format_p_time_precision"] = 1,["displayText_format_p_time_mod_rate"] = true,["parent"] = "9. Singles - Fyrakk the Blazing",["uid"] = "NCdy(WWnQDi",["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "9. Corruption Glow (basic)",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["config"] = {},["xOffset"] = 0,["displayText"] = "",["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["9. Texts - Fyrakk the Blazing"] = {["grow"] = "DOWN",["controlledChildren"] = {"Spirit/Ancient hit by Blaze","9. Colossi Positions (MACRO)","Blaze over",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Fyrakk the Blazing",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["space"] = 2,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["selfPoint"] = "TOP",["align"] = "CENTER",["rotation"] = 0,["rowSpace"] = 1,["useLimit"] = false,["subRegions"] = {},["sortHybridTable"] = {["9. Colossi Positions (MACRO)"] = false,["Blaze over"] = false,["Spirit/Ancient hit by Blaze"] = false,},["fullCircle"] = true,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["authorOptions"] = {},["backdropColor"] = {1,1,1,0.5,},["config"] = {},["source"] = "import",["stepAngle"] = 15,["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Texts - Anchor [AMIR]",["regionType"] = "dynamicgroup",["borderSize"] = 2,["sort"] = "none",["xOffset"] = 0,["frameStrata"] = 1,["arcLength"] = 360,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["borderEdge"] = "Square Full White",["borderOffset"] = 4,["radius"] = 200,["tocversion"] = 100200,["id"] = "9. Texts - Fyrakk the Blazing",["limit"] = 5,["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["gridType"] = "RD",["borderInset"] = 1,["animate"] = false,["uid"] = "3ECUYzuvmeK",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["conditions"] = {},["information"] = {},["stagger"] = 0,},["9. [GET SHIELD + PUSH] Apocalypse Roar Cast - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 300,["anchorPoint"] = "CENTER",["echoVersion"] = 9,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["icon"] = true,["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["auto"] = true,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["config"] = {},["displayIcon"] = "134158",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["color"] = {},["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["parent"] = "9. Singles - Fyrakk the Blazing",["customTextUpdate"] = "update",["stacksFont"] = "Friz Quadrata TT",["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {422837,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_absorbMode"] = true,["use_spellNames"] = true,["use_unit"] = true,["castType"] = "cast",["names"] = {},["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["use_spellIds"] = false,["use_castType"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["useName"] = true,["auranames"] = {"423717",},["debuffType"] = "BOTH",["matchesShowOn"] = "showOnActive",["type"] = "aura2",["unit"] = "player",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["internalVersion"] = 70,["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_message"] = false,["do_sound"] = true,},["finish"] = {},["init"] = {},},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["adjustedMin"] = "4",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["adjustedMax"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "GET SHIELD + PUSH",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 20,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 30,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["spark"] = false,["source"] = "import",["timerSize"] = 12,["backdropColor"] = {1,1,1,0.5,},["borderInset"] = 11,["border"] = false,["borderEdge"] = "None",["borderSize"] = 16,["borderInFront"] = false,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["uid"] = "YzzkWhAGk4s",["backgroundColor"] = {0,0,0,0.33132427930832,},["sparkHeight"] = 14,["textSize"] = 12,["sparkRotationMode"] = "AUTO",["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["textFlags"] = "None",["id"] = "9. [GET SHIELD + PUSH] Apocalypse Roar Cast - Fyrakk the Blazing",["authorOptions"] = {},["frameStrata"] = 1,["width"] = 400,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["inverse"] = false,["zoom"] = 0,["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["value"] = "3",["op"] = "<",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\David\\3.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["op"] = "<",["value"] = "2",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\David\\2.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["value"] = "1",["op"] = "<",},["changes"] = {{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\David\\1.ogg",["sound_channel"] = "Master",},["property"] = "sound",},},},{["check"] = {["trigger"] = 2,["variable"] = "show",["value"] = 1,},["changes"] = {{["value"] = {0,1,0.63921570777893,1,},["property"] = "barColor",},},},},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",},["Corruption Tracker (simple)"] = {["iconSource"] = -1,["parent"] = "9. Singles - Fyrakk the Blazing",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["cooldownSwipe"] = true,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["debuffType"] = "HARMFUL",["useUnitName"] = true,["useGroup_count"] = true,["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "group",["group_count"] = "0",["names"] = {},["spellIds"] = {},["auranames"] = {"430045",},["unitName"] = "Veloyap",["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["group_countOperator"] = ">",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desc"] = "Very simple Aura to just track a specific raider's Corruption status. Simply change the name in the Trigger to that of the raider you want to watch, and untick Load=Never. \
\
Most raiders in the Corruption groups used this over the bars (9. Corruption Groups Display (simple)) tbh.",["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_shadowYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_fontSize"] = 12,["anchorXOffset"] = 0,["text_fontType"] = "OUTLINE",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "buttonOverlay",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["useGlowColor"] = false,["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 64,["load"] = {["size"] = {["multi"] = {},},["use_never"] = true,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["regionType"] = "icon",["icon"] = true,["information"] = {},["desaturate"] = false,["cooldownTextDisabled"] = false,["color"] = {1,1,1,1,},["uid"] = "JeYdOVe4DTT",["zoom"] = 0,["frameStrata"] = 1,["tocversion"] = 100200,["id"] = "Corruption Tracker (simple)",["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["width"] = 64,["alpha"] = 1,["config"] = {},["inverse"] = false,["xOffset"] = 0,["authorOptions"] = {},["conditions"] = {},["cooldown"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["9. [WILDFIRE] Wildfire Cast - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "0jRH5YLpK2S",["displayIcon"] = "135823",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["borderOffset"] = 5,["sparkRotationMode"] = "AUTO",["auto"] = true,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {420422,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["subeventPrefix"] = "SPELL",["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["names"] = {},["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 70,["config"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["backgroundColor"] = {0,0,0,0.33132427930832,},["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "WILDFIRE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_anchorYOffset"] = 0,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_shadowYOffset"] = -1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["icon"] = true,["border"] = false,["borderEdge"] = "None",["authorOptions"] = {},["borderInFront"] = false,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["color"] = {},["textFlags"] = "None",["sparkHeight"] = 14,["borderSize"] = 16,["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["customText"] = "function()\
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
",["id"] = "9. [WILDFIRE] Wildfire Cast - Fyrakk the Blazing",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 240,["customTextUpdate"] = "update",["rotateText"] = "NONE",["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["9. [BREATH + ADDS] Shadowflame Devastation Cast - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.039215687662363,1,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "G6w6Cf5abSQ",["displayIcon"] = "4914680",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["zoom"] = 0,["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {422524,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["subeventPrefix"] = "SPELL",["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["names"] = {},["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["borderOffset"] = 5,["internalVersion"] = 70,["url"] = "https://echoesports.gg",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderColor"] = {1,1,1,0.5,},["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["customTextUpdate"] = "update",["adjustedMin"] = "4",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BREATH + ADDS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_anchorYOffset"] = 0,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_shadowYOffset"] = -1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["icon"] = true,["borderSize"] = 16,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["authorOptions"] = {},["color"] = {},["sparkHeight"] = 14,["borderInFront"] = false,["textFlags"] = "None",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["config"] = {},["id"] = "9. [BREATH + ADDS] Shadowflame Devastation Cast - Fyrakk the Blazing",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 240,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["height"] = 23,["inverse"] = false,["displayTextLeft"] = "%n",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["9. [SEED] Seed of Amirdrassil - Fyrakk the Blazing"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"423601",},["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SEED",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["color"] = {1,1,1,1,},["stickyDuration"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [SEED] Seed of Amirdrassil - Fyrakk the Blazing",["alpha"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "9. Icons (low) - Fyrakk the Blazing",["uid"] = "3NJixx)w1DR",["inverse"] = false,["url"] = "https://echoesports.gg",["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["xOffset"] = 0,},["Mass Dispel CDs"] = {["sparkWidth"] = 10,["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["sparkRotationMode"] = "AUTO",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["spellId"] = "417807",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["unit"] = "player",["event"] = "Boss Mod Timer",["names"] = {},["spellIds"] = {},["use_spellId"] = true,["events"] = "ECHO_CD_UPDATE",["custom_type"] = "stateupdate",["check"] = "event",["custom"] = "\
-- 20594\
-- 265221\
--ECHO_CD_WIPE_SPELL ECHO_CD_WIPE_ALL ECHO_CD_WIPE_UNIT ECHO_CD_UPDATE \
function(s,e,...)\
    if e == \"STATUS\" then\
        for _, state in pairs(s) do\
            state.show = false\
            state.changed = true\
        end\
        local CDs = EchoCooldowns.RequestCooldownInfoBySpellID(32375)\
        for _, info in pairs(CDs) do\
            if info.unit\
            then\
                local unit = info.unit\
                local cloneID = aura_env.getcloneID(unit)\
                if cloneID then\
                    s[cloneID] = {\
                        show = true,\
                        changed = true,\
                        progressType = info.isReady and \"static\" or \"timed\", \
                        onCD = not info.isReady,\
                        value = 1, \
                        total = 1, \
                        expirationTime = info.expirationTime,\
                        duration = info.duration,\
                        unit = info.unit,\
                    }\
                end\
            end\
        end\
        return true\
        \
    elseif e == \"ECHO_CD_UPDATE\" then\
        local unit, spellID, info = ...\
        if (spellID == 32375) then\
            local cloneID = aura_env.getcloneID(unit)\
            if cloneID then\
                s[cloneID] = {\
                    show = true,\
                    changed = true,\
                    progressType = info.isReady and \"static\" or \"timed\", \
                    onCD = not info.isReady,\
                    value = 1, \
                    total = 1, \
                    expirationTime = info.expirationTime,\
                    duration = info.duration,\
                    unit = info.unit,\
                }\
                return true\
            end\
        end\
    end\
end",["subeventPrefix"] = "SPELL",["customVariables"] = "{onCD = \"bool\"}",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "unit",["use_health"] = true,["health_operator"] = {"<=",},["use_absorbMode"] = true,["event"] = "Health",["use_unit"] = true,["health"] = {"1",},["use_absorbHealMode"] = true,["unit"] = "group",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["use_remaining"] = true,["spellId"] = "417807",["remaining_operator"] = "<",["event"] = "Boss Mod Timer",["unit"] = "player",["use_spellId"] = true,["remaining"] = "10",["type"] = "addons",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] and t[3] end",["activeTriggerMode"] = -10,},["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,1,1,1,},["desaturate"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["sparkOffsetY"] = 0,["subRegions"] = {{["type"] = "subbackground",},{["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = false,["type"] = "subtext",["text_text_format_p_time_dynamic_threshold"] = 60,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_time_precision"] = 1,["text_shadowYOffset"] = -1,["text_shadowColor"] = {0,0,0,1,},["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_format"] = 0,["text_fontType"] = "None",["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_p_format"] = "timed",},{["text_text_format_n_format"] = "none",["text_text"] = "%unit",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowXOffset"] = 1,["type"] = "subtext",["text_text_format_unit_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_unit_abbreviate"] = false,["text_shadowYOffset"] = -1,["text_text_format_unit_format"] = "Unit",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_unit_color"] = "class",["text_fontType"] = "None",["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_unit_abbreviate_max"] = 8,},},["height"] = 15,["barColor2"] = {1,1,0,1,},["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["displayIcon"] = 135739,["source"] = "import",["gradientOrientation"] = "HORIZONTAL",["internalVersion"] = 70,["xOffset"] = 0,["uid"] = "Ai8s4dfMK)k",["useAdjustededMin"] = false,["regionType"] = "aurabar",["sparkColor"] = {1,1,1,1,},["anchorFrameType"] = "SCREEN",["icon_side"] = "LEFT",["frameStrata"] = 1,["parent"] = "Aflame Tracker",["sparkHeight"] = 30,["texture"] = "Minimalist",["id"] = "Mass Dispel CDs",["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["spark"] = false,["tocversion"] = 100200,["sparkHidden"] = "NEVER",["zoom"] = 0,["alpha"] = 1,["width"] = 150,["sparkOffsetX"] = 0,["config"] = {},["inverse"] = false,["backgroundColor"] = {0,0,0,0.5,},["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 2,["variable"] = "show",["value"] = 1,},["changes"] = {{["value"] = {0.33725491166115,0.33725491166115,0.33725491166115,1,},["property"] = "backgroundColor",},{["value"] = {0.33725491166115,0.33725491166115,0.33725491166115,0,},["property"] = "barColor",},{["value"] = true,["property"] = "sub.3.text_visible",},{["value"] = "Deadge",["property"] = "sub.3.text_text",},},},{["check"] = {["trigger"] = 1,["variable"] = "onCD",["value"] = 1,},["changes"] = {{["value"] = true,["property"] = "inverse",},{["value"] = true,["property"] = "sub.3.text_visible",},{["value"] = true,["property"] = "desaturate",},},},},["information"] = {},["actions"] = {["start"] = {},["init"] = {["do_custom"] = true,["custom"] = "function aura_env.getcloneID(unit)\
    for u in WA_IterateGroupMembers() do\
        if UnitIsUnit(u, unit) then\
            return u\
        end\
    end        \
end",},["finish"] = {},},},["9. [CAGES] Shadow Cage Cast - Fyrakk the Blazing (add)"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.98039221763611,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "HymiwHBKHDH",["displayIcon"] = "1035051",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["auto"] = true,["sparkRotationMode"] = "AUTO",["config"] = {},["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {"428968",},["spellId"] = {422518,},["use_absorbMode"] = true,["unit"] = "boss",["use_delay"] = true,["debuffType"] = "HELPFUL",["type"] = "combatlog",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["event"] = "Combat Log",["names"] = {},["use_spellId"] = true,["spellIds"] = {},["use_unit"] = true,["use_spellNames"] = true,["duration"] = "4",["delay"] = 13,["subeventPrefix"] = "SPELL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["borderInset"] = 11,["internalVersion"] = 70,["backgroundColor"] = {0,0,0,0.33132427930832,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["customTextUpdate"] = "update",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["height"] = 23,["customText"] = "function()\
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
",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "CAGES",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_anchorYOffset"] = 0,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_shadowYOffset"] = -1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["borderOffset"] = 5,["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["icon"] = true,["borderSize"] = 16,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["authorOptions"] = {},["color"] = {},["sparkHeight"] = 14,["borderInFront"] = false,["textFlags"] = "None",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["displayTextLeft"] = "%n",["id"] = "9. [CAGES] Shadow Cage Cast - Fyrakk the Blazing (add)",["stacksFlags"] = "None",["frameStrata"] = 1,["width"] = 240,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["inverse"] = false,["zoom"] = 0,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["Fyrakk Seeds"] = {["grow"] = "DOWN",["controlledChildren"] = {"Seed Holders (comms)",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["gridType"] = "RD",["fullCircle"] = true,["space"] = 2,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["selfPoint"] = "TOP",["align"] = "CENTER",["stagger"] = 0,["rowSpace"] = 1,["rotation"] = 0,["subRegions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["sortHybridTable"] = {["Seed Holders (comms)"] = false,},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["authorOptions"] = {},["backdropColor"] = {1,1,1,0.5,},["config"] = {},["animate"] = false,["source"] = "import",["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Info / Lists - Anchor [AMIR]",["stepAngle"] = 15,["borderSize"] = 2,["limit"] = 5,["borderEdge"] = "Square Full White",["frameStrata"] = 1,["parent"] = "9. Singles - Fyrakk the Blazing",["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["sort"] = "none",["borderOffset"] = 4,["arcLength"] = 360,["tocversion"] = 100200,["id"] = "Fyrakk Seeds",["regionType"] = "dynamicgroup",["gridWidth"] = 5,["anchorFrameType"] = "SELECTFRAME",["anchorPoint"] = "CENTER",["uid"] = "rLk7YsKclxZ",["borderColor"] = {0,0,0,1,},["radius"] = 200,["borderInset"] = 1,["conditions"] = {},["information"] = {},["useLimit"] = false,},["9. [TANK HIT] Infernal Maw Cast - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "237395",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "9. Bars - Fyrakk the Blazing",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "2mrrHA3lDsr",["borderOffset"] = 5,["customTextUpdate"] = "update",["auto"] = true,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {425492,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["subeventPrefix"] = "SPELL",["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["names"] = {},["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 70,["config"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_message"] = false,["do_sound"] = false,},["finish"] = {},["init"] = {},},["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "TANK HIT",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_shadowYOffset"] = -1,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["icon"] = true,["border"] = false,["borderEdge"] = "None",["authorOptions"] = {},["borderInFront"] = false,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["color"] = {},["textFlags"] = "None",["sparkHeight"] = 14,["borderSize"] = 16,["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["adjustedMin"] = "4",["id"] = "9. [TANK HIT] Infernal Maw Cast - Fyrakk the Blazing",["stacksFlags"] = "None",["frameStrata"] = 1,["width"] = 240,["sparkRotationMode"] = "AUTO",["rotateText"] = "NONE",["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",},["9. [CAGE BREAK] Molten Eruption Cast - Fyrakk the Blazing (add)"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.94117653369904,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["zoom"] = 0,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "A2Zv0TRGBtS",["displayIcon"] = "1035051",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "9. Bars - Fyrakk the Blazing",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",["config"] = {},["sparkRotationMode"] = "AUTO",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {"428971",},["spellId"] = {422518,},["use_absorbMode"] = true,["unit"] = "boss",["use_delay"] = true,["debuffType"] = "HELPFUL",["type"] = "combatlog",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["use_spellId"] = true,["spellIds"] = {},["use_unit"] = true,["use_spellNames"] = true,["duration"] = "5.5",["delay"] = 13.5,["names"] = {},},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderInset"] = 11,["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "CAGE BREAK",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "9. [CAGE BREAK] Molten Eruption Cast - Fyrakk the Blazing (add)",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["borderOffset"] = 5,["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["9. [FIRESTORM] Firestorm Cast - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.52156865596771,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "136186",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["borderInset"] = 11,["customTextUpdate"] = "update",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["use_castType"] = true,["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["event"] = "Cast",["subeventPrefix"] = "SPELL",["castType"] = "cast",["spellNames"] = {419506,},["spellIds"] = {},["use_unit"] = true,["unit"] = "boss",["names"] = {},["use_spellNames"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 70,["url"] = "https://echoesports.gg",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkRotation"] = 0,["stickyDuration"] = false,["width"] = 240,["backdropColor"] = {1,1,1,0.5,},["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FIRESTORM",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_anchorYOffset"] = 0,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_shadowYOffset"] = -1,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_legacy_floor"] = true,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["id"] = "9. [FIRESTORM] Firestorm Cast - Fyrakk the Blazing",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["customText"] = "function()\
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
",["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["icon"] = true,["border"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderInFront"] = false,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["sparkHeight"] = 14,["borderSize"] = 16,["authorOptions"] = {},["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["config"] = {},["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotationMode"] = "AUTO",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "OZNngNkuKDA",},["9. [ABSORB] Bloom - Fyrakk the Blazing"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 4,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = true,["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["useName"] = true,["auranames"] = {"423717",},["unit"] = "player",["names"] = {},["debuffType"] = "BOTH",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "ABSORB\\n%tooltip1",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_text_format_tooltip1_format"] = "BigNumber",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorPoint"] = "OUTER_BOTTOM",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["source"] = "import",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "9. Icons (low) - Fyrakk the Blazing",["stickyDuration"] = false,["uid"] = "yegFSLV4qK(",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [ABSORB] Bloom - Fyrakk the Blazing",["frameStrata"] = 1,["useCooldownModRate"] = true,["width"] = 55,["xOffset"] = 0,["config"] = {},["inverse"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\shot.ogg",["do_sound"] = true,},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["color"] = {1,1,1,1,},},["9. [FIREBALL] Fyr'alath's Flame Cast - Fyrakk the Blazing (add?)"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["zoom"] = 0,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "ZpTMfyszxda",["displayIcon"] = "5205711",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "9. Bars - Fyrakk the Blazing",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",["config"] = {},["sparkRotationMode"] = "AUTO",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {"428960",},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["names"] = {},["spellIds"] = {},["event"] = "Cast",["unit"] = "nameplate",["subeventPrefix"] = "SPELL",["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["backgroundColor"] = {0,0,0,0.33132427930832,},["internalVersion"] = 70,["customTextUpdate"] = "update",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderInset"] = 11,["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FIREBALL",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_mod_rate"] = true,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "9. [FIREBALL] Fyr'alath's Flame Cast - Fyrakk the Blazing (add?)",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["borderOffset"] = 5,["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["borderInFront"] = false,["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["anchorFrameParent"] = false,["authorOptions"] = {},["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["useAdjustededMax"] = false,["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["9. [BIG DOT] Apocalypse Roar Debuff - Fyrakk the Blazing"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["group_countOperator"] = ">",["event"] = "Health",["names"] = {},["subeventPrefix"] = "SPELL",["unit"] = "player",["spellIds"] = {},["useGroup_count"] = true,["group_count"] = "0",["useName"] = true,["auranames"] = {"422839",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "BIG DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["size"] = {["multi"] = {},},},["source"] = "import",["desaturate"] = false,["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["parent"] = "9. Icons (high) - Fyrakk the Blazing",["selfPoint"] = "CENTER",["config"] = {},["zoom"] = 0,["anchorFrameParent"] = false,["width"] = 55,["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [BIG DOT] Apocalypse Roar Debuff - Fyrakk the Blazing",["alpha"] = 1,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["uid"] = "H0kw8khpxL1",["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {1,1,1,1,},},["9. [LANDING] Firestorm Landing - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.52156865596771,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "TQFGrAu1APz",["displayIcon"] = "136186",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["borderInset"] = 11,["sparkRotationMode"] = "AUTO",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {419506,},["type"] = "combatlog",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["names"] = {},["use_absorbMode"] = true,["event"] = "Combat Log",["unit"] = "boss",["use_unit"] = true,["use_spellId"] = true,["spellIds"] = {},["use_spellNames"] = true,["duration"] = "4",["subeventPrefix"] = "SPELL",["spellId"] = {419506,},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 70,["backgroundColor"] = {0,0,0,0.33132427930832,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["rotateText"] = "NONE",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["backdropColor"] = {1,1,1,0.5,},["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "LANDING",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["customText"] = "function()\
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
",["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["icon"] = true,["border"] = false,["borderEdge"] = "None",["authorOptions"] = {},["borderSize"] = 16,["sparkHeight"] = 14,["icon_side"] = "LEFT",["borderInFront"] = false,["color"] = {},["anchorFrameParent"] = false,["textFlags"] = "None",["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["displayTextLeft"] = "%n",["id"] = "9. [LANDING] Firestorm Landing - Fyrakk the Blazing",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["customTextUpdate"] = "update",["inverse"] = false,["config"] = {},["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["9. [TANK] Infernal Maw - Fyrakk the Blazing (tank)"] = {["iconSource"] = -1,["parent"] = "9. Icons (low) - Fyrakk the Blazing",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["names"] = {},["spellIds"] = {},["subeventPrefix"] = "SPELL",["useName"] = true,["unit"] = "player",["auranames"] = {"429672",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["authorOptions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "iBYSRT1rKcf",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [TANK] Infernal Maw - Fyrakk the Blazing (tank)",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},["9. [BREATH] Shadowflame Breath Cast - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.678431391716,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "GHWlL74f7M9",["displayIcon"] = "4914672",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["borderOffset"] = 5,["sparkRotationMode"] = "AUTO",["auto"] = true,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {410223,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["event"] = "Cast",["unit"] = "boss",["use_spellNames"] = true,["spellIds"] = {},["names"] = {},["use_unit"] = true,["subeventPrefix"] = "SPELL",["use_exact_spellId"] = false,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 70,["config"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["backgroundColor"] = {0,0,0,0.33132427930832,},["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "BREATH",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_anchorYOffset"] = 0,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_shadowYOffset"] = -1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["icon"] = true,["border"] = false,["borderEdge"] = "None",["authorOptions"] = {},["borderInFront"] = false,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["color"] = {},["textFlags"] = "None",["sparkHeight"] = 14,["borderSize"] = 16,["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["adjustedMin"] = "4",["id"] = "9. [BREATH] Shadowflame Breath Cast - Fyrakk the Blazing",["stacksFlags"] = "None",["frameStrata"] = 1,["width"] = 240,["customTextUpdate"] = "update",["rotateText"] = "NONE",["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["9. [FLAME] Flamebound Debuff - Fyrakk the Blazing"] = {["iconSource"] = -1,["parent"] = "9. Icons (high) - Fyrakk the Blazing",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"429903",},["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "FLAME\\n%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip2_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["stickyDuration"] = false,["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["xOffset"] = 0,["selfPoint"] = "CENTER",["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [FLAME] Flamebound Debuff - Fyrakk the Blazing",["useCooldownModRate"] = true,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["uid"] = "yOAmdqnyW8D",["inverse"] = false,["url"] = "https://echoesports.gg",["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {1,1,1,1,},},["Single Dispel CDs"] = {["sparkWidth"] = 10,["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["sparkRotation"] = 0,["sparkRotationMode"] = "AUTO",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["spellId"] = "417807",["subeventSuffix"] = "_CAST_START",["customVariables"] = "{onCD = \"bool\"}",["subeventPrefix"] = "SPELL",["event"] = "Boss Mod Timer",["unit"] = "player",["custom"] = "--ECHO_CD_WIPE_SPELL ECHO_CD_WIPE_ALL ECHO_CD_WIPE_UNIT ECHO_CD_UPDATE \
function(s,e,...)\
    if e == \"STATUS\" then\
        for _, state in pairs(s) do\
            state.show = false\
            state.changed = true\
        end\
        for i, spell in ipairs(aura_env.dispels) do\
            local CDs = EchoCooldowns.RequestCooldownInfoBySpellID(spell)\
            for _, info in pairs(CDs) do\
                if info.unit\
                then\
                    local unit = info.unit\
                    local cloneID = aura_env.getcloneID(unit)\
                    if cloneID then\
                        local name, _, icon = GetSpellInfo(spell)\
                        s[cloneID] = {\
                            show = true,\
                            changed = true,\
                            progressType = info.isReady and \"static\" or \"timed\", \
                            onCD = not info.isReady,\
                            value = 1, \
                            total = 1, \
                            expirationTime = info.expirationTime,\
                            duration = info.duration,\
                            unit = info.unit,\
                            spellID = spell,\
                            spellName = name,\
                            icon = icon,\
                        }\
                    end\
                end\
            end\
        end\
        return true\
        \
    elseif e == \"ECHO_CD_UPDATE\" then\
        local unit, spellID, info = ...\
        if tContains(aura_env.dispels, spellID) then\
            local cloneID = aura_env.getcloneID(unit)\
            if cloneID and s[cloneID] then\
                s[cloneID] = s[cloneID] or {\
                    show = true,\
                }\
                s[cloneID].changed = true\
                s[cloneID].progressType = info.isReady and \"static\" or \"timed\"\
                s[cloneID].onCD = not info.isReady\
                s[cloneID].value = 1\
                s[cloneID].total = 1\
                s[cloneID].expirationTime = info.expirationTime\
                s[cloneID].duration = info.duration\
                s[cloneID].unit = info.unit\
                return true\
            end\
        end\
    end\
end",["use_spellId"] = true,["spellIds"] = {},["custom_type"] = "stateupdate",["check"] = "event",["events"] = "ECHO_CD_UPDATE",["names"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "unit",["use_health"] = true,["health_operator"] = {"<=",},["use_absorbMode"] = true,["event"] = "Health",["use_unit"] = true,["health"] = {"1",},["use_absorbHealMode"] = true,["unit"] = "group",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[3] = {["trigger"] = {["use_remaining"] = true,["spellId"] = "417807",["remaining_operator"] = "<",["event"] = "Boss Mod Timer",["unit"] = "player",["use_spellId"] = true,["remaining"] = "10",["type"] = "addons",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,1,1,1,},["desaturate"] = false,["actions"] = {["start"] = {["do_custom"] = true,["custom"] = "if aura_env.state.unit then\
    local r,g,b = GetClassColor(select(2, UnitClass(aura_env.state.unit)))\
    aura_env.region:Color(r,g,b,1)\
end\
\
\
",},["finish"] = {},["init"] = {["do_custom"] = true,["custom"] = "function aura_env.getcloneID(unit)\
    for u in WA_IterateGroupMembers() do\
        if UnitIsUnit(u, unit) then\
            return u\
        end\
    end        \
end\
\
aura_env.dispels = {88423, 360823, 115450, 4987, 527, 77130}",},},["sparkOffsetY"] = 0,["subRegions"] = {{["type"] = "subbackground",},{["type"] = "subforeground",},{["text_text_format_p_time_precision"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_format"] = "timed",["type"] = "subtext",["anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowXOffset"] = 1,["text_shadowYOffset"] = -1,["text_fontType"] = "None",["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_format"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_fontSize"] = 14,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text"] = "%unit",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_n_format"] = "none",["type"] = "subtext",["text_text_format_unit_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_unit_abbreviate"] = false,["text_shadowYOffset"] = -1,["text_text_format_unit_format"] = "Unit",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_unit_color"] = "class",["text_fontType"] = "None",["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_unit_abbreviate_max"] = 8,},},["height"] = 15,["information"] = {},["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["conditions"] = {{["check"] = {["trigger"] = 2,["variable"] = "show",["value"] = 1,},["changes"] = {{["value"] = {0.33725491166115,0.33725491166115,0.33725491166115,1,},["property"] = "backgroundColor",},{["value"] = {0.33725491166115,0.33725491166115,0.33725491166115,0,},["property"] = "barColor",},{["value"] = true,["property"] = "sub.3.text_visible",},{["value"] = "Deadge",["property"] = "sub.3.text_text",},},},{["check"] = {["trigger"] = 1,["variable"] = "onCD",["value"] = 1,},["changes"] = {{["value"] = true,["property"] = "inverse",},{["value"] = true,["property"] = "sub.3.text_visible",},{["value"] = true,["property"] = "desaturate",},},},},["source"] = "import",["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["parent"] = "Aflame Tracker",["config"] = {},["useAdjustededMin"] = false,["regionType"] = "aurabar",["sparkOffsetX"] = 0,["width"] = 150,["icon_side"] = "LEFT",["alpha"] = 1,["zoom"] = 0,["sparkHeight"] = 30,["texture"] = "Minimalist",["sparkHidden"] = "NEVER",["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["spark"] = false,["tocversion"] = 100200,["id"] = "Single Dispel CDs",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["uid"] = "T4IPFsQ0DpC",["sparkColor"] = {1,1,1,1,},["inverse"] = false,["backgroundColor"] = {0,0,0,0.5,},["orientation"] = "HORIZONTAL",["displayIcon"] = 135739,["barColor2"] = {1,1,0,1,},["gradientOrientation"] = "HORIZONTAL",},["Intermission Positions"] = {["arcLength"] = 180,["controlledChildren"] = {"Intermission Positions (fire Macro)",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Singles - Fyrakk the Blazing",["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["Intermission Positions (fire Macro)"] = false,},["borderColor"] = {0,0,0,1,},["space"] = 2,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 100,["selfPoint"] = "CENTER",["align"] = "CENTER",["rotation"] = 180,["subRegions"] = {},["authorOptions"] = {},["stagger"] = 0,["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropColor"] = {1,1,1,0.5,},["internalVersion"] = 70,["animate"] = false,["grow"] = "CIRCLE",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["sort"] = "none",["uid"] = "bVfHGzMrKcU",["limit"] = 5,["xOffset"] = 0,["gridWidth"] = 5,["constantFactor"] = "RADIUS",["stepAngle"] = 15,["borderOffset"] = 4,["gridType"] = "RD",["tocversion"] = 100200,["id"] = "Intermission Positions",["borderInset"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["anchorPoint"] = "CENTER",["config"] = {},["fullCircle"] = false,["rowSpace"] = 1,["source"] = "import",["conditions"] = {},["information"] = {},["useLimit"] = false,},["9. [MARK] Fyr'alath's Mark Debuff - Fyrakk the Blazing"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["names"] = {},["spellIds"] = {},["subeventPrefix"] = "SPELL",["useName"] = true,["unit"] = "player",["auranames"] = {"417443",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "MARK",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["xOffset"] = 0,["stickyDuration"] = false,["uid"] = "PkeXB09VEPQ",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [MARK] Fyr'alath's Mark Debuff - Fyrakk the Blazing",["frameStrata"] = 1,["alpha"] = 1,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["parent"] = "9. Icons (high) - Fyrakk the Blazing",},["9. [FAIL] Exploding Core Debuff - Fyrakk the Blazing (add)"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"428400",},["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "FAIL",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["desaturate"] = false,["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["authorOptions"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["frameStrata"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [FAIL] Exploding Core Debuff - Fyrakk the Blazing (add)",["useCooldownModRate"] = true,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "acZ5PF0Jv0Z",["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "9. Icons (high) - Fyrakk the Blazing",},["Aflame Timer"] = {["sparkWidth"] = 10,["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["sparkRotation"] = 0,["sparkRotationMode"] = "AUTO",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "addons",["spellId"] = "417807",["subeventSuffix"] = "_CAST_START",["remaining_operator"] = "<",["event"] = "Boss Mod Timer",["subeventPrefix"] = "SPELL",["use_spellId"] = true,["spellIds"] = {},["remaining"] = "10",["names"] = {},["unit"] = "player",["use_remaining"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["barColor"] = {0.7294117808342,0,0,1,},["desaturate"] = false,["backgroundColor"] = {0,0,0,0.5,},["sparkOffsetY"] = 0,["subRegions"] = {{["type"] = "subbackground",},{["type"] = "subforeground",},{["text_text_format_p_time_precision"] = 1,["text_text"] = "%p",["text_text_format_p_format"] = "timed",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["type"] = "subtext",["anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowXOffset"] = 1,["text_shadowYOffset"] = -1,["text_fontType"] = "None",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_format"] = 0,["text_text_format_p_time_mod_rate"] = true,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = false,},{["text_shadowXOffset"] = 1,["text_text"] = "%n",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "None",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_n_format"] = "none",},},["gradientOrientation"] = "HORIZONTAL",["information"] = {},["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["conditions"] = {},["source"] = "import",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["selfPoint"] = "CENTER",["uid"] = "o5PtfBYPmxu",["config"] = {},["useAdjustededMin"] = false,["regionType"] = "aurabar",["authorOptions"] = {},["width"] = 150,["icon_side"] = "LEFT",["alpha"] = 1,["zoom"] = 0,["sparkHeight"] = 30,["texture"] = "Minimalist",["id"] = "Aflame Timer",["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["spark"] = false,["tocversion"] = 100200,["sparkHidden"] = "NEVER",["parent"] = "Aflame Tracker",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkOffsetX"] = 0,["sparkColor"] = {1,1,1,1,},["inverse"] = false,["internalVersion"] = 70,["orientation"] = "HORIZONTAL",["displayIcon"] = 463567,["barColor2"] = {1,1,0,1,},["height"] = 20,},["9. [SEED STACKS] Corruption - Fyrakk the Blazing"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Health",["unit"] = "player",["spellIds"] = {},["type"] = "aura2",["auranames"] = {"430045",},["subeventPrefix"] = "SPELL",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "SEED\\nSTACKS",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "BigNumber",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["color"] = {1,1,1,1,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "BEM8UJH84FI",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [SEED STACKS] Corruption - Fyrakk the Blazing",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["authorOptions"] = {},["config"] = {},["inverse"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["parent"] = "9. Icons (high) - Fyrakk the Blazing",},["9. [SCOOCHING] Dream Rend Duration - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 340,["anchorPoint"] = "CENTER",["echoVersion"] = 11,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "1357803",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["color"] = {},["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "9. Singles - Fyrakk the Blazing",["displayTextLeft"] = "%n",["sparkRotationMode"] = "AUTO",["uid"] = ")licJ6KPHAc",["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["use_count"] = true,["duration"] = "12",["unit"] = "boss",["use_delay"] = false,["debuffType"] = "HELPFUL",["type"] = "combatlog",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["event"] = "Combat Log",["names"] = {},["subeventPrefix"] = "SPELL",["use_spellId"] = true,["count"] = "1",["use_sourceUnit"] = false,["spellIds"] = {},["spellId"] = {"417455",},["use_absorbMode"] = true,["use_unit"] = true,},["untrigger"] = {},},["activeTriggerMode"] = -10,},["borderOffset"] = 5,["internalVersion"] = 70,["zoom"] = 0,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["config"] = {},["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "WAIT",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_anchorYOffset"] = 0,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_shadowYOffset"] = -1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},{["tick_blend_mode"] = "ADD",["type"] = "subtick",["tick_xOffset"] = 0,["tick_desaturate"] = false,["automatic_length"] = true,["tick_thickness"] = 2,["tick_rotation"] = 0,["use_texture"] = false,["tick_color"] = {1,1,1,1,},["tick_placement"] = "6",["tick_yOffset"] = 0,["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["tick_visible"] = true,["tick_length"] = 30,["tick_mirror"] = false,["tick_placement_mode"] = "AtValue",},{["tick_blend_mode"] = "ADD",["type"] = "subtick",["tick_xOffset"] = 0,["tick_desaturate"] = false,["automatic_length"] = true,["tick_thickness"] = 2,["tick_rotation"] = 0,["use_texture"] = false,["tick_color"] = {1,1,1,1,},["tick_placement"] = "3",["tick_yOffset"] = 0,["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["tick_visible"] = true,["tick_length"] = 30,["tick_mirror"] = false,["tick_placement_mode"] = "AtValue",},},["height"] = 30,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["customText"] = "function()\
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
",["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["textFlags"] = "None",["border"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderInFront"] = false,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["icon"] = true,["authorOptions"] = {},["sparkHeight"] = 14,["borderSize"] = 16,["useAdjustededMax"] = false,["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["customTextUpdate"] = "update",["id"] = "9. [SCOOCHING] Dream Rend Duration - Fyrakk the Blazing",["stacksFlags"] = "None",["frameStrata"] = 1,["width"] = 400,["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["inverse"] = true,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["value"] = "6",["op"] = "<",},["changes"] = {{["value"] = {1,1,0,1,},["property"] = "barColor",},{["value"] = "SCOOCHING",["property"] = "sub.3.text_text",},},},{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["op"] = "<",["value"] = "3",},["changes"] = {{["value"] = {0.1803921610117,1,0,1,},["property"] = "barColor",},},},},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["9. [FIRESTORM + ADDS] Greater Firestorm Cast - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.52156865596771,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "1035051",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "9. Bars - Fyrakk the Blazing",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "zpsnpyIxPrD",["borderOffset"] = 5,["customTextUpdate"] = "update",["auto"] = true,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["use_castType"] = true,["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["event"] = "Cast",["subeventPrefix"] = "SPELL",["castType"] = "cast",["spellNames"] = {"422518",},["spellIds"] = {},["unit"] = "boss",["use_unit"] = true,["names"] = {},["use_spellNames"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 70,["config"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["sparkRotation"] = 0,["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FIRESTORM + ADDS",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_shadowYOffset"] = -1,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["icon"] = true,["border"] = false,["borderEdge"] = "None",["authorOptions"] = {},["borderInFront"] = false,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["color"] = {},["textFlags"] = "None",["sparkHeight"] = 14,["borderSize"] = 16,["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["adjustedMin"] = "4",["id"] = "9. [FIRESTORM + ADDS] Greater Firestorm Cast - Fyrakk the Blazing",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 240,["sparkRotationMode"] = "AUTO",["rotateText"] = "NONE",["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",},["9. [STUN] Shadow Cage - Fyrakk the Blazing"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"428969",},["fetchTooltip"] = false,["event"] = "Health",["unit"] = "player",["spellIds"] = {},["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "METEORS",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_text_format_tooltip1_format"] = "BigNumber",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorPoint"] = "OUTER_BOTTOM",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["xOffset"] = 0,["stickyDuration"] = false,["uid"] = ")2zo1vx9j(t",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [STUN] Shadow Cage - Fyrakk the Blazing",["frameStrata"] = 1,["useCooldownModRate"] = true,["width"] = 55,["parent"] = "9. Icons (low) - Fyrakk the Blazing",["config"] = {},["inverse"] = false,["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["color"] = {1,1,1,1,},},["9. ABSORB Corrupt - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 12,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {},["init"] = {},["finish"] = {["do_custom"] = true,["custom"] = "aura_env.max = nil",},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "dUIR6eQxfMa",["displayIcon"] = "2175503",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "9. Bars - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",["borderInset"] = 11,["customTextUpdate"] = "event",["borderOffset"] = 5,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["use_showAbsorb"] = true,["auranames"] = {"421922",},["use_absorbMode"] = true,["use_absorb"] = true,["unit"] = "boss",["absorb_operator"] = {">",},["group_count"] = "0",["debuffType"] = "BOTH",["group_countOperator"] = ">",["type"] = "aura2",["use_absorbHealMode"] = true,["auraspellids"] = {"421922",},["subeventPrefix"] = "SPELL",["fetchTooltip"] = true,["event"] = "Health",["useGroup_count"] = true,["useExactSpellId"] = true,["useName"] = false,["spellIds"] = {},["absorb"] = {"0",},["names"] = {},["use_unit"] = true,["use_specific_unit"] = true,["subeventSuffix"] = "_CAST_START",},["untrigger"] = {},},["disjunctive"] = "any",["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 70,["url"] = "https://echoesports.gg",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["borderColor"] = {1,1,1,0.5,},["stickyDuration"] = false,["width"] = 240,["useAdjustededMax"] = false,["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "%c%%",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_text_format_c_big_number_format"] = "AbbreviateNumbers",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_CENTER",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_text_format_c_format"] = "Number",["text_text_format_c_decimal_precision"] = 1,},{["text_shadowXOffset"] = 1,["text_text"] = "%absorb",["text_shadowColor"] = {0,0,0,1,},["anchorYOffset"] = 0,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorXOffset"] = 0,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_format"] = "timed",["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_precision"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_absorb_big_number_format"] = "AbbreviateNumbers",["text_shadowYOffset"] = -1,["text_visible"] = false,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_anchorYOffset"] = 0,["text_text_format_p_time_format"] = 0,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_absorb_format"] = "BigNumber",},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["id"] = "9. ABSORB Corrupt - Fyrakk the Blazing",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["customText"] = "function()\
    if WeakAuras.IsOptionsOpen() then \
        aura_env.region:SetDurationInfo(123123, 321321, true)\
    end\
    if aura_env.state and aura_env.state.points then\
        \
        local value = aura_env.state.points[1]\
        if value then\
            if not aura_env.state.max then\
                aura_env.state.max = value\
            end\
            aura_env.region:SetDurationInfo(value, aura_env.state.max, true)\
            return (value / aura_env.state.max)*100\
        end\
    end\
    --[[if aura_env.states[1].show and aura_env.states[2].show and aura_env.states[1].tooltip1 then\
        if not aura_env.max then\
            aura_env.max = aura_env.states[1].tooltip1\
        end\
        aura_env.region:SetDurationInfo(aura_env.states[1].tooltip1, aura_env.max, true)\
    end]]\
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
",["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["icon"] = true,["border"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderInFront"] = false,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["sparkHeight"] = 14,["borderSize"] = 16,["authorOptions"] = {},["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["config"] = {},["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotationMode"] = "AUTO",["backgroundColor"] = {0,0,0,0.33132427930832,},["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["9. [KNOCK UP] Incarnate Cast Success - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 300,["anchorPoint"] = "CENTER",["echoVersion"] = 4,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\Gasp.ogg",["do_sound"] = true,},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0.10980392992496,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["zoom"] = 0,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "0dARK6QUZjP",["displayIcon"] = "5342925",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Singles - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["borderOffset"] = 5,["customTextUpdate"] = "update",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {412761,},["spellId"] = {412761,},["use_absorbMode"] = true,["use_unit"] = true,["debuffType"] = "HELPFUL",["type"] = "combatlog",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["use_spellNames"] = true,["use_count"] = true,["spellIds"] = {},["use_spellId"] = true,["count"] = "1",["event"] = "Combat Log",["duration"] = "6.5",["subeventPrefix"] = "SPELL",["unit"] = "boss",["names"] = {},},["untrigger"] = {},},["activeTriggerMode"] = -10,},["auto"] = true,["internalVersion"] = 70,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["url"] = "https://echoesports.gg",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FLY AWAY",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 32,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},{["tick_blend_mode"] = "ADD",["tick_rotation"] = 0,["tick_xOffset"] = 0,["tick_desaturate"] = false,["automatic_length"] = true,["tick_thickness"] = 2,["tick_placement_mode"] = "AtValue",["use_texture"] = false,["tick_color"] = {1,1,1,1,},["tick_yOffset"] = 0,["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["tick_visible"] = true,["tick_placement"] = "0.5",["tick_length"] = 30,["tick_mirror"] = false,["type"] = "subtick",},},["height"] = 30,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["customText"] = "function()\
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
",["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["authorOptions"] = {},["border"] = false,["borderEdge"] = "None",["color"] = {},["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["borderSize"] = 16,["textFlags"] = "None",["anchorFrameParent"] = false,["stacksFont"] = "Friz Quadrata TT",["icon"] = true,["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["useAdjustededMax"] = false,["id"] = "9. [KNOCK UP] Incarnate Cast Success - Fyrakk the Blazing",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 400,["sparkRotationMode"] = "AUTO",["backgroundColor"] = {0,0,0,0.33132427930832,},["inverse"] = false,["config"] = {},["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["9. Private Aura Holder 3 (singles) - Fyrakk"] = {["iconSource"] = -1,["wagoID"] = "n3lAhBYxn",["parent"] = "9. Singles - Fyrakk the Blazing",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 4,["cooldownSwipe"] = true,["cooldownEdge"] = false,["actions"] = {["start"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
if anchorID then\
    C_UnitAuras.RemovePrivateAuraAnchor(anchorID)\
end\
\
local self = aura_env.region\
local privateAnchorArgs = {\
    unitToken = \"player\",\
    auraIndex = 3,\
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
end",["do_custom"] = true,},},["triggers"] = {[1] = {["trigger"] = {["custom_type"] = "stateupdate",["type"] = "custom",["use_alwaystrue"] = true,["subeventSuffix"] = "_CAST_START",["use_unit"] = true,["use_absorbMode"] = true,["event"] = "Conditions",["subeventPrefix"] = "SPELL",["use_absorbHealMode"] = true,["custom"] = "function(a)\
    for k, v in pairs(a) do\
        v.show = false\
        v.changed = true\
    end\
    a[3] = {\
        show = true,\
        changed = true,\
        index = 3\
    } \
    return true\
end",["spellIds"] = {},["events"] = "",["check"] = "event",["names"] = {},["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text"] = "%index",["text_text_format_p_format"] = "timed",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_format"] = 0,["anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_p_time_precision"] = 1,["text_shadowYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorYOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_fontSize"] = 40,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,},},["height"] = 100,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["regionType"] = "icon",["color"] = {1,1,1,1,},["cooldown"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["url"] = "https://echoesports.gg",["cooldownTextDisabled"] = true,["anchorFrameParent"] = false,["uid"] = "cWpCx22hImv",["alpha"] = 1,["zoom"] = 0,["semver"] = "1.0.5",["tocversion"] = 100200,["id"] = "9. Private Aura Holder 3 (singles) - Fyrakk",["width"] = 100,["useCooldownModRate"] = true,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["config"] = {},["inverse"] = false,["xOffset"] = 560,["authorOptions"] = {},["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "customcheck",["value"] = "function()\
    return not WeakAuras.IsOptionsOpen()\
end",},["changes"] = {{["value"] = {1,1,1,0,},["property"] = "color",},{["property"] = "sub.2.text_visible",},},},},["information"] = {},["icon"] = true,},["9. GS up on Ancient"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["cooldownSwipe"] = true,["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["unit"] = "target",["spellIds"] = {},["names"] = {},["useName"] = true,["subeventPrefix"] = "SPELL",["auranames"] = {"47788",},["debuffType"] = "BOTH",},["untrigger"] = {},},[2] = {["trigger"] = {["npcId"] = "212420",["type"] = "unit",["use_absorbHealMode"] = true,["use_absorbMode"] = true,["event"] = "Unit Characteristics",["use_unit"] = true,["use_npcId"] = true,["unit"] = "target",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_shadowYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_fontSize"] = 12,["anchorXOffset"] = 0,["text_fontType"] = "OUTLINE",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "buttonOverlay",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["useGlowColor"] = false,["glowXOffset"] = 0,["glow"] = false,["glowScale"] = 1,["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 64,["load"] = {["use_encounterid"] = true,["role"] = {["single"] = "HEALER",},["encounterid"] = "2677",["talent"] = {["multi"] = {},},["use_role"] = true,["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["regionType"] = "icon",["xOffset"] = 200,["cooldown"] = true,["icon"] = true,["parent"] = "9. Singles - Fyrakk the Blazing",["useCooldownModRate"] = true,["cooldownTextDisabled"] = false,["config"] = {},["tocversion"] = 100200,["id"] = "9. GS up on Ancient",["alpha"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["width"] = 64,["uid"] = "(tjLE9E4bDf",["inverse"] = false,["authorOptions"] = {},["zoom"] = 0,["conditions"] = {},["information"] = {},["selfPoint"] = "CENTER",},["Aflame Tracker"] = {["arcLength"] = 360,["controlledChildren"] = {"Aflame Timer","Mass Dispel CDs","Single Dispel CDs","Aflame Count",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Singles - Fyrakk the Blazing",["preferToUpdate"] = false,["yOffset"] = 394.00024414062,["sortHybridTable"] = {["Single Dispel CDs"] = false,["Aflame Count"] = false,["Mass Dispel CDs"] = false,["Aflame Timer"] = false,},["echoVersion"] = 1,["fullCircle"] = true,["space"] = 1,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["unit"] = "player",["subeventPrefix"] = "SPELL",["event"] = "Health",["names"] = {},},["untrigger"] = {},},},["columnSpace"] = 1,["internalVersion"] = 70,["useLimit"] = false,["align"] = "CENTER",["desc"] = "Tracking for Aflame, When the next cast is incoming and the current state of Healer Dispels/MassDispels. \
\
Unload the whole group if it's not useful to you.",["rotation"] = 0,["subRegions"] = {},["xOffset"] = -212.99987792969,["stagger"] = 0,["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropColor"] = {1,1,1,0.5,},["radius"] = 200,["animate"] = false,["grow"] = "DOWN",["scale"] = 1,["centerType"] = "LR",["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "dynamicgroup",["borderSize"] = 2,["sort"] = "none",["borderInset"] = 1,["limit"] = 5,["authorOptions"] = {},["frameStrata"] = 1,["constantFactor"] = "RADIUS",["gridType"] = "RD",["borderOffset"] = 4,["stepAngle"] = 15,["tocversion"] = 100200,["id"] = "Aflame Tracker",["config"] = {},["gridWidth"] = 5,["anchorFrameType"] = "SCREEN",["anchorPoint"] = "CENTER",["uid"] = "NrVEVFNp7s9",["borderColor"] = {0,0,0,1,},["rowSpace"] = 1,["source"] = "import",["conditions"] = {},["information"] = {},["selfPoint"] = "TOP",},["9. [SOAK] Darkflame Cleave Incoming - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.96078437566757,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "I)mGZ3ulSGp",["displayIcon"] = "236297",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["borderOffset"] = 5,["sparkRotationMode"] = "AUTO",["auto"] = true,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["type"] = "combatlog",["spellId"] = {"426368",},["subeventSuffix"] = "_CAST_SUCCESS",["duration"] = "4",["event"] = "Combat Log",["use_unit"] = true,["use_absorbMode"] = true,["use_spellId"] = true,["spellIds"] = {},["names"] = {},["subeventPrefix"] = "SPELL",["unit"] = "boss",["use_absorbHealMode"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["zoom"] = 0,["internalVersion"] = 70,["config"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["backgroundColor"] = {0,0,0,0.33132427930832,},["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["borderColor"] = {1,1,1,0.5,},["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SOAK",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_anchorYOffset"] = 0,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_shadowYOffset"] = -1,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["anchorYOffset"] = 0,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["displayTextRight"] = "%p",["displayTextLeft"] = "%n",["icon"] = true,["border"] = false,["borderEdge"] = "None",["authorOptions"] = {},["borderInFront"] = false,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["color"] = {},["textFlags"] = "None",["sparkHeight"] = 14,["borderSize"] = 16,["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["customText"] = "function()\
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
",["id"] = "9. [SOAK] Darkflame Cleave Incoming - Fyrakk the Blazing",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 240,["customTextUpdate"] = "update",["rotateText"] = "NONE",["inverse"] = false,["borderInset"] = 11,["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["9. [DISPEL] Aflame - Fyrakk the Blazing"] = {["iconSource"] = -1,["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["useName"] = true,["unit"] = "player",["auranames"] = {"417807",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "DISPEL",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},{["border_offset"] = 0,["type"] = "subborder",["border_color"] = {0,0.50196081399918,1,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 2,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["parent"] = "9. Icons (low) - Fyrakk the Blazing",["stickyDuration"] = false,["config"] = {},["zoom"] = 0,["anchorFrameParent"] = false,["width"] = 55,["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [DISPEL] Aflame - Fyrakk the Blazing",["useCooldownModRate"] = true,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["uid"] = "ovlUo54ompH",["inverse"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["color"] = {1,1,1,1,},},["9. [MOVE] Raging Flames - Fyrakk the Blazing"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"419504",},["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["useName"] = true,["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "MOVE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_anchorXOffset"] = 7,["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip1_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip2_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "9. Icons (low) - Fyrakk the Blazing",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "fQzE4u873fk",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [MOVE] Raging Flames - Fyrakk the Blazing",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 55,["xOffset"] = 0,["config"] = {},["inverse"] = false,["url"] = "https://echoesports.gg",["icon"] = true,["displayIcon"] = "",["cooldown"] = true,["authorOptions"] = {},},["9. [BIG DOT] Shadowflame Devastation - Fyrakk the Blazing"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["auranames"] = {"422526",},["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "BIG DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_text_format_tooltip3_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_anchorXOffset"] = 7,},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["source"] = "import",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "9. Icons (low) - Fyrakk the Blazing",["stickyDuration"] = false,["uid"] = "k7h2cKGwmwc",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["alpha"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [BIG DOT] Shadowflame Devastation - Fyrakk the Blazing",["frameStrata"] = 1,["useCooldownModRate"] = true,["width"] = 55,["xOffset"] = 0,["config"] = {},["inverse"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["color"] = {1,1,1,1,},},["9. [BIG DOT] Shadowflame Eruption - Fyrakk the Blazing"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["auranames"] = {"429866",},["event"] = "Health",["subeventPrefix"] = "SPELL",["spellIds"] = {},["names"] = {},["type"] = "aura2",["unit"] = "player",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "BIG DOT",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_tooltip3_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_anchorXOffset"] = 7,["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_anchorYOffset"] = -6,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["stickyDuration"] = false,["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["authorOptions"] = {},["selfPoint"] = "CENTER",["config"] = {},["zoom"] = 0,["anchorFrameParent"] = false,["width"] = 55,["useCooldownModRate"] = true,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [BIG DOT] Shadowflame Eruption - Fyrakk the Blazing",["alpha"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "9. Icons (low) - Fyrakk the Blazing",["uid"] = "zV1wfxBSvos",["inverse"] = false,["url"] = "https://echoesports.gg",["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["xOffset"] = 0,},["9. Icons (low) - Fyrakk the Blazing"] = {["grow"] = "LEFT",["controlledChildren"] = {"9. [STUN] Shadow Cage - Fyrakk the Blazing","9. [ABSORB] Bloom - Fyrakk the Blazing","9. [200%] Darkflame Cleave Debuff - Fyrakk the Blazing","9. [TANK] Infernal Maw - Fyrakk the Blazing (tank)","9. [BURN] Incinerated Debuff - Fyrakk the Blazing","9. [DISPEL] Aflame - Fyrakk the Blazing","9. [MOVE] Raging Flames - Fyrakk the Blazing","9. [MOVE] Shadowflame Breath - Fyrakk the Blazing","9. [BIG DOT] Shadowflame Devastation - Fyrakk the Blazing","9. [BIG DOT] Shadowflame Eruption - Fyrakk the Blazing","9. [SEED] Seed of Amirdrassil - Fyrakk the Blazing",},["borderBackdrop"] = "Blizzard Tooltip",["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["sortHybridTable"] = {["9. [BURN] Incinerated Debuff - Fyrakk the Blazing"] = false,["9. [200%] Darkflame Cleave Debuff - Fyrakk the Blazing"] = false,["9. [TANK] Infernal Maw - Fyrakk the Blazing (tank)"] = false,["9. [STUN] Shadow Cage - Fyrakk the Blazing"] = false,["9. [ABSORB] Bloom - Fyrakk the Blazing"] = false,["9. [MOVE] Raging Flames - Fyrakk the Blazing"] = false,["9. [SEED] Seed of Amirdrassil - Fyrakk the Blazing"] = false,["9. [MOVE] Shadowflame Breath - Fyrakk the Blazing"] = false,["9. [BIG DOT] Shadowflame Eruption - Fyrakk the Blazing"] = false,["9. [BIG DOT] Shadowflame Devastation - Fyrakk the Blazing"] = false,["9. [DISPEL] Aflame - Fyrakk the Blazing"] = false,},["borderColor"] = {0,0,0,1,},["rowSpace"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["names"] = {},["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["columnSpace"] = 1,["radius"] = 200,["useLimit"] = false,["align"] = "CENTER",["stagger"] = 0,["internalVersion"] = 70,["rotation"] = 0,["subRegions"] = {},["selfPoint"] = "RIGHT",["space"] = 2,["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["anchorPoint"] = "CENTER",["backdropColor"] = {1,1,1,0.5,},["uid"] = "AVmkHd)rOek",["source"] = "import",["animate"] = false,["scale"] = 1,["centerType"] = "LR",["border"] = false,["anchorFrameFrame"] = "WeakAuras:Icon - Low Priority - Anchor [AMIR]",["stepAngle"] = 15,["borderSize"] = 2,["sort"] = "none",["borderEdge"] = "Square Full White",["gridWidth"] = 5,["arcLength"] = 360,["anchorFrameParent"] = false,["constantFactor"] = "RADIUS",["limit"] = 5,["borderOffset"] = 4,["fullCircle"] = true,["tocversion"] = 100200,["id"] = "9. Icons (low) - Fyrakk the Blazing",["regionType"] = "dynamicgroup",["frameStrata"] = 1,["anchorFrameType"] = "SELECTFRAME",["authorOptions"] = {},["borderInset"] = 1,["gridType"] = "RD",["parent"] = "9. Fyrakk the Blazing",["config"] = {},["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["9. [RIFT INC] Dream Rend Cast - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.80000007152557,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "C3eV7q7E3SR",["displayIcon"] = "1357803",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "9. Bars - Fyrakk the Blazing",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["customTextUpdate"] = "update",["borderInset"] = 11,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {417455,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["subeventPrefix"] = "SPELL",["spellIds"] = {},["event"] = "Cast",["use_unit"] = true,["names"] = {},["unit"] = "boss",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["sparkRotationMode"] = "AUTO",["internalVersion"] = 70,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["url"] = "https://echoesports.gg",["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "RIFT INC",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = true,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_shadowYOffset"] = -1,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["anchorYOffset"] = 0,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["id"] = "9. [RIFT INC] Dream Rend Cast - Fyrakk the Blazing",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["config"] = {},["source"] = "import",["timerSize"] = 12,["auto"] = true,["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["textFlags"] = "None",["borderSize"] = 16,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["color"] = {},["authorOptions"] = {},["sparkHeight"] = 14,["borderInFront"] = false,["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["zoom"] = 0,["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["useAdjustededMax"] = false,["sparkRotation"] = 0,["inverse"] = false,["textSize"] = 12,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},},["9. Player Can Dwarf Aflame phase2"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 13,["cooldownSwipe"] = true,["cooldownEdge"] = false,["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Drums.ogg",["do_sound"] = true,},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "spell",["subeventSuffix"] = "_CAST_START",["spellName"] = 20594,["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["realSpellName"] = "Stoneform",["use_spellName"] = true,["spellIds"] = {},["genericShowOn"] = "showOnReady",["unit"] = "player",["names"] = {},["use_track"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "spell",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["use_genericShowOn"] = true,["event"] = "Cooldown Progress (Spell)",["subeventPrefix"] = "SPELL",["realSpellName"] = "Fireblood",["use_spellName"] = true,["spellIds"] = {},["genericShowOn"] = "showOnReady",["unit"] = "player",["names"] = {},["use_track"] = true,["spellName"] = 265221,},["untrigger"] = {},},[3] = {["trigger"] = {["debuffType"] = "BOTH",["type"] = "aura2",["stacksOperator"] = ">=",["auranames"] = {"417807",},["useStacks"] = false,["useName"] = true,["stacks"] = "5",["unit"] = "player",},["untrigger"] = {},},[4] = {["trigger"] = {["type"] = "addons",["debuffType"] = "HELPFUL",["use_stage"] = true,["stage"] = "2",["stage_operator"] = ">=",["event"] = "Boss Mod Stage",["unit"] = "player",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return (t[1] or t[2]) and t[3] and t[4] end\
",["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "DWARF",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = 0,["text_wordWrap"] = "WordWrap",["text_visible"] = false,["text_anchorPoint"] = "OUTER_BOTTOM",["text_fontSize"] = 18,["anchorXOffset"] = 0,["text_fontType"] = "OUTLINE",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Proc",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["useGlowColor"] = false,["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glow"] = true,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 64,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["source"] = "import",["regionType"] = "icon",["authorOptions"] = {},["information"] = {},["icon"] = true,["parent"] = "9. Singles - Fyrakk the Blazing",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["uid"] = "JFK(k0)i(td",["tocversion"] = 100200,["id"] = "9. Player Can Dwarf Aflame phase2",["useCooldownModRate"] = true,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["width"] = 64,["config"] = {},["inverse"] = false,["xOffset"] = 130,["zoom"] = 0,["conditions"] = {},["cooldown"] = true,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["9. [TORNADOES] Eternal Firestorm Landing - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 5,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0.52156865596771,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = false,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["uid"] = "fLtr7k1ahR)",["displayIcon"] = "136186",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["sparkColor"] = {1,1,1,1,},["borderInset"] = 11,["sparkRotationMode"] = "AUTO",["zoom"] = 0,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {419506,},["spellId"] = "422935",["duration"] = "6",["unit"] = "boss",["remaining"] = "4",["use_extend"] = true,["debuffType"] = "HELPFUL",["use_remaining"] = true,["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["names"] = {},["event"] = "Boss Mod Timer",["use_unit"] = true,["use_spellNames"] = true,["use_spellId"] = true,["spellIds"] = {},["subeventPrefix"] = "SPELL",["extend"] = "4",["type"] = "addons",["remaining_operator"] = "<",["use_absorbMode"] = true,},["untrigger"] = {},},["activeTriggerMode"] = -10,},["config"] = {},["internalVersion"] = 70,["backgroundColor"] = {0,0,0,0.33132427930832,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["rotateText"] = "NONE",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["backdropColor"] = {1,1,1,0.5,},["height"] = 23,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "TORNADOES",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowColor"] = {0,0,0,1,},},{["border_size"] = 1,["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_anchor"] = "bar",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["timer"] = true,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = true,["customText"] = "function()\
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
",["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["icon"] = true,["border"] = false,["borderEdge"] = "None",["authorOptions"] = {},["borderInFront"] = false,["sparkHeight"] = 14,["icon_side"] = "LEFT",["borderSize"] = 16,["color"] = {},["anchorFrameParent"] = false,["textFlags"] = "None",["stacksFont"] = "Friz Quadrata TT",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["displayTextLeft"] = "%n",["id"] = "9. [TORNADOES] Eternal Firestorm Landing - Fyrakk the Blazing",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 240,["borderColor"] = {1,1,1,0.5,},["customTextUpdate"] = "update",["inverse"] = false,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,},["9. Private Aura Holder 1 (singles) - Fyrakk"] = {["iconSource"] = -1,["wagoID"] = "n3lAhBYxn",["xOffset"] = 340,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 4,["cooldownSwipe"] = true,["cooldownEdge"] = false,["actions"] = {["start"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
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
    aura_env.region.anchorID = nil\
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
end",["spellIds"] = {},["events"] = "",["check"] = "event",["names"] = {},["subeventPrefix"] = "SPELL",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%index",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowXOffset"] = 0,["anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_text_format_p_time_precision"] = 1,["text_shadowYOffset"] = 0,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorYOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_fontSize"] = 40,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_format"] = "timed",},},["height"] = 100,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["regionType"] = "icon",["authorOptions"] = {},["cooldown"] = false,["icon"] = true,["url"] = "https://echoesports.gg",["cooldownTextDisabled"] = true,["anchorFrameParent"] = false,["uid"] = "FeuzM5c4Pad",["frameStrata"] = 1,["zoom"] = 0,["semver"] = "1.0.5",["tocversion"] = 100200,["id"] = "9. Private Aura Holder 1 (singles) - Fyrakk",["width"] = 100,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["useCooldownModRate"] = true,["config"] = {},["inverse"] = false,["color"] = {1,1,1,1,},["parent"] = "9. Singles - Fyrakk the Blazing",["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "customcheck",["value"] = "function()\
    return not WeakAuras.IsOptionsOpen()\
end",},["changes"] = {{["value"] = {1,1,1,0,},["property"] = "color",},{["property"] = "sub.2.text_visible",},},},},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["9. Corruption Groups Display (simple)"] = {["sparkWidth"] = 10,["iconSource"] = -1,["xOffset"] = 0,["displayText"] = "%p",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["displayText_format_p_time_format"] = 0,["icon"] = false,["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["wordWrap"] = "WordWrap",["barColor"] = {0,0,0,0.28000003099442,},["desc"] = "#corruption name name\
#corruption name name\
#corruption name name\
#corruption name name\
\
If you're in a Corruption Group then this will show bars for each member. Yellow when they're actively carrying. ",["font"] = "Friz Quadrata TT",["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["single"] = "raid",["multi"] = {["raid"] = true,},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",["multi"] = {["mythic"] = true,},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["shadowXOffset"] = 1,["useAdjustededMin"] = false,["regionType"] = "aurabar",["texture"] = "Blizzard Raid Bar",["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["spark"] = true,["tocversion"] = 100200,["alpha"] = 1,["config"] = {["sort"] = 3,},["fixedWidth"] = 200,["outline"] = "OUTLINE",["sparkOffsetX"] = 0,["parent"] = "9. Corruption Groups",["shadowYOffset"] = -1,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["customVariables"] = "{type = \"string\", myGroup = \"bool\",duration = true,expirationTime = true, active = \"bool\"}",["event"] = "Health",["subeventPrefix"] = "SPELL",["unit"] = "player",["spellIds"] = {},["events"] = "TRIGGER:2:4 ENCOUNTER_START EXRT_NOTE_UPDATE  ECHO_FYRAKK_CORRUPTION_GROUP_UPDATE",["names"] = {},["check"] = "event",["custom"] = "function(s,e,...)\
    if e == \"ENCOUNTER_START\" or e == \"EXRT_NOTE_UPDATE\" or e == \"STATUS\" then\
        aura_env.TryReadNote()\
        \
        aura_env.createGroups()\
        aura_env.myGroup = nil\
        aura_env.myIndex = nil\
        aura_env.myGroupMembers = nil\
        aura_env.myGroupTotal = nil\
        aura_env.carrying = nil\
        for i, set in ipairs(aura_env.rotations) do\
            local myIndex = tIndexOf(set, WeakAuras.me)\
            if myIndex then\
                aura_env.myGroup = i\
                aura_env.myIndex = myIndex\
                aura_env.myGroupMembers = set\
                aura_env.myGroupTotal = #set\
                WeakAuras.ScanEvents(\"ECHO_FYRAKK_CORRUPTION_GROUP_UPDATE\", i, myIndex, CopyTable(set, true))\
                break\
            end\
        end\
        --[[for i, set in ipairs(aura_env.backups) do\
            if tContains(set, WeakAuras.me) then\
                aura_env.myGroup = i\
                aura_env.groupBU = i\
                aura_env.myGroupMembers = aura_env.rotations[i]\
                aura_env.myGroupTotal = #aura_env.rotations[i]\
                WeakAuras.ScanEvents(\"ECHO_FYRAKK_CORRUPTION_GROUP_UPDATE\", i)\
                break\
            end\
        end]]\
        \
        \
    elseif (e == \"TRIGGER\") and (aura_env.myGroup) then\
        if ... == 2 then\
            for _, state in pairs(s) do\
                state.show = false\
                state.changed = true\
            end\
            local t = WeakAuras.GetTriggerStateForTrigger(aura_env.id, 2)\
            for cloneID, state in pairs(t) do\
                if state.show and state.unitName and aura_env.unitInMySet(state.unitName) then\
                    s[cloneID] = CopyTable(state, true)\
                    s[cloneID].changed = true\
                    local index = aura_env.indexByName[state.unitName]\
                    s[cloneID].index = aura_env.getIndex(index, aura_env.myIndex, aura_env.myGroupTotal)\
                    s[cloneID].groupIndex = index\
                    \
                    --[[if state.active and state.expirationTime > GetTime() + 28 then\
                        aura_env.setMark(state.unit)\
                    end]]\
                end\
            end\
            return true\
        end\
        \
    elseif e == \"OPTIONS\" then\
        local me = math.random(1,5)\
        for i = 1, 5 do\
            s[i] = {\
                show = true,\
                changed = true,\
                progressType = \"timed\",\
                duration = 30,\
                expirationTime = i == 3 and GetTime() + 30 or i%2==0 and GetTime() + math.random(5, 20) or math.huge,\
                active = (i == 3 or i%2==0) and true or false,\
                stacks =  (i == 3 or i%2==0) and math.random(4,9) or nil,\
                unit = i == me and \"player\" or \"raid\"..i,\
                index = aura_env.getIndex(i, me, 5),\
                groupIndex = i,\
            }\
        end\
        return true\
    end\
    \
end\
\
\
\
",["custom_type"] = "stateupdate",["debuffType"] = "HELPFUL",},["untrigger"] = {},},[2] = {["trigger"] = {["showClones"] = true,["useName"] = true,["debuffType"] = "BOTH",["auranames"] = {"430045",},["combinePerUnit"] = true,["perUnitMode"] = "all",["type"] = "aura2",["unit"] = "group",},["untrigger"] = {},},[3] = {["trigger"] = {["type"] = "addons",["debuffType"] = "HELPFUL",["use_stage"] = true,["stage"] = "3",["stage_operator"] = "==",["event"] = "Boss Mod Stage",["unit"] = "player",},["untrigger"] = {},},[4] = {["trigger"] = {["type"] = "unit",["use_absorbHealMode"] = true,["health_operator"] = {"<=",},["use_absorbMode"] = true,["event"] = "Health",["unit"] = "group",["health"] = {"1",},["use_health"] = true,["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] and t[3] end",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {{["type"] = "subbackground",},{["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%stacks",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_stacks_format"] = "none",["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_LEFT",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_n_format"] = "none",},{["text_text_format_n_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%unit",["text_shadowColor"] = {0,0,0,1,},["text_text_format_groupIndex_format"] = "none",["text_selfPoint"] = "LEFT",["text_automaticWidth"] = "Auto",["text_text_format_unit_color"] = "class",["text_text_format_groupIndex._format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_fixedWidth"] = 64,["text_text_format_text_format"] = "none",["text_visible"] = true,["type"] = "subtext",["text_text_format_unit_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_unit_abbreviate"] = true,["text_shadowYOffset"] = -1,["text_text_format_unit_format"] = "Unit",["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_LEFT",["text_anchorXOffset"] = 50,["text_shadowXOffset"] = 1,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_unit_abbreviate_max"] = 6,},{["text_text_format_p_time_format"] = 0,["text_text_format_s_format"] = "none",["text_text"] = "%p",["text_text_format_p_format"] = "timed",["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_mod_rate"] = true,["text_text_format_unit_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_n_format"] = "none",["text_text_format_p_time_precision"] = 1,["text_visible"] = true,["type"] = "subtext",["text_text_format_unit_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_unit_abbreviate"] = true,["text_shadowYOffset"] = -1,["text_text_format_unit_format"] = "Unit",["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_RIGHT",["text_shadowXOffset"] = 1,["text_shadowColor"] = {0,0,0,1,},["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_unit_abbreviate_max"] = 8,},{["text_shadowXOffset"] = 1,["text_text"] = "%{groupIndex}.",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "LEFT",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_text_format_groupIndex._format"] = "none",["rotateText"] = "NONE",["text_justify"] = "CENTER",["type"] = "subtext",["text_text_format_index_format"] = "none",["text_text_format_indicator_format"] = "none",["text_font"] = "Friz Quadrata TT",["text_color"] = {1,1,1,1,},["text_shadowYOffset"] = -1,["text_anchorXOffset"] = 35,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "INNER_LEFT",["text_text_format_n_format"] = "none",["text_visible"] = true,["text_fontSize"] = 10,["anchorXOffset"] = 0,["text_text_format_groupIndex_format"] = "none",},},["height"] = 20,["preferToUpdate"] = false,["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["fontSize"] = 12,["source"] = "import",["barColor2"] = {1,1,0,1,},["displayText_format_p_time_legacy_floor"] = false,["orientation"] = "HORIZONTAL",["sparkColor"] = {1,1,1,1,},["zoom"] = 0,["uid"] = "iQy)KF0ToX1",["authorOptions"] = {{["type"] = "select",["values"] = {"Player at top","Player at bottom","Index order",},["key"] = "sort",["useDesc"] = false,["name"] = "Sort Mode",["default"] = 1,["width"] = 1,},},["width"] = 150,["icon_side"] = "RIGHT",["displayText_format_p_time_mod_rate"] = true,["displayText_format_p_time_precision"] = 1,["sparkHeight"] = 30,["id"] = "9. Corruption Groups Display (simple)",["displayText_format_p_time_dynamic_threshold"] = 60,["sparkRotation"] = 0,["justify"] = "LEFT",["sparkRotationMode"] = "AUTO",["sparkHidden"] = "BOTH",["backgroundColor"] = {0.67058825492859,0,0,1,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["actions"] = {["start"] = {["do_custom"] = false,},["finish"] = {},["init"] = {["do_custom"] = true,["custom"] = "local keyword = \"corruption\"\
--local backup = \"corruptionBU\"\
\
function aura_env.TryReadNote()\
    aura_env.initialized = false;\
    aura_env.rotations = {}\
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
                    \
                    table.insert(newRotation,guy);\
                end\
            end\
            table.insert(aura_env.rotations,newRotation);\
        end\
    end\
    --[[for _,noteInfo in ipairs(noteData)do\
        if(noteInfo.identifier == backup)then\
            local newRotation = {};\
            for rotationIdx,rotation in ipairs(noteInfo.rotation)do\
                for _,guy in ipairs(rotation)do\
                    \
                    table.insert(newRotation,guy);\
                end\
            end\
            table.insert(aura_env.backups,newRotation);\
        end\
    end]]\
    elogl(\"FyrakkCorruption Note Init:\",#aura_env.rotations)\
    aura_env.initialized = true;\
    \
end\
\
\
function aura_env.createGroups()\
    aura_env.groupByName = {}\
    aura_env.indexByName = {}\
    for i, set in ipairs(aura_env.rotations) do\
        for j, name in ipairs(set) do\
            aura_env.groupByName[name] = i\
            aura_env.indexByName[name] = j\
        end\
    end\
end\
\
function aura_env.unitInMySet(name)\
    return aura_env.myGroupMembers and tContains(aura_env.myGroupMembers, name)\
end\
\
function aura_env.unitInMyGroup(name)\
    return aura_env.groupByName[name] == aura_env.groupByName[WeakAuras.me]\
end\
function aura_env.unitIndex(name)\
    return aura_env.indexByName[name]\
end\
\
aura_env.marks = {1,2,3,4,5,6,7,8}\
\
function aura_env.setMark(unit)\
    if UnitIsGroupLeader(\"player\") then\
        if GetRaidTargetIndex(unit) ~= aura_env.marks[aura_env.myGroup] then\
            SetRaidTarget(unit, aura_env.marks[aura_env.myGroup])\
        end\
    end\
end\
\
function aura_env.getIndex(index, myIndex, total)\
    local sort = aura_env.config.sort\
    local me = myIndex\
    if sort == 1 then\
        return index < me and index + total or index\
    elseif sort == 2 then\
        return index > me and index - total or index\
    else\
        return index\
    end\
end",},},["selfPoint"] = "BOTTOM",["inverse"] = false,["desaturate"] = false,["shadowColor"] = {0,0,0,1,},["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "active",["op"] = "==",["value"] = 0,},["changes"] = {{["value"] = {0.10588236153126,0.75294125080109,0,1,},["property"] = "backgroundColor",},},},{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["op"] = ">",["value"] = "27.9",},["changes"] = {{["value"] = {0.98039221763611,1,0,1,},["property"] = "backgroundColor",},},["linked"] = true,},{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["value"] = "18",["op"] = "<",},["changes"] = {{["value"] = {0.75294125080109,0,0,1,},["property"] = "backgroundColor",},},["linked"] = true,},{["check"] = {["trigger"] = 4,["variable"] = "show",["value"] = 1,},["changes"] = {{["value"] = {0.49411767721176,0.49411767721176,0.49411767721176,1,},["property"] = "backgroundColor",},},},},["information"] = {},["color"] = {1,1,1,1,},},["9. [SEED STACKS] Corruption - Fyrakk the Blazing (own stacks)"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["subeventSuffix"] = "_CAST_START",["fetchTooltip"] = false,["event"] = "Health",["names"] = {},["spellIds"] = {},["type"] = "aura2",["auranames"] = {"430045",},["unit"] = "player",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "YOU",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_text_format_tooltip1_format"] = "BigNumber",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorPoint"] = "OUTER_BOTTOM",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["text_text_format_tooltip1_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = -6,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 80,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["desaturate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["parent"] = "9. Singles - Fyrakk the Blazing",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "iGp)HVeEdwy",["zoom"] = 0,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [SEED STACKS] Corruption - Fyrakk the Blazing (own stacks)",["alpha"] = 1,["useCooldownModRate"] = true,["width"] = 80,["authorOptions"] = {},["config"] = {},["inverse"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 240,},["9. [LEAP] Darkflame Cleave TARGET Debuff - Fyrakk the Blazing"] = {["iconSource"] = -1,["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {},["debuffType"] = "HARMFUL",["fetchTooltip"] = true,["event"] = "Health",["names"] = {},["subeventSuffix"] = "_CAST_START",["useExactSpellId"] = true,["spellIds"] = {},["unit"] = "player",["auraspellids"] = {"426370",},["subeventPrefix"] = "SPELL",["useName"] = false,["useIgnoreName"] = false,},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "LEAP",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "none",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_anchorYOffset"] = 0,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["source"] = "import",["selfPoint"] = "CENTER",["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["parent"] = "9. Icons (high) - Fyrakk the Blazing",["desaturate"] = false,["config"] = {},["useCooldownModRate"] = true,["anchorFrameParent"] = false,["width"] = 55,["frameStrata"] = 1,["cooldownTextDisabled"] = false,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [LEAP] Darkflame Cleave TARGET Debuff - Fyrakk the Blazing",["zoom"] = 0,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["color"] = {1,1,1,1,},["uid"] = "8FqBsaHqfRk",["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["xOffset"] = 0,},["9. [200%] Darkflame Cleave Debuff - Fyrakk the Blazing"] = {["iconSource"] = -1,["parent"] = "9. Icons (low) - Fyrakk the Blazing",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["cooldownEdge"] = false,["icon"] = true,["triggers"] = {[1] = {["trigger"] = {["useName"] = false,["auranames"] = {},["fetchTooltip"] = true,["event"] = "Health",["unit"] = "player",["subeventSuffix"] = "_CAST_START",["useExactSpellId"] = true,["spellIds"] = {},["names"] = {},["auraspellids"] = {"426392",},["type"] = "aura2",["subeventPrefix"] = "SPELL",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["desaturate"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%tooltip1%%",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_anchorYOffset"] = 0,["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_text_format_tooltip1_format"] = "none",},{["text_text_format_tooltip13_format"] = "none",["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_1.ttoltip1_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip1_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip2_format"] = "none",["type"] = "subtext",["text_anchorXOffset"] = 7,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = -6,["text_shadowYOffset"] = -1,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorXOffset"] = 0,["text_shadowXOffset"] = 1,["text_fontSize"] = 20,["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip3_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glowXOffset"] = 0,["glowScale"] = 1,["glowThickness"] = 1,["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["source"] = "import",["stickyDuration"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["regionType"] = "icon",["conditions"] = {},["authorOptions"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["uid"] = "gP7BhDZzgvN",["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [200%] Darkflame Cleave Debuff - Fyrakk the Blazing",["useCooldownModRate"] = true,["alpha"] = 1,["width"] = 55,["color"] = {1,1,1,1,},["config"] = {},["inverse"] = false,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["displayIcon"] = "",["cooldown"] = true,["xOffset"] = 0,},["Blaze over"] = {["outline"] = "OUTLINE",["xOffset"] = 0,["displayText_format_p_time_dynamic_threshold"] = 60,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 6,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["event"] = "Combat Log",["subeventPrefix"] = "SPELL",["unit"] = "player",["custom"] = "function(s,e,...)\
    if e == \"COMBAT_LOG_EVENT_UNFILTERED\"  then\
        local _, subEvent, _, sourceGUID, _, _, _, destGUID, destName, _, _, spellID = ...\
        if spellID == 417789 then\
            if not aura_env.last or GetTime() - aura_env.last > 11 then\
                aura_env.last = GetTime()\
                C_Timer.After(1, function() WeakAuras.ScanEvents(\"ECHO_BLAZE_OVER_REIFRE\", true) end)\
            end\
        end\
    elseif e == \"ECHO_BLAZE_OVER_REIFRE\" and ... then\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            duration = 2,\
            autoHide = true,\
        }\
        return true\
    end\
end\
\
\
\
\
",["events"] = "CLEU:SPELL_DAMAGE:SPELL_MISSED ECHO_BLAZE_OVER_REIFRE",["custom_type"] = "stateupdate",["check"] = "event",["names"] = {},["spellIds"] = {},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["selfPoint"] = "BOTTOM",["desc"] = "Shows when no more Blazes will be going out so you know you're not going to be a target this time. ",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["use_encounterid"] = true,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["size"] = {["multi"] = {},},},["fontSize"] = 30,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["preferToUpdate"] = false,["authorOptions"] = {},["fixedWidth"] = 200,["wordWrap"] = "WordWrap",["displayText_format_p_time_precision"] = 1,["displayText"] = "BLAZE OVER",["internalVersion"] = 70,["uid"] = "t0CKBwJu2Yo",["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "Blaze over",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "9. Texts - Fyrakk the Blazing",["config"] = {},["color"] = {1,1,1,1,},["displayText_format_p_time_mod_rate"] = true,["shadowColor"] = {0,0,0,1,},["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},["Spirit/Ancient hit by Blaze"] = {["outline"] = "OUTLINE",["parent"] = "9. Texts - Fyrakk the Blazing",["preferToUpdate"] = false,["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\ErrorBeep.ogg",["do_custom"] = true,["custom"] = "elogl(aura_env.state.destName..\" hit by blaze\")",["do_sound"] = true,},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "combatlog",["use_destNpcId"] = true,["subeventSuffix"] = "_DAMAGE",["duration"] = "4",["event"] = "Combat Log",["names"] = {},["spellId"] = {417789,},["use_spellId"] = true,["spellIds"] = {},["destNpcId"] = "207800, 212420",["unit"] = "player",["subeventPrefix"] = "SPELL",["use_cloneId"] = false,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["displayText_format_p_time_legacy_floor"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desc"] = "Warning on an add being hit by Blaze. ",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["size"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["displayText_format_destName_format"] = "none",["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["displayText_format_p_time_mod_rate"] = true,["selfPoint"] = "BOTTOM",["conditions"] = {},["internalVersion"] = 70,["wordWrap"] = "WordWrap",["displayText_format_p_time_precision"] = 1,["yOffset"] = 0,["config"] = {},["color"] = {1,1,1,1,},["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "Spirit/Ancient hit by Blaze",["fontSize"] = 20,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["authorOptions"] = {},["uid"] = "SV)EbWcXGPl",["xOffset"] = 0,["displayText"] = "%destName HIT BY BLAZE",["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 200,["information"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,},["9. [FRONTAL] Fyr'alath's Bite Cast - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["rotateText"] = "NONE",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.678431391716,0,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "5205711",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["parent"] = "9. Bars - Fyrakk the Blazing",["customText"] = "function()\
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
",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "P5iaCi9GtCQ",["zoom"] = 0,["customTextUpdate"] = "update",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {417431,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["use_spellNames"] = true,["subeventPrefix"] = "SPELL",["spellIds"] = {},["event"] = "Cast",["unit"] = "boss",["names"] = {},["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["borderOffset"] = 5,["internalVersion"] = 70,["url"] = "https://echoesports.gg",["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkRotation"] = 0,["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["sparkRotationMode"] = "AUTO",["adjustedMin"] = "4",["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "FRONTAL",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_text_format_1.unitName_abbreviate"] = true,},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_shadowColor"] = {0,0,0,1,},["anchorXOffset"] = 0,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_shadowYOffset"] = -1,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_RIGHT",["text_visible"] = true,["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_legacy_floor"] = true,},{["border_offset"] = 0,["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["text_text"] = "",},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glowThickness"] = 1,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glow"] = false,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["useAdjustededMax"] = false,["source"] = "import",["displayTextRight"] = "%p",["auto"] = true,["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["icon"] = true,["borderSize"] = 16,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["authorOptions"] = {},["color"] = {},["sparkHeight"] = 14,["borderInFront"] = false,["textFlags"] = "None",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["config"] = {},["id"] = "9. [FRONTAL] Fyr'alath's Bite Cast - Fyrakk the Blazing",["adjustedMax"] = "4",["frameStrata"] = 1,["width"] = 240,["backgroundColor"] = {0,0,0,0.33132427930832,},["timer"] = true,["inverse"] = false,["displayTextLeft"] = "%n",["orientation"] = "HORIZONTAL",["conditions"] = {},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",},["9. My Group Dropped"] = {["sparkWidth"] = 10,["iconSource"] = -1,["xOffset"] = 0,["displayText_format_p_time_dynamic_threshold"] = 60,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 8,["sparkRotation"] = 0,["icon"] = false,["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["keepAspectRatio"] = false,["wordWrap"] = "WordWrap",["barColor"] = {0,0,0,0.28000003099442,},["desc"] = "#corruption name name\
#corruption name name\
#corruption name name\
#corruption name name\
\
If you're in a Corruption Group then this Icon will show when anyone in the Group drops the seed. The duration is the time until the damage tick. ",["font"] = "Friz Quadrata TT",["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["ingroup"] = {["single"] = "raid",["multi"] = {["raid"] = true,},},["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,["difficulty"] = {["single"] = "mythic",["multi"] = {["mythic"] = true,},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["shadowXOffset"] = 1,["useAdjustededMin"] = false,["regionType"] = "icon",["texture"] = "Blizzard Raid Bar",["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["spark"] = true,["tocversion"] = 100200,["alpha"] = 1,["config"] = {["sort"] = 3,},["fixedWidth"] = 200,["outline"] = "OUTLINE",["sparkOffsetX"] = 0,["color"] = {1,1,1,1,},["shadowYOffset"] = -1,["cooldownSwipe"] = true,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["event"] = "Health",["subeventPrefix"] = "SPELL",["custom_type"] = "stateupdate",["custom"] = "function(s,e,...)\
    if e == \"ENCOUNTER_START\" or e == \"EXRT_NOTE_UPDATE\" or e == \"STATUS\" then\
        aura_env.TryReadNote()\
        \
        aura_env.createGroups()\
        aura_env.myGroup = nil\
        aura_env.myIndex = nil\
        aura_env.myGroupMembers = nil\
        aura_env.myGroupTotal = nil\
        aura_env.carrying = nil\
        for i, set in ipairs(aura_env.rotations) do\
            local myIndex = tIndexOf(set, WeakAuras.me)\
            if myIndex then\
                aura_env.myGroup = i\
                aura_env.myIndex = myIndex\
                aura_env.myGroupMembers = set\
                aura_env.myGroupTotal = #set\
                --WeakAuras.ScanEvents(\"ECHO_FYRAKK_CORRUPTION_GROUP_UPDATE\", i, myIndex, CopyTable(set, true))\
                break\
            end\
        end        \
    elseif e == \"UNIT_SPELLCAST_SUCCEEDED\" then\
        local unit, _, spellID = ...\
        --if spellID == 430050 then elogl(\"Corrupted seed dropped by\", (UnitName(unit))) end\
        if spellID == 430050 and aura_env.unitInMySet(unit) then\
            --elog(\"Fyrakk dropper - someone in my group dropped\", (UnitName(unit)))\
            s[\"\"] = {\
                show = true,\
                changed = true,\
                duration = 2.5,\
                expirationTime = GetTime() + 2.5,\
                progressType = \"timed\",\
                autoHide = true,\
                unit = unit,\
            }\
            return true\
        end\
        \
    elseif e == \"OPTIONS\" then\
        s[\"\"] = {\
            show = true,\
            changed = true,\
            duration = 2.5,\
            expirationTime = GetTime() + 2.5,\
            progressType = \"timed\",\
            autoHide = true,\
            unit = \"player\",\
        }\
        return true\
    end\
    \
end\
\
\
\
",["spellIds"] = {},["names"] = {},["check"] = "event",["events"] = "ENCOUNTER_START EXRT_NOTE_UPDATE  UNIT_SPELLCAST_SUCCEEDED:group",["unit"] = "player",["customVariables"] = "{duration = true,expirationTime = true}",},["untrigger"] = {},},["disjunctive"] = "any",["customTriggerLogic"] = "function(t) return t[1] and t[3] end",["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["preferToUpdate"] = false,["information"] = {},["sparkColor"] = {1,1,1,1,},["shadowColor"] = {0,0,0,1,},["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%unit\\nDROPPED",["text_shadowColor"] = {0,0,0,1,},["text_text_format_unit_abbreviate_max"] = 6,["text_selfPoint"] = "TOP",["text_automaticWidth"] = "Auto",["text_text_format_unit_color"] = "class",["text_text_format_groupIndex._format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_fixedWidth"] = 64,["text_text_format_n_format"] = "none",["text_anchorXOffset"] = 0,["type"] = "subtext",["text_text_format_unit_realm_name"] = "never",["text_color"] = {1,1,1,1,},["text_text_format_text_format"] = "none",["text_text_format_unit_abbreviate"] = true,["text_shadowYOffset"] = -1,["text_text_format_unit_format"] = "Unit",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "OUTER_BOTTOM",["text_fontType"] = "None",["text_font"] = "Expressway MonoNum",["text_fontSize"] = 20,["anchorXOffset"] = 0,["text_text_format_groupIndex_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Proc",["glowLength"] = 10,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = true,["glowXOffset"] = 0,["glowThickness"] = 1,["glowScale"] = 1,["glowDuration"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 64,["cooldownTextDisabled"] = false,["backgroundColor"] = {0.67058825492859,0,0,1,},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["fontSize"] = 12,["source"] = "import",["displayText_format_p_time_legacy_floor"] = false,["desaturate"] = false,["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["uid"] = "8RCwDI4W02K",["sparkHidden"] = "BOTH",["selfPoint"] = "BOTTOM",["sparkRotationMode"] = "AUTO",["icon_side"] = "RIGHT",["displayText_format_p_time_format"] = 0,["authorOptions"] = {{["type"] = "select",["key"] = "sort",["values"] = {"Player at top","Player at bottom","Index order",},["default"] = 1,["name"] = "Sort Mode",["useDesc"] = false,["width"] = 1,},},["displayText_format_p_time_precision"] = 1,["displayText_format_p_time_mod_rate"] = true,["sparkHeight"] = 30,["displayText"] = "%p",["justify"] = "LEFT",["cooldownEdge"] = false,["id"] = "9. My Group Dropped",["actions"] = {["start"] = {["do_custom"] = false,},["init"] = {["do_custom"] = true,["custom"] = "local keyword = \"corruption\"\
\
function aura_env.TryReadNote()\
    aura_env.initialized = false;\
    aura_env.rotations = {}\
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
                    \
                    table.insert(newRotation,guy);\
                end\
            end\
            table.insert(aura_env.rotations,newRotation);\
        end\
    end\
    elogl(\"FyrakkCorruption Note Init:\",#aura_env.rotations)\
    aura_env.initialized = true;\
    \
end\
\
function aura_env.createGroups()\
    aura_env.groupByName = {}\
    aura_env.indexByName = {}\
    for i, set in ipairs(aura_env.rotations) do\
        for j, name in ipairs(set) do\
            aura_env.groupByName[name] = i\
            aura_env.indexByName[name] = j\
        end\
    end\
end\
\
function aura_env.unitInMySet(name)\
    local name = (UnitName(name))\
    return aura_env.myGroupMembers and tContains(aura_env.myGroupMembers, name)\
end\
\
function aura_env.unitInMyGroup(name)\
    return aura_env.groupByName[name] == aura_env.groupByName[WeakAuras.me]\
end\
function aura_env.unitIndex(name)\
    return aura_env.indexByName[name]\
end\
\
aura_env.marks = {1,2,3,4,5,6,7,8}\
\
function aura_env.setMark(unit)\
    if UnitIsGroupLeader(\"player\") then\
        if GetRaidTargetIndex(unit) ~= aura_env.marks[aura_env.myGroup] then\
            SetRaidTarget(unit, aura_env.marks[aura_env.myGroup])\
        end\
    end\
end\
\
function aura_env.getIndex(index, myIndex, total)\
    local sort = aura_env.config.sort\
    local me = myIndex\
    if sort == 1 then\
        return index < me and index + total or index\
    elseif sort == 2 then\
        return index > me and index - total or index\
    else\
        return index\
    end\
end",},["finish"] = {},},["useCooldownModRate"] = true,["width"] = 64,["zoom"] = 0,["parent"] = "9. Corruption Groups",["inverse"] = false,["barColor2"] = {1,1,0,1,},["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "active",["value"] = 0,["op"] = "==",},["changes"] = {{["value"] = {0.10588236153126,0.75294125080109,0,1,},["property"] = "backgroundColor",},},},{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["value"] = "27.9",["op"] = ">",},["changes"] = {{["value"] = {0.98039221763611,1,0,1,},["property"] = "backgroundColor",},},["linked"] = true,},{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["op"] = "<",["value"] = "18",},["changes"] = {{["value"] = {0.75294125080109,0,0,1,},["property"] = "backgroundColor",},},["linked"] = true,},{["check"] = {["value"] = 1,["variable"] = "show",},["changes"] = {{["value"] = {0.49411767721176,0.49411767721176,0.49411767721176,1,},["property"] = "backgroundColor",},},},},["cooldown"] = true,["displayIcon"] = 4554353,},["9. Private Aura Holder 2 (singles) - Fyrakk"] = {["iconSource"] = -1,["wagoID"] = "n3lAhBYxn",["authorOptions"] = {},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 4,["cooldownSwipe"] = true,["cooldownEdge"] = false,["actions"] = {["start"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
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
aura_env.region.anchorID = C_UnitAuras.AddPrivateAuraAnchor(privateAnchorArgs)",["do_custom"] = true,},["finish"] = {["custom"] = "local anchorID = aura_env.region.anchorID\
if anchorID then\
    C_UnitAuras.RemovePrivateAuraAnchor(anchorID)\
end",["do_custom"] = true,},["init"] = {["do_custom"] = false,},},["triggers"] = {[1] = {["trigger"] = {["custom_type"] = "stateupdate",["type"] = "custom",["use_alwaystrue"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["use_absorbMode"] = true,["event"] = "Conditions",["unit"] = "player",["names"] = {},["spellIds"] = {},["custom"] = "function(a)\
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
end",["events"] = "",["check"] = "event",["use_absorbHealMode"] = true,["use_unit"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["version"] = 6,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%index",["text_text_format_p_format"] = "timed",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["type"] = "subtext",["text_text_format_index_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_shadowXOffset"] = 0,["text_shadowYOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_fontSize"] = 40,["anchorXOffset"] = 0,["text_text_format_p_time_precision"] = 1,},},["height"] = 100,["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["source"] = "import",["regionType"] = "icon",["xOffset"] = 450,["information"] = {},["icon"] = true,["url"] = "https://echoesports.gg",["zoom"] = 0,["anchorFrameParent"] = false,["config"] = {},["useCooldownModRate"] = true,["cooldownTextDisabled"] = true,["semver"] = "1.0.5",["tocversion"] = 100200,["id"] = "9. Private Aura Holder 2 (singles) - Fyrakk",["anchorFrameType"] = "SCREEN",["frameStrata"] = 1,["width"] = 100,["alpha"] = 1,["uid"] = "QlT3GdSoI3J",["inverse"] = false,["parent"] = "9. Singles - Fyrakk the Blazing",["selfPoint"] = "CENTER",["conditions"] = {{["check"] = {["trigger"] = -1,["variable"] = "customcheck",["value"] = "function()\
    return not WeakAuras.IsOptionsOpen()\
end",},["changes"] = {{["value"] = {1,1,1,0,},["property"] = "color",},{["property"] = "sub.2.text_visible",},},},},["cooldown"] = false,["color"] = {1,1,1,1,},},["9. [SEEDS LANDING] Firestorm Landing - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["borderColor"] = {1,1,1,0.5,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0,0.90196084976196,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "136186",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["adjustedMin"] = "4",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["customTextUpdate"] = "update",["config"] = {},["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {419506,},["type"] = "combatlog",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["unit"] = "boss",["use_absorbMode"] = true,["event"] = "Combat Log",["names"] = {},["subeventPrefix"] = "SPELL",["use_spellId"] = true,["spellIds"] = {},["use_spellNames"] = true,["duration"] = "6",["use_unit"] = true,["spellId"] = {422935,},["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["borderInset"] = 11,["internalVersion"] = 70,["rotateText"] = "NONE",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkRotation"] = 0,["stickyDuration"] = false,["width"] = 240,["backdropColor"] = {1,1,1,0.5,},["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "SEEDS LANDING",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_shadowYOffset"] = -1,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_fontType"] = "OUTLINE",["text_anchorYOffset"] = 0,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_legacy_floor"] = true,},{["border_anchor"] = "bar",["border_offset"] = 0,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_size"] = 1,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "9. [SEEDS LANDING] Firestorm Landing - Fyrakk the Blazing",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["customText"] = "function()\
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
",["source"] = "import",["timerSize"] = 12,["displayTextLeft"] = "%n",["icon"] = true,["border"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderSize"] = 16,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["textFlags"] = "None",["color"] = {},["sparkHeight"] = 14,["borderInFront"] = false,["authorOptions"] = {},["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["zoom"] = 0,["sparkHidden"] = "NEVER",["stacksFlags"] = "None",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["sparkRotationMode"] = "AUTO",["backgroundColor"] = {0,0,0,0.33132427930832,},["inverse"] = false,["auto"] = true,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "ovP3qxS5Fzc",},["Adds Marker"] = {["xOffset"] = 0,["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 17,["actions"] = {["start"] = {},["init"] = {["do_custom"] = true,["custom"] = "local keyword = \"addsk\"\
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
    --print(\"Seed Note Init: addsk\",#aura_env.rotations,\"helpers\", #aura_env.helpers)\
    elogl(\"Addsk Note Init:\",aura_env.rotations[1] and #aura_env.rotations[1] or \"no rotation\")\
    aura_env.initialized = true;\
end",},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["unit"] = "player",["events"] = "CLEU:SPELL_AURA_APPLIED:SPELL_CAST_SUCCESS:UNIT_DIED NAME_PLATE_UNIT_ADDED NAME_PLATE_UNIT_REMOVED ENCOUNTER_START EXRT_NOTE_UPDATE ",["spellIds"] = {},["custom_type"] = "stateupdate",["names"] = {},["custom"] = "function(allstates, event, ...)\
    if(event == \"COMBAT_LOG_EVENT_UNFILTERED\")then\
        local _, subEvent, _, _, _, _, _ ,destGUID , destName, _, _, spellID = ...;\
        \
        --reset\
        if(subEvent == \"SPELL_CAST_SUCCESS\" and spellID == 422524)then\
            \
            aura_env.count = 0;\
            aura_env.seen = {}\
            aura_env.tracked = {}\
            if allstates[\"\"] then\
                allstates[\"\"].show = true\
                allstates[\"\"].changed = true\
                return true\
            end\
            \
        elseif subEvent == \"UNIT_DIED\" and allstates[destGUID] then\
            allstates[destGUID].show = false\
            allstates[destGUID].changed = true\
            return true\
            \
            -- applied\
        elseif(subEvent == \"SPELL_AURA_APPLIED\" and spellID == 429734)then\
            aura_env.seen = aura_env.seen or {}\
            if not aura_env.seen[destGUID] then\
                \
                aura_env.seen[destGUID] = true\
                \
                aura_env.count = aura_env.count and aura_env.count + 1 or 1;\
                \
                local rotation = aura_env.rotations[1];\
                \
                if rotation and rotation[aura_env.count] and UnitIsUnit(rotation[aura_env.count], WeakAuras.me) then\
                    --elog(\"Furak Addsk: I'm tracking\", destGUID)\
                    aura_env.tracked = aura_env.tracked or {}\
                    aura_env.tracked[destGUID] = true\
                    \
                    for i = 1, 40 do\
                        local unit = \"nameplate\"..i\
                        if UnitExists(unit) and UnitGUID(unit) == destGUID then\
                            allstates[destGUID] = {\
                                show = true,\
                                changed = true,\
                                unit = unit,\
                            }\
                            return true;\
                        end\
                    end\
                end\
            end\
        end\
        \
    elseif event == \"ENCOUNTER_START\" or event == \"EXRT_NOTE_UPDATE\" then\
        aura_env.TryReadNote()\
        \
    elseif event == \"NAME_PLATE_UNIT_ADDED\" and ... then\
        local unit = ...\
        local guid = UnitGUID(unit)\
        if aura_env.tracked and aura_env.tracked[guid] then\
            allstates[guid] = {\
                show = true,\
                changed = true,\
                unit = unit, \
            }\
            return true\
        end\
        \
    elseif event == \"NAME_PLATE_UNIT_REMOVED\" and ... then\
        local unit = ...\
        local guid = UnitGUID(unit)\
        if allstates[guid] then\
            allstates[guid].show = false\
            allstates[guid].changed = true\
            return true\
            \
        end\
    end\
end",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["rotation"] = 0,["subRegions"] = {{["text_shadowXOffset"] = 1,["text_text"] = "MINE",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "CENTER",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "BOTTOM",["text_anchorYOffset"] = 20,["text_text_format_n_format"] = "none",["text_fontSize"] = 24,["anchorXOffset"] = 0,["text_visible"] = true,},{["type"] = "subbackground",},},["height"] = 100,["rotate"] = false,["load"] = {["size"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["source"] = "import",["mirror"] = false,["regionType"] = "texture",["blendMode"] = "BLEND",["anchorFrameParent"] = false,["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\eyes.tga",["parent"] = "9. Singles - Fyrakk the Blazing",["desc"] = "#addsk name name name name ...\
\
Each person in the list above will have a different add marked when they spawn. ",["tocversion"] = 100200,["id"] = "Adds Marker",["alpha"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "NAMEPLATE",["color"] = {1,1,1,1,},["uid"] = "u7WYK(2csUq",["authorOptions"] = {},["config"] = {},["width"] = 100,["conditions"] = {},["information"] = {},["selfPoint"] = "BOTTOM",},["9. CAST Corrupt - Fyrakk the Blazing"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["stacksFlags"] = "None",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 3,["sparkRotation"] = 0,["rotateText"] = "NONE",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,1,1,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["borderOffset"] = 5,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "532284",["textColor"] = {1,1,1,1,},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "9. Bars - Fyrakk the Blazing",["customText"] = "function()\
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
",["preferToUpdate"] = false,["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["sparkOffsetX"] = 0,["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["sparkRotationMode"] = "AUTO",["borderInset"] = 11,["displayTextLeft"] = "%n",["triggers"] = {[1] = {["trigger"] = {["spellNames"] = {419144,},["type"] = "unit",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_START",["use_exact_spellId"] = false,["event"] = "Cast",["subeventPrefix"] = "SPELL",["use_spellNames"] = true,["spellIds"] = {},["use_unit"] = true,["names"] = {},["unit"] = "boss",["use_absorbMode"] = true,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["customTextUpdate"] = "update",["internalVersion"] = 70,["backgroundColor"] = {0,0,0,0.33132427930832,},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["url"] = "https://echoesports.gg",["stickyDuration"] = false,["width"] = 240,["adjustedMin"] = "4",["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_text_format_p_time_format"] = 0,["text_text"] = "%p",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_mod_rate"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_shadowXOffset"] = 1,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_format"] = "timed",["text_anchorYOffset"] = 0,["text_text_format_p_time_precision"] = 1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_CENTER",["text_visible"] = true,["text_shadowYOffset"] = -1,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_p_time_legacy_floor"] = true,},{["text_text"] = "",["border_size"] = 1,["border_anchor"] = "bar",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["text_text"] = "",["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 23,["timerFlags"] = "None",["id"] = "9. CAST Corrupt - Fyrakk the Blazing",["sparkBlendMode"] = "ADD",["backdropColor"] = {1,1,1,0.5,},["config"] = {},["source"] = "import",["timerSize"] = 12,["auto"] = true,["stacksFont"] = "Friz Quadrata TT",["border"] = false,["borderEdge"] = "None",["textFlags"] = "None",["borderSize"] = 16,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["color"] = {},["authorOptions"] = {},["sparkHeight"] = 14,["borderInFront"] = false,["icon"] = true,["stacksColor"] = {1,1,1,1,},["displayTextRight"] = "%p",["zoom"] = 0,["sparkHidden"] = "NEVER",["adjustedMax"] = "4",["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["useAdjustededMax"] = false,["borderColor"] = {1,1,1,0.5,},["inverse"] = false,["textSize"] = 12,["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["uid"] = "wzWJ)l70xMM",},["9. [SCOOCHING] Dream Rend Duration - Fyrakk the Blazing 2"] = {["sparkWidth"] = 3,["stacksSize"] = 12,["iconSource"] = -1,["xOffset"] = 0,["adjustedMax"] = "4",["yOffset"] = 340,["anchorPoint"] = "CENTER",["echoVersion"] = 10,["sparkRotation"] = 0,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["fontFlags"] = "OUTLINE",["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {1,0,0,1,},["desaturate"] = false,["sparkOffsetY"] = 0,["gradientOrientation"] = "HORIZONTAL",["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["timerColor"] = {1,1,1,1,},["smoothProgress"] = true,["useAdjustededMin"] = false,["regionType"] = "aurabar",["stacks"] = true,["texture"] = "Blizzard Raid Bar",["textFont"] = "Friz Quadrata TT",["zoom"] = 0,["spark"] = false,["tocversion"] = 100200,["timerFont"] = "Friz Quadrata TT",["alpha"] = 1,["sparkColor"] = {1,1,1,1,},["displayIcon"] = "1357803",["textColor"] = {1,1,1,1,},["sparkOffsetX"] = 0,["color"] = {},["adjustedMin"] = "4",["preferToUpdate"] = false,["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "9. Singles - Fyrakk the Blazing",["uid"] = "C04b(7IvT0f",["customTextUpdate"] = "update",["borderInset"] = 11,["textSize"] = 12,["triggers"] = {[1] = {["trigger"] = {["use_count"] = true,["duration"] = "12",["names"] = {},["use_delay"] = false,["debuffType"] = "HELPFUL",["type"] = "combatlog",["use_absorbHealMode"] = true,["subeventSuffix"] = "_CAST_SUCCESS",["event"] = "Combat Log",["unit"] = "boss",["spellIds"] = {},["use_spellId"] = true,["count"] = "2",["use_sourceUnit"] = false,["use_unit"] = true,["spellId"] = {"417455",},["use_absorbMode"] = true,["subeventPrefix"] = "SPELL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",["internalVersion"] = 70,["borderOffset"] = 5,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["backdropInFront"] = false,["text"] = true,["sparkRotationMode"] = "AUTO",["stickyDuration"] = false,["anchorFrameType"] = "SCREEN",["backdropColor"] = {1,1,1,0.5,},["timer"] = true,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_text"] = "",["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "WAIT",["text_shadowColor"] = {0,0,0,1,},["text_text_format_destName_decimal_precision"] = 1,["text_fixedWidth"] = 64,["text_text_format_destName_format"] = "Unit",["text_text_format_1.unitName_abbreviate_max"] = 8,["rotateText"] = "NONE",["text_color"] = {0.95686280727386,0.99607849121094,1,1,},["text_text_format_destName_realm_name"] = "never",["text_shadowYOffset"] = -1,["text_text_format_destName_abbreviate_max"] = 8,["text_visible"] = true,["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_text_format_destName_color"] = "class",["text_text_format_1.unitName_realm_name"] = "never",["text_text_format_1.unitName_color"] = "class",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_text_format_affected_format"] = "none",["anchorYOffset"] = 0,["text_justify"] = "CENTER",["type"] = "subtext",["text_anchorXOffset"] = 2,["text_font"] = "Expressway MonoNum",["text_text_format_1.unitName_format"] = "Unit",["text_anchorYOffset"] = 0,["text_text_format_destName_abbreviate"] = false,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_1.unitName_abbreviate"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_time_mod_rate"] = true,["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_p_time_legacy_floor"] = true,["text_text_format_p_time_dynamic_threshold"] = 60,["text_text_format_p_time_format"] = 0,["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_anchorYOffset"] = 0,["text_fontType"] = "OUTLINE",["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_precision"] = 1,["text_text_format_p_format"] = "timed",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["border_anchor"] = "bar",["border_size"] = 1,["text_text"] = "",["type"] = "subborder",["border_color"] = {0,0,0,1,},["border_visible"] = true,["border_edge"] = "Square Full White",["border_offset"] = 0,},{["glowFrequency"] = 0.15,["type"] = "subglow",["useGlowColor"] = false,["glowType"] = "Pixel",["glowLength"] = 10,["glowDuration"] = 1,["text_text"] = "",["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["glow"] = false,["glowXOffset"] = 0,["glowScale"] = 1,["glow_anchor"] = "bar",["glowThickness"] = 1,["glowLines"] = 8,["glowBorder"] = false,},{["tick_blend_mode"] = "ADD",["type"] = "subtick",["tick_xOffset"] = 0,["tick_desaturate"] = false,["automatic_length"] = true,["tick_thickness"] = 2,["tick_placement_mode"] = "AtValue",["use_texture"] = false,["tick_color"] = {1,1,1,1,},["tick_yOffset"] = 0,["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["tick_visible"] = true,["tick_placement"] = "6",["tick_length"] = 30,["tick_mirror"] = false,["tick_rotation"] = 0,},{["tick_blend_mode"] = "ADD",["type"] = "subtick",["tick_xOffset"] = 0,["tick_desaturate"] = false,["automatic_length"] = true,["tick_thickness"] = 2,["tick_placement_mode"] = "AtValue",["use_texture"] = false,["tick_color"] = {1,1,1,1,},["tick_yOffset"] = 0,["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["tick_visible"] = true,["tick_placement"] = "3",["tick_length"] = 30,["tick_mirror"] = false,["tick_rotation"] = 0,},},["height"] = 30,["timerFlags"] = "None",["sparkHidden"] = "NEVER",["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["customText"] = "function()\
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
",["source"] = "import",["displayTextRight"] = "%p",["borderColor"] = {1,1,1,0.5,},["auto"] = true,["border"] = false,["borderEdge"] = "None",["stacksFont"] = "Friz Quadrata TT",["borderSize"] = 16,["anchorFrameParent"] = false,["icon_side"] = "LEFT",["icon"] = true,["authorOptions"] = {},["sparkHeight"] = 14,["borderInFront"] = false,["textFlags"] = "None",["stacksColor"] = {1,1,1,1,},["timerSize"] = 12,["displayTextLeft"] = "%n",["id"] = "9. [SCOOCHING] Dream Rend Duration - Fyrakk the Blazing 2",["stacksFlags"] = "None",["frameStrata"] = 1,["width"] = 400,["rotateText"] = "NONE",["backgroundColor"] = {0,0,0,0.33132427930832,},["inverse"] = true,["config"] = {},["orientation"] = "HORIZONTAL",["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["value"] = "6",["op"] = "<",},["changes"] = {{["value"] = {1,1,0,1,},["property"] = "barColor",},{["value"] = "SCOOCHING",["property"] = "sub.3.text_text",},},},{["check"] = {["trigger"] = 1,["variable"] = "expirationTime",["op"] = "<",["value"] = "3",},["changes"] = {{["value"] = {0.1803921610117,1,0,1,},["property"] = "barColor",},},},},["barColor2"] = {0.77647066116333,0,0.29803922772408,1,},["borderBackdrop"] = "Blizzard Tooltip",},["9. Fyrakk the Blazing"] = {["controlledChildren"] = {"9. Icons (high) - Fyrakk the Blazing","9. Icons (low) - Fyrakk the Blazing","9. Bars - Fyrakk the Blazing","9. Texts - Fyrakk the Blazing","9. Singles - Fyrakk the Blazing",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = " Echo - Amirdrassil",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["subeventPrefix"] = "SPELL",["event"] = "Health",["unit"] = "player",},["untrigger"] = {},},},["internalVersion"] = 70,["selfPoint"] = "CENTER",["subRegions"] = {},["load"] = {["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100200,["id"] = "9. Fyrakk the Blazing",["authorOptions"] = {},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["groupIcon"] = "5342925",["uid"] = "JU(FgYfLtAB",["xOffset"] = 0,["borderInset"] = 1,["config"] = {},["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["9. [FIRESTORM] Eternal Firestorm - Fyrakk the Blazing"] = {["iconSource"] = -1,["color"] = {1,1,1,1,},["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["cooldownSwipe"] = true,["customTextUpdate"] = "update",["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "aura2",["auranames"] = {"419060","422520","422935",},["fetchTooltip"] = false,["event"] = "Health",["names"] = {},["spellIds"] = {},["useName"] = true,["subeventSuffix"] = "_CAST_START",["subeventPrefix"] = "SPELL",["unit"] = "player",["debuffType"] = "HARMFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 70,["keepAspectRatio"] = false,["selfPoint"] = "CENTER",["stickyDuration"] = false,["subRegions"] = {{["text_text"] = "",["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "METEORS",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_anchorXOffset"] = 0,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_anchorYOffset"] = 0,["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "OUTER_BOTTOM",["text_text_format_tooltip1_format"] = "BigNumber",["text_visible"] = true,["text_fontSize"] = 14,["anchorXOffset"] = 0,["text_shadowYOffset"] = -1,},{["text_shadowXOffset"] = 1,["text_text_format_s_format"] = "none",["text_text"] = "%s",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_anchorXOffset"] = 7,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["text_text_format_1.tooltip3_format"] = "none",["text_text_format_tooltip1_format"] = "none",["text_text_format_tooltip3_format"] = "none",["type"] = "subtext",["text_text_format_tooltip2_format"] = "none",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["anchorXOffset"] = 0,["text_anchorYOffset"] = -6,["text_visible"] = true,["text_wordWrap"] = "WordWrap",["text_fontType"] = "OUTLINE",["text_anchorPoint"] = "INNER_BOTTOMRIGHT",["text_shadowYOffset"] = -1,["text_text_format_tooltip13_format"] = "none",["text_fontSize"] = 20,["text_text_format_1.tooltip1_format"] = "none",["text_text_format_1.ttoltip1_format"] = "none",},{["glowFrequency"] = 0.25,["type"] = "subglow",["glowDuration"] = 1,["glowType"] = "Pixel",["glowLength"] = 10,["useGlowColor"] = false,["glowYOffset"] = 0,["glowColor"] = {1,1,1,1,},["text_text"] = "",["glow"] = false,["glowThickness"] = 1,["glowScale"] = 1,["glowXOffset"] = 0,["glowLines"] = 8,["glowBorder"] = false,},},["height"] = 55,["load"] = {["use_encounterid"] = true,["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["size"] = {["multi"] = {},},},["source"] = "import",["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["cooldown"] = true,["regionType"] = "icon",["displayIcon"] = "",["authorOptions"] = {},["desaturate"] = false,["config"] = {},["cooldownTextDisabled"] = false,["anchorFrameParent"] = false,["width"] = 55,["useCooldownModRate"] = true,["zoom"] = 0,["auto"] = true,["tocversion"] = 100200,["id"] = "9. [FIRESTORM] Eternal Firestorm - Fyrakk the Blazing",["frameStrata"] = 1,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["xOffset"] = 0,["uid"] = "8cDzbwc58WL",["inverse"] = false,["cooldownEdge"] = false,["icon"] = true,["conditions"] = {},["information"] = {["forceEvents"] = true,["ignoreOptionsEventErrors"] = true,},["parent"] = "9. Icons (high) - Fyrakk the Blazing",},["9. Colossi Positions (MACRO)"] = {["outline"] = "OUTLINE",["displayText_format_text_format"] = "none",["parent"] = "9. Texts - Fyrakk the Blazing",["preferToUpdate"] = false,["customText"] = "function()\
    if not WeakAuras.IsOptionsOpen() and aura_env.state.show then\
        if not aura_env.last or aura_env.last < GetTime() - 1.5 then\
            aura_env.last = GetTime()\
            local text\
            if aura_env.state.breaker then\
                if aura_env.state.expirationTime and aura_env.state.expirationTime > GetTime() then\
                    text = \"SOON\"..aura_env.state.position\
                else\
                    text = \"BREAK\"..aura_env.state.position\
                end\
            elseif aura_env.state.nobreak then\
                text = \"-\"\
            end\
            if text then\
                SendChatMessage(text)\
            end\
        end\
    end\
end",["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 27,["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "update",["automaticWidth"] = "Auto",["actions"] = {["start"] = {["message"] = "%position",["message_format_position_format"] = "none",["message_tts_voice"] = 0,["do_message"] = true,["message_type"] = "TTS",},["finish"] = {},["init"] = {["do_custom"] = true,["custom"] = "\
aura_env.pos = {\"{rt7}\", \"{rt1}\"}\
\
\
",},},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["debuffType"] = "HELPFUL",["event"] = "Health",["subeventPrefix"] = "SPELL",["unit"] = "player",["names"] = {},["custom"] = "function(s,e,...)\
    \
    if e == \"TRIGGER\" then\
        local num, ts = ...\
        \
        local count = ts and ts[\"\"] and ts[\"\"].show and ts[\"\"].count and tonumber(ts[\"\"].count)\
        if count and not aura_env.seenCount[count] then\
            elogl(\"Cages - started mechanic\", count)\
            aura_env.mechanicStart = GetTime()\
            aura_env.currentCount = count\
            aura_env.shadow = {}\
            aura_env.fire = {}\
            aura_env.seenCount[count] = true\
        end\
        \
    elseif e == \"ENCOUNTER_START\" then\
        aura_env.seenCount = {}\
        \
    elseif e == \"ECHO_PRIVATE_AURA\" and ... then\
        if aura_env.mechanicStart and GetTime() - aura_env.mechanicStart < 5 then\
            local spellIndex, unit, paTable = ...\
            \
            \
            if spellIndex == 1 and unit then\
                if (not tContains(aura_env.fire, unit)) then\
                    table.insert(aura_env.fire, unit)\
                    if #aura_env.fire == 4 then\
                        table.sort(aura_env.fire)\
                        \
                        elogl(\"Fyrak Colossi: fire\", unpack(aura_env.fire))\
                        \
                        local myIndex = tIndexOf(aura_env.fire, WeakAuras.me)\
                        if myIndex then\
                            if myIndex < 3 then\
                                elog(\"Fyrakk Colossi: assigned fire\", myIndex, aura_env.pos[myIndex])\
                                WeakAuras.ScanEvents(\"FYRAK_ASSIGNED_TO_ERUPTION\", true)\
                                s[\"\"] = {\
                                    show = true,\
                                    changed = true,\
                                    position = aura_env.pos[myIndex],\
                                    --autoHide = true,\
                                    duration =  5,\
                                    expirationTime = aura_env.mechanicStart + 5,\
                                    progressType = \"timed\",\
                                    breaker = true,\
                                    text = \"SOON\"\
                                }\
                                C_Timer.After(7, function() WeakAuras.ScanEvents(\"ECHO_ERUPTION_HIDE\", true) end)\
                                return true\
                                \
                            else\
                                elog(\"Fyrakk Colossi: no breaker!!\", myIndex)\
                                s[\"\"] = {\
                                    show = true,\
                                    changed = true,\
                                    nobreak = true,\
                                    autoHide = true,\
                                    duration =  4,\
                                    progressType = \"timed\",\
                                    text = \"NO BREAK\"\
                                }\
                                return true\
                            end\
                        end\
                    end\
                end\
            end\
        end\
    elseif e == \"ECHO_ERUPTION_HIDE\" and ... and s[\"\"] then\
        s[\"\"].show  =false\
        s[\"\"].changed = true\
        return true\
        \
    elseif e == \"OPTIONS\" then\
        s[\"\"] =  {\
            show = true,\
            changed = true,\
            position = aura_env.pos[1],\
            autoHide = true,\
            duration =  6.3,\
            expirationTime = GetTime() + 6.3,\
            progressType = \"timed\",\
            text = \"BREAK\",\
            breaker = true,\
        }\
        return true\
    end\
end\
\
\
",["custom_type"] = "stateupdate",["check"] = "event",["spellIds"] = {},["events"] = "ECHO_PRIVATE_AURA TRIGGER:2 ENCOUNTER_START ECHO_ERUPTION_HIDE",["customVariables"] = "{debuff = \"string\", nobreak = \"bool\", breaker = \"bool\", expirationTime = true}\
",},["untrigger"] = {},},[2] = {["trigger"] = {["type"] = "addons",["spellId"] = "428970",["use_remaining"] = true,["stage_operator"] = "==",["event"] = "Boss Mod Timer",["unit"] = "player",["use_extend"] = true,["use_spellId"] = true,["remaining"] = "11",["use_stage"] = true,["extend"] = "10",["remaining_operator"] = "<",["stage"] = "2",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["disjunctive"] = "custom",["customTriggerLogic"] = "function(t) return t[1] end",["activeTriggerMode"] = -10,},["displayText_format_p_time_mod_rate"] = true,["displayText_format_p_time_legacy_floor"] = false,["selfPoint"] = "BOTTOM",["desc"] = "Macro:\
/run WeakAuras.ScanEvents(\"ECHO_MACRO\",1)\
Assigns Erruption targets to break the given mark or stay out",["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["use_encounterid"] = true,},["fontSize"] = 60,["source"] = "import",["shadowXOffset"] = 1,["displayText_format_position_format"] = "none",["displayText_format_p_format"] = "timed",["regionType"] = "text",["fixedWidth"] = 200,["xOffset"] = 0,["internalVersion"] = 70,["displayText_format_pos_format"] = "none",["config"] = {},["displayText_format_p_time_precision"] = 1,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["wordWrap"] = "WordWrap",["displayText_format_c_format"] = "none",["justify"] = "LEFT",["tocversion"] = 100200,["id"] = "9. Colossi Positions (MACRO)",["color"] = {1,0.96078437566757,0,1,},["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["shadowYOffset"] = -1,["uid"] = "JRvnyg6zOgh",["authorOptions"] = {},["displayText_format_p_time_dynamic_threshold"] = 60,["shadowColor"] = {0,0,0,1,},["conditions"] = {{["check"] = {["trigger"] = 1,["variable"] = "nobreak",["value"] = 1,},["changes"] = {{["value"] = {0.6745098233223,0,0,1,},["property"] = "color",},{["value"] = 30,["property"] = "fontSize",},{["value"] = "NO BREAK",["property"] = "displayText",},},},{["check"] = {["trigger"] = -2,["variable"] = "AND",["checks"] = {{["trigger"] = 1,["variable"] = "breaker",["value"] = 1,},{["trigger"] = 1,["variable"] = "expirationTime",["op"] = "<",["value"] = "0",},},},["linked"] = false,["changes"] = {{["value"] = {0.14117647707462,1,0,1,},["property"] = "color",},{["value"] = {["sound_type"] = "Play",["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Glass.mp3",["sound_channel"] = "Master",},["property"] = "sound",},{["value"] = "BREAK %position",["property"] = "displayText",},{["value"] = {["message"] = "BREAK %position",["message_format_position_format"] = "none",["message_type"] = "SAY",},["property"] = "chat",},},},},["information"] = {},["displayText"] = "%text %position %p%c",},["Aflame Count"] = {["outline"] = "OUTLINE",["xOffset"] = 0,["displayText"] = "Count: %unitCount",["shadowYOffset"] = -1,["anchorPoint"] = "CENTER",["displayText_format_p_time_format"] = 0,["customTextUpdate"] = "event",["automaticWidth"] = "Auto",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["useName"] = true,["useGroup_count"] = true,["debuffType"] = "HARMFUL",["event"] = "Health",["unit"] = "group",["names"] = {},["subeventPrefix"] = "SPELL",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["group_count"] = "0",["type"] = "aura2",["auranames"] = {"417807",},["group_countOperator"] = ">",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["displayText_format_p_format"] = "timed",["internalVersion"] = 70,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["font"] = "Expressway MonoNum",["subRegions"] = {{["type"] = "subbackground",},},["load"] = {["size"] = {["multi"] = {},},["use_never"] = false,["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["use_encounterid"] = true,},["fontSize"] = 20,["source"] = "import",["shadowXOffset"] = 1,["regionType"] = "text",["preferToUpdate"] = false,["selfPoint"] = "BOTTOM",["conditions"] = {},["displayText_format_p_time_legacy_floor"] = false,["displayText_format_unitCount_format"] = "none",["displayText_format_p_time_precision"] = 1,["displayText_format_p_time_mod_rate"] = true,["color"] = {1,1,1,1,},["config"] = {},["justify"] = "CENTER",["tocversion"] = 100200,["id"] = "Aflame Count",["yOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["parent"] = "Aflame Tracker",["uid"] = "uC0yh1UxgOw",["displayText_format_p_time_dynamic_threshold"] = 60,["authorOptions"] = {},["shadowColor"] = {0,0,0,1,},["fixedWidth"] = 150,["information"] = {},["wordWrap"] = "WordWrap",},["Amirdrassil Health Bar (widget)"] = {["sparkWidth"] = 10,["sparkOffsetX"] = 0,["parent"] = "9. Singles - Fyrakk the Blazing",["preferToUpdate"] = false,["yOffset"] = 410,["anchorPoint"] = "CENTER",["echoVersion"] = 2,["sparkRotation"] = 0,["sparkRotationMode"] = "AUTO",["backgroundColor"] = {0,0,0,0.5,},["triggers"] = {[1] = {["trigger"] = {["type"] = "custom",["subeventSuffix"] = "_CAST_START",["event"] = "Health",["subeventPrefix"] = "SPELL",["unit"] = "player",["spellIds"] = {},["custom"] = "function(s,e,...)\
    if e == \"UPDATE_UI_WIDGET\" then\
        local widget = ...\
        if widget.widgetID == 5376 then\
            if not aura_env.sent then\
                C_Timer.After(1, function() \
                        if UIWidgetTopCenterContainerFrame and UIWidgetTopCenterContainerFrame:IsShown() then\
                            UIWidgetTopCenterContainerFrame:Hide()\
                        end\
                end)\
                elog(\"widget type\", widget.widgetType)\
                aura_env.sent = true\
            end\
            local visInfo = C_UIWidgetManager.GetStatusBarWidgetVisualizationInfo(widget.widgetID)\
            if visInfo then\
                s[\"\"] = s[\"\"] or {}\
                s[\"\"].show = visInfo.shownState == 1\
                s[\"\"].changed = true\
                s[\"\"].total = visInfo.barMax\
                s[\"\"].value = visInfo.barValue\
                s[\"\"].progressType = \"static\"\
                return true\
            end\
        end\
    end\
end\
\
\
\
",["custom_type"] = "stateupdate",["check"] = "event",["names"] = {},["events"] = "UPDATE_UI_WIDGET",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["icon_color"] = {1,1,1,1,},["enableGradient"] = false,["selfPoint"] = "CENTER",["barColor"] = {0.21960785984993,1,0,1,},["desaturate"] = false,["iconSource"] = -1,["sparkOffsetY"] = 0,["subRegions"] = {{["type"] = "subbackground",},{["type"] = "subforeground",},{["text_shadowXOffset"] = 1,["text_text"] = "%p",["text_text_format_p_format"] = "timed",["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["text_text_format_p_time_legacy_floor"] = false,["text_justify"] = "CENTER",["rotateText"] = "NONE",["anchorYOffset"] = 0,["type"] = "subtext",["text_text_format_p_time_dynamic_threshold"] = 60,["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_text_format_p_time_precision"] = 1,["text_shadowYOffset"] = -1,["text_text_format_p_time_mod_rate"] = true,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_RIGHT",["text_text_format_p_time_format"] = 0,["text_fontType"] = "None",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_shadowColor"] = {0,0,0,1,},},{["text_shadowXOffset"] = 1,["text_text"] = "Amirdrassil",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Expressway MonoNum",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_visible"] = true,["text_anchorPoint"] = "INNER_LEFT",["text_text_format_n_format"] = "none",["text_fontSize"] = 15,["anchorXOffset"] = 0,["text_fontType"] = "None",},},["height"] = 20,["barColor2"] = {1,1,0,1,},["load"] = {["use_encounterid"] = true,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "2677",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["sparkBlendMode"] = "ADD",["useAdjustededMax"] = false,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["source"] = "import",["internalVersion"] = 70,["icon"] = false,["desc"] = "A simple replacement for the Amirdrassil health bar, if the default one is in an awkward place in your UI. Unload if not needed. ",["sparkColor"] = {1,1,1,1,},["useAdjustededMin"] = false,["regionType"] = "aurabar",["xOffset"] = 0,["anchorFrameType"] = "SCREEN",["icon_side"] = "RIGHT",["frameStrata"] = 1,["config"] = {},["sparkHeight"] = 30,["texture"] = "Minimalist",["sparkHidden"] = "NEVER",["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",["spark"] = false,["tocversion"] = 100200,["id"] = "Amirdrassil Health Bar (widget)",["zoom"] = 0,["alpha"] = 1,["width"] = 200,["authorOptions"] = {},["uid"] = "NHyhP(Ar34k",["inverse"] = false,["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["orientation"] = "HORIZONTAL",["conditions"] = {},["information"] = {},["gradientOrientation"] = "HORIZONTAL",},});


-- 9. manifest data

journal:AddManifestData({
	{
		["echoVersion"] = 1,
		["parent"] = " Echo - Amirdrassil",
		["id"] = "9. Fyrakk the Blazing",
		["children"] = {
			"9. Singles - Fyrakk the Blazing",
			"9. Texts - Fyrakk the Blazing",
			"9. Bars - Fyrakk the Blazing",
			"9. Icons (low) - Fyrakk the Blazing",
			"9. Icons (high) - Fyrakk the Blazing",
		},
		["uid"] = "JU(FgYfLtAB",
	},
	{
		["echoVersion"] = 2,
		["parent"] = "9. Fyrakk the Blazing",
		["id"] = "9. Singles - Fyrakk the Blazing",
		["children"] = {
			"9. [GET SHIELD + PUSH] Apocalypse Roar Cast - Fyrakk the Blazing",
			"9. [KNOCK UP] Incarnate Cast Success - Fyrakk the Blazing (transition 2)",
			"9. [KNOCK UP] Incarnate Cast Success - Fyrakk the Blazing",
			"Adds Marker",
			"9. Player Can Dwarf Aflame phase1",
			"9. Player Can Dwarf Aflame phase2",
			"9. [SCOOCHING] Dream Rend Duration - Fyrakk the Blazing 2",
			"9. [SCOOCHING] Dream Rend Duration - Fyrakk the Blazing",
			"9. Mass Dispel [MASS DISPEL] - Fyrakk",
			"9. Private Aura Holder 3 (singles) - Fyrakk",
			"9. Private Aura Holder 2 (singles) - Fyrakk",
			"9. Private Aura Holder 1 (singles) - Fyrakk",
			"9. [SEED STACKS] Corruption - Fyrakk the Blazing (own stacks)",
			"Corruption Tracker (simple)",
			"Fyrakk Seeds",
			"9. Corruption Groups",
			"Aflame Tracker",
			"Intermission Positions",
			"9. GS up on Ancient",
			"9. Corruption Glow (basic)",
			"Amirdrassil Health Bar (widget)",
		},
		["uid"] = "svGB)wWiHLd",
	},
	{
		["id"] = "9. [GET SHIELD + PUSH] Apocalypse Roar Cast - Fyrakk the Blazing",
		["uid"] = "YzzkWhAGk4s",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 9,
	},
	{
		["id"] = "9. [KNOCK UP] Incarnate Cast Success - Fyrakk the Blazing (transition 2)",
		["uid"] = "ZMmJow2fz34",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 6,
	},
	{
		["id"] = "9. [KNOCK UP] Incarnate Cast Success - Fyrakk the Blazing",
		["uid"] = "0dARK6QUZjP",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 4,
	},
	{
		["id"] = "Adds Marker",
		["uid"] = "u7WYK(2csUq",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 17,
	},
	{
		["id"] = "9. Player Can Dwarf Aflame phase1",
		["uid"] = "zu1wWpCyjhm",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 14,
	},
	{
		["id"] = "9. Player Can Dwarf Aflame phase2",
		["uid"] = "JFK(k0)i(td",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 13,
	},
	{
		["id"] = "9. [SCOOCHING] Dream Rend Duration - Fyrakk the Blazing 2",
		["uid"] = "C04b(7IvT0f",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 10,
	},
	{
		["id"] = "9. [SCOOCHING] Dream Rend Duration - Fyrakk the Blazing",
		["uid"] = ")licJ6KPHAc",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 11,
	},
	{
		["id"] = "9. Mass Dispel [MASS DISPEL] - Fyrakk",
		["uid"] = "tap58rT7cU9",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. Private Aura Holder 3 (singles) - Fyrakk",
		["uid"] = "cWpCx22hImv",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 4,
	},
	{
		["id"] = "9. Private Aura Holder 2 (singles) - Fyrakk",
		["uid"] = "QlT3GdSoI3J",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 4,
	},
	{
		["id"] = "9. Private Aura Holder 1 (singles) - Fyrakk",
		["uid"] = "FeuzM5c4Pad",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 4,
	},
	{
		["id"] = "9. [SEED STACKS] Corruption - Fyrakk the Blazing (own stacks)",
		["uid"] = "iGp)HVeEdwy",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "Corruption Tracker (simple)",
		["uid"] = "JeYdOVe4DTT",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 0,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["id"] = "Fyrakk Seeds",
		["children"] = {
			"Seed Holders (comms)",
		},
		["uid"] = "rLk7YsKclxZ",
	},
	{
		["id"] = "Seed Holders (comms)",
		["uid"] = "QixQ5t1kWt0",
		["parent"] = "Fyrakk Seeds",
		["echoVersion"] = 19,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["id"] = "9. Corruption Groups",
		["children"] = {
			"9. My Group Dropped",
			"9. Corruption Groups Display (simple)",
		},
		["uid"] = "SRTDnOwkJ2C",
	},
	{
		["id"] = "9. My Group Dropped",
		["uid"] = "8RCwDI4W02K",
		["parent"] = "9. Corruption Groups",
		["echoVersion"] = 8,
	},
	{
		["id"] = "9. Corruption Groups Display (simple)",
		["uid"] = "iQy)KF0ToX1",
		["parent"] = "9. Corruption Groups",
		["echoVersion"] = 3,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["id"] = "Aflame Tracker",
		["children"] = {
			"Aflame Count",
			"Single Dispel CDs",
			"Mass Dispel CDs",
			"Aflame Timer",
		},
		["uid"] = "NrVEVFNp7s9",
	},
	{
		["id"] = "Aflame Count",
		["uid"] = "uC0yh1UxgOw",
		["parent"] = "Aflame Tracker",
		["echoVersion"] = 0,
	},
	{
		["id"] = "Single Dispel CDs",
		["uid"] = "T4IPFsQ0DpC",
		["parent"] = "Aflame Tracker",
		["echoVersion"] = 1,
	},
	{
		["id"] = "Mass Dispel CDs",
		["uid"] = "Ai8s4dfMK)k",
		["parent"] = "Aflame Tracker",
		["echoVersion"] = 1,
	},
	{
		["id"] = "Aflame Timer",
		["uid"] = "o5PtfBYPmxu",
		["parent"] = "Aflame Tracker",
		["echoVersion"] = 0,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["id"] = "Intermission Positions",
		["children"] = {
			"Intermission Positions (fire Macro)",
		},
		["uid"] = "bVfHGzMrKcU",
	},
	{
		["id"] = "Intermission Positions (fire Macro)",
		["uid"] = "Hr82v0j9Ate",
		["parent"] = "Intermission Positions",
		["echoVersion"] = 34,
	},
	{
		["id"] = "9. GS up on Ancient",
		["uid"] = "(tjLE9E4bDf",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 3,
	},
	{
		["id"] = "9. Corruption Glow (basic)",
		["uid"] = "NCdy(WWnQDi",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 4,
	},
	{
		["id"] = "Amirdrassil Health Bar (widget)",
		["uid"] = "NHyhP(Ar34k",
		["parent"] = "9. Singles - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 1,
		["parent"] = "9. Fyrakk the Blazing",
		["id"] = "9. Texts - Fyrakk the Blazing",
		["children"] = {
			"Blaze over",
			"9. Colossi Positions (MACRO)",
			"Spirit/Ancient hit by Blaze",
		},
		["uid"] = "3ECUYzuvmeK",
	},
	{
		["id"] = "Blaze over",
		["uid"] = "t0CKBwJu2Yo",
		["parent"] = "9. Texts - Fyrakk the Blazing",
		["echoVersion"] = 6,
	},
	{
		["id"] = "9. Colossi Positions (MACRO)",
		["uid"] = "JRvnyg6zOgh",
		["parent"] = "9. Texts - Fyrakk the Blazing",
		["echoVersion"] = 27,
	},
	{
		["id"] = "Spirit/Ancient hit by Blaze",
		["uid"] = "SV)EbWcXGPl",
		["parent"] = "9. Texts - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "9. Fyrakk the Blazing",
		["id"] = "9. Bars - Fyrakk the Blazing",
		["children"] = {
			"9. [FLY AWAY] Incarnate Cast - Fyrakk the Blazing",
			"9. [TANK HIT] Infernal Maw Cast - Fyrakk the Blazing",
			"9. [BREATH + ADDS] Shadowflame Devastation Cast - Fyrakk the Blazing",
			"9. [RUN AWAY] Flamefall Cast - Fyrakk the Blazing",
			"9. [EXPLODING] Exploding Core Cast - Fyrakk the Blazing (add)",
			"9. [CAGES] Shadow Cage Cast - Fyrakk the Blazing (add)",
			"9. [CAGE BREAK] Molten Eruption Cast - Fyrakk the Blazing (add)",
			"9. [BREATH] Deep Breath - Fyrakk the Blazing",
			"9. [BREATH] Shadowflame Breath Cast - Fyrakk the Blazing",
			"9. ABSORB Corrupt - Fyrakk the Blazing",
			"9. CAST Corrupt - Fyrakk the Blazing",
			"9. [FIREBALL] Fyr'alath's Flame Cast - Fyrakk the Blazing (add?)",
			"9. [FRONTAL] Fyr'alath's Bite Cast - Fyrakk the Blazing",
			"9. [RIFT INC] Dream Rend Cast - Fyrakk the Blazing",
			"9. [WILDFIRE] Wildfire Cast - Fyrakk the Blazing",
			"9. [SOAK] Darkflame Cleave Incoming - Fyrakk the Blazing",
			"9. [SEEDS LANDING] Firestorm Landing - Fyrakk the Blazing",
			"9. [TORNADOES] Eternal Firestorm Landing - Fyrakk the Blazing",
			"9. [LANDING] Greater Firestorm Landing - Fyrakk the Blazing",
			"9. [LANDING] Firestorm Landing - Fyrakk the Blazing",
			"9. [FIRESTORM + ADDS] Greater Firestorm Cast - Fyrakk the Blazing",
			"9. [FIRESTORM] Firestorm Cast - Fyrakk the Blazing",
		},
		["uid"] = "mi5l6)CVPyh",
	},
	{
		["id"] = "9. [FLY AWAY] Incarnate Cast - Fyrakk the Blazing",
		["uid"] = "e7vBox(5kWF",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 3,
	},
	{
		["id"] = "9. [TANK HIT] Infernal Maw Cast - Fyrakk the Blazing",
		["uid"] = "2mrrHA3lDsr",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["id"] = "9. [BREATH + ADDS] Shadowflame Devastation Cast - Fyrakk the Blazing",
		["uid"] = "G6w6Cf5abSQ",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["id"] = "9. [RUN AWAY] Flamefall Cast - Fyrakk the Blazing",
		["uid"] = "p5HLK7TM2Bq",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["id"] = "9. [EXPLODING] Exploding Core Cast - Fyrakk the Blazing (add)",
		["uid"] = "lcegOgIT0kW",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["id"] = "9. [CAGES] Shadow Cage Cast - Fyrakk the Blazing (add)",
		["uid"] = "HymiwHBKHDH",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 3,
	},
	{
		["id"] = "9. [CAGE BREAK] Molten Eruption Cast - Fyrakk the Blazing (add)",
		["uid"] = "A2Zv0TRGBtS",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 3,
	},
	{
		["id"] = "9. [BREATH] Deep Breath - Fyrakk the Blazing",
		["uid"] = "jild1wRCxJI",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["id"] = "9. [BREATH] Shadowflame Breath Cast - Fyrakk the Blazing",
		["uid"] = "GHWlL74f7M9",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["id"] = "9. ABSORB Corrupt - Fyrakk the Blazing",
		["uid"] = "dUIR6eQxfMa",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 12,
	},
	{
		["id"] = "9. CAST Corrupt - Fyrakk the Blazing",
		["uid"] = "wzWJ)l70xMM",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 3,
	},
	{
		["id"] = "9. [FIREBALL] Fyr'alath's Flame Cast - Fyrakk the Blazing (add?)",
		["uid"] = "ZpTMfyszxda",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["id"] = "9. [FRONTAL] Fyr'alath's Bite Cast - Fyrakk the Blazing",
		["uid"] = "P5iaCi9GtCQ",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["id"] = "9. [RIFT INC] Dream Rend Cast - Fyrakk the Blazing",
		["uid"] = "C3eV7q7E3SR",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["id"] = "9. [WILDFIRE] Wildfire Cast - Fyrakk the Blazing",
		["uid"] = "0jRH5YLpK2S",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["id"] = "9. [SOAK] Darkflame Cleave Incoming - Fyrakk the Blazing",
		["uid"] = "I)mGZ3ulSGp",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 3,
	},
	{
		["id"] = "9. [SEEDS LANDING] Firestorm Landing - Fyrakk the Blazing",
		["uid"] = "ovP3qxS5Fzc",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["id"] = "9. [TORNADOES] Eternal Firestorm Landing - Fyrakk the Blazing",
		["uid"] = "fLtr7k1ahR)",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 5,
	},
	{
		["id"] = "9. [LANDING] Greater Firestorm Landing - Fyrakk the Blazing",
		["uid"] = "D7GhiFD5fU)",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 3,
	},
	{
		["id"] = "9. [LANDING] Firestorm Landing - Fyrakk the Blazing",
		["uid"] = "TQFGrAu1APz",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 3,
	},
	{
		["id"] = "9. [FIRESTORM + ADDS] Greater Firestorm Cast - Fyrakk the Blazing",
		["uid"] = "zpsnpyIxPrD",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["id"] = "9. [FIRESTORM] Firestorm Cast - Fyrakk the Blazing",
		["uid"] = "OZNngNkuKDA",
		["parent"] = "9. Bars - Fyrakk the Blazing",
		["echoVersion"] = 2,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "9. Fyrakk the Blazing",
		["id"] = "9. Icons (low) - Fyrakk the Blazing",
		["children"] = {
			"9. [SEED] Seed of Amirdrassil - Fyrakk the Blazing",
			"9. [BIG DOT] Shadowflame Eruption - Fyrakk the Blazing",
			"9. [BIG DOT] Shadowflame Devastation - Fyrakk the Blazing",
			"9. [MOVE] Shadowflame Breath - Fyrakk the Blazing",
			"9. [MOVE] Raging Flames - Fyrakk the Blazing",
			"9. [DISPEL] Aflame - Fyrakk the Blazing",
			"9. [BURN] Incinerated Debuff - Fyrakk the Blazing",
			"9. [TANK] Infernal Maw - Fyrakk the Blazing (tank)",
			"9. [200%] Darkflame Cleave Debuff - Fyrakk the Blazing",
			"9. [ABSORB] Bloom - Fyrakk the Blazing",
			"9. [STUN] Shadow Cage - Fyrakk the Blazing",
		},
		["uid"] = "AVmkHd)rOek",
	},
	{
		["id"] = "9. [SEED] Seed of Amirdrassil - Fyrakk the Blazing",
		["uid"] = "3NJixx)w1DR",
		["parent"] = "9. Icons (low) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [BIG DOT] Shadowflame Eruption - Fyrakk the Blazing",
		["uid"] = "zV1wfxBSvos",
		["parent"] = "9. Icons (low) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [BIG DOT] Shadowflame Devastation - Fyrakk the Blazing",
		["uid"] = "k7h2cKGwmwc",
		["parent"] = "9. Icons (low) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [MOVE] Shadowflame Breath - Fyrakk the Blazing",
		["uid"] = "uwxYh22W)2P",
		["parent"] = "9. Icons (low) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [MOVE] Raging Flames - Fyrakk the Blazing",
		["uid"] = "fQzE4u873fk",
		["parent"] = "9. Icons (low) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [DISPEL] Aflame - Fyrakk the Blazing",
		["uid"] = "ovlUo54ompH",
		["parent"] = "9. Icons (low) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [BURN] Incinerated Debuff - Fyrakk the Blazing",
		["uid"] = "tPtbkmvQKxg",
		["parent"] = "9. Icons (low) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [TANK] Infernal Maw - Fyrakk the Blazing (tank)",
		["uid"] = "iBYSRT1rKcf",
		["parent"] = "9. Icons (low) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [200%] Darkflame Cleave Debuff - Fyrakk the Blazing",
		["uid"] = "gP7BhDZzgvN",
		["parent"] = "9. Icons (low) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [ABSORB] Bloom - Fyrakk the Blazing",
		["uid"] = "yegFSLV4qK(",
		["parent"] = "9. Icons (low) - Fyrakk the Blazing",
		["echoVersion"] = 4,
	},
	{
		["id"] = "9. [STUN] Shadow Cage - Fyrakk the Blazing",
		["uid"] = ")2zo1vx9j(t",
		["parent"] = "9. Icons (low) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["echoVersion"] = 0,
		["parent"] = "9. Fyrakk the Blazing",
		["id"] = "9. Icons (high) - Fyrakk the Blazing",
		["children"] = {
			"9. [FIRESTORM] Eternal Firestorm - Fyrakk the Blazing",
			"9. [SEED STACKS] Corruption - Fyrakk the Blazing",
			"9. [FAIL] Exploding Core Debuff - Fyrakk the Blazing (add)",
			"9. [SHADOW] Shadowbound Debuff - Fyrakk the Blazing",
			"9. [FLAME] Flamebound Debuff - Fyrakk the Blazing",
			"9. [MARK] Fyr'alath's Mark Debuff - Fyrakk the Blazing",
			"9. [LEAP] Darkflame Cleave TARGET Debuff - Fyrakk the Blazing",
			"9. [SPREAD] Blaze Debuff - Fyrakk the Blazing",
			"9. [BIG DOT] Apocalypse Roar Debuff - Fyrakk the Blazing",
		},
		["uid"] = "kowsn2jXDsW",
	},
	{
		["id"] = "9. [FIRESTORM] Eternal Firestorm - Fyrakk the Blazing",
		["uid"] = "8cDzbwc58WL",
		["parent"] = "9. Icons (high) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [SEED STACKS] Corruption - Fyrakk the Blazing",
		["uid"] = "BEM8UJH84FI",
		["parent"] = "9. Icons (high) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [FAIL] Exploding Core Debuff - Fyrakk the Blazing (add)",
		["uid"] = "acZ5PF0Jv0Z",
		["parent"] = "9. Icons (high) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [SHADOW] Shadowbound Debuff - Fyrakk the Blazing",
		["uid"] = "k7eil19detz",
		["parent"] = "9. Icons (high) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [FLAME] Flamebound Debuff - Fyrakk the Blazing",
		["uid"] = "yOAmdqnyW8D",
		["parent"] = "9. Icons (high) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [MARK] Fyr'alath's Mark Debuff - Fyrakk the Blazing",
		["uid"] = "PkeXB09VEPQ",
		["parent"] = "9. Icons (high) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [LEAP] Darkflame Cleave TARGET Debuff - Fyrakk the Blazing",
		["uid"] = "8FqBsaHqfRk",
		["parent"] = "9. Icons (high) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [SPREAD] Blaze Debuff - Fyrakk the Blazing",
		["uid"] = "X2wWFKHSlRm",
		["parent"] = "9. Icons (high) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
	{
		["id"] = "9. [BIG DOT] Apocalypse Roar Debuff - Fyrakk the Blazing",
		["uid"] = "H0kw8khpxL1",
		["parent"] = "9. Icons (high) - Fyrakk the Blazing",
		["echoVersion"] = 1,
	},
},1207,0);

--fixUpNestedPreview(9,1207,"9. Fyrakk the Blazing");