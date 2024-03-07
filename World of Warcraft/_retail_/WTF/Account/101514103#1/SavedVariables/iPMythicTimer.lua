
IPMTDB = {
}
IPMTOptions = {
	["MDTversion"] = "4.3.4.6",
	["direction"] = 1,
	["global"] = {
	},
	["scale"] = 54,
	["progress"] = 1,
	["version"] = 1320,
	["position"] = {
		["deaths"] = {
			["y"] = -50,
			["x"] = 0,
			["point"] = "CENTER",
		},
		["main"] = {
			["y"] = 95,
			["x"] = -9,
			["point"] = "RIGHT",
		},
		["options"] = {
			["y"] = -72,
			["x"] = 314,
			["point"] = "TOPLEFT",
		},
	},
	["limitProgress"] = true,
	["timerDir"] = 1,
	["theme"] = 2,
	["keysName"] = {
	},
}
IPMTDungeon = {
	["combat"] = {
		["killed"] = {
		},
		["boss"] = false,
	},
	["bossesKilled"] = 4,
	["checkmobs"] = {
	},
	["time"] = 956,
	["prognosis"] = {
		["000042D9B8_198933"] = 0,
	},
	["timeLimit"] = {
		{
			1632, -- [1]
			1224, -- [2]
			[0] = 2040,
		}, -- [1]
		{
			1632, -- [1]
			2040, -- [2]
			[0] = 1224,
		}, -- [2]
	},
	["level"] = 18,
	["players"] = {
		["Qpfromage"] = {
			["enemy"] = "Qpfromage",
			["spellId"] = 371070,
			["damage"] = 20332,
		},
		["Youdamonk-Drak'thul"] = {
			["enemy"] = "Iridikron",
			["spellId"] = 414483,
			["damage"] = 142614,
		},
		["Dwizzy-Silvermoon"] = {
			["spellId"] = 32409,
			["damage"] = 5261,
		},
		["Hopcaa-BurningBlade"] = {
			["enemy"] = "Hopcaa-BurningBlade",
			["spellId"] = 425461,
			["damage"] = 1059,
		},
		["Creepypal-Drak'thul"] = {
			["enemy"] = "Creepypal-Drak'thul",
			["spellId"] = 425180,
			["damage"] = 10780,
		},
	},
	["trash"] = {
		["grabbed"] = 0,
		["total"] = 300,
		["current"] = 323,
		["killed"] = 0,
	},
	["id"] = 0,
	["keyMapId"] = 463,
	["keyActive"] = false,
	["deathes"] = {
	},
	["artwork"] = 5221768,
	["bosses"] = {
		{
			["encounterID"] = 2666,
			["name"] = "Chronikar",
			["killed"] = true,
		}, -- [1]
		{
			["encounterID"] = 2667,
			["name"] = "Manifested Timeways",
			["killed"] = true,
		}, -- [2]
		{
			["encounterID"] = 2668,
			["name"] = "Blight of Galakrond",
			["killed"] = true,
		}, -- [3]
		{
			["encounterID"] = 2669,
			["name"] = "Iridikron the Stonescaled",
			["killed"] = true,
		}, -- [4]
	},
	["affixes"] = {
		{
			["id"] = 11,
			["text"] = "When slain, non-boss enemies explode, causing all players to suffer damage over 4 sec. This effect stacks.",
			["name"] = "Bursting",
		}, -- [1]
		{
			["id"] = 134,
			["text"] = "While in combat, entangling vines periodically appear and snare players.",
			["name"] = "Entangling",
		}, -- [2]
		{
			["id"] = 9,
			["text"] = "Bosses have 30% more health. Bosses and their minions inflict up to 15% increased damage.",
			["name"] = "Tyrannical",
		}, -- [3]
	},
	["isTeeming"] = false,
}
IPMTTheme = {
	{
		["decors"] = {
		},
		["deaths"] = {
			["font"] = "Interface\\AddOns\\iPMythicTimer\\media\\RobotoCondensed-Regular.ttf",
			["captionFontSize"] = 20,
			["fontStyle"] = "",
			["recordFontSize"] = 14,
			["headerFontSize"] = 16,
		},
		["name"] = "Default",
		["main"] = {
			["background"] = {
				["texSize"] = {
					["w"] = 0,
					["h"] = 0,
				},
				["color"] = {
					["a"] = 0.4,
					["r"] = 0,
					["g"] = 0,
					["b"] = 0,
				},
				["coords"] = {
					0, -- [1]
					1, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["inset"] = 0,
				["texture"] = "Interface\\Buttons\\WHITE8X8",
			},
			["border"] = {
				["color"] = {
					["a"] = 1,
					["r"] = 1,
					["g"] = 1,
					["b"] = 1,
				},
				["texture"] = "none",
				["size"] = 8,
			},
			["size"] = {
				["w"] = 180.0000152587891,
				["h"] = 79.99995422363281,
			},
		},
		["fontStyle"] = "",
		["elements"] = {
			["plusLevel"] = {
				["fontSize"] = 13,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = -16,
					["x"] = 30,
					["point"] = "LEFT",
					["rPoint"] = "TOPLEFT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 20,
					["h"] = 20,
				},
			},
			["affixes"] = {
				["iconSize"] = 22,
				["size"] = {
					["w"] = 90,
					["h"] = 30,
				},
				["hidden"] = false,
				["position"] = {
					["y"] = 0,
					["x"] = -2,
					["point"] = "TOPRIGHT",
					["rPoint"] = "TOPRIGHT",
				},
			},
			["progress"] = {
				["fontSize"] = 22,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = 14,
					["x"] = 6,
					["point"] = "LEFT",
					["rPoint"] = "BOTTOMLEFT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 90,
					["h"] = 30,
				},
			},
			["plusTimer"] = {
				["fontSize"] = 12,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = 0,
					["x"] = 50,
					["point"] = "LEFT",
					["rPoint"] = "LEFT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 50,
					["h"] = 18,
				},
			},
			["deathTimer"] = {
				["fontSize"] = 12,
				["justifyH"] = "RIGHT",
				["position"] = {
					["y"] = 0,
					["x"] = -6,
					["point"] = "RIGHT",
					["rPoint"] = "RIGHT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.6,
					["g"] = 0.2,
					["b"] = 0.2,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 60,
					["h"] = 18,
				},
			},
			["prognosis"] = {
				["fontSize"] = 15,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = 14,
					["x"] = 16,
					["point"] = "CENTER",
					["rPoint"] = "BOTTOM",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 60,
					["h"] = 20,
				},
			},
			["dungeonname"] = {
				["fontSize"] = 13,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = 4,
					["x"] = 0,
					["point"] = "BOTTOMLEFT",
					["rPoint"] = "TOPLEFT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["justifyV"] = "BOTTOM",
				["hidden"] = false,
				["size"] = {
					["w"] = 180,
					["h"] = 100,
				},
			},
			["level"] = {
				["fontSize"] = 20,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = -16,
					["x"] = 6,
					["point"] = "LEFT",
					["rPoint"] = "TOPLEFT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 20,
					["h"] = 20,
				},
			},
			["timer"] = {
				["fontSize"] = 12,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = 0,
					["x"] = 6,
					["point"] = "LEFT",
					["rPoint"] = "LEFT",
				},
				["color"] = {
					{
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 0,
					}, -- [1]
					{
						["a"] = 1,
						["r"] = 0,
						["g"] = 1,
						["b"] = 0,
					}, -- [2]
					[0] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
					[-1] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0,
						["b"] = 0,
					},
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 50,
					["h"] = 18,
				},
			},
			["bosses"] = {
				["fontSize"] = 22,
				["justifyH"] = "RIGHT",
				["position"] = {
					["y"] = 14,
					["x"] = -6,
					["point"] = "RIGHT",
					["rPoint"] = "BOTTOMRIGHT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 50,
					["h"] = 30,
				},
			},
		},
		["font"] = "Interface\\AddOns\\iPMythicTimer\\media\\RobotoCondensed-Regular.ttf",
	}, -- [1]
	{
		["decors"] = {
		},
		["deaths"] = {
			["font"] = "Interface\\AddOns\\iPMythicTimer\\media\\RobotoCondensed-Regular.ttf",
			["captionFontSize"] = 20,
			["fontStyle"] = "",
			["recordFontSize"] = 14,
			["headerFontSize"] = 16,
		},
		["name"] = "Default (Copy)",
		["main"] = {
			["background"] = {
				["texSize"] = {
					["w"] = 0,
					["h"] = 0,
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0,
					["g"] = 0,
					["b"] = 0,
				},
				["coords"] = {
					0, -- [1]
					1, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["inset"] = 0,
				["texture"] = "Interface\\DialogFrame\\UI-DialogBox-Gold-Background",
			},
			["border"] = {
				["color"] = {
					["a"] = 1,
					["r"] = 1,
					["g"] = 0.6745098233222961,
					["b"] = 0.2980392277240753,
				},
				["texture"] = "Interface\\Buttons\\WHITE8X8",
				["size"] = 1,
			},
			["size"] = {
				["w"] = 180,
				["h"] = 80,
			},
		},
		["fontStyle"] = "OUTLINE",
		["elements"] = {
			["plusLevel"] = {
				["fontSize"] = 13,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = -16,
					["x"] = 30,
					["point"] = "LEFT",
					["rPoint"] = "TOPLEFT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 20,
					["h"] = 20,
				},
			},
			["affixes"] = {
				["iconSize"] = 22,
				["size"] = {
					["w"] = 90,
					["h"] = 30,
				},
				["hidden"] = false,
				["position"] = {
					["y"] = 0,
					["x"] = -2,
					["point"] = "TOPRIGHT",
					["rPoint"] = "TOPRIGHT",
				},
			},
			["progress"] = {
				["fontSize"] = 22,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = 14,
					["x"] = 6,
					["point"] = "LEFT",
					["rPoint"] = "BOTTOMLEFT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 90,
					["h"] = 30,
				},
			},
			["plusTimer"] = {
				["fontSize"] = 12,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = 0,
					["x"] = 50,
					["point"] = "LEFT",
					["rPoint"] = "LEFT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 50,
					["h"] = 18,
				},
			},
			["deathTimer"] = {
				["fontSize"] = 12,
				["justifyH"] = "RIGHT",
				["position"] = {
					["y"] = 0,
					["x"] = -6,
					["point"] = "RIGHT",
					["rPoint"] = "RIGHT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.6,
					["g"] = 0.2,
					["b"] = 0.2,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 60,
					["h"] = 18,
				},
			},
			["prognosis"] = {
				["fontSize"] = 15,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = 14,
					["x"] = 16,
					["point"] = "CENTER",
					["rPoint"] = "BOTTOM",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 60,
					["h"] = 20,
				},
			},
			["dungeonname"] = {
				["fontSize"] = 13,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = 4,
					["x"] = 0,
					["point"] = "BOTTOMLEFT",
					["rPoint"] = "TOPLEFT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["justifyV"] = "BOTTOM",
				["hidden"] = false,
				["size"] = {
					["w"] = "180",
					["h"] = "100",
				},
			},
			["level"] = {
				["fontSize"] = 20,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = -16,
					["x"] = 6,
					["point"] = "LEFT",
					["rPoint"] = "TOPLEFT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 20,
					["h"] = 20,
				},
			},
			["timer"] = {
				["fontSize"] = 12,
				["justifyH"] = "LEFT",
				["position"] = {
					["y"] = 0,
					["x"] = 6,
					["point"] = "LEFT",
					["rPoint"] = "LEFT",
				},
				["color"] = {
					{
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 0,
					}, -- [1]
					{
						["a"] = 1,
						["r"] = 0,
						["g"] = 1,
						["b"] = 0,
					}, -- [2]
					[0] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
					[-1] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0,
						["b"] = 0,
					},
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 50,
					["h"] = 18,
				},
			},
			["bosses"] = {
				["fontSize"] = 22,
				["justifyH"] = "RIGHT",
				["position"] = {
					["y"] = 14,
					["x"] = -6,
					["point"] = "RIGHT",
					["rPoint"] = "BOTTOMRIGHT",
				},
				["color"] = {
					["a"] = 1,
					["r"] = 0.8,
					["g"] = 0.8,
					["b"] = 0.8,
				},
				["hidden"] = false,
				["size"] = {
					["w"] = 50,
					["h"] = 30,
				},
			},
		},
		["font"] = "Interface\\Addons\\SharedMedia_MyMedia\\font\\Bebas Neue Cyrillic Regular.ttf",
	}, -- [2]
}
