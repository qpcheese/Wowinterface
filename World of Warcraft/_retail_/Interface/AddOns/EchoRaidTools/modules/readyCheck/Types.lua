local _AddonName, _EchoRaidTools = ...
local _ReadyCheck = _EchoRaidTools:GetModule("readyCheck")

_ReadyCheck.types = _ReadyCheck.types or {}
local types = _ReadyCheck.types

types.phials = {
    [371354] = {tier = {[113] = 1, [130] = 2, [150] = 3}, tier2 = {}, tier3 = {}}, --Phial of the Eye in the Storm
    [370652] = {tier = {[471] = 1, [512] = 2, [623] = 3}, tier2 = {}, tier3 = {}}, --Phial of Static Empowerment
    [371172] = {tier = {[631] = 1, [688] = 2, [745] = 3}, tier2 = {}, tier3 = {}}, --Phial of Tepid Versatility
    [371204] = {tier = {[10450] = 1, [12181] = 2, [14195] = 3}, tier2 = {}, tier3 = {}}, --Phial of Still Air
    [371036] = {tier = {[-4] = 1, [-5] = 2, [-6] = 3}, tier2 = {}, tier3 = {}}, --Phial of Icy Preservation
    [374000] = {tier = {}, tier2 = {[947] = 1, [1032] = 2, [1118] = 3}, tier3 = {}}, --Iced Phial of Corrupting Rage
    [371386] = {tier = {[452] = 1, [520] = 2, [598] = 3}, tier2 = {}, tier3 = {}}, --Phial of Charged Isolation
    [373257] = {tier = {}, tier2 = {}, tier3 = {[7799] = 1, [9091] = 2, [10595] = 3}}, --Phial of Glacial Fury
    --[393700] = {tier = {[45] = 3, [38] = 2, [32] = 1}}, --Aerated Phial of Deftness
    --[393717] = {tier = {[45] = 3, [38] = 2, [32] = 1}}, --Steaming Phial of Finesse
    --[371186] = {tier = {[558] = 3, [473] = 1, [515] = 2}}, --Charged Phial of Alacrity
    --[393714] = {tier = {[45] = 3, [38] = 2, [32] = 1}}, --Crystalline Phial of Perception
    [371339] = {tier = {[552] = 1, [602] = 2, [652] = 3}, tier2 = {}, tier3 = {}}, --Phial of Elemental Chaos

    --test
    --[139] = {tier = {[3021] = 3, [602] = 1, [652] = 2}},
}

types.raidBuffs = {
    [6673] = "AttackPower", -- Battle Shout
    [1459] = "Intellect", -- Arcane Intellect
    [21562] = "Stamina",  -- Power Word: Fortitude
    [1126] = "Versatility", -- Mark of the Wild
    [381748] = "Movement",  -- Blessing of the Bronze
    [381758]="Movement",[381732]="Movement",[381741]="Movement",[381746]="Movement",[381750]="Movement",[381756]="Movement",
    [381749]="Movement",[381751]="Movement",[381752]="Movement",[381753]="Movement",[381754]="Movement",[381757]="Movement",
}

types.vantus = {
    --VOTI
    [384203] = {name = "Era", tier = 3},
    [384201] = {name = "Era", tier = 2},
    [384192] = {name = "Era", tier = 1},

    [384208] = {name = "Ter", tier = 3},
    [384209] = {name = "Ter", tier = 2},
    [384210] = {name = "Ter", tier = 1},

    [384216] = {name = "TPC", tier = 3},
    [384215] = {name = "TPC", tier = 2},
    [384214] = {name = "TPC", tier = 1},

    [384222] = {name = "Sen", tier = 3},
    [384221] = {name = "Sen", tier = 2},
    [384220] = {name = "Sen", tier = 1},

    [384241] = {name = "Kur", tier = 3},
    [384240] = {name = "Kur", tier = 2},
    [384239] = {name = "Kur", tier = 1},

    [384227] = {name = "Dath", tier = 3},
    [384228] = {name = "Dath", tier = 2},
    [384229] = {name = "Dath", tier = 1},

    [384235] = {name = "BKD", tier = 3},
    [384234] = {name = "BKD", tier = 2},
    [384233] = {name = "BKD", tier = 1},

    [384247] = {name = "Rasz", tier = 3},
    [384246] = {name = "Rasz", tier = 2},
    [384245] = {name = "Rasz", tier = 1},
    --Aberrus
    [411513] = {name = "Kaz", tier = 3},
    [411507] = {name = "Kaz", tier = 2},
    [411469] = {name = "Kaz", tier = 1},
    [409619] = {name = "Kaz", tier = 1},

    [411515] = {name = "Amal", tier = 3},
    [411514] = {name = "Amal", tier = 2},
    [409622] = {name = "Amal", tier = 1},

    [411517] = {name = "Exp", tier = 3},
    [411516] = {name = "Exp", tier = 2},
    [409624] = {name = "Exp", tier = 1},

    [411526] = {name = "Zaq", tier = 3},
    [411523] = {name = "Zaq", tier = 2},
    [409626] = {name = "Zaq", tier = 1},

    [411528] = {name = "Rash", tier = 3},
    [411527] = {name = "Rash", tier = 2},
    [409627] = {name = "Rash", tier = 1},

    [411532] = {name = "Zsk", tier = 3},
    [511530] = {name = "Zsk", tier = 2},
    [409638] = {name = "Zsk", tier = 1},

    [411535] = {name = "Mag", tier = 3},
    [411534] = {name = "Mag", tier = 2},
    [409640] = {name = "Mag", tier = 1},

    [411537] = {name = "Nel", tier = 3},
    [411536] = {name = "Nel", tier = 2},
    [409618] = {name = "Nel", tier = 1},

    [411539] = {name = "Sark", tier = 3},
    [411538] = {name = "Sark", tier = 2},
    [409644] = {name = "Sark", tier = 1},
    --Amirdrassil
    [425943] = {name = "Gna", tier = 3},
    [425934] = {name = "Gna", tier = 2},
    [425905] = {name = "Gna", tier = 1},

    [425944] = {name = "Igi", tier = 3},
    [425935] = {name = "Igi", tier = 2},
    [425906] = {name = "Igi", tier = 1},

    [425945] = {name = "Vol", tier = 3},
    [425936] = {name = "Vol", tier = 2},
    [425907] = {name = "Vol", tier = 1},

    [425946] = {name = "CoD", tier = 3},
    [425937] = {name = "CoD", tier = 2},
    [425908] = {name = "CoD", tier = 1},

    [425947] = {name = "Lar", tier = 3},
    [425938] = {name = "Lar", tier = 2},
    [425909] = {name = "Lar", tier = 1},

    --[] = {name = "Nym", tier = 3}, NYI?!
    [425939] = {name = "Nym", tier = 2},
    [425910] = {name = "Nym", tier = 1},

    [425951] = {name = "Smo", tier = 3},
    [425940] = {name = "Smo", tier = 2},
    [425911] = {name = "Smo", tier = 1},

    [425948] = {name = "Tin", tier = 3},
    [425941] = {name = "Tin", tier = 2},
    [425912] = {name = "Tin", tier = 1},

    [425949] = {name = "Fyr", tier = 3},
    [425942] = {name = "Fyr", tier = 2},
    [425913] = {name = "Fyr", tier = 1},
}

types.augmentRune = {
    [393438] = "Draconic Augment Rune",
}

types.Soulstone = {
    [20707] = "Soulstone",
}

types.BloodlustDebuffs = {
    [57723] = true,
    [57724] = true,
    [80354] = true,
    [264689] = true,
    [390435] = true,
 }

 types.WeaponEnchants = {
    [5401] = {spell=33757}, -- Windfury
    [5400] = {spell=318038}, -- Flametongue
    [6498] = {spell=382021}, -- Earthliving

    [6512] = {tier = 1, item=194823},
    [6513] = {tier = 2, item=194823},
    [6514] = {tier = 3, item=194823},

    [6515] = {tier = 1, item=194826},
    [6694] = {tier = 2, item=194826},
    [6695] = {tier = 3, item=194826},

    [6516] = {tier = 1, item=194820},
    [6517] = {tier = 2, item=194820},
    [6518] = {tier = 3, item=194820},

    [6529] = {tier = 1, item=198162},
    [6530] = {tier = 2, item=198162},
    [6531] = {tier = 3, item=198162},

    [6379] = {tier = 1, item=191940},
    [6380] = {tier = 2, item=191940},
    [6381] = {tier = 3, item=191940},

    [6696] = {tier = 1, item=191945},
    [6697] = {tier = 2, item=191945},
    [6698] = {tier = 3, item=191945},

    [6838] = {tier = 1, item=204971}, --Hissing Rune
    [6837] = {tier = 2, item=204971}, --Hissing Rune
    [6839] = {tier = 3, item=204971}, --Hissing Rune
 }

types.WellFed = GetSpellInfo(396092)
types.Eating = {
    [GetSpellInfo(354761)] = 134062,
    [GetSpellInfo(170906)] = 134062,
}

_ReadyCheck.IsRelevantSpellID = function(spellID)
    return types.phials[spellID] or types.raidBuffs[spellID] or types.vantus[spellID] or types.augmentRune[spellID] or types.Soulstone
end

types.blizzGoldColor = CreateColor(1, 0.82, 0, 1)