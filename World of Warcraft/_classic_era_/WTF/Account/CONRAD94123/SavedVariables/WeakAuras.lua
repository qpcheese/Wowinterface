
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
			["frameStrata"] = 1,
			["xOffset"] = -1.7141723632813,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "Brain Freeze Deez",
			["selfPoint"] = "CENTER",
			["alpha"] = 0.5,
			["anchorFrameType"] = "SCREEN",
			["width"] = 369,
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
			["zoom"] = 0,
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
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.0",
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
			["auto"] = true,
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
			["frameStrata"] = 1,
			["xOffset"] = -134.00006103516,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "Hot Streak Left",
			["selfPoint"] = "CENTER",
			["alpha"] = 0.55,
			["anchorFrameType"] = "SCREEN",
			["width"] = 200,
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
			["sparkHeight"] = 30,
			["selfPoint"] = "BOTTOM",
			["text"] = false,
			["barColor"] = {
				0.1803921610116959, -- [1]
				0.3411764800548554, -- [2]
				0.9921569228172302, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["height"] = 20.9111442565918,
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
					["text_text_format_p_time_legacy_floor"] = false,
					["text_selfPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["anchorYOffset"] = 0,
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
					["text_fontType"] = "None",
					["text_anchorPoint"] = "CENTER",
					["text_visible"] = true,
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 17,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [4]
			},
			["gradientOrientation"] = "HORIZONTAL",
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
			["anchorFrameParent"] = false,
			["texture"] = "ToxiUI Tx Left",
			["id"] = "Manabar",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["spark"] = false,
			["tocversion"] = 100205,
			["sparkHidden"] = "NEVER",
			["zoom"] = 0,
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
			["frameStrata"] = 1,
			["xOffset"] = -133.99993896484,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "FoF Left",
			["selfPoint"] = "CENTER",
			["alpha"] = 0.4,
			["anchorFrameType"] = "SCREEN",
			["width"] = 200,
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
			["frameStrata"] = 1,
			["xOffset"] = 134,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "FoF Right",
			["selfPoint"] = "CENTER",
			["alpha"] = 0.4,
			["anchorFrameType"] = "SCREEN",
			["width"] = 200,
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
		[" xp"] = {
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["xOffset"] = 0.9483362833658853,
			["yOffset"] = -414.3409233093262,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["icon"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Experience",
						["unit"] = "player",
						["spellIds"] = {
						},
						["names"] = {
						},
						["use_unit"] = true,
						["use_currentXP"] = false,
						["subeventPrefix"] = "SPELL",
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
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0.4509804248809815, -- [1]
				0, -- [2]
				0.8156863451004028, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%1.percentXP%%",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["anchorXOffset"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_text_format_1.percentXP_format"] = "Number",
					["text_text_format_p_time_format"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_wordWrap"] = "WordWrap",
					["text_shadowYOffset"] = -1,
					["text_fontType"] = "None",
					["text_text_format_1.percentXP_decimal_precision"] = 1,
					["text_visible"] = true,
					["text_anchorPoint"] = "CENTER",
					["type"] = "subtext",
					["text_text_format_p_time_precision"] = 1,
					["text_fontSize"] = 12,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_legacy_floor"] = false,
				}, -- [3]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%1.percentrested%%",
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
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = -1,
					["text_fontType"] = "None",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_fontSize"] = 12,
					["text_text_format_1.percentrested_decimal_precision"] = 1,
					["text_text_format_1.percentrested_format"] = "Number",
					["anchorXOffset"] = 0,
					["text_text_format_n_format"] = "none",
				}, -- [4]
			},
			["height"] = 18.62219047546387,
			["config"] = {
			},
			["load"] = {
				["talent"] = {
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
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["authorOptions"] = {
			},
			["information"] = {
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
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["gradientOrientation"] = "HORIZONTAL",
			["smoothProgress"] = true,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["internalVersion"] = 70,
			["icon_side"] = "RIGHT",
			["uid"] = "Zet6D6f9eWp",
			["sparkHeight"] = 30,
			["texture"] = "Blank",
			["width"] = 456.0009460449219,
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["spark"] = false,
			["alpha"] = 1,
			["id"] = " xp",
			["sparkHidden"] = "NEVER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["sparkOffsetX"] = 0,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
		},
		["Dorovon Cast Bar"] = {
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["wagoID"] = "u6uoy2SpQ",
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
			["preferToUpdate"] = false,
			["customText"] = "function()\n    if not aura_env.channel_end or not aura_env.channel_duration then\n        return \"\"\n    end\n    return format(\"%.2f/%.2f\", aura_env.channel_end-GetTime(), aura_env.channel_duration)\nend",
			["yOffset"] = -242.2371006011963,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "https://wago.io/u6uoy2SpQ/22",
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
			["internalVersion"] = 70,
			["zoom"] = 0,
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
			["customTextUpdate"] = "event",
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
			["backgroundColor"] = {
				0.21176470588235, -- [1]
				0.60392156862745, -- [2]
				0.68627450980392, -- [3]
				0.4999994635582, -- [4]
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
					["tick_placement_mode"] = "AtValue",
					["tick_yOffset"] = 0,
					["tick_visible"] = true,
					["tick_placement"] = "0.5",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_mirror"] = false,
					["tick_color"] = {
						1, -- [1]
						0.3921568627451, -- [2]
						0.19607843137255, -- [3]
						1, -- [4]
					},
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
			["gradientOrientation"] = "HORIZONTAL",
			["enableGradient"] = false,
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
			["selfPoint"] = "CENTER",
			["source"] = "import",
			["uid"] = "x)gzubypn4F",
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
			["icon"] = true,
			["anchorFrameType"] = "SCREEN",
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["alpha"] = 1,
			["height"] = 25.86667251586914,
			["icon_side"] = "LEFT",
			["id"] = "Dorovon Cast Bar",
			["sparkHeight"] = 30,
			["texture"] = "Solid",
			["spark"] = false,
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = true,
			["tocversion"] = 100205,
			["sparkHidden"] = "NEVER",
			["semver"] = "1.0.21",
			["frameStrata"] = 1,
			["width"] = 456.830078125,
			["xOffset"] = 0.8152643839518229,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = true,
			["version"] = 22,
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
			["sparkOffsetX"] = 0,
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
			["frameStrata"] = 1,
			["xOffset"] = 134.00006103516,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "Hot Streak Right",
			["selfPoint"] = "CENTER",
			["alpha"] = 0.55,
			["anchorFrameType"] = "SCREEN",
			["width"] = 200,
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
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["config"] = {
			},
			["borderInset"] = 1,
			["uid"] = "0GhM8tZS5Fj",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["selfPoint"] = "CENTER",
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
			["frameStrata"] = 1,
			["xOffset"] = -4.822290039062409,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "Missile Barrage",
			["selfPoint"] = "CENTER",
			["alpha"] = 0.6,
			["anchorFrameType"] = "SCREEN",
			["width"] = 351,
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
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["internalVersion"] = 70,
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
			["authorOptions"] = {
			},
			["cooldownEdge"] = false,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["zoom"] = 0,
			["semver"] = "1.0.0",
			["tocversion"] = 30400,
			["id"] = "Deep Freeze",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 1,
			["width"] = 64,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["uid"] = "F(0w6q50z4A",
			["inverse"] = false,
			["xOffset"] = 202.59527587891,
			["displayIcon"] = "236214",
			["information"] = {
				["forceEvents"] = true,
			},
			["selfPoint"] = "CENTER",
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
