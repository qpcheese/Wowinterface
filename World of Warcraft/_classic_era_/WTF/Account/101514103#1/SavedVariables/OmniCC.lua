
OmniCCDB = {
	["profileKeys"] = {
		["Nicorobin - Living Flame"] = "Default",
	},
	["global"] = {
		["dbVersion"] = 6,
		["addonVersion"] = "10.2.5",
	},
	["profiles"] = {
		["Default"] = {
			["rules"] = {
				{
					["id"] = "auras",
					["patterns"] = {
						"Aura", -- [1]
						"Buff", -- [2]
						"Debuff", -- [3]
					},
					["name"] = "Auras",
					["enabled"] = false,
				}, -- [1]
				{
					["id"] = "plates",
					["patterns"] = {
						"Plate", -- [1]
					},
					["name"] = "Unit Nameplates",
					["enabled"] = false,
				}, -- [2]
				{
					["id"] = "actions",
					["patterns"] = {
						"ActionButton", -- [1]
						"MultiBar", -- [2]
					},
					["name"] = "Action Bars",
					["enabled"] = false,
				}, -- [3]
				{
					["patterns"] = {
						"PlaterMainAuraIcon", -- [1]
						"PlaterSecondaryAuraIcon", -- [2]
						"ExtraIconRowIcon", -- [3]
					},
					["id"] = "Plater Nameplates Rule",
					["priority"] = 4,
					["theme"] = "Plater Nameplates Theme",
				}, -- [4]
			},
			["themes"] = {
				["Default"] = {
					["textStyles"] = {
						["soon"] = {
						},
						["seconds"] = {
						},
						["minutes"] = {
						},
					},
				},
				["Plater Nameplates Theme"] = {
					["textStyles"] = {
						["soon"] = {
						},
						["seconds"] = {
						},
						["minutes"] = {
						},
					},
				},
			},
		},
	},
}
OmniCC4Config = nil
