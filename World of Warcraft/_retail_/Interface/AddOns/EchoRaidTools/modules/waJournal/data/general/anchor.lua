local _AddonName, _EchoRaidTools = ...;

local journal = _EchoRaidTools:GetModule("waJournal");

-- Anchors. export data

journal:AddImportData({["Icon - Low Priority - Anchor"] = {["parent"] = "Aura Type Anchors",["preferToUpdate"] = false,["yOffset"] = 254.00048828125,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "unit",["use_alwaystrue"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["event"] = "Conditions",["names"] = {},["spellIds"] = {},["use_absorbHealMode"] = true,["use_unit"] = true,["subeventPrefix"] = "SPELL",["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 65,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["rotation"] = 0,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text"] = "ICON\\nLOW",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "BOTTOM",["text_visible"] = true,["text_fontSize"] = 8,["anchorXOffset"] = 0,["text_text_format_n_format"] = "none",},},["height"] = 30,["rotate"] = false,["load"] = {["use_encounterid"] = true,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "1",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["source"] = "import",["mirror"] = false,["regionType"] = "texture",["blendMode"] = "BLEND",["texture"] = "Interface\\AddOns\\!!!EchoInternal\\assets\\textures\\Journal\\ELp1",["color"] = {1,1,1,1,},["tocversion"] = 100100,["id"] = "Icon - Low Priority - Anchor",["alpha"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["width"] = 30,["config"] = {},["xOffset"] = -235.99975585938,["uid"] = "lzZOWDf5hLO",["authorOptions"] = {},["conditions"] = {},["information"] = {},["selfPoint"] = "CENTER",},["Texts - Anchor"] = {["parent"] = "Aura Type Anchors",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "unit",["use_alwaystrue"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["event"] = "Conditions",["names"] = {},["spellIds"] = {},["use_absorbHealMode"] = true,["use_unit"] = true,["subeventPrefix"] = "SPELL",["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 65,["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["rotation"] = 0,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text"] = "TEXTS",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "BOTTOM",["text_visible"] = true,["text_fontSize"] = 8,["anchorXOffset"] = 0,["text_text_format_n_format"] = "none",},},["height"] = 30,["rotate"] = false,["load"] = {["use_encounterid"] = true,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "1",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["source"] = "import",["mirror"] = false,["regionType"] = "texture",["blendMode"] = "BLEND",["texture"] = "Interface\\AddOns\\!!!EchoInternal\\assets\\textures\\Journal\\ELp1",["authorOptions"] = {},["tocversion"] = 100100,["id"] = "Texts - Anchor",["frameStrata"] = 1,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["width"] = 30,["config"] = {},["color"] = {1,1,1,1,},["uid"] = "qhthXBnCTC9",["xOffset"] = 0,["conditions"] = {},["information"] = {},["selfPoint"] = "CENTER",},["Icon - High Priority - Anchor"] = {["parent"] = "Aura Type Anchors",["preferToUpdate"] = false,["yOffset"] = 194.00036621094,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "unit",["use_alwaystrue"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["event"] = "Conditions",["subeventPrefix"] = "SPELL",["spellIds"] = {},["use_absorbHealMode"] = true,["use_unit"] = true,["names"] = {},["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 65,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["desaturate"] = false,["rotation"] = 0,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text"] = "ICON\\nHIGH",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "BOTTOM",["text_visible"] = true,["text_fontSize"] = 8,["anchorXOffset"] = 0,["text_text_format_n_format"] = "none",},},["height"] = 30,["rotate"] = false,["load"] = {["use_encounterid"] = true,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "1",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["source"] = "import",["mirror"] = false,["regionType"] = "texture",["blendMode"] = "BLEND",["texture"] = "Interface\\AddOns\\!!!EchoInternal\\assets\\textures\\Journal\\ELp1",["color"] = {1,1,1,1,},["tocversion"] = 100100,["id"] = "Icon - High Priority - Anchor",["frameStrata"] = 1,["alpha"] = 1,["anchorFrameType"] = "SCREEN",["width"] = 30,["config"] = {},["xOffset"] = -234.99969482422,["uid"] = "rETru1A21gL",["authorOptions"] = {},["conditions"] = {},["information"] = {},["selfPoint"] = "CENTER",},["Aura Type Anchors"] = {["controlledChildren"] = {"Icon - High Priority - Anchor","Icon - Low Priority - Anchor","Bars - Anchor","Texts - Anchor","Scripe Lists - Anchor",},["borderBackdrop"] = "Blizzard Tooltip",["parent"] = "!Echo - Aberrus",["preferToUpdate"] = false,["yOffset"] = 0,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["borderColor"] = {0,0,0,1,},["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {{["trigger"] = {["debuffType"] = "HELPFUL",["type"] = "aura2",["spellIds"] = {},["subeventSuffix"] = "_CAST_START",["names"] = {},["unit"] = "player",["event"] = "Health",["subeventPrefix"] = "SPELL",},["untrigger"] = {},},},["internalVersion"] = 65,["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},["subRegions"] = {},["load"] = {["size"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["class"] = {["multi"] = {},},["talent"] = {["multi"] = {},},},["backdropColor"] = {1,1,1,0.5,},["source"] = "import",["scale"] = 1,["border"] = false,["borderEdge"] = "Square Full White",["regionType"] = "group",["borderSize"] = 2,["borderOffset"] = 4,["tocversion"] = 100100,["id"] = "Aura Type Anchors",["xOffset"] = 0,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["borderInset"] = 1,["config"] = {},["groupIcon"] = 1686581,["authorOptions"] = {},["uid"] = "seGpl(xYVhP",["conditions"] = {},["information"] = {},["selfPoint"] = "CENTER",},["Scripe Lists - Anchor"] = {["xOffset"] = -820.99998474121,["preferToUpdate"] = false,["yOffset"] = 431.00024414062,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["finish"] = {},["init"] = {},},["triggers"] = {[1] = {["trigger"] = {["customVariables"] = "{showScripe = \"bool\"}",["type"] = "unit",["use_absorbHealMode"] = true,["custom_type"] = "stateupdate",["names"] = {},["use_absorbMode"] = true,["event"] = "Conditions",["unit"] = "player",["use_unit"] = true,["subeventSuffix"] = "_CAST_START",["spellIds"] = {},["events"] = "OPTIONS STATUS",["check"] = "event",["subeventPrefix"] = "SPELL",["use_alwaystrue"] = false,["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 65,["selfPoint"] = "CENTER",["desaturate"] = false,["rotation"] = 0,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text"] = "SCRIPE\\nGROUP",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "BOTTOM",["text_visible"] = true,["text_fontSize"] = 8,["anchorXOffset"] = 0,["text_text_format_n_format"] = "none",},},["height"] = 30,["rotate"] = false,["load"] = {["size"] = {["multi"] = {},},["talent"] = {["multi"] = {},},["class"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "1",["use_encounterid"] = true,},["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["source"] = "import",["mirror"] = false,["regionType"] = "texture",["blendMode"] = "BLEND",["texture"] = "Interface\\AddOns\\!!!EchoInternal\\assets\\textures\\Journal\\ELp1",["authorOptions"] = {},["tocversion"] = 100100,["id"] = "Scripe Lists - Anchor",["alpha"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["width"] = 30,["uid"] = "uCwrX0XG8iA",["color"] = {1,1,1,1,},["config"] = {},["parent"] = "Aura Type Anchors",["conditions"] = {},["information"] = {["forceEvents"] = true,},["animation"] = {["start"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["easeStrength"] = 3,["type"] = "none",["duration_type"] = "seconds",["easeType"] = "none",},},},["Bars - Anchor"] = {["parent"] = "Aura Type Anchors",["preferToUpdate"] = false,["yOffset"] = 184.00030517578,["anchorPoint"] = "CENTER",["echoVersion"] = 1,["url"] = "https://echoesports.gg",["actions"] = {["start"] = {},["init"] = {},["finish"] = {},},["triggers"] = {[1] = {["trigger"] = {["type"] = "unit",["use_alwaystrue"] = false,["subeventSuffix"] = "_CAST_START",["use_absorbMode"] = true,["event"] = "Conditions",["subeventPrefix"] = "SPELL",["spellIds"] = {},["use_absorbHealMode"] = true,["use_unit"] = true,["names"] = {},["unit"] = "player",["debuffType"] = "HELPFUL",},["untrigger"] = {},},["activeTriggerMode"] = -10,},["internalVersion"] = 65,["selfPoint"] = "CENTER",["desaturate"] = false,["rotation"] = 0,["subRegions"] = {{["type"] = "subbackground",},{["text_shadowXOffset"] = 1,["text_text"] = "BARS",["text_shadowColor"] = {0,0,0,1,},["text_selfPoint"] = "AUTO",["text_automaticWidth"] = "Auto",["text_fixedWidth"] = 64,["anchorYOffset"] = 0,["text_justify"] = "CENTER",["rotateText"] = "NONE",["type"] = "subtext",["text_color"] = {1,1,1,1,},["text_font"] = "Friz Quadrata TT",["text_shadowYOffset"] = -1,["text_wordWrap"] = "WordWrap",["text_fontType"] = "None",["text_anchorPoint"] = "BOTTOM",["text_visible"] = true,["text_fontSize"] = 8,["anchorXOffset"] = 0,["text_text_format_n_format"] = "none",},},["height"] = 30,["rotate"] = false,["load"] = {["use_encounterid"] = true,["talent"] = {["multi"] = {},},["spec"] = {["multi"] = {},},["encounterid"] = "1",["class"] = {["multi"] = {},},["size"] = {["multi"] = {},},},["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",["source"] = "import",["mirror"] = false,["regionType"] = "texture",["blendMode"] = "BLEND",["texture"] = "Interface\\AddOns\\!!!EchoInternal\\assets\\textures\\Journal\\ELp1",["xOffset"] = -68.999633789062,["tocversion"] = 100100,["id"] = "Bars - Anchor",["alpha"] = 1,["frameStrata"] = 1,["anchorFrameType"] = "SCREEN",["width"] = 30,["config"] = {},["authorOptions"] = {},["uid"] = "hFH2h6YtTMW",["color"] = {1,1,1,1,},["conditions"] = {},["information"] = {},["animation"] = {["start"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["main"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},["finish"] = {["type"] = "none",["easeStrength"] = 3,["duration_type"] = "seconds",["easeType"] = "none",},},},});


-- Anchors. manifest data

journal:AddManifestData({
	{
		["echoVersion"] = 1,
		["parent"] = "!Echo - Aberrus",
		["id"] = "Aura Type Anchors",
		["children"] = {
			"Scripe Lists - Anchor",
			"Texts - Anchor",
			"Bars - Anchor",
			"Icon - Low Priority - Anchor",
			"Icon - High Priority - Anchor",
		},
		["uid"] = "seGpl(xYVhP",
	},
	{
		["id"] = "Scripe Lists - Anchor",
		["uid"] = "uCwrX0XG8iA",
		["parent"] = "Aura Type Anchors",
		["echoVersion"] = 1,
	},
	{
		["id"] = "Texts - Anchor",
		["uid"] = "qhthXBnCTC9",
		["parent"] = "Aura Type Anchors",
		["echoVersion"] = 1,
	},
	{
		["id"] = "Bars - Anchor",
		["uid"] = "hFH2h6YtTMW",
		["parent"] = "Aura Type Anchors",
		["echoVersion"] = 1,
	},
	{
		["id"] = "Icon - Low Priority - Anchor",
		["uid"] = "lzZOWDf5hLO",
		["parent"] = "Aura Type Anchors",
		["echoVersion"] = 1,
	},
	{
		["id"] = "Icon - High Priority - Anchor",
		["uid"] = "rETru1A21gL",
		["parent"] = "Aura Type Anchors",
		["echoVersion"] = 1,
	},
},1208,0);


