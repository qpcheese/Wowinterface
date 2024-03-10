
WeakAurasSaved = {
	["dynamicIconCache"] = {
	},
	["editor_tab_spaces"] = 4,
	["displays"] = {
		["Brain Freeze Deez"] = {
			["wagoID"] = "6zWQm2OA8",
			["parent"] = "WotLK Mage Pack (Tri-Spec) by Esquire",
			["preferToUpdate"] = false,
			["yOffset"] = 98.015441894531,
			["anchorPoint"] = "CENTER",
			["url"] = "https://wago.io/6zWQm2OA8/1",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["auranames"] = {
							"Fireball!", -- [1]
						},
						["event"] = "Health",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["useName"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 70,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "custom",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["version"] = 1,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 200,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\BRAIN_FREEZE.BLP",
			["alpha"] = 0.5,
			["xOffset"] = -1.7141723632813,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "Brain Freeze Deez",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["width"] = 369,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["uid"] = "RlftTnlVETD",
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Luxthos - Experience Group"] = {
			["controlledChildren"] = {
				"Experience Bar - Luxthos", -- [1]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "3GaU4Ttxj",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = -539.3334350585938,
			["anchorPoint"] = "TOP",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "https://wago.io/LuxthosExperienceBar/41",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["names"] = {
						},
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 70,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desc"] = "Created by Luxthos & Daemoos\nwww.twitch.tv/luxthos",
			["version"] = 41,
			["subRegions"] = {
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["anchorFrameFrame"] = "UIParent",
			["regionType"] = "group",
			["borderSize"] = 2,
			["anchorFrameParent"] = false,
			["config"] = {
			},
			["selfPoint"] = "BOTTOMLEFT",
			["borderOffset"] = 4,
			["semver"] = "3.1.0",
			["tocversion"] = 100200,
			["id"] = "Luxthos - Experience Group",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["borderInset"] = 1,
			["uid"] = "71NVVv0hq7p",
			["xOffset"] = 478.8148193359375,
			["borderEdge"] = "Square Full White",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["groupOffset"] = true,
			},
			["groupIcon"] = "132996",
		},
		["Spellsteal"] = {
			["iconSource"] = -1,
			["wagoID"] = "6zWQm2OA8",
			["parent"] = "WotLK Mage Pack (Tri-Spec) by Esquire",
			["preferToUpdate"] = false,
			["yOffset"] = -72.951263427734,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "https://wago.io/6zWQm2OA8/1",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["autoclone"] = false,
						["useGroup_count"] = false,
						["subeventPrefix"] = "SPELL",
						["use_tooltip"] = false,
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["event"] = "Health",
						["unit"] = "target",
						["name"] = "*",
						["use_stealable"] = true,
						["spellIds"] = {
						},
						["custom_hide"] = "timed",
						["showOn"] = "showOnActive",
						["combineMatches"] = "showLowest",
						["name_operator"] = "match('%s')",
						["fullscan"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 70,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 1,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_n_format"] = "none",
					["text_text_format_s_format"] = "none",
					["text_text"] = "%n",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "PT Sans Narrow",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "THICKOUTLINE",
					["text_anchorPoint"] = "OUTER_TOP",
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 20,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [2]
			},
			["height"] = 60,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						[2] = true,
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["race"] = {
					["multi"] = {
					},
				},
				["spellknown"] = 30449,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["cooldownTextDisabled"] = false,
			["config"] = {
			},
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["cooldown"] = false,
			["conditions"] = {
			},
			["cooldownEdge"] = false,
			["alpha"] = 1,
			["width"] = 60,
			["useCooldownModRate"] = true,
			["zoom"] = 0,
			["auto"] = true,
			["tocversion"] = 30400,
			["id"] = "Spellsteal",
			["actions"] = {
				["start"] = {
					["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\sonar.ogg",
					["do_sound"] = true,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["frameStrata"] = 5,
			["anchorFrameType"] = "SCREEN",
			["semver"] = "1.0.0",
			["uid"] = "rHLrcjUfyY8",
			["inverse"] = false,
			["xOffset"] = 406.09564208984,
			["displayIcon"] = 135729,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "grow",
				},
			},
		},
		["Hot Streak Left"] = {
			["wagoID"] = "6zWQm2OA8",
			["parent"] = "WotLK Mage Pack (Tri-Spec) by Esquire",
			["preferToUpdate"] = false,
			["yOffset"] = -40.649291992188,
			["anchorPoint"] = "CENTER",
			["url"] = "https://wago.io/6zWQm2OA8/1",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["auranames"] = {
							"Hot Streak", -- [1]
						},
						["event"] = "Health",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["useName"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 70,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["version"] = 1,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 382,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Hot_Streak.blp",
			["alpha"] = 0.55,
			["xOffset"] = -134.00006103516,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "Hot Streak Left",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["width"] = 200,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["uid"] = "zl5Xe8fvfUQ",
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Manabar"] = {
			["sparkWidth"] = 10,
			["sparkOffsetX"] = 0,
			["xOffset"] = 0.0001322428385416297,
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "TOP",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Power",
						["use_unit"] = true,
						["use_showCost"] = true,
						["powertype"] = 0,
						["spellIds"] = {
						},
						["unit"] = "player",
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["use_powertype"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["anchorFrameParent"] = false,
			["selfPoint"] = "BOTTOM",
			["text"] = false,
			["barColor"] = {
				0.1803921610116959, -- [1]
				0.3411764800548554, -- [2]
				0.9921569228172302, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["gradientOrientation"] = "HORIZONTAL",
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["border_offset"] = 1,
					["border_anchor"] = "bar",
					["border_size"] = 1,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "1 Pixel",
					["type"] = "subborder",
				}, -- [3]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%1.percentpower%%",
					["text_text_format_p_format"] = "timed",
					["anchorYOffset"] = 0,
					["text_selfPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_1.percentpower_decimal_precision"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_color"] = {
						0.9647059440612793, -- [1]
						1, -- [2]
						0.9843137860298157, -- [3]
						1, -- [4]
					},
					["text_font"] = "Bebas Neue Cyrillic Regular",
					["text_text_format_1.percentpower_round_type"] = "floor",
					["text_shadowYOffset"] = -1,
					["text_text_format_1.percentpower_format"] = "Number",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "CENTER",
					["text_fontType"] = "None",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 17,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [4]
			},
			["height"] = 20.9111442565918,
			["icon"] = false,
			["load"] = {
				["use_namerealm"] = true,
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 62,
					["multi"] = {
						[62] = true,
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["use_dragonriding"] = false,
				["use_vehicleUi"] = false,
				["use_never"] = false,
				["class"] = {
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["internalVersion"] = 70,
			["source"] = "import",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["uid"] = "cnmF7sQVhN4",
			["config"] = {
			},
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["anchorFrameFrame"] = "Five Second Rule Statusbar",
			["anchorFrameType"] = "SELECTFRAME",
			["icon_side"] = "RIGHT",
			["alpha"] = 1,
			["sparkHeight"] = 30,
			["texture"] = "ToxiUI Tx Left",
			["id"] = "Manabar",
			["zoom"] = 0,
			["spark"] = false,
			["tocversion"] = 100205,
			["sparkHidden"] = "NEVER",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["frameStrata"] = 2,
			["width"] = 251.8965606689453,
			["authorOptions"] = {
			},
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["information"] = {
			},
			["iconSource"] = -1,
		},
		["FoF Left"] = {
			["wagoID"] = "6zWQm2OA8",
			["parent"] = "WotLK Mage Pack (Tri-Spec) by Esquire",
			["preferToUpdate"] = false,
			["yOffset"] = -36.5732421875,
			["anchorPoint"] = "CENTER",
			["url"] = "https://wago.io/6zWQm2OA8/1",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["unit"] = "player",
						["names"] = {
						},
						["auranames"] = {
							"Fingers of Frost", -- [1]
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["useExactSpellId"] = false,
						["useName"] = true,
						["auraspellids"] = {
							"44545", -- [1]
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 70,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["version"] = 1,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 365,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\FROZEN_FINGERS.BLP",
			["alpha"] = 0.4,
			["xOffset"] = -133.99993896484,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "FoF Left",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["width"] = 200,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["uid"] = "85OUWqRV3WA",
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["FoF Right"] = {
			["wagoID"] = "6zWQm2OA8",
			["parent"] = "WotLK Mage Pack (Tri-Spec) by Esquire",
			["preferToUpdate"] = false,
			["yOffset"] = -37.335144042969,
			["anchorPoint"] = "CENTER",
			["url"] = "https://wago.io/6zWQm2OA8/1",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["stacksOperator"] = ">",
						["auranames"] = {
							"Fingers of Frost", -- [1]
						},
						["event"] = "Health",
						["unit"] = "player",
						["useStacks"] = true,
						["stacks"] = "1",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["useName"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 70,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["version"] = 1,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 365,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = true,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\FROZEN_FINGERS.BLP",
			["alpha"] = 0.4,
			["xOffset"] = 134,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "FoF Right",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["width"] = 200,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["uid"] = "D1C10d(Z9UQ",
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["WotLK Mage Pack (Tri-Spec) by Esquire"] = {
			["controlledChildren"] = {
				"Deep Freeze", -- [1]
				"Hot Streak Right", -- [2]
				"Hot Streak Left", -- [3]
				"Clearcasting", -- [4]
				"Spellsteal", -- [5]
				"Missile Barrage", -- [6]
				"Brain Freeze Deez", -- [7]
				"FoF Right", -- [8]
				"FoF Left", -- [9]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "6zWQm2OA8",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "https://wago.io/6zWQm2OA8/1",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["names"] = {
						},
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 70,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["version"] = 1,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "WotLK Mage Pack (Tri-Spec) by Esquire",
			["selfPoint"] = "CENTER",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["uid"] = "0GhM8tZS5Fj",
			["config"] = {
			},
			["borderInset"] = 1,
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["frameStrata"] = 1,
		},
		["Dorovon Cast Bar"] = {
			["sparkWidth"] = 10,
			["sparkOffsetX"] = 0,
			["wagoID"] = "u6uoy2SpQ",
			["xOffset"] = 0.8152643839518229,
			["preferToUpdate"] = false,
			["customText"] = "function()\n    if not aura_env.channel_end or not aura_env.channel_duration then\n        return \"\"\n    end\n    return format(\"%.2f/%.2f\", aura_env.channel_end-GetTime(), aura_env.channel_duration)\nend",
			["yOffset"] = -230.8593228234187,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["customTextUpdate"] = "event",
			["url"] = "https://wago.io/u6uoy2SpQ/22",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["unit"] = "player",
						["names"] = {
						},
						["custom"] = "function(allstates, event, ...)\n    local cast_events = {\n        UNIT_SPELLCAST_START = true,\n        UNIT_SPELLCAST_STOP = true,\n        UNIT_SPELLCAST_DELAYED = true,\n    }\n    local channel_events = {\n        UNIT_SPELLCAST_CHANNEL_START = true,\n        UNIT_SPELLCAST_CHANNEL_STOP = true,\n        UNIT_SPELLCAST_CHANNEL_UPDATE = true,\n        UNIT_SPELLCAST_EMPOWER_START = true,\n        UNIT_SPELLCAST_EMPOWER_STOP = true,\n        UNIT_SPELLCAST_EMPOWER_UPDATE = true,\n    }\n    if cast_events[event] or channel_events[event] then\n        local unit, _, spellID = select(1, ...)\n        if aura_env.units[unit] and (not aura_env.config.am_only or spellID == 5143) then\n            local state\n            if cast_events[event] then\n                state = aura_env.update_cast(event, unit)\n            end\n            if channel_events[event] then\n                state = aura_env.update_channel(event, unit)\n            end\n            allstates[unit] = state\n            return true\n        end\n    elseif event == \"UNIT_AURA\" then\n        if IsSpellKnown(5143) then -- Arcane Missiles\n            -- Clearcasting affects the tick time of Arcane Missiles\n            local clearcasting_1 = aura_env.get_aura_stacks(263725) or 0\n            local clearcasting_2 = aura_env.get_aura_stacks(276743) or 0\n            if aura_env.clearcasting and aura_env.clearcasting > clearcasting_1 + clearcasting_2 then\n                aura_env.clearcasting_time = GetTime()\n            end\n            aura_env.clearcasting = clearcasting_1 + clearcasting_2\n        end\n    end\nend",
						["events"] = "UNIT_SPELLCAST_START, UNIT_SPELLCAST_STOP, UNIT_SPELLCAST_DELAYED, UNIT_SPELLCAST_CHANNEL_START, UNIT_SPELLCAST_CHANNEL_STOP, UNIT_SPELLCAST_CHANNEL_UPDATE, UNIT_SPELLCAST_EMPOWER_START, UNIT_SPELLCAST_EMPOWER_STOP, UNIT_SPELLCAST_EMPOWER_UPDATE, UNIT_AURA:player",
						["custom_type"] = "stateupdate",
						["check"] = "event",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["zoom"] = 0,
			["selfPoint"] = "CENTER",
			["backgroundColor"] = {
				0.21176470588235, -- [1]
				0.60392156862745, -- [2]
				0.68627450980392, -- [3]
				0.4999994635582, -- [4]
			},
			["barColor"] = {
				0.6078431372549, -- [1]
				0.49411764705882, -- [2]
				0.26666666666667, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["sparkRotationMode"] = "AUTO",
			["version"] = 22,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%n",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_shadowXOffset"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_shadowYOffset"] = -1,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_LEFT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_n_format"] = "none",
					["text_fontSize"] = 14,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [3]
				{
					["text_text_format_t_time_precision"] = 1,
					["text_text_format_t_time_legacy_floor"] = true,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["rotateText"] = "NONE",
					["text_text_format_.2t_format"] = "none",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_fontSize"] = 18,
					["anchorXOffset"] = 0,
					["text_text_format_n_format"] = "none",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_text_format_t_time_format"] = 0,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_text_format_t_format"] = "timed",
					["type"] = "subtext",
					["text_font"] = "Friz Quadrata TT",
					["text_visible"] = true,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_t_time_mod_rate"] = true,
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p / %t",
					["text_shadowXOffset"] = 1,
					["text_text_format_t_time_dynamic_threshold"] = 60,
				}, -- [4]
				{
					["tick_blend_mode"] = "ADD",
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["automatic_length"] = true,
					["tick_thickness"] = 4,
					["type"] = "subtick",
					["use_texture"] = false,
					["tick_color"] = {
						1, -- [1]
						0.3921568627451, -- [2]
						0.19607843137255, -- [3]
						1, -- [4]
					},
					["tick_placement"] = "0.5",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_yOffset"] = 0,
					["tick_visible"] = true,
					["tick_length"] = 30,
					["tick_mirror"] = false,
					["tick_placement_mode"] = "AtValue",
				}, -- [5]
				{
					["border_size"] = 2,
					["border_anchor"] = "bar",
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_offset"] = 0,
				}, -- [6]
			},
			["height"] = 25.86667251586914,
			["actions"] = {
				["start"] = {
					["custom"] = "aura_env.update_tick_colors(\"player\")",
					["do_custom"] = true,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local hasted_tick_times = {\n    -- Mage\n    [205021] = 1.0, -- Ray of Frost\n    [12051]  = 1.0, -- Evocation\n    [314791] = 1.0, -- Shifting Power (covenant)\n    [382440] = 1.0, -- Shifting Power (talent)\n    \n    -- Warlock\n    [198590] = 1.0, -- Drain Soul\n    [234153] = 1.0, -- Drain Life\n}\n\nlocal unhasted_tick_times = {\n    -- Misc\n    [339232] = 3.0, -- Soul Infusion (Castle Nathria - Sun King's Salvation)\n}\n\nlocal initial_ticks = {\n    [5143] = 0.1, -- Arcane Missiles\n}\n\naura_env.units = {\n    player = true,\n    vehicle = aura_env.config.vehicle_bar,\n}\n\nlocal blizzard_castbar = CastingBarFrame or PlayerCastingBarFrame\nif blizzard_castbar and aura_env.config.hide_blizzard_castbar then\n    blizzard_castbar:UnregisterAllEvents() -- Hide the Blizard Castbar\nend\n\nlocal tick_width = aura_env.config.tick_width / 100\n\nfunction aura_env.get_aura_stacks(spell_id)\n    if GetPlayerAuraBySpellID then\n        return select(3, GetPlayerAuraBySpellID(spell_id))\n    else\n        local info = C_UnitAuras.GetPlayerAuraBySpellID(spell_id)\n        if info then\n            return info.applications\n        end\n    end\nend\n\nlocal function clearcasting_active()\n    return aura_env.clearcasting and aura_env.clearcasting > 0 or aura_env.clearcasting_time and math.abs( GetTime() - aura_env.clearcasting_time ) < aura_env.config.cc_threshold\nend\n\nlocal custom_tick_times = {\n    -- Mage\n    [5143] = function(unit) -- Arcane Missiles\n        return (clearcasting_active() and 0.2875 or 0.625) / (1 + UnitSpellHaste(unit) / 100)\n    end,\n    \n    -- Evoker\n    [356995] = function(unit) -- Disintegrate\n        return (IsPlayerSpell(369913) and 0.8 or 1.0) / (1 + UnitSpellHaste(unit) / 100)\n    end,\n}\n\nlocal function get_tick_time(spellId, unit)\n    if custom_tick_times[spellId] then\n        return custom_tick_times[spellId](unit)\n    end\n    if hasted_tick_times[spellId] then\n        return hasted_tick_times[spellId] / (1 + UnitSpellHaste(unit) / 100)\n    end\n    if unhasted_tick_times[spellId] then\n        return unhasted_tick_times[spellId]\n    end\nend\n\nlocal function arcane_missiles_duration(unit)\n    local duration = 2.5\n    if clearcasting_active() then\n        duration = 2.0\n    end\n    duration = duration / (1 + UnitSpellHaste(unit) / 100)\n    return duration\nend\n\nfunction aura_env.update_cast(event, unit)\n    local name, _, texture, startTimeMS, endTimeMS, _, _, _, spellId = UnitCastingInfo(unit)\n    if not name then\n        aura_env.casting = nil\n        return nil\n    end\n    aura_env.channeling = nil\n    aura_env.chaining = nil\n    aura_env.casting = spellId\n    local duration = (endTimeMS - startTimeMS) / 1000\n    local end_time = endTimeMS / 1000\n    return aura_env.update_bar(name, texture, duration, end_time, false, nil, unit)\nend\n\nfunction aura_env.update_channel(event, unit)\n    local name, _, texture, startTimeMS, endTimeMS, _, _, spellId, isEmpower, empowerStages = UnitChannelInfo(unit)\n    if isEmpower then\n        endTimeMS = endTimeMS + GetUnitEmpowerHoldAtMaxTime(unit)\n    end\n    if not name then\n        aura_env.channeling = nil\n        aura_env.chaining = nil\n        aura_env.prev_start = nil\n        aura_env.prev_ticks = nil\n        return nil\n    end\n    if event == \"UNIT_SPELLCAST_CHANNEL_START\" then\n        aura_env.chaining = aura_env.channeling == spellId\n        aura_env.next_tick = nil\n        if aura_env.prev_ticks and aura_env.prev_start then\n            for _, t in ipairs(aura_env.prev_ticks) do\n                if t + aura_env.prev_start > GetTime() then\n                    aura_env.next_tick = t + aura_env.prev_start\n                    break\n                end\n            end\n        end\n    end\n    aura_env.casting = nil\n    aura_env.channeling = spellId\n    local start_time = startTimeMS / 1000\n    local end_time = endTimeMS / 1000\n    local tick_time = get_tick_time(spellId, unit)\n    local first_tick = 0\n    if aura_env.chaining and aura_env.next_tick then\n        first_tick = aura_env.next_tick - start_time\n    end\n    local duration = end_time - start_time\n    if first_tick > 0 and spellId == 5143 then -- Arcane Missiles has an unusual bug that can give it extra duration beyond what UnitChannelInfo returns\n        if aura_env.config.custom_duration then\n            duration = arcane_missiles_duration(unit)\n        end\n        if event == \"UNIT_SPELLCAST_CHANNEL_START\" or aura_env.config.custom_duration then\n            duration = first_tick + ( math.ceil( first_tick / tick_time ) - 1 + math.floor( duration / tick_time + 0.5 ) ) * tick_time\n        else\n            duration = duration + ( math.ceil( first_tick / tick_time ) - 1 ) * tick_time\n        end\n    end\n    local ticks = nil\n    if isEmpower then\n        ticks = {}\n        local t = 0\n        for i = 1, empowerStages do\n            t = t + GetUnitEmpowerStageDuration(unit, i - 1) / 1000\n            ticks[i] = t\n        end\n    elseif tick_time then\n        local t = first_tick\n        ticks = {}\n        local tick_zero = initial_ticks[spellId]\n        if tick_zero then\n            ticks[1] = tick_zero\n        end\n        if t > 0 then\n            ticks[#ticks+1] = t\n        end\n        while t < duration do\n            t = t + tick_time\n            if t > duration then\n                t = duration\n            end\n            ticks[#ticks + 1] = t\n        end\n    end\n    aura_env.prev_ticks = ticks\n    aura_env.prev_start = start_time\n    return aura_env.update_bar(name, texture, duration, start_time + duration, not isEmpower, ticks, unit)\nend\n\nfunction aura_env.update_bar(name, icon, duration, end_time, channel, ticks, unit)\n    local tick_positions = {}\n    if ticks then\n        for _, t in ipairs(ticks) do\n            tick_positions[#tick_positions + 1] = {\n                min = duration - (t - duration * tick_width),\n                max = duration - (t + duration * tick_width),\n            }\n        end\n    end\n    local state = {\n        show = true,\n        changed = true,\n        name = name,\n        icon = icon,\n        progressType = \"timed\",\n        duration = duration,\n        expirationTime = end_time,\n        autoHide = true,\n        inverse = channel,\n        orientation = channel and \"HORIZONTAL\" or \"HORIZONTAL_INVERSE\",\n        additionalProgress = tick_positions,\n    }\n    aura_env.update_tick_colors(unit)\n    return state\nend\n\nfunction aura_env.update_tick_colors(unit)\n    local region = WeakAuras.GetRegion(aura_env.id, unit)\n    if not region then\n        return\n    end\n    local ticks = region.bar.additionalBars\n    if ticks then        \n        for i, _ in ipairs(ticks) do\n            region.bar:SetAdditionalBarColor(i, aura_env.config.tick_color)\n        end\n    end\nend",
					["do_custom"] = true,
				},
			},
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["easeType"] = "none",
					["scaley"] = 1,
					["alpha"] = 0,
					["use_color"] = false,
					["y"] = 0,
					["x"] = 0,
					["colorType"] = "custom",
					["rotate"] = 0,
					["colorFunc"] = "",
					["easeStrength"] = 3,
					["scalex"] = 1,
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["source"] = "import",
			["authorOptions"] = {
				{
					["useName"] = true,
					["type"] = "header",
					["text"] = "General Settings",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [1]
				{
					["type"] = "color",
					["default"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["key"] = "tick_color",
					["name"] = "Tick Color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [2]
				{
					["softMin"] = 0.1,
					["type"] = "range",
					["bigStep"] = 0.1,
					["max"] = 100,
					["step"] = 0.01,
					["width"] = 1,
					["min"] = 0,
					["key"] = "tick_width",
					["default"] = 0.3,
					["softMax"] = 1,
					["name"] = "Tick width",
					["useDesc"] = true,
					["desc"] = "How wide should the ticks be as a percentage of the full bar?",
				}, -- [3]
				{
					["type"] = "toggle",
					["default"] = true,
					["width"] = 1,
					["name"] = "Hide Blizzard Cast Bar",
					["useDesc"] = true,
					["key"] = "hide_blizzard_castbar",
					["desc"] = "Disables the Blizzard cast bar completely. When disabling this option, you must reload for the Blizzard cast bar to appear again.",
				}, -- [4]
				{
					["type"] = "toggle",
					["default"] = true,
					["width"] = 1,
					["name"] = "Enable Vehicle Cast Bar",
					["useDesc"] = true,
					["key"] = "vehicle_bar",
					["desc"] = "Also displays a basic replacement for the vehicle unit cast bar, since in 10.0 Blizzard no longer displays a separate cast bar for that.",
				}, -- [5]
				{
					["useName"] = true,
					["type"] = "header",
					["text"] = "Arcane Missiles",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [6]
				{
					["type"] = "toggle",
					["default"] = true,
					["width"] = 2,
					["name"] = "Fully custom Arcane Missiles duration calculation",
					["useDesc"] = true,
					["key"] = "custom_duration",
					["desc"] = "Ignores everything except for the start time of UnitChannelInfo and instead fully calculates what the duration should be.",
				}, -- [7]
				{
					["type"] = "toggle",
					["default"] = false,
					["width"] = 2,
					["name"] = "Only show for Arcane Missiles",
					["useDesc"] = true,
					["key"] = "am_only",
					["desc"] = "Only display the bar when Arcane Missiles is being channeled.",
				}, -- [8]
				{
					["softMin"] = 0,
					["type"] = "range",
					["bigStep"] = 0.05,
					["max"] = 10,
					["step"] = 0.01,
					["width"] = 1,
					["min"] = 0,
					["key"] = "cc_threshold",
					["default"] = 0.2,
					["softMax"] = 1,
					["name"] = "Clearcasting Threshold",
					["useDesc"] = true,
					["desc"] = "How many seconds after Clearcasting expires should the bar be adjusted for Arcane Missiles to assume a Clearcasting cast? If Clearacsting is not being detected for your casts, increase this. If it is being falsely detected, decrease this.",
				}, -- [9]
			},
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkOffsetY"] = 0,
			["anchorFrameType"] = "SCREEN",
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["alpha"] = 1,
			["uid"] = "x)gzubypn4F",
			["icon_side"] = "LEFT",
			["sparkHidden"] = "NEVER",
			["sparkHeight"] = 30,
			["texture"] = "Solid",
			["semver"] = "1.0.21",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = true,
			["tocversion"] = 100205,
			["id"] = "Dorovon Cast Bar",
			["spark"] = false,
			["frameStrata"] = 1,
			["width"] = 456.830078125,
			["gradientOrientation"] = "HORIZONTAL",
			["config"] = {
				["vehicle_bar"] = true,
				["cc_threshold"] = 0.2,
				["hide_blizzard_castbar"] = true,
				["am_only"] = false,
				["custom_duration"] = true,
				["tick_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["tick_width"] = 0.3,
			},
			["inverse"] = true,
			["internalVersion"] = 70,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = -1,
						["variable"] = "customcheck",
						["value"] = "function()\n    local start, duration = GetSpellCooldown(190319)\n    local spells = {\n        [2948] = true, -- Scorch\n        [133] = true, -- Fireball\n        [2120] = true, -- Flamestrike\n        [11366] = true, -- Pyroblast\n    }\n    return not aura_env.casting or not spells[aura_env.casting] or start + duration - GetTime() > 5\nend",
					},
					["changes"] = {
						{
							["property"] = "sub.5.tick_visible",
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["iconSource"] = -1,
		},
		["Deep Freeze"] = {
			["iconSource"] = 0,
			["wagoID"] = "6zWQm2OA8",
			["parent"] = "WotLK Mage Pack (Tri-Spec) by Esquire",
			["preferToUpdate"] = false,
			["yOffset"] = 113.16491699219,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "https://wago.io/6zWQm2OA8/1",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["classification"] = {
						},
						["use_hostility"] = false,
						["custom_type"] = "event",
						["subeventSuffix"] = "_CAST_START",
						["hostility"] = "hostile",
						["event"] = "Unit Characteristics",
						["use_unit"] = true,
						["names"] = {
						},
						["use_unitisunit"] = false,
						["spellIds"] = {
						},
						["type"] = "unit",
						["unit"] = "target",
						["subeventPrefix"] = "SPELL",
						["use_attackable"] = true,
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "aura2",
						["auranames"] = {
							"Fingers of Frost", -- [1]
						},
						["event"] = "Health",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["useName"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["type"] = "aura2",
						["use_debuffClass"] = false,
						["auranames"] = {
							"Frost Nova", -- [1]
							"Frostbite", -- [2]
							"Freeze", -- [3]
						},
						["debuffType"] = "HARMFUL",
						["useName"] = true,
						["unit"] = "target",
					},
					["untrigger"] = {
					},
				}, -- [3]
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "unit",
						["health"] = {
							"0", -- [1]
						},
						["health_operator"] = {
							">", -- [1]
						},
						["use_health"] = true,
						["unit"] = "target",
						["event"] = "Health",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [4]
				{
					["trigger"] = {
						["type"] = "spell",
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["realSpellName"] = 44572,
						["use_spellName"] = true,
						["debuffType"] = "HELPFUL",
						["use_exact_spellName"] = true,
						["event"] = "Action Usable",
						["duration"] = "30",
						["use_track"] = true,
						["spellName"] = 44572,
					},
					["untrigger"] = {
					},
				}, -- [5]
				["disjunctive"] = "custom",
				["customTriggerLogic"] = "function(trigger) return trigger[1] and trigger[4] and trigger[5] and (trigger[2] or trigger[3]); end",
				["activeTriggerMode"] = -10,
			},
			["useTooltip"] = false,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 1,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowDuration"] = 1,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glowXOffset"] = 0,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glow"] = false,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [2]
			},
			["height"] = 64,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["alpha"] = 1,
			["config"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 70,
			["regionType"] = "icon",
			["cooldown"] = false,
			["conditions"] = {
			},
			["authorOptions"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["anchorFrameType"] = "SCREEN",
			["useCooldownModRate"] = true,
			["zoom"] = 0,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "Deep Freeze",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 1,
			["width"] = 64,
			["selfPoint"] = "CENTER",
			["uid"] = "F(0w6q50z4A",
			["inverse"] = false,
			["cooldownEdge"] = false,
			["displayIcon"] = "236214",
			["information"] = {
				["forceEvents"] = true,
			},
			["xOffset"] = 202.59527587891,
		},
		["Experience Bar - Luxthos"] = {
			["sparkWidth"] = 10,
			["iconSource"] = 0,
			["xOffset"] = 18.57785288492839,
			["preferToUpdate"] = false,
			["yOffset"] = -3.792592592592593,
			["anchorPoint"] = "BOTTOM",
			["sparkRotation"] = 0,
			["url"] = "https://wago.io/LuxthosExperienceBar/41",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = true,
			["selfPoint"] = "TOP",
			["barColor"] = {
				0.33725491166115, -- [1]
				0.38823533058166, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["load"] = {
				["use_petbattle"] = false,
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["level_operator"] = {
					"<", -- [1]
				},
				["zoneIds"] = "",
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["level"] = {
					"80", -- [1]
				},
				["use_never"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["smoothProgress"] = true,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["overlayclip"] = true,
			["texture"] = "Solid",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["spark"] = false,
			["tocversion"] = 100200,
			["alpha"] = 1,
			["uid"] = "UpaCp8I(Gtg",
			["displayIcon"] = 894556,
			["sparkOffsetX"] = 0,
			["wagoID"] = "3GaU4Ttxj",
			["parent"] = "Luxthos - Experience Group",
			["customText"] = "function()\n    local t = aura_env.customTexts\n    \n    return t.c1, t.c2, t.c3, t.c4, t.c5, t.c6, t.c7\nend",
			["sparkRotationMode"] = "AUTO",
			["triggers"] = {
				{
					["trigger"] = {
						["duration"] = "1",
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "",
						["unit"] = "player",
						["customOverlay1"] = "",
						["use_genericShowOn"] = true,
						["debuffType"] = "HELPFUL",
						["spellIds"] = {
						},
						["custom_hide"] = "custom",
						["events"] = "LWA_EXPERIENCE_UPDATE",
						["type"] = "custom",
						["use_spellName"] = true,
						["custom_type"] = "stateupdate",
						["realSpellName"] = 0,
						["unevent"] = "timed",
						["event"] = "Combat Log",
						["spellName"] = {
							0, -- [1]
						},
						["customDuration"] = "",
						["customName"] = "",
						["custom"] = "function(allstates, event, ...)\n    local cfg = aura_env.config\n    local show = cfg[\"showmaxlevel\"] or not aura_env.isPlayerMaxLevel\n    \n    allstates[\"\"] = allstates[\"\"] or { show = false }\n    \n    if show then\n        local WAS = aura_env.GetSavedVars()\n        local level = aura_env.level or UnitLevel(\"player\")\n        local totalTime = WAS.session.realTotalTime or 0\n        local levelTime = WAS.session.realLevelTime or 0\n        local currentTime = time()\n        local sessionTime = 0\n        local gainedXP = WAS.session.gainedXP or 0\n        local coeff, hourlyXP, timeToLevel = 0, 0, 0\n        \n        local currentXP = UnitXP(\"player\") or 0\n        local totalXP = UnitXPMax(\"player\") or 0\n        local remainingXP = totalXP - currentXP\n        local restedXP = GetXPExhaustion() or 0\n        local questXP = aura_env.questXP or 0\n        local completeXP = aura_env.completeXP or 0\n        local incompleteXP = aura_env.incompleteXP or 0\n        \n        if cfg[\"leveltime-text\"] and WAS.session.lastTimePlayedRequest > 0 then\n            totalTime = currentTime - WAS.session.lastTimePlayedRequest + WAS.session.realTotalTime\n            levelTime = currentTime - WAS.session.lastTimePlayedRequest + WAS.session.realLevelTime\n        end\n        \n        if cfg[\"sessiontime-text\"] or cfg[\"showxphour-text\"] then\n            if WAS.session.startTime > 0 then\n                sessionTime = currentTime - WAS.session.startTime\n                \n                coeff = sessionTime / 3600\n                \n                if coeff > 0 and gainedXP > 0 then\n                    hourlyXP = ceil(gainedXP / coeff)\n                    timeToLevel = ceil(remainingXP / hourlyXP * 3600)\n                end\n            end\n        end\n        \n        allstates[\"\"] = {\n            show = true,\n            changed = true,\n            progressType = \"static\",\n            value = currentXP,\n            total = totalXP,\n            \n            -- Usable Variables\n            level = level,\n            currentXP = currentXP,\n            totalXP = totalXP,\n            remainingXP = remainingXP,\n            restedXP = restedXP,\n            questXP = questXP,\n            completeXP = completeXP,\n            incompleteXP = incompleteXP,\n            hourlyXP = hourlyXP,\n            timeToLevel = timeToLevel,\n            timeToLevelText = timeToLevel > 0 and aura_env.FormatTime(timeToLevel) or \"--\",\n            totalTime = totalTime,\n            totalTimeText = aura_env.FormatTime(totalTime),\n            levelTime = levelTime,\n            levelTimeText = aura_env.FormatTime(levelTime),\n            sessionTime = sessionTime,\n            sessionTimeText = aura_env.FormatTime(sessionTime),\n            percentXP = totalXP > 0 and ((currentXP / totalXP) * 100) or 0,\n            percentremaining = totalXP > 0 and ((remainingXP / totalXP) * 100) or 0,\n            percentrested = totalXP > 0 and ((restedXP / totalXP) * 100) or 0,\n            percentquest = totalXP > 0 and ((questXP / totalXP) * 100) or 0,\n            percentcomplete = totalXP > 0 and ((completeXP / totalXP) * 100) or 0,\n            percentincomplete = totalXP > 0 and ((incompleteXP / totalXP) * 100) or 0,\n            totalpercentcomplete = totalXP > 0 and (((completeXP + currentXP) / totalXP) * 100) or 0,\n            \n            additionalProgress = {\n                {\n                    -- Complete Quest XP\n                    direction = \"forward\",\n                    width = completeXP\n                },\n                {\n                    -- Incomplete Quest XP\n                    direction = \"forward\",\n                    width = aura_env.config[\"showincompletequest-bar\"] and incompleteXP or 0,\n                    offset = completeXP,\n                },\n                {\n                    -- Rested XP\n                    direction = \"forward\",\n                    width = restedXP,\n                    offset = completeXP + (aura_env.config[\"showincompletequest-bar\"] and incompleteXP or 0)\n                }\n            }\n        }\n        \n        aura_env.UpdateCustomTexts(allstates[\"\"])\n        \n        if aura_env.timerHandler then\n            aura_env.timerHandler:Cancel()\n            aura_env.timerHandler = nil\n        end\n        \n        aura_env.timerHandler = C_Timer.NewTimer(1, function()\n                WeakAuras.ScanEvents(\"LWA_EXPERIENCE_UPDATE\")\n        end)\n        \n        return true\n        \n    elseif allstates[\"\"][\"show\"] then\n        allstates[\"\"] = {\n            show = false,\n            changed = true,\n        }\n        \n        return true\n    end\nend",
						["subeventSuffix"] = "",
						["check"] = "event",
						["names"] = {
						},
						["use_track"] = true,
						["customVariables"] = "{\n    additionalProgress = 3,\n    \n    level = {\n        display = WeakAuras.L[\"Level\"],\n        type = \"number\",\n    },\n    currentXP = {\n        display = WeakAuras.L[\"Current Experience\"],\n        type = \"number\",\n    },\n    percentXP = {\n        display = WeakAuras.L[\"Experience (%)\"],\n        type = \"number\",\n    },\n    totalXP = {\n        display = WeakAuras.L[\"Total Experience\"],\n        type = \"number\",\n    },\n    remainingXP = {\n        display = WeakAuras.L[\"Remaining Experience\"],\n        type = \"number\",\n    },\n    percentremaining = {\n        display = WeakAuras.L[\"Remaining Experience (%)\"],\n        type = \"number\",\n    },\n    restedXP = {\n        display = WeakAuras.L[\"Rested Experience\"],\n        type = \"number\",\n    },\n    percentrested = {\n        display = WeakAuras.L[\"Rested Experience (%)\"],\n        type = \"number\",\n    },\n    questXP = {\n        display = WeakAuras.L[\"Quest Experience\"],\n        type = \"number\",\n    },\n    percentquest = {\n        display = WeakAuras.L[\"Quest Experience (%)\"],\n        type = \"number\",\n    },\n    completeXP = {\n        display = WeakAuras.L[\"Completed Experience\"],\n        type = \"number\",\n    },\n    percentcomplete = {\n        display = WeakAuras.L[\"Completed Experience (%)\"],\n        type = \"number\",\n    }\n}",
					},
					["untrigger"] = {
						["custom"] = "",
					},
				}, -- [1]
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "",
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["spellName"] = {
							0, -- [1]
						},
						["subeventSuffix"] = "",
						["unit"] = "player",
						["custom_type"] = "event",
						["event"] = "Combat Log",
						["custom"] = "function(event, arg1, arg2, arg3, arg4, ...)\n    local currentXP = UnitXP(\"player\")\n    local maxXP = UnitXPMax(\"player\")\n    local currentTime = time()\n    local WAS = aura_env.GetSavedVars()\n    \n    --print(event, arg1, arg2)\n    \n    if aura_env.timerHandler then\n        aura_env.timerHandler:Cancel()\n        aura_env.timerHandler = nil\n    end\n    \n    if \"PLAYER_ENTERING_WORLD\" == event then\n        if arg1 or (arg2 and aura_env.config.reset_reload) then\n            WAS.session.gainedXP = 0\n            WAS.session.lastXP = currentXP\n            WAS.session.maxXP = maxXP\n            WAS.session.startTime = currentTime\n        end\n        \n        if arg1 or arg2 then\n            WAS.session.realTotalTime = 0\n            WAS.session.realLevelTime = 0\n            WAS.session.lastTimePlayedRequest = 0\n        end\n        \n        if aura_env.config[\"leveltime-text\"] and WAS.session.lastTimePlayedRequest <= 0 then\n            aura_env.RequestTimePlayed()\n        end\n        \n    elseif \"PLAYER_LEVEL_UP\" == event then\n        aura_env.level = arg1 or aura_env.level\n        aura_env.isPlayerMaxLevel = aura_env.level >= aura_env.GetMaxLevel()\n        \n        WAS.session.realLevelTime = 0\n        WAS.session.maxXP = maxXP\n        \n        WAS.session.lastTimePlayedRequest = currentTime\n        \n    elseif \"UPDATE_EXPANSION_LEVEL\" == event or \"MAX_EXPANSION_LEVEL_UPDATED\" == event then\n        if arg3 then\n            local minExpLevel = min(arg1, arg2, arg3, arg4)\n            local maxExpLevel = max(arg1, arg2, arg3, arg4)\n        else\n            local minExpLevel = GetExpansionLevel()\n            local maxExpLevel = minExpLevel\n        end\n        \n        aura_env.isPlayerMaxLevel = aura_env.level >= aura_env.GetMaxLevel(maxExpLevel)\n        \n        if aura_env.level == GetMaxLevelForExpansionLevel(minExpLevel) or (currentTime - WAS.session.startTime >= (86400 * 3)) then\n            WAS.session.startTime = currentTime\n        end\n        \n    elseif \"QUEST_LOG_UPDATE\" == event or (\"UNIT_QUEST_LOG_CHANGED\" == event and arg1 == \"player\") then\n        aura_env.UpdateQuestXP()\n        \n    elseif \"TIME_PLAYED_MSG\" == event and arg2 then\n        WAS.session.realTotalTime = arg1\n        WAS.session.realLevelTime = arg2\n        \n        WAS.session.lastTimePlayedRequest = currentTime\n        \n        aura_env.ClearTickerRTP()\n        \n    elseif \"PLAYER_XP_UPDATE\" == event then\n        local gainedXP = currentXP - WAS.session.lastXP\n        \n        if gainedXP < 0 then\n            gainedXP = WAS.session.maxXP - WAS.session.lastXP + currentXP\n        end\n        \n        WAS.session.gainedXP = WAS.session.gainedXP + gainedXP\n        WAS.session.lastXP = currentXP\n        WAS.session.maxXP = maxXP\n        \n    elseif \"OPTIONS\" == event then\n        if aura_env.config[\"leveltime-text\"] then\n            if WAS.session.lastTimePlayedRequest <= 0 or WeakAuras.IsImporting() then\n                aura_env.RequestTimePlayed()\n            end\n        else\n            aura_env.ClearTickerRTP()\n        end\n        \n        if currentTime - WAS.session.startTime >= (86400 * 3) then\n            WAS.session.startTime = currentTime\n        end\n        \n        if StatusTrackingBarManager then\n            if aura_env.config.hide_xpbar then\n                StatusTrackingBarManager:Hide()\n                StatusTrackingBarManager.Show = nop\n            else\n                UIParent.Show(StatusTrackingBarManager)\n            end\n        end\n    end\n    \n    WeakAuras.ScanEvents(\"LWA_EXPERIENCE_UPDATE\")\n    \n    return true\nend",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["events"] = "PLAYER_ENTERING_WORLD QUEST_LOG_UPDATE UNIT_QUEST_LOG_CHANGED PLAYER_XP_UPDATE PLAYER_LEVEL_UP UPDATE_EXHAUSTION UPDATE_EXPANSION_LEVEL MAX_EXPANSION_LEVEL_UPDATED TIME_PLAYED_MSG ENABLE_XP_GAIN DISABLE_XP_GAIN",
						["unevent"] = "timed",
						["check"] = "event",
						["duration"] = "1",
						["use_track"] = true,
						["custom_hide"] = "custom",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "custom",
				["customTriggerLogic"] = "function()\n    return not IsXPUserDisabled() and (aura_env.config[\"showmaxlevel\"] or not aura_env.isPlayerMaxLevel)\nend",
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 70,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["version"] = 41,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_shadowXOffset"] = 1,
					["text_text_format_level_format"] = "none",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["type"] = "subtext",
					["text_anchorXOffset"] = 5,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Bebas Neue Cyrillic Regular",
					["text_text"] = "%c1",
					["text_shadowYOffset"] = -1,
					["text_text_format_c1_format"] = "none",
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_text_format_p_time_format"] = 0,
					["text_visible"] = true,
					["text_fontSize"] = 14,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [3]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%c2",
					["text_text_format_restedXP_format"] = "none",
					["text_text_format_completeXP_format"] = "none",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["rotateText"] = "NONE",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_currentXP_big_number_format"] = "AbbreviateLargeNumbers",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_questXP_format"] = "none",
					["text_text_format_totalXP_format"] = "none",
					["anchorXOffset"] = 0,
					["text_text_format_percentXP_round_type"] = "floor",
					["text_text_format_n_format"] = "none",
					["text_text_format_totalXP_big_number_format"] = "AbbreviateLargeNumbers",
					["text_selfPoint"] = "AUTO",
					["text_text_format_percentXP_format"] = "Number",
					["anchorYOffset"] = 0,
					["text_text_format_percentXP_decimal_precision"] = 0,
					["text_text_format_remainingXP_big_number_format"] = "AbbreviateLargeNumbers",
					["text_text_format_currentXP_round_type"] = "floor",
					["text_text_format_currentXP_decimal_precision"] = 0,
					["text_font"] = "Bebas Neue Cyrillic Regular",
					["text_justify"] = "CENTER",
					["text_text_format_totalXP_decimal_precision"] = 0,
					["type"] = "subtext",
					["text_automaticWidth"] = "Auto",
					["text_text_format_remainingXP_format"] = "none",
					["text_text_format_currentXP_format"] = "none",
					["text_anchorPoint"] = "INNER_CENTER",
					["text_text_format_c2_format"] = "none",
					["text_fontType"] = "OUTLINE",
					["text_fontSize"] = 14,
					["text_text_format_totalXP_round_type"] = "floor",
				}, -- [4]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%c3",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_percentcomplete_color"] = true,
					["text_fixedWidth"] = 64,
					["text_text_format_percentcomplete_decimal_precision"] = 0,
					["text_text_format_totalpercentcomplete_format"] = "Number",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_2.t_time_format"] = 0,
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_totalXP_format"] = "none",
					["anchorXOffset"] = 0,
					["text_text_format_percentXP_round_type"] = "floor",
					["text_text_format_n_format"] = "none",
					["text_text_format_totalpercentcomplete_round_type"] = "floor",
					["text_text_format_percentcomplete_round_type"] = "floor",
					["text_text_format_2.t_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_text_format_percentXP_format"] = "Number",
					["text_text_format_percentcomplete_format"] = "Number",
					["text_fontType"] = "OUTLINE",
					["anchorYOffset"] = 0,
					["text_text_format_percentcomplete_abbreviate_max"] = 8,
					["text_text_format_2.t_time_precision"] = 1,
					["text_text_format_percentcomplete_realm_name"] = "never",
					["text_justify"] = "CENTER",
					["text_text_format_percentXP_decimal_precision"] = 1,
					["type"] = "subtext",
					["text_anchorXOffset"] = -5,
					["text_fontSize"] = 14,
					["text_font"] = "Bebas Neue Cyrillic Regular",
					["text_text_format_percentrested_round_type"] = "floor",
					["text_text_format_totalpercentcomplete_decimal_precision"] = 1,
					["text_text_format_2.t_time_dynamic_threshold"] = 60,
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_text_format_c3_format"] = "none",
					["text_text_format_currentXP_format"] = "none",
					["text_automaticWidth"] = "Auto",
					["rotateText"] = "NONE",
					["text_text_format_percentcomplete_abbreviate"] = false,
					["text_text_format_percentrested_decimal_precision"] = 0,
					["text_text_format_percentrested_format"] = "Number",
				}, -- [5]
				{
					["type"] = "subborder",
					["border_anchor"] = "fg",
					["border_offset"] = 1,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_size"] = 2,
				}, -- [6]
				{
					["border_offset"] = 1,
					["border_anchor"] = "bar",
					["border_size"] = 2,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["type"] = "subborder",
				}, -- [7]
			},
			["height"] = 22.4125919342041,
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["source"] = "import",
			["anchorFrameFrame"] = "BT4Button6",
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["default"] = true,
					["width"] = 1,
					["name"] = "Played Time Text",
					["useDesc"] = true,
					["key"] = "leveltime-text",
					["desc"] = "Enabling this will give you the time played at this level or total at max level.",
				}, -- [1]
				{
					["type"] = "toggle",
					["default"] = true,
					["width"] = 1,
					["name"] = "Session Time Text",
					["useDesc"] = true,
					["key"] = "sessiontime-text",
					["desc"] = "Enabling this will give you the time spent in this current session.",
				}, -- [2]
				{
					["type"] = "toggle",
					["default"] = true,
					["key"] = "showxphour-text",
					["name"] = "Leveling Time & XP/Hour Text",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [3]
				{
					["type"] = "toggle",
					["default"] = true,
					["width"] = 1,
					["name"] = "Completed & Rested Text",
					["useDesc"] = true,
					["key"] = "questrested-text",
					["desc"] = "Enabling this will give you Completed and Rested text information at the bottom of the Experience Bar.",
				}, -- [4]
				{
					["type"] = "toggle",
					["default"] = false,
					["key"] = "showincompletequest-bar",
					["name"] = "Show Incomplete Quests Bar",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [5]
				{
					["type"] = "toggle",
					["default"] = false,
					["key"] = "showmaxlevel",
					["name"] = "Show Bar at Max Level",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [6]
				{
					["type"] = "toggle",
					["default"] = false,
					["key"] = "reset_reload",
					["name"] = "Reset Session Time and XP/Hour on Reload UI",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [7]
				{
					["type"] = "toggle",
					["default"] = false,
					["key"] = "hide_xpbar",
					["name"] = "Hide Default Experience Bar (Retail)",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [8]
			},
			["barColor2"] = {
				0.77647066116333, -- [1]
				0.38039219379425, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "LEFT",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon"] = false,
			["sparkHeight"] = 30,
			["actions"] = {
				["start"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
				["finish"] = {
					["hide_all_glows"] = false,
				},
				["init"] = {
					["custom"] = "local aura_env = aura_env\n\naura_env.timerHandler = aura_env.timerHandler or nil\n\naura_env.GetSavedVars = function()\n    local WAS = aura_env.saved or {}\n    aura_env.saved = WAS\n    \n    WAS.session = WAS.session or {}\n    \n    WAS.session.gainedXP = WAS.session.gainedXP or 0\n    WAS.session.lastXP = WAS.session.lastXP or UnitXP(\"player\")\n    WAS.session.maxXP = WAS.session.maxXP or UnitXPMax(\"player\")\n    WAS.session.startTime = WAS.session.startTime or time()\n    WAS.session.realTotalTime = WAS.session.realTotalTime or 0\n    WAS.session.realLevelTime = WAS.session.realLevelTime or 0\n    WAS.session.lastTimePlayedRequest = WAS.session.lastTimePlayedRequest or 0\n    \n    return WAS\nend\n\naura_env.GetMaxLevel = function(exp)\n    exp = exp or GetExpansionLevel()\n    \n    return min(GetMaxPlayerLevel(), GetMaxLevelForExpansionLevel(exp))\nend\n\naura_env.level = UnitLevel(\"player\")\naura_env.isPlayerMaxLevel = aura_env.level >= aura_env.GetMaxLevel()\n\nif not IsXPUserDisabled then\n    IsXPUserDisabled = function() return false end\nend\n\nlocal GetNumQuestLogEntries = C_QuestLog.GetNumQuestLogEntries or GetNumQuestLogEntries\nlocal GetQuestIDForLogIndex = C_QuestLog.GetQuestIDForLogIndex or function(i)\n    return select(8, GetQuestLogTitle(i))\nend\nlocal SelectQuestLogEntry = SelectQuestLogEntry or function() end\nlocal IsQuestComplete = C_QuestLog.IsComplete or IsQuestComplete\nlocal QuestReadyForTurnIn = C_QuestLog.ReadyForTurnIn or function(questID) return false end\n\naura_env.UpdateQuestXP = function()\n    local numQ = GetNumQuestLogEntries()\n    local questXP = 0\n    local completeXP = 0\n    local incompleteXP = 0\n    local questID, rewardXP\n    local selQ = 0\n    local GetQuestLogRewardXP = GetQuestLogRewardXP or function(questID)\n        return 0\n    end\n    \n    if GetQuestLogSelection then\n        selQ = GetQuestLogSelection()\n    end\n    \n    for i = 1, numQ do\n        SelectQuestLogEntry(i)\n        questID = GetQuestIDForLogIndex(i)\n        \n        if questID > 0 then\n            rewardXP = GetQuestLogRewardXP(questID) or 0\n            \n            if rewardXP > 0 then\n                questXP = questXP + rewardXP\n                \n                if IsQuestComplete(questID) or QuestReadyForTurnIn(questID) then\n                    completeXP = completeXP + rewardXP\n                else\n                    incompleteXP = incompleteXP + rewardXP\n                end\n            end\n        end\n    end\n    \n    aura_env.questXP = questXP\n    aura_env.completeXP = completeXP\n    aura_env.incompleteXP = incompleteXP\n    \n    if selQ > 0 then\n        SelectQuestLogEntry(selQ)\n        StaticPopup_Hide(\"ABANDON_QUEST\")\n        StaticPopup_Hide(\"ABANDON_QUEST_WITH_ITEMS\")\n        \n        if QuestLogControlPanel_UpdateState then\n            local SetAbandonQuest = SetAbandonQuest or function() end\n            \n            QuestLogControlPanel_UpdateState()\n            SetAbandonQuest()\n        end\n    end\nend\n\naura_env.UpdateQuestXP()\n\naura_env.round = function(num, decimals)\n    local mult = 10^(decimals or 0)\n    \n    return Round(num * mult) / mult\nend\n\naura_env.FormatTime = function(time, format)\n    if time <= 59 then\n        return \"< 1m\"\n    end\n    \n    local d, h, m, s = ChatFrame_TimeBreakDown(time)\n    local t = format or \"%dd %hh %mm\" --\"%d:%H:%M:%S\"\n    \n    \n    local pad = function(v)\n        return v < 10 and \"0\" .. v or v\n    end\n    \n    local subs = {\n        [\"%%D([Dd]?)\"] = d > 0 and (pad(d) .. \"%1\") or \"\",\n        [\"%%d([Dd]?)\"] = d > 0 and (d .. \"%1\") or \"\",\n        [\"%%H([Hh]?)\"] = (d > 0 or h > 0) and (pad(h) .. \"%1\") or \"\",\n        [\"%%h([Hh]?)\"] = (d > 0 or h > 0) and (h .. \"%1\") or \"\",\n        [\"%%M([Mm]?)\"] = pad(m) .. \"%1\",\n        [\"%%m([Mm]?)\"] = m .. \"%1\",\n        [\"%%S([Ss]?)\"] = pad(s) .. \"%1\",\n        [\"%%s([Ss]?)\"] = s .. \"%1\",\n    }\n    \n    for k,v in pairs(subs) do\n        t = t:gsub(k, v)\n    end\n    \n    -- Remove trailing spaces/zeroes/symbols\n    return strtrim(t:gsub(\"^%s*0*\", \"\"):gsub(\"^%s*[DdHhMm]\", \"\"), \" :/-|\")\nend\n\naura_env.tickerRTP = aura_env.tickerRTP or nil\naura_env.requestingTimePlayed = false\n\naura_env.ClearTickerRTP = function()\n    if aura_env.tickerRTP then\n        aura_env.tickerRTP:Cancel()\n        aura_env.tickerRTP = nil\n    end\n    \n    aura_env.requestingTimePlayed = false\nend\n\naura_env.RequestTimePlayed = function()\n    if not aura_env.requestingTimePlayed then\n        aura_env.ClearTickerRTP()\n        \n        aura_env.requestingTimePlayed = true\n        \n        aura_env.tickerRTP = C_Timer.NewTimer(0.5, function() RequestTimePlayed() end)\n    end\nend\n\naura_env.customTexts = {\n    c1 = \"Level \" .. aura_env.level,\n    c2 = \"0 / 0 (0)\",\n    c3 = \"0%\",\n    c4 = \"\",\n    c5 = \"\",\n    c6 = \"\",\n    c7 = \"\",\n}\n\naura_env.UpdateCustomTexts = function(state)\n    local c1, c2, c3, c4, c5, c6, c7\n    local s = state or aura_env.state\n    local cfg = aura_env.config\n    local round = aura_env.round\n    local isMaxLevel = aura_env.isPlayerMaxLevel\n    \n    c1 = \"Level \" .. (s.level or UnitLevel(\"player\"))\n    \n    if isMaxLevel then\n        c2 = \"Max Level\"\n    else\n        c2 = string.format(\"%s / %s (%s)\", FormatLargeNumber(s.currentXP or 0), FormatLargeNumber(s.totalXP or 0), FormatLargeNumber(s.remainingXP or 0))\n    end\n    \n    c3 = string.format(\"%s%%\" .. ((s.percentcomplete or 0) > 0 and \" (%s%%)\" or \"\"), round(s.percentXP or 0, 1), round(s.totalpercentcomplete or 0, 1))\n    \n    if not isMaxLevel then\n        if cfg[\"showxphour-text\"] then\n            local hourlyXP = s.hourlyXP or 0\n            \n            c4 = string.format(\"Leveling in: %s (%s%s XP/Hour)\", s.timeToLevelText or \"\", hourlyXP > 10000 and round(hourlyXP / 1000, 1) or FormatLargeNumber(hourlyXP), hourlyXP > 10000 and \"K\" or \"\")\n        end\n        \n        if cfg[\"questrested-text\"] then\n            c5 = string.format(\"Completed: |cFFFF9700%s%%|r - Rested: |cFF4F90FF%s%%|r\", round(s.percentcomplete or 0, 1), round(s.percentrested or 0, 1))\n        end\n    end\n    \n    if cfg[\"leveltime-text\"] then\n        if isMaxLevel then\n            c6 = \"Time played: \" .. (s.totalTimeText or \"\")\n        else\n            c6 = \"Time this level: \" .. (s.levelTimeText or \"\")\n        end\n    end\n    \n    if cfg[\"sessiontime-text\"] then\n        c7 = \"Time this session: \" .. (s.sessionTimeText or \"\")\n    end\n    \n    aura_env.customTexts = {\n        c1 = c1,\n        c2 = c2,\n        c3 = c3,\n        c4 = c4,\n        c5 = c5,\n        c6 = c6,\n        c7 = c7,\n    }\nend",
					["do_custom"] = true,
				},
			},
			["desc"] = "Created by Luxthos & Daemoos\nwww.twitch.tv/luxthos",
			["zoom"] = 0,
			["semver"] = "3.1.0",
			["config"] = {
				["leveltime-text"] = true,
				["hide_xpbar"] = true,
				["showxphour-text"] = true,
				["questrested-text"] = true,
				["sessiontime-text"] = true,
				["showmaxlevel"] = false,
				["showincompletequest-bar"] = false,
				["reset_reload"] = false,
			},
			["sparkHidden"] = "NEVER",
			["anchorFrameType"] = "SELECTFRAME",
			["frameStrata"] = 1,
			["width"] = 455.0522766113281,
			["id"] = "Experience Bar - Luxthos",
			["auto"] = false,
			["inverse"] = false,
			["useTooltip"] = false,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["saved"] = "JrXkQ4ulU4mZpVYskNelUKicGdhT6sfLAI5es(LaKiZCtvcgLSNMspXmZl1uakR4lpOCtScGmsQGjvCjjwujGuIgP(AL2fyD5tQLLkyD9L0lquqgiiPdiNeRm1uck1cln1IlbSAb8d",
			},
			["overlays"] = {
				{
					1, -- [1]
					0.5921568627451, -- [2]
					0, -- [3]
					1, -- [4]
				}, -- [1]
				{
					1, -- [1]
					0.82352941176471, -- [2]
					0.30980392156863, -- [3]
					1, -- [4]
				}, -- [2]
				{
					0.30980392156863, -- [1]
					0.56470588235294, -- [2]
					1, -- [3]
					0.54487144947052, -- [4]
				}, -- [3]
			},
		},
		["Clearcasting"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["parent"] = "WotLK Mage Pack (Tri-Spec) by Esquire",
			["preferToUpdate"] = false,
			["textureWrapMode"] = "CLAMP",
			["yOffset"] = -37.163269042969,
			["anchorPoint"] = "CENTER",
			["desaturateBackground"] = false,
			["wagoID"] = "6zWQm2OA8",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.6789528131485, -- [4]
			},
			["sameTexture"] = false,
			["url"] = "https://wago.io/6zWQm2OA8/1",
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["auranames"] = {
							"Clearcasting", -- [1]
						},
						["ownOnly"] = true,
						["event"] = "Health",
						["unit"] = "player",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["combineMode"] = "showHighest",
						["subeventPrefix"] = "SPELL",
						["useName"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 70,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura6",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "bounceDecay",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["foregroundColor"] = {
				0.98039215686274, -- [1]
				0.98039215686274, -- [2]
				0.98039215686274, -- [3]
				0.72168761491776, -- [4]
			},
			["xOffset"] = -6.103515625e-05,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["version"] = 1,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 250,
			["rotate"] = false,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["selfPoint"] = "CENTER",
			["useAdjustededMax"] = false,
			["fontSize"] = 12,
			["source"] = "import",
			["foregroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["authorOptions"] = {
			},
			["backgroundColor"] = {
				0.2156862745098, -- [1]
				0.2156862745098, -- [2]
				0.2156862745098, -- [3]
				1, -- [4]
			},
			["mirror"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "texture",
			["rotation"] = 0,
			["blendMode"] = "ADD",
			["crop_y"] = 0.41,
			["startAngle"] = 0,
			["slantMode"] = "INSIDE",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["value"] = "11",
						["variable"] = "expirationTime",
					},
					["changes"] = {
						{
							["value"] = 0.75,
							["property"] = "alpha",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["value"] = "7",
						["variable"] = "expirationTime",
					},
					["changes"] = {
						{
							["value"] = 0.5,
							["property"] = "alpha",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["value"] = "3",
						["variable"] = "expirationTime",
					},
					["changes"] = {
						{
							["value"] = 0.25,
							["property"] = "alpha",
						}, -- [1]
					},
				}, -- [3]
			},
			["texture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["smoothProgress"] = true,
			["alpha"] = 1,
			["semver"] = "1.0.0",
			["compress"] = false,
			["id"] = "Clearcasting",
			["uid"] = "bK3rZGZYUUF",
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
			["tocversion"] = 30400,
			["config"] = {
			},
			["inverse"] = false,
			["width"] = 500,
			["orientation"] = "VERTICAL",
			["crop_x"] = 0.41,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["backgroundOffset"] = 10,
		},
		["Missile Barrage"] = {
			["wagoID"] = "6zWQm2OA8",
			["parent"] = "WotLK Mage Pack (Tri-Spec) by Esquire",
			["preferToUpdate"] = false,
			["yOffset"] = -47.10006103515627,
			["anchorPoint"] = "CENTER",
			["url"] = "https://wago.io/6zWQm2OA8/1",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["auranames"] = {
							"Missile Barrage", -- [1]
						},
						["event"] = "Health",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["useName"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 70,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["version"] = 1,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 385,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura2",
			["alpha"] = 0.6,
			["xOffset"] = -4.822290039062409,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "Missile Barrage",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["width"] = 351,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["uid"] = "Fpb37AtqcOM",
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["color"] = {
				0.9921568627451, -- [1]
				0.49803921568627, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Hot Streak Right"] = {
			["wagoID"] = "6zWQm2OA8",
			["parent"] = "WotLK Mage Pack (Tri-Spec) by Esquire",
			["preferToUpdate"] = false,
			["yOffset"] = -40.649291992188,
			["anchorPoint"] = "CENTER",
			["url"] = "https://wago.io/6zWQm2OA8/1",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["auranames"] = {
							"Hot Streak", -- [1]
						},
						["event"] = "Health",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["useName"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 70,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["version"] = 1,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 382,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = true,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Hot_Streak.blp",
			["alpha"] = 0.55,
			["xOffset"] = 134.00006103516,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "Hot Streak Right",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["width"] = 200,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["uid"] = "d(sAKFfLnYK",
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
	},
	["features"] = {
	},
	["login_squelch_time"] = 10,
	["lastArchiveClear"] = 1709397268,
	["minimap"] = {
		["hide"] = false,
	},
	["lastUpgrade"] = 1709397273,
	["dbVersion"] = 70,
	["migrationCutoff"] = 730,
	["registered"] = {
	},
	["editor_font_size"] = 12,
	["historyCutoff"] = 730,
	["editor_theme"] = "Monokai",
}
