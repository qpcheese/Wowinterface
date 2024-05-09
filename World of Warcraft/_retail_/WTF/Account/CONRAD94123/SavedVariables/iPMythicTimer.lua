
IPMTDB = {
}
IPMTOptions = {
	["MDTversion"] = "4.4.0.5",
	["direction"] = 1,
	["global"] = {
		["minimap"] = {
			["minimapPos"] = 163.3008439788339,
		},
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
		["boss"] = false,
		["killed"] = {
		},
	},
	["bossesKilled"] = 4,
	["checkmobs"] = {
	},
	["time"] = 1192,
	["prognosis"] = {
		["0000551179_198933"] = 0,
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
		["Tricksteriva-Turalyon"] = {
			["damage"] = 36841,
			["spellId"] = 371070,
			["enemy"] = "Tricksteriva-Turalyon",
		},
		["Xorok-Nemesis"] = {
			["damage"] = 2326,
			["spellId"] = 425180,
			["enemy"] = "Xorok-Nemesis",
		},
		["Qutlaw"] = {
			["damage"] = 146713,
			["spellId"] = 414483,
			["enemy"] = "Iridikron",
		},
		["Clappuccino-Hyjal"] = {
			["damage"] = 131250,
			["spellId"] = 414483,
			["enemy"] = "Iridikron",
		},
		["Ernot-Kazzak"] = {
			["damage"] = 139887,
			["spellId"] = 414483,
			["enemy"] = "Iridikron",
		},
	},
	["trash"] = {
		["total"] = 300,
		["grabbed"] = 0,
		["current"] = 305,
		["killed"] = 0,
	},
	["id"] = 0,
	["keyMapId"] = 463,
	["keyActive"] = false,
	["deathes"] = {
		["list"] = {
			{
				["spell"] = {
					["id"] = 413107,
					["icon"] = 796637,
				},
				["time"] = 122,
				["playerName"] = "Qutlaw",
				["class"] = "ROGUE",
				["damage"] = 885155,
				["enemy"] = "Chronikar",
			}, -- [1]
		},
	},
	["artwork"] = 5221768,
	["bosses"] = {
		{
			["killed"] = true,
			["name"] = "Chronikar",
			["encounterID"] = 2666,
		}, -- [1]
		{
			["killed"] = true,
			["name"] = "Manifested Timeways",
			["encounterID"] = 2667,
		}, -- [2]
		{
			["killed"] = true,
			["name"] = "Blight of Galakrond",
			["encounterID"] = 2668,
		}, -- [3]
		{
			["killed"] = true,
			["name"] = "Iridikron the Stonescaled",
			["encounterID"] = 2669,
		}, -- [4]
	},
	["isTeeming"] = false,
	["affixes"] = {
		{
			["id"] = 6,
			["text"] = "Non-boss enemies enrage at 30% health remaining, temporarily granting immunity to crowd control effects.",
			["name"] = "Raging",
		}, -- [1]
		{
			["id"] = 124,
			["text"] = "While in combat, enemies periodically summon damaging whirlwinds.",
			["name"] = "Storming",
		}, -- [2]
		{
			["id"] = 9,
			["text"] = "Bosses have 30% more health. Bosses and their minions inflict up to 15% increased damage.",
			["name"] = "Tyrannical",
		}, -- [3]
	},
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
